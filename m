Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868269;
	b=OCG8zy8RSUO+7N6zVxR4oFMmgFgY1OzJ+zuA7YAGcxgLQE82JNvL0HRXdgTff2osgW2E
	 kz7gm0RPi1k3VotUeQFcoVrBaBcfPlGdStrjMmJC+a21fZOjswGNl7Lh1lScINNBRNjqQ
	 ItybonphUulTK4Xrj9SSMWtCD00YXgSTK0po2Kvzjt8cK63QSaluJECTVSPQQ9eXPzX2E
	 JwDm4P+ESOI9DCKiUc4BNDwtAOxagb+b/9w+FZZqKCSQauWpot59lrKH5znpZ2Le8GRCI
	 MhPkJIlcRU6Ac/H09gl0fxfGd2EsHpnYFNvJnZrn5EsZz3bIRGnGnQEymm9n72Tjhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868269;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=T3XoCtOhPykQ5s/3a1XBXzxar9RFvyhbzz4AX5meuUI=;
	b=KLs5KZPyv+auqQPg5OBMwG3cCl0SOhobWucQwS0Cr+c6ul2m7y0sP2o628okSkSg7625
	 4wQX+vwjgZliU6ckYW37x+wryeY8U1xA+RD+ynlR5c4e2R48tIL355NsBeyXpJ7c3xXdZ
	 FnUYuM/dODTucSlQkYb8WS/Gkph9xePYWIhBy+2n4MQPi2lYYfIw1Pfx32+lfe0EofT9s
	 RhTF4psoRtcVQNtFU9k47RpCqHc+2eD1KxMNaihJscb9+KchNUXdMOZ/i3wfv6Hgvkglz
	 0zcugjhMjmL7/fJPs6c+bBNpQHSFlOU82yjY/lmrvVzROnchShYXRaFqF+BqlC4Q62w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G3J9qgD/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B2606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3J9qgD/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA1E1F00A16;
	Thu,  5 Nov 2026 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868268;
	bh=T3XoCtOhPykQ5s/3a1XBXzxar9RFvyhbzz4AX5meuUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G3J9qgD/q6Nb8gT9uQ4hGqIATQnDmKeO1GicK97PH44AKaHN2/5MkUBukUL2BAsug
	 Ehy6EAk6pZGy2+1Zoz0uEE/HlDDoiTRPy3nYJK8reIBFkD1eV7MB6PbaMu1q/Uo4ob
	 U3WNATpcA+DZK2ZyWOfWX+vPt5GP80F7JfSvyKX4aXPtJrCASNE2gm5MjeRH4wriYO
	 76GeTT1NvHAm7H4iw1FEmSJFxsUYrxVA8YHeY88vJFzu0CDWZKondLw7Wu423PSshi
	 Zq1SfgnxkNsfh+zVFqxZ2KThVp4Y/1yvUZe3T91xKkrYWHEH+uwGQ2s0S3GU+rb2nG
	 5u41Wn6zq/FzQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:58 +0100
Subject: [PATCH v3 09/10] mm, slab: add slab_tiny boot param
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
Message-Id: <20261105-slub_tiny_rework-v3-9-0484ce59eabb@kernel.org>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
In-Reply-To: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
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

