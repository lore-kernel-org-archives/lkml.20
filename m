Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763771;
	b=MZZwhCxKSLxRGXtqvwnmccizMcGf1ezIybneUzJ5wUnA/mcFMy63JUtq+clTJjA43PRA
	 GpVmUHVQltKn3iXHe2BOwZxF1H4lNGHPYyPfluiT+4XzGl5DdwPzYeGeBiASrEQOLDxZo
	 sy/xRpQnUGQzmuaZCq+5KdNesTkLLDKpXEwhGkTPiJx6HYMzXMw8bFVWuZu6E4IeOcIRW
	 ctRsKIIzswVpOtrw1jahJ2QjoGw8nnsZejFpwC8q8cWrrFz/nmenH8FZqHZqU7+9h1YY6
	 5augElGYRfJagaOP4aSt/U82qvktI1Aj97eY4XOluixtnSMYS8ufKfgUKbB64hqEa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
	b=q1VMY32MRGzzGxBZHp+1GtjVnLPstV44RCV/e8enHisyoMMcfMk+c/Te0WSJOav7A1Qz
	 +H2NXMR+23F2MaTh3vcoUhnZUTdZkXJ/YtmUclOrLq6+rlIvt3uR2t+zm/Yg9RksuDh3i
	 r/pWr+TAaXjUg55ZxnHzwXpkg93UxSMRlHeVe1pb0iYtomQe1qlO3er2GEBMoV4V4Z2/a
	 SCH8AlhsAsnBvJhliWu8AK7+v5lxxviVFmL5O2qlMo4GhS96hFZyMSi8OxBOsAVyX7MmB
	 QvJm1RannPvMPU5PR9YA8llhEMxDlkbrBWVKtnIGVti59zirSSvVO6cJD0jDXr9M7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppQiZeoh;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1563606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1563606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppQiZeoh
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so3526959c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763770; x=1795368570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
        b=ppQiZeoh0FVdpP9Xa16prSfNu4WSWlx0pUU7ZTLLdekdoDM5MR9lSrn149hnYlv0Cl
         4IHqfGMh1kMpLXX7FLL0zgIfJBsjmzdJAJqrlnCcirq3JuzwiaMVCRay/9UexxUsHuaI
         nt4/0wdpv/159NkuQI21t8FxWblMHWUhMA7F2QmyHow7YupO0nNzfB4KUkb/1FVEYFmo
         Llys6INOmxBlPq8m1w9aCOKs3TNk9e+eAc+H5BY/+bW7vcPwoj60RVrUgl0mgku6HmXH
         WZpwaIrDFB1ljuG1B+2QIplym/fASICwbOIcHvkEAFuafTXTDwgsJpo03UDKeFt/UjFd
         kdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763770; x=1795368570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
        b=sVkT6QJGaWd/4oCiXz+7JQf4KrZmKVaJxj3vRO2hmcMBLnGq0OBwUkx1+ixLYqOzIn
         v6Uf7tmcve2DnVlA30pdX4wJY0DI0BnBNEbD3eborQXqIUagFM5sy/pfNYWjispy4vy/
         BwSG/F3mAMkgAl1kGjjscgdm/e0qTMKMpSoMZAeYyKcctNHqSmmRTuCmGpMPMncM7rtO
         Q7g27zG19PDRKDyBWceIc31SB8xHh/VUSW7vvFeGbNaulETq1n/hxA2MojW8drh1hmHU
         Q4Y0M7fmk4zZvFs0rAKznK3q4KifecatpbHeLYu+u5dY/AYp2a+gTBhxa9AoQurMqfqk
         Jo3g==
X-Forwarded-Encrypted: i=1; AL+hErHEKEKfOO2mKiuc2WKmAGMN9MjcqezDWDE+tqFrDeYY28BRbWZpsa4SxVTZdHVoXDxh6Fo9Tnm+VmyISZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/af7bz5O/SS6Aamc5XluvC2ON6GAsUJ8QHLO+QnVc2x/fWzScD
	HvUPID6RWfEzCCUo4HsgC9+CtJjKwL7cZTUCfNZCchT530OgdKMyInEK/vjNhyt9
X-Gm-Gg: AYBFou02JUvdxXPy1Qs6FUWTi82Dr0n655VYwqZjWTnVWrW8fnR2JHk9CyAVF4ERWFT
	e+ggIok+Yzt/7e1l/SEH62XNDoTvwvFKk8mXQuQKPeZ1qmTDq6ACEoPJ7vqRRc+xSa/xTdBA8z9
	cglAazb2MHHfY8YHeci/5+p9HFgsVxN+SCBJjgdOkwUPGZGpn+zcpBrWTDUUcS6sNB1hOEWRwtx
	3wNTcGT1/dKjmDIfDt3dtQynu2grVghJM6bU7Lh3nJSmAQRCtYEOCotjn4QgR4Sia2yZ4rPlerO
	mnKKVyImBmFe2C3nI7K0/FDBdR9dNw4Qc6KEpJPYYAETweNxwVIVvYfbyhHlf1FEhVnb/JfldEd
	WSHooBzxuMNXIEtLIceYI0fouFQpMlPBKTfBch6Zs+25Djl+HlJziwqMkhFzSr0RwLhm7v9ZV07
	nKlYXzv1MFJYTEnv6rg83DuRWwZMv2ZZqVbZroq6ZdvczWmyCl6MlIuq0ED4bxi1IeksbVVSqVJ
	AVWvSrSy/k168AZDLUjD6q7bp3/p86hziQfxg/HSXzZQi4cicUt+yoMEMSKAGF3SW/8DguGzk/5
	jzwzAmNoaCKd286m28sLEfKaVoAqu+IDKDY3ZL2UtMSS4t89eOvv44sSMBgR
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr7011216c88.6.1794763769666;
        Sun, 15 Nov 2026 09:29:29 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm21618268c88.1.2026.11.15.09.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:29:29 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Po-Hao Huang <phhuang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: rtw89: update PN state only from correctly decrypted frames
Date: Mon, 16 Nov 2026 01:27:54 +0800
Message-ID: <20261115172754.35124-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rtw89_core_skb_pn_valid() records the sequence and packet numbers of
hardware-decrypted QoS data frames so that it can drop frames whose
sequence number goes backwards while the PN advances. It runs before
mac80211 discards frames with an ICV/MIC or FCS error and requires only
hw_dec, so a frame that failed decryption still updates last_sn and
last_pn. Such a frame need not come from the peer. One with an advanced
sequence number and a PN between the recorded PN and the peer's next
one makes the check drop the peer's following valid frames until their
sequence numbers catch up.

Skip frames that rtw89_core_update_rx_status() does not report to
mac80211 as decrypted, or reports with an FCS error.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnormal PN")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 58ee5efc3b5e..a173253d51ff 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -3950,7 +3950,8 @@ static bool rtw89_core_skb_pn_valid(struct rtw89_dev *rtwdev,
 	if (!ieee80211_is_data_qos(hdr->frame_control))
 		return true;
 
-	if (!desc_info->hw_dec || !desc_info->addr1_match)
+	if (!desc_info->hw_dec || desc_info->sw_dec || desc_info->icv_err ||
+	    desc_info->crc32_err || !desc_info->addr1_match)
 		return true;
 
 	guard(rcu)();

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

