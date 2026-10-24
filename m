Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868874;
	b=KlbIPRQwb+gjC4xJpeoI/q1CMcG9fIWQqfPcZrQfUBwUhwzYm/DagCdxDD9qTNyIHo9q
	 pHQdpV1vjP4ibGi1jCYa93VFIi1O5dKo8MtzqBX8q9bsUcboOtN7og9rL4gQRdSGpWFQ4
	 7AclEEI1m0KQfey1ifB0TRMdTolsrC/UVOe8MJ13YIyv1B1z9PshaYt9qNaQ2N4gIwfxg
	 HmQvGqNRDIk/Iat5vgdpfBgpDXmC8+xeIMp+ykwZ3zFaWCvEyiskkcve8YJnigzh29/YT
	 4zIO9QpZDpMv0z2vtHbpnXym+gEiC7mrbdeOC2oqY1KpNFJJpdbSvC2ubz8RsWfPqFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868874;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=xS1eidmCgw0TtGME8hMj9/K2ujfNnd//amtw6mOPrqE=;
	b=UxnWvGs8Cm6KrxsDKEjEUOQjXdmzPTBGPWwFb94FJB4d1FMbN0ZF+kkKCnT2jf6gu8As
	 YBXAQR1FAevI7Odv4HYZ/7n4de2X6ebIyZzGExJ4fYI23IQ2YUGpRuh0ZCJHt10E6Je7j
	 0HkgmbIztbTFg5FtB1sKnmYZy25Pf2ZU7N6eDFJnEDQLiDnFGr3KzNPQo9tMVwpHxV82H
	 yREwXkWi3rxyWmhDqN4bszsS2d7DlQs28+nR8RHu3yuOdTQCJl2GA+1R0iSB9hywzRBcx
	 JhP/qoYk4tkt+tuON3DSyOu+dLdEpiRqIFNTNu7eIiAyM2ScLlpnondcMlRzT/FDMoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYWBq6IX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB9606A332
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYWBq6IX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB88A1F031E6;
	Sat, 24 Oct 2026 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868874;
	bh=xS1eidmCgw0TtGME8hMj9/K2ujfNnd//amtw6mOPrqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jYWBq6IXlX+Bk3kW46e3tkdgYin6u7tEZ1VcPI7AWncbyi4nhaKgYfWZRWZ10PY5t
	 AQzE/OHM60HgY0H4QL5Bk6xpoBeIV1MqgO9RTW0uQ+bYLwbaxCy8M4Wk3yd2VqrV2L
	 se7c0vlM2BxedvhMyL39HiCj1vlROMjo9I4dMF/erIX4RXRpohPzf7W38OKpIEBxuQ
	 UuZ0eobPH2wi+Mgt8kAF28nQL2EU1utgBrjgORv7jl848Ghspdg0R/orvBBDS3lS5i
	 xdU5ovIp9BmzcdXVgNpA/7h25Pg3kcyf96F2oHRtXOOTiWCbhZ+FTuN2TmHUum/iQU
	 ukSiO3ZoH+m1w==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:29 +0200
Subject: [PATCH RFC v2 7/8] mm, slab: add slab_tiny boot param
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
Message-Id: <20261024-slub_tiny_rework-v2-7-bf1419ab5ffd@kernel.org>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
In-Reply-To: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

In order to deprecate the CONFIG_SLUB_TINY option, introduce an early
boot param slab_tiny to control the value of slab_tiny_enabled.

As long as CONFIG_SLUB_TINY is still around and enabled, this boot param
can also override it to be disabled. That could be also useful if we
later add some auto-enabling conditions such as detecting the system has
only a small amount of memory, or being a kdump kernel.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 Documentation/admin-guide/mm/slab.rst           | 5 +++++
 mm/slub.c                                       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 03636d799837..29dc1c812473 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7043,6 +7043,10 @@ Kernel parameters
 			NUMA kernel object placement which helps with slow
 			interconnects in NUMA systems.
 
+	slab_tiny=	[MM, EARLY]
+			Minimize the slab allocator memory footprint at the
+			expense of SMP scalability.
+
 	slram=		[HW,MTD]
 
 	smart2=		[HW]
diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 0beeae71d472..350384908631 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -94,6 +94,11 @@ kdump kernels where scalability is not a concern, but memory has to be
 
 	slab_debug=N
 
+Note that for this purpose you can instead use an option that can achieve
+slightly better memory savings (by not creating separate kmalloc-rcl caches)::
+
+	slab_tiny=1
+
 You can apply different options to different list of slab names, using blocks
 of options. This will enable red zoning for dentry and user tracking for
 kmalloc. All other slabs will not get any debugging enabled::
diff --git a/mm/slub.c b/mm/slub.c
index 3b1491de5be7..3b7ba4fdeada 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -8829,6 +8829,13 @@ void __init kmem_cache_init_late(void)
 #endif
 }
 
+static int __init early_slab_tiny(char *buf)
+{
+	return kstrtobool(buf, &slab_tiny_enabled);
+}
+
+early_param("slab_tiny", early_slab_tiny);
+
 int do_kmem_cache_create(struct kmem_cache *s, const char *name,
 			 unsigned int size, struct kmem_cache_args *args,
 			 slab_flags_t flags)

-- 
2.56.0

