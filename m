Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E853E31E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178337; cv=none; b=CLA35PZuBVXt6Pw5mTHuoRJRolngBK5+FJHOBYIIIYT77bhOjt2R4fp6uJb8B+Ncsagq8xcGpO5Uvndlww6HJgcWCWtQoxIhQRKw1Z9hOM9MwYD7sxVYnZBOxDMRfYVQO/z9qjDMIGtMxx9xRSaKgYLN3O4Mld4tCg22tVmNzlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178337; c=relaxed/simple;
	bh=hScDQprsw5+sgrdz7qxkFNYcYfaoJi0oQcN1B/bnk+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1g6AP6dAimySQACpzxwHL+poX6/IMb5kpZif80jo1FfGW7uH5R1XJIHe85BOln61Uw+x1UU4WfoJR3bzMS1ZaYW2EVQ1wLCg108s8ZaiM7Z6f2E2q7NdqotMzMHB94B9vNJnTSLfpWh7Dx4vnYlAh4AT/xJX2YGcpWGI8zxm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWrqf1sz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWrqf1sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB611F00893;
	Wed, 23 Sep 2026 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178336;
	bh=ZH/DiEqRWfRpDNmn9lxvEBbuNmwbYZYpFCH81u3DETY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MWrqf1szrP2VTEzbeFhP8yt/m4eHDnd56LMUoI0iQ8NSaD7hoNlznfPH6hGXRwTyC
	 Gmt1XvqQYWyzVpG1evAdvVrx74St4RGjVdHaMRIl35J+oQyRPqc98znaEzqIZJwyBV
	 fJ2K9jJE4R2QxfScBPgnl/Te0Kl484+s2rn48mU/z1A+is6OLmzZARx4Zh6gjT3j3r
	 C3H0Ime1n+jNMwiJy4UNkpVYZxiPPlOZymqaE6MLiro58CLw0OOabHARBQs19ehr5H
	 ydQqa04m1yr9FkphxYMbl68OXnWw78uDT3St/AUf68njsX6IGriQBp4H9AhPjpWfSQ
	 lipCntGlXeAMg==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Wed, 23 Sep 2026 17:45:12 +0200
Subject: [PATCH RFC 7/8] mm, slab: add slab_tiny boot param
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-slub_tiny_rework-v1-7-a0e66d536eb5@kernel.org>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
In-Reply-To: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

In order to deprecate the CONFIG_SLUB_TINY option, introduce an early
boot param slab_tiny to control the value of slab_tiny_enabled.

As long as CONFIG_SLUB_TINY is still around and enabled, this boot param
can also override it to be disabled.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 Documentation/admin-guide/mm/slab.rst           | 5 +++++
 mm/slub.c                                       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..0100ab00388a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7031,6 +7031,10 @@ Kernel parameters
 			NUMA kernel object placement which helps with slow
 			interconnects in NUMA systems.
 
+	slab_tiny=	[MM, EARLY]
+			Minimize the slab allocator memory footprint at the
+			expense of SMP scalability.
+
 	slram=		[HW,MTD]
 
 	smart2=		[HW]
diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 0beeae71d472..6c005d3de0b2 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -94,6 +94,11 @@ kdump kernels where scalability is not a concern, but memory has to be
 
 	slab_debug=N
 
+Note that for this purpose you can instead use an option that can achieve
+slightly better memory savings (by not creating separate kmalloc-rcl caches)::
+
+        slab_tiny=1
+
 You can apply different options to different list of slab names, using blocks
 of options. This will enable red zoning for dentry and user tracking for
 kmalloc. All other slabs will not get any debugging enabled::
diff --git a/mm/slub.c b/mm/slub.c
index 4814f025fde5..d672809fa2f6 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -8726,6 +8726,13 @@ void __init kmem_cache_init_late(void)
 #endif
 }
 
+static int __init early_slab_tiny(char *buf)
+{
+	return kstrtobool(buf, &slub_tiny_enabled);
+}
+
+early_param("slab_tiny", early_slab_tiny);
+
 int do_kmem_cache_create(struct kmem_cache *s, const char *name,
 			 unsigned int size, struct kmem_cache_args *args,
 			 slab_flags_t flags)

-- 
2.55.0

