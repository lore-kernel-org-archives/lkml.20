Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313982;
	b=eIv9/23D7e8UJ24kS/ynrBe9kgL7b1k5IDbLQEmN3gofk//JjSxTM2A7nEUSo6DxOjus
	 5D7smqfKxTmWeiCXa76cIqrmu17XL0Ljj2Kt/c1vDNbk5xeMwMooOCgt4xKFR6tcRCgPb
	 IwH8qXbjoNcmkwJ1lrSVTgsN+lUArnk8LkVwUW+XEyvLPQG8Ejsowfj8B5s9gm2j5ftjr
	 lemnZMo40EPUFRKAD1wHXfZKhEYsHu68TMuPjB6aTrtNdIjwCLwllH1TIvpnrufU2Meud
	 aZLWX+9ERESFmFwK9C9F5i+ar/lJEunD1GvJGHlZFYUjDmWdP4z5Aw5wQE0bzpIpFOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313982;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FZ5FFlHQL7j8baPJSvGmXmKdOgI4vorQKtT9ZrZsiwc=;
	b=s+ihuYXz18Vx6+hEP0cSwpZk239QxCSpiTzKIJcwilqsUk7B0gSHnzZeUJmAmpuXnenr
	 +QAogQMdRErUqnXCbII/6UUVpXcvaWvf1bq93qXRVTnUQm+8Ro43VFFtSVCzmWsHCRdye
	 67fHTniFZlOnY7Qq3/5aun3zmqGtHgdcnxaI+gux/awzacVxnO4/HrXXu+2hRMqzTZ35L
	 yrF0/UXQHIfw8vdsCd0dfL0h2ZCzPon4APqbTLgXVumwnQ7O03Vw0GSL12Tyc585Ek4yD
	 RzP6A7BvBcEPg1kYxzlXqx5VYQJUn2TDIFCK13TrkqxFlw7VRLhP2VN03eJwVoiZ3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJlizn0t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07F606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJlizn0t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F831F0089F;
	Tue, 10 Nov 2026 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313981;
	bh=FZ5FFlHQL7j8baPJSvGmXmKdOgI4vorQKtT9ZrZsiwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EJlizn0tvmKilnMc/pUeIZZjk8kEV89QnhAodf4KFZQQHaD+DuDwKF8hmXqcXvj0z
	 NAay+rOC4ofaKPXwHMQhMxk0FyBvoLzf6daJ6d/7HIsF+EadDvJPz3eyK90Cu0VZV6
	 vMQhFF3jHmYPoapUcz8g8xD4ve6Zmsc9VNzo+4RgHv1hxX6948qg3+zjgbbnlBmBLa
	 3pHkBJ2mF7pOWlTxnV5BGnB1BcvluU5E5UvXAGged1MDaDE98uhh6j8AoOxlnQ7Aye
	 yV+lsMlQ1cmiFeHeUHD+W9400zgPIp6TQtZnyTg5hSiGHxU7y3P0edqOvsqnRKDm/f
	 5Vo41jFuG3Pgg==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>
References: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>
Subject: Re: [PATCH] mm: remove unused clear_flush_young_ptes_notify()
Message-Id: <179431397811.3951.2634081114462730604.b4-ty@b4>
Date: Tue, 10 Nov 2026 13:32:58 +0100
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

On Mon, 09 Nov 2026 18:41:55 +0000, Shivank Garg wrote:
> clear_flush_young_ptes_notify()'s last user was removed in
> commit f3c493d2f42b ("mm/rmap: handle device-exclusive entries in
> folio_referenced_one()"), which open-codes clear_flush_young_ptes()
> and mmu_notifier_clear_flush_young() in folio_referenced_one().
> 
> Remove both the CONFIG_MMU_NOTIFIER definition and the
> !CONFIG_MMU_NOTIFIER alias.
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

[1/1] mm: remove unused clear_flush_young_ptes_notify()
      https://git.kernel.org/mm/core/c/c6d408f2

-- 
Cheers,

David

