Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658015;
	b=UY5sx1T9FjD8oYl9WObO9G3q7/A+Zyz4PHCFBmxff1vdyQ6j3vfXw/hsiIMY4Aldc+ZQ
	 xOY8DYDB5Ou+8/oCf3VTPJxHHxMj7rSrghRD2Y5TcRNT3iS5IijQH0T47IbEzojenv2bv
	 JLmhaDwYt1UOMJWRhTRQf72UZzW5iobQQsMa6SLFF7a6+37q5pZsGRmMfPoGBIvoZ6Alw
	 0dTwbOpEquLoQjkMZHWXcEMOF4B/uj9fJhmTcdd5xoMQ2bMDmBGzSAUW5ueCqQHhvqruR
	 UtSaMlLm57Uq4Noq6GQmaaZCWSePq4bzJqIIA6Tq0Q96WRkW86w6O7q7OC65UoqrktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Po10xs3c1tBUXr0/TED4BRLkJvTxT4ILiaYjl5lFoSg=;
	b=x8uDNYo8YQoTDdgLgf6BYd4Q3TdvlMS3eXMy3bF7YRJOt2iGL6kQBLtCjP+kZuJRLDsd
	 iSICyun8aoSfj10GltwhR/0GmoMsMEejHp0bMpr/Xk7NF6EuHsVsVNGmOGnalKCk85ZSP
	 FsK1zxAY2V49tBMPVNpuwbe4pCcD07HyRnnRPD67euIoBDL416PeYu8MnkmNg3Kb0lae+
	 TwPJ3WCV61Y3fDk2xIYoilqwDw7dDMIXvslrMlNKdNFJvwUdE3FWXRT6f0FQZ9XpDQ+0B
	 CbY3CdTIoTE/MmKNcKfkC2y+s9SMe6R8wSEeU+N/ChxKaiYzBic1mhHB+aLoqP/B5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QE2JDqYa;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF61606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF61606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QE2JDqYa
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dc202a60eso794385f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1792658013; x=1793262813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Po10xs3c1tBUXr0/TED4BRLkJvTxT4ILiaYjl5lFoSg=;
        b=QE2JDqYaeZ9AE/4y4mPeS+JG1LgvcHpDNB3jEMflyLtEqz07OnmA7FDZdqe2aeLx6z
         eCqS2ANQ1LqmbazgV+Twirnnd6pkvaQnP8HB9EQkIxGjKp2CeJRZUHHjLpwZ2gaPa4kD
         e4+nIhUX6nMMnmiIjgZqQwJkztE0nCXSNYZEEIUWAv3Bm0q+EwTu0xx9ypcuzr2dXCNm
         D+znffkaCN9UtUiycQ3V8MWjQTFnrIbIz2Cg59Gax4Vd1z0CyCNS9Q3fij3bFYe2zguz
         SnPgLeKmOHJ8YrMBOQc/xVKlUhrqxEYHUzi5Pkqz/rEX8Kwk9O8M5wsHqq8GNSUYI1pu
         MAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658013; x=1793262813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Po10xs3c1tBUXr0/TED4BRLkJvTxT4ILiaYjl5lFoSg=;
        b=KW4MUa1fCrl6shIiDpyDgFE2ZnSnqBfTY8dN7kDoKsDHVdjI8eXN0MfftlmlYmJIpW
         CLa+0Av24mV18nYx9PPeF+NIAw0o1zuchefsH2AgS5e5K4Ki7vFZnzvfy/oBneRtMKq/
         WdMobaI6i1wILW3EB/4GThM0sTgPzDKE9bWOkqJ7FMCbGLPaETldWtkoBs3N2Y83Cefh
         r74s+5/WxvS2t+73ml5/oWqfCTtKwRevs0cDkUg6ZzzhlTEX+jeX+IzIW8G9OYNrG2yu
         GNqS3R/pb9sO82bGzhJhrBobp1Z4Rb2qTzM3+NBBJ/nHY9Df/IfrKHVtuHu1Wg7kOfnA
         TPmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaGUxmyCJuAXlqZoiKLUtuodKuIS2ToFMBxdCNOt8uP/VzBTSdiZF9CckfQK9chKNjaT9VzAkNOa8Fi98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYIGYQ0kOQgQjH6uFX8uODZZA+8uCeIy+XlgBRy1O7SUTT7sIn
	Fsw8Zfr4hQDVH2cVQPm9sBB3ujVLluPqOkt6UyziukhRmY9Ia7AxHnAvq4ufoVhtOJE=
X-Gm-Gg: AYBFou1ajhqNZ+vqrDwV/77RDRl1sNNmy57SixsRAUUdd98InOskbh8yWNLOJ1QZ86s
	x6czPehJmd6DtSrdjhaZYDqeQGcSWDFnaaOiu5SzGpd+KIWVKfb86CZn5etSGQC8+s7/5C16P5c
	3UlIwm/L6JBe0GP+rwpqC2hKeF8BYbhzvKx32F85Zt1jgVdNU5yRX8m743NtylyEmQSZL2FExl4
	yO5Ir9rhxCT1PiWyaWOzvERVIZivCynynH7UksfLeIDe5Ky8j3yTP0iKrM8UJacRKBL50kCvv4z
	wxDK7qyGIvz9luP7IozOemL5B3edomf24FcbjdQgd/M5jhkOQyybBLVTdtGoUYr+ZAwukXmp43m
	ItWz5/Q5AvQZhEQ8btMw0fZqlIB79h3QM6OUOUzxPElRvMNpSAwYl2n1yiNgV5NaMcrKIFt/BXR
	zPUtNiAH+UVrypXB5wpJPM0b77462UIikuTGdB/pXKykdKW7RJLyOYmElSIqqn06Vv6v3JyMdEk
	53W0F8vJL3N/bbL3pXa/vjx3cwTOnMPp1Ex0yOoRDZ8vKJfj3BS6cfdHw==
X-Received: by 2002:a05:6000:2201:b0:48e:21d:7265 with SMTP id ffacd0b85a97d-48e264c48abmr10924136f8f.34.1792658012958;
        Thu, 22 Oct 2026 01:33:32 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581fa7fsm10280598f8f.17.2026.10.22.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:33:32 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: [PATCH] stackdepot: stop preallocating after the final pool
Date: Thu, 22 Oct 2026 09:33:30 +0100
Message-ID: <20261022083330.3159793-1-matt@readmodwrite.com>
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
Content-Transfer-Encoding: 8bit

From: Caleb Kan <ckan@cloudflare.com>

depot_init_pool() decides whether another pool is needed before it
increments pools_num. When it registers the last allowed pool, pools_num
is still one below stack_max_pools, so the existing comparison clears
new_pool.

With new_pool cleared, stack_depot_save_flags() can allocate another
order-2 pool after a lookup miss. depot_keep_new_pool() retains its pointer
in the global new_pool, so the allocation is not lost. However, pools_num
has already reached stack_max_pools, and depot_init_pool() rejects every
attempt to register the pool. It remains allocated and unusable until
reboot. The non-NULL pointer prevents later saves from allocating more
spare pools.

Account for the pool being registered in the limit check so registering
the final pool installs STACK_DEPOT_POISON and prevents the extra
allocation.

Fixes: 31639fd6cebd ("stackdepot: use variable size records for non-evictable entries")
Cc: <stable@vger.kernel.org>
Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Caleb Kan <ckan@cloudflare.com>
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
Previously posted as patch 1/11 of the stackdepot RFC v2 series:
https://lore.kernel.org/r/20260908-stackdepot-trie-v2-1-1996d5cef732@cloudflare.com

 lib/stackdepot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index dd2717ff94bf..90c52f2e0d3f 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -323,7 +323,7 @@ static bool depot_init_pool(void **prealloc)
 	 * NULL; do not reset to NULL if we have reached the maximum number of
 	 * pools.
 	 */
-	if (pools_num < stack_max_pools)
+	if (pools_num + 1 < stack_max_pools)
 		WRITE_ONCE(new_pool, NULL);
 	else
 		WRITE_ONCE(new_pool, STACK_DEPOT_POISON);
