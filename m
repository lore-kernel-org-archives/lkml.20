Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598701;
	b=J9sYfx+oda5jtchYxTGIv5WgF8X7Wxfp80678nBG/7JdiJYopJkd73zmLLC9rHaVNk+P
	 FitEA2kM+rR39FL61Aa83NfN/bj+EGEN9CfbHVZ0HxbJZ5aouQhFFn1BRD/N98lrsDlH6
	 YAHtQiSA/EjjH25P1LFj8mv+qEGNopFA/92g1ofBMvc8ddve+tEYCiiCXxRms6BzABeT5
	 p7MbgOoW52wmR3gb+Q7edubw1c5ewr7mkRIsC8Yd0nrUZ0hKIZVt6XS7H/jentYhfe0IC
	 liucv5wZjfa5CQT78lr9Mh9PqJ6Jr1jiacaVvfX9dwM+H8qsq6OPDV/aozP0cjlRi7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lprKMd/Cznsmc5fuL6v7XxVzYtKcce6V0NZVQATR6sk=;
	b=SmSJmVOd28w5pOLwDT6AEwRiatla1eUHVeffeDtQrpjHUz2fU54dt6i1FNX2hpbwNEu9
	 L/65gGLK76uA4hoYVPGa29vuo7fs4Bk2QUbHOnG3GYpFgkfEMUOkS53U1liitS2bNqjJQ
	 tRh2H5c7Pb+XdvXy8U0g555zzI4JXNAjOhBs06MrDl/iridhOvrRVc3FjLG5qG7808bMI
	 6Mg1RUoLed11DktBc/v76BC126C3//ucplEpGFkuo3sTZOEACEyZLzCUF71odG6ea8mgh
	 mWfxPQ07P7BZSxIF99T6sTa+dxrPUn6NUh5k4AVkP7KEERgvKnuPHZQg+x5CNPsTbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FE1/vj5q";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C605606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C605606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FE1/vj5q
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c58f18765so1126062d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794598699; x=1795203499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lprKMd/Cznsmc5fuL6v7XxVzYtKcce6V0NZVQATR6sk=;
        b=FE1/vj5q4B3ICRaes1Lt07YO6ka8qURJ+8xHVawCb2fVuFPpsYEOGtZ8rJjVZpXCel
         klZ0aP/EwsFcwEV1H7Lwnp5MduJ42S7GEIkBPlz5ze42KCcj9FCE4m/0HUxB9YMEnUkv
         F4SGSb75vCl+6bS9pwv8hg02zawioTTLC5LjDiG43RE0Fwd4v9IBn0dNGhqEK63SGaSR
         67KCesYGzkRiTwNvKz8vK7ZGdmXBuqnDo8pRTP81A7mRYOQGCsdYMrmSNRb3P1hj0NMo
         xKANvFjCntol7in4g1Qea7UkylRdi8gMFffeiyaf0r8HGP+cWZDDOo/xjaZgUUsiX5RW
         kqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598699; x=1795203499;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lprKMd/Cznsmc5fuL6v7XxVzYtKcce6V0NZVQATR6sk=;
        b=lyKADvvPnYvQsBr+j6BLSpTI6LcoqvMwjJqWhYaKKg0oMnt+rNp4WvYyykTdM7V94Q
         NUXUBfcH/2kb5L26uCsNOVzLW2Pwf5Q75/NHEOmJgg55YfgNK3WylxcbFM9MZo20oqqK
         mMe4KuruQFmC9bkN38bKtyNRKI/c6adRbaOiBfKMlhzS8RNhaDQ+7HE4FFiiwTJixQwj
         Gv3jtPeD4h3EJEMgS4U7/NN3f8pDc7kBTVyGCqR0ot2RzuknaqhLeHp17NGjGDneHjOh
         BPnX1IPVgcVAZXPD6ZhUfx+NL5heYAKb7XuTjXHXcMp+0/DOqM9AF05ezvLxkFDa7sN9
         S69A==
X-Forwarded-Encrypted: i=1; AL+hErFNJ3waZeTqsoR0NJVKlvavuc5xj6RZCavhq3HChF/5e7RrARXlgagKIqkZuZJlwilDgAj/QeSU7gE7nzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z97XOfGHdeSJwab+MYRs9C5OIhvrnFPulkT3cqZh9UVdAzRtQGy
	FfGWj5BZ8jPMCavXOBy0eRT6pKAbNJw3L3GrIJpG7zF2E8vHWHaGmiy/
X-Gm-Gg: AYBFou0VqzH6fVp5g7I03gfoIDSOuwx3Dg88t2qImmTtnF/VWx8LT7d+SiDsVA4Kq42
	WuFtZXL1QFKE0btO4QnaSFWrFPsPzca5kv8l76Te9vscGlWKEUMo1gpesqjpbED7DIQnAiZsQHx
	sIvr65uLz/UYCU0uYRDfeTQK7iw/P37AMV9ZkfgznCTLFk0ZzgNEYR8vJbfNq65JudBvhzyhZmr
	/VG+kweepAjwtVkWLRAuv4Ps3qGbG11MbRSJNjn03cyfTkVu/OZFmC924Mk+uMaJOQiJzk2lPRO
	206+2y+70oDckUCXPj78b6Jt5VrhQjE72m9hyMfSpqvr6RuG/Jzp2ExesByOookO8vZBQRkeF0U
	eBsu9V/OYQ6RYTwpYUw7XkzV5/REcbUm71ebZQELiG+KvpCBLMPC8Ib1EZkONQkC3DpWbJlyMv8
	6vTSNh/KXTtgtomA3TSfum5KLHKiHfpVhiPLlP9Rd/QDTD4jjIAFJA1nFVVbmbcIZpq8QUgG1Oq
	STIYkFCmaKwW1FDnqhsmuByIjf4RfcDg4fjUMIOhL3IQ0qDJ9jRXRf2TaC3xRPGcmKSWI4mNaDU
	uvFTQ9kcxCLAcoPIHlVfqdep
X-Received: by 2002:a05:690e:1501:b0:675:3507:46f5 with SMTP id 956f58d0204a3-67d89758c74mr1463866d50.89.1794598699469;
        Fri, 13 Nov 2026 11:38:19 -0800 (PST)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4339c3sm2844892d50.3.2026.11.13.11.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:38:18 -0800 (PST)
From: Ivan Ezequiel Rodriguez <ivanrwcm25@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm: use PFN_PHYS() in phys_mem_access_prot()
Date: Fri, 13 Nov 2026 16:38:12 -0300
Message-ID: <20261113193812.1239880-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>

phys_mem_access_prot() stores "pfn << PAGE_SHIFT" in a phys_addr_t.
The shift is evaluated as unsigned long, so on a 32-bit kernel with
CONFIG_PHYS_ADDR_T_64BIT an address above 4 GiB is truncated before
uncached_access() compares it with __pa(high_memory).

mmap_mem_prepare() already shifts in phys_addr_t, so the mapping is
accepted and then left cacheable. PFN_PHYS() casts before the shift.

On a MIPS32 XPA Malta guest, mmap of /dev/mem at 0xf00000000 without
O_DSYNC used the boot CCA. The same mapping with O_DSYNC was uncached.
With PFN_PHYS() both are uncached.

Fixes: 7e6735c3578e ("/dev/mem: use phys_addr_t for physical addresses")
Cc: stable@vger.kernel.org
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 mm/char-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/char-mem.c b/mm/char-mem.c
index c5761ddedbd7..53ce0034a4c1 100644
--- a/mm/char-mem.c
+++ b/mm/char-mem.c
@@ -272,7 +272,7 @@ static pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				     unsigned long size, pgprot_t vma_prot)
 {
 #ifdef pgprot_noncached
-	phys_addr_t offset = pfn << PAGE_SHIFT;
+	phys_addr_t offset = PFN_PHYS(pfn);
 
 	if (uncached_access(file, offset))
 		return pgprot_noncached(vma_prot);
-- 
2.43.0

