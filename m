Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E747ACDD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983241; cv=none; b=QMAWKX5VUGReF8+I9h0PSDq2Cul7KlrRvbPukzjXE3zr8Jr86MQsBakkFkaCJ/10kHd3e2IJ07taYEdIg974SYum38q5he928wR8wqcTd14aF2llAvPMkNMhI/GG0IAUOR1c1c7tPxdy1/6ek/pfPQzTL/p3mMqn4E8lPTjJUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983241; c=relaxed/simple;
	bh=XN3wD/6iJbpsCLQ3BC9IBxI/UKlc9BPOHOZWc3v6tGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RM9koXBsrBQYjrgjDEOTu3JF9Hl4NcVDTONRwq4pnOSxQVdtRkmDudPZNv6z/4wRNKQf+vlHigwA64nMh2J+gEwUAPFW/kPrabhRFJM0pLIqZuSYmNLDSw5LYLjqyDPQxvPEWU0S/RHL/FaqKBzF7WNl34zQUVDybJ8rUbWFl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE8mMlAv; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE8mMlAv"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so2291733a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789983239; x=1790588039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3HW33qzxdGN9L2D3gidyxoorUQE5ncddhmxh8u52Cw=;
        b=jE8mMlAvtBe9TGkrEzS6U/M0+iespgMyxlU25zlYD2ftCsGyCRSCD6jaTB2719kNS/
         qQPk+mPp6UUACPUIPdi5L6Xh5CuS3qGBjQVp2ulp+5J0rPB57TrxRBtU2seSBMoAvJYv
         rGzhKu/0NNc8HqLrMAEEzYt0CVWiDMVoFA2zhyMu55k9+Se+Nvunyr0M0bfnWsiztZY1
         cnMyYY8TMpbrdPIwUJWhyWK4NMnI1IhMqCWmZab8PfYp5ozp/IEH77i/lVSYl81JAAJl
         EVCVyXOJcgktkdbNwRbOLHMIq5s17zjDbVdExuiZUP77Hr3b9jGhNjqUs2ZMSCNEg+UY
         /Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983239; x=1790588039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3HW33qzxdGN9L2D3gidyxoorUQE5ncddhmxh8u52Cw=;
        b=OJqqdEogqhqtWvCnVd3GRx58/7uXCple38lrkpbfDEwO57QR77JYiTCl9ac/YqkYbW
         D+2eFqj3COjnsxigM3R18cVFKorrvtGOQimFOHTQ7zwjChRnYdYul59lPPiMAYlspELj
         usak70fAXZDXCYN6ALz/9NgPNkvzkki34oqOtcTTHj9bVvWaAi23zBnxcWXkQ6jAmFme
         5q3s60fFTkUZeiiyNClO66ukW6XhmdxjVG4ofeEfYOyEcks9Qu+G22ky2Y5ezPpwYDGd
         YHr+hj4dZYACMte2MEOheTUHzHPbMX84JeFdHhECTI9fn5vKIccH7Z8FGmiapXP39Gbb
         aSUg==
X-Forwarded-Encrypted: i=1; AKwUvBwo1xpN1ayQGNX08ZIeIrO+N40GiMoJ2pqXzsCizD2zk2sclwI+XvPJQX6aFJU6kP8YYVNtVMErExVGdCU=@vger.kernel.org
X-Gm-Message-State: AFuF++mzJDOB7eS0zgo+A4kFv9fxAxdUXIq+5nabK1mZYi7ZYAm1OLqy
	j960XYmMYEGthwDOb4KOzz/4cSAG6c2vef5JPWyFPAH+VYPDvUeSCMFIV0tsOkEo
X-Gm-Gg: AYBFou3X27jnMyedO51SFnfM1G72SHn1riZdMXtjWTqmnzzhF/BwMvqDn57IA/Gqa2Q
	7ylNm1qwv4FGkfXA7HqP0ytG5C2fegtXQIsFVMAs8jsBvJDvZSNPBMfWsdfok+eR8zorRZQ29Ya
	iHN8sSXZIdDDpc6AApAQ6XSNfpvDirQRSf0Ar0vQphi7MP15isQV6rb6/4vV3wFLdxEkNPQIdRo
	Nb42Ksz7+lAm9NOSVkS184qmOQuOvuYtCFqwnzMIBHxu7Zg+gtewyX2z/MaHFLgrsx/P5sJaPH0
	S7HEpDdqgUzyI0OVJFPmpUXh6ouqzm9NZqULoBu7cY/nqzTGsXsA4SPRulYeM0YP65HkDaVXGt9
	6EsRr+qVxx3/1Vjtr4Z5llcHClG/wkMpXvY4AW1huSmxoD/Y+6aTIYTl8N0HekxY4keQdEVx6Us
	1msvFEnh5GdqaN4b8CLm7bWphgmL2X9mvUIJ/gP6Kwv863qnaaJk0qyjSpg3P/WKOgnOayg0hm9
	MmGNAZj7wLpgkMvOhOnjKstNB0LpOtK4Xc=
X-Received: by 2002:a05:6300:85:b0:3dd:a006:ed94 with SMTP id adf61e73a8af0-3dda006ee05mr11552164637.42.1789983239113;
        Mon, 21 Sep 2026 02:33:59 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae72a38sm3127884a12.5.2026.09.21.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:33:58 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	bryan.odonoghue@linaro.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for ARM64
Date: Mon, 21 Sep 2026 17:33:39 +0800
Message-ID: <20260921093339.261306-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
References: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan, Hans,

Thanks for the review and valuable feedback.

> On Thu, 17 Sep 2026 15:30:00 +0100, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> Thanks, but there's already a series to this effect under discussion:
>   https://lore.kernel.org/all/20260724025959.142826-1-W_Armin@gmx.de/
> 
> I only now notice the second patch is not covered by Armin's series.
> But this duplicates Kconfig entries.
> 
> I suppose the best approach would be to split drivers/platform/x86/Kconfig 
> into two and source the generic one here.

Thanks for pointing out Armin's series and the Kconfig duplication issue.
I had review Armin's series and make sure not to duplicate work. Regarding 
the driver location/Kconfig split, I agree that avoiding Kconfig duplication 
is necessary, and moving/refactoring the driver directly under platform/wmi 
(as Hans suggested below) seems to be the cleanest path forward.

> On Fri, 18 Sep 2026 09:38:04 +0200, Hans de Goede <hansg@kernel.org> wrote:
> Yes ACPI / WMI is used on some ARM64 laptops, but AFAIK all of
> those are currently still booting through Devicetree since
> the current generation ARM64 laptops is missing various info Linux
> needs in the ACPI tables. So for a fully functional system 
> Devicetree is necessary.
> ...
> Questions:
> 1. Has this been tested on an actual Asus ARM64 laptop or other
>    ARM64 device? 
> 2. On which laptop/device model ?
> 3. How was this tested, how was the laptop booted; and does booting
>    it this way lead to loosing any other functionality
> 4. Were any other kernel patches used during testing?

Regarding Hans's questions:

1. Yes, this has been tested on an actual ASUS ARM64 laptop.
2. This specific model has not been publicly released yet, so I
   cannot disclose the exact model name or marketing designation
   at this stage. However, it is an upcoming ARM64 platform 
   featuring ACPI firmware.
3. The laptop was booted natively via ACPI firmware (UEFI). To
   verify the WMI functionality without modifying the base
   distribution kernel, we built and tested the modules (`wmi.ko`,
   `asus-wmi.ko`, and `asus-nb-wmi.ko`) out-of-tree and loaded
   them using `insmod`. The driver successfully bound to the WMI
   devices exposed by the ACPI tables and functioned as expected.
4. No additional kernel patches were required. Note that we have
   dropped patch 1/2 from this series because Armin's patch series
   already removes the X86 dependency from drivers/platform/wmi/Kconfig.
   Since Armin's series is currently under discussion and not yet
   merged, our v2 will focus solely on moving the ASUS drivers to
   drivers/platform/wmi/asus/ while depending on the WMI updates.

> As for patch 2/2 I think that if we want this the driver should
> simply be moved to platform/wmi .

I agree with moving the driver to drivers/platform/wmi instead of 
duplicating it under drivers/platform/arm64. I will address this in v2 
patch.

Best regards,
Chipang
