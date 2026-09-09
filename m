Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7C22A7F6;
	Wed,  9 Sep 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788918319; cv=none; b=ArTWI978HAx6SnJdiOUdpHcdtnZJwwBptOjjhjAvHI++NG7EvszD1K0Rwr5d2nSlOT57AMZ7MCd/+GqYYgPolfyYRwE+uXEHGGYQURmd84uYTjQmYQwTpCAv9nVrFmQ+9HVhKylKIL4mfXUxM2coPyE/ShkffkVdg0Hk3RmwETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788918319; c=relaxed/simple;
	bh=c+tIaC+OBf1NPJ9LC30yCb72Nf/ALJorCqnmG38aHUg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IrDlc6GJThjOA2sM9p3zptyTirEfqE+qGG2kid4kCFCyBKyQ7PcqpQSCEnU6BHTJixs2oUA+Y80DvGqYZk7soPUOdCF77VSrKlUhBcAmFKMn1D8NOCxnpxLCcf85K6CnTbIbC25XmOjM7R9PsaOgbleXCFZ4m+h+gzza+OMq+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IGTljDXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IGTljDXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D71F00A3A;
	Wed,  9 Sep 2026 01:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788918317;
	bh=tp3dXhAy5jR6y6z8B8hfuKasJOA/kRC+FrcfbplZSPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IGTljDXwgWO0FriKqdwJFtPwF4QskmkLh1pQ2+3IPqHdcjNgnrUbTK/OI7mrSSwQQ
	 hx/vqsHOSMfoCqwnOJMQqb12JTW/Pczsmtdwzg/3yJc8S0UKEzUUjhUAx6q2c1x6JF
	 wQqqLdHznKYFGH7WFtTIn66xXVi5PzmW0nR/aEJ0=
Date: Tue, 8 Sep 2026 18:45:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, Muchun Song
 <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v2 00/11] mm: Switch device DAX to section-based vmemmap
 optimization
Message-Id: <20260908184516.c026438445ff3db78ee120fa@linux-foundation.org>
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Sep 2026 11:03:24 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> This series is split out from the earlier, larger series "mm: Generalize
> HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
> vmemmap optimization across HugeTLB and device DAX, this subset addresses
> a single, self-contained step: switching device DAX to the section-based
> sparse-vmemmap optimization infrastructure introduced for HugeTLB.
> 
> ...
> 
> This is intended to be the third smaller step toward the broader HVO
> generalization. The wider HVO consolidation between HugeTLB and device
> DAX is left for follow-up series.

Thanks both, I'll add it to mm.git's mm-new branch.
