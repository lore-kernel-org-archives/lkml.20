Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563525;
	b=th8WCNj5n2zcX+LOzv0JEnHuvpgRqH3Asq/u7aWHw4ad4nNiGWXsapNbZclNDLYLNlKG
	 7hEBUCdwRGDoa1+DA9iZFvk4dF2+ZHuznsroTTYkyLVTtQXMBpGdaLK2rI1xyRaHCc+kR
	 +tLExudczzAot5AzLvVoc+T3/rMxuj5/52YzYZC0D/qGxWh8nfRr6MqqBRjAZ7EuYTkW6
	 3INUjcD1ByCbGtDrAKjsRQvDRZKJ7xDgI4j0KLNZZY2lOoEkkbAMquOk/GQnOFmgjYL32
	 AD24ujKrLHEoGSAZ+fMwqqp207uOyw4eljM3F4WsSv2EnduLbgleJbQdeQwUpmhD1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563525;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pj0w5I+TLXbeTsxEvtV/dSAOrVQeyg/NjtI1DIx1aAo=;
	b=TCUMWV5MzL2WIeZIdOQOxB/2LXuW3IIZhsrQwZWuqQ79qbzPSeTLVVnqATXIUaRuA9qa
	 D3ZRHMIZpIuA6GRGC9ZdU0i2EMqxRgYhYbUraUpMdClA+qDaUPLZ5DTl0N9lKrEXLpL+q
	 PY1RK8eDXhj4E0/wjpsjG//gBEWInDj3aFwb9jld5TLAlghvbnu4AaMxZRxUyMUN9t2ly
	 U52bS1KcsMs3gtwQBI2ecS8/Yhtr2k8dpSFcnla/LNeO/V7/lKflyILfLmS76qZQhMLzc
	 nTU4UquW1RtLqHV7OzVHQ4p7EdoPQ/FfGShzt9AVmEc789O0tk1oeHj1QbZ6CZivLvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="QqSaK/eK";
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6B606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF6B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QqSaK/eK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pj0w5I+TLXbeTsxEvtV/dSAOrVQeyg/NjtI1DIx1aAo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792563522; v=1; x=1793168322;
 b=QqSaK/eKxDPUM3bH4vyLayiguqJ6warLZ28ldQpe0q72pf7Uvj9vGsJW5Ve2sY281s6w6HS9
 Ep6qXpkemssHk94iGyYGv2fnotQlsFTSycw+VaMxHHDljpESjSUuMBPzLGiPbT1UnsPIjqbHS7E
 B1JrO5VnYezitc/LRuLdq5Sc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2bd75f41de4092a6;
	Wed, 21 Oct 2026 06:18:42 +0000
X-Mizu-Trace-ID: 2bd75f41de4092a6
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
Subject: Re: [PATCH 4/4] mm/hugetlb_vmemmap: remove hugetlb_vmemmap_optimize_bootmem_folios()
Date: Wed, 21 Oct 2026 14:18:34 +0800
Message-ID: <20261021061834.6834-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-5-songmuchun@bytedance.com>
References: <20261019090830.1917657-5-songmuchun@bytedance.com>
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


On Mon, Oct 19, 2026 at 05:08:30PM +0800, Muchun Song wrote:
>With vmemmap_wrprotect_hvo() removed, the bootmem wrapper no longer
>performs any bootmem-specific work.
>
>Call hugetlb_vmemmap_optimize_folios() directly for bootmem folios and
>remove the redundant wrapper.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

No boot-specific work left, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
