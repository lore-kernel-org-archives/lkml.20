Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754290;
	b=koRs0ykYpBBIzdKzLCkijAmNqDy+ZzKB107vTkUttgIW8k5Oou/ytbejpQEYQuKSzK6b
	 Z0KVAVg5mbH2P53im18AnFCrrAua2KSyCc34npDMR20o2BSkVeTwiAnK9lxPOTuzuZpsQ
	 eThLZkW16fxsrh+MH/EOgvkNXxv88igCrLFLSpdjbvABXQ5qbLBLtc3yOzaVJFmQZSTS4
	 DD37i7snFsUehnXg2c3DCHXsMdrTOY4N5iTZkodCttshF39VChCrSQONwzd589g3HkPRM
	 hJHr08H21k33alBJccJA9YZgQCIBPcG0GGR2VPXaFQlPzXh0RRYlcBBsSyfqXZsboBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ZfYp2fVOAsovMDBuZ6IFcNyy3aPY7Zpal+R9H3Fzo8=;
	b=pAG7YqruQYun5XjzMcPEp51vSYLuhRy+jmt5wMVrfQslWZQ/jjbo7We9queDD34IKo8X
	 dZRQvuKIi6F//Z2EAhwqWxUYs3WmV64Tr13YyUf+7+jWfnFmoYzY9GjIiMdPerltuNQq9
	 v0r0lW+8pWCEMayaN5HxYeuRjFDYz7WJqjomWD9dvYMnfWXhx0R3aV5jBuqZHhOBCsVoR
	 LwfzcaXc5Nea0BdG3NI7AuvDVKcqGxWHBQZuSoU6yRu7/E+VWmGPX+FRvI7y7NfnaoiO8
	 lQVBfVM8kK0/IxjLooC8mtR1VxfiLB2T4R5KTZ27SJa4oZVIrVFxDvkfB7CUIzfdflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9SIedi3;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782DA606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9SIedi3
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso14572775ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754290; x=1795359090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZfYp2fVOAsovMDBuZ6IFcNyy3aPY7Zpal+R9H3Fzo8=;
        b=a9SIedi3C6EHJCF1iS7LlJ9JTawYnDP3geGbLahyMmZbYrRcciEIC5LWSZov4Y4nrU
         EnIp44EKasSUXQILotvPIDflq2Mq2xRA7WmbmxFmA2JccePPAdK1VCbsUeZYE2Ew2LB+
         TB6XSaDhRBVzJ9gGln7vw7Nv8zzVIFRPyiz4CHMSgbpxeq9LTLNDlxY6OCky8pyOcmUW
         xLyt6jqpxoY1DIWqkhsd5j+KsbLfr/7gv/PgfMqSQUxI7V0OTMnpyGgpcf3oT1Ib3E8Y
         zLw18kCeVI9c6ee8KcvdYtGF5d9j+gpTf3L4i9gMPKLqUppZGKUxN/hUmP1e/MRDhLM+
         FZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754290; x=1795359090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZfYp2fVOAsovMDBuZ6IFcNyy3aPY7Zpal+R9H3Fzo8=;
        b=QXzwyKB+1AjoQ3UlNsfGt1qZoZWp5VMtNV0xB6VGbsHJdVZgG8cGcb4oRFHDUR8Ajc
         WEZzMBty1B/f/cPKPJXFxafCwQOWdN+NFbVc3ETrSRbfl8x18tOTFpQSDPlupN+bEuYZ
         KB4XwLychdZX7++TzcrLrX9L1N94ENci52BhwoTZlvIBDzOWRz0/iewqeHQBNQXnfx9N
         JwaL61HWIzXsqcK6Sx7pkTFop+AZ4wRV0mQfkFP36zfNcaWsaYf4zaiZ4cYEfMLTd2Xf
         AtVNt1mw14a+DVCi273zS5ZgOJ6WFG3LwNS3teMKuSOJCUXQn9htqCA4nYBhVxaZH2J/
         JQSg==
X-Forwarded-Encrypted: i=1; AL+hErGdttHZu62Unq208hZdDUumo9nBubRpYwi9+x7n1KW6iJdM63bCe4fCXcIMoEFX9srlC/WW9W/y1nh3N58=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qc1t7hGGRtFMUHWTORDXtboTmvZHRQAOgNSNsqP8rIRIvF+Jj
	HzadAbRXIuJwoWoGJP3qyXcZDoIW3v6F1cld+fLE0rNdkZkDY5C2pqHS
X-Gm-Gg: AYBFou10dQiuZ4MMhsqDj+Nv6JUd2QIDBWgBQgc10VZ5mwcD5qK2Rvw+c05vy43XeNl
	Efvn3cReVNEhm1YmCGi9G7xaCLJmVA9CJAhoW3qD++8wPzqSb0uY598Zd93FvE+78CICdSQNuxo
	ERymLFoieODx/jLGpyBhamjBuy5VRRNz7c9mUspOsN9TrVGQbaevfcBWXhxrMFmOlyM5WNzvkzq
	0PXmFkRB05LvTdcaI5U9HoA0ztrhJRQHVEYqr5/jALpLhLQQ1OGxlspfDM34nhkey4AcJJuS7/T
	W4i0OgRbk17nv185yC0yIKWoItpSMM+JJlF/yndVPkTx3wkCv4ptfQom4TQ9nQjfpBNTAv8kXAK
	RrJdcHBsWgRE/AO/0LvtcCxGWiDbKbZRLXJZ4oUlgfwiEtqN21hScCDKZq4QcGr8dOFc/q4BZJB
	74rKH3l7iCpn3O9VQInsU9PBojai8Qeywmi5ZLOY2jAmldC2UxsBEr5I56Fkv+4qcoEi4kM85mJ
	WVCUSxX8En8B8xPzK63JweGx5iPlo+8a0MZp26aDqzp7Xep0jDxFmNyIEzCpCrNHSaSo151/6lJ
	bgRHp1lGqVbl0NHXbtbrzYBzGwDlzn1wcfvudnFfEPuVBxq2
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr7626437a91.36.1794754289600;
        Sun, 15 Nov 2026 06:51:29 -0800 (PST)
Received: from localhost.localdomain ([115.76.89.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm17353559a91.15.2026.11.15.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:51:29 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Olivia Mackall <olivia@selenic.com>,
	Deepak Saxena <dsaxena@plexity.net>
Cc: linux-crypto@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwrng: omap - Unregister hwrng before disabling the device on remove
Date: Sun, 15 Nov 2026 21:50:50 +0700
Message-Id: <20261115145050.88427-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Commit 3e75241be808 ("hwrng: drivers - Use device-managed registration
API") switched omap-rng to devm_hwrng_register() and dropped the
hwrng_unregister() call from the start of omap_rng_remove(). Since then
the hwrng is unregistered by devres only after omap_rng_remove() has
returned, i.e. after the device has been runtime suspended and its
runtime PM disabled.

When the omap-rng is the current hwrng, hwrng_unregister() drops the
last reference and schedules cleanup_rng_work(), which calls
omap_rng_cleanup() and in turn omap4_rng_cleanup(). That reads and
writes RNG_CONTROL_REG while the module clock is gated. On a
BeagleBone Black (AM335x) unbinding the driver triggers:

  # echo 48310000.rng > /sys/bus/platform/drivers/omap_rng/unbind
  Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa310014
  Internal error: : 1028 [#1] SMP ARM
  Workqueue: events cleanup_rng_work
  PC is at omap4_rng_cleanup+0x14/0x24
  LR is at cleanup_rng_work+0x30/0x48
  Call trace:
   omap4_rng_cleanup from cleanup_rng_work+0x30/0x48
   cleanup_rng_work from process_scheduled_works+0xf0/0x518
   process_scheduled_works from worker_thread+0x140/0x2f0
   worker_thread from kthread+0xfc/0x134
   kthread from ret_from_fork+0x14/0x28

The worker dies before it completes rng->cleanup_done, so the unbind
also never returns because hwrng_unregister() waits for that
completion. The same window lets the hwrng fill thread call
omap_rng_do_read() on the suspended device.

Restore the original teardown order: register with hwrng_register()
and call hwrng_unregister() first in omap_rng_remove(), while the
device is still powered.

Fixes: 3e75241be808 ("hwrng: drivers - Use device-managed registration API")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/char/hw_random/omap-rng.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/omap-rng.c
index 49d7f021fd31..e5b14ab1b7e4 100644
--- a/drivers/char/hw_random/omap-rng.c
+++ b/drivers/char/hw_random/omap-rng.c
@@ -493,7 +493,7 @@ static int omap_rng_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_register;
 
-	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
+	ret = hwrng_register(&priv->rng);
 	if (ret)
 		goto err_register;
 
@@ -520,6 +520,7 @@ static void omap_rng_remove(struct platform_device *pdev)
 {
 	struct omap_rng_dev *priv = platform_get_drvdata(pdev);
 
+	hwrng_unregister(&priv->rng);
 
 	priv->pdata->cleanup(priv);
 
-- 
2.25.1

