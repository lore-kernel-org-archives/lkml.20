Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336257;
	b=Hq42SQ1CIkr9W/bwuWwaf2DZU25FWERYkkwxa3ZSlQ4AERrE/9oIIoTq8l+gRyZsO1q3
	 7SvBqN8NklGQTSP287CaumKrhr2aI4SYFWXDOwRd08lnRA8VebNpzN9aSHPmWNtU5Qc+y
	 xLnHHL7gHL+pn/UzP3vQKValS8OngvGTBbc/GLROC+iORK0S46RwfXsupcvTTRhS2iZO5
	 S0Ecw+eu9drYA0YFyuACjwhIOxaRph1kgqHiICzIGxvjoa4YT40jaGC/W2HvoOrmcej3E
	 QQ6AcS9TZ7CVferfCxor9s5FPUZE09+rk75ByMfJ/hkEICEmh5dgYGtBsAZg7n4kJYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
	b=qsNtfCrBbGCSulypuVmCNQivc5FeHKrfenEMsG+Eb2Oxyu1qbojIT3VfURpv7SU+F6jv
	 VZF8aFeAXUgI5dVGXU3bQ8yh/g8/z7rbrHGgeacvlVPgH/AoWXDqTXsVbLRmSNvNhSQxz
	 /XkGBWK7XL2rMfwqRJDTERn+LOZB2uBi7ztOP0o9WFvbx2J/EmjR6WiEEX5D9+ug0FzTR
	 BGXZ9OUonKW3JJ9wAyyVXuVWW9oTkOMvHUrNOKS0lHx49cUVc1d9BoMrjPKNAu08ZoP4w
	 KU16XiyI+P4QbO83UV6AW5CIIvHa4Mc3Jn3ftYBwwrpWEQDTMynp8uZkNb1wjnImBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fanXBjdd;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74A606B5A7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D74A606B5A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fanXBjdd
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6deb848ddd7so1426539eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336256; x=1794941056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
        b=fanXBjddPNz1sRdILWcKLbXrA6LgQADpL5xMD0cLRIQcX0dr7zVN7jr+N9V3HHEwsi
         S946WB7VzXT2tvdLuMPa46vLyTl+9Ynq+tJv8A5SuFtxte5v6WuJSfucSdPaOfT2Qf3U
         4My8ovkVa3HFCidhbLcfgk54eZQFvpIVsSsvJQwdaV5EShj2fPr9LO3a2wypO52tao/j
         ULfikoIrGV2fzOrNb997aJy3VG4yeoEFLqXQSR7j9GlepvvAlR3+ASnfpF9jb0/2bPSr
         RIJ/8UKaEWg7VxfkZupw8k1rkIuAkCR/ritKdv5z31YdR2a75J4bPfKn377tjv37bzWD
         9VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336256; x=1794941056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
        b=yID3qN2BiQG2IxHP/XQbsRYMHhZCAo/WE6xTrIHmpVV2NaYBDIomk2FQguZJvTsfOw
         OAgNOmSbHYp2o1OhJflex7EOe22eTpFdWRKk39W+Nh67zwJm8QcWBh6FNecDyYdAfJZG
         mQHeXnKPuc55oMshltZ2idmdtWPECsYT0dXVjPScD1K/Z7sVv2MNQAFxiWqdQsciRu2p
         Ig3c7hP5N+KTzo/k3V8VFCz91FI2dMhOvNhK89yqbh/LQdgjs4SnesX+PycATQZQ0oNQ
         TzdML8sN2RmGeW3TMoqBolH6tQtHchFoAwokBtffGa95Y821C5NuYTth/olKT4ZdF2Ei
         6Gcg==
X-Forwarded-Encrypted: i=1; AL+hErFB60t6Fi8KDc36pYMwmyZWDwUUYEVmWt6iP7nzJbZ49ZC5J9pqN50BxReaEGx3DG+tmS+BnDo82iYuLhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6uH0Cxd41LmsmyAgGxNi4/97dJw7/uP/zA2kKzCCBXXHL9yZ
	I6bJ9aZ82UB5ByzBf9c8w+cuwut5VWvUgZOA++iiEQ/yh2KXNlL9RJt/HjoKlZEcbFc=
X-Gm-Gg: AYBFou3woAD2EyjxH91W53PTIUXsxgSWMRZrhuivLwCJIK5s9qLcyImeCdZz5uCMEku
	UkiVO7MScCDRVIoeIzkfrYaLtIvgJM1DCXZqNjVbX29ad3QaqiWUl0qmK8rqV0thBaaElO0zfai
	xr8Ifa0VoqZSGKuw40qePQhxu1EiYTr43zAMbV8SoqR2bidmcb0pU745dsNB8eOlb86g+igav1Q
	Old7D1PqSFVRFS7LEp0P8NIy8l0YF0jmMehqHH8JA7hYtL9ma+Sv8a3o/GbP4I4UCwtiDHXldRb
	ffqXe4PdyaB/eHIuQlFjNq4ZA3bgvYCu3f7F2kELwL2lLyvjqKmmwkdbQ5ODjg57sMAUYiIFm4C
	Cb4oJzhLR4iZ1AKZjhdG17jnl5zC36e2PkWd39mIme8MOOh2FD39upsU1R4gbbaowPh+3yrTPcu
	y27BBlEAn7zqL3btxzAKY09scQdeytI9JWBENj+pr2i+k8R0teCEe4biHtlcYOxpvkBuVLXLyxi
	jHkqNeC28slOEWRZRPe/2u52GbH2+i1m9Tq7GRTA0vWafbIMVoqLJtA9+wf85xcsBFXa15ScAly
	xJDCT6+myj2j+9G7yCYmnEGjubcHUcY2YA==
X-Received: by 2002:a05:6820:508b:b0:6c3:19de:d1ef with SMTP id 006d021491bc7-718a5a583a8mr1411991eaf.20.1794336255585;
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 4/6] wifi: rtlwifi: rtl8192se: use ALIGN() for the H2C command length
Date: Tue, 10 Nov 2026 12:44:07 -0600
Message-ID: <20261110184409.42205-5-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

_rtl92s_fill_h2c_cmd() and _rtl92s_get_h2c_cmdlen() round each command
length up to a multiple of 8 with N_BYTE_ALIGMENT() from wifi.h. The
macro spells out the rounding by hand and special cases an alignment
of 1. ALIGN() from <linux/align.h> gives the same result for a power
of two.

Use ALIGN() at both sites and remove the macro together with the
comment block around it, which no longer has anything in it.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c |  4 ++--
 drivers/net/wireless/realtek/rtlwifi/wifi.h         | 13 -------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
index 579b1789d6d1..0719d0bb2cac 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
@@ -431,7 +431,7 @@ static u32 _rtl92s_fill_h2c_cmd(struct sk_buff *skb, u32 h2cbufferlen,
 
 	do {
 		/* 8 - Byte alignment */
-		len = H2C_TX_CMD_HDR_LEN + N_BYTE_ALIGMENT(pcmd_len[i], 8);
+		len = H2C_TX_CMD_HDR_LEN + ALIGN(pcmd_len[i], 8);
 
 		/* Buffer length is not enough */
 		if (h2cbufferlen < totallen + len + tx_desclen)
@@ -484,7 +484,7 @@ static u32 _rtl92s_get_h2c_cmdlen(u32 h2cbufferlen, u32 cmd_num, u32 *pcmd_len)
 
 	do {
 		/* 8 - Byte alignment */
-		len = H2C_TX_CMD_HDR_LEN + N_BYTE_ALIGMENT(pcmd_len[i], 8);
+		len = H2C_TX_CMD_HDR_LEN + ALIGN(pcmd_len[i], 8);
 
 		/* Buffer length is not enough */
 		if (h2cbufferlen < totallen + len + tx_desclen)
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 21a294b80c5b..24c6db867421 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2806,19 +2806,6 @@ enum bt_radio_shared {
 	BT_RADIO_INDIVIDUAL = 1,
 };
 
-/****************************************
- *	mem access macro define start
- *	Call endian free function when
- *	1. Read/write packet content.
- *	2. Before write integer to IO.
- *	3. After read integer from IO.
- ****************************************/
-
-#define	N_BYTE_ALIGMENT(__value, __aligment) ((__aligment == 1) ? \
-	(__value) : (((__value + __aligment - 1) / __aligment) * __aligment))
-
-/* mem access macro define end */
-
 #define byte(x, n) ((x >> (8 * n)) & 0xff)
 
 #define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
-- 
2.43.0

