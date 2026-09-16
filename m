Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59A3D7D6C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588173; cv=none; b=DlQd35oKI/u7ybgvYTw/bIfz8RODSAQpvduaN66012aLc68bI7S9+OS271Fb+07OaltuN2C65EnsS+9NETE9jiwcAudwQtt79KDF5o6WCJ62e/E6/h6nppmLyfshCHkHepzLZ8rjki3Z4asYeb09zh4VCEaqRtmBAATwrDJtdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588173; c=relaxed/simple;
	bh=3ugyrwjt508oa5YRjzpIkbzxhNbpUCqRAwbyo9XjILY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwEI5Jc6bPZwhJS9wZ+SEVEuhvjE8LWma7qLJLnAN/9aEm3adOqphw2eouDICvTHkxqTMxFh4AnkfmuGnc+NxsjZK+orjZTLTi/8qYFQS/FGvEIOC5qNAQfapm4JnuFQW8Qj8rgNY2DsOhbEtOezJfbPqek6nQQNc3DwTeOwEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnRPfFPO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnRPfFPO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so654915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588151; x=1790192951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=NnRPfFPOsiLZueP4WJr5IUxvA1jxJ+aN5sDDInecTjoluHiw22WSCpAmOrSQXL1kEV
         hP+Nve1vAn3fdmcLLDfJu3vCbSBBkXJT5uxSnMVfQc4Mvw/gMq7zFqb1yhVPg6P0mMCZ
         zhnnsj3lUtpI5Ruj/R7gAmPJF9Ru9n5HenzgN/vGSyYS4r4E/v3iWv1EBXLn4m5hou9o
         aKzBexLXq/X+GvpHKnOLmeqZiLabPQ7+qDHakGaht30PxtkSsk1oEiBIB/ubeXt2zOgz
         Tyy1ugnNmPnadTu5UatWTYac10em9oNCcLa5AUzpNjJ3kNkWBNZAK3ENdPzLnS8UxLlr
         Q6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588151; x=1790192951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=AxPCINS0Imv5ANKZyd6cJ8Ektl+YbU+uiK0iabf8ei3PPXPaT8VGlZ9/bRODryTBaZ
         3TFXuvNOvjr4lML779d3/40z8MTB0RrX2/baMRXz93tx9RCRfVpz5fs+MMJ++C4OSrxa
         L1jAq51ISjLXqZWNRYB1Kh1pwBxi9sQw+kvbmLKmEziY3tvfCan1kg2G225DjdwpW9PQ
         vwmt3aWisCFg5Cd6E6t8rjgjj2aQAoGHbyqu9nmpbLt6iFquWe8/WLojAGSwCOMM86wx
         rDLpqf8SQS0fUuZp3iH8GXfuNcTjjRNKvZEMfNSfeIzgZe+TE64vFGFzxKJKk8V9PfAR
         kpBg==
X-Forwarded-Encrypted: i=1; AKwUvBwWtPE6z81q0wt0brpf22SJCw6QX0u9DqmbbKrbCOMTg5T7+O9ehQCVkiXNFBGupHNQsumH55XxQ0cVt2g=@vger.kernel.org
X-Gm-Message-State: AFuF++mIVOn/dTopMjhR2jzPHyOkDkG7I0OCLnhaHA3r+cZGFXN8a22U
	R7o2weGZpMYZ1pn1JCQ1xF3yAwmrU9eZnQ/3J1z/WRpaRCOXKolimYw=
X-Gm-Gg: AYBFou1QdRIM84wo8ATBNprLjK9f2UYvX0QryyuyRfdQ7MTqzBO5ajt7hHlS1pW2tWA
	nwn45pXIaZeERSJ+LiHFxctzknW43DnUyS9DYttUYX5Xp2n+k8ZLB6TCVM3q8ZULBRXBQ42kCk1
	JXUhb8Ia0A6oVQjuHcjffkH/mKMijLPtJfa6xG9XRLs9MdEGAgU8rkOi71SVUFEqcXBUH2u1R3K
	b3G2H73pGmRIC3Mg5j3GKFRz0wq6JDQr8bd+TXVh+eNfesBLHSfeic//mmohsEOsxAcSSoQ8cpT
	2uJCWT1AtdjYOrvWnf95Kk2Vvyj/j3OS5yGlNivaMyUHYZ2YayrlBoN4NgWZIVrWX0Ou+bcvF1F
	+/Km+57/GYc1K0cyzaiF2QpqDwkFCkQ+npjJak8K9KhCUXHkYNV1DSBmo1fMsJfIQhWIL4kpe+X
	24zJAxDipue9ZgzJE4IGdr9DpdvZYFb1RrC1xx2EtrDggWW0wkvqI+Vpoasq16umvWCqsQxzrm+
	KC/fvXzMqQhlbFsvKL3mKzOuBN59rqIWCKM1cx5tNqMnx+TgcIdmUUZKlxe2Q==
X-Received: by 2002:a05:600c:621a:b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49eac463a00mr43701435e9.1.1789588150982;
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c461sm1682895e9.4.2026.09.16.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Andrea Pesaresi <andreapesaresi82@gmail.com>,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: initialize tx_info band for 802.3 offload
Date: Wed, 16 Sep 2026 21:44:12 +0200
Message-ID: <20260916194647.1421848-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The failure was first observed in normal use on a GL.iNet GL-MT6000
(MT7986). An iPhone using FT roamed between the 2.4 and 5 GHz BSSes
while generating traffic, then lost connectivity and the router
rebooted. The ramoops record from that reboot shows:

  Unable to handle kernel read from unreadable memory at virtual
  address 0000000000000010
  CPU: 1 PID: 1419 Comm: mt76-tx phy0
  Hardware name: GL.iNet GL-MT6000 (DT)
  pc : rcname_read+0x1ec/0x340 [mac80211]
  lr : ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
  Call trace:
   rcname_read+0x1ec/0x340 [mac80211]
   ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
   __mt76_tx_complete_skb+0x6bc/0x9a8 [mt76]
   mt76_tx_worker+0xb8/0x1f0 [mt76]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

ieee80211_8023_xmit() clears tx_info before queueing a frame for
hardware encapsulation and does not initialize info->band. This is
normally harmless because mt7915 uses the firmware rate stored in
wcid->tx_info.

During AP-side FT roaming, the WCID rate information can be unset
while an 802.3 skb remains queued. mt76 then falls back to
ieee80211_get_tx_rates() with band 0. On the 5 GHz PHY,
wiphy->bands[NL80211_BAND_2GHZ] is NULL, leading to a NULL pointer
dereference in rate control and a kernel panic.

Set info->band from the resolved PHY while dequeuing hardware-
encapsulated frames. The dequeue caller has already selected the PHY
using wcid->phy_idx.

Temporary diagnostic instrumentation and a same-MAC dual-radio FT
stress test with continuous traffic reproduced the invalid state twice
in 300 cycles on MT7981. Both cases had info->band=0, PHY band 1,
tx_info=0 and HW 802.11 encapsulation enabled.

With this fix applied, three independent 300-cycle runs completed on
MT7981 and MT7986 (900 cycles in total) without a router disconnect,
kernel warning or crash. Continued testing with the original iPhone
also exercised repeated FT roaming without recurrence.

Fixes: 55f7c9b02790 ("mt76: mt7915: add 802.11 encap offload support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e4..a168851959 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -406,6 +406,8 @@ mt76_txq_dequeue(struct mt76_phy *phy, struct mt76_txq *mtxq)
 
 	info = IEEE80211_SKB_CB(skb);
 	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->band_idx);
+	if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
+		info->band = phy->chandef.chan->band;
 
 	return skb;
 }

base-commit: 1eeca1d5e0920fbdad6449768fd2d4364e714180
-- 
2.43.0

