Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF421530DED;
	Thu, 15 Oct 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074247; cv=none; b=piWyti11ukAGqDx7XvHkphPjtgpnFeYyb7FAtDS9y1Xp2O4hlg5aBxHvVn24lrNBZqRHW0HESyrGejrfwk+BeYsw830h2FYWjO+qBkxJg6qLfwGJfYT6FhO2YvUfKOHytfnDSYAoy+92RO349HpA5EyCl4bIo/+rkEletq68vV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074247; c=relaxed/simple;
	bh=TBQ+QapvJjTw21gzs6XwpNkp0au7h4sdKEHWsku6hs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K+7RbtUyy3KGMWSud7yioxPlJy+nSKlYysulh2yTtmp14m/Qy2vUliMBo/So/BPs876wl/SqdM0ELneYWlWLugqerGB1qf4zOWOsz+cKSlDIpfo+IziK9X8SSQdbMdM1fIqPxezOw9XcoWozK7XRUTRunvL5lDd4x1ECv5N1o1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mx//5sdl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mx//5sdl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6061F000C4;
	Thu, 15 Oct 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074245;
	bh=83o5oAGezQuqWB70mpgy17Ppmc2cKbsFE/dC/tCNuqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mx//5sdlbCAlDhmo/AwHO0AHYj7cFO6peARJnidsstXroYzw2oiGGzmkMKngYcnUO
	 yqGLIfzzdKp3ReBJ37LGo/1Zj6YStJSQZa8kzUJBFSbd+dCB7oygBd0dMWSlZ/spG8
	 k6z7XC7y/tYZrlH0XSS5vYukh0WRtDagwTcKg520mmpfd6/bWezvZAdNjJpPTnTeWq
	 0Oi9f0i7xYQtXLZwHbzHaGr9ptwYcSSXMg58BtOUprkvguxQ7GZ6RZejz0jDNd9xtW
	 fA/wvOHfYRAdO+Q55pEcONMNaAAj56kwfLUh6O4tOnbJYOv+974t0AfAe0v/igwtiR
	 o1+aiIoTpN7FA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Manivannan Sadhasivam
 <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sriram Dash
 <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v3 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
In-Reply-To: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
Date: Thu, 15 Oct 2026 16:24:03 +0200
Message-ID: <xhkdbwlrj59fg.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mani,

On Fri, Oct 02, 2026 at 11:41, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:

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
> * Changed power domain names to drop 'usb_' prefix
> * Fixed various error handling paths
> * Added suspend/resume support
>
> This has been tested on next-20260728 with a Ride4 SA8775P board that
> has SCMI firmware (which is compatible).
>
> [1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
> [2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch
>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

I don't know what happened but somehow I did not add you in To/Cc using
"b4 prep -c"

I've talked to Vinod at plumbers and he told me that I should request
some review on these phy patches.

Could you have a look whenever you have some time?

Thanks a lot for your help.
Mattijs

> ---
> Changes in v3:
> - Applied R-b from Krzysztof and Neil
> - Link to v2: https://patch.msgid.link/20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org
>
> Changes in v2:
> - Move 'core' as first domain, before 'transfer' (Krzysztof)
> - Reworded binding commit message to be more precise about the various
>   domains ('core', 'transfer' and 'perf') (Krzysztof)
> - Link to v1: https://patch.msgid.link/20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org
>
> ---
> Mattijs Korpershoek (1):
>       dt-bindings: phy: Add sa8255p high-speed USB PHY
>
> Sriram Dash (1):
>       phy: qcom-snps-femto-v2: Add support for SA8255P
>
>  .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 +++++++++
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 127 +++++++++++++++++++--
>  2 files changed, 170 insertions(+), 9 deletions(-)
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
>
> Best regards,
> -- 
> Mattijs Korpershoek <mkorpershoek@kernel.org>
