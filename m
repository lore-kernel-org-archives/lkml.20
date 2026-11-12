Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501987;
	b=DwcdV2WTSBmIIuCO4Q6TahWJolpmR8NVj+cs2tXR2pUetLGFpFTTETm3tVnab4iOYfXA
	 DxBOnnLKj0w5y2dKjCdAzcRP7/GGFQZrxJvlVXszCTnubUyAIbrGkqHZI8O3D5c0moXtT
	 coOGGpH3RCO/dR5GH/b1XTvJOm8uTpaaMacrL5UzI1gbewC9tcUtojWtxrhJ7u1zfJkPh
	 9LP5xUl13c42mnjCYTt+PL57JVo3gpCQAXxr778iYTrn8j/90NrjzwKr3oj6RAzXcU7hf
	 u1BBjl0RbUiqdmr1FdDdwRqqiCHtglVm0CQinJEnrBC4GqNP8dvxLqZpwanqWfZqHaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
	b=sv2q50JgCICJxp6c64LI/XzxbAqLuQVvUZl2PUTTdTP6APKjDiETnwIFsHHZN8EQdSGW
	 soPLA6WJfQ348kX96L5GaCUVsCkH/wkzkxCisxeqyOZqzU5dPcEMnTlTZmDFkXzA+ImwN
	 9oKpRyscFRl5hyeR6HfeHdL0ksXWSDYGPvlFPuGRpScv39W7dHRGoCNaoRMrdbjjFb/fB
	 S3ZsSLUmLIiE1/2/rrYdpgnkwXOgFUbVCv9gkLfc+nVxiV3TGhQ8Gy2IIs5DsCmsOMkWf
	 IOCY8D/KFQIqDe4FX0RXUFeFCWUgHvAXo05xywVX01Jl2lHTKDKOieFbrFiLGm4yH1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGl4awbP;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC99606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC99606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGl4awbP
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so8742650c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501986; x=1795106786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
        b=NGl4awbP4cxTosV01JpmMZ2pxoPvY5ylLrYz3BD5sEVHfMIFQ2Rb20viJfa1dIzRRL
         wRzxqhp+BHSMriiljAKqlRwAlia14qtse9bPlXOZU/h1QVtONNgPy6mwzRfU3yzJn65A
         KfYVYpOcCP7IvaU/eQrBC+diaYAp6i2KiSEA/7biVeQ7U4g/+jb4A1TH0jgpfNP6q9gY
         mqSbUCVQr2FTFPi0yR1OtcwaBxDsMMtDYyyMw9LKwyne9faB3GfO299ztGIkPKM3wYqO
         J4Wg6bsjrfqUM3RyH8bAvto+YnjT7Hp2tY4I9/wEOdVp44aO3mAEGD8cK1UxseBHXneZ
         Qhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501986; x=1795106786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
        b=mFwYAfKCnajLZo0+YCLkeYwnO6lHxauCV8ktzIdNObENNJdVZtaowBAjkRHC3P1S0/
         TiorDyQmxcxGtS4d5oR6Pog7dmaT6jKEaSigrs1YxfHZL3lKLTGOKk+C4FuEDOLw6w/+
         mBIPrYzAmxRcLjbJkOwEPdVrTd48O1pdKhyEuuFY3jLPFN83nREePozVRavIK6Y2GPau
         mKKOeh9yd0ZrH1k4NaTyJpmJXW//OrfN4n8RAQ39qYowJch+mpl3s2JuXHdNDVr9cjr0
         k49PB3kHHOIQUetQWRJ7aQ/PcS4rwlgcpKB883l8ojopWB6pJ4pPwDaWLe8uICoQhfYQ
         LkAA==
X-Forwarded-Encrypted: i=1; AL+hErFZjpqpGJvhj5+QFRBtpjm6+MLEIpxLqSCEaBuaqbAwyPezHcdOdIRTXwoGjQAIP/fDnGnFxeeJvZf9V6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hJ8R5UapK13puYuEj5k3Xrq9P1e0SYMW4d+skmGCBYDY/GukQ
	mK2uChAqdUXxtcx7MvhRoY+qx1eAz3f9/UxK2p7SCJhdVBZXHfi2oZrm
X-Gm-Gg: AYBFou2VVdtWppm9s0ICmode2lVC0XFCj97ZVzeTGvAyLXBWaN2Mn5nIelmigq56sWe
	ULwCtjWoe81rOSDBo53f56TsuxMUhWvBF7LF8S97rNspKkRkPMvi/AFjZCE3hcZj5fDpZnBcHsI
	1rwsNpjxXm1AN4PSO36j5Cy01/mAEn+e5G3DvzkI1UnjkktNYENzOFFvbO55w9xUpokxRqEWioj
	ns/+F8ntO6bZBhbr7FamtepbuqzXxZhvyqyo7R1X0SV04MSYiQAIKVT3KykA1jvZCmJumVWXnKS
	YBB6e8G9+zUKEkKb7MvsS/HUlz0qex+1iZazCx0stbqMMgAQAWzrdXVQjq1ixKr2LHvNnnlqyQj
	xquUzYXdohCTxZgfTf7EsRUrjY1J5jm3IZFK0nrxxulMwU3jJNqt/R64vkAPCn+7CGLrFHclW9Y
	FfKU+2YODqfhZL4hy1KsiKZS80l4Y5y755aQG6zrmIrHk5TP3XzMpMnlRQl1hSILGMjc3dGwBR3
	Da4u6m673iphtzG+4izYD5RrHiBKAfxS9aSvmtR3KwxpA6zQKclAoEvf4CyQ1Xb29kid6LsdAbe
	Rv63nldINtN21NY6tEjacTzUGdcuQSpobNJqj/LHBnQY//Wi45TbXwgaIdhBckobJ3NLSsM1xDp
	45pPnfbC/PBBMLWJ+bmYoFUK/tUaUyn22o/u1MFOATTXB
X-Received: by 2002:a05:7022:3b81:b0:1b2:610b:878 with SMTP id a92af1059eb24-1b50306917dmr113343c88.6.1794501986126;
        Thu, 12 Nov 2026 08:46:26 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:25 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 4/7] wifi: rt2800: don't report an A-MPDU length to minstrel_ht
Date: Fri, 13 Nov 2026 00:45:38 +0800
Message-ID: <20261112164544.3176458-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

Set IEEE80211_HW_TX_STATUS_NO_AMPDU_LEN, which was added for drivers
that can't report the proper AMPDU length and record this workaround
below the TODO comment.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 1 +
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 3be4f4cbde..269d621f51 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11837,6 +11837,7 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, PS_NULLFUNC_STACK);
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
+	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 7c03fd07bc..baf5d039bc 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -374,6 +374,8 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 	 * by the hw we could provide the real ampdu_len to mac80211
 	 * which would allow the rc algorithm to better decide on
 	 * which rates are suitable.
+	 *
+	 * Currently, we work around this by setting TX_STATUS_NO_AMPDU_LEN.
 	 */
 	if (test_bit(TXDONE_AMPDU, &txdesc->flags) ||
 	    tx_info->flags & IEEE80211_TX_CTL_AMPDU) {
-- 
2.53.0

