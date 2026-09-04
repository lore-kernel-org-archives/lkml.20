Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DF8444705
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560286; cv=none; b=l8r2Ca7Yt4Xin3cJbxYDcMt72Ua1/BLUwO9rgPNIiBa/ADXlIZJOJ5VGVrhvTtsOv+hUL57Be/TboBLoE13Rnv2b7X730G7BI66CBQSKJTnYWsY3am+pR/PwaGijvCgNZJfLa+/HBRBiVJ0pWdnfuFddhOedzvdNndP9SnpnK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560286; c=relaxed/simple;
	bh=M3ljDf5cp1LAD/hxypnrKeBycVDg5CrbHCeWC0NTb5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kj9XH24zyyA9llgyXc07FMY+5YLowL9lrQcCwYFl23y9/DaCW848Oq/4G8vO6cn48pQsdYkoXuqEpMIyoDVyUTJAgrkPt9xItmIZzwE76p8leB6FhGXx0MCY/GHVUDtsZJh78LpRoJ2ewic/ngofd1VjgrSKUUaFnaTWcLTozUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sB8d7N9x; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sB8d7N9x"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4af81963f35so926052b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560282; x=1789165082; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=sB8d7N9xR174ERGeKGUXgcU+Qim0RlcUSFzZeiU8VJGI+W7BZPV/hm8c0zRm+b8Yup
         o2s0j6wsytdH9I3E/7rfYnsnaHDOOZMa9taEfbBfkIOvtEH8ywzwzUuK5HUkMYUNAtTQ
         yWXzZvnZ3iFUp/Hf8vAjv7jvkEl+yYx3m0SepPTYJ47CErTY5VZCKMcMyYvptgQ+9VHi
         mwpJwh4xsPY8AZOyrDRrGu1u5w9ik/R1CAAWGIV8oztZHnlKF/OvTDxHOS6dTPuRq+Ll
         W2ItJYvLX30TAidDLWBZsqwjNXY9wipp3iCtSoMRJWOpH1rRPyupjuUWOWWJSgA8EOBF
         /nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560282; x=1789165082;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=Zmexo4cGBrImsnBLrudXxxP91cbfEZ3Et78yljhkB6ARLMJfspsoCcTK9cVDdYbxmi
         mogWl6QECOtnsv4oTLS7lFeXjQS/i9/GV49enBieautP9kSTqVWSFEOaY5R0q/Gnkuu5
         ww4ZK1NhnBg5xoAlfJfIyXqGe/k50g9FFt+t5nNnea64ltVIpy8ktl5kq9PS3jGpk+c3
         YFRnrG7UGVbrtdhdVvvNZ12RP95WVythBkehPo1cfFzByFIxT5CXfl0B741R7lsy624U
         YrNn8ZOqj15VS4AbqrPbMVlYBUu2q+vmp3C2MbsQj+VgPwwXe2tx+5wcSXCDV/pf2aWQ
         PDWA==
X-Forwarded-Encrypted: i=1; AKwUvBwejoANz412/qltD9ocYycbr9Agl1XjfclWtlYisOb6/mqqIcgVN9lPbMlHtlU5sqStommzm6OonzDlBRU=@vger.kernel.org
X-Gm-Message-State: AFuF++ngJ2L/w6eGxWZ7CrAEXqgDTclkvXZqDt879i8GO+qw0ZFeyQMl
	8Zj6PRBz5PeEjs5blCrzswpGipe8I6euSK2pu4W3S10XP7+JvRPs4bAn
X-Gm-Gg: AYBFou2vYj4cHrHXizWd8VSW9lCH2IB2Ipt7+kpL4tOf7DqSMREVZbNrXvUpYsAPFHq
	hBqBrQKdmw+VPszdq638quMMO1aKvxgPBcwA/UxbEW3uaXAq/t4o5Hy2wlmmOYVhrTXvxgB0X+y
	HaOQGjKBAzIC0+4ouIe3fdVL2NRfhrw8tYrJMVZ/UBNfUL3MF4NuS6nTVd6fBtmtDzsLqyqAQnL
	7sLRPsjTZbiT5qBnwOM/fvI873B9SMA1xwg8F5ulI5r+kjIVBvVy2AaCYHQuNVnkdhOzv4238l0
	jwbSCBwqQmBn6sFmztqNA0lMx9UG1TcQarOszMXiTe7a3VqUb6Ccb+sWI9fxaC14fkgNjmrdIW6
	j/yYtSktoGMDTr6Ljc6DIkNsxTKYFltiSrPqz2ha3f4uMpPmVLg/esybE8SC7q9V16fmMJ9aTQG
	B3fBPiX4lytThjkwzSinwZIvFY2w1e3LqrMBLivwF+krW6UjwHqcJCrujT+HmFb7UGimaPVbkOf
	XqfPSxT2O5OmTUN1QOmXNr7MUYunxWDNu95b87zkZVQCCiCpz5+u/BU1Mm4/dq4A7shOlzoPTa6
	Vcjnr9p/1Cyf+z1cAdhgioZDnB7OjF+Pxl65hVj/1yWPZDmhcKaIK5z+FLyuaLyU1bJZkE4Ge1S
	yH1HPdJ4uV8GKruKZOw==
X-Received: by 2002:a05:6808:6807:b0:4a3:fb6c:9adf with SMTP id 5614622812f47-4b9622c35abmr8613617b6e.12.1788560282554;
        Fri, 04 Sep 2026 15:18:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c8ed6asm3718199b6e.17.2026.09.04.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:18:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:17:58 -0600
Subject: [PATCH] mtd: rawnand: sunxi: fix free OOB section offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss0trLC31V8SHXDZ2hW4kiRIo/
 XcTfRrOMJzZIVFkSnDtdoj04cRBKpxPHdhVy4OQXWVQg5qGZRgxvc3GuYYURtHi0EciDMFg8D5
 RRu3GyzIpP89+gep5RfJcfh+3+5+r5Ek2N3FbGJ0ITdRi11Zt2fXN3AuVDMfxBUIgyQelAAAA
X-Change-ID: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The sunxi hardware ECC OOB layout places protected user data before the
ECC bytes for every step. Since variable user-data lengths were
introduced, free sections after the first use sunxi_get_ecc_offset(),
which skips the protected user data and points at the ECC bytes instead.

As a result, the MTD free-OOB interface addresses ECC bytes rather than
the protected user data for those sections. Use sunxi_get_oob_offset() to
point each free section at the beginning of its protected user data. Keep
the special two-byte offset for section zero to reserve the bad block
marker.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..559b42687b1b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2013,7 +2013,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 		return 0;
 	}
 
-	oobregion->offset = sunxi_get_ecc_offset(sunxi_nand, ecc, section);
+	oobregion->offset = sunxi_get_oob_offset(sunxi_nand, ecc, section);
 	oobregion->length = user_data_sz;
 
 	return 0;

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

