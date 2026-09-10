Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3857D3B389E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015517; cv=none; b=TTDLKiJ+pPLGekJ+W7SXGgo02hukv3KlvZmF9G6W8yrAV3WF9XvgJpUkBKfP8/vOr+thyjzxF0rxoXG8RpjsOUzxVeqhLjbb17N5qH/HD/GkYNMFdt5PJRxm+//LsPaVs0f8T9BbTUMEU5l9EOnd6Rg8p2LvfP/cpc7ZW4z6KiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015517; c=relaxed/simple;
	bh=n/+GTYvLUZZ9pA5+4U9usoGSvJ8enP8PsX95i44Jayw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seQ/jXFxT8iV8oADbHfc02wxjEGzj4wHMK6pDCTaGmyeviCduMIctt9CH92JsBKA86VnQB3K8CbZVyBY/TvYn8EjaUVq8QmQ30k7vNqS1OubDkP7U/ftVvLHVttaMyuI9Oda5Lb73XMjfkY0kShlo1mYMv19DbgVh6cLUhr44Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYHwSVET; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYHwSVET"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so792030a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015515; x=1789620315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xagfVfFsWbuH9k8xQPhdcSwtP7FeIrzvWmgH85ROu0g=;
        b=DYHwSVETGxzi/X+Bu95tNjJQk81goQVCKezkFTp74u4Ggf9D524rKFNl/oemFeDEw8
         t17kP/o3C11tcDOIXXVhyP10ugJWFbDCPgDxIM+KU2v54kb4VUaGIMXCvhNWq0RWcwWO
         +acpYbBaZGP8IgCZ4qIIgwxuidxkJcwFtMdeASKJWGm4xPBi4+CpDIcPDxXHPka5FBde
         Bu61DpLwAuA0v4xtixawIhIqfLBTcjxdwf4MPQ0RJi+qNQEWi9wytsHsyenr79Ead8D+
         us/q9Fwt0cLy0tUJ0Q7ZeESGt8d6dSL8+tJy9eZ4AIBoQYH5++CNDk/BcZqLWeLUOaF6
         jrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015515; x=1789620315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xagfVfFsWbuH9k8xQPhdcSwtP7FeIrzvWmgH85ROu0g=;
        b=RqzawhUOVZh+AttDUdve4FZggNBVUAlURnAYFeTK158f1RQbGhq3I8iST1nQW0p8qi
         VVf3DLneC2RNrjn5sVvxgS/Y1Tduu51MNWdZFGpvBFddimv5stU3A2hHvXAq6v/XHBSX
         5wTyICUTx9Y7Loal9D5aKZBYMcA+A++BqPJ5aqPlQk9YcMExnlodai2KhvRr1zKUo8TF
         /D7VE6LSJ8348OtypGxD2LDlFT1VWpB1nemmZ8xMDGdRWBXDUgguidyd/MJf3gmPQcH6
         OaHpVUU6XLHZuopslc9UFvlp3Dl3b3zgRjqkzFxicmqKFUAO2vyghVOXPs9dTw3Ix/0+
         Trmg==
X-Forwarded-Encrypted: i=1; AKwUvBxg+PZpYNSn2u9WCLw1uDmVxDq1Nj+aDg/uEPdJA+4r3rU3Rl1X9XNXXnfv/1EgeKfQjI7Act9ftMFKLBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mdT7clsJ0DWI/O+dhu9K1BJmdR8AkX4nX8VRfE1ChhDEOWRXSa
	0BOldxhx3gntn5SGrXrmNFSNRLCt5f1+XlGnhXG4AahmxLtO2nwwKcch
X-Gm-Gg: AYBFou0ACAspx5m8O37l6BZy1BG/GnSpNpjDHVcjk22inBbdN00P/D8jB1rJaB3XIYY
	AXKacQv5xXEu0jYXHpQvZ9nkMTrLq3CRu4K6HIa4S9SCnxA1k2yHUC+zCdgTDsMYT2naqgUN1fU
	hBI29cDHvlVG2BkNRFBKLhbLsJwncv2v9XMzoQ7nL4XV4XU6r+Ra5coDEo7e5Zac2Lcg2BQbdY9
	BnoSORvtvSIRuQHD8i2aU8GqFNB19uJY6wkpUD8oK/VRBDcH6ML/9Gg1jhZ7r2wWPmD13pNVs0Z
	q3e0zKssYAj74KXJr/PVB4RhDKbhcmNRAzNGVenc0tY7R2loCH5sMlz/3upYjvSfy4/aRUEFNkx
	nQkl01agUW0CAqdUA/WX2ZCLQCQIrx5tfRKOpouja/mqb4OQiTbeIfu+Pcw53jKpwDSvDALe/no
	Ht0rXpPJ0Y1G3NldHQIRrXxZWdfyH2J9FCCVtzQyYMTLr1PN1hBMK7iLe/2CFevtfPSdQaJlnwf
	giNmKk5ZIBqWrPY8Wb5PZvI+g==
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr50676984a91.8.1789015515410;
        Wed, 09 Sep 2026 21:45:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] platform/x86: msi-laptop: Fix typo in struct quirk_entry comment
Date: Thu, 10 Sep 2026 10:14:40 +0530
Message-ID: <2b5e16441db21479603772f0af0b47a1502e4667.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "cann't" to "can't".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/msi-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index ddef6b78d2fa..0a0c756a5598 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -117,7 +117,7 @@ struct quirk_entry {
 	 * Wlan/Bluetooth/3G, those netbook will load the SCM (windows app) to
 	 * disable the original Wlan/Bluetooth control by BIOS when user press
 	 * fn key, then control Wlan/Bluetooth/3G by SCM (software control by
-	 * OS). Without SCM, user cann't on/off 3G module on those 3G netbook.
+	 * OS). Without SCM, user can't on/off 3G module on those 3G netbook.
 	 * On Linux, msi-laptop driver will do the same thing to disable the
 	 * original BIOS control, then might need use HAL or other userland
 	 * application to do the software control that simulate with SCM.
-- 
2.48.1

