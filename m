Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064F3CEB9D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690891; cv=none; b=nuyzOObIHxi8AfXcr4cc3LciM+UUboSigGer3cpif4Rff9KsjlrBg4npNGKLbG2fleQzSeT1urWv5T7mdKGL/8gd+A/b05ULl+zx+JNm+75Td9wG72pOk+i3vYzoVSzheozKvedruDCtEeYSd24oNuJ2MD14lehHAYVqUcGX0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690891; c=relaxed/simple;
	bh=zRmSSpx7pOpIVgGMPJbmxUydIOWy8dcYMe0BfTr5YCU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QiNM8lfXfqFHsIVxB2Q8+HYo6DEpvhgTFme1LjHx2svqGqkg4o30lkRzsVLuXSGjXjq30uy1uFm1YECYpUUuaZB7fDgwDndnbhLuX1+9+1TyPmbqW18vB6v0zavRMpcqAEqt0g2gEqC1JgNsFJXZjb+vYNbb7CNzw92o6fJtYiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIALrTS3; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIALrTS3"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7cc8bffedso454289a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790690889; x=1791295689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9E1G8+1SAy708zksU5Axe7JTCFgve+ogorVJl8uDEi8=;
        b=MIALrTS3rLZHeMyXCk6Mz1vM0DDg2elk44mDH37l5cqCKkmLMzTqrfyKyXTwiH5zH6
         +VrCXt3UD77U/rWIun9OLQ65fRuEOsEmDnnAwFvoR2DfHjMSG0RmngWy33FWq8MQcACE
         MoElO1xchMnSNvNKlbyZlJ/wOWI2qP/RlUFLI/fA2gVyDDyDi4I8f8Nr/HZa3+lzVWtc
         /PH8sC2oDcIDYzj6o4cyu9Me9/Ilxo0aurlrvGwTS0XA/nWQVkW6qViwpx44YcQ959VX
         P7o1C3JSFdLo0LfcsalM2cugoGlZ//Vbqll7pZU7MtcrZ/0PaW5KgNTX8GpleqRW62h8
         vVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690889; x=1791295689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E1G8+1SAy708zksU5Axe7JTCFgve+ogorVJl8uDEi8=;
        b=W9rPBaGB4Tc048I+BGO1XXUgVkNW/uhjMXb/7YJBWLGXfJVV2kCk55gxsYvNt8gGQQ
         SySCQFeN91i2a4SI8UO41o5EWeWDrN7XtEErWaEU4zR7vSS/6PBGflkk8YobY4hraDaI
         3FNrmFqnyOLltCCKdeO9rpf587UgCwBdZCnVeeOpbZgtMlixkcu8tIamXpMZSW/wdcSX
         1OR8aTPeuKSMYU4oy9gOsMC8fZACNV1M2dR3ov6oY6A3kgQhOxwoiplWy4hLbS/CvIcC
         ZPP22WEWS+qcjAj/kG08oko8SiKpSbAVvq7IvHzGMZ8Fiyg8EsjqiXD26w+LijPxcI1G
         sCLw==
X-Forwarded-Encrypted: i=1; AKwUvBz6YTL6JgalJiKWsHrS9HtkF8wgbMYi0g1g+4Rmif/qYgLkHPuxjZMxXtl2uAAxoU9trmEd6FkgTRx4v0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nT7ouYKi9yWHFQu9tNGXfE+SIDhnEW2k3Kzu2sUMEgtZVwQGAX
	YKwt1GIec9evRnkHx2RRASi0tDRLMguCGmw++1ePf4f+XZTJ3mwjpzQflylAr1aKaWBwYXIuFKW
	xMOffVGNOh4fvVS+nmprubQ==
X-Received: from pgdj13.prod.google.com ([2002:a05:6a02:520d:b0:cc7:9c2f:bcca])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6f07:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3de0e73d922mr15677870637.17.1790690888675;
 Tue, 29 Sep 2026 07:08:08 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:08:06 +0800
In-Reply-To: <20260929031352.1355691-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929031352.1355691-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929140806.2859367-1-stanleyjhu@google.com>
Subject: [PATCH v2] scsi: ufs: rpmb: Fix power-on UNIT ATTENTION retry
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A merge conflict resolution dropped SCMD_FAILURE_ASCQ_ANY from the
retry added by commit a8a34238e5e6 ("scsi: ufs: rpmb: Retry power-on
UNIT ATTENTION on the RPMB WLUN"), so only 29h/00h is retried, not
the other 29h ASCQs.

Link: https://lore.kernel.org/linux-scsi/yq1jyo4onqe.fsf@mail.kernel.org/
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
v2: Use scsi_sense_code() (Damien)

Tested in QEMU on top of "scsi: ufs: rpmb: Drop the unregistered
ufs_rpmb bus" (RPMB v5 3/3).

 drivers/ufs/core/ufs-rpmb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 50ef63afd528..65f2d71cf073 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -47,7 +47,8 @@ static int ufs_sec_submit(struct ufs_hba *hba, u16 spsp, void *buffer, size_t le
 		{
 			.sense_key = UNIT_ATTENTION,
 			.sense_code =
-				POWER_ON_RESET_OR_BUS_DEVICE_RESET_OCCURRED,
+				scsi_sense_code(ASC_POWER_ON_RESET_OR_BUS_DEVICE_RESET_OCCURRED,
+						SCMD_FAILURE_ASCQ_ANY),
 			.allowed = UFS_RPMB_UA_RETRIES,
 			.result = SAM_STAT_CHECK_CONDITION,
 		},

base-commit: f09d2c7485b32adb82336d0d748935c8237a649e
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

