Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813619;
	b=f7paYB9UtvJpibDVuoa84UB/PBaccIP1f+Zq52Pi79F4iCC0XBQN+3uh7Hg0sKdCIBlD
	 CWeAl4puo4RZqSGpHGkPfYIbcdBeI7Y8uxUQuxTProlje0W7eL8SZWPS3FQJTrGBXAjc0
	 lPsIfttIu+B3HCosq8GZfmj0dn3CFiZJ9ahnySUytxF0g11ZlWMnu69x5JHlEwpqrXBod
	 XscJ38C5DNuYj+DzhMYanFMTL+/Qw2HpwTX+bu5BJ4cN/zsqEr9kfpx564K4PSxV15R5u
	 t02C3skplO8+r14+j5lgjCG8Oh08r2VaQx8a5FdcCh2lxRwACD1IZShJqJnnmjhtijA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
	b=33AboxP2xWPEjhRSWKpiACp8SAGeEi+xc9w4SFgLYpRxlUJVEFxJLqxgoi53U4X+7hKh
	 VM3Rjj2GKGuz0admuAlO5s+B7hhvABdh3QiIxSn8CCjidxBGifHM71Bqyd+yCm0kYEGRg
	 JNJOeBnO8yWoO1lU49iZfkonICxH00zUTuzinYN9lWw+kkdw3PHrODXOtRTwMw+OucNmB
	 /0YlZ0hRe7FhiUguM5qeuhwpA6iDkmzWpbBtTUSEh9hz4jUa/UcyFjAO5mKF1l/eULtrB
	 MiJTrkAz7Bl1YOUDXTSNTiTsF2TIlI/y9ZRv8PMsUuELpMpYgadNPsMoKtReOsSuy2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFREsfOC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557B606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7557B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFREsfOC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso17838265e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813618; x=1795418418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
        b=PFREsfOCeFYMfGzTmYfGW74TGfRj2TeVaJJglwobLRTmFEwHZqiUVHtoafiUP16PYd
         11ROQfYGEx2kwctCVAHewW+Q5yXlZpU10qYdepN2cibji7DD3FwIT3oCtaNX+Ly0gWtl
         rThvoH+GGDeV/wQjr8wA1SJ5GomF4095+F9R31W6vGvcTuxBjsvIz9h2kIKHgpY+5VJ8
         gv9I9FEQVUEM+BKvwJ8MJfoWtLWIp9Nw9cb8lHxwGKCEjEcnhBNRnG8OXVHWPXNkNnxL
         StHZWZkWLOeJQy4ewnkuGTbs8nPoPajANof0qXMqkoP3n0mGyygLefTwFjrnkkkNED3v
         qBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813618; x=1795418418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
        b=HYkAbezomvf/8DCfbAMDuavBVQobUpIBrp1UqB4hn8o3dOFA2bt0cmen+s1S9Kwoep
         XxuuV/DqvafoLKuQ6oni5fukGzgShMRbju+iOgFHcIk9M4qLu9zGyTcVUVMSjEr66IAH
         wVxKLk/1WZeHD6lSvhmpK/UmopBxhm8L1/fxFuOcZ2QUqiyXmNSM2MGWBcP4rWj1M1CW
         mN2bNEIJfaHXPi9J3SOYVyRVRBm502WGAd70Ou9SaYbHWJ8gjVdYXHEtPq2EdRjR0++Q
         v4311sVbHmTs++6M2YhWe8AEJ8V6mx0ujlpCrw047AChaWTyzBTAEtJ2lh9ofHYRaB+4
         4BYQ==
X-Forwarded-Encrypted: i=1; AL+hErE9jW5vRHZoKxPhUxNSoLAjLuhdrr//9Oef0YZ+J/Oo/O/d16gWcDPo50+gI2ddSR0lH+z+r1e8+gfMtSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lA803UWmGx9BxVQ3CnqoM2lx5dkpUPgwwwnIWYbEBPKPTbA+h
	iJGMQSokAmVQOAB7JODHqAD31enFSIiBHnP7+tWyElU8U4zxImOeIi+EWBH/R8qL
X-Gm-Gg: AYBFou0NH/ppCVUFw8zZFBEX5hQ5VBVhNACPAafYD02WT0GRHKmk4jwwpf83N4y+yLd
	/I9mjSbcqO2M77arkOMrwh1NPSArzAM1UQG3Z8eAsRsMHaF22AFuUdsl2Y4P5AAl+US+bYhCsJQ
	V4zIFriHz/51KkjWd4H1iRc1b/iniE/zWMa2FRDSUn8onB8d6A+wTTA+3Oo4wic6nM71XkJnTvS
	oih9z+AJmbQB3/kOAgdy8I4/rocR2aqsq9tLCxp24fbZAw9kcKXSs2GYY+0NrAkFqHxx5BtRjpD
	WqAW9kMEQVbfNESFINcBIe6a1CM1Eb768dpBrprsG2ovr660KKl5mrU1Lvtqzi/ocPDpoZ796j8
	HEMYTKD2KWV7Y9FQcj3MbQP45dxOQcvaVef6Hge5bt/5KRvQ3ymRL2lZqISWAgxdFtX3LQz4EWz
	/6DcDVVbOw2Txv/oRqyW6619+G+m9j3SbNRG6tz5exWQIaCN4vcJETqpJtX/o8hmu7sT0wVpb7+
	TwCEEYP5Kr5ZjgIeMNtPbzUJHGi+fqADwD1OCqsgw0NeLisSgL0IYHROCfmnvuyj8ry1dgIKy9g
	rJAL1Pa4DMWwvxxLpFZUvvbgXQcBCYljtYQ=
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr24878165e9.7.1794813617856;
        Sun, 15 Nov 2026 23:20:17 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Mon, 16 Nov 2026 08:20:12 +0100
Message-ID: <20261116072014.1142494-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

rtw_ops_set_tim() can queue the beacon update work between this reset
and the reconfiguration, for a frame buffered for a dozing station. The
work would then find no page to build and warn about an empty reserved
page. Let it do nothing while RTW_FLAG_RESTARTING is set: the
reconfiguration downloads the beacon again.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v2: the beacon update work does nothing while RTW_FLAG_RESTARTING is set
        (Luka Gejak): rtw_ops_set_tim() can queue it between the reset and the
        reconfiguration, where it found no page and warned

 drivers/net/wireless/realtek/rtw88/fw.c   | 6 ++++--
 drivers/net/wireless/realtek/rtw88/main.c | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b..c9224749826d 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1800,8 +1800,10 @@ void rtw_fw_update_beacon_work(struct work_struct *work)
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
-	rtw_fw_download_rsvd_page(rtwdev);
-	rtw_send_rsvd_page_h2c(rtwdev);
+	if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
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

