Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268869;
	b=KoCi2FfA8T7xJRiAgZElvbzo99j5hA0dIaEeJJnK0jTFu+FpenI8aJLN+YJZ80bO/Hdc
	 Kx061d0j7/qo7wAwRn+njtqIK7vHZM5llE9UVLCHrcZBS69yX/YZDmr4Bek0npaLThcoI
	 Hl0eroqtVDlNQsF7q+dkGuiKbqmU041AnqJ10ORTGmd7jY6NgPZFcTaw8IzIoAKU/NjEx
	 bck3KAkXNUMK1CyavmXBdRyLrA41FkWgGEu4cy7wbve994StqYylbUWsK2rbw1uyJ+4d+
	 e/9CNHl5DkYoNShGuse48NBjy7MYEPPgcd9PXf7gSQS3sBHFVa2pnC9PhvZ9+q6x3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
	b=QmQ+Sngfp1yXxk+GA7Bc5mxz+GdRFgusw9yZMu63eEtUf/TXcdag8ntmqx9kjg5Q8eY2
	 QRD+G/+3lm5BQlp27LQ2Q5BXaV+oK4pw2pYkhnZ0g3sYzt5mF/J6qn5rgJtlSQ1hrYdPF
	 tIcLIZqYXHp62oozl7kMyTKTFIWSsyVZVOGSg2spVfwVWqWliaETNFRJaBQcYWTk/LpmH
	 K3tQJj3tXN9PkHh/toaW+sw52JqLwhXLHUM2mH2CuOuDb7H4/FIssEqtzd1uqEPfoCHjT
	 mlP/KpMVPM35mLIaGDy+17stosKR7AawUemz0etRQv7Jv6HvWJ6dmgs6J+P95qT7qSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FleZqdr+;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7960A5BC8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE7960A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FleZqdr+
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso1438786a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268867; x=1794873667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
        b=FleZqdr+Sj7u5KHxSqJByB4AQLOOCV3Tqp/tItyRE66214ay7eUXn/EWeGrBbzh6dJ
         +KDoMg70yV98bTSk+R5L8RURL0zeKqm3GHSwvKjmVAGaWp7pxOK/X7sIY1ESBLiYEeen
         fYhYcaI1SXVW35QMv7KZ9qLtj5UzP9tOIfHHKBQZrroksflIbHT+dwGXHdap1J9acu4H
         2yaYyHvbiXSG82LSMKHEfLJrrOceWZUdgQLcGOI3dJth7Qeu3V0h+691i+cYL6ZI7fe/
         nx42Qgs+HgsyTntwmgOqvLGwWqiYwJrT7OlcZOLQ4jWLfgwBsM+PDy+FUK42ZAMy4gDW
         HDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268867; x=1794873667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
        b=x4zpwCtSM1fpZKnJUn0suC6xBOowkYcB7yoYF4HqAhAVo8mOuMQu5GsoRyRS2QI99y
         fCmjEEYAYeyo59Ijz9MzuHKEAwAgawh1MthZQ+DfQsXNcL/7lGjZOKOsS4Rslpw5fsWd
         hCblWl8PWSoOHvZVSMzKHfOkkBm9k5IIoZiEUVNoktlxFIT97aWk3pmiY8LYdrqcR28p
         95LKKlBHAVJRuudoDKzUvHX0ZRfnwxYz7lUx9uckKwrcSIISjRDljf8vK7QH8Hwd0Nhq
         LmgIxCZs66ragdONdZOpC6zm2MSJ85jiId3TEECU5V1wpwYaPK3H5WqEtY6yPCOa3s1X
         YoJA==
X-Forwarded-Encrypted: i=1; AL+hErGBIomb/g5Dmc4NZr8KODwlVQIUUUJA+GZokrDPaNLLX5oJ49Y51rneK/eUoz23WNubEGmz3K/flviMrlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ujaeEAbRk4feXS5shb7+GIAQwu9X9GRk7DU1rzTRh2QrmNOfi
	dr74dhVH8U4CkqcJbyhuEIDSIwwaIz7dkHkjTPhuDQmie4pL8wIN7ush
X-Gm-Gg: AYBFou2NaNHWt1PIEKbJsy6dR5WZrfkH8smT5+uNVLaviQi5fBuS0Xq4dbb+WJ9mwSC
	DINO54r/AcAUfCr6Ifljv/eqiT7zFcXdaG12FgaQ/XhlcxAouZ7B3h9mp5vxg2jVfxT5UNmdhFX
	ddTkURzW+Y54YCwBl4hxIaldy8g/fG+sHSFV9xq/CQYbCPS+5aYuGrkHQ8k4ql5wmW7sy6x9jIv
	IK9Keg06qv1eco4a+mi+rgOvOMLSSNBqvl2A+V+S3jc3U4wiOT/lCB0g5Fv61+Rdwzpk8NICckG
	gZhAaZ6XGHyCxFbxo7y0aD6+T0N8Q6ofWEbaSHJa2SSLtBQAMH9f9ocpMgRmJGUBWjwFE8NOcwK
	/qS4gSlRyS/PqJnCZFrUGuUgozpHPK8b6n0ze/jqx4g8hxhTR3VPfrXU+K5JbqfnmmMyNQmK9gY
	j/P67gi19LYM3/UQPPFRrcRZfQGRq0QqJNsISovjTOvibDt3+E5M9QwG2YzkWspTPIstsjon0KV
	IkRbjLRicSdFVM6Q6u6hhpxmOgvEhit3g+/wHzaYnp8PlY2bY65qQeBcrvtqN+wJqRlCORiO1TV
	TPRiBCD9gwVVCe3IFJFCTiT31aAry+vN9/fW/9NXoMQ=
X-Received: by 2002:a05:6808:1307:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-5683cc18827mr1019924b6e.27.1794268867525;
        Mon, 09 Nov 2026 16:01:07 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:06 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 6/6] tools/include: fix signed shift overflow in 32-bit unaligned accessors
Date: Mon,  9 Nov 2026 18:00:03 -0600
Message-Id: <20261110000003.1719966-7-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

In __get_unaligned_le32() and __get_unaligned_be32() the most significant
byte is promoted to int before being shifted left by 24. If the byte is
0x80 or higher, the result does not fit in an int, which is undefined
behaviour. This happens for every kernel virtual address, e.g. in
sorttable, and UBSan reports:

  tools/include/tools/le_byteshift.h:14: runtime error: left shift of
  255 by 24 places cannot be represented in type 'int'

Cast the byte to uint32_t before shifting.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: a07f7672d7cf ("tools/include: Add byteshift headers for endian access")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/include/tools/be_byteshift.h | 2 +-
 tools/include/tools/le_byteshift.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/tools/be_byteshift.h b/tools/include/tools/be_byteshift.h
index f7d1d1698938..2bda8d199c85 100644
--- a/tools/include/tools/be_byteshift.h
+++ b/tools/include/tools/be_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_be16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_be32(const uint8_t *p)
 {
-	return p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
+	return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
 }
 
 static inline uint64_t __get_unaligned_be64(const uint8_t *p)
diff --git a/tools/include/tools/le_byteshift.h b/tools/include/tools/le_byteshift.h
index dc8565f39717..e5c78a48a78f 100644
--- a/tools/include/tools/le_byteshift.h
+++ b/tools/include/tools/le_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_le16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_le32(const uint8_t *p)
 {
-	return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24;
+	return p[0] | p[1] << 8 | p[2] << 16 | (uint32_t)p[3] << 24;
 }
 
 static inline uint64_t __get_unaligned_le64(const uint8_t *p)
-- 
2.34.1

