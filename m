Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212816;
	b=gA+DJU5ARRdpSfibI4U6uMKNccW7o9Fr0Dr85XbhMOGUQdHglwAnjbfKD8/j6VILmI78
	 1Qc3vX9ylRgPoWEs04pPNadFVY2mBbOynTwSw4mO7rZaXH2M+1GC7tzlb7oiaufbFwlv5
	 NA3spUDLbJkwsr5pHbsVa+nMfIOTRnH4EcrzzzpRCTu9ifuI0qm1D+1fFM4znG/d6nBxb
	 XTxKrrEt3JlXWrUOwiG4x4PHtE5o2I6XKpsKkrAS+3Mq4EUdm8kb8POF71r8MQctqbs/W
	 fw4uLBrLc3Ca0bsXjKZoUaD4aiYCJjBP5JQ09AVXOONtmOj15RU0CMJOKrGaR1yO9EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QiKOO0YrqKharvG7Lk0X9XBUnnQ3jxJPKziFFjzJ2Mw=;
	b=y7NzMasLjvEXlXMUPTWr/ZK0MOrlpVX2ZClvD/hUTIlqH9qIWO8/4ArYimL+fBYOHdi7
	 5cbn+7NdrqxN4wic0fZMDi1+2PfDfp6abOg3eMMGJ4WXyctXn0X7qi0xu9Vg16IG5i7AT
	 9ydDpspdsRSdAG5ZXLod6SqjM5BWgSEEsq7RWiNKp5q+N7SlI9OxLUesQgF4KGZUGAlO0
	 8iUXtSJcjqauziXXLFkAfafLrG38BmvtD94LV8Qzz0sdFZbNqZ3Pl/lSQ3ctHIsQjws/r
	 p10gX+0xzBkZ+h31aA7eLfnlgTGwCcYwgNticn8o70AOochO3Yn3r2vEylJ0aaoapzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD3pDpnl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B18606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B18606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD3pDpnl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so15114335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212814; x=1793817614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QiKOO0YrqKharvG7Lk0X9XBUnnQ3jxJPKziFFjzJ2Mw=;
        b=tD3pDpnlXy0LkVNdZuYH7NK64MjzEnlKvp44lGFujmHV9TJZEVqtcNtNO7rr3Xr1ZK
         lVY1LdNvqSSMTyOY9ViS94NIYVu2ZhlDf3RffiFOkZP5C14n+w1l+CSqHiBc5sadFRQp
         zv/KuzK/vMd6L0DHutVe9desnAeYM4Sp5+Gg7MSNfOuUGnHNuddgX5xqM11JvzvIz+/1
         WAQBnCi/5xS2lvmNPh57WKwjWGJPesDMYtOCYKIEhADpEu9tYzqF6wU2tOAQpRY6kuSl
         sDHRhK0VCumOdypux/BHZl+g9VAmbM+iCAdnwX8u5uyudAbhr9HOJNxz4r+aAKesYqEw
         oy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212814; x=1793817614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiKOO0YrqKharvG7Lk0X9XBUnnQ3jxJPKziFFjzJ2Mw=;
        b=MDFbmmCxV6Aj0dBKZfS+YaXHGTYAXnJRfYVGhTWN79vU3IY2ABautVY++euEUQ4eMC
         0iO/AwsSNfV+PjZDeQlynw/jKCl+BJP/6p1qRHvvM14huR3zYC8N7jkKDZEHLUIYaOJQ
         Ng41Kt89ORCRvThSMrdp+1Y4K/UzH+I4TTKXEFcKzTBmKuPK+xsTnCkKXph8Nu5TT9Wy
         EmPqQmPdfq46MKQ3wd/Yo8kxve5r2lwDafsWVxGB/fhfbnOShsJn7WunfMCO2qFj7TOU
         G+3Lq8X78VSs9W8rp30mqA/v2X3MAAMeKO1A88fGqbM7BI2kZrcOrz2+RO/loJMrPTlw
         +s0w==
X-Forwarded-Encrypted: i=1; AKwUvBwH8qzPons63L2bbF/7xQ7SjHajJnx2m6qbf6zbU2SopHz/jAXtSVwo85jLC9SidfoCIj+uQbUcMX2PL+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOgYmoDJeUNRc6tyCz+i6cWJ4HloqpEFQ5/cXat8wqaa9LxSbZ
	P85IPKOzTuF+5e3pOW4E83ZRqVWHNq1FC83fjw36MrQDX0/zsgLKMp7e
X-Gm-Gg: AYBFou2CArS36tJ4sPQzosPlde1zI2dgKRm1YrAdqpk3MFKLpMXZhiafEiQgz0K+DX5
	vp3LDfAFe160wVRNAZu8XTbLHnVz7fc+Pzovw1qfoNuOVl0wTjBurMtBocIKrmoaZNEOBIwrEex
	R+709EIm5dBorZY6+8D0L2FIiHbIIn1sZ2KyI4Gsi+5tsnl6n406kHJKtfhNDHYAnGpZRjnlKhf
	hciFTyr8mHe1iuQ5kItw3q8boNv1+eYCeQX5FJNBKuuHUc9kBdoFaFCF9waMzz6NGVp+0RRpmTu
	TgQYEfOeQUXirihx6bqxB2e/IAJp+NTQagK2wTlIAbDg2SnnH57qbZ5oswMD18DCoVZ8xA+Xpvi
	VYhdAT2qvOEDBNrDqbew75/v7XVcr14icuPo6zwDYUgfvNYtAt0ds97YODMKIsSpsC5zO+NHsqL
	uTLyLYZfsP5CwvH6+Nkw5RrvcMBwSRV3WEBlcMqbwE6HMtzLf/bfFCXi/KVsQNXaXrBjdVvKLgi
	7l/VmYOLfUQojwgUfgfeqV2lyy4NXShA530HCEPT8jUtyT5FJV1hKFAVs/eR0OwsUCegyslOmNR
	laFt2tkfF0+QOG9frHTqIvBVHfhivmgw9cN0tT3A5ULdAgUZV132+5fw3vA1R5bLfrI3qbvvAoZ
	A67Ndv/NTZbbF19oEV+5lIw==
X-Received: by 2002:a05:600c:6555:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4aa8b05fa4bmr7063735e9.15.1793212813465;
        Wed, 28 Oct 2026 11:40:13 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm30862921f8f.11.2026.10.28.11.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:40:12 -0700 (PDT)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-kernel@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: [PATCH bpf] libbpf: Reject excessive program counts in generated loaders
Date: Wed, 28 Oct 2026 18:39:47 +0000
Message-ID: <20261028183947.9606-1-mahe.tardy@gmail.com>
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

An object containing MAX_USED_PROGS+1 (33) programs successfully
produces a light skeleton that laters fails at load time with -EACCES
because saving the 33rd FD emits a store at r10 + 0:

	*(u32 *)(r10 +0) = r7
	invalid write to stack R10 off=0 size=4

This catches the unsupported count during generation instead of
producing a loader that the verifier rejects later.

Fixes: 67234743736a ("libbpf: Generate loader program out of BPF ELF file.")
Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/gen_loader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 251392aa8b41..80a6b5306183 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -122,6 +122,11 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 	gen->log_level = log_level;
 	gen->nr_obj_maps = nr_maps;
 	gen->max_func_ptr_maps = max_func_ptr_maps;
+	if (nr_progs > MAX_USED_PROGS) {
+		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
+		gen->error = -E2BIG;
+		return;
+	}
 	if (nr_maps + max_func_ptr_maps > MAX_USED_MAPS) {
 		pr_warn("Total maps exceeds %d\n", MAX_USED_MAPS);
 		gen->error = -E2BIG;
--
2.43.0

