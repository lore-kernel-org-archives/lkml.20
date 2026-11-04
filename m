Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795972;
	b=aefBXfHbIT8wKTt27zy2pg4xFBwae8xfC+9wgIPZWU5UHFjLiy3SqGtdM2SjJW6zIyM3
	 SIi0Bhuz9Pvysn33H3ZgH8TKA6+HHiWZhVDNj0jMN0QK42/QJ3CPK9q1Jk7PtjI0hlovP
	 fDfE0APH6WdrhT8IcWFAsqatvwQf+ZuTWzf8VKTf3GppNt51gCL1qZsIhgQM+BE+yOpKA
	 wuDBEpmMNSC8mJ1kGZzOUWLt3X4+sJdulpgi3cBErjVUy60XrauDGkvCDmawCuSbqmbeZ
	 iww6omDp0kzQPtzJiqkphiBlS5L4Z1P2UcVyxPgSvTAS/UKfwHwXQPF04s2fcDxLRtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795972;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CLdabnqjRGqJbOryxnQw1FnEsduSPSMDms8rKrXUDp4=;
	b=kwSoOFE2/uZJo1QpJsKvzfN9aVFXUlAgEDXnUr+KjfdMAGJNhLT7FuWq/A7gdwu/rhJN
	 9nTBxK3zrB+G0I4cw/QKY8hT3QTGXZiX+4OyyBHK+946lZtxWaIBlwjXGzobRJyzJZY9q
	 Ishb0VHI/giW3ajFsuv/hPB5obb8sJj/y8dQ16PvYlFmq+jgl2w410XYUErXVWsFZh5D9
	 76jmGlurTX4e8FsTi8Jx8JFXVdONTBFAhjqsyxaB1PUW+eGdm8SVz7yej/88rHCoGLeYJ
	 DZ8imYJp9Xps73H0utlB/m94m4zYwcbHADDFLvLHbaG94ljot4aU8Ae2UKkJro3M8JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPJBcqX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D6606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPJBcqX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFFF1F000C1;
	Wed,  4 Nov 2026 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795972;
	bh=CLdabnqjRGqJbOryxnQw1FnEsduSPSMDms8rKrXUDp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OPJBcqX0u2MFoxFVrLdBF5bM20IJvoNWvtntKMGm+5yvO9c7V0K1TpDcifno/7GDa
	 ihNTIZFu9qmPvpdCHM/YZmKcgpXNSa+2I9sZftvfo0vdiaDdykmyH1ptvMPDFomWXu
	 I9fB1pedPiycAv+pAlHL1Beut8rHjVN+AOl0Ww0BC7xJN6GrOat3h2U5834DK+jwEK
	 5r7BRw6rlOqfkEJeovbwKN/6d2/d56CxqU6QbX+nDX8g+aZyyVVs7qaDdk4fg86ota
	 GtKgWtkEJAFkzIAYEl02cIkU91jDY2KQE/OClZ6QV+4RfuWlrNRqM5piNbIRBNDUi4
	 E5PVi9sqyW2rg==
Date: Wed, 4 Nov 2026 13:39:25 +0100
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
Subject: Re: [PATCH v3 09/12] mm: hugetlb_vmemmap: make vmemmap optimization
 folio-oriented
Message-ID: <ausnfUK6_CixlDow@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-10-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-10-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:07AM +0800, Muchun Song wrote:
> Vmemmap optimization operates on one folio at a time, but the current
> interface exposes a raw address range and requires the HugeTLB caller to
> prepare part of the operation.  This splits the common mechanism across
> layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap optimization and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
> eligibility and state in the caller while making the remapping code
> applicable to any eligible folio.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
