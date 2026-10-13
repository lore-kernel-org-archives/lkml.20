Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9645304D1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931431; cv=none; b=TirgM4CSICwrBWO2GLt3BtbomElpNWRtrMDFZZsQu7BSjqltUg1IonMOEDCbYJTw3xys1Kwga1P4k9MGhZmMMoaaNVrSwjjQi3q29r+BnMmrS1TdVN/pl15dJgr3WbP1YNCHb6LQArkFNQRLbcj5AOXz+jYMC44QGI1cweqUFIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931431; c=relaxed/simple;
	bh=PUR4UpMeXD5o4/cnjdMVjrnJKqQXVrCu2h1+WwuB4+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBH+y6U6QFsThNhfZD5YmNcbm5IEd+r44CZdiF98wHQMZGbfTvURdXojn4ni45ub2B8D1a9keXH6T1zyGUgTjusYr4XdlcxApCTuVOUIGejHwiAnSJJwBuboT9LP5IrAuL08q94dxlNJduJwss5uZRgjJnVlgt6f4kTnpzcF08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ZpsGtk08; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g+QUGw2w; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ZpsGtk08";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g+QUGw2w"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 711F0EC0460
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:43:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 13 Oct 2026 18:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791931428; x=
	1792017828; bh=1x+mA/8QRgttSFWuMxYzyxQ2P0xXPF95oS5eZcsEM1M=; b=Z
	psGtk08TQKc71gAbZ5He+Fbk0zQgU2B+75J0+1G3ecGo62lvY+kk4sckBwPLOE8F
	0Cp0zkOP0YeRmOW8zE0FXDgWUtBX4GPtPGpsFtVtivhs6oYBEyGjzvfbowbP1ouX
	qIQILD7CdlvcNzQkW68wtvDI2Uv1JaH8xYS62VuYaAOxK4TBrKF6gd2JysC8rLOz
	3NprVnHp3x1BCQ5ScWLp0OtGp1tPoznp2vH6WFb/6xBP9EMLzQZ9nvNTXIAVBPqc
	VUqzCjC3xvpObnvvxLuOS5zdn6P/OhvSYi/yw7r261LTv9krjasnp7GMQiDPNcYi
	cPaTp2LAah2Hr1g4tet3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791931428; x=1792017828; bh=1x+mA/8QRgttSFWuMxYzyxQ2P0xXPF95oS5
	eZcsEM1M=; b=g+QUGw2wI9citw4lhcLc6fFEaTx6mxAeWfzBMVWfgXBO7aIfnlp
	YbJbomepCAvDmaue6mYnNB3qpffGf2sdDMZ9uY9+XKkQptCvEDSAZJ3c00ljEqPJ
	AB2pzffKTdihS0+voeJKdq2/vcKe3xifTnzL0yRSiiWBy8Jur6yBVUIsAVNu+eAJ
	hKZWtA+EYo5FFLgyFoLNOqR8UrPa4n2pjYTTbPzx0uqyiS3R8wavx02g8e1GybYt
	ea2x20HxKLOr54Hy5MHHlIMBzqIk7042fCd4gDfMqenZlgwt1XCUyokA7ZfDqngn
	qgo69eadzCS9Ut+06EoO/43ko3nqbLIf1Rg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791931428; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:tfqVVm3rRidHIcdbUpnk/25AhfGs9Nx79PzQWdjBzE7Z7Ub
	j+yV568rBjU65Mk+yfLDebQGHlJRdyurS2ChvYM1RIWv0xTyf5agqW1VLWxb1uRm
	UosCOKS8ozKqOvadzL6nCB3E4CIQrN3Vc9pqaXM77BRt3nrySkdJrAAEN5g1j/HO
	ioW1cSqvip/r6BOUMyTmSKaxfGqoDR8i4UzMa1CyhYQ8l35ofECV/JF6NGfPr/bj
	NQNZ5wpjfE7st+6KiTTC95mtB/RSGT9PrIcbnQgAfYLAyl2XD61GTqSyY+GNE61q
	zTTwRUi7JcevAeua0mfNbf1NeLzkLTpJImiEY4g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Om/TkPmp1oWaFFNnYd0zGc4VEtvT0AnDj9qfGTI2EvU=:PUR4UpMeXD5o4/cnjdMVjrnJKqQXVrCu2h1+WwuB4+E=;
X-ME-Sender: <xms:JLTOaqk7i97ezJxaF4nUjxp6H32O3BTQxUZQv2p0mkeVnEu3nAuo3Q>
    <xme:JLTOajXZjyleNVkH-hvkJwzn1Z3uv-3FVAvZTsdmBxZs7zvR8D0JDD1n1URv7vgeA
    XBLXmt6mz1eyQdJfnUKSoWQNOgBtPQmqJzcxF8AWCm6qpsYbzr8kOuk>
X-ME-Received: <xmr:JLTOamTy5kRDDh147IH7aw7x9dlR8VOBWQCEVc7XDaOFKurgt_yOEg5HY3U>
X-ME-Proxy-Cause: dmFkZTF+qcMsV6L7rd+IYj2Z92H4Nvz+YIi8ffOn+Tmxw4G+DAJj5Ue2WS85tg6EnHOF2G
    qz1staSdEmGQ3ZCUytTn6Xq3zEj/HWROE8CXdQoI5tivo7SK8xeFYTZkCRkbZZ1S02ixwH
    NZiUdpgNkDbedD9tkrgJF1SYNmgGWp31dQS9Rdby9I4u2ihgELyJcdEgr5kKVdSXxEonFJ
    xf8rmSSSKb6ulWDPEf6NBt2c+Y/vv3Ee5Xfa2O+T+fsgMLd5G0i67DniPVNSIokNE4W4ls
    Y6jPYTEmginqFsqsmc1kAiAOTYcEaGeVijQRlCpIqVndc2czP7yFAy/smtuqB9eX5AatJ7
    AWAQQw8+ejsT68Xa/UxdKrAzQtndJA+SQV6h6wsALQQGLE3L4fydRE0cea0Hwne+nuVIuM
    QTQg1EoPVVI1F5AY1wck/qLyxiNGKsMZFOahVsarZkhE1uCaRxwsczv6eSO1KtzFjYpY3y
    qILcLFruwheiT5VIApkgbB/sZ5+FFRoZAibJdkK9E6xHhDGfXVRNY0p3hUJdB0nQZAlaNS
    4oMQj1h1IXRHxfyxMG4cQW+DjXCrxa4usGs5TNBwckjqQYyBeqTAdumy159e/kBy/t3+J+
    iyz7EP8CR/yVCMftvuFzQ1chdLI5eSAyWBrB33pI67uDWBzDQZJvAZuCBsVg
X-ME-Proxy: <xmx:JLTOamC_Cg1hx2NSvf2LjovrzCK2Z3M0Al32xvDDyRWd84bGye76IA>
    <xmx:JLTOapRXLH_gAZglbFWsc5PQ8P9-bRF36nNRqDLx0CE6p6tql5QRcQ>
    <xmx:JLTOaoRhn1tD4wUbrfOIaA6kB6hiUYsvDypoa6KrGG67pZz2EKzJ4Q>
    <xmx:JLTOanK0Q_R3humpgPBIg7dzr2DPT7NlyCd83Kg4_6swboovITSlZw>
    <xmx:JLTOaqMvCQS9WPeaqIA_5-vfaSRINU7SEgPfyOa2hFzqaBC5rhd8Azrz>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 18:43:47 -0400 (EDT)
Date: Tue, 13 Oct 2026 23:43:46 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as6vBoWQGglxXxb0@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> Comments?

There's a race in filemap_read_rcu_batch(). If the folio is replaced
under us with a new one and then i_size is extended, we can read data
that never got written there:

  CPU0                              CPU1
  filemap_read()
    filemap_read_rcu()
      filemap_read_rcu_batch()
        folio = xas_load()  // A
        test_bit(PG_rcu_free, A)
        xas_reload() == A
                                    fadvise(FADV_DONTNEED)
                                    // A leaves the page cache, its
                                    // free is deferred: A stays valid
                                    write()
                                    // page cache re-populated
                                    // i_size extended
        isize = i_size_read()
        // i_size is extended
        copy_page_to_iter(A)
        // we read from old folio
        // data that user never wrote

We need to re-check that the folio is still in the page cache after we
get the new i_size. See the patch below.

My branch contains a few more changes that address downstream effects of
RCU-freeing the page cache. But we can come back to that later once we get
agreement on the core mechanism.

diff --git a/mm/filemap.c b/mm/filemap.c
index b85de94a1b6e..0d9fcc35dc64 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2956,6 +2956,8 @@ static bool filemap_read_rcu_batch(struct kiocb *iocb, struct iov_iter *iter,
 		isize = i_size_read(inode);
 		if (pos >= isize)
 			break;
+		if (xas_reload(&xas) != folio)
+			break;
 		bytes = min_t(loff_t, isize - pos,
 			      min_t(size_t, iov_iter_count(iter),
 				    PAGE_SIZE - offset));
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
