Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036419;
	b=EUyrzyjX7xLDssVcg7HZC7BOnWTBEGLrfe9TBuvoeaT/o5cGWyADRCM+Ec/veBHEwOc2
	 17cKBIKbG5aErXhRh+F4R9GXSbOSxynM4LckSf7uyBWNhrw1ADqLSHES/FynIx/jfPlSA
	 pubKNlyHzE3YwSUn7JsJoAuuFKVCUQoOyyAxr/1Z5BnvYJ7eyJMbUVUzZ7EAc/FuuGSb6
	 H2zepNYdGIIVoi7+PmQZxtywhSzJ2AwpQcgfm2Ju6f9lYqPdbkSot4dUFgINcYygMZlqv
	 t9Dvh0VCWxWFJ/rndInFq+f269oFSNJlKLx7ug4gT91+4ivE6jqfGmabmS7WJ1cva9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSwvgBY5tKnxuW7xy2pwUvdfMnozikmSscxGDiw6G2I=;
	b=qMKXv0XO4TNgNR9pyYJ601US2D+daoAZdDoqgi6sawIpR2wKJFUOe8V5zzBP2eOqFef6
	 BjvCIt03UgDbgRwgVqTfTeTIHrMD/0z6m3iYO/uLK+I1rd0F4HlFmaq4zl3o5OTYFzJC9
	 3iIvSs2ZVTVzLgAHKtQUjzEVdzuzyHymgnNjrR/m37JUogZ7bYP4/NooN21lG63tHeBS6
	 KdFfzsTd1VHikzU/uzhRTlJTqCdiSbONDfST1u4InLfId+jCpeia8FuTGwbF21B6nQ59o
	 W1DX8TLEN4JwLBxBJS1YNOZoHOk241kT9JKQwJECrQGJyhr2MxW06eOSlDeibu0/uDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQPugjLI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2944A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2944A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQPugjLI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17523005e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794036417; x=1794641217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSwvgBY5tKnxuW7xy2pwUvdfMnozikmSscxGDiw6G2I=;
        b=PQPugjLInEABVjaemwtq7Hu8bTFa2wVlgSheOLBj1ew76vrFonee9caA3Yqej2AkYO
         TxHEEixr8E5yJ0bQp2o1uyHpd9zyym8zxBJXbt/XDerDBsr9Q7HZi/373arHH6yrOQxI
         E514PhTSAscHwrdKYHRiGizCCh6z4DQjjhAQN4syvRjQfZbIB+hRrcFao6nTUrnB5LUi
         BKUB5lD0ESlT/Dof/Sb88v7mcwECxkCTrpJqe4bqNP4rUZiBbILHRLDi5fPdqS3iYuMl
         2p13t9zik0xEVaMfekckwFJsqTbjhZ9fTBV9vSATdAmIvMzKtOMeuHWpFh6o8LSg7GF2
         Gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036417; x=1794641217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSwvgBY5tKnxuW7xy2pwUvdfMnozikmSscxGDiw6G2I=;
        b=b1frMR4voVmjAy7C2UUXuoBXl/HXD+tq+lv7N+4Nc+GRJhsYJhDV4UGcrqkNkignRT
         cCaW6hM5FBYzJm6p9deudNTc5QC1MnDUp5L9OSBd+A/MafcuhiwtvhNQ5SQo7OaVOdto
         yQ8em3ucINJgDMGoIaupGJ11uRcGkPOJN2ICYewvJb0pNe8jE7t6jCmPICzMF3wCiSTs
         SoiDvQe4tHK/F8Ev5anPXQpHJhTXwVTsWh9jMDxTZbBs6Lo4s40V8BBl74hQRw4PK9jJ
         iVZuTG+QO665B3jp2qltGQH/qSo8Lw4txJ5dZ9Xykb9EAjSrNg1NWV0PnkWTdoccgBEV
         I9nA==
X-Forwarded-Encrypted: i=1; AKwUvByC5ZCFTX05jbx3o2RtMbKwsvQc4/LpjdH4susrXpzerdolCPjIgRzZZkEx0DUw3Jt19DDn9ssRQ9hVUqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q63ffJpP0VBflJkyTvO+V65shcF4m6VY1gKOx6CZzgyaJgdve
	bQi0niE/1ro4NKi9G9B2Msxe7Nn/ig5cCjgPqmiFH+U874xgzEcBZqF2
X-Gm-Gg: AYBFou2cIf6UZt6vFV2j4kBzL10Ypgya3Na50qfGiYZl3P6xaz4XqiIrFfSXjNAE9E/
	X9CF7DbOj1zRlwhaSHRVDHlQEtvLrSyoYf9paBBfho/M+nutGzJheCUXD+S+1+Gp4hx8bsQOpK0
	OjtghJT8/dKLaqlloBdDJpnxhxUhNcucsjRwr94g0pSNSnKRcZNRjT6WtQYPpDevuEkkP4iw+n2
	eCU4sziFAk7mxbbNEkvId1yxxkwMCKclfIPQsSOMbUm8kSl1ORAS6pKsGFxMXP+L6EA4pfLpJ4r
	ndbxpYtRloOPL8Eru4EnnRTL8lrrp/jdvce43+ROCAyLNSxILa3r+SpRwIWHLlRX3bgyOXtGd9k
	JnTcvFbgatqgCRCPjncyaDpvJ16mhLOezGgf+oiB7pkVgiVVy0+Jr2fBdnkrAyWXm3Gyp4BAst0
	8sMn27RrET4odPjo4uTZvc6JyMZBZ+l+bV/y45NKHrDvvp0FR5BnNIoti4rYeSJnINN9C1V9ddC
	5pnqBPGmqRhnnM+yF4kb+HqD6/Bd4CArKBljWtmExzkpCJfATDABqcCBTHhni4mw2h/4AJP6l9a
	CglocLw2lwnWZ12BDqLeZlWUOI14AMs/MPw8gJz/0DyldIp7rXTxY9N/FCBMxtOCE79Q65iYHqs
	Ve65fHXf0AQGmb7coWCw8RxDagnYvpFnSS4zl+Fhp/qecjZBahNU=
X-Received: by 2002:a05:600c:34ca:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4b6df212530mr76856485e9.16.1794036417341;
        Fri, 06 Nov 2026 23:26:57 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([129.45.78.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3283b50sm41843175e9.10.2026.11.06.23.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:26:56 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dm cache: fix divide error in too_many_discard_blocks
Date: Sat,  7 Nov 2026 08:26:48 +0100
Message-ID: <20261107072648.554-1-drifabdelmalekmohamedsaid@gmail.com>
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

too_many_discard_blocks() uses sector_div(), whose divisor is a u32.
discard_block_size is a 64-bit sector_t that calculate_discard_block_size()
keeps doubling, so once it reaches a multiple of 2^32 the divisor is
truncated to 0 and the division traps with a divide error. Smaller values
above 2^32 are also silently truncated, giving a wrong quotient.

This needs an origin of more than 2^45 sectors, which is unrealistic (this
is a thing still in 2026!!) for a real device but reachable with a fuzzer.

Switching the div operation to one that uses 64 bits divisor would cause regression,
so we just limit the value of cache->discard_block_size to U32_MAX.

Reported-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3e16980543e238b95bd1
Fixes: 08b184514f65 (" dm cache: revert "prevent corruption caused by discard_block_size > cache_block_size" ")
Tested-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/md/dm-cache-target.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..b51ceca60afc 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2383,6 +2383,8 @@ static int create_cache_policy(struct cache *cache, struct cache_args *ca,
 static bool too_many_discard_blocks(sector_t discard_block_size,
 				    sector_t origin_size)
 {
+	if (discard_block_size > U32_MAX / 2)
+		return false;
 	(void) sector_div(origin_size, discard_block_size);
 
 	return origin_size > MAX_DISCARD_BLOCKS;
-- 
2.47.3

