Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A93FC5A1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373565; cv=none; b=b25UdqF1JqKgPGrO3PJrJbugJVgB9sVF/kfGj/ukr9fPpuDcnUYJLYAIunhOr0q3rL9GsmltGqoRHCQ4iPHVqVcbNMCqgQD8f8c6roGI30xfv+wf5w0nUnKyn04utLNYS0knuAtVOp+dnY8mkOft9FocnIr/s/gGLFifUs3uwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373565; c=relaxed/simple;
	bh=EDHSCA+pQrWnWiVBfpdnQocplt0oUa4z84IRuUiPecM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j8j22cxV4nxwV4OZTpJE8FiCtBDwvjzRiX/YJEikC+2oged8o3r7f3O7iN4heZgPrcdwJGDlS848NnhgDtskpyz7KIB9U0NzMVanrEvOjle73+ndOZmCDOWuRmzePNssWwAGrmNisn/5fSAPGsGxoH7tICjNheuWbK5UHv68Ou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8XGCB0l; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8XGCB0l"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b429f7so172571f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373561; x=1789978361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfBKtg2pSNUBsI4+N4eKUAVwi5zQ46GSi86GxU4/gUs=;
        b=G8XGCB0lpoKExbvdMezD5n8eTD1iVUz8w6u/LcItLNzMYj23dj8Q2JhznBlDnSE97/
         62Kd364oD+4siUStJ4ZR+PtOIfcyCc5Hq4tQRE41772B+aioeYrhaXcHJLt/wH79LdYP
         I7ExstsUAFOVYj/OatTRBbMwUzdgb9td+fsYcH42T6iXBzR0dybjTAyLqRi7sv/QcfcH
         /v/a1CyDmLlVdGl7Hcoto1caaJj41tpgLvpnxHWW3rZe/2rOGjd5fw+UI9ruIlnJfUSs
         MZhpsdMzt3RubvbZ5kNqh1mQ7clBcIzb8AhiU9cmAwhnTIEjtIsNePu325+LzkgpavdA
         zgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373561; x=1789978361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfBKtg2pSNUBsI4+N4eKUAVwi5zQ46GSi86GxU4/gUs=;
        b=eOOnE2DjTh/w1P1PHkipXS23ryiSjZ6J+Upw+eDvBkNEd3MsvUrM6Vn4n2f9jp3NA+
         sKr8Ds9IH01JW3+LCaOVNshzj4a1LvEnAiuTWYk7/L8t6ejM7pi7f3dweqEDzCyUzyjH
         3jrFDlQQ3zvExjHq5IhNZBrQS5azF9Zgc2l0bHcwymBCxspy6dKQ72BpzaqiNU+7DJRc
         JShx4H1onVkNFPGxw3rSeWDYPLlNImnc/XwTLMfVjcNDenq9bxEUpz5sWW4rJ2nXKXpJ
         +hQe9Mb74P54dTPTZBiVeTESL3lKgSa4ULI2DOHzBBXRBVktHdic+CQj8ToxDZAo41ic
         ODjQ==
X-Gm-Message-State: AFuF++kGHl6WhY+b/5ChguO4HxqaR9Xtc640p4LblBjmnTyhASo2v9FU
	OePj68057Mi4ijer6sj9uetccPdmZStebjBSHxZ5KDn8ofNuqgQO7bCj
X-Gm-Gg: AYBFou3/kl/WMRH0waYjiTmMPkLfYyvzbi7903ccB+4Lqp7dz3ILuFJvfjlRwqgYlHw
	IKWMfJ4qt1AZdvLVcX1GWv5+fMR6wYGoFmVCHpdj8WpppuuM5/Cou6AlGGJztZOC5K1Xc7MJUXD
	k/2AM7lp2qO/sqRqhux6oBt2GXZHjmZianx6Z+cqwtlXTboWd6ngWp2GujSAzXLHE/Uy0I+xcor
	KJbfFACCETSuKXKl4bAEdM/NzVLRVmIC107rb67vvcKDzgRenqLRBg5G/SJ63mtZfbN/r6trKlY
	aNIaUPLjApRh5yeI309ymLWJJAax5f2d+gxmtNaueClDnqQrO1ounUTp5gY1okYaQUl88miJxMz
	r/j7Km4n+5whQ8EAXP/vvZZE8PvzFAP3du0fUC926I2waeyNbesJz/uD8ToZ2S7C48b0vtsoeBD
	7kVC2xssQuzCB/29NsthC3GUtE5Cis2Kk0rqmCyX1lAYtEEt/HRdMuQJbcebzdyXAdZ5HaiFHiD
	DGMxHsYPd6B4wZ4Bpk=
X-Received: by 2002:a05:600c:3ba4:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e7a66d0f5mr18491365e9.2.1789373561412;
        Mon, 14 Sep 2026 01:12:41 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:41 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: take the flash lock in spi_nor_remove()
Date: Mon, 14 Sep 2026 11:11:49 +0300
Message-Id: <20260914081149.1916589-4-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914081149.1916589-1-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_nor_remove() restores the addressing mode with the same unlocked
call to spi_nor_restore() that spi_nor_shutdown() used before the
previous patch, and it is exposed the same way: the MTD device is still
registered at that point, so an unbind can run the restore while another
thread is in the middle of an operation. A busy flash silently ignores
the restore, and a restore that lands between two chunks of a read
switches the chip to 3-byte addressing while the driver keeps sending
4 address bytes.

Moving the restore after mtd_device_unregister() would not fix this.
Since commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
del_mtd_device() drops a reference instead of refusing with -EBUSY when
the device is in use, so unregistering returns right away and does not
wait for an operation that is already running.

Take nor->lock for the restore, as spi_nor_shutdown() now does. The
unregister stays unconditional, so a flash whose restore had to be
skipped is still torn down.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 647bf8dce719..8d0302565445 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3852,8 +3852,14 @@ static int spi_nor_probe(struct spi_mem *spimem)
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
 
-	spi_nor_restore(nor);
+	/* As in spi_nor_shutdown(), do not restore under an operation. */
+	ret = spi_nor_prep_and_lock(nor);
+	if (!ret) {
+		spi_nor_restore(nor);
+		spi_nor_unlock_and_unprep(nor);
+	}
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
-- 
2.34.1

