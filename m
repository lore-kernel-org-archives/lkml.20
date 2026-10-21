Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566095;
	b=CpFPdIhL8bV+YJi2S+Tnr/A8GhTKTju/y7hghiEyuWOCnQRe98bo6uJ0Xb2hDeMGWpPj
	 +DU48KVPdgEflBywsjhXzB6F+FvVPPX1pVzO+T99B25DXvmDacANQ6SNKY+ZpzIbxc8l5
	 Y/HQHpJWcahzQfu19qqvAPU/QKKmuIZT5OavFJ0uuaFy98e3U4Ojpi4USHxMLps8040CA
	 jY99erFrp7RzeEoz8GD3tW2t3imV7ut2tCDFHlsvR1Plxb9OzzXSYo2Iy3kFlbl6jJKYz
	 HzeSU74/Cvrz4/dKb+XZAyJCOnAkQglSKYBZ0tHGZ5nJAfcnAF8sTa+2jdBbyeQgyiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
	b=PlvchDONT0eAdvYnl5a8L7TwAVU90I63CxETBn/bkbWl41ZO0D/xKOCMrt4Pb++DhJbK
	 296BwveA/PQniuXV+i3qwzFAThyOFgcIGKbdwOy356yD7sBogZj+Gh+sDkFDOx5bpRKr0
	 2XxXvwjeKPULUNrNOR1blHMGBdg45eMg36eMVrkrubu4HIx+LIeTcfrnTB4I3DYbPeGoF
	 jJnFWOSX89iw5JjxnayObf39FS8RKeyZJv84j+ZyubItmsyytFTHgQ2LPH4KVkgatboNc
	 cBm+4txkToH1TWWZNDBymThseE7Vf1OUv4l3L5s1sLcuX+TQE+3f4l+4X8PH6qyZaKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SGW7Q0ft;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D66606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SGW7Q0ft
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso2463185e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566094; x=1793170894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
        b=SGW7Q0fttLjmWUqotImKK51qday3ygIZF/BWjUV6/5sIdnSx9QiZlqCn5e7lnbAj9/
         YUe3NtCDM6q3fQOGY4kRpkhC9NOAkJGA+mj1wFC3KsgSwpH7IO2lRzdDq++b0H1DPlzf
         piO8XlculCU3CYwcq3pA14F25b+JpIxhDIjXDO03WIvQrbH4UXqqNHQVJFfkgJ1aFzEi
         t27e3O9vksuXypmGPcNDNXDHkOJTCD3Qu5CtWytZPizTH+MLxyu8S8Xa6BmFaBrEo92f
         Ws/uuOmnjDaJKhdgUXwdRAmpStM2uihY4XxRpAP/4C3YmQbSoCMfVLoMDWu8/61IvXNI
         FzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566094; x=1793170894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
        b=f196gD8ePlqenToJtP1IR17vOGfpCjtBVARkxLCmRg862cMifD3a0wH8lYLVq0XyTP
         LQQRX6Oh58I+flAcV1LbBsom9lJNfQ6ICAoWs0YfdLLnpQ5WDdtPJ17PUDJd7hksPr7k
         3DH6DjrSF00meXBoIrZzb3Tz4D1I5G86sakdxY+oh/ON2Vd+KbLyQUjOi5LwneTj86lP
         aVb1gSPoVJNni1v9CTuOlrq9ofjNZBGAUFTGciJm0DaklDRUJWHRmxGu6354lZz7gvIc
         lPXt4jIjzVNsbOxQDK6PM6tu8S+XjTNjnwoL1QGadVzjQcvAFOCQhryZFWoaE/DfUxZc
         WFNw==
X-Forwarded-Encrypted: i=1; AKwUvBwp2o0zuObqPufS5QkvhRkYo9JMp+zzmj0wvjNZeOmTeIeQDHtAr5OML+t5V/nibG4ALaZCuD7ihKwEB6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLxHuYD7gcczCvuVaiB8Ou8S6DJNaM7FsdzbUJRCW3qvTtUPTd
	g9DGgJ6C5tOxL1nOcxZPD5+hbKVf/FpImN7kfUkE+tY9/9kVegQB0Hau
X-Gm-Gg: AYBFou2h23ic4jxvXwfOG3jowk372KM7VnzvWRAKiPpULHV0uAtI6huWY5CpfVx8dZZ
	O8jihkr+xWxXQN97/Oja4W52zV4k8yYsjqOGYL2h9k4meSb+QUAGZQjYiirWOn7GqFISsj8MQdq
	sa062jab3yNR87w+GS+LwNowt5LrTSyIRsgae9RPltcLdkAL/Al2Vw867SsA10dLQWgXpbZhJJa
	Zww0Oi9Fta3uq742ncD8xSUWmQ0v4EoEwGGeWTAcQAw7Ibkpc3ATNKwrc6hTmRAzhN7Je0sc6QJ
	RRyvMviJGhiBez67MNA7KS9PCVksgSnwvHYgdbAjeizG22v8jEkkwnuSVPUgCoIOX1nKyDEXJZO
	2Wbm/1ChaEbRcEe4pcQB64BxLQ8mPks9UdPGJkU9bu+z6+VG0lYXcW/9nR+Qun4ZBR8F0Tq78e2
	5QeZVMIivFmjW6hVDqgqowLDym4clvl51u5tvrII3owMmSfCQuYt9D0cZAoV9Xe2qa+L9PUyI+d
	KWgoBy5Xqf0YXCQFdelak5YKsajQmXZZjvLWVP5wsWUdX+I+xtZCbbldJq3bK23zu7W4/0pR65K
	T3BnpTZDBvI=
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr18830225e9.24.1792566093715;
        Wed, 21 Oct 2026 00:01:33 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.246.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm128162135e9.8.2026.10.21.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:01:33 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove extra blank line in os_intfs.c
Date: Wed, 21 Oct 2026 09:59:40 +0300
Message-ID: <20261021065940.863-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Remove a duplicate blank line. Reported by checkpatch.pl.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..231a863317f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -18,7 +18,6 @@ static int rtw_chip_version;
 static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
-
 static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
-- 
2.53.0

