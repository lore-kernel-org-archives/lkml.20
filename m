Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348661;
	b=3h57eL/Q+q0x4v33fy0meo4cUC1DlGT0SF9XFmR/WLTJWd1PVNbWIN20aLqaJaka4OIP
	 V7TdCY9cGnYA1T5htXtcfMI4aB1WELaLyp9VB+aQGerJADjJIqAoMlqx1AjCa4/TTw8KP
	 tVbcerY2D+AFaAodohZjWBwHev5wLhyxnZ9U317GGfokrY+DpxUYfwQBdoFMu81lIx5ln
	 5B/S0KjZyYw6wvdLnbDh4K/BMdvupSAVL3ZnIsM4Q9hK8Kv/BFKRrOA43c3BAFmx6vEV0
	 DwS4uSEm7eIfhVTlY0o5Fe82uK++R5CAyCRRxW7d8cGNEcaI9asw9DL8Rkx2Tc7dLAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
	b=0XcsWyfqe0CBGxBFBwKpt2093L3dzq3kCOSADnQS0YyZnj8QDGzXwTiNU7CHQlTdZ0H/
	 8GqzS6x100KRnyFtls+0tYA35+X9UIWS8+3cMSaBrHPI3oZy2ZDgLwWu3qMEu1ca9341q
	 y1CWhe7yro18Dwoq0+iboR3PqkKycXknmHtU5tpk6F8x1M88Xoq9Buirk+pwpiUGxhCkz
	 7Xx26BsHMavTGnwGEhQPrh1wa5GOf9+Ys/U82wlWXYZ/yjctYneTLsQ+mEWUnc5SzON8z
	 JQwj8b5n2r56YeK7PEunKE5oDoiLiAHJ0d6uSlBAf1FQFFQr5vqJgb6KtWabQE7PxLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpC3LyiB;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpC3LyiB
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1228825eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348659; x=1793953459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
        b=SpC3LyiBAZud6nVAQ+RwCqcl7sBxNOg4NK1cTrJUUu+pCoqeknIkuLz57bJL8IOzh6
         4/oL5XmV3WlbCT7e993UQJBbIzuf2tFlSIJNIEjod0ZFuOLbbNGihHQBBz0vooDpKKh1
         nLEpvKk7lKwJhTDu9Q9VxiC5/di7LYeLxxqvirfdm/FrLBOJfHpyGKNt3lf5h+VE7ZDN
         6rYML/lvz6sCqyfSZ8sVsX7A7UF9rLfrij367ILhvI8Ixzw7wStHyMIsOJRE0GDTirUE
         TeyYG4qT6vRv2fU74+qvyLTnHMTP17gI4xYkGgfaL78/Zkez3zOzMFkkVA7hmi743Fka
         oAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348659; x=1793953459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
        b=AqBIS1rV7xQ+6/GIKupDgeVdZXSo0UmGMq43JhuBAMkRpekzSqRLTHsDrVygF3Gewu
         OdjxhMlLxBQu0NsfnBIQ4YqNs5VoHGX08TxqIh2Kr46qRXRzjJcpVih9TqFJfjWRMG0k
         PoPI3eGo+ES7rFU6pO8UwKE80CfMf+dJVYqlS2JPCkFcSmBairgUL/JP3FzcUWg4u1tL
         mje/VWEkc3vOiJu0Q83qcAKia/7XoGTKFhmoRfF3YrTzHHllRSIGhSdxO9xNRY4rwEvy
         U7qk0TLKP/jhukRBPhqPGp6aPo+PfzVl48kJXNFx5SKmUJwhs9mGy7kWQa0o7HPqxBOR
         GhiA==
X-Forwarded-Encrypted: i=1; AKwUvBwrRPV63jpiuW1cEIoPf3vwcBn6LMi8kuOIZmXUTuKM45XRvH3NCC7rf75Kx4mHLpeWQqlHMQklLciDfqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYICKay2sAEN+gMAZNcQKM2OTs+vGuOA3jVPIojK56KFCM1Ru6Uy
	CtHFO9fo4CcWgbePqm7cEB92Wul/Z0YJllWxi/U6SVn+a5cbEt18ZDwf
X-Gm-Gg: AYBFou2Udr/h7nSh2bHq3cHSQfN8KRjB3aS7oPFooRJEDYh5TO4lmZt5BCkpAFvE8mY
	vhrJaMeIUeDCNQxpa7uF3WgGmDMQqqZBC6YOqCp/Tg/hyaP0GNnRvc2vD4hVOM+MJgwBEWQMaJg
	TC8UZFT8jCeKsvdzHGArqDnr3T6TBa/r99MVYgBotKHI3BCQmpwN+niLug65Z5VXv+XHbrySy8q
	1YxaLv6PjSkTQ0kbfpavFsvdk2o7f+n8jW4T4lzKpDDGGyn2YhIXsO83xGIa5n9gn7b0l1U4vrq
	5rtwhvvoIfwwmshcl/YnwujsLGsWm1qaEjqFW5UjD9vY3PQmygnshF8tKwg0nCXNc7P/Y6U8Oxi
	yo3BBPX7+YXtWLS3vQDSDvDBQHs6P6EoPXGuUQOFdBjhH6calm7Ow0Itnv5qyexEw+xUWRLOSHF
	9HY+E4Ox1d4CECtdguMK0cURELIB1+xL1pBQV6IMDj9ohLk+K0TAYfQmHt0WqjLWRQVUE2Vk+mJ
	b9lWwonH//b8qpsWfiuntIW6RVyID6DGtSmDmtiuT9MH1IGKeq1X+zmvupX7GZ1vC+PBcnVt40N
	GpgsZf/TorqyrwbBMjCbbPmzfd0C77HOmvLwDK1ErbvoZHqfAqy0NWkc7x0NYUu0EA==
X-Received: by 2002:a05:7301:da83:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-36a423a1f05mr2434932eec.14.1793348659286;
        Fri, 30 Oct 2026 01:24:19 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:18 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 7/8] platform/x86: punit_ipc: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:01 +0530
Message-ID: <20261030082303.284271-8-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/punit_ipc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index a3d2b0b64135..1fdffe3ed8b8 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -260,7 +260,9 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 		return ret;
 
 	punit_ipcdev->dev = &pdev->dev;
-	mutex_init(&punit_ipcdev->lock);
+	ret = devm_mutex_init(&pdev->dev, &punit_ipcdev->lock);
+	if (ret)
+		return ret;
 	init_completion(&punit_ipcdev->cmd_complete);
 
 	return 0;
-- 
2.43.0

