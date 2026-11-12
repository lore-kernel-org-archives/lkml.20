Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518264;
	b=nlHCPn3yNEK/HwXWmBsytTy66BXgLefLuQjHiFRBLWyinQq32PemAV9L2TsLjryh8Q0C
	 KsMQKSyX8+fVUTScVyPouZ6wu4e9c1EMzt8lprPOWDSyUjy1A/RLrUrrblKbuJ3hlN2Zk
	 /X78AXG1ss0A1nUOvJSQK6AF5hE3VB/wDtNmTSX26nzybEgj+i9OJoiia0E+DMU+bw5+T
	 5eCsDnkJb/0BovgRHKbBQh7/I7aRJrN6AlOFGdiYJNfo5/ii3/ka4nXYJoRPtIssZH3L9
	 HDiF46+BRNqvx53+wp43UvxgO3co7CPqyVNJFu2ZshlaEfz6VcMd2imrdjpFd/hBWAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518264;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=45Y4sZ8sS5eeWt0uYYzHFHzHlhbwxoDgGS6j5RpQTOU=;
	b=AWsY3aiOKn+9Y7W7Y7qf4X4SuY9n8ZOa6VJdaX/Lv1Nmn16d0uZNioTgD6Q4z6Q62dPR
	 nhBXslX/p2REF+Z/MHQyeoSuCekw+7FirczWH6ig2u+aFzv4nw+H/Pad/o0wTbt35D8Go
	 ykyaZNONgiht91O14kBrIBQ2N0oXIujek21qAQc9+3r2MNY78vCkYfRUOwBi31Vodv/8Q
	 mFAb83svPIuKUsmT002S8P+27C9OjcMWT4WbsnpYbvLb6OgNQBIaTzc9V4ZDWxEnp8TVT
	 W74NKngmT+BJZD3xqRPyn8ff7Y5eJk4FgZxlUUh5IOH1TYVm72apMaLBWhewW4X29Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLlG04Ml;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB16606A31C;
	Thu, 12 Nov 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLlG04Ml
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263BD1F000C4;
	Thu, 12 Nov 2026 21:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518264;
	bh=45Y4sZ8sS5eeWt0uYYzHFHzHlhbwxoDgGS6j5RpQTOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WLlG04MlmUjhkGqlKpaKSwrJEXJiamorc0v8bqdu2OLyMgB0lmtLcpgTVYfKp4PEI
	 deCt0pBWPSR8Db8394ehRIJhRRnQJepzq2wU9DCDPF54F9+SEqEidxGtjgrgkuHSHR
	 aBXw8dF5rRPB5OuapSpmVMcwaQqc/TReIr6zOGHdjTJUsX5aYyqgQs8KmKWpbA05yg
	 twkSIsPySPZomL7Je7Pl2N5BDDy9/w6NF4K6+0LzCB/I/c80co5TwuEnIZGBhSnP40
	 SaJdG2x6YtAy7zlpsWpAEXB/jZmVZ9wGlZsLMmwcX7VMgy2o7fn+MuJy06Y4jXFgt7
	 zLNbo3pIesXIQ==
Date: Thu, 12 Nov 2026 15:17:41 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <20261112211741.GA279944-robh@kernel.org>
References: <20261021022446.3619435-1-robh@kernel.org>
 <avWbmsjkYo2LMJKs@parshuram>
 <20261112125346.GA3821108-robh@kernel.org>
 <avX9Qrcapcnutdgh@baldur>
 <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
 <46821acb-2db9-42e1-b93d-8b6d39f259eb@kernel.org>
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
In-Reply-To: <46821acb-2db9-42e1-b93d-8b6d39f259eb@kernel.org>

On Thu, Nov 12, 2026 at 09:13:03PM +0100, Krzysztof Kozlowski wrote:
> On 12/11/2026 20:22, Rob Herring wrote:
> > On Thu, Nov 12, 2026 at 12:30 PM Bjorn Andersson <andersson@kernel.org> wrote:
> 
> 
> (replying only to parts of the message)
> 
> 
> > 
> >>> Can the QCom folks stop doing that! Coordinate applying the series or
> >>> take the binding and dts changes in 1 tree.
> >>
> >> I assume you're referring to "QCom folks" in the sense "any maintainer
> >> touching a binding change related to a qcom platform"?
> > 
> > No, primarily you and the submitter I guess. Submitters should be
> > aware of dependencies in their series and suggest how things are
> > merged. Otherwise, it falls on you to care that warnings are getting
> > introduced.
> 
> We all have been swamped with patches and Qualcomm have been probably
> the busiest arm64 platform for months now.
> 
> for i in arch/arm64/boot/dts/* ; do echo "${i}:$(git log --no-merges
> --oneline v7.0..v7.4-rc1 -- $i | wc -l)" ; done
> 
> qcom: 1016
> freescale: 485
> renesas: 215
> 
> Qualcomm SoC got one more maintainer, so there is catching up, but
> probably not enough.

Good thing QCom hired half of Linaro...

> > I would not care so much when there are transient warnings in next,
> > but I don't want to be the one chasing them down. But AFAICT, it's
> > always me. No one beats me to it and I'm not all that fast in
> > noticing. I just compare all the warnings by platform for Linus vs.
> > next with "gl-diff-dtb-warning -p arm64" from this repo[2], and look
> > for things moving in the right direction. Of course this is all after
> > applying which isn't ideal.
> 
> FWIW, I do test all Samsung ones and I look only at some of Qualcomm
> boards, because there were just too many warnings to have a clean
> dtbs_check for qcom. I do report them to Bjorn/Konrad [1], but that's
> indeed only subset of entire qcom ecosystem. I know that a few other SoC
> platforms keep track (TI at least).

The too many warnings excuse is about to run out.

Here's Linus's tree ATM for qcom (I'd list next, but warnings have gone 
up):

     12 syscon@9a10000 (syscon): compatible: ["syscon"] has less than 2 items

https://lore.kernel.org/all/20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org/

      5 usb@6af8800 (qcom,msm8996-dwc3): Additional properties are not allowed ('extcon' was unexpected)
      2 usb@76f8800 (qcom,msm8996-dwc3): Additional properties are not allowed ('extcon' was unexpected)

In the wrong spot or needs to be added to the binding?

      2 touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)

https://lore.kernel.org/all/20260921232738.3135429-1-robh@kernel.org/

But seems to be a hack, so?

      2 panel@0 (jdi,fhd-r63452): "power-supply" is a required property

???

      3 phy@7411000 (qcom,msm8996-qusb2-phy): "vdd-supply" is a required property
      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdd-supply" is a required property
      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-pll-supply" is a required property
      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-phy-dpdm-supply" is a required property
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required property
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a required property
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is a required property
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required property
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a required property
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is a required property

https://lore.kernel.org/all/20261112192345.3962577-1-robh@kernel.org/

      1 panel@0 (lg,sw49410-lh609qh1): Unevaluated properties are not allowed ('reg', 'vsn-supply', 'vsp-supply' were unexpected)
      1 panel@0 (lg,sw49410-lh609qh1): "power-supply" is a required property
      1 panel@0 (lg,sw49410-lh609qh1): compatible: ["lg,sw49410-lh609qh1","lg,sw49410"] has more than 1 item
      1 panel@0 (lg,sw49410-lh609qh1): compatible:0: "lg,sw49410-lh609qh1" is not one of "ampire,am-1280800n3tzqw-t00h", "ampire,am-1280800w8tzqw-t00h" or 178 other candidates

https://lore.kernel.org/all/20260614-judyln-panel-v3-2-07f4134441bd@postmarketos.org/

      1 panel@0 (flipkart,rimob-panel-nt35532-cs): compatible: ["flipkart,rimob-panel-nt35532-cs"] has less than 2 items

Fixed in next

   Undocumented compatibles:3
     'jdi,fhd-nt35596s'

https://lore.kernel.org/all/20260921232609.3130272-1-robh@kernel.org/

But probably belongs in this:

https://lore.kernel.org/all/20261011-nt36672a-panels-v3-3-9ea238627f8a@minlexx.ru/

     'lg,sw49410-lh609qh1', 'lg,sw49410'

See above

     'qcom,ipq6018-wcss-pil'

Fixed in next


So 3 unique warnings left without fixes in flight.

> 
> [1] https://krzk.eu/#/builders/102
> 
> 
> > 
> >> Do you have some CI/guidance/tooling for Vinod (and other subsystem
> >> maintainers) to perform system-wide DT-validation when considering
> >> merging a binding change?
> > 
> > This one is an ABI break because it adds new required properties. I do
> > have some tooling that looks for ABI changes, but haven't committed it
> 
> because I haven't figured out the best way to deploy it. I think for
> > anything that is an ABI change, the binding and dts files need to go
> > in together.
> > 
> > I think it is time to reconsider the default of bindings go in with
> > the driver. That works okay for new bindings as long as the platform
> > maintainer doesn't take .dts changes before bindings land (also an
> > issue). However, for cases like this, we need the opposite order. We
> > need to figure something out because this is only going to be more of
> > an issue as we get to warning free (and we are close).
> 
> We have been talking about this for some time and recent consensus was
> that SoC maintainers can freely take such bindings when driver subsystem
> maintainers lag behind. The case here is a bit opposite - driver
> subsystem was before SoC.
> 
> So let's change the generic recommendation/policy? Whenever patchset
> touches bindings and DTS, and the bindings do not need any driver
> updates like they add only front-specific compatibles, the SoC should
> take entire set?

Yes. Platforms that are warning free already do that.

I also think we (the DT maintainers) need to get stricter on handling of 
adding or removing required properties. For adding required, delay the 
binding change a cycle (or after dts is in next). For dropping required, 
delay the dts change a cycle (or after binding is in next). That's 
probably too much for any maintainer to check other than DT maintainers. 
Or maybe add this to sashiko prompts...

Rob
