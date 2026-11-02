Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614748;
	b=P3Knvzs2dMWPAvqjbzVtCx3hjsknYVcjf1zfogV5YdOLvkidAXZO3+PO4rdM4a1fyyhi
	 MX/puIjB2RYiAwsK6GPsJRqcnjb+qTPFpx7SugMfYex1daPXuUFoh2AV/I9DumJ2J+kgV
	 3BXU6Dz0qqLQM8VobJgBziMC2K3CbSRNSqMAfmRO0V8RWPD8iqYX0fR2w13DM/dwNlHtk
	 HRLcal+R9rCHqzMNZihjeC7g29rOpKQuF/vdZ8CVVqcdnnnvHhn5Q3nnaVc3EnFwwvBmw
	 whrMJnjtHIgJDc/+wrg232G5QsThU9s6dlpM84xDiX6OGhcjMxAWbQ+qZ1OBa4iKn7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614748;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=2SRV5FSJTfbiUrmKVm9iO7XnZ9kNn48288RtL7ogiPk=;
	b=fZfCZss2hu2pN/DZoE725BBejL8swaQhdPDB0G1oJRvTfHMSc/sUBuHVJBJaO2ZQVNYU
	 pXSBOw0lqu++4kaeHuHYeCPzXV9qQkEOS47GDmySqCG6UfCcJjObbhQQnPi6ZRQhG6FcU
	 rGYzNutQC362a4CzPe7hVZpyGB9Hb5rh+yjIs72UjaDvuW6rg6Bbdr1BP1O2bXyrVRGxk
	 GSLT/dmp5dt7VESjXa3D0MgmidNOdAbCtnMwr2bvONfA/pM7K1cULtpFumiw3W8KwYm6t
	 b6nadwluls4t/s90Dq5bt/Vy6JjzhVVRejUgE2ixgCLGbaa703pO68HqqMM+Gy5U6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpFvDYs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534D160A5BC4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpFvDYs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC86A1F00A21;
	Mon,  2 Nov 2026 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614748;
	bh=2SRV5FSJTfbiUrmKVm9iO7XnZ9kNn48288RtL7ogiPk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CpFvDYs9htA9hVrKALdU3qYT2NeHXflE9aDmKWM86QDPZyWSbNzdHEgSXI5hZ53dD
	 XvIXTvOmd69onHM/24o5gsiGglENzLLa4OhjD7ppjMtdwgpP2niRfzfVwOGUyDgWpv
	 6q1SbpybSJoTj18pX+j1YHtLyQF+cgAqXniILWTaJVW/4FHo+O+GTvcqup6VQ/bktl
	 +qu0DDo8O8hf30Y/owgMaTwuzch6ZXw5BiDw3ptHKb2sNYb2bI1vTPawdVdjmA2Slz
	 8IvxOG06mSHVDZVTEn1ZBbaOuL10otd85FBE0uL/0qyzN1XVyqzg0/7/Y2y01A9zs8
	 gIqdRPX7emWHQ==
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
Subject: Re: [PATCH v2 11/12] mm: hugetlb_vmemmap: unify vmemmap range
 restoration
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-12-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-12-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471105.1337633.15759596677330627009.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:24 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Restoring an optimized folio and rolling back a partial optimization
> both restore a vmemmap range, but the operation is currently implemented
> separately in each path.
> 
> Use a single range-restoration path for both cases, making rollback an
> explicit bounded form of normal restoration.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

