Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A310377EA9;
	Fri, 16 Oct 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165417; cv=none; b=mrj3+LVJI43aqSCCGopnmXWrPhWCRVyXv2sK0L7J+HfR8FOAGPrmTF+aLwOMBD3ySl2V7QM+vlrorDWG+5HNYIiOjnlrIfUHPtNRaWynd7EhWuidArML+Ean6EA5Okp5OAGEpXX+xpjMMgmHVz3zE8nb/Ws+sU408+USlLEdyRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165417; c=relaxed/simple;
	bh=WIrF0B1YcztghQ25TC0rMR7M8vujKFqXcuC4yly5xsA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=e6aNSpkb3oxj/a8TCim1bcjb2/7i/bZE+oU3W7o2b39z/kXP+FJzMWl2TH0N+QJa3ppRz9m3P7g+qpaTT9zGymOQG2s973RtfW9F/0z2vmvzdPeM4mEFyBPmJZf7BpWHErPXasOC6eqlBfN+DUYxH+q+JdBOhJwUZmQ8T9ZBkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYXcu7dc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYXcu7dc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5881F000C4;
	Fri, 16 Oct 2026 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792165416;
	bh=LcSEFLNlLRj6r7I/tqUMRAsQ8iaPLr97Duj+1ronOes=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jYXcu7dcBUFWun40DfLY6RsxA5hUACj9JjHpW5yarRCwg4LSmi+PZXKCDlIiYOtql
	 /1JpBI2YGK21oxsNaaXZ39Mk4bXJJFVzJE2S20W3hlO2uOfOYlBzgCIiTk5IPfGHu/
	 3uT4M5vMTJDbxnN50BZUm0ckq0E0ud9xjt7h9eykIZE8KwEbUCVfvdCvD/NROWQP+E
	 47hpt4i7T4+ciVxEXJh+RgBJt03+6y14DQlLYtGJpYieTrhm2SPMfIY8YZ0NHwMXrI
	 4lLWSilvcAhypd8ugnEJXyCC5hrsCIP+M96k5qvuKWjox91wcmyRGeEcxqjNON7AYq
	 5X9zAIPckVrgg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for
 SA8255P
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sriram Dash <quic_sriramd@quicinc.com>
In-Reply-To: <xhkdbqzhp6b45.fsf@mkorpers-koolstof.csb>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
 <179214420138.106618.10672928212252943043.b4-reply@b4>
 <xhkdbqzhp6b45.fsf@mkorpers-koolstof.csb>
Date: Fri, 16 Oct 2026 21:13:19 +0530
Message-Id: <179216539953.106618.14570496753417806206.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4836; i=mani@kernel.org;
 h=from:subject:message-id; bh=WIrF0B1YcztghQ25TC0rMR7M8vujKFqXcuC4yly5xsA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0kYaMcYoOYuEt8LHmnk2kJpo7tZ5h8+CyFxEy
 0LT1W0lUy+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatJGGgAKCRBVnxHm/pHO
 9aW+CACqgV6a7bkqUFziapH9V9EPveDtCHgmoGwzC23kkS5kBt4kyD5hGZN3OqaOb1gtJhfcdfi
 31SqcfzfKwYlfmKXtA+Gw7tVYIefPk/QAH0ZYlGo+qlvpDpeWuSnjC/EBZvriVYsO9hcaABUHon
 rfJ6a6fl+ffpzokn7tBTrS+/HhMFfhXBKevolYcyUttbFE1NjLEhVje84g9yYr8fhtZDy5gFdlx
 V6UEL9by+pR5gyd+Hhj02Ok0CvFpOxU9la2BWrD5DefOgDuXG+aZkiupbh7uJcDMs89cVwUasS7
 mKBsBexyHFjAjqn9Uq+cxzcjhMU6YxdsMxSzQaRiP1yMBLyw
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 15:14 +0200, Mattijs Korpershoek wrote:
> Hi Mani,
> 
> On Fri, Oct 16, 2026 at 15:20, Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
> >> From: Sriram Dash <quic_sriramd@quicinc.com>
> >> 
> >> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> >> platform resources, including clocks, interconnects and TLMM.
> >> The driver requests resources operations over SCMI using power protocols.
> >> 
> >> The SCMI power protocol enables or disables resources like clocks,
> >> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> >> such as resume/suspend, to control power on/off.
> >> 
> >> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> >> whereas power domain "transfer" controls clocks and interconnects.
> >> 
> >
> > This is not consistent with other SCMI based drivers. Most of them are using
> > 'power' and 'perf' power domains, not 'core', 'transfer'.
> 
> That's correct. Krzysztof had the same concerns [1] in the binding
> reviews. To sum up from that thread:
> 
> For usb PHY, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 

But this contradicts with your commit message:

"Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects."

> The performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information.
> 

It is a shame that it is being defined as opaque values, but as long as you
don't define it in the binding and not use it in the driver, I'm OK with it.

> >
> > Why are these discrete powers domains be required? In my point of view, the PHY
> > should have only one power domain for controlling power and be done with it. If
> > you start having these fine grain controls over the resources from SCMI clients,
> > then it defeats the purpose of the SCMI based firmware abstraction design.
> 
> From what I understand, thse fine-grain controls are useful for runtime
> suspend/resume (on the Linux side).
> For example:
> 1. Enable 'core' power domain to enable the PHY
> 2. Disable 'transfer' to turn of the clocks. PHY is still powered but is
> "idle"
> 
> If we look at the patch, we can see that this is what's done in
> qcom_snps_hsphy_suspend().
> 
> Does that clarify things?
> 

Even though the SCMI spec allows defining multiple sub-domains inside a
protocol, I'd argue that there should only be one power domain 'power'
controlling all resources such as clock, icc, resets etc... But in this case,
that ship has already sailed.

> This is also explained in the binding [2]
> Should I rephrase the commit message here to include that?
> 

Yes, please. Driver commit message should be independent.

> >
> >> In this variant, two disjoint sets of resources are modeled against
> >> the power domain suppliers which can be turned on/off to achieve modeled
> >> device states. Two modeled low power states d1 and d3 are supported.
> >> 
> >> transition: d0 <--> d3  :: both core and transfer suppliers
> >> transition: d0 <--> d1  :: only transfer supplier
> >> 
> >
> > What are these transition levels and who defines these? We cannot have different
> > SCMI drivers inventing these kind of independent low power modes.
> >
> 
> Maybe the naming is not as good as it should be.
> I took this originally from a downstream qcom patch and did not change
> it.
> 
> I interpret this as:
> * d3: phy is powered off, before probe (no regulators, no clocks and in reset mode)
> * d1: phy is in lower power mode (regulator on, no clocks, no reset)
> * d0: phy is powered on an operational (after probe)
> 

These looks like ACPI D-states, which are neither defined in the SCMI spec, nor
used by any other Qcom SCMI drivers. So this driver cannot just invent these
states on its own. Just use plain wording for the function names based on the
indices.

> I see that drivers/tty/serial/qcom_geni_serial.c uses a similar
> mechanism. Should I try to follow that naming convention?
> 
> If you have other suggestions, I'm happy to get them.
> 
> Note that I can't change the power domains ('core' and 'transfer' since
> those are enforced by the SCMI firmware)
> 

SCMI firmware don't define the power domain names, isn't it? They just define
indices and it is up to the OS to name it however it wants.

But if it is defined in any of the internal doc, then it is fine.

- Mani

