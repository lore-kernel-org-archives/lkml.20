Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490533;
	b=qqEn9AOMMuHOebCSNMKDff2cCn0/mUwzHolHY95GpAZk/RUDu+vvbXqs8DegGTZhOzwA
	 ztJXpivHmy8zX1Qo0rSfs+qSPSRWk+2VKe8hdTRrn2RgJ4VAE8ZHswG4/ceup/WxYKsMd
	 RS0giN5RZU/dNOyMsgUYT7Thj4aDxVE7B4BoyGfMSHrGjUtfdjuact9SZDE5RYgrMl7VW
	 dVIcI4geRfjKF3NaZDzd9SKF/lbUKFxTmpL3srLN9tciGVQGTNX866PfawIDPsObVAnf5
	 7V705sAhtHed+2qnDLML8oCm5Au7Mz53kswpdiZCYZFN9qNRfYGqKGdoImM4ixIAR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490533;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UHPmfaVCv3XumqUh3m5IWc7lSA9GngT16E5AJZp8cdg=;
	b=zVE62Eq/nuX98ZW0Wd4BXwO/Q17snTF0ThJvTdbX9myDqDpqZYuEcIl2fPb4lMx/vyC+
	 b/xx4eV/hG5Ykn4WXJEBGlcnmH8L46QPCDRtRerzemzdm9YQ01FoOtv9NFynGvQKHKgrT
	 +SSLEIZym9Q1Gwo20qzl+P4MxX9xBDG1/GRB4iPuHwCqF350GsDqSD5cYuZM7hSpdEB+Y
	 i3dwYh+wnypew9vYyVoLTVDM6XHMda1ZB4Fm9e4jTQTZ0ByT3AyrN3fkn7qlyNMGudJ0j
	 nViUETe5Ldrg9RZgPecBEkDPeU824nz+pcErcpLL3syfFCyBz3OQuQkM8AZhUQdCNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCbnsPLT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0368606A31C;
	Thu, 12 Nov 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCbnsPLT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAFE1F00A05;
	Thu, 12 Nov 2026 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490532;
	bh=UHPmfaVCv3XumqUh3m5IWc7lSA9GngT16E5AJZp8cdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OCbnsPLTs21tyQm+Wi5ln9bf0ZNIMHMGLbXBU2OtF1+St0c2o5RNxxgxhMObKn7IX
	 nurmQIxSH0+q0B8A8VmcAUt953RccLViCbljpL6lvaBXl4d5usemBoG0AX0ZwvYf0b
	 Rynzd4j64cQV3eMc+xGUP2XlZ+j3l9mYmUke9CGpNCknOgQfzydI6JcZx/Igk7IIqi
	 VSQ+IXEu1mjAfSqHYGVnyU8UgfMwmAGh96ZRdmfG1scnIcFlRCI2TTLF8Qh5QhERBk
	 TLZIAlDM9A97oMUctjpOF1Mgf4smjwTW4dcM/59V8j7cEES8J/dnLBmuYj2Co3vwFf
	 mSK4RornEbLaw==
Date: Thu, 12 Nov 2026 19:05:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <avXAoMcmDLeNuWED@parshuram>
References: <20261021022446.3619435-1-robh@kernel.org>
 <avWbmsjkYo2LMJKs@parshuram>
 <20261112125346.GA3821108-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112125346.GA3821108-robh@kernel.org>

On 12-11-26, 06:53, Rob Herring wrote:
> +Konrad
> 
> On Thu, Nov 12, 2026 at 04:27:30PM +0530, Vinod Koul wrote:
> > On 20-10-26, 21:24, Rob Herring (Arm) wrote:
> > > For the QUSB2 PHY binding, keep the three regulator supplies required
> > > except for legacy IPQ6018 nodes that do not describe the board rails.
> > > 
> > > This relaxes the requirements for the IPQ5210 as well as if it is
> > > compatible with IPQ6018, then it shouldn't have more required
> > > properties either.
> > 
> > Hey Rob,
> > 
> > This fails for phy/next I see vdd-supply has been moved around..
> 
> The change in question[1] should not be applied until the .dts changes 
> in the series are applied. It introduces a bunch of warnings. Can the
> QCom folks stop doing that! Coordinate applying the series or take 
> the binding and dts changes in 1 tree. Given the patch series is 2+ 
> months old, I'd be surprised if the rest gets applied.

If Konrad/Bjorn want to take this all together thur QC tree they can
have my ack

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
