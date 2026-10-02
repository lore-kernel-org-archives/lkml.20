Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638323EAAA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903788; cv=none; b=l34xw20kQaqXk6aFvy0R7TJygtXgD4zTIuSrlv7Ru6iZMn1nVfGKCGkk4ygicA1r9OJyGQXsYoaGmjaooeS6ZccR+Dm4lPCVNoSrw7G5KcnE9SUbCKrsrMsE51h1gFyGdOpMiovHW6hjHs4njbVCIdfsSH+ivIWLNsoPT9o1NZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903788; c=relaxed/simple;
	bh=Mz41Q/rIBFPS875Kup9V6jLx9wwD23kI5al0V3q8Eko=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XjD+tTFpCGrsOVRyxp/yla3M8dEsPQdahTkyENg60Ej2y4sjUsXTMcuuRXA4lMZNbkC8VOWAIeunx4IXFLNqz6pwaQIWZtLnBe4AwFcZaipY5PklTbYrUSaVOWtRrLuqb1XVgK6PBohTUGultcIixn0V1SRtZ/eyec3JJyu1DGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bIZVV1f0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bIZVV1f0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB7A1F00893;
	Fri,  2 Oct 2026 01:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790903787;
	bh=hdhaloUS4Y2BCpMzkfsa7Cgwj3Yupg47+wKbGB4PVH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bIZVV1f0mbriI/AK7Bvc3wxcbax8H3m6HVkH5EcbvxmxPxumrw7+L/z5ovbjGarm6
	 YmdqUfzXzvbLfdGTz8flSmA3QGCJ9GMC5bXWBhXSSQ1wVg8pVS7jhZxhSsMBcyJoE4
	 eUM+XsUMv4ExHdv9Hwbhekcc6DAxuDaq6yjZpTDY=
Date: Thu, 1 Oct 2026 18:16:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org, Christoph Hellwig
 <hch@lst.de>, Chris Li <chrisl@kernel.org>, Kairui Song
 <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: submit the last readahead batch before
 unplugging
Message-Id: <20261001181626.b4aa4476f1b3649fd3e6d54e@linux-foundation.org>
In-Reply-To: <20261001095238.2417205-1-joshua.hahnjy@gmail.com>
References: <20261001085730.2029773-1-alex@ghiti.fr>
	<20261001095238.2417205-1-joshua.hahnjy@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Oct 2026 02:52:33 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> On Thu,  1 Oct 2026 10:57:12 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:
> 
> > Since block swap I/O is batched in struct swap_iocb, swap_add_folio()
> > only appends a folio to the pending batch when its slot directly follows
> > the previous one, and submits the pending batch otherwise. Batches
> > submitted inside the readahead loop go through the plug, where the block
> > layer can still merge them, but the final batch is submitted after
> > blk_finish_plug() and always becomes a separate request.
> > 
> > So submit the final batch before finishing the plug.
> 
> Hi Alex,
> 
> I read through the code and this looks very reasonable to me.
> 
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Thanks.

> > Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> 
> My only question is whether we need the fixes tag, it seems like
> dda8fb68b590 is still in mm-stable and not merged to linus yet.
> 
> Andrew, what do we usually do in these cases? I am wondering if it will
> just become folded into the original commit or if this should still be
> standalone.

dda8fb68b590 was added to 7.3.rc1 during the most recent merge window.

So the Fixes: is appropriate - if someone chooses to merge dda8fb68b590
into their downstream kernel we're telling them "hey, you need this one
as well".

