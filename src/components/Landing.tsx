import { portfolioData } from "../data/portfolioData";
import { PropsWithChildren } from "react";
import "./styles/Landing.css";

const Landing = ({ children }: PropsWithChildren) => {
  const nameParts = portfolioData.personalInfo.name.split(" ");
  const firstName = nameParts[0].toUpperCase();
  const lastName = nameParts.slice(1).join(" ").toUpperCase();

  return (
    <>
      <div className="landing-section" id="landingDiv">
        <div className="landing-container">
          <div className="landing-intro">
            <h2>Hello! I'm</h2>
            <h1>
              {firstName}
              <br />
              <span>{lastName}</span>
            </h1>
          </div>
          <div className="landing-info">
            <h3>A Full Stack</h3>
            <h2 className="landing-info-h2">
              <div className="landing-h2-1">{portfolioData.personalInfo.roles[0]}</div>
              <div className="landing-h2-2">{portfolioData.personalInfo.roles[1]}</div>
            </h2>
            <h2>
              <div className="landing-h2-info">{portfolioData.personalInfo.roles[2]}</div>
              <div className="landing-h2-info-1">{portfolioData.personalInfo.roles[0]}</div>
            </h2>
          </div>
        </div>
        {children}
      </div>
    </>
  );
};

export default Landing;
