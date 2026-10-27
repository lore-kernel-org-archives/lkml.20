Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118341;
	b=MeFqEdO786wspoqPUXgsKurqYAk0TpSNTevn7xDIN2gS3yxqWPTWFGul3e2FACoOaxvl
	 P+0fvMgsnov7+oskyU50+YVnIZu+u3QB8LZnVMlPszNX6n5Rp99YdZ4Utb9/VHt1UnIX8
	 YOkqSSAwXk5baPQp31DO00irJiCGed6yZAjAMQbUKogSEprWf+djuxWNnstt/bjG2tWaz
	 CUkZtppwdAITCx/PefWb8kunHFQ15mZHOvTk/Bkbu7s6h2PVjk3cAlve+sEPRocynoM2j
	 5PMQs4nI9TXSXILJAS8XwyChCVPixYbJl0SE/vMIY3vBw/a9uxG2k7OvcRIirqAR/yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
	b=cS5rg/Lio5A6G7aTyIp/tjtLv/ozqSTxJt/5xyV6YWEGqVYoAj0oK7FKgGydZ1ueN2+6
	 jQDvD95YOHbfitpeZhLj8yJmuSjKMoT1MGUhKVtzFI0egbXre7DdnOitNkD6IB+v4XI/8
	 sjcOtY+PfzRR8odeYiySaFo+9cM33Dm10am7LN6RgAwaRrz/Oe4flfj49Jt2xkomDylJV
	 oVfCdeVO1366UZQTE31g1oSU1qy6ht+nZelp3FOOjq7b5nWnBMn6t9+oUyaUBa3PNCs4+
	 lP4bftd+Mpyihw78F3bmT3iK7N866YVcQICk5wkfQ4wz7u/XZo6MrfiW5uRC+COAZWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XntsE0df;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC4606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XntsE0df
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so332025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118339; x=1793723139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=XntsE0df8iQ2Me6m2WjPwmxpXabuvZhErsiMC43GO9L9youYXmhEX/TmtMK4jS2RsI
         k0cto9MMji1ODg2IPb6MNHKQ3O8OKjcY8LXlXhlnUyhRRRXNXdlZ5saOldJmzBsSPk5h
         wrIkVK0Ll2uUac6zYA7iHO1+sG47pBiDNTypuokV6TsREDhCosz4kmBCCdiqkEW6a4y9
         yj5LJLRZD/P0WJ+9sKZJL8+rYKY1FmORlmCWOcTB3NJNY2W4KNjCyX0JtwJbOjtvua2o
         wdP0TsQTvHcwywI+S+69Bui6O7cEnFmKNleYrPFrVnQ6hiRg1o/vOWIrURe5WuHx8pXZ
         X46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118339; x=1793723139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=YZGgRedahTZPhLhBowgwBnvGq/JbYviy9Mfii5DE33NEXiiS4Gr/p+EEyxIIRsO/ex
         CAuMkBPYDQ2rdaU6ewlmrzP/UECjdAsSoxzdDmYttLOzrHuvolL6Fk37kFNC8ktqElab
         smQyu3x5yQr4fi0qlGNTYzoA6CGs3MvHPEWOlStm3y4vpCH/u6yQVv3czjZt+2DcjjOn
         TRqtLOcdZQ+Lrwx62eaZ/Uivo5Lgw6QoekN2d6NRmG5gRAAlpK80w71tkwkb24DWC7rg
         FLiD5721XN53CHH0K3Zj1cmDIvDtHbCwYMQHyGzakeQnggzy1CdeL++xyLjIZxRZhD1V
         gDGA==
X-Forwarded-Encrypted: i=1; AKwUvBzLbFaCq+Odhy3xnpBTm8AarJJJvUJAwa1BPoVI/PBmlRSekVV+3kxW7tM+V9i3K+BAjbhAbuX6mQLPyVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRbr9Be1AGB7IYvNfkAfM8fbvGsP09RNHp25NBGmxTUxkQLHou
	lhLc0fguNL5VsX2BYNMv2psaxyIOFpEeiKmsm1poiuLRrU2NAFgC86HZj+YauqotqravByfASF0
	sG70dGGo=
X-Gm-Gg: AYBFou0oscqJmuOmb895vxvbZRJeTzu4z9NbnhG7qy7uhCA8mDbS7R9VKyME84OEVai
	P69JVftQN+nFMSWFhwDhFSx7dWMevVYLrU9y56ybZwQi5EF1Yhx/YY0SAG6aO/GZOytnm6vCwC9
	1yY6bvu7dzoHJnnBhacEHwaMZFGKCVZAPJoun/7QEX3uRgMR94Qw0EtYR3/ZC9z5CbcFPj24EAi
	ZVLsB6UeD63QA7DI1jdXAfTmUiJ1J7EhQYbBpYG0MUzesTiNNrQPWtT2MY9g6MUAuCadHMNFAVY
	5ExpyfDZqdJBftRbWa/nWzEPdZ+YOltgoJWPKYYSW/+t+dZ41BYuA1xQP7oHcrzsF1tEfKUSU22
	Tncx8TS9wahdlseiE8fgpPCYQlaOdYW1V3cgbyN5gDfXPJ9PD2Wqkm3T8bhYTuWBRW2sA5v60NH
	qbUOc1UZDlDDe0OsiJZGD7J5Qu3pf//6tBkizFRCLjP09DClx9C2IdRGke9Qq/e3VAD/hZNaU6/
	g/nkFgvK72wrrIUsoegzbevr8xCoIa1bN3xWjuEsktFp5Ep0IvYvnbpkYfZMqvizwvJWT2GkeYo
	0A8y+ZJRK5vWHdPacMtyrNoilFpgDaMlGM7OaTKXb14/8LuTG5ITbnkjCNSxMmZ3
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr206232885e9.24.1793118339017;
        Tue, 27 Oct 2026 09:25:39 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb8e0sm22996206f8f.29.2026.10.27.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Tue, 27 Oct 2026 17:25:20 +0100
Message-ID:  <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xVwXpYXWgABJZ9x21P2crTLydOse+u663MkGSpQhphM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB0UKaEa77WgrPF9mWEd8jdnTucff0k56SvQ /7jqxppSbCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQdAAKCRCPgPtYfRL+ TmQRB/41RdBguIWrTGSuq3Br1wn3037QSqHgAqDnMnMeug563he8OY8v6f+CtVGPgXSx5QVz+iA AAq1nMA9eiM6vaqNfUMtAhSPOpvyFx95JPVD7XLogbKEFxB/TC/QRLOmzbrfadSBWZefgX4dEKe Sx6sL2irRsarkZcZnLdENK79iV81WsBzeqN7GynA3EJt7w9uCXsaEl+a22XMtcJHELNMuSfyyNk f9Kcon02OOS/Ia9yJQkXEQEL+rWybwPQNkGOZOuNn35OM1rpH/oY7dqIkiTMh7WyypOJvwUI2jb +9Cz47RoIu/eQrSdVio4Rx2d3oMxR10j9nrhGxt+2VMqMTYj
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

