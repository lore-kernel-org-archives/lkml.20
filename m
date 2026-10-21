Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603067;
	b=yIW/Hud7ucEl1Q1Zy1x9/fdS9JTNNQx+cGPm69v3r8j/qgxiCu6aqn4u3y7XtRaFeDm5
	 GWPoCipMn3HVZoYuJ1i1XvETplzAtVslSciriBmB5zd7F4zHfI5VDKzcnJt4xN7oEBNRO
	 V5CSayBEEvcwteKZ0YLzTcYIr3AMa2nuNIt27EkQtlZ2Qw12BcVGEmlcjjNwMlfyzPm1E
	 czyAeSpazcwoEH6Ob1A4sEcwQ0QbfP2vhoMqiQAmOOR0nosKMu5Trmx4AuJSFCfRl8iM+
	 IpmWxIhj+GP0lL0zC9bU/kKHOV7qnKOY2dHn74hHH4KxKfcqHDQXUIGnpt+9RXKcRGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=;
	b=sIdp5JPaPF5Kx1pIjMiFIgvNirz83qJ1jv5E/US1Ws7XOflETYvyCmLGX+ZqOIj4aZ+S
	 W8PilQfPX7vQ/rhih7uqjfDlG+y9NW6qpv3g7MB30rbDmvBCdgOK2yfZR8yW98c8LFKSY
	 fQy1jnXn3ms9muvqiGXga4cfbpEix7ASdT7calL7bVmKvhUDhEZUuIiaylaakY7Ijyghs
	 Pp2S/f8p9npWge6CTEK3MITEqO8XC+SFc6+cjJWvkfaJ1DwfBeBH1flw5bncat8bghtsd
	 r5slvpiT4nIWV+36CfSgxGJo/ynDZCEb7f3o+oasauJvIHmk1uRjFzjHWcnLHctJSxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Jz5VKkJ5;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ADB606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15ADB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Jz5VKkJ5
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so1285433eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792603066; x=1793207866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=;
        b=Jz5VKkJ5ki1POVc0ACWEJ+WCtbCo14qie6gLDrZc2KlkQLBROIfXQ8NuX66MUvAIlI
         hq6wIPUQcbcO6fJy3Ob0V0Pa9PpzPmSkBKu1kP1y5NvredHIYviXEQqulk3f9TVbyBEC
         m2W01IFBGi18VKS1/c0by3+YIjfTag07ELRegp9PeqQoQv/W1F9pHZ/BWn6FjTwWCrX+
         6HFgJeL+6xhkHNYqhn3EGL7eMm0TSLBR4OPVFm73RQifYPTpdzhJp+0LyUJYxh+J+Rif
         epCI1INPp9a3i+fgbkYpZYB0M64+dmY7wu411aRwVReuxRAEJ6WJCLDpAba3V3kot9EL
         wxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603066; x=1793207866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=;
        b=XV+FU8UGdifBd/mkgjTmeYnT/bKfoeGJSeT/lsKsAbzAuvxa6g8wmhO1QZSkn8J/Mz
         Z0bxhZe2J0FdStCJ9IHj8ih04ynzyOWlUgcgDU+a/hC/jJ4p4v+x9kYyovLZGZNCZhMb
         MKSICm3RJ1LpsEM6fvvs5q2YmgKh+Cjh8tM5jsSQCGO1E3bqkN456rstKCmCFeDWFmlY
         877qu2PsY4V434VqB5L0TrPYBnvYED4mxOyWpyjdcz4OfmWnzcVBM/Rj5aRZeEZGOhOx
         YTf+cGolRD7qqUwquCgckAw4XN1tg5WWSvc56ZWvg00TZo2p6yaw51m44rHNJca/gFWR
         ZveA==
X-Forwarded-Encrypted: i=1; AKwUvBziArcld1PLmr6Gm+4DsW5iokxI2jtpK8nNV0FqH3vjksMOQyT/xf6y9EL5JlOQbBD2A/58T6OIBww64Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ4oeXbfIfkOWySXr5excv2199TwQm6Rzq3cUqF9j2owvbKak5
	FpkObovGeU5sB0o+GsJjE0edszpPnq1YWoXR+cazgaW/I82gtnjjfgM6XqOXhkM5FRg=
X-Gm-Gg: AYBFou2Z0+prIrrLSdu9T6OQt2g4qyKkxi8V+SNl962w1l5SDraEcA6wehC17T19KpH
	JR3lICWbWu2knjf3YzfA6+t1t2hujJWoZGEgJizPXSY6pm7k0IcEko2VDa5q7qK4SQamMr8mCOo
	5qljBvqccxjpxmbl5dwLrvNMuzwRLGdic+nG76rYvfvKx4H8/4ME7FpbJkD4P0ewu4629vkkHTS
	GTPs8pfTyFpq3j1DHfoEpAsfqq2MBGeRz+JXcqHoKi51wzZpu1hIgMhMndgZ3JawTWgRHi2M2UP
	HEcscCe4ty8Pbz+OQw6PGk3RXVLozruj55/nkHSOMMXxKRt3MlKTOPCzBWZa/5L8/RwwvhQCN1j
	ZnDe+JPdfLsUSdJxcPuQR9yVR5Ww2l57jMwDKrEXUHiTq0GN4mihTcA15sgidi8WO4WutyF21dh
	ZMEjw7IeERr17EtGMh8nJuFrlFVJLKrGQ1TWuF+M4+aRfaFwAifusppsk0MsxH2aYBgFq2QoOvY
	XUAyJh4fBUuASwCUg2ZoIL5Z1vAdnnZqSFyu9BIoOkhNWt/7tRKGgW1vhDzPGuRyer6HSh+wHA+
	Biul141r+hQx7r/7yXLr+hMMbq9y9kyvVxDpqYg6ZxbPrJ0/c4ZybXym3Gc4cV54H47V/nSgPQ=
	=
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr3602008eec.37.1792603066175;
        Wed, 21 Oct 2026 10:17:46 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367412b24e3sm7811387eec.19.2026.10.21.10.17.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:17:45 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	catalin.marinas@arm.com,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	fuad.tabba@linux.dev,
	ihor.solodrai@linux.dev,
	jolsa@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	martin.lau@linux.dev,
	memxor@gmail.com,
	puranjay@kernel.org,
	song@kernel.org,
	will@kernel.org,
	xukuohai@huaweicloud.com,
	yonghong.song@linux.dev
Subject: [PATCH 6.6.y] bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
Date: Wed, 21 Oct 2026 13:17:42 -0400
Message-ID: <20261021171742.310-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
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

From: Fuad Tabba <tabba@google.com>

[ Upstream commit ef06fd16d48704eac868441d98d4ef083d8f3d07 ]

struct bpf_plt contains a u64 target field. Currently, the BPF JIT
allocator requests an alignment of 4 bytes (sizeof(u32)) for the JIT
buffer.

Because the base address of the JIT buffer can be 4-byte aligned (e.g.,
ending in 0x4 or 0xc), the relative padding logic in build_plt() fails
to ensure that target lands on an 8-byte boundary.

This leads to two issues:
1. UBSAN reports misaligned-access warnings when dereferencing the
   structure.
2. More critically, target is updated concurrently via WRITE_ONCE() in
   bpf_arch_text_poke() while the JIT'd code executes ldr. On arm64,
   64-bit loads/stores are only guaranteed to be single-copy atomic if
   they are 64-bit aligned. A misaligned target risks a torn read,
   causing the JIT to jump to a corrupted address.

Fix this by increasing the allocation alignment requirement to 8 bytes
(sizeof(u64)) in bpf_jit_binary_pack_alloc(). This anchors the base of
the JIT buffer to an 8-byte boundary, allowing the relative padding math
in build_plt() to correctly align the target field.

Fixes: b2ad54e1533e ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
Signed-off-by: Fuad Tabba <tabba@google.com>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20260226075525.233321-1-tabba@google.com
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
[ Backport to 6.6.y: Request eight-byte image alignment from
  bpf_jit_binary_alloc(); this target does not use the upstream pack
  allocator. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-23383 to 6.6.y.

The backport requests the same eight-byte JIT image alignment from the
older allocator. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: the ARM64 JIT
object with BPF_SYSCALL=y, BPF_JIT=y and WERROR=y; no runtime testing.

Thanks,
Artem Dinaburg

 arch/arm64/net/bpf_jit_comp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 9fd0b658e4602bec2be466665d880a355e5bac1a..c5f7276ad1af7e32b69eb9bb5c0f14c3feaa74e8 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1648,7 +1648,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
 	image_size = extable_offset + extable_size;
 	header = bpf_jit_binary_alloc(image_size, &image_ptr,
-				      sizeof(u32), jit_fill_hole);
+				      sizeof(u64), jit_fill_hole);
 	if (header == NULL) {
 		prog = orig_prog;
 		goto out_off;
