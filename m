Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793552695;
	b=RTwmGXIa3oLRRF8htAd2lp5xMTakEwgr+UWXpmSKzHV0Df09KHKcVuDR7ZCa+GBP69Vc
	 RRcgc5gWASSOPL7sgXGdUAFuR/hb7CVUrjjOArKpwE8P0+xFUbwNgAotaxZedsq4s0Ut6
	 8inUG85Sbdd+co/kkurmC5//XBGZ0gVi2W08t6hr54OwEaD0l5k1KpRSOxbDTHsWcEjR4
	 aF+Z7ru+bh5xWhOSY1eokYQ+1A1W4SLuPl6CMpJeID7SJVA2/1NgvceWkXCDeCfsNNrnl
	 LIEbE81B97ert26e6KEcdkJIorBw8LvJv2k40s8SAmzb89o0m69LtM3fLbNroc52GBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552695;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PJ8xawFkvQChuRbpRvFM3kzwdMyBEtgBeCZPpV2XFyg=;
	b=eYyqXezHVsX+sPzQ3pQWCPnM8QRk/WiEMoc2p1DtvD8kXFdHB5PBVGJ5qKxFVnHdjXiY
	 fgaR1kdgRAnO2fLquHSujsP1T9CH1Sg+vU1BDKx4YEQ4nDEghw3Pqg5YlPprFAnFORJQz
	 7FJyupmYT3MKr5WwQeYxJOBoWHCyPHfqs5juQKIo/gq18LL+QyX7jhIYzNKrlxVZL+FAg
	 xIwF2rRH60uQ6FOnyAEWjjf36u/2Cu/0+ngYjk6zwv3gSBVCwg3YFjMWSeyrKV2b9DWFg
	 iyxIw8gMZzbI2htaMyMqC0U7pygPjJCSwIYVAvoz0KW3ADCZi9Dd0EjasoIB2AcxtKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWFKsSjK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761EE606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWFKsSjK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793552695;
	b=qfjWH5+04uhsEJN8X5z5hdC1sLJp2JEOm4yJ85mI692oviINv+FwSN+dH0RH6aV1CeDf
	 ChIcnvikNEZ34zDp6lgX4eNMq8foXfhnd0HkQ04y+LzMBwYqsDx8K8cbaIsvJY0LbSz9W
	 UJLD1vEqo4kTsN+TIkgRWAInHEN5NOBjDqMGraAGsqCOYeIxCToHnHRiMZtsW4y5Y66PW
	 AU2Tpc56XaJ798i51td6GFPqt00y2/lOPqTjxATC+EasKndogylniLTVBUKb8ZoiKuYik
	 evCbyDFaexbSF/rw8pRGXM7KRjUYhel3OxvWazIXE5FQiO1HfCQPJg5vsAhaonGZF3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552695;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PJ8xawFkvQChuRbpRvFM3kzwdMyBEtgBeCZPpV2XFyg=;
	b=PLpVEs5Gu/t0rFhnijQGjoDiu7//4Sy1P+RVPmUFmfyiTVczSb9u+FCjSJdiGVPx3YGc
	 G8W4aalxyhNlG/Moox6nlGeUVISjqY4/bsXiBiwuDy9vdDbnm3YbLqB3uunf1kqycKY5d
	 OA9/NHSqmj7x0pjlReaCPnzGCdgHbwjFXwRWSOVE18jtVny/pv2bFiTXAE47/qXjlN7MV
	 LZTRbdPvsCK+2CLT4FpuEAa0IXaH1irv8NOvNIctqXs57A0kkkeONiwnRT/78sV3dDg4q
	 UKGb+DW23nSboyHwdOkIqdd7GP70JwntKu7gmf38KRLgCuJKmKPXaQsaNb2hVxQH73g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF281F00919;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793552695;
	bh=PJ8xawFkvQChuRbpRvFM3kzwdMyBEtgBeCZPpV2XFyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hWFKsSjKc7QjZnpePN0uyidulXuwPGOXphX9fP0Z+84iVAQEi9A9GSNxvftKw6mGO
	 bJuUDWVi15fLfTPKMoj1mO79uV3ttnXGPogOFxpyZTaETKjdvVn33O4N34NbllxET8
	 oBaBtNFco3YhYlTU8AjjsHQTxb0N+VeVRrMXwW4sw9NuC0tfpBlfulCE8GY+0Wzu7a
	 /4SULSTlHdCMj7d3/05EtGrKxZRxAF3TjWvIJPEh+xbU+RX7pK6fsI2Z349mnylLeq
	 Jx+cnhpapzZIKmwAW8I0+d3vx9v0KQplmmjw1jwywTZMwWpGvB9wO0BLbD3RcOFMkK
	 rNUhM6U+Av+IQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15737461F2;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 19:04:36 +0200
Subject: [PATCH v2 1/4] x86/mm: Don't randomize the CPU entry area with
 KMSAN
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-kmsan-serie-v2-1-f97f66dc57ef@gmail.com>
References: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
In-Reply-To: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Viorel Cernateanu <vrilutza@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793552692; l=1962;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=3GnlWiRUuop6GUO7x6h5NkCg48nWG8mPXHhT2pkVM5I=;
 b=yKz6MZ9gYqyG+QuCK81CgBR/q2zsFoBHJwnWKEvwQ6EyvvaGBEtoqNWRB3Iz2r9tvXCtvXbik
 qf1R5WMpACrA7a4Vnzww4SNVFt8w/FhpREa3DOYYxUVlJc+Mp+u3K2y
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com
Content-Transfer-Encoding: 7bit

From: Viorel Cernateanu <vrilutza@gmail.com>

arch_kmsan_get_meta_or_null() derives the CPU number from the offset
of an address within the CPU entry area. This assumes that the areas
are laid out in CPU order.

With KASLR, init_cea_offsets() assigns each CPU a random slot. The
metadata lookup treats that slot number as a CPU number and can pass
an out-of-range index to get_cpu_entry_area().

On an Ivy Bridge laptop, this causes a KMSAN kernel to oops during
boot while the hard lockup detector sets up its perf event. A QEMU
test that reads one byte from the current CPU's GDT alias reproduces
the out-of-bounds access:

  UBSAN: array-index-out-of-bounds in arch/x86/mm/cpu_entry_area.c:25:9
  index 2100006 is out of range for type 'unsigned long[64]'
  RIP: 0010:get_cpu_entry_area+0x14/0x50

Keep the CPU entry areas in CPU order when KMSAN is enabled. This
allows the metadata lookup to identify the CPU directly, without
searching every CPU's area on each lookup.

This disables CPU entry area randomization for KMSAN kernels.
Kernel text randomization remains enabled.

Fixes: 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area")
Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Viorel Cernateanu <vrilutza@gmail.com>
---
 arch/x86/mm/cpu_entry_area.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 575f863f3c75..ce9b5d0e968d 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -30,7 +30,11 @@ static __init void init_cea_offsets(void)
 	unsigned int max_cea;
 	unsigned int i, j;
 
-	if (!kaslr_enabled()) {
+	/*
+	 * KMSAN works out the CPU of a CPU entry area address from its offset,
+	 * see arch_kmsan_get_meta_or_null(), so keep the areas in CPU order.
+	 */
+	if (!kaslr_enabled() || IS_ENABLED(CONFIG_KMSAN)) {
 		for_each_possible_cpu(i)
 			per_cpu(_cea_offset, i) = i;
 		return;

-- 
2.53.0


