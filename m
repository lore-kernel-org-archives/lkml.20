Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447AA3EEAD0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521838; cv=none; b=oyMifSnvTSsdGo8zPIc3vcJ2eBuWMCeDDT4WCtqM4rT7SWiT+SWBvhSKBd3X2f6bIR9lcSGiGBLpokIv5tHpvmdX6ETf41uuV/k4W0xDqFnGVvruunKjTQ5Er85s5+TpWSoZqtzw2Ve/ixuAafq9wl9wccPX/DlxiwImpP30BaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521838; c=relaxed/simple;
	bh=Fa5dbv0spbKSAtPxdw5J3md6VmMneJMVMqrLHQatWAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZgZ1Mv7aRxbNMHcvDhuh6ebuVlqtg5eu2ypeRMFN11lsVEx4507Kgt4qgJs5KvuRlnC5lWg7pdyDGEvq5DC1Sj0aiteDICcEVkN6i3ophZvOZDgmVdQ5L6FfLxMDyghY4Ll+PHH8gqc9zSno98HkouKvLpd+UFXZvSPah8Cp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWq7GcWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWq7GcWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12061F00A3D;
	Fri,  4 Sep 2026 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521836;
	bh=M35ChtJ6LeX4aN5jhdAT3A6U190niCHvw/nKaSgFqhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWq7GcWu3wYuI1i2MlTQzlbxBnc4tNFM/6s4h7dMYSE6I0N2cGP/fp7HPiIHQxh/H
	 vtVqJiRPDoR7if5qb8DFO534owlOw9gQXNo5zmU2dJ8HYRmZnhwEa58iPMZXzv9UE+
	 7eynM2QcakmyT8b76x4X1eZsQvet590ZDD1xjGxuiRcyLa7IJ3jC25g+rj/KMSLKYU
	 BgYDlNc9JiKrSR+XsIyxQfuLKilVh/ZuYOlobrkuieEesA2y5C1x3up434CncgWH2t
	 +zO+0dHkCCjJLpn4iIzDwNficQBNigwJK6akSlRwWqr+zvZhIjPcQ06WCBHOdzbcfv
	 kp+o+XibdDIww==
Date: Fri, 4 Sep 2026 12:37:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 5/5] tools/testing: fix typo "mergable" in comment
Message-ID: <apqtOmwcvDaA8cp9@gremlin>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
 <20260904104854.25272-6-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904104854.25272-6-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:18:50PM +0530, Hemanth Selam wrote:
> Correct "mergable" to "mergeable", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

This one I'd drop, as a series of mine I'm going to send soon removes it from
the kernel altogether, and I don't want conflicts on a typo fix :)

Thanks!

> ---
>  tools/testing/vma/include/dup.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
> index 4c58487b764e..302a6774fca5 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -353,7 +353,7 @@ enum {
>  #define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
>
>  /*
> - * Special vmas that are non-mergable, non-mlock()able.
> + * Special vmas that are non-mergeable, non-mlock()able.
>   */
>  #define VM_SPECIAL (VM_IO | VM_DONTEXPAND | VM_PFNMAP | VM_MIXEDMAP)
>
> --
> 2.48.1
>

--
Cheers, Lorenzo
