Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362CC3ACA75
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813116; cv=none; b=N14teYoy+7TCnOvX9wdomAwdW+uDleRfmTT4qc38KG60D5K61JalACxK+NWzRwQO+pV/2X46/+NcJpWxBKt5BMeQn3Ty+77ismZB1kxN8vwScnU2xRxtldRkSDY9zBZkrDFcNAOMnpkypPV+SXZQhyxNrh22gSDwhlsMdoPKT+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813116; c=relaxed/simple;
	bh=dFPf9N+HqWZ/4XEX8ZUkux5HGcllbJMP2zebWj+Adys=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PfT0RDzgB/fPEM55eGhwa7gwoV8ZbfFnoXBPe9sfnUN6uBtqa9MpNlR7QvG/mUKajE9ZnQXlzSuQRfFagdolrAUyZ1knhsLA243bRViV4jgyeouZcnt4eVQ6NXWkIQt7FoMNxUjIu2Y8hyUXMESx+8Ermu5C0WNF4B4L3jf+Ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T8H/Qs/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T8H/Qs/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927BB1F000FF;
	Sat, 19 Sep 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789813114;
	bh=dFPf9N+HqWZ/4XEX8ZUkux5HGcllbJMP2zebWj+Adys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T8H/Qs/uQISrJVGibVwy3V2yEE1199PwMjke2RtBbxtv/IIxBZ2CQ72Pf6pp483g4
	 HYUftZe/gcEdkMrSJj471w6zF5HETModrWgQjxXqKgefvnejmox3ER3VYfSYf59uw/
	 d3Fs+eAqR5USipzu17vhxfM41fS/uZ8utfuKL868=
Date: Sat, 19 Sep 2026 03:18:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Message-Id: <20260919031834.d0b38fc1b6637445cd08f419@linux-foundation.org>
In-Reply-To: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
References: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 12:04:36 +0200 "David Hildenbrand (arm)" <david@kernel.org> wrote:

> I added a best-guess fixes tag. Given that this has been around for a
> while ... and it's nommu, I think this is fine just going into the next
> merge window. In that case, I will pick this up myself. If we want this
> as a hotfix, Andrew please pick it up.

go for it
