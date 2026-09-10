Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7258B6B5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065952; cv=none; b=j7mbZV4PUqt0Q+3jVnQS4PKU3bNSBlDmwX14FPkbwlG1SwCQz/kT4u7sa3idfZOdgTfA+MqOPLKh4ghLkL1k10OTjuSAYCZlMEZfO0Cq/ShzCekrTrrnW3WU1Rg2pLV1CT6xicH+YFza/jH0M3DdzWlGTfIDu+7IuPtJA37Cjzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065952; c=relaxed/simple;
	bh=i/AgW/XXRwimDj21evjboEyAv2IWmQh2FL2cBV2eqYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GcpfamXu0X9czqq28obr6+mOPmcdXkMJgPD8m9oEZ2/1eoDwnTRzhciI5auyRjmLda99y/ZDAgW53/89AXPXvMuDGEmctuXqams929M40INAxj5m4B/2SkDDHZys55w8eZOL9OmuiXe8SW8U30MvyyLfVfi0wZvV2nuSJ8f1i7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0OikZqa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0OikZqa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b0dd3e1d0so154405e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065950; x=1789670750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlX1xFkfC7DC5AceUSqJtuVKq5LOsuWpndKOpYXkAdI=;
        b=c0OikZqaRG99OWev1YsFZaABJ+lwIF7VgyGqMy6J74NU/u3za0BZnkTAoOV00SjtB+
         A+F+BfHTM0Jdg5HWLUuR6FyJgDbBAKE5jMYSL8Eyq5dzrrT8u8rMUSe9GtDxXhIdBBgr
         2ItRsndBv4tMhzpckR2Ks0VZzVaFA1cd87DhzrKqAbYygfJhcKIdHX1w8E7+QvcGlTfP
         Ou3tXCUMaXaGHY4uY214hfoFk7u7Z75V3jbxMoa5mcYP3K+nAyZVwOMN4wcOFUtMevA/
         PJSW8F059mj5DLsbuOS60oQqtn3t5oXSdVECPiUsIzIu3aRkR0VBc8rz3VvpgBmSsdh+
         kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065950; x=1789670750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlX1xFkfC7DC5AceUSqJtuVKq5LOsuWpndKOpYXkAdI=;
        b=YxBybLVwOh94OtmUlpm6qzriRnV+Ta8Ccg/fMIKKZtD+/CydFCvYgs4p9GarfsgyY0
         P+qS1p/wHQeYP6XvsD6bHdpe6mH7nmkGeeJu0M7Lrcb3L3ELzDof8yNqQaUsoVOEzjSM
         kuxI0jLcC0zevrkUNYnKqCesxZczfG4jY+H57EmQCvdN/xPEzDN5u3vxpM4yQVBDbm8L
         hpnm10YZZZGUfQhyeIEgZk9qID1vIObhjwfPlo9hmniS2ZFBCBDYuUQXnVPCrpIP4Tau
         WysgJSB6+VA2Gn9UyD14/eSHWDDiEIr9EFDzZNQgqGr9TaGG6BLD41PUDETwYpLns7n8
         omOg==
X-Gm-Message-State: AFuF++mU89bRaf/iSv2CIylKWK0dbQIbrG718vCm5cj+Tz342qXM+Pwk
	g+vxMT6RNU905Wp2lj66IFdx33a7O9ex0+FG58UY/nX30ptreAua1hCN
X-Gm-Gg: AYBFou3KSWqGprChseFdvbSyA3kuyJcH583sZ5kV8fl5AEHSUE6MOC1wtBjttlK9bbH
	wWVgZ/4B3MX7KAqv/j41Fq6GLIkTyJzHp9V7POqWw8PPY2QYx3XdYpFNoTmL7mDZzyiF0bQBR5c
	t0VagrpR1+/5zPAmycYtD9hi59FYXGjQHztawJJBPnDLs9KfOGg4yNlergiLLH2sA4EreBpM8So
	dOUAsK8RNeXL4SykJpSN/zfihQRbhmotgv/QrAVl6kTZDIbCDW2tG9tUfveG2lPJ5zYjalMXlxH
	O01fvJB9B260xb65FRZ6bk4s1T5YZw4OWey9xTT3NxeYZuaBsT0Kw646rvFQ/z8BSoD1a2bzecw
	ECLwxHFPF98zLGymVSZXZzuC08hcNxsV0BwvCiMTDPPkyGon/cOkoUdg0LsJ7kxZ9smt/y/UmGB
	oXUeHfs3mm93VYUeCFXP+mrMIZSZ5e/XbP3o0Hka3WNcRHBrcP3vQvBt1JcH2rlM/NHSF4+O+oQ
	rrtJFsZXv3W+QlDG5g=
X-Received: by 2002:a05:600c:4712:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e61643939mr4500135e9.0.1789065949382;
        Thu, 10 Sep 2026 11:45:49 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm18760055e9.14.2026.09.10.11.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:45:48 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
Date: Thu, 10 Sep 2026 21:44:52 +0300
Message-Id: <20260910184452.895485-3-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910184452.895485-1-itai.handler@gmail.com>
References: <20260910184452.895485-1-itai.handler@gmail.com>
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
index 96dd6ae6d619..51128c94d1ce 100644
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
