Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614745;
	b=w6NM0CLvTs/qFExhUlX+/dDmFbImP29Av/RgYZT0bznNsfhpTpuDfiJYzg9y8KQ5al+L
	 7VJC84LlPxqtUhOWaeUypFaKnojbMfVQJdWz0wkPNj6cV1SWPetVfDfTOIHOVKa+MJ2ZK
	 av3IakUwBS/tp/ec+0t1vxsIq6CP3XOO7JcqjwHem1smpIvdGDoP/Mvj57urCntbIjiQP
	 7lPU89X0zTwbGpS31RsesDr/Fjvi0cOACQEzaMJpYqjKbv7Ew51ba9HcZWg0/g8NBvavq
	 ofZHkAlzGRQSSN/caRa6eXusBZp3kyggWL1yylG3NSsZh1t0/fwaVTmCiQtgeDzMdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614745;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=a8ZxaXME7Bo25b7JtSuwLQt4lbE7+wAcQiQGdsNPSzg=;
	b=pmP/+FmvwcyMBSDN+ekcR2N6wDKqXxw+/8hPgwVK3sAntfzEDQctHwD92NHz/Il2aNh3
	 hdzf5rl0xa3x2ZH1ZUmXRj/jm9VjOE/JBPT4GjtT9fEv3kfeDOjabHMKPdO8rsXsxPYTG
	 +ey4iVbdOtaQzCzqLvFH8fm56UoiTJtG4cp/ZQEyYEh4crNCQiVCwUGEEYVrexUQ7HKxO
	 kmWsS3Ta3aTXwJ3DXAHwQQoOEix+cpJYWByFpm9T4yn7BnUheNutm1CdTw4IPeV8o+uPC
	 jauXlMS/x73ioWSe5UCYnvV6jIw5r3oMM18KDFwdzA4y//I3dO+Y5r+bgY3JR2PF42Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dB9WMfe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656F60A3812
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dB9WMfe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65421F00A17;
	Mon,  2 Nov 2026 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614745;
	bh=a8ZxaXME7Bo25b7JtSuwLQt4lbE7+wAcQiQGdsNPSzg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dB9WMfe86WuzsWLNIhLfLhFiI2gB/+s6SmyhN0CAvIfXFd7LcmuTtmqH40bTQanvn
	 1RDFlklIEI6gVL8kqPGOsMlxNzqA5fb404W9aA4h+Jvp9HGScx/faY3DvhQf2ECaq4
	 2uLwIwYKgsbbil9xGQ6ntRlX2MI1djgNxiTrUCI8il8IGo1UlUwdiUrWA4OAp8zIS8
	 TqIG4zhpCxyYobaAgROTkzMIfRikJc+q1k2+NMz5yqQ0rlz8v6hUKGB3PQmB9nqcXL
	 R10wr59jiL9dHZAXqzK10kmRXl0jqDfR4XM2SLejF9wAo+ZmuhUS80GXWZ6jR6cAig
	 khieferF5zMtg==
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
Subject: Re: [PATCH v2 10/12] mm: hugetlb_vmemmap: make vmemmap restoration
 folio-oriented
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-11-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-11-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471105.1337633.13890106172591126826.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:23 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Like optimization, vmemmap restoration operates on one folio at a time,
> but the current interface exposes a raw address range and requires the
> HugeTLB caller to prepare part of the operation.  This splits the common
> mechanism across layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap restoration and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
> eligibility and state in the caller and gives both directions of HVO
> consistent folio-level interfaces.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

