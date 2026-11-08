Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150859;
	b=Kl7lw08/YbL3KmprmHeAJJ9uwqcIL3AplWGPGiLxnswJtHsLswKXKV/rLExlRecvV6F0
	 +VzBvutzIDMYwywOOatJsfnLauKsfgL6QBuV51NrB1Mi4UOGs6FVRQGhR7xnA1ukr9v0m
	 MeZZrpBgKlrAivJnEt0tYmXBnvsZEylMBYtnu+isKLvnSuxlADxSwD4nSze1lnFWkcv4J
	 s8/7ncFIdn+KjO6DJFSScMyiTGc6LAuyiTGJWXIYCTHGgyaGm5iUMwx1LwtUKPid96V0U
	 PuoQOcRni4ey08773jwbjNfvbV+2Wl9BZNGVQdtsS6WLsLS1ZCYKDVS+PISZuFN4nqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
	b=DwB434qOhrlFGv4DAbB3YS01AspKNgX7PE9kHaCGZs2LJIFIEhHhrllysRfoVbPIF6ih
	 IuK3Vas4wq6SwySOr2kr7fgAyoQ4sMKQkSsRGhYCVu5n1P8x+b2qH6Je3DcS+wtpI3hWW
	 RAuGAtR/enZ4nnntNbVJyl+9OTPBz0DGy0CbUE+Tpd+m77zOewwIwNTgEHIWgqTHmrJ/9
	 3lyMGbBsKHm4rIJcS2ZSr4y4TLDwvdtqTgxyLNWhrlj2lw9ALuqiiqQ5igiYQ3/pHa+AJ
	 kbqxTBTSQXCDBhnTLhuNXHZzj8AKOLm+4SqLNN7GXY12vSPEYm9hUb5y/Em73dEDUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38055606D805
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38055606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4550d8ab15so16433666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150857; x=1794755657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=SLjObtj7/Fp3dgIFTi3UjH0YGrY2bxl4pTuH0ES0JMPioOhMehJAuxU6KqPLJjweYp
         6WTM/vrriAK4E2fiF3ofkeCOhGiN6VajHpw1aZ/5U8BsUEwmpPHqShyIIr4vHTF2olfc
         yN/LnftO/mctJttSbJRTqz1SnKaOGxdM7keXwkr2U1DhPZi6YeW/YfQQ3Sj+TnMzJ8Uu
         bgWu9G/IgcCTyg9lywM3vGYSZwVEDnDgZm1VayIYgfIkRhsLWkFF1LNkj8emLNA62KJh
         uzQaqif5d2aCHX3UFv/nVlIQSENYKqP1ozoEhNfhq73+Tz+C4Nlu46EQqfCptzX4uQ/J
         BAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150857; x=1794755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=BaxfOuZTTLWt0PgqXvSHoLExR9H7G1h+z0OHHP6qJnbirJqcRscyHxa5s9PgcBEvYB
         jAGPezxjitDpRXNAIjnDWllV4Qe2xkEHmBmOd2fbimbaEA9it3RJ6oqeBZwBGO6sGyaZ
         ETzsSxkEtIS3KII9LqhvjH6FfmYxu9wDgZv60PbrnYmxXMVOx13A9iYigPrdFt2BQGbY
         RI0ahBY9BieE9J/Te+Mr3Tjl2q5VjWSLILmp8WEDb7/+DcfAvI3KqZRdKWOSJU3Hu4r7
         JCkl2Q6WyYBDC7Yhg0fTVfA47cRNPgXpqnHrseS+Ho2vx8u+V0MJuTUWbouPkpCJiu+3
         SZgA==
X-Gm-Message-State: APuU4Z/1SpTJoEVi4glw2KybJNR3YKlD93wUnNFEUfk/oH04HZatCgVY
	HW5YRqlfECmQZxhJLC6xkh72/yQw/CHmQ0KsC5V4Kwb6liZUnr35SRXf
X-Gm-Gg: AYBFou0tOJqmSoVBNQUdJONPnFM2RyIKqjzKGZ8ZMAcUIrL82hIsoPaY4WPNALqQXrb
	DcDyeAWSaLkYH6Nxiutyha69zrPzOhYmki7+hlVXZRBa94UZedvQWXBew8X6VJ/YyqjCdjmrmWU
	ArbYTdyLG1JPKhXESFHL3HLXJuiW/IEwUi95HYe50DUtMHVJyhv/qWVzvZ4QxLBbBbJCCC1cNCM
	VP2QvB5EAjv91kacb2kIGd608FG+qUyhSDMK5JSB3TXZiKitvUO7VLbRd3JZpu0QS+xHXwqT9uH
	Iw0QZSEBudaLKYGoe59R/RxYIuSaUk0BdrinQzPxaudU/d3LilNN8QwKoilNVylqIwPYKJbZP/q
	46BM04B54tfooddmUM7o9a7p4PWgPma2jrMKTmrrs+r0VcEUdCF1F+ANDWUdwsS1HqvRbX3A8Ig
	7jDwjiOeuUli1ejPCbuTBjLtH1iA6CQAix2P9ixLSYXSvAswS1comkpUb3ejLeTMsC5z/lZYFVI
	sTzlwo0uoqcDORrK53Zi/IZdvpz79fXLSLEv30ztGgJJW2fUoQf34nVD+5DZd6ugOj2MML4ejKq
	P2Q8BtWtBa7O0KLjUpU+6Adg3RZi8a5oHMYfc+BLM+ivDaAMRpcY3K15QlA349bjcu6/Z/3a23G
	YcZGBHeNDtQ==
X-Received: by 2002:a17:906:7308:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4d6d8d6fbbmr119323666b.46.1794150857516;
        Sun, 08 Nov 2026 07:14:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 3/3] mfd: max8907: Add LED cell
Date: Sun,  8 Nov 2026 17:13:48 +0200
Message-ID: <20261108151348.204182-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

