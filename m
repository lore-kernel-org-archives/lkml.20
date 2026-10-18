Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94B4DAFA5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357325; cv=none; b=hyDtKxbUPDWAQ7/9dVXcNG8GR3KqvBMoqZ5k7YBBOwHfmPyS+kWNDjYnwHS+FRW8B4mhYUirUWZHMVfy75qKzVeb+psal6ZfLpO3vZLSCNuZwsYw+25KeMOu1xxrYwXYNEFTYmeNektMMo0cJ/HqJlSXBYlDBGikmgebBN1LyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357325; c=relaxed/simple;
	bh=/5uEmTAHQeYG22B/LqD3mCwkrCmdpDciJT70JPIhydE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ockHjwwdDX5DBC/LzA31BbxMbTfMEDYqlf35X4KqYsz2UlI1JOGaIB9i5ikeQUCGQ0JNItO+OwZm6BkYlUz1YPZ0r6AKY7Vutnn5iuyGnyWdOaaY2ANcwtVTLyrWcGhDER+kn1LqPq4gdz2DIyGn0I6fw5G3TrToxnV1YMBU5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=KMBJj9bu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="KMBJj9bu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so141788266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357321; x=1792962121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPr4qdqLVcWX6XCuQJCH3UmIwyLoC3WQx0IATf5uj9k=;
        b=KMBJj9buadvTs6NZBPS0suKByVrH0vN3LqPkOvqSe8fsi3AsI1SUQ9eaUjk7dfYAQe
         N+4HZ38y2xpS8YPfUDDQKmK1ENh8D5HXdqyFz68HS5BXrb9IXxfbQD52NzQb12OUUlwx
         iDcF0clchQoBq4CQDHfm3OBLzHKG9fOni+sDd5EE+UApFbQCWFGSAcqoisHB10Xar97U
         JJeQGj1GHkUpPdqtvcAeir+AyYjOzFpvXUN23Hh8jqRAWZ6ga3K1s3mI9IyoQn4BiCeg
         qtWJhbYlHCMZ/RUDCwK8GTN3JDcXdVmPXwhXqIEb8zraYUP4FWa6xd6V2rxgGI/hASGm
         BvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357321; x=1792962121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPr4qdqLVcWX6XCuQJCH3UmIwyLoC3WQx0IATf5uj9k=;
        b=eqDu7uwu+KZj74eLw13rpIF/EoA5C2yziv9EdxxwpTOyYfVAbGRDdKlOh2EScrS+Tg
         txc+93R69Y7Jbw3M0AfPcMwV37ld2Xb56KxZh7NC426kY+gQZIka5sQZ9bLzakuc2/EH
         81WkmoWkHYSMtrbW81NKIBbcWvwQGzcrJUPQ+ze02VhbqabQUGMbv6QE01tbazzC/2mc
         Zyiy5bCnyP/KEOatHtzYpxGXJHaYbLjiGF6phkk4h8hn+1Ievxxpn1SegZAEbsBWNLT0
         HY3b0MWlCMIdc6sKlIBgmYrQg1Y5TOhDo2l5oyKwBHHfDcR7nKQBRzenzpZ6NIdKJ7H0
         OTmw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Ct1ny3uQbRxaE/F2BBm99p3YQ/Rd8ZN2hkC3EVkeAzyQQuKfmRKRhvqpQeTQcZ4yhnOajUDA9YXkYl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJydCrcXtRZWttDCyYsNgg5XunEhLRHNRKIYMqHc7LgUiKrBzxE
	KPvrkfkxvJ8VMUi3JytAu3u/XoSA4Ouhv9O1Sv3g5UsQg97dApZS0MGjVYwi5yzZcQ==
X-Gm-Gg: AYBFou2YddeXyyWPNlHXp27WQSOIlOOIclPhDsULBki0amtZhmIc5lhu1ea69GZMNRF
	y4A57v7YZJh65Z9dlfvCVvxsFrRC+Z+ff8Jqz8sSWklEleOH0TYcDpb2FxacmreZHmBVecdNemf
	35Fes6JdM+jnlKWZRluVgdYQO+rLnMrD9TkWucYClIik5/EXvGbW0rNA79TXqH03Cb5DOfv6eg7
	fX3OYevYixhmxQg0GJO6GzfqXvJsEeHGJ2e31ufNLU5P7znlaE+90cbviL97TjmaPKZq3+4MFo2
	6TPvLHd8v/7AT3Jiogi51IKyq7Cu3TocqnzcvnFbR8h2K0Lq9k6dvNCpemg14P/jGBISdvxK9MO
	ikQRZ4R/5PkePLdy2ewMbkr/N/9VyP4n7t+5fziWsnudCJuaIImPzRFI5SkFrfy76Yo7AumQ2zf
	OkuScaNPXp4BBPDt1AWVhHgmyYY6fhVoed+4pxyGkon2nMPVRydu2iZJRDbfWkBk7cv+0EQgIcV
	FLjr038qt9peuRt7oCwd6fBi+TiiTcYfAznjvASSlyS6St8UobMnpHCiLSBcHYwrMJp7Y071gf2
	LRoj21De7GaqGzxG3EWNgu7r2w5XitPzL8smcpfxRBHFJJWl7hbm58BJgvojy68UImn8Li8eJtP
	3RawpqBqEdGGvq1Eu6+Ow9KsdZYFBwCeLQx4npQ90+fjeSDYs4Y3eRtFniTrh4otwjUM2JLfyCl
	WWvKzXl9bd
X-Received: by 2002:a17:907:1889:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c41a03f8030mr392380566b.39.1792357320700;
        Sun, 18 Oct 2026 14:02:00 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:59 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/5] wifi: ath11k: keep the radios when a firmware recovery fails
Date: Sun, 18 Oct 2026 23:01:50 +0200
Message-ID: <20261018210153.1925962-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a firmware crash recovery ath11k_mac_allocate() keeps the registered
radios, but the error paths of ath11k_core_start() and
ath11k_core_qmi_firmware_ready() still call ath11k_mac_destroy(). A
failed recovery thus frees an ieee80211_hw that mac80211 still uses and
leaves ab->pdevs[i].ar NULL. A frame bridged to the radio then follows
the freed hw:

  Unable to handle kernel paging request at virtual address
  ffffff8316cfd480
  pc : sta_info_hash_lookup+0x4c/0xe4 [mac80211]
  Call trace:
   sta_info_hash_lookup+0x4c/0xe4 [mac80211] (P)
   sta_info_get_bss+0x1c/0x78 [mac80211]
   ieee80211_lookup_ra_sta+0x124/0x14c [mac80211]
   __ieee80211_subif_start_xmit+0xb8/0x3a0 [mac80211]
   ieee80211_subif_start_xmit+0x50/0x750 [mac80211]
   dev_hard_start_xmit+0x98/0x120

and driver removal dereferences the NULL ar:

  Unable to handle kernel access to user memory outside uaccess routines
  at virtual address 0000000000000000
  pc : ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k]
  Call trace:
   ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k] (P)
   ath11k_dp_pdev_free+0x4c/0x84 [ath11k]
   ath11k_core_deinit+0xdc/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Destroy the radios only when ATH11K_FLAG_REGISTERED is clear, as
ath11k_mac_allocate() does.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: 0366f42640a4 ("ath11k: Move mac80211 hw allocation before wmi_init command")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8e4dab61a3009..dd256853bab57 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2231,7 +2231,8 @@ static int ath11k_core_start(struct ath11k_base *ab)
 err_reo_cleanup:
 	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_hif_stop(ab);
 err_wmi_detach:
@@ -2315,7 +2316,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
 err_core_stop:
 	ath11k_core_stop(ab);
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
-- 
2.53.0

