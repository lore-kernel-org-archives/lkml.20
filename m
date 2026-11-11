Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399333;
	b=XtGzytTkRWoG3ucqj6qnRqT5fnA+ayL8gfuHJ59EVvBXqoJk//16Koa55dZrlhJ49lmN
	 v+bYbsO6nVSIIxCWTJwY+1odK1Ub5zQ7TdzUu1SLwztmARr5JJu8TF9OgPiFN6w89ieyM
	 RDvhQyW456jd+fNWHw7vQ5aAHcFaSL3GvyDEP+GRJ+Da9QcBsg+23MfjgvzNiEoaTkscb
	 16OuhLp/Pm5N6C3DGCRR1phxDKbZeU2Pj/apRAS2YpomW3xS7rx/0bDRBBUVdX0AtZA2h
	 LfbYN8kscg5SBfsQev6WJ1Y05KY41YNiuQfVYS2V0UqV1JXZBYq61VH4wtAoOOIvSJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
	b=ckFXdBg6lMOvMtaQIaW4KteWOA944HXGQtX8MTwaG7yDRg1ic2F8v0TIyGtnCPgIMYSD
	 33Fip3LhUayeb+XqlvALpQwRqV1N0y/8uNADjNZWytjckjGCv8s7xKEKopNX24ztc0lQw
	 RYIEfMud39gQ46dkcnxGoHsGnfisdFfDx6Nbo/sJ2UbboWtPiefq9JUJLGrRKvSVuT3lR
	 e7nqZIcWw128M9bYJu5Ox5PszlMrDPm4jCPOtPKGXZAsFigZfXXfHugLFVAPGLMa6bNwj
	 ACfJCVuk2QleC2hFQi8XeXaeXVLBnRA52aPobHxBWXqpK+hJGNg67ZtGcua5CKB2vtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ze4Oa8Zv;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC760A3815
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FC760A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ze4Oa8Zv
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e98301805so30738546d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399331; x=1795004131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
        b=Ze4Oa8ZvawDYlRmmmpW0iE6IRcVrPTnd6fPfVEv75rA8APFNrMKk1MKRBcogVo4Pdj
         JfdJ8Pz961WQI6wjofWc/pFgEHz5shqG6XQx+fosB+dnadROHKCkQ1OxtZ8IjHWnrPh7
         HpGg+/k9jjKF0w2GwmTkkFa7ejr5fR8+EEwfs8Z4Zqvgx0auRZBQnQst6n5dYvTvTfyr
         xa2GC2xd6KvhcuZJR60BihexNjRezarHMuQ+KVwobPvnEs+RxIhvZWGy9FFPh06kIWd1
         xFs+QP22u9rJUcy2A2g+QbLEkrzitOTjAtF94++Ulrfmz/Z8aJxyoDVbl0mYhrfGTwng
         MBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399331; x=1795004131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
        b=gw2ZYxSTvEXBceh5s2MVx2Dx8dBAKUxLU5I2+/Hu1uRpViJCA6WTd+wHXKPjFd14eX
         vCpCAt07rrhMeRmnxhsIxXIiKAnq7NOHt5XWoUw0xxUYYaOv386XeoaS0CoyKKxnC40O
         MWKiXSNFtcNtpbfeqqun55BH2BuGPCCceR5ANQd5gDIUSmRB9gLCvGZMiMJHVvDV+vD3
         J40c+MGS7rD+busitR73xCV6Z9hoEO3HjDlnt+5Nlf0TlfSvFBfFBhEoCSFzNNOIjm2L
         WwcMRaQVlJ9/O1CM5XchCa2kmMsPvRrGvhH2ApFZqdevFODW5fYG3vmTTGpAhNmvy12Y
         OZdA==
X-Forwarded-Encrypted: i=1; AL+hErFp+wi0ZgdaUg3AYH+H3RqdSFqHCxpZa2wAGIb4qhVQy2Jm+CuV/bry0XPk5Ra9Mvg7M3mRpw5CbCz3/2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LkVLK0aZgW3C+mjwY/hUcUD6qBjNBRH9Pjwq+JjLpNFzQ5Yp9
	vU/XZeIO9lMVsVXV5NkCRuUMEr3A8UZQGMD8Sv5U3VYTiSXyyFcILC0E
X-Gm-Gg: AYBFou11o/tUNjrLtIy+50YW7LZdL1WnWm4EiiptjphZjSAphjB+SV6aAgRmETEnFcl
	y1wd1FXAgAifu5Kdz5iTs560UBl9ya86afHYjwypQMgdNCtc3yjbPCt6higHAqWW77iKXjRwZxB
	c2slx+1lqsB42PVk8A9xZizpPhIEpM1i0L44lDMWfYWqwJ4zqdw9z9Z50INxbrVWXotMbjqNavZ
	cWCMR7COZb2Fn+6pt8jvnOrtPS30e3fYVPjL0XORUyM19BzH/jQwfxd3qhI40Rfuae4yhM9wLH0
	QsOW8Up38FNopHP+w0Vq8p33+2IlIPJSWCUvwwKmnVhY6JCsmO0MKf73aARN1n2n5KM8AuxoPCF
	9sbEQ2mEY8ZFhiAS6Uc/wFlfqNJP5pyhwyBi+uLTOtQ8eifpJamW+1YrTM12t6xBx8fWr96CmW6
	Zb6HajbBoNqNaOGIB4ift9g1MJRgDQ8X94Jhk9i1wNHWfE4vdzMDzj1ShjqX30T4oQ3TsvrIjo7
	UwpUVjSxPN/xyZhNjrIAyRuk+BpHQVWiKSZgtLHgF6XrHhtxMFnbxZlBflPcyr4UBGNovCSRA79
	/dac2qV0ZWxn0jvbp1GJAbLfdJ9hpSHD62g=
X-Received: by 2002:a05:6214:2346:b0:91c:6a41:7982 with SMTP id 6a1803df08f44-91f03dae7a8mr38540816d6.8.1794399331383;
        Wed, 11 Nov 2026 04:15:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Wed, 11 Nov 2026 13:15:23 +0100
Message-ID: <20261111121525.358041-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111121525.358041-1-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com>
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

rtw_fw_download_rsvd_page() downloads the beacon twice: once as part of
the reserved page and once more on its own, so that the firmware ends up
with a TX descriptor that describes the beacon rather than the whole
page. The second download fetched a new beacon from mac80211 instead of
downloading the one the page already holds.

Besides the extra work, every beacon fetch advances the DTIM count and,
while a channel switch is announced, the CSA countdown; doing it twice
per update lets a countdown that starts at 2 reach 0, which mac80211
warns about. Hand the beacon skb out of the page build and download
that. The hw scan, which downloads the beacon without a page build,
keeps fetching its own.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v10:
    - none, rebased on rtw-next
    
    Changes in v9:
    - none
    
    Changes in v8:
    - none
    
    Changes in v7:
    - none, rebased on rtw-next
    
    Changes in v6:
    - none
    
    Changes in v5:
    - none
    
    Changes in v4:
    - none, rebased on rtw-next
    
    Changes in v3:
    - the beacon out-pointer is initialised in the caller

 drivers/net/wireless/realtek/rtw88/fw.c | 34 +++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b..3cd17a3bb494 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1622,7 +1622,8 @@ static int  __rtw_build_rsvd_page_from_vifs(struct rtw_dev *rtwdev)
 	return 0;
 }
 
-static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
+static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size,
+			       struct sk_buff **beacon)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct ieee80211_hw *hw = rtwdev->hw;
@@ -1702,13 +1703,15 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	list_for_each_entry(rsvd_pkt, &rtwdev->rsvd_page_list, build_list) {
 		rtw_rsvd_page_list_to_buf(rtwdev, page_size, page_margin,
 					  page, buf, rsvd_pkt);
-		if (page == 0)
+		if (page == 0) {
 			page += rtw_len_to_page(rsvd_pkt->skb->len +
 						tx_desc_sz, page_size);
-		else
+			/* the caller downloads it once more on its own */
+			*beacon = rsvd_pkt->skb;
+		} else {
 			page += rtw_len_to_page(rsvd_pkt->skb->len, page_size);
-
-		kfree_skb(rsvd_pkt->skb);
+			kfree_skb(rsvd_pkt->skb);
+		}
 		rsvd_pkt->skb = NULL;
 	}
 
@@ -1723,11 +1726,12 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	return NULL;
 }
 
-static int rtw_download_beacon(struct rtw_dev *rtwdev)
+/* the beacon the page was built with, or a fresh one for the hw scan */
+static int rtw_download_beacon(struct rtw_dev *rtwdev, struct sk_buff *beacon)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct rtw_rsvd_page *rsvd_pkt;
-	struct sk_buff *skb;
+	struct sk_buff *skb = beacon;
 	int ret = 0;
 
 	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
@@ -1744,7 +1748,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1754,18 +1759,20 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 	if (ret)
 		rtw_err(rtwdev, "failed to download drv rsvd page\n");
 
-	dev_kfree_skb(skb);
+	if (!beacon)
+		dev_kfree_skb(skb);
 
 	return ret;
 }
 
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 {
-	u8 *buf;
+	struct sk_buff *beacon = NULL;
 	u32 size;
+	u8 *buf;
 	int ret;
 
-	buf = rtw_build_rsvd_page(rtwdev, &size);
+	buf = rtw_build_rsvd_page(rtwdev, &size, &beacon);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
 		return -ENOMEM;
@@ -1782,13 +1789,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	 * the beacon again to replace the TX desc header, and we will get
 	 * a correct tx_desc for the beacon in the rsvd page.
 	 */
-	ret = rtw_download_beacon(rtwdev);
+	ret = rtw_download_beacon(rtwdev, beacon);
 	if (ret) {
 		rtw_err(rtwdev, "failed to download beacon\n");
 		goto free;
 	}
 
 free:
+	dev_kfree_skb(beacon);
 	kfree(buf);
 
 	return ret;
@@ -2345,7 +2353,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtw_fw_set_scan_offload(rtwdev, &cs_option, rtwvif, &chan_list);
 out:
 	if (rtwdev->ap_active) {
-		ret = rtw_download_beacon(rtwdev);
+		ret = rtw_download_beacon(rtwdev, NULL);
 		if (ret)
 			rtw_err(rtwdev, "HW scan download beacon failed\n");
 	}
-- 
2.56.0

