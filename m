Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428230;
	b=clOC6P53P2c4kyjZ87NkTC8J/9YwRnUVYHe3qBUsL1jt1FHFRf/SkrnktxXyfqMdzn7z
	 Mp7YfVxVcl108egK7bZywMaNmqSkn/JnEowE1XOJD+4ERyeRFdf1wQy3+qUh4n9b2wGvl
	 WTxmLxwRq0RU7TjBpbaKlKPIyAhzXJQjcs/W02gqP5m7f3iYwTA9QNA+RldoEGcmfIctF
	 +R0nOktrZt66o2OWKhFUY5tfc77efPaNlke67MIv2A+C+Nha4UD+OWBzo+RJbVbp7eAGk
	 ls7N2MbFJE/3UovDi4IYyyOq+kzAd9V4SqwMFilOQTJ7Ch2Si1db3qeWUD0k9uf6flw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428230;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oD3CNLbIRk9zgIo0q6lJWHOlAEvsBK/j/BkurlWIEZE=;
	b=HDGkJOR3Xvw2WSqLHPXGP2UHRstrfmUN6YzgirCfTkuoGa7mAFh+CdOClSK0jnEtysFS
	 tw05srqy6j1GBQ0A39ZK5t1NyewqnoGAkbHT3EV4ymg0QIkH2CQkzzVDPfYa0SAKIDvbz
	 M7qLIVl2wkXOWEhe2qdwKX9QihhaCkeIx/U2JMshbyZZ6zRMrAwXD9wxFnbLv5Bip7f1W
	 A9EuRWAzS8f69aG1/OwSRcSHbPM8NBAcL6Mv+etfVfqnQ4qYGfX1TxItvP2QMWtMtCGnh
	 05pH227XKP4AKFMfOUxQwt0UUglg9CdcOusFcL1D3wXAhTzwhXwc13uwNNO1oph+wvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLAFqeBU;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7D2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLAFqeBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oD3CNLbIRk9zgIo0q6lJWHOlAEvsBK/j/BkurlWIEZE=; b=rLAFqeBUcRnY4NFkuIHyq7axiM
	OXoJlAbDb0EldqG2BE/m1cR/pt7hEIOLwW/UrBT8SD/09THyBOdupL7HrT/Pin5s5AS+ljJpiuV91
	uFBF1p3C0+GrY12Z51g4zudUG9d0I/4SNRMta9KcCqF2XA5QiF1uxLR7BumUoYnoQqeQctvrqmmr1
	23k9UcSdMZspzmPMbgIClHfC2bTLvo4KCW56OA11vkfrts/urzO6HaA6MWEApc+rNK5pQzZzljSXE
	zYWK6hijsIIwAHOD19U9V7c6nttMAWznydYLvAbPxtcTIatXZoHTZbtpncxPE2Vk64Ln4f3IW+54X
	ifyMh7PQ==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREkj-00000007bhW-1sZ9;
	Wed, 11 Nov 2026 20:17:05 +0000
Date: Wed, 11 Nov 2026 15:17:03 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Dimitris Charisis <dchar@cslab.ece.ntua.gr>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2] test_maple_tree: test maple_range_64 node below the
 root in RCU mode
Message-ID: <b444rjvq32jvaljx2jp25ky7jp3zwkgvojemuq4hvwua4fdyqo@unnxuu64mnqo>
References: <20261102-maple-tree-fix-slab-corruption-v2-1-d0037f04ecd6@codasip.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-maple-tree-fix-slab-corruption-v2-1-d0037f04ecd6@codasip.com>

On 26/11/02 10:14AM, Florian Schmaus wrote:
> Commit baed735a956f ("maple_tree: fix maple_range_64 crashes in RCU
> mode") fixed mt_free_walk() taking the metadata in the last slot of a
> maple_range_64 node with 15 children for a child node.  The bug only
> affects nodes at least two levels above the leaves.  The test added
> along with the fix, check_range64_in_rcu(), uses a height 3 tree, in
> which the root is the only such node.
> 
> The height 3 tree only exposes the bug because the same commit also
> removed mt_clear_meta(), which used to clear the metadata of the root.
> On the code before that commit, the bug is only reachable below the
> root, and the height 3 tree is destroyed without a crash.  If the
> metadata of the root were cleared again, the existing test would no
> longer detect the bug.
> 
> Add a height 4 tree in which a child of the root has 15 children and
> keeps its metadata in the last slot.  5191 insertions produce such a
> tree on a 64-bit build.  Destroying it crashes without the
> mt_free_walk() fix, with or without mt_clear_meta().  For example, on
> the code before the fix, the userspace test harness reports:
> 
>   lib/maple_tree.c:4755:27: runtime error: member access within
>   misaligned address 0x00000000000e for type 'struct maple_node'
> 
> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
> v1 of this series fixed two bugs when freeing RCU-mode maple trees. Both
> are now fixed in mainline by Dimitris' commit baed735a956f ("maple_tree:
> fix maple_range_64 crashes in RCU mode"), so only the height 4 test case
> remains, which I offered to send as a follow-up in [1]. It now extends
> check_range64_in_rcu().
> 
> Testing: the userspace test harness (tools/testing/radix-tree) passes
> on x86_64 with ASan and UBSan, and on s390x (big-endian) under
> qemu-user with UBSan. On both, the new case fails without the
> mt_free_walk() fix, with or without mt_clear_meta(), while the
> existing height 3 case only fails once mt_clear_meta() is gone.
> 
> 1: https://lore.kernel.org/all/46073a08-20fd-465e-86e8-9c358787f9b3@codasip.com/
> ---
> Changes in v2:
> - Drop the two fixes, superseded by commit baed735a956f ("maple_tree:
>   fix maple_range_64 crashes in RCU mode").
> - Rebase onto current mainline.
> - Add the height 4 case to check_range64_in_rcu() instead of a separate
>   check_rcu_destroy(), using its insertion pattern (5191 entries).
> - Drop the full root case, which check_range64_in_rcu() already covers.
> - Link to v1: https://patch.msgid.link/20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com
> ---
>  lib/test_maple_tree.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
> index fb40e193a3cb..121f521e263f 100644
> --- a/lib/test_maple_tree.c
> +++ b/lib/test_maple_tree.c
> @@ -3738,6 +3738,19 @@ static noinline void __init check_range64_in_rcu(struct maple_tree *mt)
>  
>  	mtree_destroy(mt);
>  	rcu_barrier();
> +
> +	nr_entries = 5191; /* Height 4. Root child has 15 children + metadata */
> +
> +	MT_BUG_ON(mt, !mtree_empty(mt));
> +	mt_init_flags(mt, MT_FLAGS_USE_RCU);
> +
> +	for (i = 0; i < nr_entries; i++) {
> +		MT_BUG_ON(mt, mtree_test_insert_range(mt, i*10, i*10 + 9,
> +						      xa_mk_value(i)));
> +	}
> +
> +	mtree_destroy(mt);
> +	rcu_barrier();
>  }
>  
>  static DEFINE_MTREE(tree);
> 
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> change-id: 20261015-maple-tree-fix-slab-corruption-d1f098521d15
> 
> Best regards,
> --  
> Florian Schmaus <florian.schmaus@codasip.com>
> 
> 
> -- 
> maple-tree mailing list
> maple-tree@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/maple-tree
