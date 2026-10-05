Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A73386426;
	Mon,  5 Oct 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194874; cv=none; b=ssg6eo6KyKrbpTNL8t9LQ19vNrIm4ZyTaB9RsmER3BxBuoULDnscQjKXd61MXtM3YAOQxV46Kk/ElVPwbdExMsHW+HQLDpeg4gHnA6IdVMfR47CBg9wrG/pgziiZZDKWwlnWn33Ee8qpe1xpVxTbAmOXOJkBL3YcsmMAI1szwdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194874; c=relaxed/simple;
	bh=opYv/6JOmK/l89MBwh1tKXxLMTfTCEG4Xg0wfM2Hi5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENZk0IOX4vAH90EJuuRR+1Y9Ejc7vjlbDJ2WzVdsjYc4fxm7Xxe4gsTtaDCUURXi7xlNYyBc1K50wTUDKdbEhLOhRr8sUs06i/D8+2wDQHkVC5tR1QfRRJXolHHifPUnTWbukD2sV5BlRmj+sNR4kduhGnOrnbOeGPXId50RtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0IGPCmo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0IGPCmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEE81F000FF;
	Mon,  5 Oct 2026 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194872;
	bh=JNnXFWmwLPPFEi6jlV/oyQsN1wGX9viqM9jVVnzW/i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B0IGPCmopouwW4cNU/iiNXWslex16ZrFSaZWk+rbei8IkBWTpW+mED5m/GCumV/SG
	 no1UZ2WJcFvrMvhahxidGR4x16U22EUuNdSo9xlSIXCzgCrswGOEHXw2uLo0iJHyej
	 UHnHWlnebk77fBHM5YQFz7A2vQaetdbvT2ZgkSU8vHRajSAaDSOqL3mP7yiqGvHhMV
	 8Z9PVedgr8kj0Zes5R59C5QAHsMKhjFbGMGgkyhC3uuvWSjP0GiGcIvXxxHLrr6klh
	 zMSJC36ju56wUgtTZhl5qWESGlBRce+PaxkQPqpPVnJ3A6xHHBTSVZ/oHZPRjYQ+vS
	 dWU0GX10jyF1w==
Date: Mon, 5 Oct 2026 12:07:48 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Message-ID: <asN29Gi71MIA-2fq@parshuram>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929020854.1282339-4-a0987203069@gmail.com>

On 29-09-26, 10:08, Joey Lu wrote:
> PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
> PHY1 control bits shifted 16 positions relative to PHY0.  A separate
> driver for PHY1 would duplicate this logic, so the existing driver is
> extended to manage both ports.
> 
> The original driver polled only DEVCKSTB after releasing PHY0 from
> reset.  When USB0 operates in host mode (USB ID pin floating or tied
> high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
> exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
> phy_init() call from the EHCI driver.  The init callback is changed to
> accept either host-mode or device-mode clock stability, whichever
> asserts first.
> 
> The power_on and power_off callbacks are replaced by a single init
> callback that handles PHY reset and clock-stable polling, because
> there is no PHY-specific clock gate on MA35D1; the PHY analog block
> derives its reference from the HXT crystal.
> 
> A read-only USB role switch is registered for PHY0 to expose the USB0
> role to userspace via the standard role-switch sysfs interface.  The
> .set callback returns -EOPNOTSUPP because the hardware mux is fully
> automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
> is not enabled, the registration returns -ENODEV and the driver skips
> the role switch gracefully without failing probe.
> 
> Two new optional device-tree properties are implemented:
>   - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
>     codes to the RCALCODE field in USBPMISCR.
>   - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
>     the over-current detect input as active-high.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/phy/nuvoton/phy-ma35d1-usb2.c | 286 +++++++++++++++++++-------
>  1 file changed, 211 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> index 9a459b700ed4..547c7d55d8ff 100644
> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> @@ -1,11 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) 2024 Nuvoton Technology Corp.
> + * Nuvoton MA35D1 USB 2.0 PHY driver
> + *
> + * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
> + * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
> + * PHY0 switches automatically via the USB ID pin.
> + *
> + * Copyright (C) 2026 Nuvoton Technology Corp.

Not correct, this should be updated to 2024-2026, you dont drop the
copyright notices, you update them!

>   */
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/io.h>

why is this dropped? 
-- 
~Vinod
