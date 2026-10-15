Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA413B71DA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081884; cv=none; b=kOPHlILCzyL7Y8ou8+BM676o1WNj8xXH8XDdjavPVUufoHbmX6+14nuUEVDh8xUujMQUE71lfKjiQE/1A+GTMbqmqmZYkviKmJQBl8py2urPxSiSlMeTVgj+jLc4FbZudDlv9I1Tgd6dDDspBv0z63HJUUwKhkmZ3l9ahMezMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081884; c=relaxed/simple;
	bh=hcCB1ihwmN39krxYdocKI1XOOuE8kEo6JS87GbA1n7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuYCExmbq7ts5AK938arnpbcZTOFdgPNuaVpdF2NypNEc0N9pt6AfTvVKbndiW98TNfYg1c+Lmth9qWdPsDOieKStgb1QxUgWyXCQd8tNS1Amyt5BDhfcW4I1WNeWLmicYeZtCH5cHpzeUwX93Di4wVFfGjsmSyu2LGqCkE48a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFPC/KMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFPC/KMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047B21F000C4;
	Thu, 15 Oct 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081873;
	bh=U2FTBC55kHlfmFsiLIJXZR0ZuKP9p6FEbsh8MFHa/Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZFPC/KMzqnFDT+QKGQ+FgK9734+xFyYL0ffRIrpYpj6dTn6pK0dYlgTzh+mtRfZJk
	 8QiotR2D5nfLbgGkEMe2luxsjzEvPXzG57QErp2r04JhlGxF3Xf55WYVbqCI0J6wb2
	 fU44SFZykcwhi9tTyJ2BjtHYRt5qdtQJvlwlk4604zQHkaFVr3jrbKA5/K0LADHL7S
	 xYzKZaKYC5aN+q+Yj3UxpsD+Z4vZjjgC6RGrq72kVogO6TBnA8L9ESOy8YDtL4lEFZ
	 MM9ppYBIhuOhtLH0qRCu4SRpV8L042BU3XGyvJqusOE5jAqnRh5IbD34ly6dYrIuIE
	 Vht0gLJm4G85Q==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@meta.com,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shengming Hu <hu.shengming@zte.com.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: initialize the free pointer of the bootstrap kmem_cache_node
Date: Thu, 15 Oct 2026 17:31:08 +0100
Message-ID: <179208176814.13496.3999707949555956880.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010203906.93156-1-kmehltretter@gmail.com>
References: <20261010203906.93156-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 10 Oct 2026 22:39:06 +0200, Karl Mehltretter wrote:
> With slub_debug=FZPU, validating kmem_cache_node reports
> 
>   BUG kmem_cache_node (Not tainted): Freepointer corrupt
>   Object 0xffff888000140040 @offset=64 fp=0x5a5a5a5a5a5a5a5a
> 
> and taints the kernel. Poisoning places the bootstrap object's free
> pointer outside the object, where check_object() checks it even while
> allocated.
> 
> [...]

Applied to mm/slab.git slab/for-next, thanks!

[1/1] mm/slub: initialize the free pointer of the bootstrap kmem_cache_node
      commit: 10a5ff7555ae3042393d8a662a25dca9b38ea415

Note: I did not add Cc: stable because it only affects slab_debug users
and requires writing to 'validate' field, which requires the root.

-- 
Cheers,
Harry / Hyeonggon

