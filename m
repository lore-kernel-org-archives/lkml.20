Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018592;
	b=5Ti8zNk4ID9N0JFCMZSDNjKKsxv2+8ExJOTuwIPdm3UzfD9IeSP/n7mLwnuhurtcEH3y
	 loWEA5DJVajVJ7pllONSmxAjDJD2N0aaHJO52tni8wNOm8sTjDq+h436chsrzFGAkT5Qe
	 skOyo8SeJAXRtOmlqSNMc+NbN+V6KRrEPZWtEjsTQuiAT//3bjAMZw8/fXxqAZ86kulD/
	 p1DBFfW2/xmAUXAX70Gd0MCwNw6N2Ttkj5gDHRUIUollX5Cx8KkgGqxnkPTCXqgkkTqSr
	 O8mBQoHNjrsTByIuWHTc2AHrt8QQMSF7imjRh8pH2maEeGTFg8+HqJGuUQbq7RqWGSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uRsIPTMr9DAEDvgH3CXndlUsRH7W6W5mSGx/DJlSS8k=;
	b=ZF0VCtq/D+eKKRsjMO6BNbWxBD1mv/Iz19uIq4tuShnSPdr5qNCYoAjWRPG19EJqNIX1
	 rCkvvLEmEoJUoMF+OKEIGTFXh4BWERZVK+S65k25KV5zc0s1JywMQ3IkeTR4/g6abZO69
	 glC7asTTh6RI1urKeo7JibgFVhEZRlILHIravRm+j0AnJBg/l6wTQ8MgTmymqJ0JgIHep
	 unQ529WsWlgShQwdLpeDieEVYSmbqbsjxEF6ogPB7gVNqaFP2/S1UUWfYNID1sqTWaFqV
	 3JVYt1O/6S8o1lUMnwetCCwqzSioZO8KxN9BwtuB0pW8TJgNngEiBdWSIaXnKPaSi2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=V92tSvbt;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856F606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1856F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=V92tSvbt
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1469931eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018591; x=1794623391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRsIPTMr9DAEDvgH3CXndlUsRH7W6W5mSGx/DJlSS8k=;
        b=V92tSvbtE48R0SM5ZQKafTNvnBjGzo+6vQ/5JhYiCsyTCmYO8btD+IyWhc7p/UvXDe
         h7ENKrW80BK7PnO3CQWKh0Df9L2/9hs/rYN1eSx9tEioQ2aWjYPB78EqlcEu1sKyIZ5y
         djNlHRT49qZYo9CuuLEEwupz2cGcHi3LYoZYFMAbIfVbD+Ag/xSLA1RV77kwAflwk8Am
         LY96mX1REh9FXkfUGaM6iYPzuXF8XYulojqAoNe2gyUGm874C6D/97p1TWBws57LNZLM
         cafSwPn/Uz8U2t1bEcLbBUk86gtLYTwNJjC4fHcrb8ej/zKHeOi1LTLBp51Te3UBvxvQ
         f+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018591; x=1794623391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRsIPTMr9DAEDvgH3CXndlUsRH7W6W5mSGx/DJlSS8k=;
        b=o6ZmEL3ifO9AQ1ANyU3n7QKegfOS+PCRX5eK8hqRjLA+Ef5fbsjy+H21xlE5JL+E3O
         6CpqfDJkUpg/Cs2kuRx0EkyaAvlu3nVLnma/6Py4mF0lEL5dbK8hMBNu4pjKNdtXzStG
         JjAjCYbzM3tov4fQinvPOU9FQsOae+zru4kY5puIj+Ej3RTRPRKrPrKpmmFmtfl8TE4P
         YnFCmfTNaPLCbTH1PVvjZmNLUb7oWvJ4FjbzsXMXdpCC4godGe8+MQPLLyRvocyqkQA6
         72tS1JEnYLeho2B5NKy7/IXFs18jUifuMRBGnAE3NBvpMLQ1CXN0Ws/nVw+mgJvTjjC3
         P6mA==
X-Forwarded-Encrypted: i=1; AL+hErGC/WvOQ8Sm5Vrbzv/Bh+w0N74D4BwDiMcZJrcm6keGrPF5y/yt0w3Zeed4s95ebF1i16wMz3HPKnA8UaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YteCg2NGFV1iEzQiJK2UTo1tOZShYZf84OnYtelPzKkrlLzQi
	J+EQ0AwSZrOLtZao+vyOhEREBWUmw1O1xdwzIdRRrinRb4J9aOITOHCP+Mh4XGNzIo4=
X-Gm-Gg: AYBFou16fVCgMlR5cIFuVY5lHkQRl0w6ymV/l9fk9SnDOLF8ElWMYGuJBXD5wuFyOjR
	CWVMD2K0ex2v1pv1k89Jq4Eko6yt3CXPOHtKkHKC+cEL9cbQEtaxy7tkz5fGRIyMjmOYuen8M2o
	buXVrsNV3DJkzu2A9CX7scm634dj/avKDBwEuTHgHS9y1ps6+tiBYaAvf219s4x4al6Y4AV5Zbj
	b432Lzt1UsmsiVZ26IFHLvGYOEC+nX07dVJCbTCu/lyAOJzKtUeWhyxcLHE+L6k3mvi1EFoBkCA
	wtPAupA9xiPUlRrDyBsfiDWFu81M6p+pB9f4AKuwtNnChx4shY1FzFOdYRlCDwwOtBGUddmdhSa
	1TwLY8JcQGg65W6moMDDXk1kagckuFeCEnGNGEl2SNCBayKgXXqGmNrezshxWnUiECytgBIkj8+
	VMPYXw97fHnJhv6SPjsWPWfS/o+51mH2Vnia5Uw6nKPVx2cHKH+1MAnp3HEvundBylKrWBlcwjs
	qHask36A15WpEyem6iUdL3adrO3Nppytt0xAZCPmCYYdb0p9ktvrLa9hy/4QyM6x6dSiJKE3tr2
	BH/Cgg95aKzc3CmPIa5Dpblp5rqvsVhbUKPKmdI8N5BrGB3H72Pk+fxjO1xw
X-Received: by 2002:a05:7300:f818:b0:36d:e547:6db with SMTP id 5a478bee46e88-36f7671ce59mr6171150eec.23.1794018591056;
        Fri, 06 Nov 2026 18:29:51 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:50 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 07/13] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to vmemmap_optimize_pte()
Date: Sat,  7 Nov 2026 10:27:50 +0800
Message-ID: <20261107022756.77731-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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

Both optimization and restoration update vmemmap PTEs by remapping them,
so "remap" does not identify the callback's role.  Use "optimize" for the
optimization callback to match "restore" and make the two directions
explicit and consistent.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Use two tabs for the renamed helper parameter continuation (suggested by
  Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d58f7a369c9c..7a3af4fd285b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -213,8 +213,8 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
+		struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
@@ -302,7 +302,7 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_remap_pte,
+		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
-- 
2.54.0

