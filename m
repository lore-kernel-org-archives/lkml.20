Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986948;
	b=YWjixZiopJNKf6AE/vFLeXRWrHBufdxUt2NeWMFxwwcoGuwWLFO41yXtWlxynnoPGMV+
	 92yYkD8sl0P7KX1esiqi3vTuteDaLqTBLYZMxN0InonUAJkvpOZnU+WMDVczHZCgaL7UK
	 IrzX4DW/aJT+QhtZ1rsl6JfUXEhGw61l/RdBhOz3wDvmHbP55wz7hSWlebaWu4oF6Ju/v
	 2fKPYikeZEv9c01fI3gZ2gFKUZa7DvzqCLmZ24rpziqZ0aCfYlJelzbc60P0zOVNFeykZ
	 PR/vp+wko9QpISFs3D/ISXDjrYaXer/6q2FfC1zPMgXApfzAK6k7S4Lw1OsX3j33eLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986948;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+q4fBaayeFFlFMq8uGMRkJxmg9BxhSzj1XcGm2+OXbo=;
	b=2Q+8Pza1W+qGfapKTZIF/AkyGrdaeHHyMzk3UTxxLvVK2JEa4KWYjwzRnwlHXwdvFj9H
	 cQRxlL/VH1sLE9LzJe6Z+3y9g1pUT2pAERaWV+vPvNYy8sFGBixW7iLXpVGJxUcGwdFbv
	 U2rVqo1ZY+uXTCh1N9B/0ECFok8d8R3QR5njxnhOQraWRAk6MCqyfKmUW3FWcX/JPalNh
	 hSc+APtvTaOlC28Lb1ufUyORzoIaBH6F534fM1zwNCEanbCJJXW+2gbtubHk42HXu2TtP
	 j/kgSusyCNbtzenl58jEDbn6XpnjVW1B2mZpobiajiatkfFbiPVtNUYTfUh5Atb/L1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmWKc631;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F43606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmWKc631
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0F41F008A1;
	Fri,  6 Nov 2026 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986948;
	bh=+q4fBaayeFFlFMq8uGMRkJxmg9BxhSzj1XcGm2+OXbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UmWKc631vhsumw1+vJW8p01VmsJppONkP7+d9n+c7QE9cbCuL9v6MhyWuCBuVtIA8
	 yypFhxl/2SHSuvD4CVkFGQesEcEhZO5HjxsZC3XrWsPRRmom/QtNGIg/q1wDaCXdHu
	 BBUuItdKUysyzWtUrG+dxieJ9HK3OjlSC1GlnvkWiUnZndxhiaGDETZROxPWf4aa5Z
	 MiOJqckFCt764nU6j8YQ6r8Dr7STofUYda3xazb5dCE+SSo4YaU6m4jUzIKqX5zZJ8
	 WbeogzAp0LyGLyWAmUFkR6T/SiJsU4MTKBR0TlDui4AGXycpjjVRTFOJ1Pp5er2byu
	 sBdCo4xzbeRKQ==
Date: Fri, 6 Nov 2026 17:42:20 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Gregory Price <gourry@gourry.net>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/vmscan: consolidate promo vs. high watermark
 checks
Message-ID: <au4REhIF64b6TUms@gremlin>
References: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261106172620.318113-1-joshua.hahnjy@gmail.com>

Hi Joshua.

Please send patch series of two patches or greater with a cover letter,
with each email sent in-reply-to the cover letter.

The easiest way of accomplishing this (+ our preference) is to use
b4 [0], otherwise format patches like this:

$ git format-patch --cover-letter --thread ...

(You've got 22 patches landed in mm, I shouldn't need to say this :)

[0]: https://b4.docs.kernel.org/en/latest/contributor/send.html

--
Cheers, Lorenzo
