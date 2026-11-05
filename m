Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880009;
	b=vFdLNatPiL2jPUkdqedaggLp8nFMU0Wl6Chv7P1ZVA3PpGZ3NczWtPOHUswNFFEv6w4q
	 GcTfm/ebuFZVUvWtbvjj3qk7i33ME47Vj91GaUEmuQl8Wo4hDoXeDQp1wFYHV45efY2yg
	 H8UXxX/CHbavEZ2Kun3N8RcfLWjcrd7ikchb51WgU9L9l/BIjnJ0cwjbAN/kR583pSQDU
	 1Qw3TKOUP68iIgb5OxkwCDtsc1mtCFvzO8IlVK7wLXeyPh6I0by2GB4zrsoAK+LbbH0Hc
	 ya7okK7SWblwXplw7Qn+RFfKPms8Mim5wTOogpLok3Gxq/N5fgSRqenTNMFn64FqItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
	b=mtx662JI2B5bEEAAY1lESzWu45cKGSJ5uMAjSqlaVo8hrFzVrnj+o/v/CFdkkwDIymVq
	 yx8A2NZtXPg4cQBVDZXtgIuiE0Y3qS0crK2/bVCCu/QqI8830rMxQJ2By2xwnsUCXQ72c
	 CZvK0lF49qTSyGQBdOyikKyuZ+K8byakBrkL/cCbUoAeAg0eaq1viSgirvwiyBlZObiGz
	 s8RU2+fEiF6UF/60hfa2tH/xg/fYW4K0mGZV1y7Di1wk9GPd4fkxFFgcFbjs4sFrZzdlY
	 Li473cph/5n4/GPcCsdBcHD/v0d3I+xBcOOZCaKmLch1SepMAPdIjqKK5EgSk6F/CBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ACIntLEs;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB044606D80F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB044606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ACIntLEs
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13888905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880006; x=1794484806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=ACIntLEsyxBxKA0gcYb8VuqBqXXrQ2KYTGR+7ZtV3iHg4P3w2wcn8bEVle48vYXnu2
         e2+zndvzHtX0yKSoc0Y9dcYnhfM3ym6C+gZ23mYkG+818nplIb4MPkhsqDUHSJUTytU8
         pO52J29qFJ7k8G5C7zfWLsTr//nsiiUp2fvcK+ckRyFMy0pj/fbZIA6NgXnVzFLvOjuX
         deXgDB6LolgVysDAfVpNEoAjMfbiKUJkggHRnlhhmuucxV3hHcHnTnu7y4dEpdzTGxgE
         ZCew/+eUousg9QY+ujSRmkcmisxOSW+eZ/Gx+XzOda9xeLgX9SB6i6rhd7vr97FfWotf
         SYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880006; x=1794484806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=WTl4sANQ47bqYEyjuZdOFu5vStF8EnLDgQTYRGR9M0NIqvKilWKAws2v/dOzTYhkHC
         VhryHPbugrKRSPwL7KiS+8DKupgpbcj7hru3CGeTIibY02XxlsBu57Psc0vb+QD4f4eb
         wuKtX8WwfJieGGvYmlTQLkY8nklFmE3oTkrAmKqUZJiWikm1jEWsL+6ujXGM08I2VnJ3
         KrSDbcqLOmuKmyWUUi7vkVadpjhaQCMzEwl9cdrzNObvH4+2kGcRqBsIIOn4uip+K/np
         9EAT+3DnNy70Y9eMb1SqkFFX570VAx/b1a11bM/VIkH17aqM20tyJnckFCYGzKhY0uDA
         eOgw==
X-Forwarded-Encrypted: i=1; AKwUvBxVFJA1s2t9+0OG226rRXfG9mXTcaeUECR1WikV8U0MGgCdLs0dg63exja84qH1E53jyVI2OLaUlncMgko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sz94BzzgsSSLisGSC7DKcGCZ/oZCQm7ogat7xc3E2ShmfQqni
	i4d1xrOLLXJv3m01zs+TB1H0TlWXbobWuSLqYSWQ0D3uyli36NQ1uDJdZexh0wl0/YA=
X-Gm-Gg: AYBFou0DVuWjyaOnCgRj8Y4QfFoeAka0754pvCtu1RvseVwm7k8kgNeujcAb3DkL9PB
	Czod3bd3ESvy0I4e0nOWeES/ALijF9f8aMq8rREb9MSQZemj7B8sbYPsZqPRbmWAxsjfe1bcm6X
	FWq4pms/y1AFNNOf2RgvI4jP1aVuVu59HxH4jwQfeoQFZOo+QyUbrua2hoN8QKRZHMxX4WTJmT0
	Y/wAjcFQqwRB3xHskBlf7oB+nGEr+xpmBdK/sk47lMQlIk1qM89vGDTeOZ/aFX00YofoNZgedjU
	FSdVQMtqZQhPAfIZhCvpG0FeEb76dhg/jNnGLMUafIpf1+yizWFAFv4BYG+8WMJf73Tc//7EZBo
	RsLGdjHCiGO7xqbFyKUC0mU6mEXcqGxsJ2eUjFxoGW0f4BTvOKPiw8aMKAiEIu9QdrWLrfC4yZU
	dY9AeLKLc7KpvkqcYCPSGojEWqFHcMkPzETAkOj1eunpHUNWJvjexrFicjtN/Ss3xjph0y0UnQm
	z8XpJczT1bKALKulbqdMC5M8agDXTZ3Fae2u/tQbJrZdGHlNkdNQMvQe7a+tlP7TV85T7FSIRp1
	GGPUrQ/SK18PYviFWfDe9TASsBwuSbx8Rnz9qBKQ9XSVZ9DJA5k9SuJqFVP4SxNOLm18AjokqTX
	xyxDBefmoMcAvgGyo
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr436813095e9.13.1793880005590;
        Thu, 05 Nov 2026 04:00:05 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56fca22e1sm73091395e9.14.2026.11.05.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:04 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu,  5 Nov 2026 12:59:51 +0100
Message-ID:  <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z/fCIVp9RMJTrReXJyUJn6ua+y9sBVz+x0H7XlZvi4g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+5Gk4Q8ATYuAmIR9DTokmwc///VvCwal9RT 0Q+SzcLu66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuQAKCRCPgPtYfRL+ TnLPB/4nC79lPyLlqp10Q5F7ECcaSOk4HGB7s1h+upM72K8ZIRD4qE30eRuvw0eeyDwVqAIVE8p BAor5pNJ+SP4kvqA2oIUxtFqWsFQMOxAsHbfHs5DcCYjvyyrDc+f72Ax3/eiQg3x02Zbstqf61+ knGCo0cgViF8bSvnRkn7YdfeAdRWO06P7TUfGt6LakU0STGCVNz39MGsiVTdEqzYERqITokSStT zsuoA51dTkKAnw2B1nPeUAqItS9etWoDQCm9xeYoCPk+vXUuMUVleKV55rUOUBSljhUqx/CEgAy hb62FNMp4EmG3KK5vjaTGyiCyOvEyljj4nM+fDYQrz3yepib
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  4 ++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
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
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..e750a127cbc4 100644
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
@@ -99,6 +100,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3

