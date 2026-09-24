Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C48D4CCDC0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280287; cv=none; b=hZp1gMGqTOaTTNYuCsJZTVgN8a8O+JOC5KzJYpBZ5jOGRTVEZz+f2G2ekbPHdA+AkT0maBGECMgTuK8jsQc7Ux8PyxTl2D+as6lmw3rFSNaKR3FaDvzS0puB7pT5HoQE/cia26QyymP4GH+ZvXoC+ECW/ARGNqtkBsRzrrCRIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280287; c=relaxed/simple;
	bh=Av98nN80+Pb2BEXIf+JCVsfILJfnVK/WJEoddTboWi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wg8HBGheWmP+aqxMhv21p4q88c/6nIM2SIjkSrfF7J3H5tJ53rPS0E+g40vJWFZ0VI+tyKeA9OIO4b6/lzp+Suy0PxKf3uFX25emdIa3qBeDq1dsJcjNl8Qd8zbKdJAWzJhOCspeiCNu/I6HElG8x6UZC4RvrTU7asRpB+r/cjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgWWu5z3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgWWu5z3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso2671595e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280284; x=1790885084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=DgWWu5z36eQ3MIZRAi6ocbRPSigrcecxc2id3njjBf8FHyxnLe06yoMiYgWNEVfylv
         QDRB689qG9a8H6ujiSaVJLjOY1t4YuHh65R0KYRle02A8vNXw+7bolOiENlIWBohTk/I
         qjL8diMJ/1WjHHLpSDkZqGAltPm7Gb/1JqtLDdqig5bStMWL2ltQQqjiMRVs9G8wt01M
         dur4TOtJJRurORZJfyxPAbt7l3xHMewJZWOdWkn1WtYI6GoPXy5ORP/YDBc7Ve44Nr50
         zg9WsyMY6tCV8P0QaV8gW4gJY0TXYVD9LXexmjnCE56c7rwow28Qy4xhtGOPVY7O9rSM
         avvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280284; x=1790885084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=kKeFWhvZW/r4Vobpqa+ywlk/VnpbxACM69prEuziiJP79Mj+jZ27oZzCYXnRMImnlo
         9RYzZ9dn+grf2bYKT3Jrug9VE8jdgvqHMZPuLtPxDwF2F4jwkmJ/Xk/MugXIcMSlaHvH
         zuFwsWWZS8OrjfIhoWBd9SQpGAQnFjCIvQ80+MOwqOWA+Miyq8XnoJ3Z9j6Kk0nJOk5k
         Pa4k/Vsyu+CeLiEhCqkfHoOGjFn3tuphYg9aTMAzNHjwSku0t88MwKl6jCIQPHlWqGOg
         TbC3LzI43xlQaud6Qvc1YGAwzTe2oYqPcgZjY8mU/2FPsMrDR1hMHpqQmTphTOVu9qos
         OIZw==
X-Forwarded-Encrypted: i=1; AKwUvBy/AQK0uiWlsj2jnFfjJD3DECJ4llNCGr68wtFOt/LSueJ9W1nTajGbxNe76R8Jn3Cec4jtYmXy5h9f290=@vger.kernel.org
X-Gm-Message-State: AFuF++kdk32DqPDO87T088rNUmc1MNoqldkScDSxNBVxOZUWxj08tSt1
	QJBDK7uc+EWQCDh+66Puaih0c0IWbLk6hpbl7BteL0yk5OBCOM3DX+O0
X-Gm-Gg: AYBFou1bcJTMmh8rgXB368MWw0av4jhDOMUs4A0TtLZQTW67dy8Ikpq6JxYyYpPMtXu
	DiR9/OoAJO1VQ1TE/s8PG+dGtszL3uIzCFcZcGOtved6hBwWp7mEaMyLll7dgyTpRfQN3QykIKs
	ikO0gS6/b4r5Ga5vl3lRdxKv5Dxc1PckDo0PSXOpXMgI7nAe+SpkMmkCYjPhSCN6RylWMK72Ukh
	jw7jLUup75HLVES14A1eMEAYxUH7LV/fhE1n3jJHErnidoQR0PhDQqDSZD2r2y6IePrlmGCVPuA
	OI67ZmA2+3OCPNpjiYjhdtBd2G1Wv76ZDllz51aa4mQYCf2UOvNfqqDIlJ0CF7tLPMGA5VZPS/Y
	m5vpOB2XTbMOYGSUvKqnUvw1NDHWHPrw2ptOa/bBalCGU+FdvxVSbIcw3vmqNts7S63JwyfjdCP
	+o84n+cIVOctzgofHs2OQrMo+0vYn/ope7R0ij9GDidWvTB5GwEdRhOilqB6gzb60mNMP/7PVWt
	vMoQKWC59zcjkHpfwNULJnO2KpM
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr39325455e9.4.1790280284310;
        Thu, 24 Sep 2026 13:04:44 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:22 +0200
Subject: [PATCH 7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-7-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Give 'read_stats' structure a 'qcom_nandc' prefix to indicate that
it corresponds to the Qualcomm NAND driver. The definition is going
to be moved into a common header this helps to avoid global namespace
pollution/collision.

No functional changes. This is in preparation of moving the declaration
into the 'nand-qpic-common.h' header to allow reusing it from the
'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cc1e64ac4245..99fe2c434ce7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -438,7 +438,7 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct read_stats {
+struct qcom_nandc_read_stats {
 	__le32 flash;
 	__le32 buffer;
 	__le32 erased_cw;
@@ -619,12 +619,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
-	struct read_stats *buf;
+	struct qcom_nandc_read_stats *buf;
 	bool flash_op_err = false, erased;
 	int i;
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
-	buf = (struct read_stats *)nandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)nandc->reg_read_buf;
 	qcom_nandc_dev_to_mem(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {

-- 
2.55.0

