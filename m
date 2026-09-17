Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228123CAA47
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670849; cv=none; b=CiIj0D9MMnH+jJSVGT5FeyJC35BwM5WN26so8xCLfSDVhjs/GEVJgcHtPKEoOy8WN6eDOvVUwQs/B0Rlt23Rtevckcv3anPpw+rwR98azvwyTR2wfcaQwUbYakOHj5X97BsMkOlN/0K3I4rwRC1OBKce/KChLQ2pYtjSEUIlOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670849; c=relaxed/simple;
	bh=oZaznBS1eeM7Mh52jsv59nwZw4LUt5OReNo9vD6cp0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5ZXZsH1k+HzOyignJKvxwN3zxkjVva8+6+YCvw5q6i7ALctJYp0FUZa9ecZ7hiMxiv+iJSkp8Wuwg+U3/mffgDpcEIxFTNtjBvQLf7flQ+wfW7KJhU4FrJVNK8qV2VS8arEVH9UovPe2AlsIzCGBgnNfFtleuN9fYfvZjKbxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnjBVVm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnjBVVm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3651B1F00898;
	Thu, 17 Sep 2026 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670847;
	bh=LunYzoiAKjoE67t/tElgUxKy6nFW6VTmmVlpKMVNL30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JnjBVVm6wJKpRW7Esko1uFg2mN8TSoyBw+7CZ9LrCD8c0C4WuHYkREzcqn57OSWZZ
	 WHJvvQwfQRAzhzye3VC8InZgAtR/12Pn9vPFyht3xBDL4fvWfvRKlxPJazjobRh9zB
	 w8WyjIkoCeRHG7T7UoMwuhDmtU91IZd+uRVPzG29vNbflMyMZqU7Ckz+j4fW5toUnk
	 Pby9hOcpbRrMNmELLdoVSF/yIiMahQFiIkNXk97Rjs+VsPhWqRMq0VEPJyGuINjKEm
	 a2JJ9M1IQiMwlOko9yN5vXoTLi+9A5CPdt463oTFxEa58L1fA2OgWV9JQPxPK5VKff
	 OxtkoWk3/c1Yw==
Date: Thu, 17 Sep 2026 19:47:25 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org
Subject: Re: [PATCH slab/for-next-fixes] MAINTAINERS: update slab.git URL
Message-ID: <aqwz4CrVP8sKDfn5@thinkstation>
References: <20260917-maint-slab-git-v1-1-d21a5210aec9@kernel.org>
 <178965921180.1114058.11649457371183198247.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178965921180.1114058.11649457371183198247.b4-ty@b4>

On Thu, Sep 17, 2026 at 04:37:01PM +0100, Harry Yoo (Meta) wrote:
> 
> On Thu, 17 Sep 2026 16:38:37 +0200, Vlastimil Babka (SUSE) wrote:
> > The slab.git tree has been moved to a new URL as part of the mm-next
> > integration. Reflect this in MAINTAINERS as well. The old URL will stay
> > around with historical branches and tags.
> 
> Applied to mm/slab.git slab/for-next-fixes, thanks!
> 
> [1/1] MAINTAINERS: update slab.git URL
>       commit: 4c51f0b648cbf190d15d4ff60826c769f7e81df6

Haha, it took a while to figure out what `b4 -sl shazam` and `b4 ty -i`
actually do...

> https://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git/commit/?id=4c51f0b648cbf190d15d4ff60826c769f7e81df6

/me forgets and learns what `b4 trailers -u` does, once again

Now it has R-b from David Hildenbrand :-)
https://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git/commit/?id=f4feefcf46b9a63e4ab096c3f2cb260ef8e3902a

Whoa, looks like I didn't mess up something.
Thank you folks!

-- 
Cheers,
Harry / Hyeonggon
