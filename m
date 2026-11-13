Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563701;
	b=AsTfbmM9e5cK1oKI4EIADlSKbvZccB71UkHq/Ac63AKokia60w6FljFbkDlkw8pFLBe0
	 KLfj5HDHFbN44CKioU808z/UhW4V/lzeFW0TCifZz6g3E2Ke2NVFF8flcGV5Y9HNZlEMD
	 0QvnSK2MDaz8QTMjiEY+q36O39P0J4f2z/vaYIsCbvT9MjeWK67O0fpQ7BtAP4uygmXIc
	 tu+NBzCCqubHHzmeMjNYIqsvMseoDHAHRm5HSuYjVIVK0qbsWhkoFxPSwN5SiB+ajpYp4
	 wQh73rshQ33hUOiyKT1+oCn6kNDGkYujPuTqRktMu0tFcudl0FMm6isQE11v2gJs1oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563701;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=MbkTf9SgaS6JnGkuLQGav5/IuL/7zHaSNJGSKht4aR4=;
	b=CRqodyOb5VI4+t68zb5o79BPYNKQv2/cI/kQg5MpDohq+23zSoh6JlTc8YwWyGBgzQ5z
	 xXmhTELafp8/bCnMh8i9Y0pOcnIOYwMvJFjK+DogFpdhDB6x52UcYoriXwCWE5p4INeIk
	 /ZOrjN4NrwY8WQNXdyP3ho7HiTSgRiQpq1g8rhGDViHQVtQKPt5fysxvBI5Cd+/8nXHSJ
	 hxv04hOJX+kereRaiWKxqkus2EZWq9nnlMI1wSNWBH6p6bZWaApUJ82bk0Le1/Jkyfz5F
	 lI0KyG1Fizv2UuQimfXy2+v+8ZtbG6ooCeUmDOoO31dDkzQ4raWYSOQtOq9lX015ahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTm7CQqg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A660A2619
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTm7CQqg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5D01F000C4;
	Fri, 13 Nov 2026 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563700;
	bh=MbkTf9SgaS6JnGkuLQGav5/IuL/7zHaSNJGSKht4aR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nTm7CQqgUscC50x1W/0K6f6p5WjmeArjQ3CZ4rYnNtvJk+E6+UFqzsbtLOcYvxxh9
	 NSVXLyX+OkJEZfTAWfB0b0FPUFETUP6AKqNezfPxVTtfmWXryl6GbwEM5Dwg8zo1Ea
	 g1MMPQVuMWjOWdhxa6zb3R4Cxh7Zy5Vti2Pxt9XRXIABlaRVVYAmirTGN3DM0PT/Lp
	 j4oE47IhKuwUCKkWjP4OmGcu/JvHOWVNpo4iLw7/l2jdelrrq5KGQEYrtKWb9dg2MB
	 ykP47m6LDQEz7YbbciHItLFSXD6hq9xtVrlr1mDWvtAjwN/R45qUuYIfO9x/+/0ube
	 Q7BoHi7Ifj24g==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>, 
 Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111-unused-sym-core-v2-0-3edc7fb8581f@amd.com>
References: <20261111-unused-sym-core-v2-0-3edc7fb8581f@amd.com>
Subject: Re: [PATCH v2 0/2] mm: remove unused vmstat and folio refcount
 helpers
Message-Id: <179456369702.3609.11370807693107108517.b4-ty@b4>
Date: Fri, 13 Nov 2026 10:54:57 +0100
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

On Wed, 11 Nov 2026 03:34:32 +0000, Shivank Garg wrote:
> This series removes ten static inline helpers from
> include/linux/vmstat.h and include/linux/page_ref.h that have no users
> left anywhere in the tree.
> 
> I found them with the kunused scripts [1], which I wrote with LLM's help.
> The v1 cover letter [2] has more details on the scripts and how LLM was
> used.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/2] mm/vmstat: remove unused folio stat helpers
      https://git.kernel.org/mm/core/c/b5466234
[2/2] mm: remove unused folio refcount helpers
      https://git.kernel.org/mm/core/c/7b474ef2

-- 
Cheers,

David

