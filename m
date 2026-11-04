Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772802;
	b=0nsI18zVuRuQPt0dBMziJFU+XaywbVXuPh8qHEl6dW/JlqKkqQi+bYd9wAUr6mFJy5Kp
	 PPxMdI2DpsebJGje63ZsX7rEIR17/1v4fG8T4+MLPrspg+yYtO/Qrn5hnQyVWGD82MrW4
	 uAokHqtUGQWoByf7gwZCENLI4v6IE5L8Djg9PUmXS9ZXKmeiDAtq1tqEY5OPPEHwRLY/K
	 hsGhiHvvEBBZNWSQdr0Fz+WxjTmD1BUS+vBTHY+ZPsoGCmqCgoKxnF9meMZozkPHwzzwe
	 aiFpXstlj51e9YOit+kfd6OZ0sSLckxYQ/x0HKoUfWw2tLbhghlcXktvzmRMlLPCR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MVU4a1WbyoYsCog2h+z3lNAS2j7JA65g4JUPcSPW2I4=;
	b=iDXXzq7x2HVVwMM7sppa7bLstwT7VNQHSvwly0fgp1e1jxm8ZesNZ1VMKCGezuoeDSxA
	 Cb6DfKrwclMiJKezdagfpNBUY82B/Jb5z//HeuUl38FEyhDi7pTy5FuXdH0+zS5WD6ih7
	 XKZuTLc9z80yxauOoXoiaaUu8cF39kBFE+7w+kQ3yGhohyVQCt0lamAarjpHfh5a7jUp1
	 bHuWj8aZOwnUWQmbrTnLM2ffv+AyzOUXwbN9YQfdlkzYMb1Jv2rvwDjCN+DwAjfRXi9nm
	 JhNfGncTLPO4b/X+KfEGvF3B09kKUeRYC33LVqSFGUnN7CUvaMr6rw9o5JQ6/V0SnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdbeiIyn;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3204E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdbeiIyn
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df5e315bd1so286532eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772801; x=1794377601; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MVU4a1WbyoYsCog2h+z3lNAS2j7JA65g4JUPcSPW2I4=;
        b=wdbeiIyn6j3DH5A0Ws4xXGIx4FgR6EYvpQeM9HC/9rrrjLTkjYbZ2pNZJIKker9tb/
         NddYUSdqWUq1dkbmGv8+31jQzNgET8DUborMtOCj0vkL6iPXmLabFmAHCHhDizYQ8irh
         VqZMKSOY7bqdyZnRNN22xeGq8whMvOnel9jjCSotUTHWRV0CgqNdv0PyLeAxHU6AnLcf
         /tpSFUbXk45QMwQ0CswgomgOD7wMRAbYvI9NbjKuKZtFtgB/FNQp8D0sAkujKyPncfhU
         7L9/o3fCLKiYDehekIZnq9TOXHHOXp4A4njhViWZD2ENFk7f+1ODJc5HWSZ0u0jlS6m6
         jPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772801; x=1794377601;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MVU4a1WbyoYsCog2h+z3lNAS2j7JA65g4JUPcSPW2I4=;
        b=pHIty2FM2b40BkuRBsE9y8xwX5U8t7/fXs5CfHsjJNJ/L7G9YwxHrOKcEWuMTRShaU
         D00A07s1vHjCC0UPXS1rZ1ASnyOoLk6/UgEESzV4rKixkeyboV3uzGxksR71QQYaXtAo
         pLUsMNEAu4h3wS//1qU6HDM8Fee6LSoioXZ1m+o9CxWshtsrm4eoixDQSAW+E9QlG2bc
         A5DC+kYWqBkNNRlFd49Y3eCcsOEyvALEJDvGGRDDLTJysFUHGCDjXBSRFa0WWgY1icZV
         zYgluguT45Nif5pV2rbuRoewbDAquFgPoeh7rxMxtp/bq4ji/XR6wF/dV3EAOZIeAGfz
         ukVg==
X-Forwarded-Encrypted: i=1; AKwUvBxwEzcFDIGoAAwgTGOtutIG2LPhtovbhb4s41Y1bXIwRufmfw8r5qLplvn9L+AXVdxht0TxxYoZx3iFzRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8GJPISVmW6TDg2jVHrVrR4BVXfM6UUkKQObdV2NqqYE6ln1EC
	TdfIDP4EDB00SZtGSyn+FyC87WOZK+G8irrLR1xIIF3y+Gs0vVfwC5oA
X-Gm-Gg: AYBFou2DAfzzinJA9wIxmyaSffnCfFd9YwoViKFcQuEOc41fwDWYaTCmBgUZj7LQ0Da
	xHurr6E6fmQ1jc58iOrp471jOOfz9JjfCQL6ta2pNuLD6v/QLAh4Wlo4Ii32qKLffK1T9Fd765O
	GaZBAS8URUW8JBCmi5pgGQ1s0Coz/RYYMvqMqbtf8sJ3zk/aDl8Xb0JP6pUiLsdF7vXcD1OrVlX
	0KkcHPu9Ui7643w24YaVuo72ZTjSQEB/l9FBQOGS3fRokvdx3UIoTul7Kq7Tf5Aq99RdfoGwRjf
	ayEo2i0KkQbrQglPwDBh7AUKnEc4D3XUkd85+nT6ac8AYpT0NZkC/xM5jCveBfXzV3ALWCYA7V4
	AMbMR84kK9g7ciGbIFp3ZRPHRd9BlInwrN/DAEDzfVjqT4244Vqz4GiP98LSeC4pQV+0/ghko4y
	2w0yY4MPh/3N2rI2VQCKI3ivy3ozkK/aaotTKUcMUcJ4ZC/bLDdjllo4LgKa2WAkzr5cbKzXXJl
	ra9aSvegvDI0yXGrg9O6BV8liWdjSQlxzUjxWr14Oa89w9B5hyr64Y0/7V+snweJd6nCbd1o6y+
	HHc+kEmv/xS0+oOjfzz4M7MQhrUt3lzX/iEza/sJLthjRAhbleV4PUu8QX9+b73ly3lyBxPPuN+
	IHzeBnQpacROdBkdgBIcde19+KRQrb52IDrFFXfnm7agJwNbAbkm++5tJexTNZY7MmR8scyNPH4
	mFZHFOoYpU9YJi4Rx3/NmJqQbJ+X/bMg1dCFrovD3MVARLkcibtg+C
X-Received: by 2002:a05:6820:83d9:20b0:70d:d3a7:24d2 with SMTP id 006d021491bc7-714f255ec1bmr6371290eaf.64.1793772801020;
        Tue, 03 Nov 2026 22:13:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c129a718sm1037919eaf.6.2026.11.03.22.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:13:18 -0700
Subject: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
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
Message-Id: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNMQ7CMAxA0atUnrHUJFUGroIYQuoUI9VFTgigq
 ncntONf3l8hkzJlOHcrKFXOvEgLc+og3oNMhDy2Bttbb0zvML9uMxfU8JYgIxaeWSZUiksl/WI
 1GPwwOJusTy5Cc55KiT/743I9uiEPiuUPw7b9ADRS+VWFAAAA
X-Change-ID: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

When GET_FEATURES succeeds but the chip does not acknowledge the requested
timing mode, nand_setup_interface() falls back to mode 0. Both the
controller-interface reset and the NAND RESET command can fail, but their
return values are discarded. The function then returns the successful
GET_FEATURES status even though the fallback did not complete.

Check the controller reset before issuing RESET and propagate either
recovery error when there was no earlier error. Preserve an earlier
GET_FEATURES failure and keep returning success when a timing mismatch
is recovered by a successful mode-0 fallback.

Fixes: 415ae78ffb5d ("mtd: rawnand: check ONFI timings have been acked by the chip")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..cb57a7d81810 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -840,7 +840,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { }, request;
-	int ret;
+	int ret, reset_ret;
 
 	if (!nand_controller_can_setup_interface(chip))
 		return 0;
@@ -909,12 +909,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_interface(chip, chipnr);
+	reset_ret = nand_reset_interface(chip, chipnr);
+	if (reset_ret)
+		return ret ?: reset_ret;
+
 	nand_select_target(chip, chipnr);
-	nand_reset_op(chip);
+	reset_ret = nand_reset_op(chip);
 	nand_deselect_target(chip);
 
-	return ret;
+	return ret ?: reset_ret;
 }
 
 /**

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

