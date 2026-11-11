Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389409;
	b=IBKlW2rOfDbmi0xZg/HpxVKW/LAPjknUxzybJYK3HpmjlIO22STG6GhOgHWaDK7g9mYh
	 FXvxVTUS8ZUG+1IW51WLjDqioSmYrwP1I35Jvd65ktRN9I4sduuIqiPbJheIr2z/1JbnF
	 1cEHsuPLLmF/jrr8DTFSStC4BfuWt5jihVoQy97WnYWl2EK8g4ZDrtCajJGkWfcRhKBVB
	 ws3H15R+2mevfJ6HFz7ysNKOvtG82yDrzDmSj51u+fHqXDvTDzbogsQdXG49xJZFSEZl+
	 8G6+HRzojrySBWDFLVHOtiIaDSVRgrXRH1Xsd7ZEL3s7IUbFy79oYxXnEgBzWisZ4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389409;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ZIHd2FwuKZiOsOtH658bSsqUxwrIHe1owCktrQN4DEE=;
	b=dzmbT74d8gdesGmvClczfuA1h9LBc71HNUSPGnY+XgKasUBk7QAd8KRv7LvH/CvYH6K6
	 1U0VlSCSnDF+FQeXRlkRwRHkaMZ6UVIMGJS+hxgblqrVgUk+CoKLw1hhoDweJ8O/uozMR
	 n/yXZjx+wH6Ra/cZnXtUheh75VCyVr4lQvY4Rvq0n6HLM7WzUijNCBEV2IIW+V8ElppsM
	 BUDCsJVgCekBd3cHaUoFBfWX8ch4hUEnuOxGfM+Zz98WGFymzM1Mt5Oh8ZbdQvBOxc82l
	 muVF2F7TpLjH8ICOE40cbfatjq1gxGsGvpGocs/doaMDaE91rqBuzCv/YkzaK/07PYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbvGLtjy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C570606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbvGLtjy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1181F00A05;
	Wed, 11 Nov 2026 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389408;
	bh=ZIHd2FwuKZiOsOtH658bSsqUxwrIHe1owCktrQN4DEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VbvGLtjyletvBxjxb6C+b2ZHntXPh6wJa1tqHk8TO88HL7iY4bKi21AjZgy/mxoga
	 4jQrmZlybZLvvzhjqjjO0XyBx0//MstyoBgW+T396BS8ozGxQsyVzND1NOJqUXEdwO
	 1/g8rVUEbUAZYi5voQNgUnWjG6pZV4bzntYGTOiTmKFTsDmsb4jZ3fg5R92+eIQmq+
	 LswmVnxPi8iBtdejNuwQHf0dhY8AxLs7C84E6D1V6wTySn2h+8iT/BRn1qvHn+rXOG
	 ZU+Kx12csTyI+ceLeT2teH4Klohfa8IbVB1ClfFzHm/jey7pjfDy7QIhA8THx+CC91
	 68HtlzzRBjFaA==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
 Pedro Falcato <pfalcato@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
 Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>, 
 Hrushikesh Salunke <hsalunke@amd.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Shivank Garg <shivankg@amd.com>
Cc: x86@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-Id: <179438940319.7436.18300143514855352851.b4-ty@b4>
Date: Wed, 11 Nov 2026 10:30:03 +0100
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

On Mon, 09 Nov 2026 19:15:51 +0000, Shivank Garg wrote:
> clear_contig_highpages() clears the whole range at once under
> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
> pages at a time, with a cond_resched() in between. The batch is 32MB if
> the architecture defines clear_pages(), and one page otherwise.
> 
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes"), architectures that support lazy preemption only offer the
> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
> one of them, and it is the only architecture that defines
> clear_pages(). So the 32MB batch is never used: whenever
> clear_contig_highpages() runs under a cooperative model, the batch is
> one page.
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

[1/1] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
      https://git.kernel.org/mm/core/c/6df321a9

-- 
Cheers,

David

