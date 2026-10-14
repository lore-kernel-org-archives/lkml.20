Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B24FE2E8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975994; cv=none; b=IYrPowzpAdNMauJC20j5VTH74Pw2zHh7xzS4hDfp4C3VQQS9e1/AWt7A2VAMpT7XLaYhzW34b2DTtj/su+ZUuPhGJ1bzsS5jkaIu4ZdiRiojRmeQ8J3dZn/ZBu5bdo1ZqMRLBSTsb+tcwYtI6QOPBDwUsosi6thi2QACK3z4n8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975994; c=relaxed/simple;
	bh=1oNi6qtg0RYoEu/F+U0P5N6Ojkho/eIeeeYWKL1uRxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jw5pEe2iV6l3nLXgqPSKbLIqIz3MjqWnXxX/cFmiUrxNSHkrI55vZHhrknzKMcuny9edI0m/VLJaTMaYTZK7GtDnXDrdxsfq7Nx4XAZBBCJPnf8lKDAxEZlwPKmMjXgAVRf0XylXAvFADApIGk7BpAZgd2dFMbYQiCXHMlr4USY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwDiZxtf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwDiZxtf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3550c917fd3so1154995eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975986; x=1792580786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IA9MBfKgv1sdcLYi/BMK4mg1HgVG9k9DlxSmN5iI1MU=;
        b=KwDiZxtfZihMiEOYpaxGywBP5x/qcCYZN6Ip9jvkMyrB07iTCl+ZRfFNMKqE9CxpOp
         83tdL6i2XIeh5mxMIC7ZjVXlIsyI7xLswF+PTLhJmjOChOOPEhVoucyAS938OCye2bXS
         SNbyEvaDJIqPcaFlFtbYu+bFwLyLNbuh04a4B7UdLoqfVbi7Jot6+Ew357Aht8MRt3Eq
         LHxvQlTnB0uqvG9/WpcaGsLFMDxKg0rL2Z2UrC2mrLit3w2s3cmRhBvkp0KJZdkY1fL+
         v9RfoH5MN6/t6YCAdeAuSdYQaAaEnUzTp4Do9Aj9rHiLh41GC8emnCK5lek6be63+7TZ
         7luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975986; x=1792580786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IA9MBfKgv1sdcLYi/BMK4mg1HgVG9k9DlxSmN5iI1MU=;
        b=TTcPfoGJrZeqe9qiS65h+0gffEUxoRNlY948adEbbfcVLna69BjXcdNubK6jp4y68W
         h3jtQRTGFSC89ljCT6bzmPxEhSkENNH6GNSH7blx51nspoZnpxoEn5VSSdvaHjqrhZDa
         f2s0X/T6Kz3VbVsBvkOLnydfScuXTfn1cImBQf/aOyN/kCz1n8b4nnPfJUsjcjYYySxr
         r9ZAqFPokTlCc9PsSTZ4hPF0PRB6C/oNzAxtQTl4cVLAdnLuDzR6BMdaRBS8VBaM43lH
         LABPLUcwR1/4FPfh4d063W5SFzZFUySRXKt2K0ZaIf1LSWj5BiL+hCP3Cxm6EaC0ev36
         HJcw==
X-Forwarded-Encrypted: i=1; AKwUvBz/Cp+mfJRO5xaynbRu0XAV1vSgsYhodDkZLiR/LzUBhiOhtaCDseNPrq2IJ4CqCI7Bqbd2XHL5wh8iZwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw6UkEPR56FwZzmEzzYso86C2A2Q136Q4t+/hT2VArQ4vm5DH1
	y4iBG5qH3PcQ04T5OWG7x3aJcHh9SM2Bx9wDLr4wNWK5BoSAW7bcWCgx
X-Gm-Gg: AYBFou3piVz43lrgy8zI7YeNclnpm4kubcF1Jx+yzzMLIi118+DX6fBdxJScaCuAN0X
	EQgahqAQD1+WbhZTlYy9BVdwkycNhqixffU3YDKgD7NCtrgHnAcUcfesosZmT4vFyXDJwcugmAr
	7onjzs+JD7c5aex2AVcy9PhgUNUMf5csPhjv/zp/IjbbgIftKbOUFNUDbDbVnAyddunTvfJm/rC
	Is085y61AGb5snjr0I51Lj8X9rVexfDpNM+OWkNHMg1ZOxWBhUgqisECF+D4G0gnSOSAEjOr88s
	Uq0XdEuHOyThCIC9VVo5hqhkvoiBN+2PFjT+eUyt4q1R/H+IBjdulUcY5rMkizfHCgLiDdg1xIi
	CXSJiO6v993xPlmXR7oaKHsSGTMy/VFQPw6pnwBqurOZQtZ9qPXSYsxZvpXXisn3y7qkPOlhxLp
	FMV04Ui3B/3/oKZS1eNGPOJjGzzj+K5DDCHWj6FdmLteRdFqQC30pSoc50AZJPU2EpPv8qNvSiH
	mEcR+8AzTEg
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr22517361eec.23.1791975986061;
        Wed, 14 Oct 2026 04:06:26 -0700 (PDT)
Received: from evangelion-g ([103.196.213.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm38221116eec.31.2026.10.14.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:06:23 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: anthony.l.nguyen@intel.com
Cc: przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH] net: intel: ice: Modernize ice_vsi_free() with scope-based guard(mutex)
Date: Wed, 14 Oct 2026 16:35:52 +0530
Message-ID: <20261014110552.56976-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/intel/ice/ice_lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 9e08db376d3d..c695df442822 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -457,7 +457,7 @@ void ice_vsi_free(struct ice_vsi *vsi)
 		return;
 	}
 
-	mutex_lock(&pf->sw_mutex);
+	guard(mutex)(&pf->sw_mutex);
 	/* updates the PF for this cleared VSI */
 
 	pf->vsi[vsi->idx] = NULL;
@@ -466,7 +466,6 @@ void ice_vsi_free(struct ice_vsi *vsi)
 	ice_vsi_free_stats(vsi);
 	ice_vsi_free_arrays(vsi);
 	mutex_destroy(&vsi->xdp_state_lock);
-	mutex_unlock(&pf->sw_mutex);
 	devm_kfree(dev, vsi);
 }
 
-- 
2.53.0

