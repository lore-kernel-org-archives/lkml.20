Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013702;
	b=cnG6JS3EYsvMnmLFd84t8Y00tWTpPlWg3jW2KKl9wk2J2hRi/OH5iVqGSqrv3k3JlpDp
	 dHic4nZ8zowLtMRd5crWElYjXSNQIafF8EXSPNvWbsiEQ0NLwPhp7+f5BRcIoJQsN5skR
	 XFagnXmKhkXb5OjBWau1kqQ4g4vwEXRlTOBXWQ76fpaFEg4gmGfNNYGxQsowd/M0VbElj
	 zKmIDQHGKh5s1tYJ5kQ6703AV5AfXgDG2z//0VH9bOKO1S2nUeb13W429ATinKVChEMQW
	 vXepT0EnBBmilBRjvXE047B5evj8TK+YMqNXrb3unkz9lhp7BPbHtDN2ug636GBSMVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
	b=mzs67TgAg0lXO/L1HmyE/k8GX8LM3psQPiX57itk6oZq0CCDvNxaTaPtz/YbjanRMKI/
	 0/Hp6Ve1BPp2DOJqbxuAdcaigIlFhOHG3AdiuMmS3YaFEw4Gi3gOdx23+hmgkZBy1RHNw
	 W7UVeotY+UpXVz0FVaYSJXCZPQJiLunyj9aPD/M3jTzk/sW/q+iYQbdtG1Pti8K8f9ONC
	 0GYfQv736xllUavOsI6rst3/S1NCdekXDfarjGfnxj94Ou50pz5kFw9adxNCPWDXdwgaN
	 VST0bHuMm/jizFQaJTI3q/vAQ90wtDmY5QPe34wbXzifjMIrGM6QKiLgUiZPPsq07jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jI/MurgY";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jI/MurgY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so33148375e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013701; x=1793618501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=jI/MurgYS34/7IbhIoD66d68h9Rkmmys5PeLBKaJbTr8d3dkfgPBbuyleYuqGQrxbh
         oym/UNVFDruB3GMKo1EXkawueBEwblYnG/Vx3Irq7farDqVikvVZtaHHzeIZkDfy7miE
         fSLM1+/yG5RaD/Obt+Cy21hc4b3S3lPqQc0Grukob98e4/Z6LkB8lHZgVbRilOmGXf5A
         +ZZTwcXuXLTgV3FHL3M98RYS2dWZZOFHhkynQC8+Knxd8F7X193ArhG4IwWcIoqfPXI8
         16mXCNaiSpD0nbHVkwvY8H1gt+7K0P71tCCbk9issRIBmZM2XQrV5gcyyifTW2nnF6Gs
         7/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013701; x=1793618501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=brfihoch4UASinnKqpyidubaUlzY9is0D2UExm0F5ipUfbuthWZgv3oeqbFb5s4oCL
         ZlC8J5A4KAT5euE93vUhztq2MTOuTuBc/zVWCO4nnnG1Ew0fw7G4FKUX4L5GAoJoQy1L
         KPz0WUdtaHf7zUaTS3hrCAMVr66EHAP0OSrbruzjmAfUNg+PkCXDsNYd1BhpGSdncokQ
         eFRbpZXai8zMBhujz90fbR4AToiZaI/rSRWSuJYa93mdBhANPkdJYc9dQWI5jxndjvGS
         JnyAaW06oXCwsWrDK/zXEjcVi5iOSWGzEtEBEEVHRHerfjRNpYmLK+Zr44ECMWkg2Oxw
         UneA==
X-Forwarded-Encrypted: i=1; AKwUvBwpEirQuGgaL4Q6Ex8tiDpZZELeGOtUR8UPEUOPj2lZrhcgh0/kZwRQRM4fB5b7ol+OkaLazG/zCToJbto=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXehgvmxzJ3btNkIZiH09DKnRBrkIs9LDSBKCCxjg1I1f/Z6Kg
	WQ0vjshFnTH4WE+m8WEUCDPqAsEAU6OoRhZ26LGZ99L2/2rT0wsz3Wx0gt/1vPaA7BY=
X-Gm-Gg: AYBFou37Lfy68ofoFGgPXtZCxAiwfMIbpWsJzFMejBjWMxqdOuI2k7j/btLFtsYoEFi
	/2Gckot0ZS1zNcUDzjmQ/SumEKB3jN5LCbbRye2tc114MpdCi4AjzPqs9XP5RgXORz2kkE+LeQw
	5pwUnFyoBV6qSmjeFQr/oMWDEljxVazDOUtIi9xiw3tAmx6/eNhGgDEB+ZDZU0QbTnjnZQ3oTbF
	M5qoYNqY49S/VjnmyI8rt4cdkzvP86ENTDU+RXWJDMog6UnRDj9+9B8culM4+/Hdv5x3WgyJjSN
	GfGx1L+xmYErzfqcdA7nzrqZyuNVZqCtPFivvhYPCxGs//3bnkLwgxsg6cByMsJW2ibNuepta6W
	JNOdKi9bU/g+ucMZXvo0oIKfPeupRU+39ldQydzTdvp2jZw/55bb+aEdLmNjEDdHlHWmkeWXi+c
	9w3Jd8kG6vpuhucr/ovXCRGv8duNtMW58hDSq9JOkOr3ZbRhP5PQtn6JVA34x2aA1iKBtdjQnK8
	mwuyThgb1R7Kk35tCPO75tBVUQ9QLg4ecWjQV/ug5kUGg/Vhn0Oal5fqWqww6uTSQ/tY+FobvQC
	MPTzcK8byLxYksZt9R4k5yedvc4V56LDh6370+KTlao4gPjQ2LTeNyfHuXEkzM3b9RDC7w8=
X-Received: by 2002:a05:600c:870f:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a35ac9d1cdmr111940265e9.17.1793013700496;
        Mon, 26 Oct 2026 04:21:40 -0700 (PDT)
Received: from fedora ([185.252.220.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm16557911f8f.27.2026.10.26.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:39 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Mon, 26 Oct 2026 16:50:33 +0530
Message-ID: <20261026112033.36310-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ternary case with min() to pick the smaller of cap_len and
req_left.
No functional change intended. Compile tested only.
Found using Coccinelle.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2:
- Join the memcpy() arguments onto one line as min() is shorter.

 drivers/spi/spi-mtk-snfi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..7eb7b40db11d 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1016,8 +1016,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
-				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       buf_fdm, min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0

