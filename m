Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910463;
	b=cLg+b6i2+OJKmLj4W7AsEuo5hgvsxLRzZY1KLNEleC03jigYmz2zxDUv9zP3PcCreYmx
	 fssTypvQAmPNCN4IVkIbb8a5ZpPjV3L5DrzHW3kdCnPozPRp2syaNoUX6fkzhaCJc/LEP
	 mIxiv3cNxjiP/M/mLydNszfEmUx1WdzaHFwfehj6Vreb2u4yr2RzV8YGLQ8iqWASW/+y5
	 DHad2ci8hT+TIsauZXbEkx7nsdP2g2iX7ZwMLqINXZEvwAzrMuYOhYPr160uDvdNVAKhb
	 iNRZ73jkAIRs6H96Efmf6BK1DbbpOhHq8NANtqX6wz0Xn8CMbntYKt1lXJf748ms/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
	b=WdDuwtA4+RkxcyaRh9RW94NvEgZ4Lpn28RldzWlD0uZiY5iTtnTozUW5SHttJf5JY0N3
	 3bC0hirgkC5oJfWnodu36ZRoy4fxtixETddzjzhv9W1JSxZ3qAqVVIztBj6BGXJ2s2T3X
	 x2TjRhrkCS1aTQt5+ifwNT5aA3jDJaxDgZhbAgyrLYpBkPPM/bHYMgwwNLcJznqiO2Fu9
	 oyhrbHYVldZLB48ehiESLFOGqPpZpETWQDSwHAkrdC0tzK0ZxLWpdgbxjp+uGE/anHHBH
	 PcZt/n/hHVyXgoqWVKl0tOwUvSX8gzdkiDTsdJo5KpDMaBpP6b2bKC1JF5sHapUSBCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhS1qp23;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1612606A88D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1612606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhS1qp23
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso31244355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794910461; x=1795515261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
        b=yhS1qp23M+mmxHrugalt5Q/GaWMbIuu+dXwcAIfZh2KJPbXtZughu3Etnu4qB5iUjF
         k3J+K9k/FbMYCiUA5DfIT5404WdLBj18sznTJSoLDBPF79lvats3Hjd06j7dzapZI2lt
         X4ZsUa98yui5lqKPEgSUvpdyW1bV+re82UXYEq6GZEryBCO/iGFLktEYwN2FSuDA2utv
         LiD65JxRNKIVq0Iu90jilhPlKH6QisxAmHI2ym+ol2FDo9dtaYZljhtYBI00VRwI3R7z
         zbgeuSdtmEUwmEroNXKcJqnAAQLlme2xoEKgv+wOZz8B/SpJI/+W78OEud5nSgdF7Hgv
         K5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910461; x=1795515261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
        b=cwmL7Ng09Eiw4qY8Qugtr/p15WPzgE4W8TunISoPTlhLd6tdbbGga52JknreP9MvcB
         u0gZ62CCZAkONOL1p85oR7oY6ZsxkOLDX72LDRPo+FoB19rsd286tXFLNFOQv7UFxKqe
         +VEiNkBDwDPnzgUlxuZ9Dkg5is51Y+AaXIzr9lnY2ikb1C04EZ5Jb8ApIGFw81IxxGMu
         uAulpSmSYGW5IKGtEdqcfnrjiJxsUjM+BhQV1K7JwKWSbhKttZWkY4BTq/FYFpxYF47Z
         ybdE+6nuMv6HG+gJg6HZEU+eLUACOyetfU1MrNrqXhYLumen/KjZwwsEUw/IAdpwGaxk
         oMWg==
X-Forwarded-Encrypted: i=1; AL+hErFzqA03N2b7ny6AQxUt9vkisoW0Kc3eL5KucQAd/rmO29bSDY+QvAIRIL33b69Oecyc5Uofnsdx8sKfMkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zVPYK5/Bi+Fcd5rs4bGsCB1/1Nj4w4dJ8Yzkx4tUCJMm1Yapm
	gbOiEbtYavEv72FwvN2/QDZ2MfQwthcLCAgrry4sT9AdxCG13gkwvadb
X-Gm-Gg: AYBFou0/WLmoMNPis3asP+azXXMCQ5M8h1ksetLw6lvtAVvMIrRkdTzW+3NJGPOdyoG
	txHve3O4/CZoKjG6uhFQJROKpQk39UkdRp2+4bkGembV58IFfR5jV/HWPkKKuwzyRvX2YqQIDEZ
	auJ2QbjN0TP+I9KWdEyVmFGr3OJR4qBrRi8w28hxeeZ3sahXLRZ1MwadCY2hVb6PBNO9UEiYnqw
	FymP6Jggz+vieNXHQbq4tZkeFkppXrf7krIKpnaOHXwiZQeYK+JW5Auk/nHOWYxj0pZR4NDxjVG
	NJp4Vtz3YwAmbzM56OC2YnQGVI6a+k4wTROG2uPeuRF7YfS85BCl0n1OTLY8QcADqr/1PQj37xo
	UkTDXssVjbUyXdZ9fQ+Iw+4BJSGZYB/tfTJb12SH65UzwNcXMPQkt5cr0qCeadLIzTFLA7dMec/
	+iYdeDnpEovjyKEIDtDvJC/wU22g34+wWB3J6MvPak5Omu5C0/KA4E4NIYxU89DTmyWkFMExKS7
	uFXIzTSLjk1X+RTrwANqIDUOwihNaShiva9qhOe35V0AkGznkkp1q73ffhA5Uq2YDN/NB6waHHq
	zoTCd1q/StW09JEDYLoZCPrlMlBEE3SVry4=
X-Received: by 2002:a05:600c:c4a3:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb55ab5526mr288666335e9.34.1794910461178;
        Tue, 17 Nov 2026 02:14:21 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm54575775e9.14.2026.11.17.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:14:20 -0800 (PST)
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
Subject: [PATCH rtw-next v2] wifi: rtw88: program the beacon interval
Date: Tue, 17 Nov 2026 11:14:19 +0100
Message-ID: <20261117101419.1687892-1-mehmet.fide@gmail.com>
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
keeps its default of 100 TU. An AP or IBSS started with another
interval says that interval in its beacons and sends them 100 TU apart.

With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
RTL8822BU and RTL8821CU are 102.4 ms apart on the air. The same holds
for an IBSS joined with a beacon interval of 200 on an RTL8822CE and
RTL8822BU.

Write the interval when mac80211 sets it for an AP or IBSS interface.
Both beacon from port 0: rtw_core_port_switch() moves an AP there, and
an IBSS interface is never combined with another one.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v2:
    - write the interval for an AP or IBSS interface only (Ping-Ke)
    - Luka's Reviewed-by not carried, the condition changed
    - rebased on rtw-next fb51e39dfaea
    
    Tested on rtw-next on an RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
    as AP with hostapd, the beacons sniffed from a second machine: with
    beacon_int 50, 100 and 200 they are 51.2, 102.4 and 204.8 ms apart on
    the air. As IBSS on the RTL8822CE and RTL8822BU, joined with a beacon
    interval of 50 and 200, the TSF of their beacons shows them 50 and 200
    TU apart. AP, association, power save, firmware crash and scan tests on
    the RTL8822BU and RTL8821CU on both bands gave no new kernel report.
    
    v1: https://lore.kernel.org/r/20261116072022.1142783-1-mehmet.fide@gmail.com/

 drivers/net/wireless/realtek/rtw88/mac80211.c | 5 +++++
 drivers/net/wireless/realtek/rtw88/reg.h      | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..26bc4a9913be 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -432,6 +432,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BEACON_INT) {
 		if (ieee80211_vif_type_p2p(vif) == NL80211_IFTYPE_STATION)
 			coex_stat->wl_beacon_interval = conf->beacon_int;
+		else if ((vif->type == NL80211_IFTYPE_AP ||
+			  vif->type == NL80211_IFTYPE_ADHOC) &&
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

base-commit: fb51e39dfaea5b5990e783e53c657534a37987d6
-- 
2.56.0

