Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597745;
	b=VKAEYFxNGeUl5t1GavvYu/PnxGqJUZ4TmVQvlflsIL51POV+nLiDPbughQw4qQtdITVg
	 iuQ/bDcTRzqgCPwfNfIOo+NlQoCM7BhBEizxmpv3k1y7CFGvVio3/oke2N7/P8V2N6fAR
	 VTu48kt6/mnqt1JxJ/CewuE3dCqIdLv8FaHwV4XnQ+CXySWlX4xxGXYNh+EuKCvAXy1kD
	 5nbl+yPY9+xnsI9y98zIYC14QXAhEJhYzfm/0XwoUBP52oQmjlph3VTA5IfWO0Nig9xro
	 QvP9CRpy4GxFwJgA0RfVRebEHM/65RGnXGoEHuArBOsV9npgdtLmjvWI7RQ30yvxcuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
	b=JBnuqRuG2S/Gtkg34YGfQvMao6fbfSfWsYsB2Jy7FcG4MimSn9J71oVjTEo0wEzUsr5N
	 +h6nO2zV66XaKJh55G5FXVl2mfiwRPOdXbPVSkaGyEeFUTotM9fsw1KXMRZY0a1bB4vAz
	 jKjLr4sEdQDKgGGRAJS0YsE8GvdmutOZonU1iJo1WDEsv/MP8GIrG7NeYBBPfxV7+PhLU
	 GTK6cV4EwgkUjIMVnKz6neDkNGqU/gvyeu0E8dgHzYuka1P4pJMF0YBXvqaYST07m6R1Q
	 SP8Za2ecMMQqdSwOVcRWMtG2oKjQKmM9fF8YnsnI8dadYOh3lmO02V9HLijNvJUwwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A4N/QRYq";
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A9606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14A9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4N/QRYq
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eafb65e204so678567e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597744; x=1794202544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
        b=A4N/QRYqxlmQUQM5NgraP6GtrDSTm5Or9yyQBbLE1y0EFL5fmfZFmL4XAsqgixxqOU
         Ix6w/+ya8D//KuqhA6Fc/4MG5fWXv+bW3mclul2wBczLziXY9BulzeqVH/OfhGUxPdWH
         JiKpz+q2gzRVgT6i46fwaVTrMOVxcUkksWXdq4XfRR7Wi1k5o9aXp7lzUKjZ0/WUTIQn
         h1J82d8SRY+jnFXgIywW1GX6Nh7Z3+6j3Dov7SioaLQ0ayeMPzoTQlUrMWtCQR9eQWb8
         kfZ0oDCAjcaqlQ7mhR/CUM7tRK78EtxJSV9FhpxGkdU1KHjrXUASil3wFLk09Z/oLSOe
         XWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597744; x=1794202544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
        b=vI9nVVTNA5jIDKiBtmlX9cQEmPej40D1U20+WsnMdRXTZOOca4q5r/4wFs44BKA+re
         oTVjBEHQHUmjz3l7gsh0dDV37m9ChORidvGr0cMKXOfBaIZwlFEBLMe+MvFBhj8/+hSb
         x6Rbde4le4l7GnQjSP8jU4cngg65TB6w744Wsly65q9o8IRTTocAa0WGabw4jE7XZ83+
         M2a2G8UYGuaP702jZfZwmvtvJAJezwPsHtwPq7sRyhUDaOVy3PYdwFEdq3jfkUtuTNIE
         SqI5fIVOJRRGZPnmwI1dn8Xme2Q190yujsLt6r956dtuWT5yBR+bU+ZOpuvHQKkSfxuZ
         bqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGQspdnr+81Wzyvs4UQ1xRnlSNDX/e/wOZkV8GKs9Ztc4e+wh2jp03DrN0HlB0csLXxgaxIKU70q6K4Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z96allNTTx0LPDCeCJhQH6Z0sCuxRmRxGHjgnpMZJ6UyhYwDi/8
	7JjZIheT1Z2ouncn8ml/iRLO6V0ZxHriUWDL68eMlHdncGyk5EOezUx3
X-Gm-Gg: AYBFou3+es+wwi+50VEViLob7h3yk89XtLxCMGOx8ahEWC3WzeGHlkugpXT2qlTckSU
	BZv6M4fFQuiLXpvHv9G6YNZxSzPhujh9FfommY47ZD3mubT32xYEAoaStU8HtYFAcEAKcQUGdDc
	Ab4BQI46IZBzM5hEgjLyYqBGSWe+YxLVaRaXLmsjf4L6b2KySXxYNwNZrpOZ5/5UsQxYcXYaC1V
	J/UfG7Ml9mgXNLW6UDwlW/eaEap1aDDE55W//4I+ySNHKDJ/7aokFNKuBBtLWxqUfOvO+CkMZsN
	T/cIPavSW8yaY4uapM9L7CuEe0fZ22twBKXf0WgccK9ebzw36u5GTpojcCd5M1WhUvoRvwnyk3K
	/J4HM+g1vmqgT8BQlemeSYpDwNf9/Yz9UseiTtRsZttMx4lWLZ0lexMTjMxsTbi955qat0lTXbo
	RO0qcx05L2xI9wqqx5qG+XVRaX3NWSrc6xPAw+sWoKeFUWqP7XSfpzbRr/KnEIzcXFq7GLJ8o0l
	t6KOEzkBaAx+3VmMLELt55W6oj1QvEmfjTdaKvgdgzGcc23ZSYVSml12i08sQGCDC/ZYGGyZdOi
	D0/BuQ6MSxxuGAgZmc+75DMq8SdwPSnC4A4oaw==
X-Received: by 2002:a05:6122:310b:b0:5ea:cd4f:8494 with SMTP id 71dfb90a1353d-5ec6897bcc7mr3560315e0c.16.1793597743759;
        Sun, 01 Nov 2026 21:35:43 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:72cc:e44:b5d6:98cb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c4cbabsm9395668e0c.11.2026.11.01.21.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:35:42 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Fix S2D message ID on Rembrandt
Date: Mon,  2 Nov 2026 02:35:02 -0300
Message-ID: <20261102053503.102598-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 382fe403dc31 ("platform/x86/amd/pmc: Add STB support for AMD
Desktop variants") added S2D message ID 0x9B for Granite Ridge (family
1Ah, model 44h), but only checks the model. Rembrandt is family 19h,
model 44h and goes through the same AMD_CPU_ID_YC case, so it sends 0x9B
instead of 0xBE. The firmware then reports a telemetry size of 1 instead
of 0x100000 and amd_stb_s2d_init() fails with -EIO.

amd_stb_update_args() already checks for Zen 5 before using the Granite
Ridge registers. Do the same for the message ID.

Fixes: 382fe403dc31 ("platform/x86/amd/pmc: Add STB support for AMD Desktop variants")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Tested on a Lenovo IdeaPad Slim 3 15ARP10 (Ryzen 7 7735HS), with this
    driver built out of tree for a 7.0 kernel. The size query returns 1 with
    0x9B and 0x100000 with 0xBE. This laptop's firmware then reports S2D
    address 0, so init still ends in -ENXIO here and I couldn't test an
    actual STB dump.
    
    Based on v7.4-rc1. Found in my own boot logs.

 drivers/platform/x86/amd/pmc/mp1_stb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 8a33e75b71c3..af9ecec532f0 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -266,7 +266,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		if (boot_cpu_data.x86_model == 0x44)
+		if (cpu_feature_enabled(X86_FEATURE_ZEN5) && boot_cpu_data.x86_model == 0x44)
 			dev->stb_arg.s2d_msg_id = 0x9B;
 		else
 			dev->stb_arg.s2d_msg_id = 0xBE;
-- 
2.43.0

