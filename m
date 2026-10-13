Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD93B059F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882145; cv=none; b=dBYDs4um4V9Kh7jv59Ct91a57L/TFzk2ahDhuwDNL8x5sBHD1YJBpf5vqkZkuIwlvPXOq8RNq2GF88U8cdPJaHnjVy5jDOQJAttWdrV4JM3TyaV1YzaWXUhGLMhejmp1LWTvfxt7It2JWuZ2hcwJRo5E4CKl+DluifuEr3fknog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882145; c=relaxed/simple;
	bh=eN7TcJL1EJpdWf7TA2BroTHIBPVO0AzX4LZwa/T68jo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DBJG2fXlr9HBKvlutZM+Y+mAKJjf0WkcHVqXPidOTkU1oJB5cFSdsRRwT5BsQ9V7/RQG/A2ro5XtHpzeQUAoQD30s7vvlptbk6v1EYV+BSh4HdbE6caGXoHxN968EPrFZmh1/NI+x9QM/jkwOUSrJDcBtLhLGMQHpYG4tOd+lpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSkbhZjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSkbhZjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755671F000FF;
	Tue, 13 Oct 2026 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791882144;
	bh=isgOp/oWK7UgvcDokY0BIJcX1YHTkMKo0hu92B4JBqE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WSkbhZjmBqxa/sE2Mnj8bDjz5+8dGlp3i9aHxaj6Eh1hfQ0DAxLPoWWdiZURnF/ca
	 Tvbld43AOhDlNw9YBllVvmszi7dHcPek92UyqKZQ5o2H52xrnkHnPUyUzTDXKYyNgH
	 i0a4LNwP7m8WVeUKgeA0cOzJpeOhrIKm2Gkd3T0vDx+8dSeoAuMDXszD3w7bYhbjTE
	 /ROYm1XgqH1+HjIvKUJTs5jBAfVkmhOy6TB5DUFKovrpNtbOX220LROmoSRL7p03mY
	 oE+0lCVh7XqFtCADccnxOtMpR8kiH3fyURn5RbjKYISlVtrcEjCoo9x8X28TZqbfM1
	 ZlVGRj6iDynXQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Sourabh Jain
 <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,  Alexander Graf
 <graf@amazon.com>,  Andrew Morton <akpm@linux-foundation.org>,  George Guo
 <guodongtai@kylinos.cn>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH] kho: fix global scratch size calculation
In-Reply-To: <as0UrrAvqjvUPyQx@kernel.org> (Mike Rapoport's message of "Mon,
	12 Oct 2026 20:11:10 +0300")
References: <20260922131217.698809-1-sourabhjain@linux.ibm.com>
	<asC3-4WNiTF3n7l1@kernel.org> <2vxzo6czjaa9.fsf@kernel.org>
	<as0UrrAvqjvUPyQx@kernel.org>
Date: Tue, 13 Oct 2026 11:02:20 +0200
Message-ID: <2vxz33uaj7mr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 12 2026, Mike Rapoport wrote:

> On Mon, Oct 12, 2026 at 03:52:46PM +0200, Pratyush Yadav wrote:
>> On Sat, Oct 03 2026, Mike Rapoport wrote:
>> 
>> > On Tue, Sep 22, 2026 at 06:42:16PM +0530, Sourabh Jain wrote:
>> >> KHO calculates the global scratch size based on memblock-reserved kernel
>> >> memory. It passes NUMA_NO_NODE to memblock_reserved_kern_size() for
>> >> this calculation.
>> >> 
>> >> When memblock_reserved_kern_size() is called with NUMA_NO_NODE, it
>> >> counts both:
>> >> 
>> >> - memory reserved for a specific NUMA node
>> >> - memory reserved with NUMA_NO_NODE
>> >> 
>> >> KHO needs to distinguish between these two types of reservations.
>> >> When calculating the size of global scratch memory, KHO only needs to
>> >> account for reservations made with NUMA_NO_NODE. Reservations made for
>> >> a specific NUMA node must not be included in the global scratch size.
>> >> 
>> >> Add memblock_reserved_size_nid() to calculate reserved memory for a
>> >> given reservation type and NUMA node. When NUMA_NO_NODE is passed, it
>> >> counts only memory reserved with NUMA_NO_NODE.
>> >> 
>> >> Use the new API for lowmem, global, and per-node KHO scratch size
>> >> calculations. For lowmem and global scratch, count only memory
>> >> reservations that were made with NUMA_NO_NODE. For per-node scratch,
>> >> count only memory reservations that were made with the corresponding
>> >> NUMA node ID.
>> >> 
>> >> Remove memblock_reserved_hugetlb_size() since it has the same
>> >> implementation as the new API and differs only in the memblock
>> >> reservation flag being checked. The new API handles both kernel and
>> >> HugeTLB reservations through its reservation type argument.
>> >> 
>> >> Define the new helper as a static function in the KHO implementation,
>> >> since it is only used by KHO and has no users outside
>> >> kernel/liveupdate/kexec_handover.c.
>> >
>> > I looked again and this feels like a band-aid to me.
>> >
>> > I think we need to step back and rethink the order of the
>> > scratch/kho-bootmem sizing and consider how NUMA and lowmem are involved
>> > there.
>> 
>> Could you elaborate? How else would you calculate the sizes?
>> 
>> To me, the idea sounds fine (although I also share your comments on the
>> code style). This is what the global scratch size should have been doing
>> from the get-go. Today it over-allocates by counting both global
>> allocations and _all_ per-node allocations.
>  
>> There is a separate problem with CONFIG_NUMA=n, but for that I think we
>> should just have a different allocation path where we only do lowmem and
>> global scratch.
>
> I mean more fundamental code refactoring that takes into the account all
> cases (and I could miss some)
>
> - NUMA vs no-NUMA
> - systems that have global scratch containing lowmem scratch vs those that
>   don't
> - and of course fix global scratch over-allocation

Fair enough, that makes sense.

[...]

-- 
Regards,
Pratyush Yadav
