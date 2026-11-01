Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793552696;
	b=Yf9h2j8i4YsJOqDvWFFYVySBM441v0Ta1SKbeXrKv91XxT64NuPek4dFzB5jTwtc/tko
	 6DYrjDjnFk0JjlEjkH8DE6BPCy3es54PRlTG1TIjBd4je5mc5FlRZZrMUcPOiDumWO4XA
	 bYcDEycQLKyvBd6fksibZsCd7anfjXo2r7rRFKnOyIfAY2ASPxwOrIWlv5Z3cZm2leUKA
	 VAQWYzyrNdorbxewiu6mE99NfzZ2VdA6YYGTufOFsIEr6GotfoNM5fgK9HOkHuaRibM2s
	 DKLkcRhw8RdE2AWd8XmkJot2uuSzTK9yqweT6My+n8aKsxCEUlCt8qTjVVDc9WAOoig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552696;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=62qoK2pO81XgznFvwxDzAXRoE7cV0Lfka+X+SvLqreQ=;
	b=1g5+S0Rr8DnNJLSkhKKUIYgAppGZN8N4brZSEvn8cAphdnGzxPh1QEOLYM/yRoLIchiR
	 6e+54MxtD0JmkptGk/5jrtXXQCnrlMpBp7Ai3+9UCG8/9t8kg7aVjCUw54fssIqGbFr2e
	 CKUuTvUfTkaq6KRwt7auCV1cAAUMAG62afZXHKDWwRspr9NTQwrhlI9BRSfje2YaCTOOf
	 XI+fBCPLjtUjS5KV69ga2X2sp+e1dvVbW1n6OxDSaD17VtkloEVBStTX+f+8bkuacssIm
	 mhNVRlBk0B3REGg0R6HOCpDcv2Tn6xZiwWleftxu5AY+KfW+Fkm63V9jEQAiES9IXIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PRQH2Ke7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B069606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PRQH2Ke7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793552694;
	b=nmqcbrAS/zMnfZfbqv5WfKz8sJEhNBMKlunJx557hMitoPt2z0ipbSN7rYPEbd9i33CF
	 VYd/HE7XxOqQs2JNaDsPM1hfRqiGUtydZhsqd9+weY2UZjTGzE1NMAMc5zKbSvPNl4fmr
	 oWOl9cVfPb2kprOmPlBxAcu8vqLayprrDtvjcsvwM7WqdjkwvhBn/JRy3uoJ0hN+d6m+u
	 uhjhI6UOPyla4oeQ5MCYJwxw1BzjpKT78CoLtgu7sjMWNyl2HUHqEFaB2TcdSCxTsf3lD
	 zLNWfOQMhoB/CsFby+0USJCLh1YlgptkLxmZZOAgQKpoC9n2htamx5hvVPVWQooGznw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552694;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=62qoK2pO81XgznFvwxDzAXRoE7cV0Lfka+X+SvLqreQ=;
	b=2UatVVGowrPmVkNi1+QmbjK5WFrjr/NKnLpj1w5dC4JHpjVlak9/EzkZrRC0AFxiNYkP
	 9CObF/KJm4EuTPQpe6LH7P1Pv9TuMFXWOViSTlT1MOEC3QjXZDRWDiA/VqSQVM1jNmxDY
	 xGp/jccrm4G8+pMoTBzAgQdh8BQ5QXEebVQ8G59NBSbQeM1Ji20Q/MFmAttgkxmjL7l6T
	 dg06beI+O/gkH9q4T2G+VmCSu6SraX8o1duExF1sDoIG9shX/9p/deXqROORGjJn/982q
	 vU6NBBhPS+f/DD1+y5Tp6vDGw+0Ou6RxSjSWuSheBvOX7oWGe7HSHOa4aWY74Qc4T6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1D961F0093A;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793552694;
	bh=62qoK2pO81XgznFvwxDzAXRoE7cV0Lfka+X+SvLqreQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PRQH2Ke7p7Tkx9xdUoud04SF9I5X5CUcHi5yYnvXEh9AkZDuU92gvgg1QnKsdelro
	 t3xLNGos5Cj6VfhxqN8aFRxBcuWW94RTfgbkXvVu2e7PusTT06lO5obYYVtQWOxerF
	 6G3bNZN56I0GLrEwinTHMNdolz8e/MeSgVxJ8hj5qxZzeJ8Jl4GyyPU9oh4804ZIlB
	 wCSiuoeqAJWisstlrYUEgjOWSJaOV70IpIDnWguCB8H3AgIMXSz+eAiDK7VUtMq+jz
	 uRx3oBU1fDidqX73FBumogAiYwlbyDnRErqT+Aps3hBKTcyhtpeoEoBqLjcYInFzpa
	 wwaaGXSaG+7EA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 238A146207;
	Sun,  1 Nov 2026 17:04:53 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 19:04:37 +0200
Subject: [PATCH v2 2/4] x86/kmsan: Use the per-CPU area base for metadata
 lookup
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
Message-Id: <20261101-kmsan-serie-v2-2-f97f66dc57ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793552692; l=2372;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=NoOANBIkTTfd/eqBkNAgT+oIrASIhNAW1KDPRJHc8EE=;
 b=QwxnxeGnXDmOd0DLmmsnWf6hS/U2H9z5w0zqfUe3FwI30/q+cMZZ3cIhxbu4zEaIwpmDEOOgW
 Qh8H+LP1/BxCCn5PY4EV0iqampEubxUsI2yfqO1JYZ8zM0xSpo3c+ME
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com
Content-Transfer-Encoding: 7bit

From: Viorel Cernateanu <vrilutza@gmail.com>

The per-CPU entry areas start at CPU_ENTRY_AREA_PER_CPU, one page
above CPU_ENTRY_AREA_BASE, after the read-only IDT page.

arch_kmsan_get_meta_or_null() computes the CPU number relative to
CPU_ENTRY_AREA_BASE. With the areas laid out in CPU order, this
attributes the last page of each CPU's area to the next CPU. The
subsequent offset check rejects the address, so KMSAN cannot find
its metadata. At the end of the populated area, the lookup can also
select a CPU that is not possible.

Compute the CPU number relative to CPU_ENTRY_AREA_PER_CPU and
exclude the IDT page from the lookup. Check that the resulting CPU
is within nr_cpu_ids and possible before accessing its per-CPU data.

Remove the always-false negative check on the unsigned offset.

Fixes: ce732a7520b0 ("x86: kmsan: handle CPU entry area")
Signed-off-by: Viorel Cernateanu <vrilutza@gmail.com>
---
 arch/x86/include/asm/kmsan.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kmsan.h b/arch/x86/include/asm/kmsan.h
index d91b37f5b4bb..c6715b2db0dc 100644
--- a/arch/x86/include/asm/kmsan.h
+++ b/arch/x86/include/asm/kmsan.h
@@ -13,6 +13,7 @@
 
 #include <asm/cpu_entry_area.h>
 #include <asm/processor.h>
+#include <linux/cpumask.h>
 #include <linux/mmzone.h>
 
 DECLARE_PER_CPU(char[CPU_ENTRY_AREA_SIZE], cpu_entry_area_shadow);
@@ -32,14 +33,17 @@ static inline void *arch_kmsan_get_meta_or_null(void *addr, bool is_origin)
 	unsigned long addr64 = (unsigned long)addr;
 	char *metadata_array;
 	unsigned long off;
-	int cpu;
+	unsigned int cpu;
 
-	if ((addr64 < CPU_ENTRY_AREA_BASE) ||
-	    (addr64 >= (CPU_ENTRY_AREA_BASE + CPU_ENTRY_AREA_MAP_SIZE)))
+	/* The per-CPU areas start after the read-only IDT page. */
+	if (addr64 < CPU_ENTRY_AREA_PER_CPU ||
+	    addr64 >= CPU_ENTRY_AREA_BASE + CPU_ENTRY_AREA_MAP_SIZE)
+		return NULL;
+	cpu = (addr64 - CPU_ENTRY_AREA_PER_CPU) / CPU_ENTRY_AREA_SIZE;
+	if (cpu >= nr_cpu_ids || !cpu_possible(cpu))
 		return NULL;
-	cpu = (addr64 - CPU_ENTRY_AREA_BASE) / CPU_ENTRY_AREA_SIZE;
 	off = addr64 - (unsigned long)get_cpu_entry_area(cpu);
-	if ((off < 0) || (off >= CPU_ENTRY_AREA_SIZE))
+	if (off >= CPU_ENTRY_AREA_SIZE)
 		return NULL;
 	metadata_array = is_origin ? cpu_entry_area_origin :
 				     cpu_entry_area_shadow;

-- 
2.53.0


