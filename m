Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0EE4A5C43
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828059; cv=none; b=mOH8Clo8j2ELvLlL18M+NErUqVTxOznIIu/3fEJjxiUA+FqdW48x2Xi1FfMwG9xoaIqPwNvT4Jehm0GxvfamcGI4PLu2g7DssDZwwl10XDE9f3PaYAHzwg5N8P0UUzKl/x0z09xRWQjBq11v17U+IJUZDFmZee3LC+SBynF231c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828059; c=relaxed/simple;
	bh=XkToyWeAgl9EytcaMnD0N1syjSHm6NFpBxoMz1y4bMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TniYdwohthb1WirK5XRaiGzCAKp/uynNH9Y0msETZdiIN6bz7qERFIDwj2q11pU2UJMzPNEBeGgcIOpAUTnHZZlCkFmH8CMsCDjWrTwHhctboiOSGtcmG29F7QDXBLdjlHTGtN4m1cymbboASspLoWlGreWzLVsKUTZ3uEk75CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZR8dEvI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZR8dEvI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8246b13cbso16370745ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828058; x=1792432858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0LZ3VbBlAPZVH9a4e0Yvdir8t3mhQma02ZGhVPq1+w=;
        b=WZR8dEvIDqmoKu/IKRdiK/cYunE7AYIT22464BmTU3pdrKAt49j9SYf0+nU5UlRGfw
         H+sYejywWTSyiIc3+SPHaT/khS/jTezVFLUSb8rDHHcP07stpO0yNxuzAKeb6nLPGyvz
         wr62zUvp9o0BeQTAJaaOGOowTu42HSEqx2EWpRUaDyccv2XlVTD/gqc6bNjgMayLVAuC
         nd/e/2Nkk/+dXmfWxHzaLuryZRlq2duAtTKAvizO1WqOitU/oOX6uope14Uhy7fFl3H8
         CWHioWzKP8uMniCFc2ZT9u1jnvsWmTLVjw6Xzl9KrYAd/q/WifJiwycPiRf70Aa8tLZq
         pjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828058; x=1792432858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0LZ3VbBlAPZVH9a4e0Yvdir8t3mhQma02ZGhVPq1+w=;
        b=D62tgQoBdnbiMQpS4noqpxAAdiGMxmxFd3Er+Dl9h3yOcHF4kDlET04LVvwdB2zgrW
         gvFNxDQUKB3ux9O/iFj/kbAtdbFJS8YNrkOb8tg//P5g2/+9HyufrLi4fu9ozUQ/RYQJ
         pd/I+INqZpBqZ39MRTKJCt9pR44Pn2GcpPCZQ5XgHI2zsqCJcLKEu1u9FS1wAPLZPPGg
         4zGLT7vSWAgp6KnEbGAIcpIl+Hu+pb6Ze7wzGkEldXKfqTWZJ9L2w5Qbp2l/MpQ/Gzqj
         eLQSf6zj7YLJUHAI4HQot63ymUepwHf+GCbDzs8MN8Xa88t9UvcmpvvAFVh+9ZB5GnQo
         YixA==
X-Forwarded-Encrypted: i=1; AKwUvBz5N5B/2r2mT9o06fTvwwDPFcZCTTUFE0Hy4qu5Ulg1YCZd4y++J9tPfK7dzv/RxMDhp0Y+aMLw9C8FxUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVPgq+j7r6uVK5bD/iB1HQoL88fl3LkBUg56RAx0M5oFLqXpeg
	h/qM+WV3NyUftFLLTmna+sBl1rHgnOQL/0caMe9kOWL2toi9rXBgxkZ7
X-Gm-Gg: AYBFou36Ba+ilUERbUyQw0qvTlS8B2daYJ1xM3pmufWLNaJGAuRBKBlZRxRr/I/Wg5z
	Rt5VGgNjXUszxXVdPu31bRsdHw5TZsn7jEvjm757ZGGUirZpF1FBDRG8fuTuaIdHBHbvr7Z96ef
	vhGhbENLI+YQe7TtH3vQmgd96/uzxXhTAWoLbZkD+5tGJ8HCvfNdA0Cg+bt5QHbUzVtb/qeU0Dw
	ha8NRiudA8MkbIVUjFMzUq3fhW/B3QHOf0H8syriNxzF+GrZ6/b47tU1pgMKDc8vstseVLn4V4z
	AlAuDO9GE5el2C6Shq8UU/yUAtmk+Z6yu7mq+RoBE1JCZAZ5odMXhgMGPJL91RyJX4GL8RzQXU+
	lwHNMTnhJXcjXNXg/UyE/uiQLle8ZoHIzNuvk8Pn7KybecIlLTYBSulDRHHv+wOC6Sj1B25fIne
	L7BAb6HOiSvK2SXTPt7RHU1gmKMlTrKo2UcE8xwuvsLaASrlbqY1M7bPBlh2CFKTYYI641fauBP
	27WBKHK994Ka2dPKgU4vCO5YZHvii+t/ZVKlCR4WhQTadBvSAJM8g7cuvU8aST33Qre9jc1wM1h
	IdbouMd1migfb01IIFs03jcdjDzA6y1OCPl59grmFEp1psFZww==
X-Received: by 2002:a17:902:cec2:b0:2e6:1715:e48d with SMTP id d9443c01a7336-2e842ac8863mr98151965ad.35.1791828057465;
        Mon, 12 Oct 2026 11:00:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a04b22sm45805785ad.8.2026.10.12.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:00:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] powerpc/lib: prefetch ahead in __csum_partial()
Date: Mon, 12 Oct 2026 11:00:52 -0700
Message-ID: <20261012180052.55578-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__csum_partial() walks the buffer linearly and reads each cache line
exactly once. On cores without a hardware prefetcher, such as the 464FP
in the APM82181, every new line is therefore a demand miss that stalls
the loop. Packets received by non-coherent DMA are never in the cache,
so this is the common case for GRO checksum validation: when routing
TCP with GRO enabled on a Meraki MX60, __csum_partial() takes about 30%
of all cycles and is the top entry in the profile.

Issue a dcbt four cache lines (128 bytes) ahead in the main loop.
dcbt is only a hint and never faults, so prefetching past the end of
the buffer is harmless. Lines that are already cached, for example when
checksumming data the CPU just wrote, are left untouched.

Measured on a Meraki MX60 (APM82181 at 800 MHz), single TCP stream
routed through a qca8k DSA switch, iperf3 median of 5. Only the dcbt
was toggled at runtime, in the same boot:

              LAN->WAN               WAN->LAN
              Mbit/s  csum cycles    Mbit/s  csum cycles
  before      495     30.5%          439     27.2%
  after       599     15.3%          520     13.7%

That is 58% less time spent in __csum_partial() per byte.

The prefetch distance was chosen with an earlier, slower driver
configuration (median of 3, Mbit/s):

  distance    LAN->WAN   WAN->LAN
  none        370        341
  64 bytes    430        381
  96 bytes    438        397
  128 bytes   438        385
  160 bytes   434        386
  256 bytes   423        383

Prefetching the first lines before entering the loop made no
measurable difference and is not done.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reword commit message and retest numbers.
 arch/powerpc/lib/checksum_32.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
index cd00b9bdd772..5a14d45c7b9d 100644
--- a/arch/powerpc/lib/checksum_32.S
+++ b/arch/powerpc/lib/checksum_32.S
@@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
 	bdnz	2b
 21:	srwi.	r6,r4,4		/* # blocks of 4 words to do */
 	beq	3f
+	li	r9,4*L1_CACHE_BYTES	/* prefetch distance */
 	lwz	r0,4(r3)
 	mtctr	r6
 	lwz	r6,8(r3)
@@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
 	lwzu	r8,16(r3)
 	adde	r5,r5,r7
 	bdz	23f
-22:	lwz	r0,4(r3)
+22:	dcbt	r3,r9
+	lwz	r0,4(r3)
 	adde	r5,r5,r8
 	lwz	r6,8(r3)
 	adde	r5,r5,r0
-- 
2.56.0

