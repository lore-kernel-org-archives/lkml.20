Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446911;
	b=WaqxopRPzknxpcz6T0GmCxkHv3ZvfUKlUSzyP0ssL/9ts5eA3qzgBd06607z2njqoiN2
	 jZSEJMC+pY91ujiIrhHwhesJLGs7gKCGTq3p5HBmVlh9F1Lw1635EIgH+qq7rjR/pSU0M
	 VQZnIZvx5b887YB8dS2vDt56iMBHLgTS1JmrGAKCeK56qzagF56Fqk/dsglZKFAwuWQGq
	 5W6rE5NN0s9eehjvCb+8G5T/f3WrB7HO0vSt7T7OdfOUhy+DB651Rxbw2DB2Y/dOwQd0x
	 HTg1Y/4i2rk2QKnzUbHVDXCEAahdaG+TxQ4KN9cAIFSOICP/sxrSQDrQvV7pjQqYvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
	b=ouKu5BqyfFwldGccJrfonm+hImouYNxNCQ5tsFdWEaAm2ohKCw9fUmOujPHGW+wqbr6j
	 oD0fREQIrEQKIK8UYObfgy9a8xWU2OAjiVn/syUJ0SW8l3wx610z7qGBh38pIOQY5Ari7
	 QQAQr6wXaXxDAluQp5qXKgMQEY8W6QHm9NZKrxLt+j5HbzmbwMLIMaPAdNPlXB+kEzX4O
	 HKOf4YIl3qS/C09cVuGOaCPM+zKfdfhLWgW63lLCnE9CGjU4RfxUrpH2f/Oz+wyplRQ8w
	 moBY4TjjmXmBwCr7uFeelMOpUN6sRsqv82zzhI8SbeArK1oNhZK+i2M/OxRENtR6TuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLBEHgY;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLBEHgY
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28d9537bcso295811b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446910; x=1795051710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=RGLBEHgY35a1QJidlNJkrMPaCUinrtBouLf0UGJ87fb3AjWeLHnVYGuPvlBd1qDvQy
         hpXYFAGP2KivHo23rZadwrWkfLqyzcQDQaHBVj97xBEnouM+X370rxkMXATRaweyAyTz
         wVu40uame3xTaNFwNQOLAeeOl2jrnMB129VYnx28ebnEpRVA+AjzbBbher2gUSlSQU6h
         iSCPOz9U7b0LHEQTXGjFEkEG/mS2bXb7SSvo8Sl4a9fIMxfxfLZ/JWMOREqPlXzvYfd0
         TyLIQRQmm8ubi6kAJA2K352KL1aOeCVKBLysVwVynwu+RiSXsFpFuTBbDcBs672E+/6T
         Uiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446910; x=1795051710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=SJjUErpHire2CaLZfVEIFolz4QkVDHSi74jdcJoVobt5syLEBxbQ8f/lWnwmoKgGcq
         K7QMyqKQqeudaNdeCeqtXdbaD+f7DQN7W6TugSGYxRCJ7JQvX4H8bGMt3OrRIYlgbOlQ
         kH3CjrYFwkGY4RwG9hsbLVWONAtdCgoXB7I9eHdXLmJUelI+6jqSPqJQaJATBreWD6X7
         OgcMoBrSiVDwI0C/6Ff/y8AR95KWSOf9hhE6dQugGmGEul6bLcUA4kwZHTSkxF0gTNTX
         DksrolmsibtEVrLKGvAOAJtnEN6/8yQXZAOz1TPJ4FBC9WaR9rmDsRHEFFhY1gDsb/o1
         12Bg==
X-Forwarded-Encrypted: i=1; AL+hErF0muP+ie4WApODj1N57eLz6EOCGL7FEOju3hfNQmR/1tfP7GaiCPl4IAoyYn1i/Qo1gBTd5QepNOZke0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nw/+XMbDwD3bPcqxEX6+y0QMGnOKeHe2N0FqWrYeaDH2BIYo/
	foKNKMjb3T9pgO8vcoWZg/RG1IMYcgTFf+sWCcIlpOSrZxJU5XouoLhv47s4XFHv
X-Gm-Gg: AYBFou0y0/MOEu8vtajGDKVRIaYyFy3yFSrmi3N0hOkajLW3yuduPh1JuA+CCBQ0vY+
	ZzVIqDWZhHnoGvQErAIF4N5OhItuPj1qoUZYJcY470oC1YalnaWTtmy2iwwIRRpPsinVH9LoJUV
	NLC7vfev96g56FzM/n8f0BsSn/q6pLZl70vhY85j4wZJWnpOz6wv5N3J+V/V2m/lmb53n/9oUEC
	Uno0BEiLsjKyffGfGmMp+AtLvt0bASUDRruWkVCj17mKg0w3+NFkof63zUHz8Uv0ZniiPtz1CYI
	ExxJyk5BpT8bSG0lCLHDxd1I/xXj06ro9a1EmhBbmAqbmceoQgq0pBkKD6ZA4hXGLMkKbATNrI5
	nufEJrvmNRuwgt54akrsAHqXjq0pM5/NpAuGcdTArQoRNrcUhAC9foKEouEsYXaWZD0uJiQpXx2
	OS/qbj8i5gvp0hWQ2cBHJfQav7XOHEAvxqeCzO050uE3b9VBgA2Z6KPkVh9RLC0QN9+1XlM0477
	FgHs80MhTX8tkcpKLHNpXlQQv43uFSxVOYayqYImdAmpgCAbRxCQ1CT5LO0EAP3YA93DKgOF5nD
	6x3GOLrUeKp6vy7vvbQWvrsacI8xVilWW0gP1HcU5aDqHwycmZKm+iZWTUAEsoNC3/hbNHA0hIu
	z0x3hcRgytOzxCLLU6kMNO3bK3p32fYUqiVSj5C5adOpQLd9dz26BaSOJCqbrxvWN4nSVYX1+ht
	cSo1Zf3RUE9T8KR597Fss27jIBvW7/+Fer9BZAg2+J4NTX8kpO7ntl
X-Received: by 2002:a05:6808:1792:b0:564:3fe1:2f9a with SMTP id 5614622812f47-56cd614086emr1127864b6e.17.1794446910057;
        Wed, 11 Nov 2026 17:28:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:41 -0700
Subject: [PATCH v3 02/58] mtd: acquire an MTD handle from a referenced
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
X-Mailer: b4 0.15.2

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

