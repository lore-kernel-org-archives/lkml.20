Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329ED59B56
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110867; cv=none; b=i4MvQqD3rQpquRaQoNke2NOOjNJcKMTUAJZQCvRHCy4vTvQUyfhp4TJWEd7/yL9TkhTrvHzR/5NAwPdk4fuJeOWEtxiBhCA3AgimW7wHfnHDWFoUXyPJ+0cBNS5ZhM3WB1Sq/C0YMY8GokbqRCl482WC0Py+wmchyP2/39C2Eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110867; c=relaxed/simple;
	bh=dWUTo2n72i8a4kUxv+Yn3ug90GBl82qfhnZXKOVF2Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQ8EFsKXMF87gL+t6qq1Lvzq+cpAkG6ocah+aQXBn9WdOAwsZbaj+igm6JQ/t5HxCsW0WdQ9frrl8Y5eBOw89q5IBjMYyEFPXx1L5FAomQPSqK6WcBPr71ecWqt2MRTDAFQ+rA9VWeCZSv+HwkbncxuB9ojkv4Ry9XOflkHv5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTl6TUJe; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTl6TUJe"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8aca68653e3so12408997b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792110864; x=1792715664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=naVPTdLBkGW0uis0AnktX+NhPTF71p9vdwxuj5+66Gs=;
        b=YTl6TUJeJJ2Sm1ndSjgMnjqpkZOgvWOIrGoKJ9vMWyJGxa4YQZIyjvwwlrcT9a6jRm
         vD0DbeKce4lUbs4OMKJ8jhjFwCSLzMMo9FtHea0Cc+xvX1kLBBIshp3kK/ezsmjWES2+
         FFLlEuN60u3xuN4R3ih9+Ir6L+xVldtteU/gZVocYnweJGl9H5dew7SBnU4eqY7dG9h6
         7B/S1JF/fmiDb2aDaCnU6Dy5PDoHMN3A3t6lHh7T5hL8xZIQTIWzSD3PpuvtobHKEkRw
         TOSVWC8ro+G4IMM/ZR11SjlXW/kj70EBqT+JUcn6ja9aH37wJoKDsrMIhZzCi0DbIrcf
         81ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110864; x=1792715664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=naVPTdLBkGW0uis0AnktX+NhPTF71p9vdwxuj5+66Gs=;
        b=Ke05R44USDpPh39cmQGeLm3mMHakeoYlQUCPiUDs39IDRykWYPniDMC3wRXZ8pSZfg
         bOUZEHWZnT+ZMW5mvZkDiay9s3reb9WRXW0S0wg6wAcS0IvozM0s2kkucyGxfrJwBr2U
         sEy5In52xw9pCWe4tM5fwP/LceUsAbt45NnDKRMtaoU34qH9u3DrHafWGmc7xTKMJKCH
         tkL0ZNdFS3C7pHDXAil37+KYVXeld8qRlZoWuggFRFDAKO4yuw9RLspyk2fsm65VXdiF
         B+0lWS+xbf29rZdPt20pCSnYn/7TLgDa769v+J9VNF6FBpwpaW1y98ZosRarGbqG9SaF
         9DlA==
X-Forwarded-Encrypted: i=1; AKwUvBy2UMz8nb6KG3B6XSPSNZWi4pCr2yXEA1Ysng+JXzEN86b15VxIVuayJVb1rzU6CIZO+tNMcqt31kW07lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUisN5RKOtW6N3MzCF3LrAKetjEMLnM4D/ar32mUv3j/ALXXAz
	IF45kDNVuGDu2WRCHWPM5ffiutGUO8Y1VNH1hInJL26NJYEwL7wTH3qQ
X-Gm-Gg: AYBFou00dQWXMOWy4JYETGUBqVBWC6qb/JhYubq8pyLL/qc3OQml9rb5CbYqatXMc7z
	ADqzCGakltdiQsYExLLL4r0/VnIBd9rkzmrlK93iuombqr8gCzyuPp/+q3O4G+Vpcof1hqTz+Kc
	Op4RZI63Osqvcd0iUwjwJcsK0uV640lQUddGX30KS/Dcwvn+rACd5agCE1YMx3v1RQNgDiHbqq1
	93m3SoqsKZNhyMlD/yVkVPobqcj+vhqt/C5GOrevQnQ6c8MLWax/i9Nb1ZnuDELvXc9Tpt3gJ/8
	uDX00PSWv0Dr5u+iMDHAQbMPU1heatZQcEuQgY/t7utAx6posxD/XTTUj/Al/6Y7FFh2Ce+jB/z
	yclaU2fR9G533IB01+28pOhnP7v7Hcz6r6WD5Y8OdeVtVIhrBI6T2azNn0sAWFptpDGkh/THCVi
	bGLdwEsPqJyWveO5TbaVcw2sQjMpEODN+bDDJ+v64aAVQkbcT4cOg=
X-Received: by 2002:a05:690c:fd4:b0:8b0:e385:edc3 with SMTP id 00721157ae682-8b0e385f62amr6595847b3.33.1792110863971;
        Thu, 15 Oct 2026 17:34:23 -0700 (PDT)
Received: from corey ([2600:1702:5081:b900::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58892cfsm2982937b3.10.2026.10.15.17.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:34:23 -0700 (PDT)
From: Igor Malovitsa <igor.malovitsa@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	linux-kernel@vger.kernel.org,
	Igor Malovitsa <igor.malovitsa@gmail.com>
Subject: [PATCH bpf 1/2] bpf: Load ringbuf consumer_pos under the spinlock
Date: Fri, 16 Oct 2026 00:33:17 +0000
Message-ID: <20261016003318.529860-2-igor.malovitsa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016003318.529860-1-igor.malovitsa@gmail.com>
References: <20261016003318.529860-1-igor.malovitsa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__bpf_ringbuf_reserve() loads consumer_pos before taking the spinlock.
Nothing bounds how stale that value is when the lock is finally taken:
other producers may have reserved, and the consumer consumed, any
amount of data meanwhile. bpf_ringbuf_has_space() compares
new_prod_pos - cons_pos as unsigned long, so on 32-bit, once positions
wrap, a value close to 2^32 bytes stale passes the check and the new
record is written over records the consumer has not read yet.

Load consumer_pos after taking the lock. producer_pos cannot move while
the lock is held and the consumer never passes producer_pos, so the
value is less than a ring behind and the difference is exact.

This needs a reservation to stall for about 4 GiB of traffic on a
32-bit kernel; it was found with a formal model of the protocol,
and reproduced using late_initcall.

Fixes: 457f44363a88 ("bpf: Implement BPF ring buffer and verifier support for it")
Assisted-by: LLM
Signed-off-by: Igor Malovitsa <igor.malovitsa@gmail.com>
---
 kernel/bpf/ringbuf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
index 3f1013d80544..6b86c4db5108 100644
--- a/kernel/bpf/ringbuf.c
+++ b/kernel/bpf/ringbuf.c
@@ -473,11 +473,12 @@ static void *__bpf_ringbuf_reserve(struct bpf_ringbuf *rb, u64 size)
 	if (len > ringbuf_total_data_sz(rb))
 		return NULL;
 
-	cons_pos = smp_load_acquire(&rb->consumer_pos);
-
 	if (raw_res_spin_lock_irqsave(&rb->spinlock, flags))
 		return NULL;
 
+	/* Under the lock, so at most one ring behind producer_pos. */
+	cons_pos = smp_load_acquire(&rb->consumer_pos);
+
 	pend_pos = rb->pending_pos;
 	prod_pos = rb->producer_pos;
 	new_prod_pos = prod_pos + len;
-- 
2.53.0

