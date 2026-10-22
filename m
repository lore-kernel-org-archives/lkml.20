Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657808;
	b=zqkoNW+mnKx/9cx4FVaSImwrzx1OTw26nAYrNGmubdmAOGKgw7/g10tNqm9l3RJR6Skq
	 6VS629xz9fdiNLQwOHdk9M2885/yAbPHqhfGi8PU/ViD0lLDCA3z3HlFKkWDtySEwj1AP
	 2cdlYN5TwiLkJD9WyzRYK0ivvyMXM69t9aLW68Wjfz/NhYSVOgQaVBIN7XrDmQCL8tJKL
	 ZUJFC52lGtkWbT0MnVi9hzoyYzNYnH6DREaRi35TcA9Ba2DF6ojkCKdiM7njZ3PEYFKOi
	 t09fOOIDrWRccC+l7DHeK4rRUuuQGi5qtIRUMqnTrDP/67TTHqccFFJkzaBVPDBmmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
	b=nSmiBHwTmWypjqDN1n5XlNRNTKce1U/Q+3/iC7ExW6N5PfuVy2oXsMR/eaJ+QRggECw9
	 PpmErtR9oVBWiIJSKnTM9rX5adzixXhpnBBASUhL58Tp2RqvFEeQl8OtFMci9Myzmx/G5
	 SAoFC6vyq+Rrhjzuk6PW8esFchrYZH88gpDkTDuORSGS/lWu18X51Cj+vJBv66AfWu1Tp
	 wywxLSH+H5kMyR1GZGsOBDY7iy2gYJH5Ikt99XSxPEDcbLO0QOULxQVQEiseC3YQV+cFJ
	 rWkLePEmSYMvASZqymE3+0lXUOOmFgOpHSoHyM1HrWlPi0ZxdGoElgg87RLsklwVPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=tiW1LSiL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42961606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42961606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=tiW1LSiL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so965625e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792657805; x=1793262605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=tiW1LSiLFxHEnCtJ/TdykckO4cayeLefOX/1G7kiLugA4BrgYMer4CCDP1cB0iZYcQ
         EXjTIaEl4vsAjqkQB7fTM8R2TRwM7f/7nsV2utQvH0v4BQjCL3WAx5khRN6hW3PZzuqo
         BPwydEo4ydwKSIQSiFgRkc/HYklI6mNWPbBeeHePl2janKpZOp5IXNh6OGf9c3rSw+cC
         C3a5ABtZ5vlECX+VMStLZiqgB3UzNXi+vYBPVgsUwuRiPsu+akBrtUerwsmjFfKvIYL7
         do2Ro2544IXBqaP+yD3jxC9WT/AQ/LDNtZpyVNs9WSsgEl3mcroJJPehZoXMpa2eav2q
         7Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657805; x=1793262605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=UoLUJPnyOwXceIf3wRtkbQ+IX/FYzVoD5GZPVFl79LPwu8Lzz2hEjG63Gni0Ym7DJp
         YytQPRnTZggnZwC5wrzANlTjR0ZKyu0lEP4EIcZjAh12x0UWj6Q8ClE8brm9CFYb7i47
         07agepC0634O1LbRiR88oesdnBuLooPIRfONzJg4KgHjdQ2VHA/pdsk8fiLuElt6Hg7P
         37n8V1oAiTfMEZtoUPT/ufxkBD992iazhjsAofo3cCo9PEFpHlKQv2w9n4YtuJR5d/5a
         uJ8sib++gaOT4YP/p4Cfi6gsqBu+dnut2F7wHuFyS6J9aCA1d0NwMwGUWDXiw7ttvERs
         7+tQ==
X-Forwarded-Encrypted: i=1; AKwUvBygiJG8BpWo7/pffNlp3YUZW6wIJk0qtpE/xOuT5SwQIQSMIYX4lG7L9Oby8TvL6KIcczUbTuvVMaWllQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbpk2yN9wv/bG+LVZqN3vCdCwVvrJ+FAhNDpR1jnktv6vVSQqD
	0ekiTNa2TvvPr9XgdcQ9AlIg9tLwWuXvVCZdNZtk/RjG0YVJnt435y1YIuKfpnlKK+I=
X-Gm-Gg: AYBFou3amWYPteYynMr7tORRvQGTrjlbYpvXHDVDtwCwh0HhX0v+elfqQJFLm4AxANF
	dKh1SYEar2JwFaLQYyFAmh6yrBt7IXBs3t922cS0RFMEA/O6tJxljLXeDpisMSfFGfQcWaE2ZJo
	T5UbQqAJKFZKwZHD7SOTgSWeX01ReR5KH04kuBrXbx/XNSVL1Aj0xIFtdudGR1eaTNe1Xije0oV
	m2IHr+LjzInOzVpWpAtE9pT9D1J50P4eA3na15XRgbr3r8rBixjFBXQJj8ocug9GBmtjQiwz7av
	M6H04EckYWpEip7wQSnId+BEDkgagMAjd5rjRiZTVihGauudu60HQYBfXjVd0CRQxKukZuvIZNo
	8zM44fKSSsW/9uPFkzWiKYRT3BWvGdoAJ94tYPM+HkWn7Wq26kMql4LuumL8OS9wm+cpuCz68um
	dmqLY/btvAgN/jPs0lqaGsHesvN8t5K5DWqOwwisURIrJVUuCDqgyivJykiPrA7HS6gWT4ch5OT
	GhjUdWhOhKMa9ipgl15xWpQForJVjnOd9IK2XaVeZOYvLePhpOOCQhsnTCG+wbbCJ5/A9dffFSB
	6rM/8Gk3CpFdi7MmcA4XJgDXsQePYtoJjPql00XYmhd4fPsgACRIoe16dGE=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a2001aa316mr79122885e9.0.1792657805302;
        Thu, 22 Oct 2026 01:30:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8429-85a0-b901-3ef0-11ff-fe45-70e0.rev.sfr.net. [2a02:8429:85a0:b901:3ef0:11ff:fe45:70e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a62aaasm53713635e9.15.2026.10.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:30:04 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Thu, 22 Oct 2026 10:29:24 +0200
Message-ID: <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
(both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
not detected anymore (vc4-hdmi is not affected).

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Cc: stable@vger.kernel.org
Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
Hi Greg,
this is a regression introduced by aa125180c673 (via your tree) in
6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
7.4-rc1 has not been sent yet, could you take it there? Otherwise,
staging-linus would be great. Thanks!

v2:
- Reword commit message with more precise description
- Add Cc: stable@vger.kernel.org
- Remove redundant Link: pointing to same report as Closes:
- Collect Tested-by and Reviewed-by tags from v1
- Link to v1: https://lore.kernel.org/all/20261013131435.1454019-1-martin@wetterwald.eu/
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.56.0

