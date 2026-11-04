Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776215;
	b=Uvgse0dMh2QBfcuM2e6McbsbH5UY5SxRPhDLjCqI94t7bQJ1F3aGBR7o/+he8sOKL/9o
	 kGdD8yNOMo6QI6LwRXq7IzMWxgVk4XhOLFieUSiTy/72j+KGjXkcamu6adssDqPouSC9M
	 kAtVaipiKpviQPWLEeTOGfIXodq5x0vMVgSSCO7y++HJXGgJ7yD3RBoI59tvnzh9+0fb9
	 sMEFC3u1mYrLUGSyG4DcYN5SP6XW7BxmqL+o8mRfTiSn7hLvqMLzLB6M+fd3Hglnd/eUQ
	 Dq26hPbaQ8QAJEy4KLf++/tKRSrB3GLcUspBx0VjbvvxMnd24actHZCPX6Zz/I+LUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JhcjK44jzqfwISimpbYLtHkEsfZ2sH/PIN1jlamuBwU=;
	b=a7sBn9dQyk3uq/KrNlLn9ygCAlPa2vJCCY6mIBEYez3c+Xxi79IIb8h70Us04RzjOP/y
	 HLYayhOGBVh4NBDjNmsR15dssoBrq0aQ2lHh91E3iES9h2r7X+MCP+4KrN/183e/FwWFp
	 TvEBF9TWmZOPRgfFr1gB3sVpX0wDea0U068h/KNnXbmAWEMGC2QrGJRbknJBog1+S8UdA
	 UFVaD8LUK6O77x9p2b9VuYk62i/FPECP8NeTBgrk6VjTC4NGhYAIuwrZGhrlwWPxBdXYf
	 4ZWzNe9CAr2Dvo//ROOxgr5xnrtdHqSOkw0f4KIzNHbq98oOssGasZlo5uacJ7KS9fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p3JF/d5q";
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F771606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F771606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3JF/d5q
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so164106a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776214; x=1794381014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhcjK44jzqfwISimpbYLtHkEsfZ2sH/PIN1jlamuBwU=;
        b=p3JF/d5qISNlqFT8OHEBgICb3Nz4rS+wiVeNnS+hQx/BN++8gSH5sfDjH4SDdBMkRB
         P72mhK4HcwoBvvTPGgp4OyotjrneiUBfr+wUwqbOKHlM7+8XXkC+Co2xwWP879/87T2G
         /gO1TwrduiV6PJwI0iTyJSBEvpa+3FSkOWicE668nQljYiTT4rzOmOvMwO0DxMg9GQu+
         FdhZXTa/U6ldQbVuBNJxuueELNJFDRtoVA8jYzKmo0J14558AaK26jhBJd5HT1CwAZDK
         sJeP3IMXZYmPhfrMURq7GME+pP3ANCz171B9Ls2eWpnkb9026KJFtEvVURdySo6YyAg/
         YwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776214; x=1794381014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhcjK44jzqfwISimpbYLtHkEsfZ2sH/PIN1jlamuBwU=;
        b=kNrOd71oZHvuobNX1K82NLijuleWWqdahA2H7tVQzWkUwiv2nK1AeZT7lTV0UwuMkM
         lui7BkuPUH22Wj46RyM7ItJ1tG0vEVaF3l/tk7V3RBVI9tv0xeZ6RqXRk0JOU4My2Yid
         zLS+cbUoNUM2EBrCs5NOPBHc8J/YeLlyDq64IsOlsk0Aj2iC5PdU5IpRHXzHsaNLKJmG
         Y2KzLw0MG1v/3Sy24RnpeAacH6DF35LG18wMWkMZnpgxhfC6fBg+qFoF4yW7frMgUAy1
         y5csSBSRbDiZZgu8nHwLCOlDilESfba2FyeDws5EEun+NB86COO/3qfsqay2DFIwpDgg
         DRUQ==
X-Forwarded-Encrypted: i=1; AKwUvBynF7LIOqcq66t5/n/tyIt/AsbCgwwWokGlkks2XcadmIPgPgVqg+9bYdQ4oIUtXiWtreSCGGIUGZd1H8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pDrcfuYJ7NDFAz7rPFrMmLVyGOZJjCRA2+wbvMaPVuHk1vlBi
	GTWzODF1IIkJIu1PlZJ5BWneldLPfWpqAodR0R9ZcpetUpjDKPOncoqD
X-Gm-Gg: AYBFou25oQBZzx/St6eUEz094sCvrhWzqEGMQDPeLhzhgqzCR7ExC1I+rsGErVLj65K
	zdxb0zbArNWNQh26lLjRNvMAxJFXL1gPKvHszyv34/IEVnSW07y3jR2Yq3PhgmkjM1BjcX9bCnI
	8vxhMzAC0TboqZMwjmqp3U11g3QvfTp2l/WrHIec4sUpGHkl5PycKJSQWCduGPLd7HblFSpBjr9
	Nw2KV1PTdXfPGrukABOgUorYX4YanAS/sC4nc8iecqFAFPM5TrjK7he5FmjqmgLJl/2dioRSTtR
	+1Ah8alYXP16moQn/t/NeHab8H5IkjrJgunYSiihNXO/uj9kpYqe9xxmoHEecyIDWvCFWJQ36ma
	nOcBtkvVq9Svpz/FhEjxhmezbyPLY85fsI2HKcWbspSJl2XA9Wkcuy+vOoOxZFgaw+vxMX0CgYn
	RXO26T45CAYbzbXznNDGcwn44z1n/sL+ODbXWzrgfv2n3dO8yMxFNr237XDBmdM4rqtYPcV3Rqv
	uKhDIIBOUtj1EzeysgXPyNne9PGQj1iNX+2bmBhtzK0kDQgPKleD+zyNsoadbed438pCvBOO9wQ
	vSkY2Mwfi9S188lFISnoBvNBS4rWI8PEyt+T27ggNcUI6v1GUZIgd58kNxQoxqdIjZhZ1g1gmR0
	pi2gAHlFqkQbg7LndepZK8OM0v3dcxN8aZXqvcw==
X-Received: by 2002:a17:90b:2547:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ae89536c0cmr12582654a91.6.1793776214401;
        Tue, 03 Nov 2026 23:10:14 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm2651997a91.1.2026.11.03.23.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:10:13 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org
Cc: kas@kernel.org,
	dave.hansen@linux.intel.com,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] filemap: prefault writes starting beyond EOF
Date: Wed,  4 Nov 2026 07:10:02 +0000
Message-ID: <20261104071002.49693-1-dennylin0707@gmail.com>
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

Since prefaulting moved to the slow write path, a buffered write can reach
->write_begin() and ->write_end() before discovering that its source buffer
is unreadable. Several filesystems can extend i_size in these callbacks
even when no data was copied. For example, a one-byte pwrite() at offset
4096 into an empty file can fail with EFAULT but leave a 4096-byte file.

Prefault the source before ->write_begin() when the write position is
beyond EOF, and return EFAULT if no source bytes can be made readable.
Overwrites and appends continue to skip this prefault. Keep the existing
slow-path faulting for forward progress after a failed atomic copy.

This also leaves intentional zero-length ->write_end() calls used by
generic_cont_expand_simple() unchanged. As with the previous prefaulting
behavior, a concurrent userspace unmap can still race with the later copy.

Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
Reported-by: Kiryl Shutsemau <kas@kernel.org>
Closes: https://lore.kernel.org/linux-mm/at9xXRhD2xZhszEj@thinkstation/
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/all/at-XtWBQg3jv3H8Z@thinkstation/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---

 mm/filemap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c6f318333427f223b9f42061a6213..30414d55412b84f11ebe98b8eea607ee8c04eef5 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4389,6 +4389,16 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 			break;
 		}
 
+		/*
+		 * Some filesystems can extend i_size even when nothing was copied.
+		 * Prefault writes beyond EOF to catch unreadable source buffers.
+		 */
+		if (unlikely(pos > i_size_read(mapping->host)) &&
+		    fault_in_iov_iter_readable(i, bytes) == bytes) {
+			status = -EFAULT;
+			break;
+		}
+
 		status = a_ops->write_begin(iocb, mapping, pos, bytes,
 						&folio, &fsdata);
 		if (unlikely(status < 0))

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

