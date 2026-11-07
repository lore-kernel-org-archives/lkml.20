Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075736;
	b=WYnPih72nvRAhBp2NVgUn059ejJr1nTK7SZK5xQKP3E1QVOrKzyCWxg5DSMRojxsMXHf
	 4g+ZoXRt2ZWyHV0k1c5gS9rsOgeZtYxWTfv/hMtkdWZ6VA0Yy1YKGOi71l/S3i20o7uow
	 FxUPhVF68KrItJHr0PlWwp9a0QD523Iyb9zQ2GryLodz2fBDUkGMw+uqjcbxBTp4dBic2
	 DcqsICm2GF4/cLMZaEE+FojZEtHNj3toppfVmuVZx9iAFlSPHPE2qy1zjTfN7bdKzIr2Q
	 2uRrnqmV2m8uu/FUbzkiV48Os/ykAV6soIzxXyvRlzspi9DuyVhiKKG/2cI/2grxSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=;
	b=oTwfpgsExTZ/UsPYfatdi/jVKctt35h9be8AcO3eHgTWlIyePneQnTkTMLu1n+QBZeGP
	 betsdxRR+jDMtEbyzzgpLu+vVqrUj9d0JKMLSQyK7qUtyVFXR1C6MMrsE7Tprid2TU1pU
	 MztVI9S325WNCT/U3BybSagRCsFaz6QctksHLR/qloPNuyWsDr08GtI9mm1vxalHSHUOK
	 933k5SLdmOYxjJDn+0YOSLAQFczRwMbkNkEgWmHW22Ha2qs9rAgLVHL0Fe0B9CCBea5pF
	 YCf1O8qotW+BLPAdWZ+9mZmlPGLJ6qCZlqolLFWaFbviKNgg+oMv2/hqCyV3GNCBbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNjPfhEV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNjPfhEV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13575905e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075734; x=1794680534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=;
        b=vNjPfhEV9Pka0KLIusKIQvFHSdjtKDDD36PpAkKVW31mLlJKdaJ2k0vxJ+1SN9YiTy
         QAl6Irw1iRjnvpKfvQFIU0s+z5WhWjZ1XUrd9cquNBiMA8vI+LNj0k6PYpUkiRKRAT6p
         iRheH3rILf9pn2OuY9TQd6CRU5e5y17kReb4+nh4BsNIRfIXBGV461OrazP6UfoH+4mN
         Co/bQaXt6dAHqLnDeR//GcWuj8hJb7q9y0Ir47LS7cz2XhqQAIQUIkf7fixSvdOow/QP
         j5XJi3aamX0wk1GUGIAOQUXdIEXTQ3wAVDvzhAqLSuXEuhAzVgKlZYQWdWspLO+jRPcJ
         JVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075734; x=1794680534;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=;
        b=XyeK5oTK6SUEycGoCYmWaknr2TfgKwvyeTfoOB53dUrt2jfAU3of7D3IJrywgRHLIB
         hd0CP48UdwFbh8xfiHErXwBL3oaHy8RLKZEmQ5YZGFYx/UmZThpLB2HLa7PHASK0J8lE
         +V6xx0w4drEIRjxlD67tFWn1pWmyHawUyEkIQry95UXXEkFB5rlMqUcLn40nYwqxbMdY
         lX19bJM2IrjEPnLd46R0SAL9/CRpJ4fpkk/+okL7LNFKthEmGO4cBu/8OoWBQwpmHVKH
         pRaDr0oQGLi9AgP/BA6VtYDfvBmHjXh+ZweH+CyubvYJWFKkwj0ita7vX0CCS+vaSjLl
         DNTg==
X-Forwarded-Encrypted: i=1; AKwUvBx4uCrSUMLAtfrsSbhs8cvYTp60G5FFYuPFeyGCRrjEQa8Sr7Ap33OOw45HUb+AesIR5l/VyEXH6iU2ZQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80GLJY701Pvgd5dGskCPAR+Bk1KffxVjg9m2IkufixgNx9lTs2
	hLvBEtFQqJ5Iputb7JKNNA05FsOc/xyUXh9I3N2AiuP4idlEO9VHCaIG
X-Gm-Gg: AYBFou2MChbRdoS8Z+MAbEEYiefLgxPJFajzBctLFlMTpSfge6EgBJmG/9MkvKM1TPp
	vuaPBOqK0Z2bkvfOcs30je7EhSFQL8E7NA2VqsXhVy62nK+Su2YwYRC8gUFWYOUhrvqAHZJYrxP
	+QKEU0fd4iGi94CEyy/4a7cYAzuQIYTj7WfeUEV3HwDDw4KyOUIO/d/TLE2tPvwyizoB4M/DyTG
	2Oz1KzhJSVJ7H5Qq1NebYd4advwXPqyj+3z/0H65Q6DgkT1ige808WKnIGIUikxXOhlkHNBKvSx
	kLesPIPRyvjrWsPs0ynvBLzqZEEU+ZCjFTY2uqA/m05QbxX9oHuS9Vr3udORoePy80S+QEqFFkd
	uy3/7VKotydbiczjJJ/+mwdX1stvhSNXjyJ3bvYvvMPZ/7f7O/gMGBXk3u5xqWWDTWx8G7PZEex
	BHz4HHoAw7Cb3/EEfBphJ/cX9MzAL4YXw3eszpk+ZR6tFXx0kN/s/YpdL2UJxVWYMVfdZrdzpiS
	yis0KUMza6U4/5RzG+KB62NPhQlLaMOw2+YjS58zYS7iSO68sCVcB0XThpWtcPWE/UuDZEk8YDr
	JxjQo/0iXwT6qeHxL42p/XkdHnugoKbyQVJlyNBSL3TglqF0dV1KMH7pzJgIImAJEbbuCnLlgq5
	w4UY5KWMoJ7FuF3bA6FPQ8D8oDb6CXDLtVV5B
X-Received: by 2002:a05:600c:348f:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4b6de788f12mr102711915e9.10.1794075734154;
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:13 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v2 0/6] firmware: raspberrypi: Style cleanups and fix child
 device lifetime
Date: Sat, 07 Nov 2026 19:21:30 +0100
Message-Id: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NTQqDMBBA4auEWTslSTGhrnoPcRHjqAP1h0lJF
 fHupZ6g27f43gGJhClBpQ4Qypx4maFStlAQxzAPhNxBpcBq64zRHnveUEJaWxLZV8aeZfoEIWz
 pEZ22nfNlCYWCVajn7aLrplAwcnovsl+nbH71DzQb1Oi1vzsbvdGxew5T4NctLhM053l+AYDyQ
 Q3AAAAA
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=0rEgn/6yzRAJIGB+6WT8d+hJikkPqbyZkdSE8/Lf2L8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xV8RRfQstVxHlzO/Uw/9nrDdf3i1iA4/BKs
 TEh1kgTbNqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z2ZcD/0d0jRDf27K/pqicnJj9cUKv/CamEep7l9ryUSiGGLLSJIg3q0Xv+TjC9eSoBHMyG+KOOF
 0bkwyldbA9hOxWtKjTjPPzWL01c1TzWK0uRB6cdCYVMPtqYS9Gl5OB7eNYCyz3bgyIE4MhQ5/hL
 fuyD5ahh62gfkQ6rvIq7HawHP36v3U3yxZSJe1v+5THrE47/MOF3YxeCvzpZn6SE3TbZOa0iowr
 Ln2S1MwDY4WPIYYOU5l7ZDWtwzpcvokV3xBsG79w+J0mGJ2yGP3suAcLzUpbPWwwOj6xiRvAngY
 uGVDzXKLia9mvXL+ccIYXt6B2GNDqTF9zS/YO7xQmT3Fwgcc6mGZaqSiaQpSpWzid1CNdHmUQKE
 6Wel9sAnv7sdcvKQ+Xz6NTVu4l6bCFpbxXIkywmMkElBg6OaGRHu5ZY+XrKvGTk73gA3ORrkumD
 6ZIMYD9lbK7prNTKvi7K6EZ8L6nUcsvCceDfn39ZxIAotVRQ96dGKBbE+Jd9uAOSOT2vdaIFact
 SsZzJtuvKmcF2gNHkYu4OcbCfiq9ajjq71W8YRfsTnDp2MJU0vgU8uanNGSGyhQJi6+eqayxReO
 I7wovhglVMESvA4iGcpHkCLZwTHoMxD6aa1rwnhYmPVQrhFkxtqW0shkRouPv3rGpcKQCwuq6MQ
 o2iB7DlsmRRvyMA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This series does minor style cleanups in the Raspberry Pi firmware
driver and fixes the lifetime handling of the hwmon and clock child
devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch moves the hwmon and clock platform device pointers from
globals into struct rpi_firmware.  This pairs their lifetime with the
parent device and prevents leaks or incorrect unregistration if the
driver is probed more than once.  It also checks the return value of
platform_device_register_data() so that an error pointer is never
stored.  Registration failures are not propagated because the child
devices are optional.

---
Changes in v2:
- Move platform device pointers to rpi firmware struct
- Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com

---
Sander Speetjens (6):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Remove unnecessary braces in transaction helper
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Store child devices in struct rpi_firmware

 drivers/firmware/raspberrypi.c | 61 ++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 23 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

