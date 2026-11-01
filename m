Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565449;
	b=KmzzK9hK+lRhP9FRjGWftlYFv8efTyH1phoHUjG+gDveaThnDE01UEKroms05vjeOo+u
	 fegKDmAUZvG3oyoiGnk8ZF1py+235AmzhUd+x5aQKNBy/WqRxZRDYPDBPcze736inETlL
	 kRxgAP2XJlmOVQKGnx/GN/HMUtUCawqmqamLDlN+kCBj14QkMJhZsPWrezXZ2uV1CneN2
	 66GRkU6L9Q4n7kKdJRD8gBKGdsdYjVPoUfVJx6ojka/ExUio2GWEF5FhLs+wy5pEYUcA6
	 Y42YcIRgx9L4mWxWDiCQE8Kr8AJNIRww3iqgh7yG09c+Bw91YrmZKbAb47eq105/7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=;
	b=kzJDGIa3IDlllryO95ZcJm1P2l7nP+rL5hM78c8mNmoXnGJTvyhO+1YPrwVcV2q3HiUe
	 5T2Yi7aq4TsQy59KzHLIBscV556sb+sIoTqx1CqHLOhn3kZecF1jP3WaqguJ01VkILKPt
	 6Ee2VGvqwXReArWpP2uI464k0orD+RaT7yu8rFD/HU7jJnJwG6bOxH873H9GGSayHdTOj
	 cz+7MUE0V4Ezk2FH5/WLQjmEBkxwZJoanWsjV26dq/4uyLKfuOLntjDBz8WVri/s5WDug
	 QpomKi77kt4NRt8ch+7tX7ytr1WSD1u5nFqQ7JKwo3wXSPs2jJm2Bt5M6hAh7kgLnRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnKwNn6j;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33C606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD33C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnKwNn6j
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14193945e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565447; x=1794170247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=;
        b=CnKwNn6jN47bRDMTXDOdq7jK+0lagtIA8r7Zcd6MgWfi4mtSlB/5Hyq+vVshAwOIc+
         79WrED3NipPQvN/bG3aiau5yPNnhHsC8l+81Vaj5F+UcNlmCJkh1OMx6gC5HvbiEij3R
         se6YqJtOcLnNZO+psbBMsL7Wlz3KD/ugRW76ukirJzlLAFWRr33I7Q725Fy5J6aacsFV
         yLx0jx170RCyWdeT7OVT+PB752DRpHPknl4cn8Nqa4jT23H0NTHWqqDrlqV7QjNwlUMd
         pxaBrNyhb9Qm/nG5bfUuB14cIjTEzxUMKprSm4dFLCMhn5sCWIi7KrhRv+JC0dSehbBs
         nnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565447; x=1794170247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=;
        b=dCwYDpBnZfNf/Mnr5AiqqIhSkypzd6alVlOOmJH+6sHCFTAd1XYoxdKd/2cENRaKLZ
         zC6LWNNIoEHO+XJyqFkam8z6Wj6DSIDbxjO+DGcft7Z4oNH9txKFX1bHRRshCVY7O9l6
         PXGOBKKwaV5dqOh57b1LL93TblqJfzJmFQLus3+sgLcDteoVs4CFlUbdqXfc3Wg9Wu5l
         RWRj2e0bbgA0ETte77nqHNXs3fnqO9DSKsxWyNaKf+0oSf1br8/pyqP1QcMx0eodP2aD
         LkM1rjRwn3lXp/qZxnk9+JEXWIL29p0QuU9zEbKYyvBBA9DBUccRW+pY0TN3fH0YXQrW
         qGEQ==
X-Forwarded-Encrypted: i=1; AKwUvByKs2E5sY6qwD6GZOHuZN1POmKR/wr3KsJCyRp4i4+lqmlOaMuOzydZ1Gog8yCw7n63JkJQsS/hiooREbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwomuue+KxvM2Mc5bx+brag8q4B2o8ZIIKrUPQTxfh9igeVsx/
	zEkqIfbI86waiyY1TB5F4lqF2Zt0ns67YoxJZEFDjid6JLrvmTq98rQG
X-Gm-Gg: AYBFou3AVelPZniEq1Ch/w3ZwW3+8IbzEeiN86TXm/vo867P/tcP1cLzoNNzrbpfIy7
	VwVcQY8akXo0Z4DsZgnPphTgjH0y5g8d2v2MLlNfhighz4GVS+ovyQXc1nHKPmVtsamMxoaWee+
	mNTgmk9kmzovq5Xr3ezDFRmPObnt1lmIRyYkU17zRlLTK3HG58oO++9GmSHXpu0kdSK8LKYvTG8
	Fqt1JD23+Bm2XuBhe4qOP/J99ag+RLDUupgDlw6pJpTIMrgu+o/3SxyXjmSG2LIVuG6ZKK8zufh
	fmaEAAD4tawb4UfKS6O3Rs6E8Ba4Fn/+h5vuwmGYee+A0l18UcFWsYE8X+x/PlQ4etUTBi+gzfv
	PT9pZdgkn4RvBPQmReSwM7J/WTvebvH9hSAF5QcpDcsJzlnt3sQoC4WoVh2py5WSABGQbgCpEX0
	nvs4Ck1K0YzbYTIneR01wPCO5I4XGu81KJhpXO3NEUvJfV20w+9WMb8+A6mY7dcPmUom7Df75hu
	UQk8TJZ7vcwgJQG4xsFPC3pmDHPx/a7SSflIYSlHrGmIAuL9flyOY1fs0HBC6E1EZWb1uDsERES
	qAPkPRE93PUdt+JKcpYmcLfoYf8hkwa25Jv3Bn0DnT76tuxIjyhjXfZtt6aeSo6sQonywK5U/Ru
	suA8ku8u1/ew41leLB0V7syFuhpGuneIxIKoi+/ksYysQSPm4zq4YjX3F5vKb3KctGgQhnXYq7C
	MUsZ5MsfviqyA=
X-Received: by 2002:a05:600c:4e90:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4ac17565fafmr196316085e9.13.1793565446973;
        Sun, 01 Nov 2026 12:37:26 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm20369990f8f.53.2026.11.01.12.37.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 12:37:25 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Sun,  1 Nov 2026 21:37:18 +0100
Message-ID: <20261101203718.60679-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
guards a loop that iterates i < num_users over user_stats[], which has
HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
rejects that value, which is off by one.

QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
otherwise parse cleanly. One AP logged the resulting warning 468 times
between 2026-08-17 and 2026-11-01, always with the value 8, and never
logged "Failed to parse tlv":

  HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8

Accept num_users == HTT_PPDU_STATS_MAX_USERS.

Rejecting a message has no functional effect: the PPDU entry stays on
the list, its per-user statistics are applied when it is evicted, and
the only caller ignores the return value. A larger value is therefore
not worth a warning either, so report it at debug level, as done in
"wifi: ath12k: downgrade log level for CE buffer enqueue failure".

Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
Notes for reviewers:

The check guards two loops that can never run. Both are gated on
ppdu_info->tlv_bitmap, frame_type, delay_ba and bar_num_users, and the
first also on the per-user delay_ba; none of these is written anywhere
in ath12k, not since the initial driver (2022). The parser that would
fill them (per-user common TLV, MU-BAR user count) was never ported, so
ath12k_copy_to_delay_stats(), ath12k_copy_to_bar() and the peer's
ppdu_stats_delayba/delayba_flag are unreachable as well.

If you prefer, I have a patch ready that removes the loops, the helpers,
the fields and this check instead (about 90 lines, no functional
change). Keeping them only makes sense if delayed block ack accounting
is going to be implemented. In that case the BAR restore loop also
needs a bound (it iterates bar_num_users over user_stats[] unchecked),
and note that the per-user slot finder only uses
HTT_PPDU_STATS_MAX_USERS - 1 slots.

Compile tested only (W=1).

 drivers/net/wireless/ath/ath12k/dp_htt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..9a409dd44d98 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -487,12 +487,12 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
 		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
-		ath12k_warn(ab,
-			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
-			    ppdu_info->ppdu_stats.common.num_users,
-			    HTT_PPDU_STATS_MAX_USERS);
+		ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
+			   "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
+			   ppdu_info->ppdu_stats.common.num_users,
+			   HTT_PPDU_STATS_MAX_USERS);
 		ret = -EINVAL;
 		goto exit;
 	}

base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
-- 
2.56.0

