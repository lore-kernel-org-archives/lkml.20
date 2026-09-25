Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56FA4718F9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324912; cv=none; b=p9BiufzwVd6kI+KN/VzmlJdpH/8JLPFCHe07+K1jmF8rziNQoQNRDg/YFUSMp47bLE9VE7msFuXFGprWDGIC8mqJ7YJvojB5jA6Vxr8jHfZQBP3J2MFI4lD1XEQRaRjhKwZB5DiJIE+kz8l83yyv9IAMPuS7D5Qmv/No801nvhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324912; c=relaxed/simple;
	bh=CPuFVDJOTU7OutoWc8dLFxrNzv6cGAYuwyA9tXGeDYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PiCoLVSWvsHgEtb9I7KFiEf0gjr1snk5I3BnjfHYS3KjOAC9td6XmF/vcdDgeuK6/41s7N3dZR52v/wjFBUAUeIIRvgKh9AGnlZ7Ea/Jdc3kaUJk6AW4LgMXD4VzCLmp7LG0tsDRQhEkzvSdeYVHhQ4n2HakFvPuv/kVGWUuW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXD5rFMb; arc=none smtp.client-ip=74.125.225.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXD5rFMb"
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so429902f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324909; x=1790929709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E84mITt57JkXmzttmcl0sEhhZTJzUF0ZsCknCmIA9JU=;
        b=EXD5rFMbQNe7pcE8b5jdly9LaJXppV2x67HjlUeTkUElLlHZWj5Nl1Z20+ishrXGcp
         lMxxPmOAYDakxKgAe30na3T9TVU+dSDdNfsrrKJD5RfFTSMFFbo7UAJnnlkNMMDLJjou
         15nIcanHNwyWUSWyh46PTUlL8DUIA7T0GyNudQLobI3k5KsoHaEZ4WLV5y1OwLes2bWi
         Iimcm9hEJshPtPmVpUDSy1xGC3qYVaLzxZBt50vEeeCvxXY+gWJsl9vwZG7Ad3KcE9Fy
         KzIhoVuExpdWjRG1VtSzqbGk94gSYUdzHrIneH+H6y+mR3z6j9OaSSgMaDLOM/t8FAOZ
         5JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324909; x=1790929709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E84mITt57JkXmzttmcl0sEhhZTJzUF0ZsCknCmIA9JU=;
        b=BzW3vp/O9A/bWeijQeu7jfHrfZw7w3jsBaTmJiU5KjmG8SX4/70D4LKbVvp4Q3ex1M
         YJn/0tcziOUoE5DduXnUtKw9elQvi1ywJ1P8ujtcwYYSRrQ0UGOFZOr4L8fW5XkMGn/p
         hVPe3y271nMJObp1Mw/jfLVRKsLQGaVQKdqLyjN4vSt+jUUMw2+9zzalGfWZZzeL1u2k
         iLjUJb/Nbk5/SqUG3cC9XkGOYcAzVRO05ZAyNIr6gygJ7rQbDEYZwwSAYhncBy2pb+6O
         sXGpODD9JfzgaBICLuZ3t1NWtyt6Lb7rfyzZTQxd20bbxcMXeplHOanSlTJU5iAma6eq
         2huQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoOhJrmGz9CoxmV5VXKUEySfVlfIsWzcESQP+PZJI5fjjW2BnTBLmxIt+OaiQ5mxxed+ydHN038htsh3o=@vger.kernel.org
X-Gm-Message-State: AFuF++mfHhTH1XyODNHx3d0t+4/YXzIl+yQoBA1z1qp+mJz3QZwjQPXi
	EPua9tkfbPrslioj+zmmn09lXRVusY3/cXpjcdRAo5afwEfqyy1OxDA=
X-Gm-Gg: AYBFou3eBgWHGJfpcn73lluUCNrKO5HR0rOSLLZFRmtfFTB9Rwo9k2SpQuVZzFh+Jc5
	jXB8DXG+p3ECgyYBTqEhQOdCOG6Mc3Hyb1nLI2jn6tdDnvuUZ+fAxUfw05GcU6KiclNEbRTWeYM
	tfnOmptgkjZmga64jM3OLQvzRigY6vzPaMBK6ZGzETvsLQI0jXA5128Zht0sseg9MFVCKsgSCiq
	y9p5+pbyvRTZ1msSRmeyP2gcQwZA5j7w7pMelQuOFZf5X1SvDSz4Se1mBj9epOt0/c1OF3SyynW
	9jKo1KLWuAHiiBQJgCuqkqky9Aw+893lTL+zlFV7aphR+4Rf0yBW5o8ECJlFcODpoCYtmmTm5Xn
	h+JC9xZNiaWvhNWGGjcrpTuRXHvGdxKJH/xU3oMB/rWXvVxv0DTIuRTIZLunhUaPqmPD49QKa09
	JyIZdg5yMs+O6R/6A+/CajpsmJ8lSzjM4OMOnddXZ59NLGyZ2wXuu+cva0aYKkw2Ij3C1q6Ge8i
	DzxwrWnlc1oNTAcgEyOPfNXz8Fe+Q2zK5jrxuV/+P+6gi6nlkvNirTC+mm/aRg0Nji50w34PzUf
	CWE4R2aqjw==
X-Received: by 2002:a5d:5f49:0:b0:487:490:8391 with SMTP id ffacd0b85a97d-488717252c4mr9073653f8f.16.1790324908855;
        Fri, 25 Sep 2026 01:28:28 -0700 (PDT)
Received: from ast-epyc5.inf.ethz.ch (ast-epyc5.inf.ethz.ch. [129.132.161.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm5142896f8f.21.2026.09.25.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:28:28 -0700 (PDT)
From: Hao Sun <sunhao.th@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	john.fastabend@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	linux-kernel@vger.kernel.org,
	sunhao.th@gmail.com
Subject: [PATCH bpf-next 1/2] bpf: Fix uninit read for helper mem args on partially spilled slots
Date: Fri, 25 Sep 2026 10:28:13 +0200
Message-Id: <20260925082814.1554771-1-sunhao.th@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_stack_range_initialized() takes the spilled register path when
bpf_is_spilled_reg(ss) holds, which, however, only looks at the last
byte of the slot. Hence, a partially spilled scalar (on the lower part)
bypasses the check and the following loads:

0: (b7) r1 = 1                        ; R1=1
1: (63) *(u32 *)(r10 -8) = r1         ; R1=1 R10=fp0 fp-8=????1
2: (18) r1 = 0x0                      ; R1=map_ptr(map=rb,ks=0,vs=0)
4: (bf) r2 = r10                      ; R2=fp0 R10=fp0
5: (07) r2 += -8                      ; R2=fp-8
6: (b7) r3 = 8                        ; R3=8
7: (b7) r4 = 0                        ; R4=0
8: (85) call bpf_ringbuf_output#130
...

When executed, it dumps the uninit four bytes:
	RINGBUF: 01 00 00 00 ff ff ff ff

This is the same root cause as the non-fetch atomic case fixed in
commit 5a84b4424db8 ("bpf: Fix uninit read for non-fetch atomics on
partially spilled slots").

Fix by only taking the spilled register path for the bytes marked
STACK_SPILL, so the rest of the slot goes through the usual checks.

Fixes: 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Hao Sun <sunhao.th@gmail.com>
---
 kernel/bpf/verifier.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c495dc9070de..5c8626215ee6 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7484,7 +7484,12 @@ static int check_stack_range_initialized(
 			goto mark;
 		}
 
-		if (bpf_is_spilled_reg(ss) &&
+		/*
+		 * Only the bytes marked STACK_SPILL hold the spilled register.
+		 * The rest of a narrowly spilled slot keeps its previous type
+		 * and must be initialized on its own.
+		 */
+		if (*stype == STACK_SPILL &&
 		    (ss->spilled_ptr.type == SCALAR_VALUE ||
 		     env->allow_ptr_leaks)) {
 			if (clobber) {
-- 
2.34.1

