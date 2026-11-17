Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909678;
	b=ICJOxIMNbYUjZ6Bg3TlAFlyaUtKuJdKQ1YbK4K8o1Zb2WVQG1pb256awoFsw5UUTB+7C
	 i5+91wrbsOztqwemkCcNPUKG2+XFUHv0Z88sSzL+idUU6S6z9qNyYPmJWeap9/3xl3hPL
	 savOZapD2e5u49xox0phRCR+HHDrF4N/f8NbStkEYw11UmqjqDeQK9iT187BiOtgonIw5
	 riv9uWlmczI9bKXsfan2ZnfEJmDBkl8MfnpplHTZchCbFHRiT4hpCJP+vsm0M4/z+eZWz
	 93DYp5Xm6eAbVdUk+A8RRhhrd8H1ZmVd4wzUKAOzPik1wPU3rkmjOqUU3RyOhkHDYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909678;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MoWySit5fRy24rju7FbHteJ/SZvP6jKvjXiSW4xhXrk=;
	b=ogn4Z+pMwl0gs82ECJpJosnnxT51pYSNYx6EgdUL2KdNuakVUJxVGb1EbHz+7msO7r1e
	 4UcjGy0AXVGw9p9SFjvzeBnrmcY+gEJoRGkREeu26qpFESUPIWdsIzmLYn6UKzvxxKiS0
	 BQcujhl4KizOIaNUxLQxqCXm5DyTGGG9UyT/UifqLvFz3oxaSTKw0z+qIERXC1i2OuSbV
	 L4v/24H8hMGNpEj6cO1qiNWr31gQ2SUqVsAy9b0E0z5YOM04XLJ15c+/GG2Ve0xTV5377
	 xUn+muIcehQO0XHcGUz+f60IxINJ/hGdRsT9jwVAWqnSPJGrxGI8NYYPbZImF7FQVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa9hoOtM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0107A606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa9hoOtM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B361F000C5;
	Tue, 17 Nov 2026 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909677;
	bh=MoWySit5fRy24rju7FbHteJ/SZvP6jKvjXiSW4xhXrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pa9hoOtMtdGt02LYiqy0CGvlJcsoMD/NB+0fsjT46VMDBIhXgCYFh1PNLpjCHzKsY
	 MUnA5JEbcHctB6VIoiUs0zjUCl/C0FgH0WMs6EgGCS2+30YSp1g3f+j/0Am9Y9ODMg
	 D5LyPNW1mwrsazFZCgFS7bZp3MNKHatbL6lDDEZoE0RR+QUE0HocjCnhUDCCJDzo02
	 4sYsy5tHwrQPPH+auPF2V9gxb8JTVyGm2CjVQRYheJCu7kfeMeD3Uvnh9txNrg9HnL
	 QNcoq25BmmSgXDAET6rsyL5m8LwpoSLWicfwGM5ew+U9hxwMpJ5giKY37io4zubk6X
	 3zxo6dqsFjdKQ==
Date: Tue, 17 Nov 2026 10:01:10 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: junho.cha@xcena.com, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/migrate: drop the fault lock and wait killably for
 migration entries
Message-ID: <avwj171O8QMg9Akg@gremlin>
References: <20261117-junhomax-fix-mm-migrate-killable-v1-1-f6e7b135a159@xcena.com>
 <d463af46-13c3-47f7-8b26-702a8edcd140@kernel.org>
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
In-Reply-To: <d463af46-13c3-47f7-8b26-702a8edcd140@kernel.org>

On Tue, Nov 17, 2026 at 10:46:24AM +0100, David Hildenbrand (Arm) wrote:
>
> Hi,
>
> I assume
>
> * this was not hit in the wild but found with an LLM.
> * Most of the code and patch description were written with an LLM.
>
> Correct?

Clearly. Their 2nd patch ever *eye roll*.

The patch itself adds FAR too much complexity, and clearly there is no
understanding.

This code path needs simplifying, and I will be making significant changes to
migration for scaleable CoW anyway. So absolutely no to this patch or any
variant of it.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
