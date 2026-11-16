Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827044;
	b=OpbAZgRsu0xhXjoBPqTw7MKXjf37id5Qt6upVzuCYSeeaPDsJTv+xtw2B+o2BuepWmOI
	 gM8a5jXsY0MKPPPox8+5Rzp/xrWAKZbha8Fc6PARaVEpfRRuJ8b/d5dm90tUsJj/WOVhW
	 qbgss+w79HJdIUrRcSe63NNb3Vu4PNU2DWnm4dnKvyjrmmLYoowUSOySv781ZqG2rbcxp
	 IuuDlIq5B30YRcye5goUxwfW9puny08AFjnohBOir2vjuBAkIysn+cUCPFxQfnvVKEaHG
	 SyHjCRdTMeXk0chu8wzuf6w1832lA8jADEjw6Acx9dLyDMqUvUACLq00tXSavdF3bCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FOptmx/nKaTXpVpA1qDUtPfxFqOvBUlo8nEFPXsgeb8=;
	b=AlX6b4+pYe8oxK4wBnOmb23OSigRvniqD9IXfzAxNkfdk6N5IbdWLukv3c1a+PyazltA
	 K4aO5Vr40YZxtnd8100DrimY9PCAmqcIo4oCWPad2lcM+UloLr74Z9DW75WHxpZy1DHza
	 8eLB0d4FbitvmKT6IFMzofttfUeX9ivxJEDKCf4fuB5HNllN08DnX2s6dJkcMolni/FHo
	 YW7K9sMryAwJZxTuXSYY+9u3A66YkGcZxj9bTKmIfx9k/ylOuinNvsGfw0tydQUN5Ecto
	 UOEcLA1X06E+siBSUfvPk/hDlnuYMJ5RSYCOejC9zzT2tiN3pxW02rzAtwX7NRN76hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WfZtEIBJ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B20E606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B20E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WfZtEIBJ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so5232230c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827043; x=1795431843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOptmx/nKaTXpVpA1qDUtPfxFqOvBUlo8nEFPXsgeb8=;
        b=WfZtEIBJXA6so34JmNa94rsAwXws9h2i9FirISYmtZFrbiOGVyQa9FzxeMMx/w/N3Q
         IFBbEwzQOzF5VhUogJhWDRy0hD3WAPRcBC6iBsM225zEZ7EegeX5oX0T7sQi36kbBHZU
         VvV/IhVaARkKlvQGTcOdkAT+XKMrDMr4Hcqpos2E0aM0d7T9+nYqQA+87RAyvNfqpiyw
         lIQ3Vs2EhWkPg56n1AINxfTjIEVX/XVHAvZl1b8kCFF0UXgDnLZmRcQ5MgcdscV6Ti9T
         paBdAtWl37cI8/FlF21X4E1ftx6kuq00BkF4bJYTIJBgVTOfMMSrNLxU0eqP+81SP1Fj
         bJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827043; x=1795431843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOptmx/nKaTXpVpA1qDUtPfxFqOvBUlo8nEFPXsgeb8=;
        b=ljs470WSOSKo/3Njj+gpkb+lZGT/zpo0zHXBey0MuiLmLdf3Ca8F2FIFfylm3o7IVg
         CSih6LcMzbsdp/xQdgQ+SyvUbeun7q189xk17ziEScto6R963Musb8yqgK1/UAjEFazx
         +9uIJE+scWIG71R0l1hKMhDHGz4caMVP1ztwbWSjNyEVmaeQ/AjiFc03jQBjJU4cJdDN
         HRmgfmL5p7AcvvylTlBfIk8ED8TlTxh32ApRFyJB0UFQUT5ka0O7NaBee5R1YXJ98WXQ
         4hFgavMkeUaZDHc+MPJAw4Z9Z1drJYKzOP7gfvtfQtom6rRmuwkJNv0W0ZNLygrdnDAE
         8fsg==
X-Gm-Message-State: APuU4Z9o626vgJPxrLouZ5VlrJavRCz22hzelDc2M1h8v4y1x7pMOFJ1
	oXHYjp/t3FFJDNeONYHRLmlmIKxP0zmbAglZcHPQ8FyvFFCueRaLmldD
X-Gm-Gg: AYBFou3l6Z7Gc/dEgpt6z5bLyaZ2+regVb++dxEDc7BcY9v/c14QeU2CA2+0GuVNaB6
	xqsSb3wkXIAxgSPVy42WnE17HzXnE/1KmywNNw5xsa89uPN0x6LdFkMZX3JuTl7GEdOnyf+quY8
	uwirjWbH8B9A7t3CVus0rgcBLgAESOqHN5wnxtiRfaR61xFe/1YAykVqjvHqGSGa4c0SLm2Vuej
	qD39/rftXxzgbWzWInkDgcQkg0SxlFCtn7S5tG3zw9I50aQIBTc8Kr3pIr6am4R1lZ1GTtnQhPG
	NxEBDnYY7AxCnkgDs8wSX1HSrD6VxIsrAol3BFZI/loEsfqikQXxQWJDksMvS8fh/D3rLqcgnEc
	2IbcF0eHwFRxCHAt2knHDp2TmcgND8+YbQBOl6/ePogdE7MHlIRZWyJAFcvzxZNLmhLt7UqQjdt
	x/CSgDrHSLG8odgxe1kXsHhBNGyYukQ2JHrqNybC25YNxP1CFTxiFFjaqgGelMdBfCFSdt73Yj2
	Tdq+A0RC0T6EEEaXHNo6Ndv5Glz8D1FcHfB0AJRtMupZQdKSKosCrb2EMZUkbQ9fxVlift8r7Lf
	wuwVY/jNH+ShU92aNcU5qf4248z2YxE2CX/xKZW+hDHm/BnFMhnXp3Z+g4tEExT6ZSmn
X-Received: by 2002:a05:7022:f50a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b5031152eamr10336840c88.15.1794827043076;
        Mon, 16 Nov 2026 03:04:03 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:04:02 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [RFC PATCH 05/16] mm: memcomp: charge compressed pages to the source memcg
Date: Mon, 16 Nov 2026 19:01:11 +0800
Message-ID: <20261116110122.309748-6-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
References: <20261116110122.309748-1-nakixii@gmail.com>
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

Reclaim can execute in a different memory cgroup from the folio that
owns the contents. Charging compressed storage to the reclaiming task
can move memory usage away from the cgroup that supplied those pages.

Capture and retain the source folio's object cgroup for resident records
and per-key storage. Charge allocated metadata and payload bytes to that
owner, including allocator-sized metadata where applicable. Nonzero
same-filled slots have metadata but no allocated payload; the zero
domain has neither a slot nor a payload charge.

Reserve payload charges outside the token lock with non-reclaiming
allocation flags. Transfer a charge only when its payload is published,
and refund it when allocation or revalidation prevents publication.
Refresh releases the superseded payload charge while preserving the
ownership needed by its replacement.

Release payload charges with their backing, and retain metadata charges
and owner references until their corresponding records, segments,
clusters and keys are freed. RCU readers must not outlive the metadata
or its accounting owner. Leave restored-folio charging to the ordinary
memory-management paths rather than adding a separate cgroup quota.

Signed-off-by: nakixii <nakixii@gmail.com>
---
 mm/memcomp.c         | 22 ++++++++++++++++++----
 mm/memcomp/storage.h | 22 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/mm/memcomp.c b/mm/memcomp.c
index 80b71e217ff5a6a2fa1d033edf6079a670a55020..8944fa081f3e35bfacf00d3a1c09c8bb32a9db18 100644
--- a/mm/memcomp.c
+++ b/mm/memcomp.c
@@ -663,29 +663,43 @@ static void memcomp_zs_free(u8 pool_idx, unsigned long handle)
 
 static struct obj_cgroup *memcomp_objcg_get(struct folio *folio)
 {
-	/* Compressed objects do not have an accounting owner yet. */
-	return NULL;
+	return get_obj_cgroup_from_folio(folio);
 }
 
 /* Hold an additional metadata owner without bypassing the test model. */
 static __maybe_unused void memcomp_objcg_get_ref(struct obj_cgroup *objcg)
 {
-	/* No accounting owner was acquired. */
+#ifdef CONFIG_MEMCG
+	if (objcg)
+		obj_cgroup_get(objcg);
+#endif
 }
 
 static void memcomp_objcg_put(struct obj_cgroup *objcg)
 {
-	/* No accounting owner was acquired. */
+	obj_cgroup_put(objcg);
 }
 
 static int memcomp_objcg_charge(struct obj_cgroup *objcg, gfp_t gfp,
 				size_t size)
 {
+#if defined(CONFIG_MEMCG)
+	if (!objcg || !size)
+		return 0;
+
+	return obj_cgroup_charge(objcg, gfp, size);
+#else
 	return 0;
+#endif
 }
 
 static void memcomp_objcg_uncharge(struct obj_cgroup *objcg, size_t size)
 {
+#if defined(CONFIG_MEMCG)
+	if (!objcg || !size)
+		return;
+	obj_cgroup_uncharge(objcg, size);
+#endif
 }
 
 #include "memcomp/format.h"
diff --git a/mm/memcomp/storage.h b/mm/memcomp/storage.h
index bae605f20e79bec5d6dc5573f3148ef15e95ee84..f11aad87a1773c0e2f16b1bb3d506cb4caeb7386 100644
--- a/mm/memcomp/storage.h
+++ b/mm/memcomp/storage.h
@@ -223,8 +223,26 @@ static inline void mc16_retained_empty_dec_locked(void)
 static inline void *mc16_kmalloc_owner(size_t bytes, gfp_t gfp,
 				       struct obj_cgroup *objcg)
 {
-	/* Metadata remains unaccounted until a source owner is introduced. */
-	return kmalloc(bytes, gfp & ~__GFP_ACCOUNT);
+	struct mem_cgroup *memcg = NULL, *old;
+	void *ptr;
+
+#ifdef CONFIG_MEMCG
+	if (objcg)
+		memcg = get_mem_cgroup_from_objcg(objcg);
+#endif
+	old = set_active_memcg(memcg);
+	/* An unaccounted/root source must not charge the submitting task. */
+	if (objcg)
+		gfp |= __GFP_ACCOUNT;
+	else
+		gfp &= ~__GFP_ACCOUNT;
+	ptr = kmalloc(bytes, gfp);
+	set_active_memcg(old);
+#ifdef CONFIG_MEMCG
+	if (memcg)
+		css_put(&memcg->css);
+#endif
+	return ptr;
 }
 
 static inline void *mc16_owner_alloc(size_t bytes, gfp_t gfp,
