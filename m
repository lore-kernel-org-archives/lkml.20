Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009389;
	b=CsECyeBpgw0JnvRm6AO57P+Zi244LRcOE8FFr6DufJ5bsiducIkQoscTGTZrIGnSL0ix
	 ui1QBsDA5ysG+MsbAiqEo8/YM18QM90kT+l+qoaSl2kOR5OSCMAX6qOFDtAwgupvRE2ml
	 5YwZLF+EHtNgUkTCcLFKrxDKDGYoe6wP2REbWitsfV3biwmB0JqVj7bNwfBbfqFb396eF
	 c13r3QDQC5w/edb9IXc+1moW5KT0J4uT091Zf96dsXcVNd14sL9Fu2Xd8XRfaPQeZ+aIK
	 FSPsY1hoUhDXRyLmeUcVar7cX6LLalxiOKGerHJxgjG23NO61Bm1ZhI+JUdx8atxEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
	b=uwmHC5tnVxshbnjtQmqqyw2AWNOMIHs9JG3vjvJzOCP2f4fVjnr/GdFNjRYQ/v5apglD
	 +R8eW4I45tWuSZeg+H2VK86lisaP5zi55bkW+cVT7cGxks9LV/cX7vRNikSs/qVZD2/mq
	 vz9y3faXWm61IC2SJWJyJ8kfJVWai8iM6grXoshGLzHWlu29s5aCJeRyx9WtQrnl2Qid9
	 /czIxGNqlIgDA3G5Tzno2l7h4n2E545IISlhH8OR1SJgkYHWJmEfm0Zlg+KfqO5EkSeZh
	 GBYx4qK+byVVtdkpJWuIxySuTq3zqA4k9dIR0udR7D0JrY1bvgADBcZd9cqDH3I347g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Eo9WE8Gq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0641606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0641606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Eo9WE8Gq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16761445e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009387; x=1793614187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=Eo9WE8GqJeRIO8Yk49GNUKL9w8HO7vFAifgdvoVxif0tOBPZwwU7fcZcNRgcAsq6LT
         +XADKvBjNiRsO1ZCVV9uJhLBsZ8ja9Q+OysK9Q/RyaiaUejgDsAaWtZydNKwIswVGznI
         ag4NQl+jHWeGZj6kfYmGS0qu6zzKcAdTIPqDk6IhM0AL2kuhOx21RYyKXiT2W0bP6T/E
         4joixoz/+C1n5AOQxRj8LuvirLbGS37PrI/dMtR1QEPMLLpP6vWjHOmTxXzGqsM8Ua+j
         cA5eFJLO+Y8XptHfa2gtcCSFcwKXcv2grSXuezNMoXCciuWgIuRhH/bMZn5WNGIR4Kfa
         hVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009387; x=1793614187;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=q+0nyGIEjOWkG+MtYtbyM+Ivr57sc2kxAIqF6Qrw2Jzgq3vs75og+yrwpelBcv0z18
         2+Sba3eGGPsFboVK9Ez7LmnyX4CENSPv1Sq85Mk4+HoO7nZHRjA4MH1VjzrinF8lzTCo
         1YRfH1QtTXl4KdkBim8SzDANoYnfWwQSzY365/vn0AnpBC+4WhIY6jtHjrNFdu6IyvLz
         3qcMsJh9eSCSXLehrRWKuixTLUBNwy3Si0I7j6hg6WTOI8Y5ZZpCyPq1ssh1DfFED1uR
         wJZFDX9mRQFdRJppnuzYFOaRasnWi3R0wQv/qsLWfVJa4pd6S+HHUk2sEB/VWPL7xeje
         dRuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzaMWB/JdFBdJqAb0FFDmFVPGSH6E9ZFgkRsXiTb5Xv5DXodhu5/A63/0pwAy2EeicSUvNTKBKKdQZB30=@vger.kernel.org
X-Gm-Message-State: AFq9FYLljw6/Ia4PDwjit/qex7Db08WtsBTTBI0R6ppdVqdWk26314y6
	XScedGF+SJeIy8JR23yHLWFNpQ8Uh0+b/g8VQB+bxlPTy0SzUk6Bzpka5X2pwtn88J0=
X-Gm-Gg: AYBFou0a5N7wIGUcDU+nqfZWLECEqqQJOQ7JP9jktRforj8D41AyQx2/oW9PYChuOZr
	5hi8g5LzcKyf2L8fUC3pCesDLgWppDgB+YyaP2nRbVIZ0ncARyO9QiGoPszf4yJz5Tgf0YXn5Da
	saKllU1YOZY3lDefuV3OnUo1iGHlkWTFXXmOBv3Y57b4sibHLWReO2Rbbt9tsT5Y60zLKsXVw33
	hZZ/YSi91QCz2HsgHThKzBtqiDw0sLHGNfJN0nKdjwXV9hehr/jpCxTsqHfSCfEeyG06ikFDjXl
	fTd1EcMqMNSjLj+yAHZ4EQgrx7xamRD8FkF1xPV8o5Tw/eP925kocxtSZ6JjYUvdNNINYMHML5D
	JUofiwTsJjVbFH2pTZ2j1A45viTBbQ+YuGtTsz7PfKes+Rvbe7LoAXoD7rURY8oVaRl87NO4wX+
	/63LRJQHG4vNmHx0qiwyKcKl33yUar3eI/kIXgrASToGSmycqxNGHPCxMSkYLsK330ri/BIRQdG
	vtcSssjxxI4Hq/Tt8NZWEOr0Ft5DzhwG9DMb8rGJnlsqwnY+8hjzu6YNMQDXHe4tDIDonyOzJp/
	GPI1Txh0Ll6Knu+ZfLIcbYSRrg2hlZBHchUf30FZBeI=
X-Received: by 2002:a05:600c:c08d:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4a373be2a68mr73417995e9.14.1793009387038;
        Mon, 26 Oct 2026 03:09:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm178981245e9.12.2026.10.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Mon, 26 Oct 2026 11:09:30 +0100
Message-ID:  <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4531; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iP/a86pijHCRmv9wBS5FEuq1LQ6MVYUXu9CglvvJMck=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3yberBd3EQ5Kxjbd3sOQabalehlLr8is9shUn Mr7VDefgJCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m3gAKCRCPgPtYfRL+ TnoBCACmPXG59pHH37OKjk0cHYhrDhchNp4kPrX3S2palkOtr/leAierbz+le2U+7KOrhvBU7KO OP80a7baa8OKpNF6noVMplFsMaR+1zwsJh1ljDSDNIWaTCV0iSh9ffxQCGITsepdNgcKiJx2+8Y zc1UyNiNySdsVvA19Uob6xHpTkz1UEvdmm9MBU2AU3FGEV7jED+HEIOSLn0cTCC/+4gMJcR5rWz VpfXJVB8ddeqWCanJj6J9nA9f3OrlROMm3uV8+Y0L6HXRJFE/0BlFpH0w+RJlUii6GXn0RG4Ncw M6aTTX3VJ0mn53FOzapKvPhm9N2hPV+DrHOkOouTEGWRCUN3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data.

The new callback can be used to implement just the driver specific
memcpy + memset to increase code reuse.

The patch only appears big because of indentation changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 63 ++++++++++++----------
 include/linux/remoteproc.h                 |  3 ++
 2 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..0698bba2db89 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,44 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..ffa22c2f04af 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,7 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +100,8 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3

