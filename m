Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3D379C42
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974997; cv=none; b=LPvX4YNG3goe9tDsIIBA9/YkCq146muvvg6fX1qHfF7FImErX+BIQXGVUgUvOiVLsf0v4jvYmEFEwn5j38Iz1dRtejEjLF13sROkiR8GEBJmuRaSWUvpZFs8gJpRnN5F6r6dUuOUYgvhJke7XMV1jAA7opaikzPUIMfZ/yGABfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974997; c=relaxed/simple;
	bh=PTT9oCTGTJcv0QKm/wcjjUFEFS2+39TNyaGAhh8GyEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvHch9mlvf/PJSvr06fDwTn4Bk6y+YFk9RLZoEgqlezimL7O3po6UEw0tNVlFp6uU/Q1RdYalX0tprtXegpwTZai6Bc2ALvyTQh7kXV9ncIeOuQ84RZV9aLrMOVPFp/6TDMbHcRAlM1b/k1vTwGX0gksOQLTLNKr2n25HGzDEak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/7puuK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/7puuK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C0A1F000FF;
	Wed,  9 Sep 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974995;
	bh=0w9/jZ373p7P3D897CyML/dHbeXZJ5LRmmudsSZnbA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P/7puuK369h+/RU0Upssw7MVtmraj0x6Rj9zF4O6OgWZnlNJihorghvvebmE9Cyjd
	 ++IFKHfLwUDTfoSBpciBhMePZ4wD/JAyGV7PmX6HI9abSqFt5dEYcEDSgtGxvIE5+7
	 BBs/6zXUasvCCFpAEHb6QW41wuplou4Y684LOjzVz0+r3V3jYQ1EQd7/nDbQQS+vo7
	 ur3Dfzuu+MK25g7g/uQxaEWKYMcL9d/bKaN2gqDMFRCcN8r0F4s+hz0/nBrG9FHH1t
	 nek5fYJ5rszq0OtkMVVnrYHYqogjM7ZUr73J243o4dR70lvbj7XD4qVNqSH+G3fQI8
	 WV9HdsOf/6hQQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-mm@kvack.org,
	Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update memblock tree URLs
Date: Wed,  9 Sep 2026 20:29:40 +0300
Message-ID: <178897497730.1618256.3526476873258774957.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831102143.69265-1-rppt@kernel.org>
References: <20260831102143.69265-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Mon, 31 Aug 2026 13:21:43 +0300, Mike Rapoport wrote:
> memblock tree moved into mm/ namespace at git.kernel.org.
> 
> Update the T: entries for memblock to match it.

Applied to fixes branch of memblock.git tree, thanks!

[1/1] MAINTAINERS: update memblock tree URLs
      commit: 6e33dc90df108c76899dc544a42d17adcba61668

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: fixes

--
Sincerely yours,
Mike.

