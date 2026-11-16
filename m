Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811671;
	b=x8g/UDKicbJbG8N9K1k/eyiWkzsmXrrt5q0wOKrBJrwjzCp+Q5JV6frU5xb7Nz11yjyn
	 RM/zDBpsPD6PGDXJ6P1KsFQDz3WD4HgQ6tAX76OvEB0+nTtk+feiiyjcMAUKzw5b6oHm8
	 Wlh9aYM6Jj7f4IEbAffmcNiBD1cl0cRwZZaGuj7mYY7DddLS3m1yVTeBvG6RCstTwk/8G
	 CIGpUWpjT9FO+uthwucwQv5pW+HSKBPTXOSv5f5baaX8WYwlT5UqTKoHnbDKPb467OWDL
	 l5Fx1sk5mo629j3cM/VJU7J1Lp9KpnLfjHFoODej7AEVaT0XVqqhnc2EEmaroirgtFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811671;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Ntul/T2kCyH32O/TJbDV9NKlwqGCbG2f4hnJS/bPqVs=;
	b=e4A/iCXbHDM3R9yAV3BM5RObB36W8aDKx0rp0Q92JTCKuRS+VqmL35pyI83S+UVszzN7
	 UX08MuBFwQDNo7w6mjrOCARq9iiwVhC9Q4tUbxk4m2zK00iEu+hQukd/ro0VprRxcbNy9
	 erB9mfe6NAczF1FsksLwLcBcyAP1B5FXmrUvb09EKlvxWZxAzQL+pbNNMzN8aDNEJwV67
	 wsbklQ8fR0FgLR65JlnDcy5PZjCmzozsntd5AcKOs2hLd6dnqvonl2CVaQMZ6TNM7Wwkp
	 lNKdc54bsQ90Vo1rj/UNcGOtSyKEX7nbNhMmREaT+H/OSzJEr+rRF0QI70bMPR/FCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIWA7sdr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5DD606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIWA7sdr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F20A1F000C6;
	Mon, 16 Nov 2026 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811671;
	bh=Ntul/T2kCyH32O/TJbDV9NKlwqGCbG2f4hnJS/bPqVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oIWA7sdrZBwr8SKt63K8jyPLxfsidEFNgKslqwLhdw0TOqd0rB2pqPXSj3RL1zqYz
	 +U862IMlN8z7Nq9bslXRnLiFhYsvI6Mt57Y79MLM8cWWOKf4PkTXXy/3PkB0znH/1G
	 qsfqZ2B4BmJKwXy3lDFTshtePlWxfmJMMBlemzTzkQ9KZTPIAJfLNDpX1tsCv7hpkm
	 HywtoMmCv3iMKksLghZUpQUZ9n9K+HzX+OJA999/W0hYOwMiF3Q1rdScjo+JUi/SoI
	 KejzQmJyEmR4bZ+mY8o7r6VV5UclT8Nw7h2xzEslpMrkd/Tr5pu+cDUxtQauoOmcBN
	 49g2aWsw0BaSQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:17 +0100
Subject: [PATCH v4 09/10] mm, slab: add slab_tiny boot param
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
Message-Id: <20261116-slub_tiny_rework-v4-9-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

In order to deprecate the CONFIG_SLUB_TINY option, introduce an early
boot param slab_tiny to control the value of slab_tiny_enabled.

As long as CONFIG_SLUB_TINY is still around and enabled, this boot param
can also override it to be disabled. That could be also useful if we
later add some auto-enabling conditions such as detecting the system has
only a small amount of memory, or being a kdump kernel.

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 Documentation/admin-guide/mm/slab.rst           | 5 +++++
 mm/slub.c                                       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..e286195369a7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7057,6 +7057,10 @@ Kernel parameters
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
index bb57728962c2..5edd38ba70ba 100644
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

