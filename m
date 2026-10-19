Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB94E2F3A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412937; cv=none; b=elQb/iMD/3W1e7fE6nAuCp7dDU+tgu/YeBgXp/O3eZRCr99h57rLzCb9crmRsjkzKxqzZqGC/5NHq035wSlKtFy1aKWS85lWCSjba1pwN3h/VMaVkjde684TcY0gJ2Hf9lDW5jqqW1VTDDLRFafThYhJ08nN6gfJ80zADxXnltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412937; c=relaxed/simple;
	bh=wDHb7dzaQPQ2plgxG6HfV+TCBJTGWZkoD1BwHBUXyTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2CaAkmRBkySAgRFL/9trAiz9jGdldAU8BCPSwQhd/cBI+7SxEs+QYa0jNQtI67ujkJ6bu1WmIqoW1jcP1Bb8uEf+6cYDj+XvL9bpPZqtF/ah4fEt7euJP8DJNXTZlbQoNgRLn+Q2+eVV6bYMFpUvANCOJOwnpmCDf8ngWVJb0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pY47HI11; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pY47HI11"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3483385a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792412926; x=1793017726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUCsiNFq6vP2rgFSeWx5eYQ/F2LejIwiLiOUAjRGo4Y=;
        b=pY47HI11V6PetEkI3UgclvGDYHyaI5ZMRE9LDiKW6Tolz931QxoBq0q7XaejTD6XAn
         MXJG67G+GkUv0uBEnLuE4SwsCGfFFJ1f8CphqC7e0EnXS9QheH74dzxBXkNJtFqQCw1v
         9AAkTh2t8CcK4rhuNguSACKd98GaHjl6Wmwz6IoM+RoK5qbkMV+H9ahFmHT/+8WX2X/0
         cbXQR6xrphQGi/ddcGBKja4IGM2FVQiUuPEjHF9N3TpHKI9qwSZt/6hKhCsM5Acy+wyS
         azimIaKP7X5OgE4raxKMPFNIUUOLY+Y3XSAhzojdbWo5BwQaIOibbjvQEJlGqv0liNn0
         c5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412926; x=1793017726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUCsiNFq6vP2rgFSeWx5eYQ/F2LejIwiLiOUAjRGo4Y=;
        b=zlKhMIUaOsIhnee0N0GkuVXC2Mt00szo4u8VbEIo6FVNpEjg4q9fXUI3SWpbUo+n6f
         0vG3L0KO90EDcXX8EUaB0t1Yplon29FAav3UsH/1YNvoKyZvP2D/1398DowpqirDeOjH
         bTp8XjLt1CZKjMvAAIuMlCfjJcxXG0H/g8qdGjVSSuVFlKfGGOFT7kLNStRKUpHBx88L
         uKBy9rQsJjSGySqJkAsHMqL0ak6/9Ehwwh61fI/DvXDq+ZFHhe0JC8YgvxgX0twEY6L6
         bmFMCwQ7jRv7Z2Pt5obkk97Hq/ESWD2C/C9buxbCkxxPG3L0YMwBHFwV3vz7lAWCSTlq
         a/Dg==
X-Forwarded-Encrypted: i=1; AKwUvBziD0K6kpce42yR02uJJe6/ZCdtHwQWEq2pSzPaHIFowmayO4l+PhMHaOSpMaukPBEFObm7lADjJagDy3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Frxr9cWK/YwZB/VUiVQIXkDzGl6z+m4m7o7yzezJO0UyXTbH
	Q67Z+Ly3PD/q7IdCoSKpTN+7++LCtBTRDCq+NXDMn/8MKD9BwT1YZZmi0ZRX4m7fciY=
X-Gm-Gg: AYBFou1Qkyzf3R63xaz1CwXIB9azG9nJSoVknryWGZlRDFO+9UkkgW0l/PVfnx4DDhz
	j00plApgCRWWiC95WJPgzueZ/SI/lEKfU1EZIK7uswhh83svrLnfN27EIbwwqjY7mXhCW48OrYx
	+xAdcuYXFr4lHiZmbTx7Y1tHGokMzjcqb4Tatm0A8RVLHyNcPGOOzrFb83n2shnCY/ukxG8gcTh
	yx4vs7Afpjvh/qvpdXpy+NND8r2X8UkMFU7LIk/cwYYQrQ6+zR54vAO5mXEBimnrLSVvVpFSkLt
	t9NyPb4uSI+S30D7g0J+hFQzHvEJ77QceyQIADamERFvgxs5LR5MuZHyT9sVW0BS4ZTgarVUYPc
	N2hZ0bfqi50y5/NAFOZWSgMXTlGwILeddO1e/pizg/MflLYluo5Rhnl/dz5tmFjI9vizRE48ijf
	sakXbFTwxIuLUoVKQIJ2rQt1P8ldCKaNbHYbfPNTlKe704Qdq4SfiZMPPykTCvTXMP/z6yHTGog
	bpxqevq
X-Received: by 2002:a17:907:944d:b0:c31:b89b:213b with SMTP id a640c23a62f3a-c419e231a7dmr515664166b.18.1792412925084;
        Mon, 19 Oct 2026 05:28:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e3284e3sm350775466b.3.2026.10.19.05.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:28:44 -0700 (PDT)
Message-ID: <48889e4c-04b3-4b50-b144-0d42ad2dbbc1@tuxon.dev>
Date: Mon, 19 Oct 2026 15:28:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: rzg3s-host: Fix NVMe resume errors after s2idle
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005110224.17160-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261005110224.17160-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/5/26 14:02, Ovidiu Panait wrote:
> On the Renesas RZ/V2H platform, when ASPM is enabled, resuming from s2idle
> with an NVMe SSD connected fails with:
> 
>    nvme nvme0: I/O tag 27 (001b) opcode 0x9 (Admin Cmd) QID 0 timeout, reset controller
>    nvme nvme0: Disabling device after reset failure: -19
> 
> This happens because during s2idle, when ASPM is enabled, nvme_suspend()
> does not shut the drive down. It leaves it in D0, puts it in its lowest
> NVMe power state, so that resume only has to restore the previous power
> state instead of a full reinitialization. This assumes the drive keeps
> its context over the suspend.
> 
> However, rzg3s_pcie_suspend_noirq() doesn't take this into account and
> it always powers down the controller and asserts the controller resets,
> including PERST#. That resets the drive, and the command the NVMe driver
> sends on resume never completes.
> 
> To fix this, similar to the dwc driver, use
> pci_host_common_d3cold_possible() to check if the controller should be
> powered down and keep the controller running otherwise. Do this only for
> s2idle, as deep sleep could power off the SoC and neither the power domain
> nor the driver will restore the controller clocks and resets on resume.
> 
> Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
> Signed-off-by: Ovidiu Panait<ovidiu.panait.rb@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested with [1], [2], [3] on top, so:

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

[1] https://lore.kernel.org/all/20261019065025.2146539-1-claudiu.beznea@kernel.org/
[2] https://lore.kernel.org/all/20261005111157.17256-1-ovidiu.panait.rb@renesas.com/
[3] https://lore.kernel.org/all/20261019122501.2423969-1-claudiu.beznea@kernel.org/
