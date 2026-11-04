Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784147;
	b=Ac5LFxI7eqppNrg29rnNpqi6K3jP5rXIi7tyGNP0bN6inqZC6zOuqhjSiHYeymmSlgEy
	 fkFBSc9yc0JInZicaXiHXg3hnG6UPkwDfJGHErSRG2rB84Ah2/KaEix7QnCW7GYnVmFlv
	 S59WDhemL9Ol4GqpKj7WScVW3ICW39s1lxsFSmKk6aQOtK1l5eRRR7fdDgkSos61+G6zV
	 FobMlEPeLoI9Fl9dF8EZSfW7J9DmqUEDoc/j07WTXzE3kxG7W+Oi2QaCJp+MsLwjtevQw
	 B7x8X9DzYC4muQ3UbrFbPv0kQmKm5KeJ7M9PVsVV4IJ9Bah12Rn06eaJKvnbHMa8QHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784147;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3tcrS+VGA8c5XSNIBjqAwoxO5qavlmD3HQXt9Orq3uo=;
	b=2X1JOb7VMmEWsiaU3NyEpCNWLnliDs3tAB8+a22PhIAg+qQR6URER7x0trY77Lqf2VY9
	 kLJcEhRNNoseYtXZ5T2j8gh1GjyN7MUN54Gk2VU8hviIJ/qs74liOeddcJXr14m7UNemK
	 VxjYtKq5h6AXzGR4isOVfKWI1vMFIY5PCkByeXUaWeJk812pfm97Nj1eBVsrJSe+feqma
	 H8lrql6PptAlaOVUlAKVyqtRy+jEZgKDpIWIQdQ1waSXcVb9i+CY6GV+zUBllASvExVAV
	 tXewx5vPAkzJ3PJII+37aU3d/81aXHWN8MzF9n6oFuiqAk0Vbtu3b2D4zIlCNwds6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4o9VZqj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80168606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4o9VZqj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6C81F000C1;
	Wed,  4 Nov 2026 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784147;
	bh=3tcrS+VGA8c5XSNIBjqAwoxO5qavlmD3HQXt9Orq3uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b4o9VZqjwMqS7Z+uD2u5cG7IO8989ROX9lcwZgswwac+NecRR4mPBPIph8TmJzlN8
	 iLrAN7NiwUqGUHYOKBDhWMh5tp9xQJOCM9kqL4NPQC3LOK2yjr8tiubN4XAG2i9naE
	 l7A89CXxWI4lXXWK+ZNUV1WsiBjiDvsCj4RrhvqxiolL+VbaUaNc/wo/MPsqKuYtQ+
	 y3dCxlxephQdRJRwb8Iw75WmkEANRoQbAR5qXgWouVp0whKw047FaqjlNnqt2aGb+e
	 rNptH+PuZkZsU9ep8MPEl+ow5MtqHyRbLw2cHBvio/zizp6FcDTUYTKT1uiPd/bcn9
	 95dAxKvjuH5JQ==
Date: Wed, 4 Nov 2026 10:22:20 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Message-ID: <aur5TPnkeRmZe5eB@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-3-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104023510.260766-3-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:00AM +0800, Muchun Song wrote:
> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
> describe fully independent choices. A split-only walk can defer the
> PMD-split flush to a later global flush, and a remap-only walk can
> defer the final remap flush. However, when a PMD split is followed
> by PTE remapping, the split flush must happen before the PTEs are
> changed, because stale large-page translations must not overlap with
> new small-page translations that map different physical pages.
> 
> Replace the two flags with a single VMEMMAP_DEFER_TLB_FLUSH flag. The
> new name reflects that only safely batchable flushes are deferred. Keep
> split-only walks able to defer the flush, but force the split flush
> whenever a remap_pte callback is present. Callers that batch HVO work
> can still defer the final remap flush and issue their own global flush.
> 
> Current callers keep the same flushing behavior.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
