Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483604;
	b=Cwab94zQrJri4rxIST9jN2g52tLdn+HTf8AXdPuofpX4OGoUmtvfIBKRzG5VfyXDvmaW
	 nXivs45iVuN9iovHCZ8T++74XDninSVKLcrsSglPI6hR5gT5SfdMmr+4pdgtMcuRYcKJl
	 Lf/g3QhwqxoLNkQxWUjMhGq6X1Qw5CGmY3cRlXDbeKj8fD64xdOsoGoq8btVgAiKaI122
	 00l7iaM0ixzQC1tONJc1INc3xgCVPYmWVdG70JpZI/FowZHQz80tpQUDeg0zewPOHT1Xk
	 uhXb+ylLQ1BiOsOf14M27PPkJ93pU0uVx7S8cJgZAptiNefa1VI9gmJpihMjxT7ypKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=;
	b=08A6MCqZHGISmJzjy9p8vrnbCEvcj0Ko5Wboz0iul811IVDl4o2tvyFCmSXEgLMzDgQY
	 YqiaS5NnzJsimOZmuS/Ij4TAAzAC6S0nMUDHrCW4GhVk03lAR9f0rpbTn9wYfqHCmtxGt
	 ZK52biymDW29NQMFJKVcIlgHfXA6G0KwXQ3Wnfxxdb/v8w/I+1gawlkShhXe65YMaISlh
	 Hua+8oSLEINkCQD+L6QfPVWKigzIu3N7A46zxwb5yCUXc23WrVZMfmU1FKt06z8i2ZOOx
	 H3Hoao7jdX4EatjQpw3Y6wFtpzOTFtkJdWSb7aFgWBZhumLmIHlBZ284zZQB+mApJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c2AhZaTb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13442606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13442606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c2AhZaTb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso2931000f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483602; x=1795088402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=;
        b=c2AhZaTbCdnYRd8voQJoF8xSxPolL3evNgZMzuaG9HMJB72hliv7dhzc3R43qdChx7
         kXj7eE5Mj8iIsv9a41YJv9ykUJLyImW9slTqGRVVc0KOXcxs5vvNXIJEjTFv3jfd/+fJ
         H982fItzIrfXmIBbBkUhWHYwcbtM4HkqkPbsMo3MOgakMyisy4W8yB4WHX0lAqw+2REk
         zyl0QDYzQ+QkJxGP3KTQqKEk1RcI/CHUK/afm3p3F5Czvufjf2jkXYzeE2ZDaX+dNaZ1
         lGT8Kc8vPah9Rfvk+i64WCmLCu3PhG09oayA6iupxLJ0+viG/QbzCr89mK923lAJcgwF
         TUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483602; x=1795088402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=;
        b=gnBgP1r7L0ii26kc8A3OqQ+6/iDqG3NnaCt/YlC8xpDlt/s2LmR6BHDdjV2vSiIvMv
         wvOF/54zYlANsMjmktn905Rr7iIWUK+/ReKkhEczmDqB52y06r1r7lzrh6bJ4aVBiTgC
         ghlxrOK1bJsT3oeAuV+opg6V2bV34DMQkoIysS2S1BVpppRIbY5w/iqBcA3imkNFscT3
         A0dd/007Y2YnPDIOl49zIcAMTj49H214FC8PX6MrzUQ1qt2RfHjBb8R1jJjjf3cKCrZT
         0XvWd46MspG0vnUUoMp8Vah3BCDAn+ZhSGoTRlAD/6IoUDPwdjJpPlT5MHHl4iPDL70i
         Sscw==
X-Forwarded-Encrypted: i=1; AL+hErG9C8kiHZcCgH+fLzYfXy6LXEFIR1hh2pl/NyGhvIZD3zlGvvlzFxOUqbTcS4udfmMkEmCsbHoSoxRCDpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KIOi/o01MRfHn/NHh5YlhQGMHGQvOOjeLCoQ+IHjH2/xy0xs/
	eKpqjFiy/kDzJDLn3E2ZR9dr4+dyqbkWvgsKS+UFdmg3MGOIfzRNo+xaV20LK5X+rN0=
X-Gm-Gg: AYBFou35i4sZuMQDb4cc0eAizdHe1heldIyeyDhGKjgK4si1R+0+4dszn8uGYhxu0TX
	57AUaEaZFpnlfxA1MGma3FOJdjgi4AmPq49bZYbgK59PPG9qB+1HMRN96/las1nIY6ddUkRpbnh
	XRiqL+wpg61RG/6e1HXBdPyVJvfGN3QXX7SZWqd8v2Bctilf6fSXg4A6XeOmGOxjEySrf+r1z2/
	Eujk3eV/zVwojCULAR3IJ42EINq9dXrJX6AlpDA+lYWYmwIvVF2TzKjjfOZhdakmfqdCCWcpUux
	QZqTFtUR4HmWuT/spFrF1Kgc1m6XFKBtX3qYKiDa+ak/1RO/SawE5q1Hox0EKEP7x8dZLwQCp4F
	3+KjRNZJBmL/T8VtYkAV59b7FuExYxtXpx6lQbyg1FnC55g+xzcd/L+M0mH9WA2SriFRNvS6NHr
	lE+KGFA8NbuLIf6VY9nFP1jA321ho2M5lxANtYOYApIdWRlrBBtjO3MeAkZRl+1aeZdyx3IGz0w
	Gxyg33FNiEjIkZ10b20YMyvXM939UC0Ktec3GXb3c+kc6EtC5bAPjWNa45TNYVv9i5lcWoVSUOg
	8qz/Vl48FpfxOeRKlbAg+yjSWPtJuJIVM7rM0WWJAFZm5Y6MOMDqWgIFOK4l1qo1FAoCBnI4EH1
	sUn9UGhbws33xLNr8
X-Received: by 2002:a05:6000:248a:b0:493:1477:cdd7 with SMTP id ffacd0b85a97d-499c7271d72mr9671131f8f.45.1794483602143;
        Thu, 12 Nov 2026 03:40:02 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-498366c43f4sm19115427f8f.47.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:01 -0800 (PST)
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
Subject: [PATCH v4 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Thu, 12 Nov 2026 12:39:51 +0100
Message-ID:  <922f685493e615b450c913b77cf33022c9cda8a3.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5301; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RohBdpkH8TSHsnslkd4R654KBrqmv882JRSoJjjuoBA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV5PpSrVGWZ6id8gqP3pN3LFSP2HbKY5hyhn ejyAuxXlg2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWleQAKCRCPgPtYfRL+ TugHB/4zsoFIUiu1rOAe+sEMu7U7+oNyHE4Z35KbOqRblj73O+ECqOwmAw1N3/wOf3BVIlj3ntN eex6WkpCriW/JsOvPr8ZRnPIJhvy01Bv/J9xk2UsjjMSghOyUBT7sv5MrDbDezDI9F6eUgUrOR/ 3HafN1OrkN+mT6dTNMqyV71+ymkrO6T/2PAGgcZ1+7dMAt0lA/EeiXJ16jIma/ma/4jjQXeviOE 9LQc7EihvT1ZykXMQEV+hRqi9ADMe/Agq8a462/Xs2SHlzcpQXyS9jERrXgv3QGooTnaT9Po739 B9QXPhoILPe4UbTm8i4R6TN4eR8M1q5R5uAH0JKEW32fWVed
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
2.56.0.rc1

