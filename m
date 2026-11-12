Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526870;
	b=vBamdlF8Xh0bncrPLdYPiSnB7+BkMK+sFqMiJb2SwOmq4fvCWKEIbNBZH8gZuUFEALQ6
	 mRz3Kqw+ld7778DZMjJMZwTBrAoILlDw4jt9w3IfXhHCt/JMQUw5sPyOYOJUzV6xqcwfa
	 TRVDfssCznvV5cz2ZCPXq+caLtdkWfngNdRLwTHx5y5CGxCn4lMgQFvrsGOY5a/QSBAmf
	 kkl2C2qeQVeg+I5wm2yM4xO9gAG7HqTY/3v0wCbg/oV7DtWa2hcAKQg1tdnBjAa4gRzQG
	 MRHOn2NrifvhvMRweZteuJKAojFc0Kz8U3cFBnSTc59gEe5vWjnucYHtgPTYXCCoRKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526870;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=L5KWhhbeBXZKmzDTgoYpamBPxic157lvyeKhXzre0Ig=;
	b=sI55IzJpaIAxX8Uxp5ccO95IwHh7MGqIJ68z4q6PXjILje4iWJu2aYrJTwLpQj/jtWvA
	 76AfQgsgpd25FKF/mGuahv2z/P9Kwj8JfmFcLsIR8CneCXFls/MHe+LaxfAwswFYMFYbQ
	 7F52pVE7v+B+2DuR1H0oaQyA4cnUXHDjD5zc0qEchf+eAh7caCw4BIbxTgXZ8xFq5GG+t
	 TWLboF/nhox0Dfy9sNNpxjqXFHPoC6jp2mRKLaQIBubw8dfnXQOYnuhOBkiTQ2kHrUnxL
	 xbFRS0Qt1SszSqmrKbUWLxNis48sVJxL30WIv9Cd1SSPOUyXu6kIkbzM+fkkY1Wxeyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W29hfTdP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF130606A31C;
	Thu, 12 Nov 2026 23:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W29hfTdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63AD1F000C4;
	Thu, 12 Nov 2026 23:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794526870;
	bh=L5KWhhbeBXZKmzDTgoYpamBPxic157lvyeKhXzre0Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W29hfTdPUcxSvyo08U23g3NvUtFivFYvlzc0Py6OZucOa83R/tuav9t+TdGtAAARk
	 reXr2Q5kcw7LL1IwvHQm4MT5fLAiZqo0NYdxubIEjdTcs/8FslIPdvk2uoVTNhBgDh
	 7I7BMv8eMfN8IoBAqi+0HuotB/sEd3AUA7L9ffjVIyCGJsMDVFb511iNraW//HTrSm
	 cJ/6lgvQBMSJusEmPBA2EYy/q2Uc+k+GzjnGeg5uGdrTJzaTVelWk0Q7uedEwyZA4t
	 6NMyuDs14WDrvP+tYZpYOZOXUZCYAiZny7uesuyeHPMNVShQphNDqKxBZqw9GibMaI
	 pc994UM+wz30w==
Date: Thu, 12 Nov 2026 17:41:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <avYyrAKAQs6pHNbh@baldur>
References: <20261021022446.3619435-1-robh@kernel.org>
 <avWbmsjkYo2LMJKs@parshuram>
 <20261112125346.GA3821108-robh@kernel.org>
 <avX9Qrcapcnutdgh@baldur>
 <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>

On Thu, Nov 12, 2026 at 01:22:16PM -0600, Rob Herring wrote:
> On Thu, Nov 12, 2026 at 12:30 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Thu, Nov 12, 2026 at 06:53:46AM -0600, Rob Herring wrote:
> > > +Konrad
> > >
> > > On Thu, Nov 12, 2026 at 04:27:30PM +0530, Vinod Koul wrote:
> > > > On 20-10-26, 21:24, Rob Herring (Arm) wrote:
> > > > > For the QUSB2 PHY binding, keep the three regulator supplies required
> > > > > except for legacy IPQ6018 nodes that do not describe the board rails.
> > > > >
> > > > > This relaxes the requirements for the IPQ5210 as well as if it is
> > > > > compatible with IPQ6018, then it shouldn't have more required
> > > > > properties either.
> > > >
> > > > Hey Rob,
> > > >
> > > > This fails for phy/next I see vdd-supply has been moved around..
> > >
> > > The change in question[1] should not be applied until the .dts changes
> > > in the series are applied. It introduces a bunch of warnings.
> >
> > I don't understand. The change you present here relates to ipq5210 and
> > ipq6018.
> >
> > That change doesn't touch these two IPQs, so what are you suggesting?
> > Are we talking about the same warnings?
> 
> This is what I get with phy-next because it has the binding change
> from [1], but not the .dts changes in the series:
> 
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@7411000
> (qcom,msm8996-qusb2-phy): "power-domains" is a required property
>         from schema $id:
> http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@7411000
> (qcom,msm8996-qusb2-phy): "required-opps" is a required property
>         from schema $id:
> http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
> 
> (and then duplicated for every 8996 board).
> 

Good, then we're aligned. These 18 warnings are resolved in my tree, so
they should drop again in the next linux-next.

> > > Can the QCom folks stop doing that! Coordinate applying the series or
> > > take the binding and dts changes in 1 tree.
> >
> > I assume you're referring to "QCom folks" in the sense "any maintainer
> > touching a binding change related to a qcom platform"?
> 
> No, primarily you and the submitter I guess. Submitters should be
> aware of dependencies in their series and suggest how things are
> merged. Otherwise, it falls on you to care that warnings are getting
> introduced.
> 

I currently do catch these things while applying dts changes, and I've
recently cooked a dashboard to track the overall state of mainline and
linux-next, but I don't have any solution to catch things prior to merge
- or a good solution for catching regressions coming from binding
changes prior to them being merged.

> I would not care so much when there are transient warnings in next,
> but I don't want to be the one chasing them down. But AFAICT, it's
> always me. No one beats me to it and I'm not all that fast in
> noticing. I just compare all the warnings by platform for Linus vs.
> next with "gl-diff-dtb-warning -p arm64" from this repo[2], and look
> for things moving in the right direction.

I'll try to wire something up to catch these faster. At least until this
regression things has been fairly stable for a while now...

> Of course this is all after applying which isn't ideal.
> 

Thanks to the --cache-dir and --json support it's a bit more convenient
to catch things during the merge, but the CPU-power needed for a
system-wide sanity check remains a concern.

I would prefer to catch more issues prior to touching the patches, but
so far my efforts there has run into issues as contributors keep sending
things with loose dependencies.

> > Do you have some CI/guidance/tooling for Vinod (and other subsystem
> > maintainers) to perform system-wide DT-validation when considering
> > merging a binding change?
> 
> This one is an ABI break because it adds new required properties. I do
> have some tooling that looks for ABI changes, but haven't committed it
> because I haven't figured out the best way to deploy it. I think for
> anything that is an ABI change, the binding and dts files need to go
> in together.
> 

After a second look, that would have made more sense, since the driver
changes wasn't related to the binding change after all...

> I think it is time to reconsider the default of bindings go in with
> the driver. That works okay for new bindings as long as the platform
> maintainer doesn't take .dts changes before bindings land (also an
> issue). However, for cases like this, we need the opposite order. We
> need to figure something out because this is only going to be more of
> an issue as we get to warning free (and we are close).
> 

There's also the ever growing number of small incremental changes to
bindings, where subsystem maintainers leave the binding changes to me.

But then there's also the many changes where the driver patches depend
on the binding changes. Not sure how to structure this and keep the
velocity up.

> > I unfortunately only spotted the one-way dependency when glancing at the
> > seris and thereby ignored the dts patches waiting for the binding to be
> > merged.
> >
> > > Given the patch series is 2+ months old, I'd be surprised if the rest
> > > gets applied.
> >
> > I've applied the two dts changes today, and they do resolve a number of
> > warnings - presumably the ones that you're talking about, but I don't
> > think the ones that this patch aim to fix?
> 
> Other than the warnings it introduces, the [1] series fixes this one warning;
> 
>       3 phy@7411000 (qcom,msm8996-qusb2-phy): "vdd-supply" is a
> required property
> 
> 
> > > This patch OTOH fixes warnings.
> > >
> >
> > What warnings? Can you please provide actionable context when you're
> > pointing out these issues.
> >
> > Is it the three "'x-supply' is a required property" warnings from
> > ipq6018-cp01-c1.dtb? It seems unlikely that there's one chip that
> > doesn't depend on those supplies.
> 
> Of your 20 unique warnings, it's these 10:
> 
>       1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdd-supply" is a required property
>       1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-pll-supply" is a
> required property
>       1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-phy-dpdm-supply" is
> a required property
>       1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required property
>       1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a
> required property
>       1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is
> a required property
>       1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required property
>       1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a
> required property
>       1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is
> a required property
> 

I'd prefer to actually populate those, I'll take another pass to see if
I can find documentation/schematics to resolve them.

Regards,
Bjorn

> Rob
> 
> > > [1] https://lore.kernel.org/all/qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com
> 
> [2] https://gitlab.com/robherring/ci-jobs
> 
