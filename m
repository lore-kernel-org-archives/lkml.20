Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142257;
	b=aAITEYDbaowLF7l7e8m5aRXhlCtEM4mb7eTDpMgEAsObr/ZrQWBgVBBP40GIOuziTNxS
	 UVZBWzZqyBFl7d4bWMR3/HGDK3bJCuSzbjnmPTGfe5ZkxxIV3s+D2EzcWGUt08eO+b2JC
	 bc+kayjkZMj/7QON+7wI4xzgJxrew2EjN/D9dJvEMhZC+QaUnJGibvlPyxeTVAvbTD8BV
	 ejUgKTOy9P1XngcXR812BQpILhEURGPfJwU233q5ZRXr7ZAH4sArgkYizmdgtI7dnIrAt
	 Fd0byRjh6GfFRFEHZv79SFvgHQrOsSgAT14bKe5mwUF7kzQSgG9+a0chJn0ekE+r2wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CBqySVJkYZ3V4pcutw3q75Mc5exUd/PgRrxhtsJ1kBg=;
	b=DBvC8toAShknISnWNHNRiCLBcbGYZ8cvv2mGau6Vhe5kxC9oiUcrNXRAZg7abImgMB2K
	 EGRVc8ajTqt1rTYI4nnAIAlWHuyjwW0QdzZJuX1mfhOc6syNqhfZ/URE9rViH+1PI5zxJ
	 SYNz8KNYLH9yJ11ckejSU9IUlHVkSt9navGY4fRFjQy9UBlJdIX+NY34kCK0GcMEmUzKP
	 1mzjnqXywGyoRrkRiXOkLcBfN0oMSNlfpUa98mqdUiGcAcL4Wvn/fqtaOiqCMLnGG2Nvn
	 13yhAFJUAt+my+5bVNeF+4fBi4qIyoSFS0/4wtkH7gZY9hkpmbpR/j8/XMS/zsxfP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uepg/btE";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035B606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A035B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uepg/btE
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so37614f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142255; x=1794747055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBqySVJkYZ3V4pcutw3q75Mc5exUd/PgRrxhtsJ1kBg=;
        b=uepg/btEh1J6bzh+gCN9Zj151yxywAD+XZyJKu18FAlnmkYGvq9vMoe6aQHBM1R6uF
         AnFnlIyP2ySnYWchtG2uv4R6ZSxMvxqSAh33/wTEqSI1NGBHxaGoQKNrG2ro2fwHqQg5
         jfNoUQ/LZi9mi2IZdDIv8eaya8PVhQKP3xG7uYj8v29Fdgdjym5PRGWjQKk0DIqdeX2G
         bcmgmsb0hjv1ENLFfU+sILBcNSwGPGHniEziDKM2XXmbIGo9k+B6GskpKTTGXdQ7QHv9
         2laYe09lrVfLN/6gJtUR3JUO+IMnPbyAp2ZF9WQMGDTb976f4wZ+7N9NYUgofancqiEP
         QjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142255; x=1794747055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBqySVJkYZ3V4pcutw3q75Mc5exUd/PgRrxhtsJ1kBg=;
        b=wosus44F7zBVOl/B/oEaAZ5Jpvs1qQGZYm/U6OYkaHYf2QKCB1VmdSTZnVplw4gtXh
         ggBzHCHxBdVx2PXMqNc+yREHsLWTO65t6EYi3wdUQLC+9qlydaG7pco24Bj4Kkkgw1br
         OB7bOiqzo9UnmgqMSSkN4wQuYVzkowdeG759lXpRL55VsiDNcQyru4XjdXJHp1IEUiF0
         X/J0n0ZBL3gLMa8yIgay5VxnJxUrldUZpsg3vqlELn7q3Dx4c90TfSSIWA1jkX7Ukoub
         z9Fd3Ovtsc1RkuLDb87GfDz/MKBbKIXiSO6F7LGTxgpiHfSql+z64ov54dRr31wZVTTO
         3Lsg==
X-Gm-Message-State: APuU4Z/beP5EhIySbRiGMjdDW41Q69mGlOadlgzJq4+13AhckFDLKnVj
	i76nFtImOmtU7qypr9vmbXy2eRRDK//oQXMSbcTvyzwY7j6buo+YoDz2
X-Gm-Gg: AYBFou1UP0HsxaNjvxC/cAjXkerwh6j6U2PnFf8KgEkphhc4BTencvdjsbbSIDHGbPL
	cEaPgAWw+tCj+c1SIDLce7XKml9hJRZcjI7mipoF2Qf/GNu5SZPA9b7m6tMW50hMOGrUKgVbRrx
	4Sv/GQ0ZNZ5Tz8TIQfC1TJj+l1NnkLjbBY3btBaoQqGi4s/CIdvsBFOYv5mam0lABtfW4/NqYjE
	t8lRinvggirNZHMz3ATSyOjTiSk+JxHEe4dlt5pn292Vm6Dft8TH3Rq9C6uiSIIREjEFR/sSRAv
	jQQ1U7P323IpQifUcU4ULSBuJ56e4ISYj3gZdVwpjsm1etkCZqTsBn7GKarprXHQhAAK54tOklG
	mv/WW/jXXORmr0LRHuRFUfvCzTFoWV3JLeWzktFqIyrWjUgvcdWHJbjuVbij3DwswcWRWhhL6oX
	shAqMgU6N4f8TJiqQfkeg5t9yo/BfhA2f5PsI7250+8tIreSZSNKX5/ui5fxNU0hReeijZiuZNl
	U5nJ0LQxhegaixbkCyHDc8vpjW40SLpTfkx9apJDwc/uqEFaAnb9lrVmvye3oZdxov2FT4Erssh
	rJTIgj4Ze59k0YBupL8IKP0DUNQOusLwMa/AKrzCCVI=
X-Received: by 2002:a05:6000:2881:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-495842b8bc6mr3133440f8f.39.1794142254769;
        Sun, 08 Nov 2026 04:50:54 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495e725c4ccsm2177680f8f.53.2026.11.08.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:50:54 -0800 (PST)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] tty: n_null: remove legacy BUG_ON() from module initialization
Date: Sun,  8 Nov 2026 15:50:31 +0300
Message-ID: <20261108125031.33753-1-bramwelbarack89@gmail.com>
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

The use of BUG_ON() in module initialization paths is heavily deprecated
as it triggers a kernel panic and crashes the entire system for non-fatal
registration failures. If tty_register_ldisc() fails (e.g., if the slot
is already occupied), it should be handled gracefully.

Modernize the initialization path by capturing the return value of
tty_register_ldisc(), logging a clean error message via pr_err(), and
propagating the error code back up to the module loader.

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/n_null.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/n_null.c b/drivers/tty/n_null.c
index 5a429d923eb3..886f6789f872 100644
--- a/drivers/tty/n_null.c
+++ b/drivers/tty/n_null.c
@@ -32,7 +32,14 @@ static struct tty_ldisc_ops null_ldisc = {
 
 static int __init n_null_init(void)
 {
-	BUG_ON(tty_register_ldisc(&null_ldisc));
+	int ret;
+
+	ret = tty_register_ldisc(&null_ldisc);
+	if (ret) {
+		pr_err("n_null: failed to register line discipline (%d)\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.56.0

