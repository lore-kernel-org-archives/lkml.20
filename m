Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423D3793A2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270604; cv=none; b=RoA3AySdHUGL4N5YjrCTx8klcvJTexoifv050E1xi08smSRWqF6dV7Hx0Ty1aYw7f30dd8P6fvOxPTBtYqaA6BigxGeYhg1g1WbZT2rxbbFIoZa5oqyz4TBT1Qbh/MKpgegnGL1ZuKVquBziKf+EtVesRF+d9JFtYf0vlzNImu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270604; c=relaxed/simple;
	bh=y5nlk2rbktcB0mr9bhig5aE1DSOnUCWGPb9Zv50URaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sTMfRbr6DzqE/7ozj1Yv8OrS1DaGtfPth7atgtdYn2KNzg8CY3FZEz0FjtcsruQOvzFVIH2cdIfiS2H+wCDsF4t4WyycpJ/bq6Kfz1L7H4aI6JyynL4J5uycFDAvXZFOErV1A9UEjs7DU8Ad4UmOp1Vd+cE5hpAWZ7Xsxgia1iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nmGOYYym; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nmGOYYym"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so2439131a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789270601; x=1789875401; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpeuUSLBGH+HVGEYbdNREfMzEQGOS789hsIrwdg90ro=;
        b=nmGOYYymJu0BbBMa+PLeVdTRcZX6FCFCsHG3+9ElpkokEsdsZfhPoGh/bSb7fn/oRJ
         bI/X1f7d4vr3VZhfDD4GoF8JtS/mugTw0QCgpTrNw5Ko9A1jF63j1xGMFB6BzeVCFYoB
         A+qGFHF/SmMCPvqrBqmWyr01K3RnU1dD6weRpNwqBfXfTS8zmmamgwS6SDrKgxuYDdBe
         s0Vo2X0DXv5q0X8sB28kdOFatFvGWls9o/ec3W+Bt7ncr5oiuT7UQezk41DMfna3sVMY
         kJBueUbTsb7b6WwxO+R8DTDMCy4oWdP5pi8rgDrU5UKetwyg490W8jCZjHaJVCssPJuk
         VObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270601; x=1789875401;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpeuUSLBGH+HVGEYbdNREfMzEQGOS789hsIrwdg90ro=;
        b=nxMrn5mT+NQaI64u9ryfpO/uTuH22cuW8ZyLjATw746UVm57bP6Y8Kl/0Az1thdRUh
         sPnFXY6lAnjm2ECHO2ImY0mTBp+RFXaqIQpgSr4qXmzREYuph/84bYYpOddlEEHu2skg
         Q8lH5KE4HUi0RcUz3aHIHPGf70PUKS8LJUkRkRi+62gb3SaJcD8Stk1jE+FQOF0BxtXD
         FQzpNH8lcBsg12vHGc4u1y0QaFWc9VK5hq4v+HMxztwRwTsbDnOdTjuhQKhYvTEYi1UU
         6EEYdXLk6dmTAoScdRCAQYqWl35Yzasce9OuNYfX4h9y+k+o0rCmPVgtU1hqsU9PtPIC
         rNUA==
X-Forwarded-Encrypted: i=1; AKwUvBzRe4ZOGuuP6JsvEeWVbzYM3gkOc0Ua7A4+e8rcC+gpWOiW3VXZ8fbvWNgxZolZHbth1rq4ORfvnY1OtHU=@vger.kernel.org
X-Gm-Message-State: AFuF++mAml+Lj4apF5ZAgH1lfPeM5bkWtNj6C+oQm1mjsTS+MpIHje91
	JM9JrxVUA3FjZX73tncUaNOyX6oEPD2A23nGyleNC3TrIUD3ieyKHhghdTBnkX2B7EKqiIMyU5S
	A/NJYZSLLV15vho2syEGyfw==
X-Received: from pjst9.prod.google.com ([2002:a17:90b:189:b0:39d:915e:403])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:440e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39d9bc0ff30mr19633535a91.4.1789270600695;
 Sat, 12 Sep 2026 20:36:40 -0700 (PDT)
Date: Sun, 13 Sep 2026 11:36:33 +0800
In-Reply-To: <20260913033633.3159296-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260913033633.3159296-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260913033633.3159296-4-stanleyjhu@google.com>
Subject: [PATCH v4 3/3] scsi: ufs: rpmb: Drop the unregistered ufs_rpmb bus
From: Stanley Jhu <stanleyjhu@google.com>
To: jenswi@kernel.org, mkp@kernel.org
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, bvanassche@acm.org, 
	avri.altman@sandisk.com, alim.akhtar@samsung.com, beanhuo@micron.com, 
	can.guo@oss.qualcomm.com, ulfh@kernel.org, linusw@kernel.org, 
	tomas.winkler@intel.com, shyamsaini@linux.microsoft.com, 
	alex.bennee@linaro.org, James.Bottomley@HansenPartnership.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

ufs_rpmb_probe() assigns ufs_rpmb_bus_type to dev.bus, but that bus is
never passed to bus_register(). bus_add_device() rejects devices on an
unregistered bus, so device_register() has always failed:

  bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus
  'ufs_rpmb'
  ufshcd 0000:00:02.0: Failed to register UFS RPMB device 0

ufs_rpmb_probe() unwinds on the first failure, so no RPMB region has
ever been registered and /sys/bus/ufs_rpmb/devices/ has never been
populated.

ufs_rpmb_bus_type declares no .match and no .probe, and no driver binds
to it. RPMB devices are exposed to consumers through /sys/class/rpmb/,
which rpmb_dev_register() already sets up. Drop the bus rather than
register it: device_register() works with dev.bus left NULL given a
parent and a release callback, both of which ufs_rpmb_probe() sets.

With the bus gone, on a device advertising four RPMB regions:

  ufshcd 0000:00:02.0: UFS RPMB region 0 registered (capacity=32)
  ufshcd 0000:00:02.0: UFS RPMB region 1 registered (capacity=32)
  ufshcd 0000:00:02.0: UFS RPMB region 2 registered (capacity=32)
  ufshcd 0000:00:02.0: UFS RPMB region 3 registered (capacity=32)

/sys/class/rpmb then holds rpmb0 to rpmb3, and unbinding the host
removes them.

Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices")
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-rpmb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 373b60aba916..684fb37705c7 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -28,10 +28,6 @@
 #define UFS_RPMB_SEC_PROTOCOL		0xEC	/* JEDEC UFS application */
 #define UFS_RPMB_SEC_PROTOCOL_ID	0x01	/* JEDEC UFS RPMB protocol ID, CDB byte3 */
 
-static const struct bus_type ufs_rpmb_bus_type = {
-	.name = "ufs_rpmb",
-};
-
 /* UFS RPMB device structure */
 struct ufs_rpmb_dev {
 	u8 region_id;
@@ -208,7 +204,6 @@ int ufs_rpmb_probe(struct ufs_hba *hba)
 		ufs_rpmb->sdev = sdev;
 		ufs_rpmb->region_id = region;
 		ufs_rpmb->dev.parent = &sdev->sdev_gendev;
-		ufs_rpmb->dev.bus = &ufs_rpmb_bus_type;
 		ufs_rpmb->dev.release = ufs_rpmb_device_release;
 		dev_set_name(&ufs_rpmb->dev, "ufs_rpmb%d", region);
 
-- 
2.55.0.1007.g17ff1f9808-goog

