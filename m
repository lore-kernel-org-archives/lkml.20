Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EEC480DDB;
	Mon,  5 Oct 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206045; cv=none; b=tB2qMMNmmpTeye3+vI9gnaLLSS9sJ5zm4NIjwI0PhDpPMP/0GVu01fhvuCj6lZz0qq6hDy4fAW8wSlwYV7tQr8cuZhW4J8nxfjQxXdG454CmoFn6YIA9VBYFvsB8sZP1yXtc3s2R6QqS9G44xgQK0GTqOIHzPHnMjgp5BBT5BNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206045; c=relaxed/simple;
	bh=WrXLcdf03a2YjyH6cRgHc8eKTJj1s7s0p638tHBnO/Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z+GkLrBOmXi2eQ6kMYBtnVBtpkMAFDojKcGyA60qmh9hT3Kpz9WZhPmXL/lDYN7Yka7S7E1sL8IbJk4bA6x32EdK5y1trL4vV8Dd75NTBu/Y1VxCaOIs+GHlKj8Rmuc0IyiXio/k7mPjTOPYgwithZuvehC4pWhfbvLqPkHnI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cDU+31SQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cDU+31SQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EA51F000FF;
	Mon,  5 Oct 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791206044;
	bh=SOwk2gRR2wubV/8ffEd72Oz/SMOuKQpB0ZwJVP46qYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cDU+31SQVYNX5xT89G2pFWqY/WaMPt30y5TA0Qci6WFBk9SWnTQVIbqp1fjX3bWto
	 XMBBH0qkVC/6BHwcOJBOfP5kHNcF1vL+iZXnhLTddIXL6/PGbpp5MLf0TZJ0QFgCup
	 4VRscTnLdf059OpDGck071C+oTsGAOCEYLlDvNvY=
Date: Mon, 5 Oct 2026 06:14:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Baoquan He <hebaoquan@kylinos.cn>, David
 Hildenbrand <david@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the sound tree with the mm tree
Message-Id: <20261005061403.750dc014ce53e441a3ee6271@linux-foundation.org>
In-Reply-To: <asOIPgOu7MHRPLWU@sirena.co.uk>
References: <asOIPgOu7MHRPLWU@sirena.co.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 13:21:34 +0200 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the sound tree got a conflict in:
> 
>   sound/mips/snd-n64.c
> 
> between commit:
> 
>   0d62c52af5499 ("ALSA: n64: don't use GFP_DMA when calling dma_alloc_coherent()")
> 
> from the mm tree and commit:
> 
>   e81f85fd3ca66 ("ALSA: mips: n64: Handle card removal properly")
> 
> from the sound tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

Easy fix: move mm's little one-liner into the alsa tree.

Takashi, please can you add this?

I'll drop the mm.git copy now.


From: Baoquan He <hebaoquan@kylinos.cn>
Subject: ALSA: n64: don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:26 +0800

dma_alloc_coherent() allocates the DMA buffer with the device's addressing
limitation in mind; the DMA core picks the zone from the device's coherent
DMA mask and ignores GFP_DMA passed by the caller.  Remove the redundant
GFP_DMA flag.

Link: https://lore.kernel.org/20260903111836.1777265-4-hebaoquan@kylinos.cn
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Harry Yoo <harry@kernel.org>
---

 sound/mips/snd-n64.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/mips/snd-n64.c~alsa-n64-dont-use-gfp_dma-when-calling-dma_alloc_coherent
+++ a/sound/mips/snd-n64.c
@@ -298,7 +298,7 @@ static int __init n64audio_probe(struct
 	priv->card = card;
 
 	priv->ring_base = dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring_base_dma,
-					     GFP_DMA|GFP_KERNEL);
+					     GFP_KERNEL);
 	if (!priv->ring_base) {
 		err = -ENOMEM;
 		goto fail_card;
_

