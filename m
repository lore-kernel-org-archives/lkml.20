Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793552695;
	b=UjMQUDi6uI6X5JZTO4f+XzhhVEEUI8/EtEAZ0Nbyfz8Libo/GBkblNxPmf8Fmao/DHOe
	 4JKH7+qvoskzZGxuqLD7+tPzO12r34AU6zEfiVxNNa7bqWmsw1mPtZVvN6jwBmhY260VR
	 XERqRa6renXfH3CIdGyVSrs/VWD8Pkz4UJQvkR9GududzsltXYz7sGQ2lNu3ySwZHKXBP
	 54nrrFeEFMbB9cM8RKBbbyjF/zn5r6dPyvyMz5NpEpfJTS3gQK1PtapzjaCHQ9kzSq8qL
	 gxNcun084M1gX+RFka77UedAdHqCBmTg8Qec9Z7vsKIRqM3HONOuMwsp7xNpgK/jHFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552695;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6ZhjtEGoIXYajBUtxBWTOChkOo/ZSi2InW/pWlQIKSo=;
	b=wihNlad/cf9uSRFI97deQpdbMMzHRpXBF6MYzokiE2N581DkSUUQPeMt4x8mVNeOteFV
	 Zt863EmN2L8Yb5mgmAIB48D40LLHjPXQtquvpkWo/iWQ1DtPcgKHGRMRTVBYSDJkpJC8G
	 uW/naWKYm3MCXhpImXN/esGTorVWQveEk77pI3P6DEI4iFA82OXyK0zJ93VSDDDsfNRes
	 2mEF6jg5RWCNXkJuRLShuUvvIeHW1EsGY7V5hQs3qWg1xuAUTBpYhRdwBSBVBmnghdz77
	 XjmZrMAMrZ45LFpmGP7BWb3xOdT87FLusOhsF+vrYN/0PvnwyuizuBZo87QsGwDoMXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVSQsGrN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DA606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVSQsGrN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793552694;
	b=rVfBmOhOupH6jF2EvJZWbDIs237Ru4q7O0UDATYK+t9EGk9n9tKmV3KtRZlNFyjQ1cbj
	 15VLd9c2mmEZrOs4ociSU89cG/6iLCQ7ty2oyYs8mNBOExgvlVgoI1kmVX+FuXv3yYzln
	 KBHjgc3enqJnIRNGwndv1q2VxTZvJBkYJlZ//RBXXbbpt4gmALnwjA6EfpN0znoDADT9v
	 PbZL1rEVSHNsaCUwKWAc+zZeKt0Ckv0SuTBrTBy/p/vTnrRyD+hZEln/gkmVlNoqeSJNI
	 5tXGLvC2uIVf60gaJP4bs/wL2u/FfkwQkMuk/9iyrIWhrFDGsBz/qmi+cN6hg6+ypnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552694;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6ZhjtEGoIXYajBUtxBWTOChkOo/ZSi2InW/pWlQIKSo=;
	b=BzhdjxU2JsMC5nYhku9+3u6jOa8u0EP5NlsTtXuZ22VndSDDMD4vMzy/HNeoHEOmC7Sf
	 N4Ty7a+gYVAYatLqOFV12/PXWIrAMcpnGh7+OKKl2zTsUkAlfwWP5O6ihpK3wKzvWDXUM
	 qIRmScJ6W/xnxnLxDkICihTWKatRynGSAB01JaNbaNnlQZJ6ZoddlAngbt8HtPKnSfWK1
	 lSwKxgvrKMfD0gkRDy/XXIo3hrz+nW7bm9TowA7w7W3lT2GQfJO9mJePMyG2aDjCRnjyc
	 e2mXb6SBS1qLeH/2DBSJ135aexexcQ3czza8T/y3JpmpIf0KyaZM9jZjepLLECgSCHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF031F000C1;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793552694;
	bh=6ZhjtEGoIXYajBUtxBWTOChkOo/ZSi2InW/pWlQIKSo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QVSQsGrNCtJXqcbIhhCWw6UEOCLVTwgs9/s0cslmMr8i5e6dMZhci/aXJHcWYi15P
	 GnLO8fQi/qvc5Ox/Lb73WXPS1d0hFbX73vCFzBTuj9zyIBR4Bm4NJlm/R9F2Ib16Pr
	 LkzGqtLTzgAiXYlyraOsMC70xCbXVkTfZjqQ8ZHroHQO+XiamzZ3x38ZEeZ0xKKKY4
	 f5xwqqv0M3IYLtdRAHytNgEPjWWMwf59Ju3fTna9NkLlLpuP2I4Dxhxqmg4kobOfLj
	 33diIx+T3VoMu+zCbSamo7PuX7M4J2fIpZ4tiLAhwllAm0ebKUDxo368AUTwH51wAo
	 Ren/Lp8Dwn2rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECC1846203;
	Sun,  1 Nov 2026 17:04:52 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] x86/kmsan: Fix two bugs in the metadata lookup
Date: Sun, 01 Nov 2026 19:04:35 +0200
Message-Id: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OwQ6CMAyGX4XsbE03EhRPvofh0I0CUxlkw0Ulv
 LsMrh6/9v+/dhaBveUgLtksPEcb7OBWUIdMmI5cy2DrlYVCVUjEAh59IAdbCzjPEVHLsjQs1sb
 oubHvzXardg4vfWczJUVKaAoM2pMzXRrtGk1fgqjSvrNhGvxneyfK5Pl/OUpAwFND5wK5yWu+t
 j3Z59EMvaiWZfkBwydlCdgAAAA=
X-Change-ID: 20261006-kmsan-serie-e33000b199ce
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793552692; l=3024;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=70IlPx1AKJ8+cqwvWRwobdqND9Oht8b+HJuyYoNKqmg=;
 b=FdDO8TSJQ+sj2UKnZMnNeYqMDmWCZVcKj/oNKlP7ur1VuKC10ya7OWVdZ7KEcPuzmH5QOLV9D
 REcYDbXZA/nDm+/qM0rMMa8PViACooI+H01bEDMiM1InW/oheZrWwAo
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com

Two fixes for the KMSAN metadata lookup on x86, found while running
KMSAN kernels with KASLR and with CONFIG_DEBUG_PREEMPT.

Patches 1 and 2 fix the CPU lookup for addresses in the CPU entry area.
With KASLR, the lookup treats a randomized slot as a CPU number. With
the areas in CPU order, it still attributes the last page of each CPU's
area to the next CPU.

Patches 3 and 4 fix a recursion with CONFIG_DEBUG_PREEMPT: the metadata
lookup ends up in the instrumented preempt_count_add(), and the kernel
hangs right after KMSAN is enabled. Patch 3 factors __pfn_valid() out
of pfn_valid() so that patch 4 can use it.

I tested the cumulative series with the v1 configurations, against the
same unpatched base:

- QEMU reproduces the GDT lookup failure and the metadata boundary
  failures on the base. The corresponding tests pass with v2, including
  the metadata tests with and without KASLR.
- With CONFIG_DEBUG_PREEMPT, the base hangs immediately after KMSAN
  starts. The candidate completes all six boots, three with KASLR and
  three without.
- On an Ivy Bridge laptop, the candidate boots with KASLR using a
  minimal init, and the GDT and metadata tests pass on all four CPUs.
- An x86_64_defconfig build without KMSAN boots to init.

I have not tested CONFIG_DEBUG_LOCK_ALLOC or measured the performance
difference.

s390's kmsan_virt_addr_valid() also calls preempt_disable() and reaches
pfn_valid() through virt_addr_valid(). This series does not change the
s390 code, but patch 3 refactors the generic pfn_valid() used on that
path. With an s390 defconfig plus KMSAN and CONFIG_DEBUG_PREEMPT, I
only compiled mm/kmsan/, arch/s390/mm/ and a few mm objects that use
pfn_valid(), with no warnings before or after the series. With
CONFIG_DEBUG_PREEMPT, the s390 metadata lookup still calls
preempt_count_add(). I have not built a full s390 kernel or run it.

---
Changes in v2:
- Keep the CPU entry areas in CPU order with KMSAN instead of searching
  all possible CPUs on each lookup (Alexander, Peter).
- Move the one-page offset fix into its own patch.
- Factor __pfn_valid() out of pfn_valid() instead of adding a KMSAN
  copy of it (Alexander).
- Rebase onto current mainline.
- Link to v1: https://patch.msgid.link/20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com

---
Viorel Cernateanu (4):
      x86/mm: Don't randomize the CPU entry area with KMSAN
      x86/kmsan: Use the per-CPU area base for metadata lookup
      mm: Factor __pfn_valid() out of pfn_valid()
      x86/kmsan: Don't call instrumented code from kmsan_virt_addr_valid()

 arch/x86/include/asm/kmsan.h | 31 +++++++++++++++++++------------
 arch/x86/mm/cpu_entry_area.c |  6 +++++-
 include/linux/mmzone.h       | 42 +++++++++++++++++++++++++-----------------
 3 files changed, 49 insertions(+), 30 deletions(-)
---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261006-kmsan-serie-e33000b199ce

Best regards,
--  
Viorel Cernateanu <vrilutza@gmail.com>


