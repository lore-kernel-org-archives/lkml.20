Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3054A4992;
	Fri, 16 Oct 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156478; cv=none; b=E96vofg3CoYuvj5mtkU9eDpvEUkzdMMHtOIlHiKjSQM4asK3f0liAYD5NlqR2tO6qkbk2AOKe0QxtfUBlv7eejj0bcmCa6duAsMyI4m1kyWAL5yJDmu9lCVSMLEgOLUK0MAkcCWPKPOAvu60/9ZAAFixbJPRJ94aESeNaeEB4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156478; c=relaxed/simple;
	bh=0dZw+Fz6MpjSED7gb6bv+mmDYCcc9iUPGgeSpSsajeU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fuRDIag/tJZ1NLbhv7cT53XvLg/7yjfLGkrMwUooGBdfnwq39kmIIB9LgNTFXrIImSmLCrkDGZuilhsuAZCcQHxTBUmHpb3MfFTdefcM8MfQjJPt0sXFFi9Fc8IilFP4z8QfzdHARXPbjUvceW3qCKEXDybmI5MOyVYZyMFXmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU1avqfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU1avqfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C89E1F000C7;
	Fri, 16 Oct 2026 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156476;
	bh=hUtNEh692Ln8xnhPOuaR7A+C/ErZ2D+qn4TDhgjSS0U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gU1avqfFPFvBuObpwapYgNb8Y6k+02YUpIah0WpY4+eM/uggWYwEINNEiv1HZDlmz
	 S2nogPIM334vI1QWdLhJaUUqBDgtjd2BYiOuuyxTmWLFapbsCCluU/3rx8op+rp3i0
	 7a2POcIpeMykMEEb3PoJi5WX/k9lDbL0t0Z03W1ZSqMN1Nip+y2k1F/gathBNdh9Wh
	 23eyyJaMYA7gIsWiHyOzujtk54zwISk8UQdd9AYt4biwHDZ2gxrrto0l/fbiEazv+j
	 217PPoh00f7NTYhS16brkeTd6GUn4VG9sFJhXiAM4vi0VxSdUZu6mS5V2W7llA8PWC
	 g1eIaT234M+Zw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sriram Dash <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
In-Reply-To: <179214420138.106618.10672928212252943043.b4-reply@b4>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
 <179214420138.106618.10672928212252943043.b4-reply@b4>
Date: Fri, 16 Oct 2026 15:14:34 +0200
Message-ID: <xhkdbqzhp6b45.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mani,

On Fri, Oct 16, 2026 at 15:20, Manivannan Sadhasivam <mani@kernel.org> wrote:

> On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
>> From: Sriram Dash <quic_sriramd@quicinc.com>
>> 
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power protocols.
>> 
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power on/off.
>> 
>> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
>> whereas power domain "transfer" controls clocks and interconnects.
>> 
>
> This is not consistent with other SCMI based drivers. Most of them are using
> 'power' and 'perf' power domains, not 'core', 'transfer'.

That's correct. Krzysztof had the same concerns [1] in the binding
reviews. To sum up from that thread:

For usb PHY, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

The performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information.

>
> Why are these discrete powers domains be required? In my point of view, the PHY
> should have only one power domain for controlling power and be done with it. If
> you start having these fine grain controls over the resources from SCMI clients,
> then it defeats the purpose of the SCMI based firmware abstraction design.

From what I understand, thse fine-grain controls are useful for runtime
suspend/resume (on the Linux side).
For example:
1. Enable 'core' power domain to enable the PHY
2. Disable 'transfer' to turn of the clocks. PHY is still powered but is
"idle"

If we look at the patch, we can see that this is what's done in
qcom_snps_hsphy_suspend().

Does that clarify things?

This is also explained in the binding [2]
Should I rephrase the commit message here to include that?

>
>> In this variant, two disjoint sets of resources are modeled against
>> the power domain suppliers which can be turned on/off to achieve modeled
>> device states. Two modeled low power states d1 and d3 are supported.
>> 
>> transition: d0 <--> d3  :: both core and transfer suppliers
>> transition: d0 <--> d1  :: only transfer supplier
>> 
>
> What are these transition levels and who defines these? We cannot have different
> SCMI drivers inventing these kind of independent low power modes.
>

Maybe the naming is not as good as it should be.
I took this originally from a downstream qcom patch and did not change
it.

I interpret this as:
* d3: phy is powered off, before probe (no regulators, no clocks and in reset mode)
* d1: phy is in lower power mode (regulator on, no clocks, no reset)
* d0: phy is powered on an operational (after probe)

I see that drivers/tty/serial/qcom_geni_serial.c uses a similar
mechanism. Should I try to follow that naming convention?

If you have other suggestions, I'm happy to get them.

Note that I can't change the power domains ('core' and 'transfer' since
those are enforced by the SCMI firmware)

Thanks again for the review
Mattijs

[1] https://lore.kernel.org/all/877blx2bga.fsf@kernel.org/
[2] https://lore.kernel.org/all/20261002-phy-qcom-snps-femto-v2-8255-v3-1-342542bd9bc6@kernel.org/

> - Mani
