Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009391;
	b=Uy+oWoro6njuG40cM3hAAhcIFgALsZb9O8C1miZRbPbMh6wzPLX4WnJS32AywU6YvsRy
	 uaTjNc24hKF0+aMwfhGVeLGMbesD6oej26BUiKNz06NF/nrzjEmh/6m0r5pyXl7RQOaoL
	 usPL8JOjX3oAWQEX4EsRJFLlC6N/tt44sPdFzrcNrsaDkR2uhd1xM36oZsfq3tbHYp60/
	 ZmVsP2JX/HYB2i3bYyd8h6H6DSLrMixiXqB+1twW1t5+LcnMKmAe0vpKlVuJsK46DZ1pP
	 G9HpDVMGjEfV2/vWYi9p4nwOW+UQIe2qAD00Y8JHyydyZEjOYYjPtGt2RhReJvKArGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
	b=qBzpL0CPHCDkjBHnCK1wzb69eOlvTgV7NcFLssJU2Jl/7nblKDCbixYPUUWqXzOzeYJZ
	 jQOesGIcws69a4NSX4pq5wf+V+OpzDba96PyY74yQwYy4P+GW2wLAm7ze4nh2UvwtHWqT
	 XI2UMreanfs02zkSCrD2iyh3at9GaDYHTIjw9eX7ySQ1VngItF7ccSb5W/v9IwzjYe2Is
	 8L9eu7WQJ7ss1YrineEu2Zd4cRp2nKj7lzANcS4oGY4+CmsZWboTSN1CEErtdMAUTlcJH
	 8WCy2cMFnl80G0avVnWrk1mGOxnFju6+hf9TAZCYzbX7G1TVezk60ewU3j8m31NThgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D9PtB5qb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CA606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8CA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D9PtB5qb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so26461655e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009389; x=1793614189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=D9PtB5qbDk4URdXJa/HNbUTeISRSVAHwmfhTQTd2HQ6EG9XmpNM0QXO0S65wblAG0H
         QmHS19foZY9FbfPFdGBYz2p+BsRT686JyLEy3sXc/LZd1/UUURsJYWy9qHhJJbu6fjED
         X6DZzwILjAMqDdTaHu08nPX0ZbDh410++mWMMeIOzk5UXqrSnzF5U1AfyjiooNcSIjKg
         Vbq+EzF87Z7Le3vpI74TkXtC+qpgCc2YzbwAiqrn70L3cmMaIYbvKRNIu4FeVxltudon
         6TPtPYsUj4whdbjkNvV3e5/lTMaAwX0Hmk59noS0WUcQUWYLQDciOTFvu8QMuSVVV+oi
         Ahyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009389; x=1793614189;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=DYFn5CuwjyIKljgG30BV0/71kv5KW6PLnqJOJOecPL+B+D1MDKiyzsZzj6I6bfU51Q
         TgmZRJIs4MvRLyx7/cgu+MYLpJnnc/4v60vluBldyaUCfGS5HAqojobnSYQm7kmRzoF4
         xIZmuEDJIjF0KRKYRb1dvfhKvChifb8HNrdWQDVfML1jtV8ND9bMM0Rfl2BcqAKlirHK
         Pz4TG9EEKsm30ttox8okf4Ma9Vcyl/NDwUpb7w33kh0IZuDYor290KDjR/e2fMHhS2zA
         qB+vYq1b6WzqdFzBD1yrGYl56IxeOyhokKtNgeDmXob7vaQGXk4ApmX5+gF44Wq7EEGi
         s7Kg==
X-Forwarded-Encrypted: i=1; AKwUvByKoPZSzYcqEZ+sx5jf8gNh40dvzRHvcs0eaTpr0Jl9+2DdIC4uPCeNLonKs14QjQRKISDWoLhimIu2CJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0SHRIW8WfQmN5jZl6kxjhaQkX1qRCqDcR8IFe1qS9ooTeupm7
	pXQuO7L49tYH//EAgqZSv8nA7Q8DrpOfosr3pJMsldBXBcqjLtDSwMlgwhcoB54w39o=
X-Gm-Gg: AYBFou3+BVTxcbgGWj365Tp8OXyJV2GYR98lG9pd5gqUvLZ4t6klH9lXcgEpnItxXXr
	Sq6sudgDngDL45Oh9ZP3viTJjBmUE6fQQkqK1egEFImvWUs+xnLhmcxwzbrqIQHjJZsgZ5+J9H3
	4iFuqGQW92bnt/41v2EuJc8n62Z2RsRVl6Rq1nPg1adQ9lzBcDVlKzUi3i60pxZuaM1RJXofcX0
	r7ZYWe9yTNogdswiBgLQY+3lSM2jYJe2Odweaf+xkT8b5KBl/60T5bsYgYhc4ju+6RCYoGHo9eu
	G5XuCxweNV7Bgem95Rby9IICCQmWYhFf77gS9ywgf/WXtVjb7UEJ6Q4NbtRp+7oFPobGws2sspU
	5oWlu6U5OHtSwsWU+g1ses8rrOBXpDUZDXarOEdEZK66Y9LWPjFQeFCQRAkT5jATmFCzg9/tOzK
	QxZgkybXTMg7YX6mUGvSDz/SOLt3AKLg5TgQNHdqVM496m2nNtuVm7GHiIl7UMuNs+1R8O5Jz5D
	7vLDGbFSenZnXgP12tf93Lqzkgf5J3Zj1a4JySa4NwStKMXANq40Z1AX++ayjaQZ9Kpf+mKNMe5
	En29eK3E+UDGh8F0r8q9qK1wbWnKTzl4YaDPT2P6ndANPb6kVEJBXjJw8idGuCL2
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr105329285e9.2.1793009389330;
        Mon, 26 Oct 2026 03:09:49 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm12723417f8f.19.2026.10.26.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
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
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Mon, 26 Oct 2026 11:09:31 +0100
Message-ID:  <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hxruU5Qpi7r2EJrNeBqarI1YguCnlDks2WjPOZVNhtc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybhCmBylIiFeQF6JYkVphxgdtR4trriGdeKV WyMVHE5hfGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m4QAKCRCPgPtYfRL+ TqZQB/469uqHF0RQ3p1EtU5kkJhZgfZbqHOiHj9dcj/QjmbMJRgCsw+/wIgRYW0IRiO/++pMNVX 2sQYzZnumvdt3pS9qoAvqTO+EdxGaFirLJxoABx1CDduUP1JpAsbpKaYNyEoJqt+5lQh3TMQcMq DlM1PL/u9DAx7b54WXxvPhB6vOWX0eptEk7qYWjz8vQ9Q4g2gmHL2RQKwWGE0GZ1yweUJQmCn+K qyD+Vbdi7el6bO9pv5+VP2gX9rLg+BFoCH2h2iQxTfeaCOXBqThL5xuza0JA19i0j+J+li58Fr7 TlwpNM4Dn/jozhd/xBFmZTToNdVIK2FJRuURwqTWCZtgSzTh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

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

