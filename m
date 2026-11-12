Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481351;
	b=NuloDDbbWV5PhMumht1z7Qja4rgqeY7J9YAOEDEsiJ8HvUmB+nhvTZKMK/BFXw/O9qqd
	 Y9M9pQRnZ1ix/xlvKcaziRSMSG11Ogdvn8h3cfurgrORKB089wvkGMx0cbY2BcIqVwXZE
	 kVqEiXTUem6lDsosJ7LcIFegM/NTeBjZwzUxlU//k+m1q9K3RYUeBAx+V43jBL+8xESPv
	 pThYXlQLmhZlVZnB8N2aVweh1pWCCblHqNy+gk3KaWAFw/jS3C+X22KxXQ7KgbUB6SZuN
	 1sNM7yXIHnwtGw3nCxqfBSbUJbvok6iiZhh/aH5RmIbfj/EP7doKTX6tZTS7R3jAJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
	b=jyVGK0ZbPXjojFqT4P9Pjt1Skcxf3AxnhhvGkMLq5Exw1DYWYRnvkAoEVBxQDRfP1bpF
	 647GIcqGuGd7mJC+83YoKkaYOnSdjPtKgMowblIEtf11KslTjQ6wH8quDbn62+2NnFy6O
	 40FpAZ4uPoUPLJzbDEVS9eGKaJZzOt/nF0LHJ1RU1xD9McOWSu3do+v+YmPdXoFyfmOTg
	 KFgct36JokNcYlNPWnhBTs10NAkcFFPye+u932fRWdMUPc/sLznxXpzNiE9EZ58zr1UUU
	 6d/I42J0BtdRxWoQvMhqOBTt+izs9NR2AjtSGRbnbwMKsdfggcejwgsoouXlykjyeJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbRO14aS;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbRO14aS
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so2509927e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481350; x=1795086150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=SbRO14aSK6eZS9sG5FXUufqZjezzaI7Rb1FyXGAN4dErqCNWwUuCu3100k81EHwgLZ
         dshwHFXRk8rBcC7e5P5iCapwvFNkN/DW2p9s+VufKLiKyPyHspKqx3nKoRfj0v40cFSl
         b/LiqfYDlhgHwg1xZ6c8/wFhB0HMsxZX0lixpthDMq73HjTKiEEcjG2uwGZWmuWddrXi
         vAh9jR3w304oITQxoXiBSUTIKiOZ8AGiZrAnf4ygHlpal9XQ/HiJ0Lt7HiXFLyDEQq8d
         IFadt2delMv3+shh1PKQ6OJ+MK5U7vYcwqQtpe7MAIP4i2iwC92Sg+6R6WpIrm84/6ZJ
         9e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481350; x=1795086150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=eZPUXE9XDGi9fyyEC3zFMtV8H57OVZ9hO4LsMbBi0N8PW3K1ZtigxrUX6RR1aEjuTW
         0GjgJ5INqybwCTKWy+bbhOGKJyqDY1utZQB+7aq4pugfUSzJL4Kz6eOsAPQSlKAwWB1u
         hxcKBgSzh0s4PUlIsZVLGPQhiVtUydZzJwJ8Mj2OmiaJeOjx5/RMknuoyU8dmXW+xOM0
         PiPc1GbmKDnMAJ0ueqoTamezL2S+8mUnQ2Dm17r5H3A4dghOXO0/q/VR9f1w0Mlpm5T4
         9jAyweqGaXFSE4MigDdBAlu/9f/Fy/efWMMDixi2uqhzzhJJD7N053MhHbAZ9Mo8YexJ
         HHdg==
X-Forwarded-Encrypted: i=1; AL+hErEVl4nis6yuReWmaA/XbxkMIqcKGJLfpwAD5mWmsmDMn7SpEPLgg638kH8O9+13hMTQYa1ZnRxYGSRRqTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SBwnhaDURHuy+V4o5QjLF+RBvseFzt7I1lhatzcQHcpy3DLuf
	0579neDlWPSRr3tCWQLEgPzYTQua+wCn8oKBVFt3ypG5GTkemCJbvmcqHPrZnWSN
X-Gm-Gg: AYBFou1P927HkyjOi5+wQGpEjLEcwWqkCEL7McM5nNsQT8+M1ZZ8H0g0GKMpsYNT0yr
	omuQm3J7XTCPiG9c3nQEjkgcU2rrkRBDmkfS9o6Rlgw7G//wdoRR8hC1VSftKEXR3yNidVLOrWW
	dXk+2s6Vwut8HEOaAvRnIxwK8XwJ2qEPaH53ihK1Xu+XRiVtvcIZjoZK3uO+9wZHM61jHEzGCv2
	6N8kHx2sCZV47fqZqdbtODLjZ0TnTXWbc21S6U1ZDn6HdVs9bJnZiluaXfIaSj62JFZAWjeQiiw
	w11bpLXq/Q+nY9Y77/OFE3Kq3ZUjyxUqMUXi7ivYIoN4IKEXXU6BazUvnrZ7kH/gbmfj+QNvgvx
	g7mN0ZCxLAuJr3pZSYUaiiAbhQdQX5t04YKoqmpe1eqvkIDFLXiKvs+RAiixMR75r1oMoUmA8z4
	pgMcsRJutpf+ExF4F3v0kl4Q1NAgJBlghj6FkVs9Ll7rjpNLqdzazXFIqmOxqiuOme9+avCDdN7
	UEECKdfxjbafl+KHj0FK2za2f150WDTV7DJ62px4XxEdA+utiVre5JoIDZmdehUf4wOOER4Ne66
	T50CDFWB3ioA8hCaz58S1pK7Vy5iQzdC3OiBzExXE17zTopO1DKORXDO
X-Received: by 2002:a05:6512:3e27:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c15d601ad7mr2222508e87.61.1794481349384;
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm15814046f8f.25.2026.11.12.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] wifi: ath12k: skip the links without a radio when a scan fails
Date: Thu, 12 Nov 2026 13:00:08 +0200
Message-ID: <20261112110008.1229-5-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_mac_vdev_create() clears arvif->ar when the vdev creation fails,
and the link stays in ahvif->links_map. When a scan fails after that,
ath12k_mac_op_hw_scan() walks all the links of the vif to clean up and
dereferences the NULL radio:

  ath12k_wifi7_pci 0000:01:00.0: failed to create WMI vdev 1: -108
  ath12k_wifi7_pci 0000:01:00.0: failed to create vdev 00:03:7f:12:34:56 ret -108
  Unable to handle kernel paging request at virtual address 0000000000001508
  pc : ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k]
  Call trace:
   ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k] (P)
   __ieee80211_start_scan+0x4e8/0x6e0 [mac80211]
   ieee80211_request_scan+0x10/0x1c [mac80211]
   ieee80211_scan+0x98/0x14c [mac80211]
   cfg80211_scan+0x50/0x1f4 [cfg80211]
   nl80211_trigger_scan+0x694/0x6cc [cfg80211]

This happens when the firmware crashes a second time while mac80211 is
reconfiguring the device after a first crash: the WMI commands fail
with -ESHUTDOWN, and so do the vdev creation of the station link and
the scan that wpa_supplicant requests next. The oops leaves the wiphy
mutex locked, and everything that needs it hangs.

Such a link has neither a scan to stop nor a vdev to remove.

Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..49cb9bd8dda1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5889,6 +5889,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				continue;
 
 			ar = arvif->ar;
+			if (!ar)
+				continue;
+
 			if (ar->scan.arvif == arvif) {
 				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 				spin_lock_bh(&ar->data_lock);
-- 
2.43.0

