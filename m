Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB54E5332
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978804; cv=none; b=ntaZEL6nrix/LeUBZdB09wyMs2lVHoG5gu69NP3lJ4pNn+NX6I6s+e4FvWHFnwV4nnT8cD1fMLmhzkU0S4HZA/UD4jSIUqODD/4Z9iMLjYLB24dKD+L/t6gDmW01NYXzxzQ1GZ4xhB0v9UJcUU6AGLxLRdi+5dBngYMhJRapfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978804; c=relaxed/simple;
	bh=FZ+HWdE/B9IYA8miz2fOkS/9IRKduVdNMJdFS6wGZI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYH47lskYz29/+ke68hYPr34sadaSXun9dmozeI+oaaO//zxZB7N2hr/mSje4qGr7LELJfwKRQrGTUXAP53SsJmXGCqCUadrE/EQQCOZuW66SLtdXMHkWCfEEXlnPPXuNugg8J4MkWEv3hXis6FQP9MlNr2avVDIwbyrd+eSu+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=B4CKQk0/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QZZ7FZwP; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="B4CKQk0/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QZZ7FZwP"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id B87921D000FA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:53:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 14 Oct 2026 07:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791978794; x=
	1792065194; bh=fP5v5riUOIghFjIEYIi4ibK+t5UFfmBEQxTvHDpN76s=; b=B
	4CKQk0/3pVCF6Y2B+g601FPUEDR2Hn5ciaosoxoY6klveVsHK4ixjdIDIOrWy6Ow
	u32wlP27XJAYPVg3fio7pr2n/q9E97/dWIzF2ZfZpYhkzZG7rMS84ipGG2CxsTDD
	Y308Xt9uIxU6/ofUR5w2HpittTFhDfEdxzgzXnoQeC+AWZU9ehcS+CtUCdkMrd3S
	cC6uxaQCraSVEXn5AhgwdLqFmfsQhg4ipG5NbNFV/RoTvOMMbqGJJZ5Haj2Wj0eo
	lB4BwcfLo4FV357E9ewaMMyHn1BrCbAeUfT+wLi/K3DmAdTrSHtli4XZHk0wTCRK
	x9kENIiMvptXLC1psUtGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791978794; x=1792065194; bh=fP5v5riUOIghFjIEYIi4ibK+t5UFfmBEQxT
	vHDpN76s=; b=QZZ7FZwPRemXkLuy0WsdIcnVADS7nnfU/MKuTnUlfUu0GN9GnDK
	JBJWOkcZum4T1Y8TSfLlisAZme6e/32EWgl1nFRDaMPd3+a/UN/di/nus9QPieKf
	EgyCVKVw6y/JHev9D+9NL+SdFx5N/O7BpeDpfPB8kQJeyH/s2rxUAsW4rgCgCRQH
	3jsN9XwjlctPR9XkoAA7upFfxGGl4wiIU3sUATDzbPULUVQpYyF61USanloCmBM6
	5ucvRVNmFHT7iHHseoHhTE0zTG1ZakQYj8/pR9vehqfkF5SkygMGf3zVe4tI/+r3
	DsAjYDoWuSrsTbcRBGcmgdQtOIA9FQZseng==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791978794; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:ZUQrSG/EftuzSfEyIWoW9vGcheRV1+WycirlF1oBJYisNEi
	/8a+chtirztZ10vCS+/klZ2E64xaGyxN77NiFYx4X/H20VzdL/z+imxJLPg5zQ47
	cEjNxIC9gue/jxSklLfzGCZ4ArSWxbevoTK6Opf5JdZZrOYp8EBB59UXhSokwMud
	xJq5sG4HukttFymCILt28yBwWHEYCxAYgp4Wt5vtG6cLAO0csD/NFEt4t6Ces4QP
	0lUFHeCHQzm4Pzh2P9N+FeTGx0/8IQbFcdtdJI/eMAoI8ihjAUuf8fbNC8h7NL8F
	5NYXIOUGJrG7YrSj6+cmc8XQDh5murGiLpH59iA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:sk6qzregYkMbIhR3H8d1Zc3B6Ll4yV055AV928XC1Iw=:FZ+HWdE/B9IYA8miz2fOkS/9IRKduVdNMJdFS6wGZI8=;
X-ME-Sender: <xms:KW3Pas62_Gt2bpIYL8eIQY4_ex1CQbwxBNUj0utKmkRCbHRpLpQ1Ug>
    <xme:KW3Pap2oA3o-E2OKjdrbphSu9bVGzI3evvORbhieFTjq5_DCdjIhuIsYAP0faG9nm
    1p-83Dhovot53ZHU4-6wunAryg_1KM2fQR2fvcHyDj7UkrHu9Syl9h7>
X-ME-Received: <xmr:KW3Pahl1qZZgg3yiLSuXTbv-UWi-JxeYM5Hvq9ycHhK8bTMd-NMmOte-aDw>
X-ME-Proxy-Cause: dmFkZTFo2P8Re9lPetEfg0qzrC2MekNGQUt8FyJcCK4a8cbWZkPh1J2To5mB94+WVXyzGo
    8sTJE3LdW3jKoIwohtz9+8BJg8V7g7gCRjsU6pxSMtXFMIexeVy7VE1UVIP9sUVz/1jWai
    p812eiXT1xn3IQlt7ZDZF0L8WHCcE2eKmjTNgr4LKsXt+eOHhx/QXM8/Xu7feAiGzYyFOT
    mCQauGvD7tTtdiLajuf554uWfuv1mTD84IqpJpTL5FS8b1tiFUnpmSUPYm3eRgWL+gp7Wf
    tLngOuufZfKvOjCwHlRjncXJK3/Z33qYnlJqfDF9M+37eH2F4YkLdwgsvr+A+zMcHqezfy
    k6OuatRgigbU/oQZJ4eg6yWnHW7CH2lVJqsAQOiVk+1AGnvDQLQmjYG+bxB7luFemZBBZY
    xALYyeuvrMpKipPiLhCxooxaVhc0Qs45uR7gVHBRd3nClcRk6Esqf8RVoFz+ZAie3AHxzr
    VE/D+a9I7ZvpmQbNtWo9S2B39Ray1vABUUWLYO0JR3Sfy+PKhOyf72PBrIqrY8m9C87X8v
    eq9zmD+O+q5ncZBjJWx+6L71ha/SQWiTfdKE4TtzklUTRSLruADEE6aBZEyqO1jvEtw2QB
    RKi3cBG4jOz6uLP7qZ+VqOfg/86IkEPehitb7STyRNznXkz9dwQti93qaqYw
X-ME-Proxy: <xmx:KW3PangqDSnCJijXIo5Na9-N07_oqRQeoqTk0N2S4dniSxKP_OLt7g>
    <xmx:KW3PauSXIpLsl_xpChvBN1LfokbYgSXx0AlDDoiPzSDTpLUw1k6DTQ>
    <xmx:KW3Pasgfiqg3ws5vgOmUAok271V80BdEwPoLIigCkra4WBcs9dCt4Q>
    <xmx:KW3PaqhXXOK5YfOI38jctOP5gVGYTL83ncrpnKDGhnUFWinLBQAUBg>
    <xmx:Km3PapfpJDgDhzCsIvmzyfW47UdBGlEd_2uLLESvK_jjIXf-P2gwlb9x>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 07:53:12 -0400 (EDT)
Date: Wed, 14 Oct 2026 12:53:11 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as9rk-T5cedl8Myq@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6vBoWQGglxXxb0@thinkstation>
 <CAHk-=wiCe2H33izZHDyDHEhcFwUr9fXZk27-WZ2vn_pn5FcZTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiCe2H33izZHDyDHEhcFwUr9fXZk27-WZ2vn_pn5FcZTg@mail.gmail.com>

On Tue, Oct 13, 2026 at 04:39:24PM -0700, Linus Torvalds wrote:
> On Tue, 13 Oct 2026 at 15:43, Kiryl Shutsemau <kirill@shutemov.name> wrote:
> >
> > There's a race in filemap_read_rcu_batch(). If the folio is replaced
> > under us with a new one and then i_size is extended, we can read data
> > that never got written there:
> 
> Hmm. Wouldn't it be better to move the i_size check up, and then have
> one single check for that
> 
>                 if (xas_reload(&xas) != folio)
>                         break;
>
> case?

I was not sure it is possible. i_size has to be read after we know the
folio is uptodate, and the uptodate bit only means something after the
reload.

But it is fine: PG_rcu_free is only set after the folio was seen
uptodate, so reading i_size after the flag test and smp_rmb() gives the
same ordering. And i_size_read() is an acquire, so it is ordered before
the reload.

The uptodate check in filemap_read_rcu_can_copy() has to stay, though.
The flag only says the folio was uptodate when it was marked. Some
filesystems clear PG_uptodate on a folio that stays in the page cache,
and that can happen after the folio got the flag.

See the patch below.

> Otherwise we end up with two of them, one inside that "folio != prev" case...
> 
> IOW, I wonder if we could just make the whole
> 
>                         if (!test_bit(PG_rcu_free, &folio->flags.f))
>                                 break;
>                         smp_rmb();
>                         if (xas_reload(&xas) != folio)
>                                 break;
> 
> be unconditional, and move the i_size read up there too (I notice that
> the comment about uptodate got in there too - PG_rcu_free indirectly
> does imply that, so it's not *wrong*, but it's perhaps a bit
> surprising).
> 
> That said:
> 
> > My branch contains a few more changes that address downstream effects of
> > RCU-freeing the page cache. But we can come back to that later once we get
> > agreement on the core mechanism.
> 
> Would you be willing to take this whole series over?

Yes, can do.

diff --git a/mm/filemap.c b/mm/filemap.c
index b85de94a1b6e..1836da9eee5e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2879,9 +2879,9 @@ static bool filemap_read_rcu_can_copy(struct folio *folio, pgoff_t index,
  * Copy page by page, each page looked up in i_pages.  Without a reference
  * a split can change the folio's size under us, so only the page at the
  * index xas_load() returned the folio for is known to be part of it.
- * The folio's flags are checked once per folio: prev is the folio of the
- * previous page.  *last_index is the page the previous copy ended in, and
- * is set to each page copied, as the slow path sets last_pos.
+ * filemap_read_rcu_can_copy() is called once per folio: prev is the folio
+ * of the previous page.  *last_index is the page the previous copy ended
+ * in, and is set to each page copied, as the slow path sets last_pos.
  *
  * Copy at most FOLIO_BATCH_SIZE pages under one rcu_read_lock().  Return
  * true if that many were copied and the read is not done.  prev is not
@@ -2928,34 +2928,25 @@ static bool filemap_read_rcu_batch(struct kiocb *iocb, struct iov_iter *iter,
 		if (xas_retry(&xas, folio) || !folio || xa_is_value(folio))
 			break;
 
+		/* Not folio_test_rcu_free(): it may not be a folio any more */
+		if (!test_bit(PG_rcu_free, &folio->flags.f))
+			break;
+		/* Read i_size and slot after the flag: it implies uptodate */
+		smp_rmb();
+		isize = i_size_read(inode);
+		if (pos >= isize)
+			break;
+		/* A write fills the slot before it extends i_size */
+		if (xas_reload(&xas) != folio)
+			break;
+		/* Read the rest of the folio only once the slot holds it */
+		smp_rmb();
 		if (folio != prev) {
-			/*
-			 * The memory may be anything by now, a tail page or
-			 * no folio at all, so test the bit and not the folio
-			 * flag.  The loads must happen in this order: the
-			 * flag, then the slot, then everything else.
-			 */
-			if (!test_bit(PG_rcu_free, &folio->flags.f))
-				break;
-			/*
-			 * The flag before the slot: a flag set on a later
-			 * folio in this memory was set after this folio left
-			 * the slot (see above)
-			 */
-			smp_rmb();
-			if (xas_reload(&xas) != folio)
-				break;
-			/* The slot before anything else of the folio */
-			smp_rmb();
 			if (!filemap_read_rcu_can_copy(folio, index, *last_index))
 				break;
 			prev = folio;
 		}
 
-		/* i_size must be checked after we know the folio is uptodate */
-		isize = i_size_read(inode);
-		if (pos >= isize)
-			break;
 		bytes = min_t(loff_t, isize - pos,
 			      min_t(size_t, iov_iter_count(iter),
 				    PAGE_SIZE - offset));
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
