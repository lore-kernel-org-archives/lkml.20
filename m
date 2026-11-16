Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810588;
	b=E6/CAXsB1YxRBQXMEa1xf+DKcJvovbGllTWrb0aoNod8VjZgPU7oyTLxcm0qbGXUz6qa
	 ySlhUygs+9k6N9B863NqeVFjd4RSupSjsr7rYmKn4xtKwGjM2tmP6D0k4Gz+pxAyZ+bY5
	 8xa3RywzOIeGAJnENps7Mk35xtzt9L8RqrSx4we3CViygZtGivYWgXGQqWzbyE7jMTls8
	 R1e/NkCH+/+gYNSjTKzL/t4iIHtoZym8eQyC4jz5Ph7W6w7DHdfDUNkHKt/O12srR7Efj
	 LdGfIYUq1bSvg0zgO3EDht0RHUOpJb8fV6yGZsB8qMxd0qdVJdCVUU713mvwbvqqRzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
	b=LgJMRNn6AF5CZEwEXOA1szpFVbA//FTjpYt8b8Y2Apin+oSm4l3NLlWaVZcO+5v3UnuC
	 cC3wbP5mFI10oi+8rmt/G4iWLvd7ePoDD6RXsMDWEe4itGPVSUUF5Kq0mXuTBqlWz8jMu
	 gJBwPc0XAQYukGRIu4ds4PHbeBluOmPnmjE3Gsrc1ayxCBEmV/Q6H4hLgUHXeiCiBPuQI
	 Lje90AdBWkWH9LdIkGGWY2kcU5oX1MMOe1RWVAMDq/IeNiJUVa1M8oUlS21JsNsJfaeg8
	 dRb4IY4hgarH/ACN7fLezbaP9nBOGl1GlMwZQVO8poUXGy7H3cI6ksG+AU7/MQ7Ot+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lv5r3AAt;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739D606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D739D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lv5r3AAt
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902559eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810587; x=1795415387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=lv5r3AAtLoF0+4CHYCPcj4Fg7vstobDu+R+304Yf5FBoDM8Ee0czM/0qSuoeQenHia
         t68wbGRtOmH898kB0LGzeUr0OD5QRGc0YXX2hgZ5hBVlhj97rwSlmZeza1XUQpcs3ka3
         wzBS1PL02SJmRKXbzScCCbaGANIhNBhjkzuSi/BjvIfJZ6EuEnGwo8Io/k0xLqY/8SB+
         tAVYZgbHkT63LYPVq55MgRqVyzO59Ya3pbV/H5Br19rmjAiijEmdRh+L68CUERddKM8v
         +5CyWfxtv+XQwTqrZk2TWLsMvNC6D1mEPS2QLadfmJQj3kk3zHEKJBdl3zlgQKplTJYF
         802Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810587; x=1795415387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=nCHyik6ZosafPGrFu0/LGbNvJfNh9hvAIDK/YXz0S9QSLOEAH86DQuH5zseRFHjRJS
         tN4ZI9LeioHGBCa5qrkyaXeCz93UsABDMwGgLoN9NdpcxZDSFDluAwTfaBe5xHOgoZ2C
         gR6csjLI+8gYFNwYUai1aWtTalbhWBPD2PGWoo+qiyq5P9qkKCGuryKhl8VHqMa3hu8P
         BGh40YB/WM7219tQ8h78sL7MGKmiV6t1PchjhWPrhwiCvHXUrzYKWNfz5681RfNtJCXW
         TZ7D5aSnNHp4dhrky+rG5NX8vN286G3tnCNTlortYljGx+Z77pOjdp0QYSaujiHEKTuS
         0eZQ==
X-Forwarded-Encrypted: i=1; AL+hErEBqTNcmPxOm+o1SlnaFKMRqloZyS0xjbJRIcIiXWn6Bb4FOXohccPjH4PX3oG4fSfUqjVsez7l3MZW+gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z94hwgM1XEMXWbgKurRdFEM2tKK+Nova9PKmLFu5YIc3IfZGfR7
	S5kZGU5jiggm8oEDbZnuqtT/02rTxO6t947BuKK/8d8bcpKg+BaXcujy
X-Gm-Gg: AYBFou294wI+2hDWcCl8sjouHJUK0g3VsSXCM5tioMS5bCgM8atFAtCeaxPNGSPZ8LE
	Tg/XPesAmkwfnLT9EfyNSFcFymF+T9S5sy4nFhwHPJwLVCepm0MR0SBUqyZGJ55IluOQtFJOQa0
	hj3e2jsVQy2wgPUDHzfpxbGUghynANVumqIe60dRbqNDnf3p5e+1WmFVyYkGx1vKH3VbCUj93hI
	ScAx5XE9aFIb0YepsP5Ss2hLUHCrO/EwrLVxLRivrSDvHqCk9uqAeOpoaUcytPLAY4giX5E3f8m
	BaPZg4ngyzYo1MGmw+bvoBAdpPqs38WMQ2uT0iGS2VAQ5zGlLM+8qiUfF2enf2CwP8NpnIADgM3
	eJV6lw8lzaKXf3pJN3tDChjtToy3VGv2npLSa+nzW2VsGjymG/LIrhxuFHFmBmE1Gh1B0fSpcqd
	cAj8MAcPPfw9XMcMhOZfT3bph8NnL7L1yW5XEYjYnKZuLxy6szxiyQGdNma4cbEO8sML/MVsiKP
	qn8kOIsnLPVLG0NftvKSNRSzkkMFqeidNzjR63ovGhh3vfHaeCnjyK4AGx/T4Z5lg+qSUq2TmSW
	zKqM4MQTRCYyQKUNFKej1fp2l2VMHoS8qOggTmZCF1S5qAbmn8DJBfOyiDCc6UiJh2FYp+rnPUi
	t2ToWozCxsnQ90Y1oq+VcGfENhbG2awO24jBzKYIngV0ciX4fViqugFFUohmFnKtEjaOlROzJHm
	7bUv9N/xVsQYGlxUSNks6/izinfGCaqsyr9m3rvbDl7eD2nHNRR1Eu7md7qsix1kwQt2JBFKM5
X-Received: by 2002:a05:6820:c0cf:20b0:703:10f3:89e4 with SMTP id 006d021491bc7-71ab50704b3mr4810201eaf.42.1794810586798;
        Sun, 15 Nov 2026 22:29:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:17 -0700
Subject: [PATCH v5 02/58] mtd: acquire an MTD handle from a referenced
 class device
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-2-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
X-Mailer: b4 0.17-dev

PTP OCP locates flash through the device hierarchy and uses driver data
directly. A class-device reference does not keep an MTD registered or own
the backing object needed by an erase or write.

Look up the exact device under mtd_table_mutex and acquire an ordinary MTD
handle before returning it. Use that handle for the OCP update and release
it on every exit. A removed device cannot be confused with a replacement
that reuses its name or number.

Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Jonathan Lemon <jonathan.lemon@gmail.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   | 23 +++++++++++++++++++++++
 drivers/ptp/ptp_ocp.c   |  7 ++++++-
 include/linux/mtd/mtd.h |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 30b16f135f07..620326279957 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1329,6 +1329,29 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 EXPORT_SYMBOL_GPL(get_mtd_device);
 
 
+/**
+ * get_mtd_device_by_dev - acquire the MTD associated with a class device
+ * @dev: referenced MTD class device
+ *
+ * Return: a referenced MTD, or an error if the device has been removed.
+ */
+struct mtd_info *get_mtd_device_by_dev(struct device *dev)
+{
+	struct mtd_info *mtd;
+	int err;
+
+	guard(mutex)(&mtd_table_mutex);
+	mtd_for_each_device(mtd) {
+		if (&mtd->dev != dev)
+			continue;
+		err = __get_mtd_device(mtd);
+		return err ? ERR_PTR(err) : mtd;
+	}
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(get_mtd_device_by_dev);
+
+
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..459aeb24ae6b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2083,7 +2083,7 @@ static int
 ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 		      const struct firmware *fw)
 {
-	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_info *mtd;
 	struct ptp_ocp *bp = devlink_priv(devlink);
 	size_t off, len, size, resid, wrote;
 	struct erase_info erase;
@@ -2091,6 +2091,10 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 	const u8 *data;
 	int err;
 
+	mtd = get_mtd_device_by_dev(dev);
+	if (IS_ERR(mtd))
+		return PTR_ERR(mtd);
+
 	err = ptp_ocp_devlink_fw_image(devlink, fw, &data, &size);
 	if (err)
 		goto out;
@@ -2120,6 +2124,7 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 		resid -= len;
 	}
 out:
+	put_mtd_device(mtd);
 	return err;
 }
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd7b4671c456..745655e0d462 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -684,6 +684,7 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
+struct mtd_info *get_mtd_device_by_dev(struct device *dev);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
 extern struct mtd_info *of_get_mtd_device_by_node(struct device_node *np);

-- 
2.53.0

