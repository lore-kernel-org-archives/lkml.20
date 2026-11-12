Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508205;
	b=iIZE9uDkzMmU6WDL/B7sJqOq62XImyf0PFGqx7xscA9wn9xnIvQ+O214/nQFwoda0EO/
	 xYTGUrUK4AU529Eg8quTCXWOoVyGKM05zDzF4Us2M8/Vb5ONH9wXIPojiCWv/CPbi7tQ8
	 pCg0iSNUjAOdgC/QaUpAeZkGlDSXwJ4UFuH4WuuwxnAL/xtWVQZxbmxwg1btWIKfCOhnk
	 Nf2fa3j+54kAeedYPbu9FvLbtYr8UL2wURoJ3T+yDCoKreKt71iXwfuoMWg7vwEST9UL9
	 WYumKCnAUc1dD9ZFtNAxGb12s9Ak3o6MZECfm6LJtT2hVMNLX8NPc0bBn64+XxbBIbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508205;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Rtc92rlbJoLohK4LVxmMVpKXwZ+yJ59RVuAWYMV1ddM=;
	b=2MdoEsrwHDfe2rw1W8EXxeLRRwq05p25PAdwQGoP9dbM86TZfRysUy/LTJ3gJOFke11K
	 tdBqX7enOzqAQTZ+1efQMJIGxKJx9dav7MHkfZieTOcFTZ6/n7sg+V4QgdH411OskarS9
	 S3kH2SrL7yZSNElLAV8mrq0vb+q9i3oSOF7UIcBaErbTnTrmYpp2PvK1y1rgzDLLY8RBv
	 hmNBVfnz22hano2gSGaNcwRGjQ8jzRoJrER2A9JcpF31Q53FU1WNi9VYDJ0NgTZjMNTSs
	 RI/i3hmXWjvjg8XFeTkpr8VRYsXvudHseg+O1PfGlt7nJWKhpMTTlzIASaM3DMKpCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jS3+VlNK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F74606A327;
	Thu, 12 Nov 2026 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jS3+VlNK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518701F000C4;
	Thu, 12 Nov 2026 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508204;
	bh=Rtc92rlbJoLohK4LVxmMVpKXwZ+yJ59RVuAWYMV1ddM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jS3+VlNKNheQKWnKJjut95GHr34G+JNaUDsAWytjTmzpXs/UwgLRHqPj5GutmW7oX
	 dDBa2x+2TFu05dIOHA0x2pD0iZxHeowgDs4dM2vg3nitk21sVx9N26FbvPObzbFk9G
	 FhSuVGqbBWqql8CLciAenR0idFvAbQRC8Ua7+55XqV2bjG3ptXsC7HdWnp8wRLagaq
	 /XlU71IAuqJaSDBHumr84oYUsSzPgonQ4S7qKawOJJaAMhjvIh/i2ROGhx6GkDHDyA
	 CSlNaBROHZZokcecgOZ3SHv7x3aegxwj8wyojRwbT5sthRNboLbdMUvq0N3ACfH61x
	 FN5OzKne6wtTw==
Date: Thu, 12 Nov 2026 12:29:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <avX9Qrcapcnutdgh@baldur>
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

On Thu, Nov 12, 2026 at 06:53:46AM -0600, Rob Herring wrote:
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
> in the series are applied. It introduces a bunch of warnings.

I don't understand. The change you present here relates to ipq5210 and
ipq6018.

That change doesn't touch these two IPQs, so what are you suggesting?
Are we talking about the same warnings?

> Can the QCom folks stop doing that! Coordinate applying the series or
> take the binding and dts changes in 1 tree.

I assume you're referring to "QCom folks" in the sense "any maintainer
touching a binding change related to a qcom platform"?

Do you have some CI/guidance/tooling for Vinod (and other subsystem
maintainers) to perform system-wide DT-validation when considering
merging a binding change?


I unfortunately only spotted the one-way dependency when glancing at the
seris and thereby ignored the dts patches waiting for the binding to be
merged.

> Given the patch series is 2+ months old, I'd be surprised if the rest
> gets applied.

I've applied the two dts changes today, and they do resolve a number of
warnings - presumably the ones that you're talking about, but I don't
think the ones that this patch aim to fix?

> 
> This patch OTOH fixes warnings.
> 

What warnings? Can you please provide actionable context when you're
pointing out these issues.

Is it the three "'x-supply' is a required property" warnings from
ipq6018-cp01-c1.dtb? It seems unlikely that there's one chip that
doesn't depend on those supplies.

> Rob
> 
> 
> [1] https://lore.kernel.org/all/qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com

https://lore.kernel.org/all/20260903-topic-8996_61x5_qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com/

Regards,
Bjorn
