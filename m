Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865863;
	b=oKCoSV3CMeYbNnhOLzl8ts80EDKvHshu6RLZETJYfCEJKx8WvSvfkDqfLb10KeS803j1
	 GwXkRf57yWBa6GHaUI3XnWkjs7+y5EhLPhdtd66UxtRGEyHFqVaIaqXxywJp51H03uivM
	 pPbtKkAJ1DVgTqx/6qbGmjQynWAGVRz550EHqfnWSNYG+lD+MvDvrOuEAzGrw+6dcDVPf
	 27SGY2ffwDkyrUyE8PWWG6E/qIBDKcxumVfhkpHXpFrlcxIgz5Z2DgEmU2pkYDqZsRVTY
	 kWg5YDyin/U8Ua6xw2BPQ+jipJw4TSTUfqXiWf/Il7sqIl/v5igWbDyBSUyN0il1V2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=;
	b=2jagyfDVPNE5aW/FSdO5KMfVBQM9BDeuQnkUGuvpwd6f4Bxe3M2bPRejCaC91JAcVRiD
	 ZWAHhk8HV7bE20kcFb8YX9PRxr00/ToamHt0gLWAO3sWL3KkCE9p1CK6z1sZjQcRoZuSZ
	 gYcg8Uw/BB1px46xC1Tpn2HOsko17r9+IFGw4BkuoVg0g6ESS3BBNDKDcHsDfUcRe1xzz
	 oSdYpj6fXnr0L2whHLEUAcCSwGXvNhSKBLBC4HHTbsYN0V4YK54LlSB7vUH6usRS+uonN
	 BtTg6DufFl15dTtI/RIXxegQ1aw33+CoNuQomWX6qCogsZhgcua+nIp8gf/6c3l7uYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvY5Z2JO;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF4606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CF4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvY5Z2JO
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1269438a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865862; x=1794470662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=;
        b=FvY5Z2JOJfI9T9J6ZSesxj8GI7f4wWMzejTie62Lf4wZnFSN3uh3Wk/vMPDyzzLh10
         Tj91lO4C6mzhlRKcAIa/Gpred688L9Dm0/N6vrN8SRhYsOQuVxTZoVYcTygqCN98w6gl
         efLOT29wgLrOlPifZ3P6x1ox8aiz7myKp3QhiFKZqL/HPOxI8xyZa+dlrsngK1ivL3ZH
         ufX/BETgK/HGv0HU7xQLn8S7HHN8h1m52uWabWsFoPHXZuoG8eFmhUD6d2OO+gyA6k12
         WqwmkNhu0J8DXj5+OZbly1+j5XBM2Ah2RCPWntGg0Hd+qD0lpns1iCbMrBkbhQGStXeZ
         irzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865862; x=1794470662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=;
        b=xlzQUJgCxqxAztjwZg6AwMBMocgeTm4GAcF/i+C/LVEqITAlginERjufw49DqIY4/O
         CeoBBmuDIrtmUL0OCo6YfgT2+znzVQF1f7n08zZXkQkvtNOGIjVXXArxBnGgMfNmudpw
         ogcadGSgkOiJgQsIt2jm2OZ+pVTbCJNVvrksdj9XizXJeAs8WL1QWqTXszCVwhPjsklN
         qLpeIPrlWFULvtTI+jJmofAhMeLoiU2hoVy3TdG6Jun++ptNH1UBM2bpO919u7D/X/7j
         YE2DPcmOXn+SPXCYc3CdEHUHLDXNRAe2DZ7DdLkvPw3rEDHsh359+YiWo8+qxHSqw5lM
         w3yw==
X-Forwarded-Encrypted: i=1; AKwUvBwa3l5drrajh7esujNLwICqMGuY/hPL8LiReuCVQWidHknpRu5732aTF+Iz4IFkFzD6T5LrdVZkljT6YQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HWW4Z0OgmwmvWM+5qlkrskC+dG0PcAZddZxaBfpVLeZvaYU7i
	S7JuY/51MVRBGla2f1fciq23IvQD6MJB6ykn31JDi6XqQVbdD3svg8k=
X-Gm-Gg: AYBFou0NFb8Re3bvvTMEOhsE3LNrcBq+/SXpUzVTuGFlBmkLsjju7Uuien92O9OV9RG
	h/F9K+wKsYkckWFxpqwurWvztw0qxzhDVspcOH+2eDF8l98Yb2mpmURPT77jb67SjIohDZi5GMT
	rj0VtMvEF3o9k6pgNZYebTVNeuTYzZNu8RVkLi8T2DDK+E0RmjVSHPrhavh448GzGntjK7tIbEJ
	IAcCRmK0LW2hMolsToiE6NbmuU9tngizf7D4QtwNpfyrHsMgf7Zr1sli2MO2pLPC/gC/6AJm0GX
	h5IJZkHWw8AleI8Cedb0uBSpfC3KcLVcgstk1FhhADmcHcFo8ieauwT0vpf/fTImva8pIBn5tY5
	826CSY/c1h8OR8VDWcvCxV+Pil6Nms4gVSOOhMiwAAA9bXtuJiTcTpYmcfcU5DARJPjov80KmSf
	NeqXfjwCqwLbqq9JDnMPYpfo7W9a+sAVh2sO7qjtEj74p+JCbpZCONv6nS9xKhr3tIBIsfT3W6H
	a4Mu0CAr6wS0CoZabejVhpEOLmG7v7jxwajULqCPhxthPZK9xNBSXYh+AhNsb0yBdt9tHP1S/41
	AhSgdHve68pFIHMVgc2FJ6MWM2pd/fmxngFJ7HpuOG0qlLasdDmk
X-Received: by 2002:a17:90b:2e52:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3ae897ec759mr15992932a91.25.1793865862020;
        Thu, 05 Nov 2026 00:04:22 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm2617818a91.14.2026.11.05.00.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 00:04:21 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-fsi@lists.ozlabs.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] fsi: aspeed: release the master device node with the device
Date: Thu,  5 Nov 2026 16:04:14 +0800
Message-ID: <rc-review-20261105-32-59f96c1fdaf1@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913060242.1426845-1-lgs201920130244@gmail.com>
References: <20260916093914.2005582-1-vulab@iscas.ac.cn> <20260913060242.1426845-1-lgs201920130244@gmail.com>
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

fsi_master_aspeed_probe() takes a node reference for master.dev.
The posted error-path fix releases it before directly freeing the
allocation, but the successful registration path still retains it
when the master device is finally released.

Put the node in aspeed_master_release() before freeing the containing
object. With the posted remove-path device put, this keeps the node
valid until the last master-device user is gone and balances the
successful path without repeating the error-path put.

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Link: https://patchwork.kernel.org/series/1166294/
Link: https://patchwork.kernel.org/series/1163700/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

This is an incremental patch based on the following posted fixes:
  [PATCH] fsi: master-aspeed: Fix of_node reference leak in fsi_master_aspeed_probe()
  <20260916093914.2005582-1-vulab@iscas.ac.cn>
  [PATCH] fsi: aspeed: fix memory leak on remove
  <20260913060242.1426845-1-lgs201920130244@gmail.com>

 drivers/fsi/fsi-master-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0bd760fa78b..cac0a8c73043 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -378,6 +378,7 @@ static void aspeed_master_release(struct device *dev)
 	struct fsi_master_aspeed *aspeed =
 		to_fsi_master_aspeed(to_fsi_master(dev));
 
+	of_node_put(dev->of_node);
 	kfree(aspeed);
 }
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
prerequisite-patch-id: 0d97a848987c2bd4195686f43f69a0d0c0f69608
prerequisite-patch-id: 00d7444e3a96e93c967d233b9c7c3a79c54647e9
