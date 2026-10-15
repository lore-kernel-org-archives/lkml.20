Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7E13790B;
	Thu, 15 Oct 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074242; cv=none; b=c9pjmusvUTSV3bLTk+HKV3540m5WNUPz1P9Br542mBt4zTXj9dtvvBEZoaGKUSmc+bYWO+pLqPo5usJXhAoPrXmPOZ9flMYyR92odah26QvqDExPR80p11k5/tlOtuaaO//qdjTsbHGncN9riOBKrJ2EnboJ+F5Hwl1CxsoExqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074242; c=relaxed/simple;
	bh=pdUP+4E0PFul/ntaxN3QeS2tXyVUIDh58rshT54bwJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=clNN+13izaWOttpjYOBPolCIvRawhT5lwuXYip2IlrpFhz9LqHTNNPTe+EpG6CGlImAkVsXgaRY7YAyXQcWTYs+kMS/K3ckGGbP8SjfspGjimIjyGK6ayX2JqUmUKcPWdu0/6NlcJeFDPQgW4irH/aP6cM95YxhJlBrX9BfsiYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjnWGMyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjnWGMyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26AF1F000C5;
	Thu, 15 Oct 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074241;
	bh=kAQvCi2NgTn3vfjg1SkEBfJE/6zrPOW3vHosweeArbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SjnWGMyCbmD0su9hA+XiQM1geHSMw1xk4W8g/sQmzPo4KjdiWvcmwkzng8JoxAOuY
	 ucjh2DBxE9pXF80393L4VO6ULkJQwBEOSFq2DT9tHo/1kHtUHqSDKjHUQQxFSXMhwx
	 DfpkwvLwCOwzpoYA4M6xjFYqjFbPm8yiTqQJRA8nTLImagUdURXQXbKvA8Kv1HbunR
	 8xGpqg+ufNI98qsa0ZeQsZ48juTGJyPAoYjA5w+MNNv4/u5oXiSQG5RhfHA5TFLiM6
	 JxPNrRIZVvrZp3yDWlcUgViQaprrxx3VZTl3E2+5SUGeLLe6JH2+WcVAv8YNdygEYy
	 1pxeKdqVAjIUQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Sriram Dash
 <quic_sriramd@quicinc.com>, Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v6 0/2] Add support for SA8255P in the qcom-qmp-usb phy
 driver
In-Reply-To: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
References: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
Date: Thu, 15 Oct 2026 16:23:58 +0200
Message-ID: <xhkdby0bz59fl.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mani,

On Fri, Oct 02, 2026 at 11:39, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:

> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
>
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
>
> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "transfer" controls clocks and interconnects.
>
> Patch 1 adds the binding for sa8255p. Similarly to what has been done
> for I2C [1], this is a separate binding.
>
> Patch 2 adds the driver change, which is based on a public vendor
> patch from qualcomm [2].
> I did the following changes on top of that:
> * Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
>   of implementing a driver .remove()
> * Drop the .lanes struct member since it no longer exists.
> * Re-order some functions
>
> This has been tested on next-20260706 with a Ride4 SA8775P board that
> has SCMI firmware (which is compatible).
>
> [1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
> [2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0011-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch

I've talked to Vinod at plumbers and he told me your review is mandatory
for these patches to get picked up.

Could you have a look at let me know what you think please?

Thanks
Mattijs

>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
> Changes in v6:
> - Applied R-b tags from Krzysztof and Neil
> - Link to v5: https://patch.msgid.link/20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org
>
> Changes in v5:
> - Move 'core' as first domain, before 'transfer' (Krzysztof)
> - Reworded binding commit message to be more precise about the various
>   domains ('core', 'transfer' and 'perf') (Krzysztof)
> - Dropped Krzysztof review due to the above binding changes
> - Set .num_vregs=0 since regulators are managed by firmware
> - Link to v4: https://patch.msgid.link/20260724-phy-qcom-qmp-usb-8255-v4-0-a90014fab476@kernel.org
>
> Changes in v4:
> * bindings: Use additionalProperties: instead of unevaluatedProperties:
>   (Krzysztof)
> - Link to v3: https://patch.msgid.link/20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org
>
> Changes in v3:
> * Binding changes:
>   * Use a separate binding file (Krzysztof)
>   * Remove 'usb_' prefix from power-domain-names (Krzysztof)
> * Driver changes:
>   * Remove 'usb_' prefix from power-domain-names
>   * Moved sa8255p_usb3_uniphy_cfg before sa8775p_usb3_uniphy_cfg
> * Link to v2: https://patch.msgid.link/20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org
>
> Changes in v2:
> * Driver changes:
>   * Fix comment typo tranfer -> transfer
>   * Fix print statement to add a missing '(' in the string
>   * Use dev_err_probe() in qmp_usb_domain_attach() to reduce log noise
>   * Fix pm_runtime_put_sync() order in qmp_usb_d0_to_d3 (Sashiko)
>   * Fix runtime PM reference leak on usb_transfer (Sashiko)
>   * Fix runtime PM reference leak on error in qmp_usb_init (Sashiko)
>   * Reorder qmp_usb_d0_to_d3() to mirror init ordering in qmp_usb_exit()
>     (Sashiko)
>   * Reorder qmp_usb_d0_to_d3() to mirror resume ordering in
>     qmp_usb_runtime_suspend() (Sashiko)
>   * Fix error handling in qmp_usb_runtime_resume() (Sashiko)
> * Link to v1: https://patch.msgid.link/20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org
>
> ---
> Mattijs Korpershoek (1):
>       dt-bindings: phy: Add sa8255p USB PHY
>
> Sriram Dash (1):
>       phy: qcom: qmp-usb: Add support for SA8255P
>
>  .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         |  52 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 182 ++++++++++++++++++---
>  2 files changed, 212 insertions(+), 22 deletions(-)
> ---
> base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
> change-id: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9
>
> Best regards,
> -- 
> Mattijs Korpershoek <mkorpershoek@kernel.org>
