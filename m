Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641153;
	b=Rv4y6eLZJj91OQKQqF4QLCX2pkgCV0Y8T4aJCKGcqWoWT+hCqeUQlMNjqyG3UQ5iyjtt
	 +hmAPC2B6ixGDtMyQmzBRIC575lNa6Qxr7T9AikHAsuer/KXBU5zjTz+c6f0gZ3RfT51q
	 Vf3Cz5mqqX3WCA7ThTIg+SAIihODfssd6LH0BVi+1rbLgJq9LyArpYJ276M0zeAmNH0tH
	 0DVnCuCEai1jAYRvRL2A89gprr0FRgB7W/rJxk9NZbiH05MroeOBTd0OV5CD/+kkNAOmv
	 Eta6CtVABGIzWWv2Ts40YdTmd7qd7FooX3mVTjD1bVDGd6AkmuPLdcoSoGOSt5x4MSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rNOMRbzYMbZGb6y5gxxZI8K9YrwqNsZRDhpCrVIh8EY=;
	b=PYBcNcomr06Zts5g9l9lM8GmBUmf3k0HpI5/AgnstG7aZCJohNLu45zXTq0fSoBtIQCW
	 V1lamDdJbBlAUydyT+bmIQr7nVtLVneG86OzOYwmLoq1GZntLm4ReCJv2JALPbztiIWBs
	 01uQpHuoilUZdnisxVWcS0JFvP5fZukROmvoLGs03U7iu+DyREdKAHZ3cC3mXDLPdXJ+Z
	 Cvr0Dyi0J6QlgxdyuWx+lGHZwbDwoxCiOYm4gqYTJZvaC4cOVZZHyq4oO5NlLCFPscm09
	 nfzcynqjQerrQLyluQ6CW/9fESKCJHVoR+9M6iSkPRIsCrFeWJEjUZP/zKKr2/3s6VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="taT/mzxs";
	arc=none smtp.remote-ip=91.218.175.85
Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A36606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=taT/mzxs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rNOMRbzYMbZGb6y5gxxZI8K9YrwqNsZRDhpCrVIh8EY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792641150; v=1; x=1793245950;
 b=taT/mzxsRCbeJUPiIxfhWUiV/XcM2Lh+W0BYcgSO6C1k671m2QgJ3Rwj/8CTnbnZDXsnf5+d
 Yozf0oEof6t822/R6V/xaSMnmTaH3en7USDeFgOcnTSDMZQxRMhphjjs86aS4aTQQqC3uVi6cr6
 kteai9BUV5uHyrVyyWox1SLg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27a94bb973f2152f;
	Thu, 22 Oct 2026 03:52:30 +0000
X-Mizu-Trace-ID: 27a94bb973f2152f
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/12] mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Date: Thu, 22 Oct 2026 11:52:19 +0800
Message-ID: <20261022035219.45930-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115824.823278-1-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:14PM +0800, Muchun Song wrote:
>VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
>describe fully independent choices. A split-only walk can defer the
>PMD-split flush to a later global flush, and a remap-only walk can
>defer the final remap flush. However, when a PMD split is followed
>by PTE remapping, the split flush must happen before the PTEs are
>changed, because stale large-page translations must not overlap with
>new small-page translations that map different physical pages.
>
>Replace the two flags with a single VMEMMAP_REMAP_NO_TLB_FLUSH flag.
>Keep split-only walks able to defer the flush, but force the split
>flush whenever a remap_pte callback is present. Callers that batch
>HVO work can still defer the final remap flush and issue their own
>global flush.
>
>Current callers keep the same flushing behavior.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Nice work, don't really need two flags anymore :)

If we're going to remap, we still flush after the PMD split, so we can
keep batching the final flush :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>
