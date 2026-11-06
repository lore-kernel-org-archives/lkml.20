Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973602;
	b=l5fyHOnvtQwCHC2DHv1uLM9HBfswD6DA5VtAepsVMlBBB3lU5SqNihFpm4+0XfFX8OLN
	 yTPOArH/XK7nlbFv6TizQRu2e61TegxBalBJtURKeGAxebLdtRSYVvSVdW/t3JDwne+/D
	 270Qk8wHVKo92byioxd40CA/77JSoyRV9Wf1CANUqI7KFly89AdnOGRjtILzWa735tJ21
	 GkQWL5vQlu+qOpmM5q8YudC9+EQUpjyjTmwIhRefL0O3A7J2h8dSGQa8rMSucgMS8uuSZ
	 Bytefkk+a5CmUbVEeffHTyynTYX84pePyTdbEZfi0W+hN3jzBqfpMmuVS/X7OZwJVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973602;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=eexjMTFN7v7lg4Z4c2OJF+aW3LZ2WWO1iLxRzvA3R5o=;
	b=1q/eiCHAROikTIOGhjOLJB1BdtWuXfeLOl1aMcgn9Xq9ZwzVIC99klL41EeyQHbngicB
	 O5EswOcg554HiAHrUDIF70Z9Zq1glr6RE2Euvv6J9qnmHaxjYN9SS6D7vZlUMbRuJ6cZU
	 e6VF3F8/4u8XLzcCk813ymYbyDn32JNPBHm+vyfUXSzjFVSdW4lw8rpyCSAWuZ8m8kNDO
	 QXyZaq/22xF0VOfy756YIBMOYt5/5Px9dfGe4iPdlar9OFDDaLm8c7srwlFA7fW6WlgEZ
	 bnJWW9mbet/svsSjVYUVYCJKgVNmTgJV0IwfMWV+YO2Wsmjxe8YjH0XvVJ+vKe8/hjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaKkO9ZN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AAE606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaKkO9ZN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FA51F008A2;
	Fri,  6 Nov 2026 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973602;
	bh=eexjMTFN7v7lg4Z4c2OJF+aW3LZ2WWO1iLxRzvA3R5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DaKkO9ZNM+Q0qufgnjGc4HJfMAHod8W7cPvk/BoWGONZIPuWWC1VI7wa0izsehCYp
	 y1M2i3BDf3U7weGU+sACcf9bWpVy1Kla6JDrKBATOxNs+GKYNXiomVng22LHQOwg1i
	 QAKaGHCAPXovJRH6hg+9dR3n9GeXmUrRpidhEBeg0RbQfg8jOFO3+Sp4YADVSSIhbL
	 d9w2cAutD+eeTskAXRDelnjVGyJKJKXCaUtkJ2cJ0fAjjBUmSCoLS3PD4mkscVTnM8
	 5mDbKPlvw0+JnDylvP3Iv0s9VXZwUb7KUPo4pKpTfHPLzJRPnCSBr7oevSCfCOp37b
	 0b6GZSWCT9wmg==
From: David Hildenbrand <david@kernel.org>
To: akpm@linux-foundation.org, david@kernel.org, 
 Song Hu <husong@kylinos.cn>
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
 apopple@nvidia.com, willy@infradead.org, shivankg@amd.com, 
 ridong.chen@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104044313.2099309-1-husong@kylinos.cn>
References: <20261104044313.2099309-1-husong@kylinos.cn>
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for
 swapcache
Message-Id: <179397359780.3625.7399143861133982340.b4-ty@b4>
Date: Fri, 06 Nov 2026 14:59:57 +0100
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
X-Mailer: b4 0.16.0

On Wed, 04 Nov 2026 12:43:12 +0800, Song Hu wrote:
> NR_FILE_PAGES lives on both the node and the memcg plane for page
> cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
> it to the folio's node and memcg, while __swap_cache_add_folio() and
> __swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
> the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
> carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
> memcg file accounting when swapped out, and anon folios never had any.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: migrate-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
      https://git.kernel.org/mm/core/c/ecf439e4

-- 
Cheers,

David

