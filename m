Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407055;
	b=wuPGZsxJJi4ugArCgk4GtRg9WYUFvaG/PRYhx8xH3zrX5GU79N+zZJM/CTeE57GfDCz8
	 vFR+cHmHeDse4sNgZbgrhocWlz3F76hY2+VbEo2TeNyf++FO42bhdMxWI3o8G8dKZxQhj
	 jTANvC0M5YN0w2EPTIiXrgqfLqx/iDgWEGbnYdtEF5j3ry5khD0BKRCVEzpaB3qTLB2sV
	 FXXk+Zpmb3E5OQDn+r4aVNbbEGKaSnUqNHg3x2Q+6CQ0SFebn0qT/s2qaCCvpWuvupneR
	 zPJYW92sfvFxGNIV9FibPYO+oiIQ8V2D36qBNOXBebxC86s07MOzzSZRPjTFvFmKnLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=;
	b=LLOv2rKNHt+fQKydjMxBRb3UcYNchMItPrnFt35icjNg5yXW5Rz9T+bTCc99uiOyY7qG
	 JQ6NguNeEapTHtIjQoEoB1NaAmAPv3nZF7lDrZJ48YLhg4a7NWBD/xfLErtt7r+Smzi5K
	 Jd08kpW7VN6BAgbykN5O3G1AdnKzLfIECbf0iWmQilt+UsJzjfPb+TlLm5zRvHZlrp+b6
	 UcMsnRsnaeT6XUU69/IYzCfrw4XawFDIOJS0N2pKvuaNSUzqlp4VomNwvLN4jGvNaMhyN
	 YnjER5EpfandWHM6C1NpiE9PrfjMao5UeeES6+fEY5Av4VKB0pmbUgMWQ+iFdEoipJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rKWeDpvM;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478BE606A8B5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478BE606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rKWeDpvM
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2210538f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794407054; x=1795011854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=;
        b=rKWeDpvM3gXppe2w1jRx4FDwGNAKUchjBvJal0TxqQh/YSwzenzj6z021+9OEGGkJc
         6xDu+CwxTsiIQs9dXaZW1zMGcGb2MY2Ze4LFuhu0wQunAZhtjj8mh5eeTdtEln8n2kaY
         HDM+uHRB41a89Ckyx3ywLtKOazGptRSKp7wry4CMdH3f09HbqHr72HAAWe7pdmTVpehw
         t9HpUyDPpfR+ixEAM8He+pPQf8b8CSEwLdRqJUsESJWYp7CnHcv1scSb8uD2GIDIEOxB
         F7E+DYbshgAshLvgWXkdjbSdMBVlEXXKCzMhYOG6nlc28TvVyOClwEfQfIQ4LTklc8sy
         goxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407054; x=1795011854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=;
        b=A6TN1DA4tMsYY3OQdTTa97pTCe94ErmPJfwHNxevALcUx5pU1T4MHM7clm1mYryFiv
         +1H/7DT4mmZhxK71UEFzotqQXYjYYecoro7B1wtaNNQOb0aHfPR4CwRG9lETtHBldyR/
         rGlFXWtyudKe+RJCPePBuCxGL5yMd2R1zChR62uU1PTLbgufc0z9SYUdjFSmg0lWk9cv
         9GVi55I3R/VdscSz3smWdL4CCTOQyf7tlqbJdpNOMcLYS9FfCRdzgBImg8AhhDyXkiTf
         jknxudaC0Iov68hP42rVNrDsaG+eXHLuEW03ttzhd8jpEjyUb2V0Z4+jcAc8Dqc8lpJQ
         SJ4A==
X-Forwarded-Encrypted: i=1; AL+hErFeIeLqVcHAadNBVgKy7VgYPzbxHwRl42sY3yTXE6YY7IxmPFENGJOdbZMf3TWZGa9iNZdjHvNpfCpAx5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z98MzbwrKiLni9PkQKqEfn0eqcoEKlgQObSA1WagwPTl9/JHGW/
	mjBhQltptyMVlOfHgmt4VB5JnxyqtwClr5O8N/CJ6zdQsi+l4uBtGVPYuUmozzcIYY8=
X-Gm-Gg: AYBFou0dU3cArZhhCfojd3/uA1UWbbEntgigTxc1XW0hEFKXjJwmifUlhDjiUrSQvhr
	+KbbrDIL5SO2KmcHPNenvbTisOjWWE1lqmm36KVpc9SAl9MyCcWweMTm3YsqquYLXpUHvcMNMkz
	Cs+ivKLzNiNH7coNpn760QmOG7WzQ+OVYjxMJqc2c00bt8bvdREgq6m/W4P3Lm+XiZrXY2i3Ax/
	FFo2+MpHYCMEwAG2t0HPrvdl+T9Nn5TpOoVvjlzfTBgqDcIwRza8qsaszr//9VVNH/uUJGaL9de
	aDiG4io8g/i1RpTaTg/dhCO4r/kCNbgQNNOu34vJFcSvAZJpHbxaT5KTQPj9heXpIeaqH7oyNvl
	88Hbsevo72hMQp6ruRUTdYoe7bYGCQj9JEp1z9uHu/KC8SwXyhyFXle6nc2lRKxGP7R6qhM03SJ
	2S6Mbu9E17babzjlipUj0zdN28iPJIB5K9BhvB5xeQyTjJujkms/dHLSLRV7weAWQkXuZVJtVz5
	uomeGaI7EVP68/HDCqR/YO/qHfNtIfW24dZ2FrD5fN8SHamURFH85+ilDJ/jqFoAHj76umdSOgE
	rFjbU0cdk/I8ox0wgYl7a5O9u/szXFPAsZsBVV12MjMF+xiQRyjiGi22l6z+3/DbEsTKuBQ/nQS
	oT2DrxVGGog==
X-Received: by 2002:a05:6000:5c7:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-499c6027cc4mr4071191f8f.20.1794407053616;
        Wed, 11 Nov 2026 06:24:13 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11352871f8f.37.2026.11.11.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:24:07 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Nov 2026 18:24:01 +0400
Subject: [PATCH] scsi: ufs: core: Register the RPMB bus before adding
 devices to it
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
Message-Id: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINAtTSvWLSrITdJNKi3WTbZINUk2TDZKNrFMUwJqKShKTcusABsXHQv
 hF5cmZaUml4DMUKqtBQDF/kqFcAAAAA==
X-Change-ID: 20261111-ufs-rpmb-bus-c8e4c1c2c49f
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
 Stanley Jhu <stanleyjhu@google.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Avri Altman <avri.altman@sandisk.com>, Can Guo <can.guo@oss.qualcomm.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211; i=alchark@flipper.net;
 h=from:subject:message-id; bh=rACyBhlqQdc7vEC+waUwW3Q2wxEerf4GPNn9xVrd1kk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9qWrhLHryfo6Zfv8kgTXmP5Ycq+UK9rIJfnTBefE/R
 eM7n25+6JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq73UwMvTapVw7c+Px7UTL0o0fu0xWTvzBXzvvsdqKE/etJ54MVFzEyHCv4b9
 a2rTNWwKmWhle/3Oy5fFh30eWkzXP6YQY75960pYFAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

ufs_rpmb_probe() puts each RPMB region device on ufs_rpmb_bus_type, but
nothing ever registers that bus. The driver core used to accept such a
device and treat it as having no bus, which hid the problem. Since commit
36f35b8df697 ("driver core: reject devices with unregistered buses"),
device_register() fails instead, so no UFS host registers its RPMB
regions any more:

  bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
  ufshcd-rockchip 2a2d0000.ufshc: Failed to register UFS RPMB device 0

Register the bus when ufshcd-core initializes, before any host driver can
probe, and unregister it on exit.

Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/ufs/core/ufs-rpmb.c    | 10 ++++++++++
 drivers/ufs/core/ufshcd-priv.h |  9 +++++++++
 drivers/ufs/core/ufshcd.c      | 14 +++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 756673337648..591e7f2e1474 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -276,5 +276,15 @@ void ufs_rpmb_remove(struct ufs_hba *hba)
 	dev_info(hba->dev, "All UFS RPMB devices unregistered\n");
 }
 
+int __init ufs_rpmb_bus_init(void)
+{
+	return bus_register(&ufs_rpmb_bus_type);
+}
+
+void ufs_rpmb_bus_exit(void)
+{
+	bus_unregister(&ufs_rpmb_bus_type);
+}
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("OP-TEE UFS RPMB driver");
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 99f654b79035..4f2661036d7b 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -499,9 +499,18 @@ static inline u32 ufshcd_mcq_get_sq_head_slot(struct ufs_hw_queue *q)
 }
 
 #if IS_ENABLED(CONFIG_RPMB)
+int ufs_rpmb_bus_init(void);
+void ufs_rpmb_bus_exit(void);
 int ufs_rpmb_probe(struct ufs_hba *hba);
 void ufs_rpmb_remove(struct ufs_hba *hba);
 #else
+static inline int ufs_rpmb_bus_init(void)
+{
+	return 0;
+}
+static inline void ufs_rpmb_bus_exit(void)
+{
+}
 static inline int ufs_rpmb_probe(struct ufs_hba *hba)
 {
 	return 0;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c9b2eefbd7b0..4653d497e27b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11687,9 +11687,20 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
+	ret = ufs_rpmb_bus_init();
+	if (ret)
+		goto err_debugfs;
+
 	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
-		ufs_debugfs_exit();
+		goto err_rpmb_bus;
+
+	return 0;
+
+err_rpmb_bus:
+	ufs_rpmb_bus_exit();
+err_debugfs:
+	ufs_debugfs_exit();
 	return ret;
 }
 
@@ -11697,6 +11708,7 @@ static void __exit ufshcd_core_exit(void)
 {
 	ufs_debugfs_exit();
 	scsi_unregister_driver(&ufs_dev_wlun_template);
+	ufs_rpmb_bus_exit();
 }
 
 module_init(ufshcd_core_init);

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-ufs-rpmb-bus-c8e4c1c2c49f

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

