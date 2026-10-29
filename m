Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257727;
	b=Bu/52e7i0qYP7/SadwV/vZx6LP8MJrpZS+IzE7uvSHA9pFwWs7Q+X2XNOSp1fHKnJZwo
	 SbYp9aBxHr/y5ZnsgjtyhYsPPnDzSTACflaAGZAuUoStpKdZnvdW1D6REYNUEmmr0mso1
	 f/kUlOu+s8p36dBYJTJ+jCyUzjACEEvNusD8mUKtHyKNo2G54JeaMDKTsDMd4biS1f1Zr
	 1van7gHEE/YFZ9023zig1OahLjl/xDlF9haif475xJhVRbHYr0s1N18+Pqtqo8vh6o5o6
	 k0N6t4xQXv4dOyK2TVXmuNbcQSzE/8Jp6YVrbhXmuotOfwH1iResMUc/ofJX0Dl7efg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tB6IjSLw2lUt3GzsVlpUFA64RG4Q0LkTtEgr3PkQCgQ=;
	b=RG9YiAFLQU8W2a8EXhHeZiQXb93k9/ox9QR+76wYe3qJJEbkvmlsuL1JS2FmAzeEBDag
	 qaAeIJjoxtYQVRK9/+pXS9/BYqfBnzygkEgxjzYNYP3TMTrqz+jJBlI+5c0Qt8aMe3xTp
	 VQKX0uhprhpygkg7HIGMBjxfeSgvvtyOjnG/znAp3AYwpmL1sTZiXPd7EeiSt1KjMsnmX
	 uARPV/3KhSwnDxRkG8oO/SxYlONoLbh5B06XdljLqutyQp6ydHYy0NyXspD174VmGB4I8
	 5XE8macKHSmqZXWU5IkvlJBgCoR2d0Bh01O9QSEYHTKheAZuegZ87uusJYZOxeXRCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B67WZZNT;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DACA60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DACA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B67WZZNT
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd8b299b05fso1884222a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257727; x=1793862527; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tB6IjSLw2lUt3GzsVlpUFA64RG4Q0LkTtEgr3PkQCgQ=;
        b=B67WZZNTv7crYkEp8JPhJqUJMTGUqFZnVcGJpCvxrQYEaEOj3b44Oyix/eAk5aiF8P
         x/gHXErxb107EaoVt3F8mDf/tGXjnSPX/2Eb41UeKouCWIt/9MYCmv+IKkdBVB9XXruj
         rXCkLoBU5NnTTutz8bbHNm3Txx+mvrqFabKsybROvaRgTo0hl8qHVGWH0JiZZ4iiFKJZ
         4x/soqeYqUuEKmPFXc+q2p7jha4q+wWl44kkSPAd0ux+EDKvulBeRHUz2At1CwJ/Cg/g
         4eL8Dw4InjerS11JHwTYaHLfqwPOQ1onsWPkjzkCXZFQ3AImjWEo2J08N+zqFt9ceeWk
         9eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257727; x=1793862527;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tB6IjSLw2lUt3GzsVlpUFA64RG4Q0LkTtEgr3PkQCgQ=;
        b=BMvhAain+qaSb2G8y8SoLludszwCMUbHJQLdEoeA3gonB0Uexmwf2cp4yCzzNJ7hrl
         5cZ/MpzD5P4Vu9qoeFGTjKE0D6axozCi8AhGhM8rRLI74P3Z4lvZw3x65t0cxorxGld6
         YFXvc+pKu0Lco7ySKTEbgHmzCT1r49MrbGOm/kbvSyD9mIahzwUZW0XYZs4Uzlw1zgAh
         UUzaZnK7ZRjhQEP11TNuC15y4nc1RrjevbHyiJPJiWZwqR7a8mznTenqLoxzrE5yldpH
         4NrD6iQZtymHRgWJGE/SZ7oGR1IrEQjIOaDqLleyziJyIkPr8X8iT87Ruul791tZ+ONU
         RYDA==
X-Forwarded-Encrypted: i=1; AKwUvBzGQfKedvcETa2I2GAnBEvBWfdXsTCMMKi4tC4mlowPx7T5pYxyB9rgiqm9Y0ewNN+LUM+sTCvIwFF34eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjArHqDEMlH/Yj1PkopDGoMZsr+YHpQD6QWyC0oOk9np3tW6oh
	bqcjC/8/d7dCePU643YoVorpu2CfIcMStaukFuqLlyPdDX1TuR0vjiexOU937itZliNaw5Cfnyf
	/+lnZCWKEqR1lTvG6gb54yQ==
X-Received: from pgbj17-n2.prod.google.com ([2002:a05:6a02:61d1:20b0:cca:d82:90fc])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4cc3:b0:3e1:885f:b49d with SMTP id adf61e73a8af0-3e9024159e0mr4092891637.52.1793257726442;
 Thu, 29 Oct 2026 00:08:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:37 +0800
In-Reply-To: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040003.2100003-3-stanleyjhu@google.com>
Subject: [PATCH v2 2/5] scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_clkscale_enable_store() and ufshcd_auto_hibern8_update() resume
the UFS device W-LUN with ufshcd_rpm_get_sync() and ignore its return
value.

For clkscale_enable:

1. The W-LUN is runtime suspended and clock scaling is disabled.
2. User space writes 1 to clkscale_enable.
3. ufshcd_clkscale_enable_store() calls ufshcd_rpm_get_sync().
4. The W-LUN runtime resume fails and the W-LUN stays suspended.
5. ufshcd_rpm_get_sync() returns a negative errno, which is ignored.
6. ufshcd_clkscale_enable_store() enables clock scaling and resumes
   devfreq while the W-LUN is still suspended.

For auto_hibern8:

1. The W-LUN starts a runtime suspend.
2. User space writes a new value to auto_hibern8.
3. ufshcd_auto_hibern8_update() sees that the W-LUN is not yet
   suspended and calls ufshcd_rpm_get_sync().
4. ufshcd_rpm_get_sync() waits for the runtime suspend to finish and
   then runs the W-LUN runtime resume.
5. The W-LUN runtime resume fails and the W-LUN stays suspended.
6. ufshcd_rpm_get_sync() returns a negative errno, which is ignored.
7. ufshcd_auto_hibern8_update() writes REG_AUTO_HIBERNATE_IDLE_TIMER
   while the W-LUN is still suspended.

Add ufshcd_rpm_resume_and_get() wrapping pm_runtime_resume_and_get() so
failed resumes drop the usage reference automatically, and return early
in ufshcd_clkscale_enable_store() and ufshcd_auto_hibern8_update() when
it fails.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd-priv.h | 5 +++++
 drivers/ufs/core/ufshcd.c      | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..99f654b79035 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -388,6 +388,11 @@ static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
 	return pm_runtime_get_sync(&hba->ufs_device_wlun->sdev_gendev);
 }
 
+static inline int ufshcd_rpm_resume_and_get(struct ufs_hba *hba)
+{
+	return pm_runtime_resume_and_get(&hba->ufs_device_wlun->sdev_gendev);
+}
+
 static inline int ufshcd_rpm_get_if_active(struct ufs_hba *hba)
 {
 	return pm_runtime_get_if_active(&hba->ufs_device_wlun->sdev_gendev);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 68a98cde5812..5972e85d279e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1864,7 +1864,9 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 	if (value == hba->clk_scaling.is_enabled)
 		goto out;
 
-	ufshcd_rpm_get_sync(hba);
+	err = ufshcd_rpm_resume_and_get(hba);
+	if (err)
+		goto out;
 	ufshcd_hold(hba);
 
 	hba->clk_scaling.is_enabled = value;
@@ -4792,7 +4794,8 @@ void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
 
 	WRITE_ONCE(hba->ahit, ahit);
 	if (!pm_runtime_suspended(&hba->ufs_device_wlun->sdev_gendev)) {
-		ufshcd_rpm_get_sync(hba);
+		if (ufshcd_rpm_resume_and_get(hba))
+			return;
 		ufshcd_hold(hba);
 		/*
 		 * Serialize with the host driver's AHIT control. Skip the
-- 
2.56.0.313.g2479322e68-goog

