Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118343;
	b=RdjS6Tkp+gVUAe0QSZjYJ0lPlMyLo8bOFja65oTQlFzi0rNpU90PJztbJFZwGxtiUfj0
	 2lcC8tbltZ03cYsllwuCKI5fGai/X2xq0VD02DWdF9CCg9i0ncABahIreFWACIquvFrOh
	 WwZijxSdEym7QfHXZn8v8VXgj/YLvDaZkBwaYxUqXXLPBOdbwVvwcOmz70zhliXmZ2kSH
	 SfDuBGmEV019KBnJaIw3DKaNfGbbYZWyr6PA8Vm+7z9hc7B5LZwTi1UsJqy/ABa8Qn/Wv
	 mhkl7nJLFyJ328tDK67FnmiAYdR7TxQZ3OGN8IludN/jYH1KHAT8kyjdAZhqArF3nOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
	b=JZTpxBoj2Iq/YPS2XaZHEP20DrQOTBOY/tK4QqPlD6PpUir88PwMdoyL5zkDbH8pIpgY
	 ofc+3S9jCWG45wMvlKZgZP+SVj51PH1ca3HHD8DHUjYJsLOhlNaZ/mX0q0SlFxFiKcbOg
	 OedoeFkC+5Mm/1h5z71yplVAoglid2Mup/bhEgdIqY3N6BSQYQR8iYkDM47kRvZulUEz5
	 m+/20yRCM/dQg7O/X9HIJj97h5EvGCQlR36IcMHnz1BiFy5/uBvy40G0mgqupvZfxs+B8
	 cOyyj0KkC8+GhtGa/XShX5vtUO++qbQgc1jhUKEa0970uDoQcsgxZ12oD0auek0ZdgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G9EGb+C5;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8060A2604
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A8060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G9EGb+C5
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so125985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118341; x=1793723141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=G9EGb+C5NP42kcoWOVWgpNJEG5Q7GcOrpQCaZJucb117xrAfPruC/9fRUoLNkQgiYS
         NTQsYg6gy31DPkwT6WMOmF3G4za+hpTXKTkfdDEiKfZew2X8A+xZAHBS8nq+SqVnb+C5
         RwQ2f8z6lFOx5ie0e1WJluCYsw0lwrFurob33XlgqgnftvJot12Qtf2JLaNbpb75GPKn
         hzxLBW1esKb3b3nBxUSoSJkxnuSwiTz4WZx17w+h2NUPi3EYIEhI0Mt1fPw6qeswjLa6
         o6s61WX4sbbF8A4FkimY4ACl+2Bf3YZm3yxmRl78JJkH0fgBtnjQQ30PmtMPg72L2Lu1
         QllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118341; x=1793723141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=y36CEIozOxvO+2fHTrWPxUH07ukBuOYRTMnpIDmoSQzLgJ16S/sfEhdcxSmJZeVjjM
         ESjJqYr9lhMvW7PbHcoXz7ZGbLGHN9eSQjtwgQ1kAT9VwXuzXWefOnxCVz08trBolAu+
         ZlRTZZDCR7qYpiUHiNklpf/C1z2313wkAR45YeqSAKPaZ1lnYGOcpbIn404d50E5vc8b
         yc/Fje4a86wKnF2vgyyP0jSLxECWiPgTK7JECG+bAwdF/zRsHnyR405MWh5K4QBvtrY+
         WNtmW2sIXqvEpx8BmvkkQTLiLWlvK/F/AKmsx5DG6dhhLrdtri7caMl7K8TLb3l82n5O
         Xyyw==
X-Forwarded-Encrypted: i=1; AKwUvBw2fqZTuPf/HdL/JFcutbCcL37+FVGgFnTwcvr0jrsEhSb4tdNbU+c9uK3aK9gmWI9o7sdDVKP1otfMOpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLImvWCwe/8PQuTat7nq76Hkqyqqd1iiW1ssfz0pjvRgISglDA5
	lWDn8XMBy8T2dWn0bhwO26zQCjd534xzW9LUPV3C7KO+VSDsO+TYXEv4JCiwHmbirtw=
X-Gm-Gg: AYBFou38M7UHoev1oejRedbo7kbFqERwVSmyjpLC0VT/ZpxN91wKn6xdzOMlwhOJx21
	kmfHYrLZzr1qwtOtAYgn7IyOAjd36xP7bZa1RqM/ANixq66HlUHo/hHBH29q0Tc0N5Lrjid1ktA
	xFxKbaeS21HrdX2cGAsF79jD9ksoLUWa0NhyHCnNiherhynqyiEMr0uVOO3ZgbKmuzYq0ANB3pY
	9It67bCjm4xQ5hG4twgnY8ipsXzqTVkhRT2/5n/epfg0hzztx9SvK3MB1+1OTdHUezG5a+fOdz6
	+Bvy+y1Ijw00ppCSj4NA4f8j5W3t6f3fxslXCXt7otm5vTIvl5LTtcFDQdEMa4xzh0xeO4vacT1
	/hhv3/dR9Q0FFX7oNoc3EeBKFEISwUzijSg9PnLTrec843J7XwF1WrsVGcFaPyBw614AYkLmSA/
	3LJI+isJS3LtsUw1uux/XksFjIv3RgsQgrd+pAowkXDNEJGq/GHs6aiaDcCIRKfZ6PsrT2eaKl3
	efzwraRlX0MYVHLrds1DcdhEUtKO5gYJAQxbXHmnOmFe5c5d/DAeigBWkiUUnGbX5hrUF5SaS6S
	a1oFrzjGfzoAta/udaoaChZdyGFOkRM1fhorKfgwQxrM
X-Received: by 2002:a05:600c:8708:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a35aae70b1mr197677005e9.0.1793118341151;
        Tue, 27 Oct 2026 09:25:41 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd37f4sm27880521f8f.44.2026.10.27.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
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
Subject: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-ID:  <dc0e679eba5a0283b0d34e756c71db569583073c.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxEn3GKmjIkApottOw2da7a+5Ym3eFer8LHtbjoIoLM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB4Y61sfaRi2UYlrmaLCQ3nunydMgUidzF3j s/XqaKg0N2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQeAAKCRCPgPtYfRL+ ToLAB/0aPuOObiuuIObcbkpH5A5QaaL4H3cXCd9/01L5Dh5K0yCQBGnI9uKXHZ1b2qeSP4TkJL+ W2NNHrkuYMlM+Prx/DYaYy4U694aG+lqt5lcHM+jH6T+lWzq8ee66w9k1P+8kT06/RFyKlGfR60 2NcgdzlKqrZNk2Sh5RbGERfBzxy9hnDgz9+XTdxQ6iCkLKIKeh0IBdxGnDWnUa1rztDoUHtbhXL cfXos9ahRqgGyXOnfMAwnHGgX9S8eDfISFJTdXDe5kuXX/7mqK4tmLQP+20PNtWy0OBT5xfC6gE jxveX618fTLZ1vq7f72HZkRmkxo2Tf0Yl4wQGaz9J+uSfE2Y
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 120 ++++++++---------------------
 1 file changed, 30 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..324c10f18507 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -864,97 +864,41 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	return 0;
 }
 
-/*
- * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
- * @rproc: remote processor which will be booted using these fw segments
- * @fw: the ELF firmware image
- *
- * This function loads the firmware segments to memory, where the remote
- * processor expects them.
- *
- * Return: 0 on success and an appropriate error code otherwise
- */
-static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+static int imx_dsp_rproc_memcpy_tova(struct rproc *rproc, u64 da, const void *src,
+				     size_t filesz, size_t memsz)
 {
 	struct device *dev = &rproc->dev;
-	const void *ehdr, *phdr;
-	int i, ret = 0;
-	u16 phnum;
-	const u8 *elf_data = fw->data;
-	u8 class = fw_elf_get_class(fw);
-	u32 elf_phdr_get_size = elf_size_of_phdr(class);
+	void *ptr;
+	int ret;
 
-	ehdr = elf_data;
-	phnum = elf_hdr_get_e_phnum(class, ehdr);
-	phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
+	/* grab the kernel address for this device address */
+	ptr = rproc_da_to_va(rproc, da, memsz, NULL);
+	if (!ptr) {
+		dev_err(dev, "bad phdr da 0x%llx mem 0x%zx\n", da, memsz);
+		return -EINVAL;
+	}
 
-	/* go through the available ELF segments */
-	for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
-		u64 da = elf_phdr_get_p_paddr(class, phdr);
-		u64 memsz = elf_phdr_get_p_memsz(class, phdr);
-		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
-		u64 offset = elf_phdr_get_p_offset(class, phdr);
-		u32 type = elf_phdr_get_p_type(class, phdr);
-		void *ptr;
-
-		if (type != PT_LOAD || !memsz)
-			continue;
-
-		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
-			type, da, memsz, filesz);
-
-		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
-				filesz, memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
-				offset + filesz, fw->size);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (!rproc_u64_fit_in_size_t(memsz)) {
-			dev_err(dev, "size (%llx) does not fit in size_t type\n",
-				memsz);
-			ret = -EOVERFLOW;
-			break;
-		}
-
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, NULL);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			ret = imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz);
-			if (ret) {
-				dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
-		}
-
-		/* zero out remaining memory for this segment */
-		if (memsz > filesz) {
-			ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
-			if (ret) {
-				dev_err(dev, "memset failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
+	/* put the segment where the remote processor expects it */
+	if (filesz) {
+		ret = imx_dsp_rproc_memcpy(ptr, src, filesz);
+		if (ret) {
+			dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
 		}
 	}
 
-	return ret;
+	/* zero out remaining memory for this segment */
+	if (memsz > filesz) {
+		ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
+		if (ret) {
+			dev_err(dev, "memset failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -969,7 +913,6 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	struct imx_dsp_rproc *priv = rproc->priv;
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	struct rproc_mem_entry *carveout;
-	int ret;
 
 	/* Reset DSP if needed */
 	if (dsp_dcfg->reset)
@@ -985,11 +928,7 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
-	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rproc_elf_load_segments(rproc, fw);
 }
 
 static const struct rproc_ops imx_dsp_rproc_ops = {
@@ -998,6 +937,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
+	.memcpy_tova	= imx_dsp_rproc_memcpy_tova,
 	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
-- 
2.47.3

