Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10C4A482F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154793; cv=none; b=nzVatrBFCXMw5Z+2Ex4oISRUimIf8XRzKXc4UiFSvjcFdGLog6VTbObwTbZksMgI941e5RlWFJMEjWf9okh/rMdTdC+LAj+BYEK69dCf7oz+uSI6mFUcOPtb6CSg8mLFaSGLKELkCautlVhG9ntg7q9i3KVMUqZuiCEcDa/l0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154793; c=relaxed/simple;
	bh=EqUiW3/1i63gTVsPujaHZLsN69tXtUZJXoY79QWaqzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uqN9kmtyO1jTf3/mL6w2x4Jf7c+9d1yvb2J/Q1t+eEv7XRjh8PT5eJId/NPR2fdleNU1m2jJfyyWB3EYmo/tKRPuMcdhncL0lh+KytHsTddVCfxi8AnzwEnwesJiWcvAft5pTEmalpMKvT9rWlXmcQxpLhPkDWWcd5MN7BnFzos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIp7KuRW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIp7KuRW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2270310a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154785; x=1792759585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5zj2v/4C3FbTFOf3UZNW27yR4URj0zj3Unt3ZSOPsY=;
        b=SIp7KuRWCJgKaVx3k2wC1ipLZuEvy4x9THNVtmxxGZ5l+KZnTs1aZ5aXkQIP5FYNxw
         2dCvUZH3IOgkWoqE0HGDJNHF95cfpHn/7yX9ZdHFdfuAdp2WJmVnnOOcUFZ6DSnt2ItT
         1oQ8cnHirovTyoRn+pVLnWJHtXA+hMFcMbksfZ9g8OvbJSv7QuLAh3yY8WYziUejuL78
         9IAP9WTr+nLWgyz41gWRc5fVoQWdjPK1PjnHUl/UvTAYyrPAFot7aiLWTalJJdkXTDdT
         FGBI3rKiEmj7PQn+h3m8odxMdFZqLzT8pMVgrEuWPRVvb2OTb2lGp/cRqCeM027wmvKz
         ztWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154785; x=1792759585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5zj2v/4C3FbTFOf3UZNW27yR4URj0zj3Unt3ZSOPsY=;
        b=vaNf0+nFOb9A1q9Lvhf0umCvWqNYxERMlihzkq7IfY8QBXIyUysFsOg4il/+gbQNtT
         PLF1UkegVfpYmmw6L5GOfWzPtCxe+tmiOy8cndhPe1yOP1+kv5ThMbMzoCcFhctBJSHa
         Uef/G/MEoEnxmByOcy8RCN4jCwCQZHHOv6AlwrhA2FTyNBNgtss5P9RapHuqkDZlnp3A
         44CwLALn5FaBtbKBZrLqtVhmEnx/CloJWhYjQII1Q7N4pVA8YDSlDvk3usrL2nmvuN2S
         QFkT1sEWym6a+bboehXhY95YFbBB06s+8Qy3wIap4z3IhXR8EZPj6AtmD6tVHBMrnEPF
         TehA==
X-Forwarded-Encrypted: i=1; AKwUvBxciTEno0bqSRuZ2KNKTT/7SJ9ZrC2pc7uEunUEhsU1NXD05YBQ+pV0vK971mI8sS12xuQgGcdrzOtoVvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgoz19UuLqTpv8OgAg7SZN0c+CofcCmT6Zqt/5WWOteqZdStAr
	4/3Fl8zFF1Gt3z/eWXlZyTWVf6sT8Q2JyyMv1HAd2eKDMF2D6pB/4XMB
X-Gm-Gg: AYBFou3ml54DAFBJYq1E8YcR4lrOpE91BxlI+rrNV3b3cysm3mI5MFLw0APbULCj1m2
	l9OQ4vhPMGRZqO0f92Jw5Ciixaq8X1QA+ArXj47/D4eP5d1FTJJxw6wf8YgOuKl+EfNQpJUVzvG
	SaHHIz65fstr9bUYwjJEuxCLkbPR5IYjaboGQ/0yE554K6/Lf8yKa0bN29/UeemfUqpNoVFKuh/
	NuRlu/3Gb9FJbpsWC601M/K6U1YIMRrljDHUBb1p45CNGwvRzPJ33PZn3GCn5b9gqIhnQgI9XqI
	yvA+hKeCgmvnHqKUt2n8SQQ/RwuEj7etWqooUisYzjW88gHhSlnKVmD52ldG3WxVD7iC6iEMo5F
	VKKN3WhNhBBsVhAhIK6P9QFSEadoqrs8aY3kK02j94nS0kb4T7/ROsIZchA39VMaI9QHkgibLV7
	4gDa3ssX6WkXddV10yDlQnmGT9aDFonssEudW5OklwiRRrTZr6ZuwsTTJETDr3yMFpd4rAjaM7u
	KEoLCF34BmP4A==
X-Received: by 2002:a17:90b:384d:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ac97bc59f6mr5804257a91.14.1792154784685;
        Fri, 16 Oct 2026 05:46:24 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4991b8asm4073508a91.16.2026.10.16.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:24 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: jjohnson@kernel.org
Cc: kvalo@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: replenish the RX buffers reaped without a complete MSDU
Date: Fri, 16 Oct 2026 21:46:20 +0900
Message-ID: <20261016124620.76-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath12k_wifi7_dp_rx_process() returns early when none of the buffers
reaped from the REO destination ring ends an MSDU, for example when
they are all error pushes or continuation buffers whose last part has
not arrived yet. The reaped descriptors are then neither posted back
to the refill ring nor freed, and their skbs leak, so the refill ring
loses those buffers for good.

Replenish the reaped buffers before checking for complete MSDUs, and
free the incomplete ones.

Found by code review while debugging RX stalls on WCN7860.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
WCN7860 runs here with out-of-tree enablement patches. This path did
not trigger in about 105 minutes of TCP soak runs on it, so the fix
comes from reading the code.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..abd262d58a97 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -801,9 +801,6 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 
 	spin_unlock_bh(&srng->lock);
 
-	if (!total_msdu_reaped)
-		goto exit;
-
 	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++) {
 		if (!num_buffs_reaped[device_id])
 			continue;
@@ -816,6 +813,11 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					    num_buffs_reaped[device_id]);
 	}
 
+	if (!total_msdu_reaped) {
+		__skb_queue_purge(&msdu_list);
+		goto exit;
+	}
+
 	ath12k_wifi7_dp_rx_process_received_packets(dp, napi, &msdu_list,
 						    ring_id);
 
