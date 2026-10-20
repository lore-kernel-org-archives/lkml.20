Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500698;
	b=k5b/taMNmnIeGV5L15uYjo6gFS0z4vVDQqMoqEV3kzRCUME6os00RC8cyzbJg9BCAwXh
	 jLNK1IeTXc0ccv3EiKvedXINDmWV9hyWHbDmPWgDJ2jZCg/k7Kq+U6gKk6PZQFJfykAGq
	 FeivrPACb8wVPR5CrlMD/Ru5QjMttnAJ41b8RP+Q5yt9v032NpJG1ayxc+KFIt+j6plru
	 tUEa/vUl2AbEMQr4bzBQfkZhgG8dp5pvuy+cJJaNW8vJ6929/9vRGiveFGHF2YkZGNhjP
	 o6P2iiL+6CZOF1aFbNHYAR2q32QF0zIrhXQLVfL+tqj5UJRcrTFE04WfXuQ/EsKJo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500698;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=x3rNaEw4bb0F59BHqC8y3vlRCTw1eqgsEtWAFR2oJbo=;
	b=kgcVpuColpJsRtlqzcErdXN+0XutLZ7fLDq8+nhqvTI8x7TxvWh/Z2W4QYl8TLhe/+NN
	 2ATuI4fHF2Q7ooPhQdl42nRA+8pSpd8Xxgd729HWYC7RF6sNtQX31ie+20Qua0mmL/THX
	 JsUBYYslvwY8Ts6ht+NIz1kamkTCGOC4Dx+F+jW+Bz5pUkrP+sr030WMDwtHmULHHKUTT
	 QxVTBJ4F0qsjsFd/pscrYom08sYXJpl1NE1znq7bPuhn81f+Nb1z74dhZ/yWCsr6S6d5W
	 Qy2HQTFli852URNwRDLePhEf0bChRebr6tjXsUSmQXRGKXqQdUeXxSPaepy+flpuLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CroLdk3a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FD606A319;
	Tue, 20 Oct 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CroLdk3a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095361F000C5;
	Tue, 20 Oct 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500697;
	bh=x3rNaEw4bb0F59BHqC8y3vlRCTw1eqgsEtWAFR2oJbo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CroLdk3aX/LyfcTC78K/qTH53xmd99zahtClfoiyQcLcI3Qba+7/XzYe24MOA429f
	 fNNJHEpVLo9PyFZ4d70zErMqFPc7/uyq4eLu2QE3KsUjDRSbb9xkBCQNB9HB/fm1Ms
	 lxIrnbOJZ/IUYej81JJVPXnyAMh9doxnIYM7G7zBaVwsk4l4d1dMuqfn0a4ijbwXBW
	 c8nV8+7LGQe1bteFkFdRt+9KYBJl3WJ+rGiZOw+AqxvmlRbkLyrcA4EyndavD6iG2r
	 xzO06SuZV++VGT/3b9O8V6UvfB1HMi/81aPK58g9cZ6+nvynPydCIwCD7wTwygD0/W
	 1XE6KGTHe1qpg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sriram Dash
 <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
In-Reply-To: <179216539953.106618.14570496753417806206.b4-reply@b4>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
 <179214420138.106618.10672928212252943043.b4-reply@b4>
 <xhkdbqzhp6b45.fsf@mkorpers-koolstof.csb>
 <179216539953.106618.14570496753417806206.b4-reply@b4>
Date: Tue, 20 Oct 2026 14:51:35 +0200
Message-ID: <xhkdb33u04js8.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16, 2026 at 21:13, Manivannan Sadhasivam <mani@kernel.org> wrote:

> On 2026-10-16 15:14 +0200, Mattijs Korpershoek wrote:
>> Hi Mani,
>> 
>> On Fri, Oct 16, 2026 at 15:20, Manivannan Sadhasivam <mani@kernel.org> wrote:
>> 
>> > On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
>> >> From: Sriram Dash <quic_sriramd@quicinc.com>
>> >> 
>> >> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> >> platform resources, including clocks, interconnects and TLMM.
>> >> The driver requests resources operations over SCMI using power protocols.
>> >> 
>> >> The SCMI power protocol enables or disables resources like clocks,
>> >> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> >> such as resume/suspend, to control power on/off.
>> >> 
>> >> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
>> >> whereas power domain "transfer" controls clocks and interconnects.
>> >> 
>> >
>> > This is not consistent with other SCMI based drivers. Most of them are using
>> > 'power' and 'perf' power domains, not 'core', 'transfer'.
>> 
>> That's correct. Krzysztof had the same concerns [1] in the binding
>> reviews. To sum up from that thread:
>> 
>> For usb PHY, 2 SCMI protocols are exposed by the firmware:
>> * power domain management protocol (protocol_id=0x11)
>> * performance domain management protocol (protocol_id=0x13)
>> 
>> The power domain has 2 indices: 'core' and 'transfer'.
>> * core controls the regulators, the clocks and the reset
>> * transfer only controls the clocks
>> 
>
> But this contradicts with your commit message:
>
> "Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "transfer" controls clocks and interconnects."

Yes, I need to update the commit message here. I should have done that
when updating the binding commit. Sorry about that.

>
>> The performance domain (0x13) exposes opaques values (0xa to 0x11)
>> for which we don't have any information.
>> 
>
> It is a shame that it is being defined as opaque values, but as long as you
> don't define it in the binding and not use it in the driver, I'm OK with it.

Ack. It's not defined in the binding and I won't use it in the driver.

>
>> >
>> > Why are these discrete powers domains be required? In my point of view, the PHY
>> > should have only one power domain for controlling power and be done with it. If
>> > you start having these fine grain controls over the resources from SCMI clients,
>> > then it defeats the purpose of the SCMI based firmware abstraction design.
>> 
>> From what I understand, thse fine-grain controls are useful for runtime
>> suspend/resume (on the Linux side).
>> For example:
>> 1. Enable 'core' power domain to enable the PHY
>> 2. Disable 'transfer' to turn of the clocks. PHY is still powered but is
>> "idle"
>> 
>> If we look at the patch, we can see that this is what's done in
>> qcom_snps_hsphy_suspend().
>> 
>> Does that clarify things?
>> 
>
> Even though the SCMI spec allows defining multiple sub-domains inside a
> protocol, I'd argue that there should only be one power domain 'power'
> controlling all resources such as clock, icc, resets etc... But in this case,
> that ship has already sailed.

I agree. Unfortunately, I can't change what the SCMI firmware exposes to me.

>
>> This is also explained in the binding [2]
>> Should I rephrase the commit message here to include that?
>> 
>
> Yes, please. Driver commit message should be independent.

Ok, will do.

>
>> >
>> >> In this variant, two disjoint sets of resources are modeled against
>> >> the power domain suppliers which can be turned on/off to achieve modeled
>> >> device states. Two modeled low power states d1 and d3 are supported.
>> >> 
>> >> transition: d0 <--> d3  :: both core and transfer suppliers
>> >> transition: d0 <--> d1  :: only transfer supplier
>> >> 
>> >
>> > What are these transition levels and who defines these? We cannot have different
>> > SCMI drivers inventing these kind of independent low power modes.
>> >
>> 
>> Maybe the naming is not as good as it should be.
>> I took this originally from a downstream qcom patch and did not change
>> it.
>> 
>> I interpret this as:
>> * d3: phy is powered off, before probe (no regulators, no clocks and in reset mode)
>> * d1: phy is in lower power mode (regulator on, no clocks, no reset)
>> * d0: phy is powered on an operational (after probe)
>> 
>
> These looks like ACPI D-states, which are neither defined in the SCMI spec, nor
> used by any other Qcom SCMI drivers. So this driver cannot just invent these
> states on its own. Just use plain wording for the function names based on the
> indices.

Ok, will do. Thank you for the suggestion.

>
>> I see that drivers/tty/serial/qcom_geni_serial.c uses a similar
>> mechanism. Should I try to follow that naming convention?
>> 
>> If you have other suggestions, I'm happy to get them.
>> 
>> Note that I can't change the power domains ('core' and 'transfer' since
>> those are enforced by the SCMI firmware)
>> 
>
> SCMI firmware don't define the power domain names, isn't it? They just define
> indices and it is up to the OS to name it however it wants.

That's correct. It's been a while I looked into it so I got confused.
However, I'd like the names to stay like this since it's how they are
defined in the binding.

>
> But if it is defined in any of the internal doc, then it is fine.
>
> - Mani
