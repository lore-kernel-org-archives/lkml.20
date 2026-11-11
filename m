Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402735;
	b=sntoKECroh/Z0cgbXGhob33uCkkXuBPXHljJW6qZzO+UScxaT1UHEfLmuT4hpCIKM8vg
	 wVs0UFYH5NhDekXVmN3jvypgefj86u0jkR8fG+fB8tJNRH+yKUljWhcXpVOmCkTiplGhC
	 PFHnDMe5n8CweUUFZ0VgHWuSMbpNmhl4HlRgqMt+NPt0K9q+XUgK2c08mnQhz0xfUheRz
	 /WTndGMKPF5JSqnqqGrjD5NDn0z0ThxLBmixEuAqc8t4JhyDekngwFjPibDkSf4duQYlJ
	 QTeDgWIziPdYDYQ47iHNTxaRFJsN6AT6xt4WfeeDuikXg26LfAigcB2oVOO5sj2eUTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Xirn7Dc5oy647ZCJttt6/JzcrWgzS0z+CjkgHSeTgmY=;
	b=mniWmYpV1iRBMXyGveSaYLv9/SYylJcYZ4aTr2fnJMrjDF+MXQmPeIV8e9FxJ/k9+mex
	 ehKHQWX2+CiOKrR9CGX3D/iwQkhkBiLWYkTGkK1+gEceMoEduH5/HIFtwJXrPhM44jbCV
	 4/rSGkf8pLtQgfzKy+tBfy4+wLi9CLozQFN8OYlgGmCkl7QNaeDhjMZVpv5MKY5VQgGlY
	 m1rpwuvqTUUEexRMMEQU1az+HjcT8d8E9SlDxt36thJT368cyUeOa0+N6HfwbSrs4sQrV
	 29JrswZdvjGwvlCER4ihsZJLWku85ge0w5kzdlnI2oan/4cry6K2f+Z3qLcvzui0O1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPgnEKcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4508606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPgnEKcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BC91F00A05;
	Wed, 11 Nov 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402734;
	bh=Xirn7Dc5oy647ZCJttt6/JzcrWgzS0z+CjkgHSeTgmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QPgnEKcEXcLAKi338Wys6RJD3/FYKNJ5CVrsbIAIhTXiYT33NsN2ikRZnDIQQ4svP
	 l6Y4jnx2K+CzoYu1sSMeRd61PP0Si4EjMneociGmxStIgRH5G3FAZSZkSqT+KMgdYO
	 yonn5y+0Bb34WiujcwmlpVszPm/t0E5s9d1B6erVXKjNVQZRIz78pAyI/ZguiFBSxv
	 uEQVBZ6NTQRvAijUBWfST3on2FhgEDUQL8Lj1rwUMrxwRQsNFlPC8XweeVrklaVBhe
	 HtDqEmKG2Nxi/LtZr/zzr0Tds5KMqAjl+y45p5rs2r9bausaqoTS+APpOEXacPgXhN
	 l8YP5Le1qx/Kg==
Date: Wed, 11 Nov 2026 13:12:06 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shivank Garg <shivankg@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Pedro Falcato <pfalcato@suse.de>, Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>, 
	Hrushikesh Salunke <hsalunke@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <avRnJiDLdGcbSW5d@gremlin>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
 <20261111124006.GI2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261111124006.GI2668564@noisy.programming.kicks-ass.net>

On Wed, Nov 11, 2026 at 01:40:06PM +0100, Peter Zijlstra wrote:
> FWIW one could do:
>
> 	for (int i = 0; i < nr_pages; i++) {
>
> and forgo the earlier variable declaration.

I guess we all got used to the existing patterns and I for one only
recently found out (doh) that this was legal in kernel style (because I saw
it used in KVM)...

--
Cheers, Lorenzo
