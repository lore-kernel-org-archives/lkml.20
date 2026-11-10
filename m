Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346491;
	b=w6RIXF6AgWal2K31L2ep2KCG32qn67yqLS9LX3KyEtQ1cvzgfCMq7Gwptny7SQwPCbvs
	 CshVjAo4/x1FRBhiZMWnSv3O4XPAB5SVwbWCV1qAqej4fUyuzSkgCsWd2U56fiFQBnd23
	 pzViJ+/10l/Hrkar0og/lX5ezv4E7bGaAox2XvI5H8r8BlIUcZvcB9qpdQJ00L/Ptltxo
	 qa7x6NstnKerTZy92ACuo9ZJXrrJ5r9q4Ex3QVWoxNAA5Jq1OQbdBgiSCKzps9uFQSUC3
	 5Rt4nRBw2fyLAIwoZp57n9oRwUmNTUTpoXIOX5rQrBAx6n12EToNEqH1R3z4mGn/m1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
	b=ChvpKOv5ajfQw7lqL79URniR/60BUSUxNwgOJyzhf5Tw9llBMWHkqWe2SSPdoFkUo20D
	 6iEbjvKmJdg0JFC0y4pTMnCYYJW+/g6oijZteh6COj3k9SGN+d+3Pwqn6jP6Ehacfl4EA
	 VMuKyR63Ms55CGx1sTmsImwN2dnIWuyuGasTN/AC1MoWglrxQicZxnWgQK3oN9WFhKGJz
	 SoM8ATA5g1QuI0UX9PtfybrU2WwWomMIweOtdLRfC5XIvVGi1yuBq0am0ZEf0daxg+OhZ
	 d1AgKdpkskq73XmXJ8+LrlDdyFqBG3WGQpslLog/VMG47AnhpGJyD9pl4F3r6JBj71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzWkRBz7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FD606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzWkRBz7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so29287155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346489; x=1794951289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=jzWkRBz7Z8TXM7SyMnfS9c3MJyimsi6L3sBOh1730BnM0zcNLqFMigxC9bRyl9FskN
         /nxo3WFjawFMTw4vTLA9UQHlYc/BlDT1TZSXUDP+bDxbVaMf8Heak2ijEcwkrXC6CY5v
         MO/OV7S6Q0HPSvw6aSWBzqxyq2IYujA1qMe8urFA8d9ZbuwJkGp+GHry9gHqq1gw/nF2
         1yFOYIoSTBV8Vz9XCOQmXPgBAWWKohbSmIzeXqYMlT+sVWw9BO3/DKipElmBeaL5g/2V
         BMsZB8rYDNrsnu6GeTHMiY2H60YuG8gWQQfVYco20FyPZjtlDTTIReI252ifP9iDDBw7
         RlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346489; x=1794951289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=o0VMRdav26gaXA9IOyCy55wzjp1bxAhV20yUafy97dkVoj5+A5K8V1Nyp+HzTT3Mi1
         Vzhbvr0s3R8EB5ZZNEgoD2Wrx6c2LV3cCItmNaYUXipIyA4DQRFosPFMuUAXA0AlF8gW
         7kbgN63ROKeAi8M63sE4QVD59MN9sG8FHM0Bm10EZ9Pflb7es5ZZ/WG7BlvQ7AeVa8er
         z7G/3RqEH10k+/aEKt0CWoOZZclzilUSSBFwiof5pAfbuXKRbyRKOZfAyoQhOVLxO+nD
         2LBn9CTetoSTkRSm+G3HLCt9hS2+G08SYpPq8im3lqpbz+a016c3FJAkiUPuEt79CxJc
         Icvw==
X-Forwarded-Encrypted: i=1; AL+hErHPjBu8+UuRdvR4IGae/4niLCFhfVpjOEXnCwfA5iYuWJrFXNhbHkM49pr34T72Bm+8jxJNzhDj/pdpXM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uGrmLx8KkztjxFVPbpXNXxPy7zAoPymvS9RlR3sZXPjcOFZ7a
	4Df/Bl0bayLie5frPJLN4o2e6N84TSsV9EAvqvGSeYzdcYBIrmI33R4o
X-Gm-Gg: AYBFou1A110MO16dLNL+UxHJbhqVg5R2jpojaQG7MJjKN9Dst56NNT8FmTeNCn1RREh
	RyOANY1LE2pZC/MMWbDIjtvZ+rUroRSN3dkt4CW+TRNg3GgJAUKiOnonqEZKmDAWnAi3iWPudzK
	ytPrVBy03s1wQiirP4QPW8fuiIUwKXsgq7nX46OZegOxWz/UCNu2ZJBZOIbf2//N3DdFHV25syj
	DIQDo7gR4yhoBvxWqQl9wFVwI2FMW4l5zGzu475rqd94get4B0dBZ0uhbKohqelThsLVmmddoPZ
	F7XsI7HJ+JJbwRXZU3Iu22TqJMxy5vNDxeh8H5evLFXTx3bQ3LthgvwxBJb2/VcdyDmhWIk5+5y
	aOY98rC14ocm2NxzGvkQzfYB74Hf6YApZu6N+lD+0GLzrsowCtvNjjwLxBLjfVWJm97KmXCx+4a
	NIAsfN23ech3+nHDcd6KVoC56+XYyvmRJD5tB4JzSVOGPbmvPr5HNCy0IC43GpfuUgtGWHIbp9Y
	zWbC+oKduCiII4EJ1ALy9rATyl2D+Osr+TmF6ousi93KnbB31Ile+GdSC/Ptqgz/v0qvo91HWzx
	c2+VMbU5leI1S3+bj4bkXKA4wX1xT/leL3zoVFgql4UtErWF5EYJ78Da
X-Received: by 2002:a05:600d:82e3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ba093953c6mr5795205e9.25.1794346489304;
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef1d0sm87113475e9.13.2026.11.10.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] wifi: ath12k: report an aborted scan before cancel_hw_scan returns
Date: Tue, 10 Nov 2026 23:34:38 +0200
Message-ID: <20261110213438.342-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

Suspending while a hardware scan is running makes mac80211 warn on
resume:

  phy0: resume with hardware scan still in progress
  WARNING: net/mac80211/ieee80211_i.h:2444 at ieee80211_resume+0x60/0x6c [mac80211]
  Call trace:
   ieee80211_resume+0x60/0x6c [mac80211] (P)
   wiphy_resume+0x84/0xdc [cfg80211]
   dpm_run_callback+0x40/0x124
   device_resume+0x154/0x1f8

__ieee80211_suspend() cancels the scan with ieee80211_scan_cancel(),
which for a hardware scan only calls the cancel_hw_scan() callback and
leaves it to the driver to call ieee80211_scan_completed().
ath12k_mac_op_cancel_hw_scan() waits for the firmware to stop the scan,
but ieee80211_scan_completed() is called from scan.vdev_clean_wk. That
is a wiphy work, and wiphy_suspend() has already run the pending wiphy
works before calling into mac80211, so the work only runs after the
resume and mac80211 finds the scan neither completed nor aborted.

Flush the work in ath12k_mac_op_cancel_hw_scan(), as
ath12k_mac_op_cancel_remain_on_channel() already does.

Tested-on: WCN7850 hw2.0 PCI WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153

Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Reproduced with "iw dev wlp1s0 scan trigger" followed 0.3 s, 1 s and
2.5 s later by "rtcwake -m freeze -s 20" on a OnePlus Pad 3 (SM8750,
WCN7880 hw2.0), associated to an AP:

  without the patch    3/3 suspends warn
  with the patch       0/3

After the runs with the patch the interface is still associated and a
new scan returns results.

I tested on a 7.3-rc5 based tree with out-of-tree patches for this
device. The function is the same in ath-next; I applied the patch there
but did not build or run that tree.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b7..d4c1f7cd7040 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5875,6 +5875,7 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 		ath12k_scan_abort(ar);
 
 		cancel_delayed_work_sync(&ar->scan.timeout);
+		wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
 	}
 }
 EXPORT_SYMBOL(ath12k_mac_op_cancel_hw_scan);

base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.43.0

