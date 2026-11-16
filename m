Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813625;
	b=eTKrRDpCHCFtj0JUnEFi9JPravVODvltg/d9cgVyJEhbGcmpvWPiBxeTiNhImEAeXYWJ
	 exKlZHEJ+7cThFFVwbzUYjysbdwrtgK3n/M3X+WWoobeUAfeqhG6abTQ8GjkeRTxuv43B
	 LCp6q/Q75nSM0mqnTwpS4aBlWZbU674LkvzbIomWyIy5CrdiwCYGe7H+bkjHM0fSNrgAy
	 QflFVWfUAMXvyPUU24eRGbaEy312LiQd8tGOuBPcQg60ye0cWm7cA5KNVLf6VZP/dtYQr
	 n/CJzw99jUOMvtRg15t+9NxfRbS4+gX1Kajob0WZ0Bij1PaI4bLfXmwDDFj+yL80kFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d85kdPM6Zryarhegtw0yCCkKuMF5/GaNNr8TE4nytkQ=;
	b=jvGipsMVGHESVW3Td31bLOR/25YdbmK0GRDiOYRKwgBmrXX+3xaQp8DW2krr5D3DDcpd
	 KC+YX/M42Dn97uPajmv5Y68s03Sivx0el7Mk9OUDM5V0/8j3VlXGbMCrb11OLaav0ISnz
	 Hot7JEBbKVThHI90R5w1p0s+223pH2+AHmvQSDEs7oh2KonUTsSzKlzYVHmNHSW+5FJew
	 ZTy3zHTTnevseoNwE0Y5GgztHSHjbuSxru5od3QpmqFwVmY+C08lx9lZcFMh6k+rXK9ab
	 N51XWhdJnQw2nstdhNighEO+DNcPZG6Hv0R6pcNCTpz3ATXqeOr+rcvSUZTyCb1RUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jhhOowMw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8D606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC8D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jhhOowMw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19450155e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813624; x=1795418424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d85kdPM6Zryarhegtw0yCCkKuMF5/GaNNr8TE4nytkQ=;
        b=jhhOowMwH/LaL7DuII7m0OFDkyCsgWA4Znn5/j3Kdw2HCAGBhQ2ils+cZ7+/KQZP1y
         wRIZocZs4t1IPDai18WEOm+OwbJQUkj3wtEMaKleYfHzrter2w5edPNfrRUcNlbEbzzV
         aVZ7uKBVV5mH8GYuN95LBV2PdA1X9YWAUkSu1gfL1R3vzaxzBruqWnAgT98RY3KMzUTf
         +7D4RY/qYMbjbTMrPoyJs98u77+TZOPgOV60TlY+z/dEwhfOGhE5XSYaT1Hlx+5+OIZW
         7BJxl74bk4AanzM2wFF4KAYyRGA14yZL21tonyvt1WvrlHfauy13pEGFG9s0FOXsl6m0
         tIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813624; x=1795418424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d85kdPM6Zryarhegtw0yCCkKuMF5/GaNNr8TE4nytkQ=;
        b=hq0cS/RzWuThIkR4o4uCJM8Rmicf3X6YLgQAqF4WrNAIt604EqKT+0FT0E929DvSY2
         o7P154iR/fhUz/Z5Rh9ZC3jI03G2kRgEkkF8VE64KdkIQIR+boPzSh2VU9z1bN5x43fu
         XX2laP096elZvurdagDAqeHqqimJxjWZ3EjDbuYYCF7YVrgUTVrvdu5CXX/Km0UdrdD3
         SIY9McPTSJQNAYZtWlwxNsFpR4h3Qe5X3/eUDoLXFZCbedRb867nM0Z2LYLgJ9yYPkbs
         27RI8FCh7oCUgP7ocR7itzhn+m8EZ1rf4sQwVSbvl4ij0Jls74Lw4sCKpJTgSoQsLU5d
         J4oQ==
X-Forwarded-Encrypted: i=1; AL+hErF2wk77jw7rintCUb4qH2Umsk24F/CjrZ6VhE9Zvs7xH7ZMgPRpPNKun7+YlJHBaOdox4p2MnQuml4oXNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nrWay8jnPUMBeQsUu09ALV8pAB8HofUV+W+4ODzT3ZZSV+n+9
	EekwZ3lC7oWpVFORHCfXm2wdLhTxydIFgrGJJAe4y50hpInFGVC1Ejwr
X-Gm-Gg: AYBFou2eXIKbgauGpHXxQd8zNW801qBBqIDU491ydSQ7Nkp9GLZJEbm4PwIPWx/Sypc
	eDNwz3Tg19begd6NX//tpzp83453vJbnRGd5IHmYyXlswwh65+Ep70Xcg6JTyWEEV8MEUJDI9/v
	sBWzty6J2v1ukDazNrSmkBSjIIbvRQSDDVbcsTh7/Ri7MDGld8b5/w6hvBWIerNwz3ZcSxlO1qF
	6BxQ73BGXEqZdrQLhuw1EfOa8tcAcjOH9Pr2RixxdkzUL6M3iym6AMllVh8ErEtDLIHmY7fqjqZ
	Vc4kKJPKk/2qk9bzAQ8J5MLKHW9abqI483Qtv3LCmWEKHiMjFiy1C+A9re7ZUv2Qkm7oF4xZ//L
	+7ZR3N9f1xT7KY+sejF9s3qemHDn44GXJ3VPypwyjfmhTb9zSo1A3Dc4imlm9AlAhZ0MCBxDCMU
	2ugIg7zNFkBuJU5U8fwAtj0UXjwdsInoB8JTBq2AaGyt6lotnsnHSgTcu8fs+ZVWZAo4+haAmhp
	JRMmus08C9s3uXLbg1/USxCQjkcVvFmY4JwiRZ4GgE3LBTHZ/Vpm9KVSYTHO1y0RNun6cqWfAOv
	fPrzTwEVMuc0pBazIe7e+aZ98Zsy6Ipx+Pw=
X-Received: by 2002:a05:600c:3115:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb55aa4935mr202184665e9.32.1794813623448;
        Sun, 15 Nov 2026 23:20:23 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm159710565e9.2.2026.11.15.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:22 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next] wifi: rtw88: program the beacon interval
Date: Mon, 16 Nov 2026 08:20:21 +0100
Message-ID: <20261116072022.1142783-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver never writes the beacon interval register, so the hardware
keeps its default of 100 TU. An AP started with another interval says
that interval in its beacons and sends them 100 TU apart.

With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
RTL8822BU and RTL8821CU are 102.4 ms apart on the air.

Write the interval when mac80211 sets it. The beaconing interface is
always on port 0: rtw_core_port_switch() moves an AP there.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on rtw-next on an RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
    as AP with hostapd, the beacons sniffed from a second machine: with
    beacon_int 50, 100 and 200 they are 51.2, 102.4 and 204.8 ms apart on
    the air. AP, association, power save, firmware crash and scan tests on
    the same chips on both bands gave no new kernel report.

 drivers/net/wireless/realtek/rtw88/mac80211.c | 4 ++++
 drivers/net/wireless/realtek/rtw88/reg.h      | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..5f411df5586e 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -432,6 +432,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BEACON_INT) {
 		if (ieee80211_vif_type_p2p(vif) == NL80211_IFTYPE_STATION)
 			coex_stat->wl_beacon_interval = conf->beacon_int;
+		else if (vif->type != NL80211_IFTYPE_STATION &&
+			 rtwvif->port == RTW_PORT_0)
+			rtw_write16(rtwdev, REG_MBSSID_BCN_SPACE,
+				    conf->beacon_int);
 	}
 
 	if (changed & BSS_CHANGED_BEACON) {
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a..877b82640e91 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -498,6 +498,7 @@
 #define BIT_EN_BCN_FUNCTION	BIT(3)
 #define BIT_EN_TXBCN_RPT	BIT(2)
 #define REG_BCN_CTRL_CLINT0	0x0551
+#define REG_MBSSID_BCN_SPACE	0x0554
 #define REG_DRVERLYINT		0x0558
 #define REG_BCNDMATIM		0x0559
 #define REG_ATIMWND		0x055A

base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.56.0

