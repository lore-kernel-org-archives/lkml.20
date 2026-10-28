Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162006;
	b=GaErOvyraceL2I94p0YCo8ygDlK9ciP8/N56jG+h2oIgVjyFvHcHhhin9lR9FbFoUFyC
	 1BaKl9isRvvOH9JhYMde4hMmb9WO0M4WreYlgmvBBg6fSGaRlDczPxI3cL4/p/SFZvJBm
	 abytv2WevYfcn6tKlzJRPuQB0ceOh/I+/dluYobp6CPSRoNyG4sFcOv0JHLJGnq6Er7MR
	 Jz4GJkbhXTGl7l5dW4+WGMOC1M50cF6J96HkORYIS2npkflHIaAs5ziH0Vr6cy0r1DExM
	 HPyF8P2Yzmr64fJEnHo9VX2fHRzA8kDVULl+S+8JeyBMEeRqcM5Tz7n/dcaBF7AXuyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KQliSYu5IO0Ztf2KMR9ZclDlsE5PuZwsA7H/3S4ytlk=;
	b=uvyel1SJviKO+hKqAXQXrDc0HtwJzPwE+PwVp4+tLRGfguAhqJCFgqj6Y+UOGN3Mpw/3
	 D/b/bJNS0QIeztLL1SbrwH1xGPrN6Yqk/wgEMrt+K0Fc1TZpSb4LSdjwtE8t3lz1OJM1D
	 H8QcTK66XwywRxrc1Hv857nvjZ9WbIFlg4aCFqoczgUzhlBOUkUxc4cHq3hQbDVnqn7Py
	 NXcQf/uvhTXQfDunA/b/CypTKiJ613eyqUQw7v3DnOUgOflpfbrXRxgBxpm6ELKuVcsMz
	 thMOh9M/gF7JlDXVlOV9v1+RSSZf5pHahucvRRYVCKcUtYuNIHLAlZKHcb8RTs4Bzhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vNZJ1Y9v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A45606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vNZJ1Y9v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B331F031E1;
	Wed, 28 Oct 2026 04:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793162005;
	bh=KQliSYu5IO0Ztf2KMR9ZclDlsE5PuZwsA7H/3S4ytlk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=vNZJ1Y9vgwzm5vi2q/Ro/QE7r6JtOMQI/X+zg6SZf41Yqbhh5Dmq397ZRxr+++zBw
	 YAzgHNsBD8KWgp9VqpRxOFCiAqE0jn7QJCo4yAQZfuHNs2lRzHtXBX2f5fGuJCLiaw
	 AbvahUgZ+Ds6OFZN1RNimOCoo+eYNPJ0Y4MXjObU=
Date: Tue, 27 Oct 2026 21:33:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wang Guangke <gkwang@linx-info.com>
Cc: rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix typo in comment
Message-Id: <20261027213325.d28fb3a913c68a982b5a6591@linux-foundation.org>
In-Reply-To: <20261028040625.204-1-gkwang@linx-info.com>
References: <20261028040625.204-1-gkwang@linx-info.com>
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

On Wed, 28 Oct 2026 12:06:25 +0800 Wang Guangke <gkwang@linx-info.com> wrote:

> Correct "pages frames" to "page frames".
> Only touches comments,no code changes.
> 
> Signed-off-by: Wang Guangke <gkwang@linx-info.com>
> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1533aebafb68..9d233b6af7ab 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1179,7 +1179,7 @@ static unsigned long __init __absent_pages_in_range(int nid,
>   * @start_pfn: The start PFN to start searching for holes
>   * @end_pfn: The end PFN to stop searching for holes
>   *
> - * Return: the number of pages frames in memory holes within a range.
> + * Return: the number of page frames in memory holes within a range.
>   */
>  unsigned long __init absent_pages_in_range(unsigned long start_pfn,
>  							unsigned long end_pfn)

Sorry, but a one-line comment typo fix just isn't worth a kernel commit.

A more substantial file-wide sweep might receive more consideration.  I
asked LLM to do that and came up with the below.

But even a fix for these wouldn't be smiled upon at this time.  We're
all swamped and stressed out over a maelstrom of bug reports and fixes.


I found these comment typos in mm/mm_init.c, against mm-unstable
4685a28187f4:

  55: "then end" -> "the end"
  377: "before borrow the nodemask" -> "before borrowing the nodemask"
  1090: "smaller that" -> "smaller than"
  1092-1093: "in the lack of an altmap" ->
             "in the absence of an altmap"
  1217: "sized independent of architecture" ->
        "sized independently of architecture"
  1223: "in order of monotonic increases memory addresses" ->
        "in order of monotonically increasing memory addresses"
  1279: "pages frames" -> "page frames"
  1524: "been setup" -> "been set up"
  1631: "0 ," -> "0,"
  1651: "`struct *page`,so" -> "`struct page` objects, so"
  1921-1925: missing spaces after the leading '*'
  1957: "pfn's" -> "PFNs"

Two comments also name the wrong thing:

  1481: "multiple of pageblock_order" should be
        "multiple of pageblock_nr_pages", matching the rounding below.
  1834: "arch_max_dma32_pfn has no pages" should be
        "ZONE_DMA32 has no pages".

