Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198418;
	b=EV6JpJK050lCHaIcc9MMnDfR/gm/jxD77cMgXK7FLFTiz+NdiOT0tKOqq/FBChyQ47Rf
	 L32eMLN6J2w2+1NPMTMaW3GUjvv+HVW34M39VaaXp7q4aIqnE32UOA82+2yMiG70Y/T2r
	 kjTDU5NneZsM7rXxVrOYMGTw63LC2YM02f1ISsN+pcit3NP+dtbnDq77AW81WETh+1ERH
	 dGyguHLReswgHFXEI3FPZdl67RN0QC1QLMUYPrWzZWaOiqfwHT8b6FfEbnpv2IRECb3HV
	 PyWAnIOFFkYd1BXITCvlmYUw+0ZwTeimtkbFw51ODHJZCe2B9F8nV9sciLqO6J7ABzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198418;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=;
	b=dZrzyVnMJD16ELMon+8xLnCd9BFyAdSfAabtmkJnNyGcrIIXwRHAZJOXaTmd+ydNK4mG
	 2f+3t3qNfY+khGDnhCRB7JpWkrthgerUB5RRMToap1N91rIgE3nybjFGjnLPUR8dGqyR6
	 WLPusJtY5nuimZ9PE30tX+rqS53q1ypdEBTIvQy7LagjQoHeSfp/zXAn3XVLPK/kSvtg0
	 Hgn/4seQLzKkOQqjAxgfYy/YZenp0BwlkeOWLGT81vhfEgkMXHvE5SW3xHKZFxrgRUMkx
	 5LnJtwiwx089AJKNy9DMVGvVLdfADGvdA1SwLuP9lW1HsVDZj+AJcu7HQfVr7G6V3tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="u/Gx8aBg";
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C804606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C804606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u/Gx8aBg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794198415; v=1; x=1794803215;
 b=u/Gx8aBgnHUkuXVi2+BQTYcTDxH8zFUmAR/TVFAy46WVUw8Lm9l8nbKAhmANIRo5EFy9lMew
 uqhCIgOleT3njpCY3/Dv7cMDqi4bwx/iXr8FHzCyP+4xEO4rb2Uae+SFRzrmb+HNtjjXKcUWcSf
 Benz8ZX3QBGriDvnxTFBIbfA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6a087d0e32380d8;
	Mon, 09 Nov 2026 04:26:54 +0000
X-Mizu-Trace-ID: b6a087d0e32380d8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Mon,  9 Nov 2026 12:26:47 +0800
Message-ID: <20261109042647.37323-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-3-songmuchun@bytedance.com>
References: <20261107043122.25650-3-songmuchun@bytedance.com>
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


On Sat, Nov 07, 2026 at 12:31:19PM +0800, Muchun Song wrote:
>Whether the optimized mapping can be used is now decided in the
>architecture-specific vmemmap_populate() path. When PowerPC has to fall
>back, such as on Hash MMU, it can disable optimization for the populated
>vmemmap range there.
>
>Add section_vmemmap_optimization_disable() to centralize this fallback,
>use it in the Hash MMU path, and drop the radix-specific
>vmemmap_can_optimize() override.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

LGTM, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
