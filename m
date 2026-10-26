Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013716;
	b=iIeys510Gs13qH7BCC/LMzpAG6IvX9w0oJK5w8yJ7Ump67vsw+SQOEvXa4Gdm1aS5diU
	 oNKSOST/wgJLYegQ4OEsuEs9+4HoVNc67k8+Cw2BFYUZaDyoaIqeUZU0RCh0gLZz5peB0
	 fu+VbfJierNgpGvWImhovC0RUKoztxE8A+LLvfeSQyBtIDj8IOvamYrjlk3Zm5I/3Y4z1
	 yyaOCFppfySPPaux4Ig0PCWFJHP7GVxDtB5j3Tyk8Vn0j91NhWGD45HgeFUodNnIXZXC8
	 9BL0wzN8jXVUMeS+DJm2u7z2fcoFi1rQ+YVZjCcOGtyibZMphWCkPYH6cYVqxaVJXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y17TPOs7l11RYBnKZe+rGQQjDI+pkFbxrNsqaPiSHaw=;
	b=ttiSVmXmNruBBqJmZvUewzaGPL4lQikGvUmEJ6xFYW6GENEOCvXXRSsHicaICe4zxIbr
	 WzdCwgMuYGJfc/XmH0HwwaeSocF/G5w/eZfPU6ia3Vs6sFt0FWfdC1hTJP1iAhjLiY0ve
	 /Mk1Zp+w74L+IRZ9YrxDAs+dyXGHwoM8Zsu5LgjKQGsAV+ahiOM/NbOwfEZ1ORdSL670N
	 B34XA6fAP4g7chkyGeKDoB43Av2BBmxxZoG61TpN3mEtq3DZyBA5IWiyZOMDs3KTzxySG
	 9lLsRqifwG6PEu5GMT0iCxlq/n6omGfhJXMnCY3GzkO/cAd/O13j4xL4wG2HbPFAhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="F7l/I6Kh";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E010606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E010606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F7l/I6Kh
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1673591f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013714; x=1793618514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y17TPOs7l11RYBnKZe+rGQQjDI+pkFbxrNsqaPiSHaw=;
        b=F7l/I6KhnzQvMYptnyBQ8lb8caC+lkU0v7RRGSHSH5jwOyFQUPcR+F74U8mKgLfdXj
         +TubIxKOrMcMreXQ2hrJ01mrwrvjg8VHxJsLd27xQnIUFrSqlNZeJKPvn7OoLRvgE6wa
         +bq928rrZA7RQjFugFTJ1dOyhEmkezoOIb/uP6NH8RvYQw6wt3C6o11zsjQdfo/BwyrN
         eUT/DAV59/QmjXvcaSe5wnH1TMk08i40thR5frnzqLcLT3puEpUDiOmekcngZTK9GP0M
         6CGkbrdU/D+NzXcKvmcp9q24uJFpjMUAwYRNPE7CDz0VVMw0yFS2Pk1t5m0LgZP03d4s
         6neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013714; x=1793618514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y17TPOs7l11RYBnKZe+rGQQjDI+pkFbxrNsqaPiSHaw=;
        b=SY1qPyljXcokP4xFRR0jhySNgC0kTl8bmqYGRe3nX2msuugI67TXRy3I9pFnGA4oF6
         979zAWa+uQQD+3Ymc7OcCNyevAgmF8mRGceXfUypDswnRt5xJ6HpeE1u5VcN9DxVTMsD
         yQHId8t9xuVgPPj/saVDD3/KtlvNsx8ErDbY5Ntcz4tUNQfmve0v4TxtvVW9uQC1cqUl
         RAHDH8Aafi6+TOflTb3qHsP0CWiM//RTskTryvq7wHvpqlf97EAxNPBT9+1iC33/VddT
         66GU8MU0A4cBNUp8yNtp40xv8gw4ScRJ1niVFsqNDCTc8ugVHdqkCjzN263RXjQdTTJ+
         fGrw==
X-Forwarded-Encrypted: i=1; AKwUvByrBa/TsnqYCok9Qcr58e7arTAmf3HWwIihMP/SWuBN65nbsW8K6LCI5d+Tu4ni8MmYAkDYUxz7CiXcqYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGZ99YxaX3tSjTHpY9Nnit62DO+/iNLVKtWX1/DpD4MT1Ls9L8
	TQMRTxoGJfD2A3gmfeI0+Vzr81HJupmLcgmB3s+4GZyQOtyTYTqVweX+Wc4HBmI=
X-Gm-Gg: AYBFou1pRTGwUw94WnkeQcOWhJLkX1DbFQbMmWg9ROIU755QqrL5WT/y5HRbYGyDdzt
	G6eV9baXXP6euzjrkmrVBCWQVEJV7X7y7BOpK+FHR0p9v50y8Hcj7RFjYVdsQg75LgW2CCaU2DN
	Vh31DodCIaKiVF7rxIffkgakwqFftZwQkiMXt5KYtAagZGpV60jpq1YWm4QNczv1TGpqMxOIrE4
	PuLJQ475pQDpwltu9+kvgOJx+7xh2XdX1a59KgHVq30tlU+Lf9eAu5NKvMCVotuqGnjUmwkTp62
	xK4kuvutYDvkABXEEPVR7bMBxdTAz0JdxOW9XGuDYbCqumQkRDu62zCd93bEGqLxMD7hEtMgVzu
	kLaBn0VebrA8a0RJaJrZzuzg63tIwH42toDXkKzrmtxrO6j4IWScTio+j/Skdjtz4O9ZJqQfWUm
	2t6tJEgHoXrpgD8zvwfLG2GP898np9EMlvXxgpHXIvB07nV1OjGnQ+UD0YZvjGyX4neoQh4H+Ni
	/hv7t3drRQwovEWpKI0afHE
X-Received: by 2002:a5d:4ccc:0:b0:48e:bf0:30f with SMTP id ffacd0b85a97d-48e3eb8b7fcmr9371908f8f.34.1793013713782;
        Mon, 26 Oct 2026 04:21:53 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm15048703f8f.56.2026.10.26.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:52 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Christian Lamparter <chunkeey@googlemail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Kees Cook <kees@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 1/3] wifi: carl9170: fix IE parsing loop bounds check
Date: Mon, 26 Oct 2026 11:21:49 +0000
Message-ID: <20261026112151.2515228-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

carl9170_find_ie() iterates over information elements using a loop
condition of while (pos < end). When only one byte remains
(pos == end - 1), the loop body accesses pos[1] which reads one byte
beyond the validated buffer boundary. The read happens in the bounds
check expression pos + 2 + pos[1] > end before the result of that
check can prevent the access.

Fix by tightening the loop condition to while (pos + 2 <= end),
which ensures that at least the IE id (pos[0]) and length (pos[1])
bytes are within bounds before any access.

Fixes: a84fab3cbfdc4 ("carl9170: 802.11 rx/tx processing and usb backend")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/ath/carl9170/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/carl9170/rx.c b/drivers/net/wireless/ath/carl9170/rx.c
index fbe46a5e4e415..de3ee0abd5be2 100644
--- a/drivers/net/wireless/ath/carl9170/rx.c
+++ b/drivers/net/wireless/ath/carl9170/rx.c
@@ -497,7 +497,7 @@ static u8 *carl9170_find_ie(u8 *data, unsigned int len, u8 ie)
 
 	pos = (u8 *)mgmt->u.beacon.variable;
 	end = data + len;
-	while (pos < end) {
+	while (pos + 2 <= end) {
 		if (pos + 2 + pos[1] > end)
 			return NULL;
 
-- 
2.47.3

