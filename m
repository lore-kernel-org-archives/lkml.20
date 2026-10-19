Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370744C4F8;
	Mon, 19 Oct 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394000; cv=none; b=B8GAmkqBd+cEv9aBfQLWsYGpQwHNm2cNtdbUhp9HGDB0s5+q6CKWrA8ncpBE3rjCCtfvnOXxmG/K1zwTl253C68Pfs7DiGmbpZ/NMvWCBcJhFiBSzVnDeSmlhxXEDBXlOCaDEQRzzNTvMHX+8fMtC28vOWigmEfLobws6G3FvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394000; c=relaxed/simple;
	bh=AKpmxAsvYkeAH5Z7Xo6ttq5yLJLTWjMLivPGS1JGBDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No0LOiJgw7KroTCj41DEDBtMBxA2SN/gSzxkIq4SuabaUsqZoMcNagJTGrh+W6YvSMpEKdmdJCycAJHDnH4zd4NXnwIt6qsU8yVEtCFS7oCJlB0lYZDXvRl0//JyZNMeOjiTx+pM11lJ3EMAFctODVhqdS0PdIyGylP5mPBvcro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyXM5I3h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyXM5I3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786ED1F000C4;
	Mon, 19 Oct 2026 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792393999;
	bh=A/IzZtxeSyXH6wUEv+Aawu99CfdY79PltPRFXDfjJns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YyXM5I3hjvis3mOhM5+Jn1uLqF5RA4nuQ7YxhHz0DRmw2cR/nPHHOZO5jaOVnsMs4
	 /eAHovRIP4ftD4JHfD1iYWsKy2G8+aUrd5lNBYBm8WqiwngKytIyRHiLVAmSlb8aC8
	 tI0C0zMb113qfgQmvF+6snPIQO2eSH3AcSAQWFh3MKzUP54oFaiWIC0/mrl9ut6EYa
	 JmNbyJUqfdMXqtpVDRf1SvNC2HBLI2klESgvXK6+u2GMTkWFcCIIUG7uGuWv/5A51R
	 guT2XGlRh9o0bNbQM+5AKV68nclcIdf3rex3BsGYVagiVk4Surn1YGYoZSAiyiPAwj
	 LpiQJ4PQTai5A==
Date: Mon, 19 Oct 2026 09:13:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
Message-ID: <20261019-funky-real-skunk-eda6dc@quoll>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>

On Sat, Oct 17, 2026 at 11:18:48PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> > +
> > +    csiphy0: csiphy@ac9c000 {
> > +        compatible = "qcom,sa8775p-csi2-phy";
> > +        reg = <0x0ac9c000 0x2000>;
> > +
> DTS uses 2-cell reg but binding example uses 1-cell. Please align:
>   reg = <0x0 0x0ac9c000 0x0 0x2000>;

I don't understand what is supposed to be aligned here. The code is
correct.

Best regards,
Krzysztof

