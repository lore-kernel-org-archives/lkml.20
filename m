Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36405459AE1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149780; cv=none; b=sjlASan3WXtXXN518E11g/nnWgjb76ERJceAdrsQrPv7QIc98FRDiiUVJpjquxVF0bqSlly+UzsJvzXV8tpsEvqVfoDhHqbXlguQLI30tR1lj2FJ2qWiycm8vscTnYBOY5aa6p+agsxaa2E6Zwns1i9DXVJKflkEKZaKDZmmTg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149780; c=relaxed/simple;
	bh=EMwactETkXe8vSMhHk5uaUdqn2lrxvQM56NTZ34bIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaUtGYz/zqkiPMy1WPJYCJKKy8ielyZA4XfZwwDBIN7fitbGYdrSXMBKgd+CkVUpmqJN7Vn2iQRRjls5NouizBuK2zSgn3TCy1+kEczZDcKlPO6cnoex99x0ckuRRyRxWZS7uEJOvhYZbVgylrB8mIgky6JBRVRIqq6/JsLg3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syp5ykIp; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syp5ykIp"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so87358666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149775; x=1790754575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7gkSrqkOM7ln6wSKzbmSt+3Xyd+xuwsuurc3B4YbEg=;
        b=syp5ykIp1P5RwEZfZuEJrfw/7R6aSkybJWheEOX7MzkZ6b5EH/xSKgkhQMVrBtyLbL
         R9oECc9+HP/K6J8nqdXdxuAtuxe02+a7D3xtdb5Z6La5ik5PGY9L3dto1LwrQJn2bRYN
         QFGYjoVlkCuz/DeR6QbrtWSh5fj+UAtjtcoJ+UAZNkH35e2gmQogoJU/3tGNk0gmIhlh
         17Z85XlLcH219CQJpxjXeNAvGJl+vrHW5KT/bsiMmqUN5aPdHOBvtwtBzskhqnSh/gPq
         1VF5yMhXH6D+ZZdOKKBgeJq+kRxXGBh+XR9QF5nXgqm5s55UgTQxUWtYqstqHsYP1UHy
         oC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149775; x=1790754575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7gkSrqkOM7ln6wSKzbmSt+3Xyd+xuwsuurc3B4YbEg=;
        b=gE7Jmjopn4BowIR+RAbm0JvtyqPLAbo1o6zGkvATlX2CI6tyb1B6t5qB7uN9BY1DvW
         JJSRJ/Bg1dRFGuHBWknuJj/n86JFZULBU+GX153z0J4CT+IR7hym3kr/7lB1mf2QVvOH
         6wFy9jcjQl9/PMKRp6pUVKnYaqBmj/DrbaEG5Fn7X8Qh1+Sv2iC6CcGqypgVxZcJyFBX
         UdrWHWaCKqlVYZr1eh4XGlcbXvxPWwbReWw8qN0LJwaxdQFxwFhIPLon2V2oOYrnPzA/
         Bu6aVKEZapkUNZdoL7BqJtHSwI7YZVaByh0eYskGY4WuJaIv0siEg5nJ3NgWGcP4VJiN
         jrWw==
X-Forwarded-Encrypted: i=1; AKwUvBwNcasNaMWdivUsNJsJOuQv70xAPkpUm+NvE9PV1LR/DJHkyGU2TVQO44B2D2IeCBBGqW3vOsC9r1jiE24=@vger.kernel.org
X-Gm-Message-State: AFuF++k0IDoxESkXbWRcBjod3cAn2T7je/dgKOTkKn8hWXIuJKPlC+XN
	PcrZeaFDY1gaVwqYhzPjiQ8ZFmhaQw5ICmCT2sdOpZKn02vjIC4O2lWi
X-Gm-Gg: AYBFou3yBvwmjWiecF2/d942e19+zXoG80FnXIoWFkqbsRsQJX2QwqRD7Fac4Xv0j2E
	rxwhx35xoJHVQrza0fK1sBnxlZp/0WHfg41QU5VSRPmmI26hnim0dLxTWDd/09Uii0bVRsGdmPn
	jbQ6K+i13qJTL/30JUbYODjXoMNKjzUnKEWDgx+Gm5817qTec2Y+ikRuX0KvN7GxZQ+ghLjgZaS
	2iQypkzz00I6fgGuvtf+MNng8hPeRieI2GQZWks6Pt0spats3Hqtu/bT0qXD89+pC9YXvmiw7e7
	D73m9fvGHNM5FzMYQcKzMEFK8/bges2ohaOI300k7/KZSaRa3S01IYRUpYkukTf6IQnT+0j+Niy
	5azsVdRt7HRwPpAkKJVLIontS0SOVvKw44n1OGnLVKVmz2APD7cqWOb/Uh93z4rrBLRGNnbqcN9
	tOFwNaN9Y1verCd23lD1cJIpwStRlZrNUjNcZ9A/GUiPX/nY415cEJ563TKFMmwYIDwr9XnKrXU
	rCgJy3t1MOtnWI9SUb8riUoX5DpuTATaHwsye5nws6Pr+CSrHs2KkeWjRM8mg==
X-Received: by 2002:a17:906:dc8a:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2aad863bd8mr138436266b.0.1790149775100;
        Wed, 23 Sep 2026 00:49:35 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:34 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 6/7] alpha: invalidate the local context in flush_tlb_mm()
Date: Wed, 23 Sep 2026 09:47:49 +0200
Message-ID: <20260923074903.862898-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_mm() has the same caller-CPU omission that was fixed in
flush_tlb_page(): when the target mm is not the calling CPU's active_mm
nothing happens locally, and smp_call_function() handles only the other
CPUs, so this CPU may later reuse the old ASN together with the
translations it still holds.

The active_mm test itself is left alone here. That path calls
flush_tlb_current(), which loads a fresh context through
__load_new_mm_context() rather than issuing a targeted tbi() against
whatever ASN happens to be loaded, so it does not depend on which context
is current.

The uniprocessor implementation in asm/tlbflush.h already has the missing
branch. Counted over a fork-heavy run, flush_tlb_mm() was entered with the
mm not this CPU's active_mm 2934 times, and 632 times while otherwise idle.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index a5a42ae4a7d8..988e397b0b8a 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -649,6 +649,9 @@ flush_tlb_mm(struct mm_struct *mm)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_tlb_mm, mm, 1);
-- 
2.43.0

