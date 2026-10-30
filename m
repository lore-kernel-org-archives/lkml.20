Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385252;
	b=PgoOWv8q5fbJxebZCstNOSOBe/QZj/+cvmzSqvk76wNxQ97RpuKL9xCMfvlgPalZA0iD
	 hxlsP/AMT+SMNsQ9+JPpS+GuaVNJ870BTeYWilJcXbXVEVN+qdzxSwWREqeWeqOdjaoNn
	 8Htyu1Fvh2zUabN1cKC7rmop7pdxUItGK74enoeScntulh+zrTNVcHXmVG2r6WgjSJd0X
	 io9UugE4lEq7Hf21rwDU/XY9Yr6arAPkLo6g8880GnkWKTUYEbn8A7i5L+EQDWhA5eN8A
	 uEpf8OZ0FVWcIEOQslW+1bGj/+3PN/zOthFIqPIcUP873L5+eKTLWFUS8lflEZ2sueg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=or/hcrtFhExIO4tP3jPbR5S7A2yzzhQGok/N2Gaa1/s=;
	b=gDjQ3oToF3xKG7pxABczTUXS2x9sVDOVARtnRzZebKvTquNpqIQPGqmyKM7RHYo/7Cfr
	 J0iaqD4JNUxRCwtOmdjAWr50D/pdFdqvI0/KTfIfRK8Qagaq/Y0SK6/xKNaGdc/vDHIuT
	 TlS/XKs5K94rnXPqcy8+UorVDLuZ90YhelH49ann9mme9VJSnfiNVW5FsftvyWoP2+xg6
	 FgZr7V0LUF+Sk+MFLMhISUmhYj84MxecKAlcp2FSqhmhm9+MplpuTt+RgLcyXMWNxtyE2
	 bMf6HizuPRGn/mP4mAHv9FiAhToY1Xdwd8XYmrIvZVPfKbZFlsvb8YygdJmF/gsRLvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Iks3YX2/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66525606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66525606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iks3YX2/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10321935e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385251; x=1793990051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=or/hcrtFhExIO4tP3jPbR5S7A2yzzhQGok/N2Gaa1/s=;
        b=Iks3YX2/0EiBYpxyRq9L/+JpAh+bHfsk9Ggk4ukRqOCtNBgh/yBwrfZGim1/R3oe9q
         3yyd+xRPlNqupipQRP14UnptNdOpAD9FrTyheW7gQYXffUddQoov7wpu4d1+LBpI8owP
         XR+ZElHljH/+LZbhB/adYGkKbDqxYsksqBZOEVY0Tpx/KR8H27PvTfVR4xUwRNrq4LW+
         UEpDuSMUJ1gykpC85h9FBkqWPrgq/Moz9MuDxXLr5YOTC1dQ29BsZlN9TEJ50j+Whspz
         uuoawIk2OIL/sveoQdA0VreCFJXKatLvpWo9Uuf3pPVZ6lWTYz7jyTgKwz8OZ2O2NgNS
         3wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385251; x=1793990051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or/hcrtFhExIO4tP3jPbR5S7A2yzzhQGok/N2Gaa1/s=;
        b=jjHV37LOv5+WpV5NJJ2wUAMKiKm9sWPKRz1XhSVZbo+XyQ6zTW6TAoZgAx/br+BaS0
         jYchq0qspVRva6T5HynbZr0wecsS838xsDfpkpjCYaan+p3I5dzQQcThPLgPaAoj75Mo
         ALZH26JgXOeTazQrdLG4vbihcSDUoHf5fiIcrpMzJmoC/akAy/JJq0gtEU0CEwW8kLsJ
         o10OLtlPXVVTEgKmNFLtmzBZU/FGC/WGisIrSjBc1WCRs2WzkD3z7M04r+wgOrFvApiy
         iOOPEG9Fym/rcgwZfi4J6a0HoE1lOyatQ9QdfYAI3/GzhOEZUjsJs7YuPs+wlrjUrWHz
         Xbbw==
X-Forwarded-Encrypted: i=1; AKwUvBzhB2bPJ48OY/iEiNZyHRegiLTWYpO+v/Hwr69p1QpbZ3eiMR87RNO2c0b6NKSn1cQw4QK+e6vQTtlkZkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMiefSWwi204qRWVdfoJRmkzyIZ9gxG0LcHt15ROkYbw4VUiss
	qzuehi2JvdTj9yE3xxw1iq7DF1rK81+dhGR5nyabYee0IRPMjajk998=
X-Gm-Gg: AYBFou3L7c91btoVkSYcQU/45ALVoqe1+76bBLXUB+KF8DMN+rDvRewaJYlt+QcN672
	LWJxjo1jxLjxXwXtLXPZWYQRzJ8jnU+aOYZSuwX1E1jxDvIOq0yQDX4iSzFU9efT7LiPBB8S7Ku
	glRcGAOA4XernDo85rQHhUad01MDwcGfVVPmQLBxoR8/p7TLZ8Oj7MtuLzR2Zvr2pTE+RD3U+bZ
	jQq48/2u8NJ7iajLFqW2Ro7fbdHZcreieien5OCduYZ8LGuNfzj8PuCZFQitU7aLrVA0Cq10Gcd
	4XQYgRMibq/2DjAShuqaCHhzlcBYczNCfxxA3RrAp05c4bxfU5NZ3zQSAIdDcL8t9DXfD1q9jZ2
	u/VdzwXwT0nZPjMYCLmmzCc/9YIk7KGbGtiCCQArXZVW4z3A6yIdFwnDzTc4OeAk8mklbwyufD/
	VAFkr9XY0ht1vLnAkRBBXb4MBx7t37JY+L6IzplBPKurEFr2USqYFsbQDX35qQGcB9qo3+4f8hf
	sl/haomnbKpdkCE6SZKmV3QqRAlDnjBLPtTipZIurDzvQmB3T31i42eFYWYpv4C1bC+KM0akQmn
	oJ9SKrY/TtP9
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr69475205e9.26.1793385250702;
        Fri, 30 Oct 2026 11:34:10 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm114204175e9.12.2026.10.30.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:34:10 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v9 0/2] RDMA/rxe: copy send WQE to kernel buffer (TOCTOU hardening)
Date: Fri, 30 Oct 2026 18:34:07 +0000
Message-ID: <20261030183409.195671-1-tristan@talencesecurity.com>
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

The SoftRoCE (rxe) send queue is mmap-ed into userspace, allowing
the requester and completer to process work queue entries (WQEs)
whose fields can change between kernel reads.

This series copies each WQE to a kernel-private buffer before
processing: patch 1 for the requester, patch 2 for the completer.
Both paths validate opcode bounds and SGE indices after copying,
preserve DMA progress across multi-packet operations, and write
back updated fields to the shared queue via WRITE_ONCE / smp_store_release.

Changes since v8:
  - Patch 1: fix atomic write resid check -- use WR_ATOMIC_WRITE_MASK
    (WR-level) instead of RXE_ATOMIC_WRITE_MASK (packet-level), and
    clamp dma.resid instead of setting mask to 0 (sashiko finding).
  - Patch 1: invalidate completer WQE cache on retry so the
    completer re-reads after retransmission.
  - Patch 2: write back DMA progress after each intermediate response
    packet so a forced cache re-read picks up current progress.

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 76 ++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  2 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 72 +++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 +++++
 4 files changed, 155 insertions(+), 7 deletions(-)

-- 
2.47.3

