Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0673112B2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570343; cv=none; b=ItSciGCu5Djlt5PE+gwfzPrS0FwmRXXsJUDf6GmEQ9rMC/4AdYVL80ChYByGNrEMIcY5DGUZ/5R0bM3P51gJiKnqYIy5nPyQJOPJhPsh9IDHtvhdBb7CmgVbL/VqTP9oWO7B0v1w/OJcqETj9KAa7hTuapbgSGWgZOPXzIwu72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570343; c=relaxed/simple;
	bh=AZeymz/HujPlsyjjrcRekc+HnX3LbuE7qM8Hmou01do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N8OdC/eg9udsZZvfZ033dfdrGG9soDpeY2gHR6+BcT6bj0/SDDLWsLgW2Io7PhdVMBhGsmm6LYqPjX9OJ1jMJD3LK8u/OGSnVdqgj+9A4ln7V8ICfQHuF7txgD1DnMAfPgL8wFLA4eJWsWXvje9AEvN8tlvZU/EpLqNqSGJY27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnwFkJNL; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnwFkJNL"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-465cfc7e33dso994435fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570339; x=1789175139; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=DnwFkJNLAoxPjQPYO9ccjaYfYYjG46+DZ4DIpxHHJJBQOu3E7brleaVI3EUeWlMlCk
         ytvb9mKnkWNXutCUwH1VuXVIDTk87zX7W/eplmT/DjpYftUbfpvokH8g2VMNCWFTPGq5
         1OVJ9U9YHSVbbipX8FtgZJd8swapni5O2TgpfU7i8DJcjKT+h2fdFSNbEQ3BFLXVb63Z
         PpddVI9w3GODJaZulyr9lp7cxP6EuaF/8ZMfx7qPyVsgtakXyGGizE6jweaJZwZGB+vv
         aYADIoH7vSCO7xtle2AoOwSrPfxZ2wiKQw2kmOR4qPV/6PI8zl6wvdBtCoEMpMX2rYhI
         7XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570339; x=1789175139;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=NoK6c4zx7nMkfOla8/gGlZgaqJB340mpXdk/2Fllzyd5MfjPYY/edaIEkQLqfY1wzn
         Sd9tMg/Ntmbd34jSGOz+93FlUlD5nhimoR/Q79XQRE3fb2w/UnPdXzKgxu+H5rqCFKGc
         HhN9E8f7K2KG8PZxsD06LwVCQvG5YuckoixP6rgYtucqnpzBumYwwF72Yaes8u7+2ki/
         +Rf2fFQ6U56Orr0fmT94tQpqzL2HPnnTo0hmkXciSen+I2Kwb4JnMfQgF1+MG7W0sVJw
         0qLSrVfWtgnNPNupo+2y4jtnuXqrOzXtla/G5Pj5T8WQ28P8LfgjgfvknkIkQhANkhj3
         f75A==
X-Forwarded-Encrypted: i=1; AKwUvBxnr8SVGeW8scTl11ZaxWfzb65SDnJqKsukPr4E7UwvvXaaFgNBTgOn92eB/+i+naLSbjmbdiWo9pIyEAg=@vger.kernel.org
X-Gm-Message-State: AFuF++lzxb5hwiqGWYgGdbe959SMOvdiicz4XauKQquh21qRx6Ze9Yvc
	QwoujsZPdgGLM2vagtSIeEch/x3WDiymSPcrvz2f6OG/rxPTlnmWivgo
X-Gm-Gg: AYBFou14NwWN6Tizwn+lEUGRhvmwehivR6VtsYhlsLfrENd4oKCT3D+5A+kQ0153ipo
	+OwajPQi8Xbg0zD5CbYldYxR9dwaxD6fuREsuJQkhTZtSxjzWjEoCpBxyevq8U8iFfeUawAkG9e
	t3OUl5RYtADDSrS3l99pT//6mfv1IZyDpTHfY/Wxos8PfyqC0/tde704GeSRQXSpd60bt7ctKoZ
	D7zUQTkRMXmON6gJPVQoPiE/MJDqlx8VAclOiLqFsDqBTzot6jwiX4XyAMfDwdZpXkeFdcFaGcf
	oJUBjcvx2y5KSw0hOUdZmSTXC3tJDzyAonQsSPO2c2JAV0nbsJhWu54jhYw+KRYeVaEit3GV/Bd
	bCmGEHWbOZQhdqaPQiRkHfGcUvlwUHqNV8vEa1N/kjSflgabvKd+DIEg7w1UCD332NnDZDvXJHp
	heWBjZOEI49qV1mlGAIeZMHRztM+m5ZpLNKiGOiMfOybnYsYJastwh/QHa7dWTNqXN4tDnwWxrb
	jUYlaif2QqHZOFfKDynGpCnJhKTUJEiQqGi8sZH8T7XNIcRNqT91swzWyM7PGqTweXa0ULAMeG6
	9xu3NbhC48aIOBNzIhJPKqSvrV2fnZ7YQN7uEK8+NCMoyBdodcWX80acpDt5e+OHDRO1lo2tWI6
	kyct0TdFYHJtGEqXGMd4=
X-Received: by 2002:a05:6870:318c:b0:475:e235:8fe with SMTP id 586e51a60fabf-475e2350f4emr4299634fac.28.1788570339228;
        Fri, 04 Sep 2026 18:05:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475544fc87asm3337849fac.10.2026.09.04.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 19:05:37 -0600
Subject: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on small
 pages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQqDMBSEryJZ95UY/7vqPYqLGF/1FU0kSYNFv
 HujPUFXwwfDN7Mxh5bQsVuyMYuBHBkdIbskTI1SDwjUR2aCi5I3PAf37mbyMfRKoKXuAZUC53G
 BICfqpY8G4FhUKa/rrsCKRddi8UnrufNofxxFL1T+kB+NkZw39nMeCeLo/bsZBKRQYtbJUnDe5
 PV9mCVNV2Vm1u77/gWdcmsl7AAAAA==
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
and divides the available OOB bytes by the resulting number of steps. A
NAND with a smaller page therefore produces zero steps and a division by
zero.

The older controllers also provide a 512-byte ECC block mode, but the
hardware documentation describes that as an ECC block size within NAND
pages whose supported sizes start at 1024 bytes. It does not document a
512-byte NAND page mode.

Reject pages smaller than 1024 bytes before deriving the step count. This
prevents the division by zero at the point where the incompatible
maximized geometry is selected without changing explicitly configured
512-byte ECC block handling.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- reject ECC maximization on pages smaller than 1024 bytes instead of
  selecting the 512-byte ECC block mode
- leave explicitly configured 512-byte ECC block handling unchanged
- clarify that the hardware documentation describes 512 bytes as an ECC
  block size rather than a supported NAND page size
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com

Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c84f304fb749 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,6 +2084,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
+		if (mtd->writesize < 1024)
+			return -EINVAL;
+
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

