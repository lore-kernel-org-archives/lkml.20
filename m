Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245941A561
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791110630; cv=none; b=BgKUPXiFSGkh0rBkm0MtVwe6MB6btzh1/qCOQO5MC4SxPYsAmoObG9i+HecPyb8cLgAXCfJccBDZxu1Ey8LmnhQG4wlokSbJ9Vuwl4wj5HY2J7a3gKtvQhc2b4ZGefnIa9SkyqW9TbS+YZTG0riM57JAu7xvwGmuiRq2g1STEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791110630; c=relaxed/simple;
	bh=mGbdhxauRSb1VFQP1UYcstcwcKmt4bai9EGt5Kadvko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uauaRvl+D6s5qcXGGNT4PxcYPCDSF/96VPmpnoUQxOGkwLVVSRipxdfdMEzU/JCIrIBHnBIOaAtnh6tU7TaG3MbARLN/JJKCR5r9rov209Ptc0qkXa+k9bPs5nfct40fI7wIju7Zs7B0Baj+62muClodyQuEcCShy/IDOeooQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPW7rHeI; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPW7rHeI"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b02f47696so111126f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791110626; x=1791715426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuzfUhec6lTMalGhDglyxwQlHTBIqwq6CfD+AAkmFlE=;
        b=BPW7rHeI2ezrj7hSf7mMb4hO0oMLYDQYKrb8LU68y3Agd6Nx+9dwh1iho1pOgy6KWY
         U2CvndQkMzz/zm9s/9LkbvxNJK/gyidgaGYPgRlxYaLCwIlURpgCY9kHuFOAi1IlJSWj
         foc4Y+ubQeWFkd8VNEQA06D3GQFcJTC8tu31sWZ3qIFqq5fFBAAREaZv7DHqHxgIduMw
         PVPIMDzHklJWclMxjMFUAJHorhDfKSQFoQk7DKLBb5Iv50VMnd3DpgdXUxT0ZjOvcNnm
         Hv3QMQE7qjEW5RJInH14TyP1XitwU66B2iugLcM2ofsAqxo8HFZyqCdTT7FpTwDXzDmU
         le0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791110626; x=1791715426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuzfUhec6lTMalGhDglyxwQlHTBIqwq6CfD+AAkmFlE=;
        b=qkhwZ6Xyx++M5QkgnrH2Xhn0DAfjkVpYvm//HKj0gwVG/9AUzK+i0odjBhARSJmgWR
         TIaTrWr/p6/q9TNGC4XVvmX1ZeuXyOT0aVU+7kqD44ekNrfq2yxvSE+MbwOSD5wSQk9u
         xp4OLg9BTvrfNPLmHi0acFXzGiNjXoPcMImVSc8O3ZrsnT3V0Njj8DCiruZDYHPGQaRx
         0ctJcGtRmGa0i359ZRSeYQJpsFxkLWW80mkrEtY5Dz8khLL2oqVPabNGu62YQkIyofte
         TDa9ei0Tw3bH3bk59tKWaursC7/htkfTZynLSY3W1K0o00YUniO5eEjEqLflrbOji9JM
         babA==
X-Forwarded-Encrypted: i=1; AKwUvBz1Y5rfwKWv/QzREp2EzaBS06gOxcJtO2AOAlW1QbRZBYywow3xKEb+WZMNKx7w18ugThGqxt9OCqxWJSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUPJ1dkjoUR8a7jX/xWPCWaDxkJRjscorZpzFT7MyjOcRWDsmb
	aBK3mIov/VxAsG3aeHWDWcwrFsWLtIYUARtZ2/OSmhKBYPwHzluqlplp
X-Gm-Gg: AYBFou1KcMrDnKmWZEWm2XSXNKFSsqyHpi5KbCiKS/rOxEBbOrWGypuqOtC2Pxsuzu1
	CvwaChBEKbOSc7+Ssv2EdfTpeE5sdHqkGah1CMvEbGfQOGysFfZyR/gBYc02UL0t3LG5fPquCqw
	nruLMf58OUGMd6Ugz2Pic7xX/K2IVZ3cfKTwcfZVW0KzQ0K8nZEXYkHeQF39v0MEexD+PM8wfTI
	K2I4DzLfvCQMynoSTDC4Udw3CiOZ4HfRruhefMw24FnIchIxPQSH/tu3vCEPrjIXSdnFQCXHs9F
	syojBSshkNVP7F5AbR56slUcFS+AIEb26Es5atSiNFsIa3/pTxo1CKJC3UQVFVj2Ufp0hGowo2o
	JYDrVNJFCd4BWqrBJP1KnGn2+8E2U3INtNjEkQWlMUwbOn+qoSu+PObduehVdDy8q0Ems7n6AVW
	jfGz5vMNPBsPnyxsdw88fKTp5nsPHsv9h00Y6pyJwRE+HiNIZateij8WX45AoD96NHIZNV5rcot
	1UkypFdJ85B01aLbio=
X-Received: by 2002:a05:6000:260a:b0:48c:45c1:5592 with SMTP id ffacd0b85a97d-48c45c1565fmr8429713f8f.0.1791110626430;
        Sun, 04 Oct 2026 03:43:46 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0858sm19831719f8f.8.2026.10.04.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:43:46 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org
Subject: [PATCH v4] mtd: spi-nor: take the flash lock in spi_nor_restore()
Date: Sun,  4 Oct 2026 13:43:11 +0300
Message-Id: <20261004104311.2196527-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_nor_shutdown() and spi_nor_remove() reach the chip through
spi_nor_restore() without holding nor->lock, which every other path to
the flash takes through spi_nor_prep_and_lock(). Both run with the MTD
device still registered, so another thread can be mid-operation.

Neither outcome of that race is good. While the chip is busy the
address mode exit is typically ignored, so the restore is silently
dropped and the chip is left in 4-byte addressing, which a kexec then
hands to a kernel that cannot read it. The soft reset is typically
accepted even while busy, so it instead aborts an in-flight erase part
way through.

Take the lock in spi_nor_restore(); both callers are teardown paths
that can sleep and neither already holds it. Waiting is deliberate: a
partially erased sector cannot be undone from here, and the wait is
bounded by the one operation already in flight. If the lock cannot be
taken the restore is skipped with a warning.

Requests arriving after the restore are a separate problem: they race
with device removal itself rather than with the restore.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Assisted-by: Claude Opus 5
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Changes in v4:
- Correct what v3 claimed a busy chip does. v3 said it "ignores
  everything but status reads", which is roughly right for the address
  mode exit but wrong for the soft reset: that one is accepted while
  busy and aborts an in-flight erase. This strengthens the case for
  taking the lock rather than weakening it, but the old wording was
  not accurate and the comment now says both halves.
- Lock inside spi_nor_restore() instead of adding a
  spi_nor_restore_locked() wrapper around it. The _locked suffix
  conventionally means "the caller holds the lock", which is the
  opposite of what that wrapper did, and spi_nor_restore() is static
  with only the two teardown callers.
- Handle the spi_nor_prep_and_lock() error return instead of ignoring
  it, and warn when the restore is skipped.
- Say what happens to an operation that is already in flight, which
  Michael asked about on v3. Short answer: it is waited for, because
  an erase cannot be cancelled safely.
- Rebased on mainline. v3 depended on the spi_nor_rww_start_exclusive()
  mutex leak fix, which has since merged as 44b8a0bf5f96 ("mtd:
  spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()"), so
  this no longer depends on anything unmerged. Note that it is not yet
  in a released tag: v7.3-rc5 does not have it.

Link to v3:
  https://lore.kernel.org/r/20260915113811.2429311-1-itai.handler@gmail.com
Link to v2:
  https://lore.kernel.org/r/20260914081149.1916589-1-itai.handler@gmail.com

 drivers/mtd/spi-nor/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b..94dbf1b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3455,6 +3455,21 @@ static void spi_nor_restore(struct spi_nor *nor)
 {
 	int ret;
 
+	/*
+	 * The MTD device is still registered here, so another thread may
+	 * have an operation in flight. Wait for it rather than cut in:
+	 * while the chip is busy the address mode exit below is typically
+	 * ignored, which silently loses the restore, and the soft reset is
+	 * typically accepted, which aborts an erase part way through.
+	 */
+	ret = spi_nor_prep_and_lock(nor);
+	if (ret) {
+		dev_warn(nor->dev,
+			 "Failed to lock flash, skipping restore, err = %d\n",
+			 ret);
+		return;
+	}
+
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET) {
@@ -3470,6 +3485,8 @@ static void spi_nor_restore(struct spi_nor *nor)
 
 	if (nor->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
+
+	spi_nor_unlock_and_unprep(nor);
 }
 
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,

base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
