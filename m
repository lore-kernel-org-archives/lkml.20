Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558674;
	b=wbCltNYYodCIkoPjD3jxhZLeBAl+E7T8OA9tBCzo5n/v2Wg+au/Rumh4L9+uAsvY56M3
	 /h3LAkSfr6mxqLAxlQe5VOr0EZcxu8zZtWw5vacsn4FgmcBxo5cOTb/+ylw89qNvE/rUp
	 CLuczh+CL4mKAVf2oxJL8coZoJoMsC5QcRa5QzVDKTH8L1rMELHJvYxvyq9aSShf89KW2
	 JnFi+JWOvWQ9qi7UXLRobz8h/+h5f2fDcqcSikWmCNhG/+emmb746YSy5rknafD3yzCKV
	 8WEopd+5aqzwy9h3pwbiZWDO72uNltdjZZTpHRevDnuKLijSe4NtvhlrvVjVchFbhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558674;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zx+oBx+DrGbWNeI4VpjTvUMhvmqGs16Tkaf005DeV3I=;
	b=O9mzY8pjZFg25Jjxz0I7m0B5nzB2zTgoStInyDVcxTypENSlSNIjYD63JTAo4eP/P1RM
	 xqxkg4z9P3ZpcbJAoao+8mubtKMjphGmep36fk8bpHQ0nITmGibJvqB/ARctBEhsX8sBW
	 9zB7b3v2Aep7HAc5AHjO7N1Z/Yv+jfsPYAsMgCpKSHRT3bgCttFRa1hQxx6N9tnXBFb8z
	 Ni6veJUfXImbGEGaeYhL6aOE/nNMpP+fDUkazc6wUeaD0fUWZYbpofp0KL03eQOxd3msS
	 JVY7qnkJ5Op4Qa6l0qh5UI2hf9BpE1M8fotn7qcHX3K7TT6sNEAe5q0ZuuEpBwtu5Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P1nAFsAZ;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7453B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P1nAFsAZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sjeGNUTRu2TxaiR+y3T0ejou+De0JFn1tmqrXPbKj/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792558670; v=1; x=1793163470;
 b=P1nAFsAZzDdN1cB/IenFnLQPPipDFBuS9xym0lWq5mfYtRLAmQt3QeAFqd9UdI9Z5L9z2SEB
 NkcYKNd/A305qIJHE0prhUlfm8WKsSHDgxEauR4yWMbISsWDa+qtw2breNYExxYCEAtViGNp8eK
 VBrXq8Bz1w3n/fLR8eQeH2sQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7971245a92a56791;
	Wed, 21 Oct 2026 04:57:50 +0000
X-Mizu-Trace-ID: 7971245a92a56791
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	maddy@linux.ibm.com,
	corbet@lwn.net,
	muchun.song@linux.dev,
	lance.yang@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mm/sparse-vmemmap: map shared vmemmap tail pages as read-only
Date: Wed, 21 Oct 2026 12:57:44 +0800
Message-ID: <20261021045744.93554-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-2-songmuchun@bytedance.com>
References: <20261019090830.1917657-2-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Oct 19, 2026 at 05:08:27PM +0800, Muchun Song wrote:
>Both early HugeTLB HVO and device DAX use the common vmemmap population
>path for shared tail mappings. Map these pages read-only so that illegal
>writes fault instead of corrupting metadata shared by multiple tail
>pages.
>
>For early HugeTLB, this moves existing write protection into initial
>population without changing the final mapping. Device DAX gains the same
>protection.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
> Documentation/mm/vmemmap_dedup.rst | 3 +--
> mm/sparse-vmemmap.c                | 3 +++
> 2 files changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
>index 8c287ae3f86c..76f903975a40 100644
>--- a/Documentation/mm/vmemmap_dedup.rst
>+++ b/Documentation/mm/vmemmap_dedup.rst
>@@ -193,5 +193,4 @@ There's no remapping of vmemmap given that device-dax memory is not part of
> System RAM ranges initialized at boot. Thus the tail page deduplication
> happens at a later stage when we populate the sections.
> 
>-Deduplicated tail pages are not mapped read-only. The mapping layout is the same
>-as HugeTLB.
>+The mapping layout is the same as HugeTLB.
>diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>index 40eba70c0048..ba0496daf4de 100644
>--- a/mm/sparse-vmemmap.c
>+++ b/mm/sparse-vmemmap.c
>@@ -295,6 +295,9 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
> 			return NULL;
> 
> 		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
>+		/* Map the shared tail page as read-only to catch illegal writes. */
>+		if (vmemmap_optimizable_pfn(pfn))
>+			entry = pte_wrprotect(entry);

LLM pointed out that an AO MCE before bootmem gather could still reach
TestSetPageHWPoison() on a shared tail, since the head isn't marked
hugetlb yet.

Wouldn't that trigger an Oops ... Anyway, I wouldn't expect to hit that
during boot.

Reviewed-by: Lance Yang <lance.yang@linux.dev>

[...]

Cheers, Lance
