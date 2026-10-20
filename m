Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515686;
	b=DdMVPCqFDhMp+Q6nabxjZz9Op4uvLdtIg3ELFoS6+q3hVHypICc8W8/1gi/lrNf7e1bC
	 sAe4+G/vaxhvtRNFXtkkcgn8SGQn/OO9iDmjH0PZZiJs+DXSLyGX2alJm9nwhBxUNqZa6
	 I4YyAoQO4iGLS8Ia0Tdlt4l6gmTgWjvZJM+Mfu1ym32ILcP7nM/p4QljkRSXb4p3Sqzy9
	 2p5Mw4OSLY6Q5RmF4yRyQ/fu5AupUS4oWkH38DvNFI1E5OJlHc3S6FI/fJwGH6Eat31Hk
	 8EP5CfS9sWTxI8d/H+rK7O2ljKNARfwMSnVIWzu8z85DsYmD/ASzg8103+oZ16KxmEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515686;
	h=Received:Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=E2pWFUbCjM/35KtL6Y1tWseFuCgMfVWj0bs3fZ3y0ck=;
	b=iwuLK27FqTa7mPnF3+x8ftkNt+A3R47DQp0mjXgBcPp5zDLmIFFl4RmO44sD0jgw/gXP
	 J4gBc07cLJUjxepSr8AZlXgHBvgHcM8b4b6kUt2DdUN5AvNeoE3k9IkBLJ2Lh0lDabLqy
	 /Bn2E3iOjw1O4+EZZiac2Y7CmgPivLFiS11AuRe5uUR8EcIcJrO4YiXpWoyBha2t3kaCQ
	 1jiSrIml8HR1Ybx16T5eaudcjEYH8n9TbbVJV52Cx5WQKAjkfk59P3HEEN7CBMsT94QmP
	 9X96enWutHjDFOPN/pwIIbCANfMp3gc/1GF3o305u74QKQzBgz+ngXLLlrX57BJJOzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631AD606A31C;
	Tue, 20 Oct 2026 17:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11421F000C9;
	Tue, 20 Oct 2026 17:01:25 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:00:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Tal Zussman <tz2294@columbia.edu>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Message-Id: <20261020100055.3e388e03fcd804f0cbde04f5@linux-foundation.org>
In-Reply-To: <553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
References: <atdeJ-91RQrqLke6@sirena.co.uk>
	<553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
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

On Tue, 20 Oct 2026 06:45:16 -0600 Jens Axboe <axboe@kernel.dk> wrote:

> On 10/20/26 6:27 AM, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the block tree got a conflict in:
> > 
> >   block/bio.c
> > 
> > between commit:
> > 
> >   d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned bio")
> > 
> > from the mm tree and commit:
> > 
> >   73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages()")
> > 
> > from the block tree.
> 
> I suspected as much when I saw Andrew pick it up. Andrew, perhaps
> let's queue it where it belongs?

I was hoping to get some review feedback before sending it over
formally.

I'll send it now.
