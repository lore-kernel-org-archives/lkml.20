Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7943115A2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462290; cv=none; b=rpubUAOe15P5MYI3CrYuQvh9ERr6Y/tFNpNU/XZ5wjVOdXCRf7eUNCWHszvlzJvVqBglwQ5oQBwGncEsKpozEpGHvcmhL1LMKGgq6/BBw8ox66PuRSVj/9h1MnaEFdSwsP+cmpwTAqLi1N1t9yJWBFWMgNVyzEUCOMsd21lbNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462290; c=relaxed/simple;
	bh=X73a9C9LqxrUt4+hDPabb+my5iO7uQbO30ibHG86Jks=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QRxQfzPYbvjmBZh6w3i85ss2cxSYpzNCQafpq040pIq+Dj3LwITR9nnrszoTQkkWlmSqARcbmVbgstpYSnSy0zajG7c8ILhHXf1LS12K79ccicREEy0PSAypuuTkTZM3Yws1RKIRXOv13UfTl0czYizEOkmcQ8N2SwMblL4TGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K51HL0i0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K51HL0i0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA1C1F000FF;
	Sat, 26 Sep 2026 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790462288;
	bh=0bFxyzzyXqj3aj03Ubo6Jx6MSJUth26bSWFFY7KZup0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K51HL0i043qp5GObk1DG54ddTyC//ZM9QVrL+Qtz7CUaxxCQO0dgY4vT6dtLv5153
	 u+n4V2T24bfkI+yIcmrCc0Bst7G5QYiP/+lROESaPbwrBlkNkYPQumUgOwWCn3xfdO
	 Cbe4aI8QB0Cw+2O100cCoJY1xo/gaCJmoUERKEQk=
Date: Sat, 26 Sep 2026 15:38:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Rientjes <rientjes@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [patch v4] mm: vmstat_kunit: add synthetic benchmark for vm
 stats
Message-Id: <20260926153807.ec8a4ea8cb362e4f583cc9b4@linux-foundation.org>
In-Reply-To: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
References: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 13:39:52 -0700 (PDT) David Rientjes <rientjes@google.com> wrote:

> From: Christoph Lameter <cl@gentwo.org>
> 
> Add a synthetic benchmark that can be used to measure performance of VM
> statistics.  This is used to analyze any improvements or regressions in
> functions that are frequently used in hot code paths.
> 
> The test is run by KUnit or doing modprobe vmstat_kunit directly.
> 
> Sample output:
>  KTAP version 1
>  1..1
>  KTAP version 1
>  # Subtest: vmstat
>  # module: vmstat_kunit
>       1..3
>       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
>       ok 1 vmstat_test_inc_dec_zone_page_state
>       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
>       ok 2 vmstat_test_interleaved_zone_page_state
>       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
>       ok 3 vmstat_test_count_vm_event
>  # vmstat: pass:3 fail:0 skip:0 total:3
>  # Totals: pass:3 fail:0 skip:0 total:3
>  ok 1 vmstat

This hasn't generated a lot of interest.

Can you better explain the value?  How do you anticipate that people
use this?  What value does it offer?  Sell it to us!

People could use it across kernel versions to detect performance
regressions/improvements.  "kernel test robot" appears to already be
set up to track this (eg,
https://lore.kernel.org/202609230824.7a9189aa-lkp@intel.com).  Do you
anticipate that this module will be wired into such projects?

Other than that, it seems it's mainly a developer-centric thing?  An
individual developer could use it to verify that a proposed vmstat
change doesn't slow things down, or that it does speed things up, if
that was the intent.

Will google use this internally, or will they do so?  If so, how?

