Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593717;
	b=2KKNU+zqorVEv8epk9dCSaBX1YQOtcn+xEgKyg0Wb3VGQpM9gWfy+HFetYiZ4B+aHNen
	 L1gtFExk8t//kjDf0wHLysRqmfvG1x4VLoMPG0866EcunAK7IQZleL6bmvUDSsvhezUsc
	 C5SnZ35vpOtDlfsePASuZ+2LRsCxWMEA2LtwWlNL1Awst8h6S+AnNHBmxFQqIeStCO49k
	 mvaAjRrvrUx549pqufi7KF6o/5CmtwxMVabekzdIqajAtf0EgFMN88Hnx/3Ojxyh3E3Yz
	 qrvYWAjoKl0fIh4IIED63+gp7yo1lR+vdybBBk9YUpPcP175aB1Y6nR1OKknQXjVE/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
	b=PNXQnJ4b/hmyHoCHoqyPgCC08u3e/APza0iRGcukoDnMo/KVKKZfwZRYacE5tBI+eksm
	 tuARhzyOh8uvl8cJ5NA0Qxm/yVnWrxHB9ME4BeQ0jSa8ckVWFsrkvqslstw6x/ja3qYsR
	 0F7vTVoqm0rGSP5VsNslJxRP1t3PtpEdiU/aDVUpkadgACpeTvLwKxkhXLDS0QU7L8h/e
	 QjoXjwSlEQjSSG6dmk2M0ViXIjfMz6LYyUT8sNJRiGTFl6RSzVGVeOqMygBVIzcgMkDRC
	 r1xQWP+jyrV0gEPiJ8vf09UNe6nchMtge3efnhYJk+F0+bVjiUU+kfqUTm49dEj1MqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvhkRJBQ;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C8606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvhkRJBQ
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8256106635eso518965a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593716; x=1795198516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=dvhkRJBQm+7RliXll26UUx427H9yjNAbOTb2RQO+7FQ0RkF1YEdPtmWnzQtiSkv1eb
         eKKJ1QdlDFlIFfPXs8gsu5SiSqOkJ1Owu6ACDx9xkGK0bkuvil1dTZUlKTRDDq0JYWG2
         3qtXYjmyEvmmpxOB9JPHBSa430MTECIC63kUEDmWpW86DUhY8NpesDex5tRtLEiDI6Vg
         vYYHbDxRIrcNeDbjfNKfP7lmrXVye84RjVay7W5C9Ytjm2ITKY5QNo3ZSKAupoi4x2gS
         saKFYHF3RrD73LVYgmC5nPwUruFI0+3O2CjICYHw8dcQx5aGjYCG6bZWjl9dMm5oh4hq
         G/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593716; x=1795198516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=Cfq1RnL2hX03pOqmaUCOs/CFoIKiJf1lq5a/lNafingJBGnbD+MiBmD4PEaFwQlOXq
         Z+UF/0KQeo1ocMSYls3qylwbFtTAMauX6YRrJcql9wYvGlFkAKPh9TcZAqh7f4DhiZyZ
         EPpivRZmivuJ8VLfwrproV+lM4X46s+x8P7azkIebz+NQCCDq2b0XWatd1D/48deOqIP
         qUiSUuVYpLjVHho7ZiqLGsU65PHvB7KTTF4V08Ge75oV/FnKpo1mnuZd6PrjdkwW7QPL
         8vnvI18oKHYod4BdZFN5f/zpVuYp5P/9eW0aynQVqFcX7vzOcNA9HJLnx78ZrT4xUKMV
         VtxQ==
X-Forwarded-Encrypted: i=1; AL+hErELeBIv1Yg0exKYw3NuHHpC3uObR+wYe48QLLPwqBkhPodUylvuEbg+X7JOH/rsT8gYJIMNpQOcrgITYGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2XHB+EpsUObjyV8duVGH0lQVPPq3cDXOd7mp3ebl+N57BSip6
	eNztJuDWN0s6w3bvNd6x5UGoJM5FgsnkjWQBSeZ/0YuNHErj1jZRdF8DaMXa7c98
X-Gm-Gg: AYBFou3xqq2/Wj53ixR2z2JexKN8BETQPTtxGfMpyD0znntOeTXRRijxY4blEYF0zs6
	AsLe8BzgZGuU7fG1P5V5uvYT+09f5s2ivbZdWiBlfX2iR+ia1Z2llLUpsRx0XiFks3W5ZpFVvat
	tGHdtpHzDCZhdcbC+6Z2ajR70ca398WwS54A5i77JoHHMtB220oTnoXXBTN2SKdY2/Nu6ur/zDg
	FGxJVXQCKfzGFWAcFtDnX4bGSVa9REIZWFluH8T5wqT2G43EWBLocScHYoZTU31aveSO6Gc9HMW
	ET5LLLc0Wz/06D0eJmk5OsOvVDp6lMAJdJzcTxT0vgjfmmi238xPdxjudG3Bj+vhNxZYp1QxxmF
	p4A++l932fDk/Wf507cSbZXOqa+g/Lpol39uHKGBXuQD1rmMagBScBbwttN6keR+QwV2i+tooHq
	dazi0VtEAjqntCcMXaSichgLDT82geuzHYjibzNwQMVBRMgZyMo/7uhNy+knAVdAslGrk05MiuJ
	C4jfQl6LJIGz+m1rjEJjClbBUtEr/Eig+qLafko+bD0KwFN/dQzdU00se4OKz1sghubGAAODqrQ
	yGOSEZevO8YiJ4ZvXGxKorPZdsyvFLWLA1DnKrybdGYwB/wJZD7lLHuTroEqeAYOilpyAnyB4Mx
	GTTWKhXVm8Od698x53XKAsBPuoCxAZ+hM9r2TqTnsv6L2GwrjeLPU2jMSCHuhJF+V+yFZshQcax
	eja4HqLpQXpB/rXLC2dwMbr3mc27nKA55qNmuEoDU0vik2YwXcTNxjCp1yJDUHiq/3RBgvSkkn
X-Received: by 2002:a05:6830:2709:b0:861:57d7:d6a8 with SMTP id 46e09a7af769-862898a6184mr2651838a34.21.1794593716076;
        Fri, 13 Nov 2026 10:15:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:18 -0700
Subject: [PATCH v4 02/58] mtd: acquire an MTD handle from a referenced
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-2-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

