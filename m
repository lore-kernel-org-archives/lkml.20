Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521788;
	b=PiqflYacQk9i0Ryz+gZ6MFyv17iHXxaf9eBgy/YNoVm9ZGisiEgSHTdB4sj0S2IKLExm
	 X2/0a+s8dMfS7XJc2l33ylcUTbuJnEFJ7OuYHWyXf68g7prLfknuH9GMgZXWqGDE7KGqx
	 elgcDdvfzBfmDtQdL2wbyMTJ44pjYCEy/2+XM2mWM4iunARY7V5+qWTxS4DkjHDTyufEj
	 C+RhTpHx3XSvJFg8tHFZyE92bcgBkNXhavxoVnuoAiSZv8VM16DRjJUYUL6nHv8a4RfuW
	 p3HZYTU8cYxe6lPwaFhp5ECagsbvl7Y+aXWnaqaHupGA585bpFc+8ZkIbR7oFp5ed9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521788;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lehVgQ0A0MkjnYX71YZAiLrVQVrZjPDtWT7Uym8tVaI=;
	b=MsCMvyOK3SJdkz7cONiaKwRd720LKQL7APx2+BkgJ13TRhdfOaOhe/ZEGVJd7Fb0m1xK
	 qI4qzUlBKH1RJOJPKuAEO45YcQoOzHMj6ypjjRigM90FAeAEbtssLfe1K8HATRe1nLd3U
	 L4SeyyA/Ew7/0FeemRLQk76p5HI30btiv6WHvkb4kcWwGtM7c6ZnDMJAjZt7ot2VxphpW
	 wXV8q3Ee2HrNpev4KYFTT73xsKO1cDOI8iKs3yS1SkfIIqzXopw8ucnA2cLyKVZNzaZ9b
	 7Qu6xmQuVK9xiE9YnV8c052Wm8n3vJ0lF3LsMPMnwSdck5pbjFJ9S+kfLfDzkyXql6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DSc3LoCw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD2B606A319;
	Tue, 20 Oct 2026 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DSc3LoCw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65061F000C9;
	Tue, 20 Oct 2026 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792521787;
	bh=lehVgQ0A0MkjnYX71YZAiLrVQVrZjPDtWT7Uym8tVaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DSc3LoCwT738b6gd647I3znQc8CY5HhT7joFJiy66q3pbS0QTt442/uk9VoAmGq5P
	 rXD3ybdTh6Z/VLxCJL7yJ9xKgcyu68zJQrL01l9KxeuAup2ryCajl6hjwT8QdCJj8/
	 /MiLvpHW5Plj1ROnZgoDrTddR9u2NUESQDwM7qSo=
Date: Tue, 20 Oct 2026 11:43:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Tal Zussman <tz2294@columbia.edu>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Message-Id: <20261020114306.7a7362dc17e2bf9cdad03373@linux-foundation.org>
In-Reply-To: <af63d378-d6d2-4fe4-bc2d-15f894b60624@kernel.dk>
References: <atdeJ-91RQrqLke6@sirena.co.uk>
	<553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
	<20261020100055.3e388e03fcd804f0cbde04f5@linux-foundation.org>
	<af63d378-d6d2-4fe4-bc2d-15f894b60624@kernel.dk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 11:13:23 -0600 Jens Axboe <axboe@kernel.dk> wrote:

> On 10/20/26 11:00 AM, Andrew Morton wrote:
> > On Tue, 20 Oct 2026 06:45:16 -0600 Jens Axboe <axboe@kernel.dk> wrote:
> > 
> >> On 10/20/26 6:27 AM, Mark Brown wrote:
> >>> Hi all,
> >>>
> >>> Today's linux-next merge of the block tree got a conflict in:
> >>>
> >>>   block/bio.c
> >>>
> >>> between commit:
> >>>
> >>>   d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned bio")
> >>>
> >>> from the mm tree and commit:
> >>>
> >>>   73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages()")
> >>>
> >>> from the block tree.
> >>
> >> I suspected as much when I saw Andrew pick it up. Andrew, perhaps
> >> let's queue it where it belongs?
> > 
> > I was hoping to get some review feedback before sending it over
> > formally.
> > 
> > I'll send it now.
> 
> Applied - can you double check? Flow is a bit different in there
> compared to the one you patched against, entirely hand applied.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/commit/?h=for-7.4/block&id=40d070cbb1906896d6fd65c39722d2411830ed9f

Integration lgtm, thanks.


The error path leaves bio->bi_iter.bi_size still reflecting the bytes
extracted before the failure which is untidy, but no caller appears to
use it.


I'll also send over Daehyeon's "iov_iter: validate extracted segment
for bvec alignment", v2.

He showed that we can allow misaligned direct I/O to be accepted when
it should have failed with -EINVAL.  Daehyeon reproduced the problem
and showed misaligned bvecs reaching a bio-based driver.  We shouldn't
rely on drivers to enforce an alignment requirement which should have
been checked earlier.
