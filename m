Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80B3E4C75
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974218; cv=none; b=f4Hp3oVywkv8QB5zhQBY0vnRUsvf+WnGOrS8KzEmR4+rQknbii9ODPCvpjl1IhCP8ac7c63KdOfhjosc6AWaht5KSERxZuTEwI8MfvP/LzWE56rrDdEAu56w+VkJELurZVPUtWYrBrPBKhvbFKGTj/FJzQ1Dayf/c6qI2bd9cI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974218; c=relaxed/simple;
	bh=Dxu9i3WMW4TKf6HMVitbB+K0/Ep0WTHU06lA/MWjVMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eu7RfbzSq5wBVeet5IYVX6usXDdkSFdtTCXErERxydRBU60Tg4bDI4M4U/ngSVxrYro9m15plryGr3FidBd/eWFQn1U7J5OnFnRdZF27jWEsTX3VUaL7d05x95Z7d6511treZwbkwH1nO5/4aX38JspHgdIdpG5f36ETKGVCEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=axBB0Li9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WF726lTT; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="axBB0Li9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WF726lTT"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7B5981D00113
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:36:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 14 Oct 2026 06:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791974213; x=
	1792060613; bh=9niRVdDofrrpATLDu24HuwcFMCvfPmKkgmurPmzx6jY=; b=a
	xBB0Li96NsnZ/irHZ75FwB358ZLuiHr8HYFCThJqj+48/W78WxD6N4J2DvG7FeGP
	+rs17hKVtqdQ0d0QRICLj0NnJp5ki9QWpZFpeo5/MatMWd8ArMRQsGWXA1hc7IUK
	AS+0PAvKZXg6vZS2NnB7vis3t8kFRYfj0wYve9A30f1tYQXvFNFWCWmNMo4kTdqf
	yDfw2ryM+qWl3OC9gxFFNsN1ehtRG2MuLKMTkSEreYesulb3/JSIn/BoFdbB1qA/
	ePB70qA5OiYtf6pmfcBJqaz8FWzMShdFeQrcVomL7HeSpjYimJwvSFwlE6U52KAX
	rz2WumTxv0ZyNYNZ2Qcdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791974213; x=1792060613; bh=9niRVdDofrrpATLDu24HuwcFMCvfPmKkgmu
	rPmzx6jY=; b=WF726lTTF4TeXrr2DspNhoOkiBR+TxIGBRedtHiATcfLjapWbCl
	wayhOOc0WQRYK7e07I5Bv7grVrPhp6pDABeqqfktoxI60wpG/ZVZH9SNAWDLVanP
	G1Kyx2P5QopdMgCP4SMnj2OJeyEgyusUpCyuc8a3cGOQ89JjuMFz3dLjZYpILgjl
	fjESDeI9tyJGj6uQVb6ejmsO48SzhAqneqKoZVHAM41eyWWyXqm/yoITJkiwb+RB
	38xO84KYco1+HxmDJg8rU99XxSQdmZJI/6hR0dBGEjygAZxInr15UIRxuYa7TieD
	66ZCpXSsxwenJ7iGVzRmExsMlRR58cvcSWg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791974213; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:InfTzK55d67UA6cxQbltBtPSxYlCtndASgYh/ZvZ9FfskAy
	CnM4DTdXNqUSOrnELMCWP0L44zpXeAeZrHkKS/qdD2D9JWZAvTr52y3K9mG6qo+2
	qa/BDKtQrOAPGLw2v5N1UeqEBb49xs21ypSdQ9ygtV9Sa1DVHJt7x8U2DShnVEdj
	3aAIP6stUWEMMMhpB++2rUxowFNojE/jd5ybFylGxSd3acJU1YiouvoNy7F2nRdb
	isniDM1Z+iHeDwhP4WnkLLu/EEvHc0CwyogFBdMnvism91ApERiLsJ+Wk+W1gwz6
	Vl7n5wD3rV7s/02wqPeNrsfdyzQgC7tnzRVokfA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:s40ghuQqRQ+FsRNKxrRGLcZ0CZnfAi2ZGMOEXRZlVAw=:Dxu9i3WMW4TKf6HMVitbB+K0/Ep0WTHU06lA/MWjVMk=;
X-ME-Sender: <xms:Q1vPardLtLdVCYlcriw_iTQ16Zp--NECrzF9Hhuai3-y2Y8QZB7Vfw>
    <xme:Q1vPatJlw_svcxr0gTzy4vlSHQrbWVfWvmO25hsqGRZDtY7Bi4ucGmSNVHoLUmURY
    SJcYcOES-4FBIshzufItqpM7GjU4wFc-BBd9sXdXFpCwMbXyIB0nTs>
X-ME-Received: <xmr:Q1vPaqqiJnxsX5YO4j2Pjt4jSqhc9yu5qdRR8_7C6Ekbcl99Sc6scDUNpuA>
X-ME-Proxy-Cause: dmFkZTFuONKeASOwUHIqNios3PKDeDz7a+w5ERMwBMX2xbkUUxN7LaQyAOnaqs2VvUULV+
    BfQDNCW8SlJYrZwGjqiW6IGrusOlnBvYQzTbbc2XBwNA9c+hwHRTvGTa/AkV2hu+b3xjcP
    BYC7+ccDzFGShUqc1XXiYtUdRTMbOt+mIciVRtXYd+Q8vbKlG3RilDf1jXWE3rb0FYTISG
    FX3h79NuctJRG04LoKBj4tPSiA7UMywGZ0r4DQahGk3YRWLO9FAC3k/o6HtcJhjA6u2tJL
    mL5Z+gad42T/BssNYShyuJi8iE80ahE4F5r0ENRGE3FtjmmQypA61x8HNAeAclMvm81ym/
    +hMQUKK7y7YbR75AoJxfxt/bM/3WXCP/VFW+GHN8B3NPhHIdgAAykimUB345Og0bdRPVSC
    0t53Iuq6/BkkPhHMkNrozZIMyos7bMuxPC6wCmixWDbIvOqSUU2HY1PqEQgSP8tbeqKH7n
    T3HyO3XeA0A5uEBJJyzNXPkuBO1BOX7tkLBh1bLk06/Pijtyc54V4zwJZTrg8u2361T/yT
    m5wFVaj6v8tegBBVmh1z5bmpDVtiPrL9zL9DhgNmz8NeUy+I6yFUZ/Sxhd40p5+VkION76
    IgVt582vhduxLyPGK5/NcbPrdcSW2e6R0sSVuejBmw+CZnIjDzWE4KkuTAEQ
X-ME-Proxy: <xmx:Q1vPajXX9RVVPga73Zv9kQAkvxD6Zw9Ao1bxZGq3BCYva8fUUj9hRw>
    <xmx:RFvPal3yoaAyHvt-RB1v0Dfg4rkSTnyzfHRGUfVxs2ztQpwlMvgJFw>
    <xmx:RFvPak1bmJXjmbM_naLFhTBIXSy82I28zSHlvWKqOEOJUVq_ECGchw>
    <xmx:RFvPakktgc8hQJxeLnwTgtwXGtOkH_EqXNlPuvAjszXl1OBj1HWGWg>
    <xmx:RVvPakqdKaLnz7LMdw0mFfAHfYpV620GwI-B4M8TBScd--cjPb-_mqHQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 06:36:51 -0400 (EDT)
Date: Wed, 14 Oct 2026 11:36:50 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as9af-Jd_rVZvMlC@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6ckC9NJVB8JBuV@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as6ckC9NJVB8JBuV@casper.infradead.org>

On Tue, Oct 13, 2026 at 10:03:12PM +0100, Matthew Wilcox wrote:
> On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> > The fairly short series of ten patches basically enhances folio lookup
> > by noticing when folios are hot, and setting a "delay relasing this
> > folio until after a RCU period", and then using that RCU delay it does
> > not just the folio lookup itself under RCU (which we've done forever),
> > but also the actual folio data accesses themselves under RCU. No
> > refcount taking needed for the fastpath where we can just read the
> > data from the folio entirely in an RCU-protected region when the user
> > copy doesn't cause page faults.
> > 
> > Unlike my original approach - because it now actually delays the
> > freeing of the underlying folio data - there's no need for any double
> > buffering, and a lot of the original limitations of my original patch
> > go away too. That improves performance quite a lot. And by "quite a
> > lot"  I mean "I see a 23x performance increase on my Ryzen
> > threadripper". Admittedly that is a very artificial case of reading
> > the same small part of a page over and over in a threaded loop on all
> > CPUs, so any real life impact will be much much less.
> > 
> > Anyway, I wasn't planning on posting the individual patches, I think
> > we all use git by now and probably find it easier than fetching
> > patches from the list. So it's all at
> > 
> >     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free-v3
> > 
> > and the commit messages are a bit more verbose than I would have done
> > it myself without tool use, but maybe it's better that way.
> 
> Obviously the numbers are compelling.  And thanks to Kiryl for figuring
> out a workload that confirmed my fears, then remedying the problem.
> 
> I don't like the PG_rcu_free flag.

I wonder if you would be okay with a 64-bit-only flag? Those are less
scarce. That's the direction I was looking at:

https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git/commit/?id=59b23fdc4bb0d008e2a30d24156177eeede8a577

I don't think we care about the scalability of 32-bit machines here.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
