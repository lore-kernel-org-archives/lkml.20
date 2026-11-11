Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432764;
	b=XP9sdRRiA5WQlKtUEv/tY8jILMvtM6hC2KMOIkWxExMHW96kkmyP2Glgl0DuXqXheehd
	 tvR5SPb/PfH91Y5QwD1Mdn+ZDCsztLauVi6SVffk5hZMaub3DFS8v3OgspqQPtkCIbrib
	 CkwWyR3wX7gQpCn5f36HOeNb7wJK82BcnWvvXvtLPqCIPrQxvEebf3mwOjLqMLy/MHPX3
	 lpIngKdWaK2kByRnGSZit55U0IgEwWClVTb/6r0HiPbL/5dja/Jk+EDCyxE50DUd5Txit
	 yLSXvCdgEJLR3hmL5seDcLZqNtib/daYBhIs9hkyHxoRFOZA62ob76Zw+WBBMcVuJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
	b=VIpQuFonUNmKsg82DqfhynOBA/jiiEzg7scxVnZstoyv4ZdhV2/vAJywwTRSHGoEYGZv
	 Oc1jK8OPpPl3l6XV6g3ZVHeF0y83HwX9YqletYRYszPWG4dcjABYckdUPq/4CpVL5UwKc
	 RyjTQdF35v2PamjaqQ4tnVbWNT+DqVkllvIxg+CIZU24ML7HblWaQ5Nhevrus/r7DP0ZS
	 LsSDAAE81tJxBTBYFYcWyfEyqpn6Wa5NRRMpvwQ4VBzPLQRUUKMEN8kgSmTApPCONtruA
	 qisoOdUSgFx0WUwVq1lSK+WCPHXF9tda4Y1pVhJDvq3iFcprL5gU3CgUOQ8WKsdCdtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNuNlj3I;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E642606A8A1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E642606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNuNlj3I
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so23585855e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432763; x=1795037563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
        b=jNuNlj3IPNpoic87TfOjXZsSoy+I9DAEO4vP8zDJZ1FAOrxj2Is68fEyYO1VOPKOtR
         s6EyiPPhf8vuWG3QFWkaaWYm6greU+pCMACzTKZU1w0Ach2/KqkTmVolMzgEFz8bCTyz
         0XC+OOwnALiZOykLXxoEYVcmVUSY0mSP5tPGXMfNl9Co948wNYwU1NLodW/8T1YTzU08
         bXU9Mesxq7szC2U7MRToMHpX154EroQZiu6UYUDRzPC0ddUQtL+eOvRjKV2kU96MJIOA
         nV9xLsPDBkic5H2RWRingfO5giiZknEuk9YtpupPugCLk8+elDunfQ4CFwRPOKi2d5e8
         mpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432763; x=1795037563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
        b=D98D/LX2rHV4FVWJEJVU9xxnVrG8b2rNthvLqnUoBZuVGyOe8YLRJxvh6+MQzKyY/P
         8LZVEoeSv7Jc4Vj4PUQEk0xPu8lvCGgtSYba0rkPMbINyR2XDX5XYCeq8a2ba6yto7NG
         T7GUNDJI9coE/PJ8BSUFfwCctdBEFIReYYs9TxshDAfQmfi/8R9tngqaxfa0zPQvKUgd
         ERXL7zZIiUp6slgtTSncZ0ZTGVEIt/JLu00UxVsLZjMkbaZoN6vCULU/RW+W8lppXRYT
         sY95Z1bKw1iWJDMuOX8eIPidOecPKpm7aU52tFWhrnD0rVJs++7yANIGNN1oLcTHJ8Bz
         RvSg==
X-Forwarded-Encrypted: i=1; AL+hErFr28UyjR2I3n6NyaiaJnw4lVngzrGoz5B5wEwWjP2gY3XLxiTUmzrcuPh2gX9F93pvOCvojKAlhNM1CBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9imBSiNpLdwCVE5xFHp0qsOSHNyiH/SFZB3AzkufUBd/IfLwuz
	Lv93F0WNCbJyXfYNDU9PhOhFGQbXM3kj9f/GR8RC+9rqQyKSbRlNNg1b
X-Gm-Gg: AYBFou1sTtKabMrNfiU3uju3Yjrsw7XR7zRqPwJ/Bg/CS7SrGZ/2G1h0Pjz5JqZH6jB
	nZdrZwuLLAVZ5iXD6SnoXKaBuEd1kSSAuo5sa77Du5+c30LxFrVAARCDPEpR4vHhmnqbByw3szm
	ARe/eH2kl5U1udriaPKMkNur3ovTSWT7LmXDnT0CirG7eL5KweXfbn86iFP19+RYNHg9GGoISVw
	wqkMjtfWY69tScbedABs6aGrpyTnXTMyqkCDZC/vSAuJX80fduv9bwZGC3jWowsllV4ZfeAYzko
	6mIe07+0ys0RRhBYURODcbOU2tDzIvzcDXA819+d4C8IKYBek4ALCABXVCt2bU4zSO8fFiM19pl
	7As0WsGCz3p72YJMdAqbE6r0AKa9uD75HWzTOICRLUo2UUVRBEFkLbfw1oxtENeoe0HpMepcFdg
	L2Vrqz9nvp0PJG7FOkuSZVU1L6GQV5Cw5s5Y0jCnOJuuNweGhc5VhRHBlp4KTV4dYFPBWh6/9HC
	kB3ogGYnZHnq/hDEEmrVL9Uf9CGj1D3IglkxkdqonfMi8HGttcJeEFAvnn9G93TixVPV8Yw7G0/
	6blqvV8qhE0C4lqajMcYybHwBQ6/Bg+JqwI=
X-Received: by 2002:a05:600c:3491:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4ba093aa693mr67003845e9.14.1794432762791;
        Wed, 11 Nov 2026 13:32:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:41 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Wed, 11 Nov 2026 22:32:37 +0100
Message-ID: <20261111213239.569224-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111213239.569224-1-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash resets the driver state of every
interface, and mac80211 then adds the interfaces again without removing
them first. rtw_ops_add_interface() starts with an empty reserved page
list, so the pages the interface had before the crash are lost: the
next page build takes them off the build list and nothing frees them.

kmemleak after a firmware crash with an AP interface:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
    rtw_ops_change_interface+0x6c/0x80 [rtw88_core]
    drv_change_interface+0x100/0x258 [mac80211]

Free the pages where the recovery resets the interface.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6f..adc54b063382 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 	rtw_bf_disassoc(rtwdev, vif, NULL);
 	rtw_vif_assoc_changed(rtwvif, NULL);
 	rtw_txq_cleanup(rtwdev, vif->txq);
+	rtw_remove_rsvd_page(rtwdev, rtwvif);
 
 	rtw_release_macid(rtwdev, rtwvif->mac_id);
 }
-- 
2.56.0

