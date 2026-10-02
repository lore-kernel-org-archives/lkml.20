Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52841175A85
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966142; cv=none; b=SrcPoFVvOAAAohi3j8Zw887KRwo5Py8fHoFeaD6n39inaZKg19fnk9twPqmEPaU5LmZ4yMD9z/Mkwdr/u2wGs8E60Ns+6SyVgeFFrkZz6er0P95bINSkOt+t9Pbs3aKiILZwUniNdDLNIMhEXO0jO9YhRY1IW1KfqcFsHnIGjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966142; c=relaxed/simple;
	bh=8o4CxOHb1bj0rwUQZ5wAaUgPYMdqohOJaD+Fpvd/KIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpI9xXNm3W9RGmBGlwyTPFnxm7eFXZuuxVNEgRQUSUQu5VbI3fNbmt+HyO10ktcB+swOwFri1pzHQqq+ccxhfC0WZAmcMiczc+gh8XUTcffARGWW7CY/BTFs4OpLkq1xLfq5nn4EbTE6YACGXAocvvJZpIfLfTZu/MxMDJNj2Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOeG2eVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOeG2eVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3CB1F000FF;
	Fri,  2 Oct 2026 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790966140;
	bh=y/73x+EUPq2/HdZrJ6Lz27wuBjrhpYd0dV9SEtLAZus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kOeG2eVpBFHsUIv7KDpSzOE7nii7Mm5THSEB+kjNbQ3NYJTZNClUlivpuGxPZrqiL
	 GDTDhortd6U0AmP945zLP4kZ2awqwtpv0cDYTdju2ljnYtk8YJGYOMAp6Pu79TaCrw
	 RYnjXNlqjCv2YCCB6psPkz+YfPWJnKLcp2tXouHpwfB5BdaSarY7TZRm+VFVOE3bqS
	 kXDBgx7NCCBQAbLQjZ9m81sxktKE5GKNqgLjcnRuR7XUhREHSl3hhdEUWs+qz/6Dov
	 bIlGOAwwLWepRNsVoBqwpzV+nzDa9X3U8rVFsgeD3iARu2VzOagJwss1ax3gG1I3vU
	 kIdq2XcvuX3zQ==
From: SJ Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 1/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
Date: Fri,  2 Oct 2026 11:35:34 -0700
Message-ID: <20261002183535.40773-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160535.661399-2-ekffu200098@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 01:05:32 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
> vmf_insert_mixed_mkwrite() has no callers.
> 
> So remove the function and its declaration.
> 
> The comment above the function describes the -EBUSY handling in
> __vm_insert_mixed(). Move it above that check.
> 
> No functional change.

Looks good to me.

> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
