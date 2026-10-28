Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197199;
	b=MVlMXVs80ZtU6GWXCetywo2Z05DelK/nQad9BG+dzumZw7fz3Br3RrGFtCUCjGQd9TIf
	 mcdv+TnoDUXUI/nBuuPK5x02Mh7CaKB2eX+o3vkMHLRwZBr2LWipYmNXk0+NLhdNFVz6e
	 LAz4qDrZWwZWruuIr3xaAYvSPTeIKqSD4hxJMGBiu5t4iJgdMZ1ewELfLUTy2pspfmIUy
	 OHG9QYYKrWYfdmNxdtuyTSp64TPaUhH7CVXsN6RM06qyJY6Ax8poGOKC7iRrAcI+8FAS1
	 JJ8Ei2IKqI4k0fhVuKgkUWTGF6lsiK/6gYkZ/in+rUJTm5pGzSOefirv+945PgxHV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=66KvjC7o9TYJVmk4sgr3wFJ9czeGpidCIDPzYdjOH+U=;
	b=OuqO4Xl2bOEv5u0jwTkaRBZLWVfRJ4G4zJMenDfEyEMIOA6Kb5EcVUYiGMj+MTYqQ4Bu
	 LMkjfKCALEW078fQU0kAjsauMyekrwwNOTe5b3jo5K0z2Oazf5/V3Iu3EyGYkx705X+Rr
	 5Gwv9EIaUcka4cfMXZQZPzmJUEuqX7VrfpGhNOiDlzHAsedHX7oIP2mejxSU0B8MDyKWH
	 UeCFzioWVtQ3DJKsPetKiX7wo4oTGEV5IVrDkrcd0rewygb5ZoOQC2ia2SSnfJroXurCU
	 UTszNJBsbVEPLX0Z8XxO95McupjPVNqX1dJ1tXHGZ2n0TNkJkdLSgpRe0hQua3YL7ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peCWJaLY;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AE606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0AE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peCWJaLY
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so851577a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197199; x=1793801999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66KvjC7o9TYJVmk4sgr3wFJ9czeGpidCIDPzYdjOH+U=;
        b=peCWJaLYkOWLaEP6XA9dqQ39bpY31PQXgMA9w6j96UyOMBTw1LPEDgGfTcj4Y0CieM
         9IUt6G1CLYh755RA47HELiwSG4SVtmqf3taQBQVIy3JEiSDo+dQ+VykLg3sVy5MGt3f0
         SIVTnRm1avW0IuFhxWilD8khuW1A/Fu3+x7TEZ0SdCsA97iK/O+GXTC9GiztqB3qYpbc
         0J6vumpZX5jN/i6X3DBPRyPIoU1E2SM+bWo/2ODUNSOMoTpugjqxrnQo9Cw3Yc4oenXl
         oG6fK0v9sWEBGa02TnL4OmiJC8BarEN6ZgcKS2akv0RwCfL2ywYyF3eh70VumnHe+EXv
         VClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197199; x=1793801999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=66KvjC7o9TYJVmk4sgr3wFJ9czeGpidCIDPzYdjOH+U=;
        b=xnJhwk9Vw0IJpKy9IGc/Jo4qDIk+WAiDbtLD/gxdD9eptRtv584++XZUcuqIXixgmi
         9ao3x8qhnq9HMx9esQSLdeZA6rxHG6KOpaGj9ks1ei0gh18g3zcZjtWj+LojhRDZbRHh
         zz9PFtXysmqVzfijnZVhD7Mb+kEwWDAY1qUTuQ3AZ9RJJ15rZFPm4Ad5+IqT1+PFhYr8
         AaGoehjYdYWd9YE2t2w6XhYzT1Lb+B9pyQfsf9arBWs65tVwBiuiCKXnovRH2yopb2gQ
         7rHHy2T3I5//7i/bO3nMeml7UWKW2Ld87337kVY0Bt9rhapLP/l8Z6RrZlZ+d43koop2
         YbIg==
X-Forwarded-Encrypted: i=1; AKwUvBybeJJIabc/Glj/2Sth96NPgNq/tFiQXNI6To2nUwXnEkWWTCQZUGXeFjQT+Dk48dub59U1I0ZihPuxjj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL893TjvyeG0zOHhi1IYQMtzHW9OkpmGGGWGokZj8f+z0a80Imb
	o0n3O8RvlD1ldhT5tuiU+xB68pl/4ojQu35kukKsXNsi2Kf80KZg8FoA
X-Gm-Gg: AYBFou1ZG0YJmoEW2mx3gASw9DJ9AfT1YJMKe4vk7U5A1rq82CTy7sBcjxZNrxqlTdD
	0WptrwuAvqzhnYBVTNyzucXpCJdnDukajIor7Z9TLWcL0+4GbXeoKZtFZol0AATYTu3cRMdQQFI
	iM6AVe52RhVctGVUCS9PJO3onDbZb9/QN9crfOhlNUH5eGhdtIqILoWmfEXnOttt8qOxqp1DkCS
	5bWvgrOQbVqZWySgCd4ACMql/bZTidKUuYZzAoMcw53G6ysYVLlHHq2zW44VNxRBPU0t6XSneNU
	m3qz1mxpYERUFCxeZi2Yz8kyRXwSxRwNN2fs11lcdLqC5TsqewM88fR4mCaGp5CeUItyMKRS+oE
	/Bb0eDdWIBjxkIwq3vKGhn2Q3maT+7C/Luj0hVvw7cXLeGghylrrXzkR3OAfISzabchnia2J3kF
	MlQ6YhHn5SooWNMLHGn/sFS5udD3uuJDbZkh7pgz6ymezS+BF9XcO+vFfFn+h8N22DRrfovj1b0
	YJpp0CQmS6k4C84CN/RJXg680ZmKFOoL5AiC/uTchR0HYAnEfUBpnp9UYVYciWV4cB/UmSXkZGX
	pFNNfJ3Rh72b2/qvX8LZhDbowjKlkjOB5p8NkSF5nF4aoC8vtAyowLK8oUU9YgatuPev
X-Received: by 2002:a17:90b:1d44:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae57f638cbmr1762004a91.20.1793197198315;
        Wed, 28 Oct 2026 07:19:58 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f286fsm3290141a91.15.2026.10.28.07.19.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:19:57 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Marek Vasut <marex@nabladev.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] wifi: rsi: initialize background scan completion data
Date: Wed, 28 Oct 2026 22:19:25 +0800
Message-ID: <20261028141927.9306-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141927.9306-1-enderaoelyther@gmail.com>
References: <20261028141927.9306-1-enderaoelyther@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Background scan completion can expose uninitialized timestamp and BSSID
fields to userspace, while cancellation is reported as a successful scan.

Both completion paths allocate cfg80211_scan_info on the stack but set
only aborted. mac80211 copies the other fields, and nl80211 can emit the
14 uninitialized bytes when the stack value interpreted as TSF is nonzero.

Zero-initialize the result and mark cancellation aborted.

LLM assistance was used to find the bug and review.

Fixes: 7fdcb8e12660 ("rsi: add support for hardware scan offload")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: W=1 module builds with MODPOST passed with CONFIG_RSI_COEX
enabled and disabled. Not reproduced; RS9113/RS9116 hardware was
unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 5 +++--
 drivers/net/wireless/rsi/rsi_91x_mgmt.c     | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 3faf2235728b..27bfdb6affaf 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -276,7 +276,9 @@ static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
 {
 	struct rsi_hw *adapter = hw->priv;
 	struct rsi_common *common = adapter->priv;
-	struct cfg80211_scan_info info;
+	struct cfg80211_scan_info info = {
+		.aborted = true,
+	};
 
 	rsi_dbg(INFO_ZONE, "***** Hardware scan stop *****\n");
 	mutex_lock(&common->mutex);
@@ -284,7 +286,6 @@ static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
 	if (common->bgscan_en) {
 		if (!rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
 			common->bgscan_en = false;
-		info.aborted = false;
 		ieee80211_scan_completed(adapter->hw, &info);
 		rsi_dbg(INFO_ZONE, "Back ground scan cancelled\n");
 	}
diff --git a/drivers/net/wireless/rsi/rsi_91x_mgmt.c b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
index d9dcbb255317..9ceb6cba3546 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mgmt.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
@@ -2107,11 +2107,10 @@ static int rsi_handle_ta_confirm_type(struct rsi_common *common,
 	case BG_SCAN_PROBE_REQ:
 		rsi_dbg(INFO_ZONE, "BG scan complete event\n");
 		if (common->bgscan_en) {
-			struct cfg80211_scan_info info;
+			struct cfg80211_scan_info info = {};
 
 			if (!rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
 				common->bgscan_en = 0;
-			info.aborted = false;
 			ieee80211_scan_completed(adapter->hw, &info);
 		}
 		rsi_dbg(INFO_ZONE, "Background scan completed\n");
-- 
2.56.0

