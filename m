Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540893;
	b=gtUqwGVsdI5Z69BGGtkeiZYzeOBV3VXJr16ptcmRG/WF846Z2wTYDd9+pyKOWRvHY33E
	 M2FOUS0lAg2nDMCSUMAERdli6WCJdc5KtdM/L9CSsB6laSfsY/dIz2saeIx3boDXD3vBg
	 lDJvE64yFYPORmzM9HdLS0Id2LctIW3/M2/c7ueJm1+4xtvrV9iEqOcpg4R/AjQ7K6/zl
	 oeKdyb8Bt1IWLcjZEWF63caNFQsflZEmIxflCW+9yHSgnW//8ayu3pIfofR5ibC6bgeA6
	 TngV+aunLTuxrny72DcrNJirzm2iN5huT650H/5d6JH3AaLiAh9mhNMl/Fd01tG2jwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540893;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=FUjxBUfQtSTNc73Rr/mRVxUWdJbji5FsW5pmpvQ/xMc=;
	b=SOlqGLgB6bzVeN0R8bjUZB8/ixOJQr5grwmkEkRkx8iACj1VFLTGr4HV+rMjHukbbeby
	 Vx6bLwabum+bLTI2lCvlWn1KyptOnye85bPYVPKfWHcmFJDNmshVA4BnIonaHaJzXJd1J
	 YNynSjTC/GcUtobH04PhELH8v99B62bEy20BnyOzGn/qF0TCl3OFI5MeSIcN3rRYcvmg5
	 sCIiBfK4ExGQ5BrtXM8g2q4rOnVob9W9PUmoktjBuJUgd8ZJZ/RZrl5t8W5nq/gMeRMjk
	 AtCE1D0SEyy6gEhS2RzcKvAF93G/T6Y2JA4ULao+Ox5nod+7cJ5jzszWl/185JaS2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=MbIysY9O;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EDo6Gzwh;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3B606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C3B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=MbIysY9O;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EDo6Gzwh
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7253EEC04EF
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:01:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 20 Oct 2026 20:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792540887; x=1792627287; bh=FUjxBUfQtSTNc73Rr/mRVxUWdJbji5FsW5p
	mpvQ/xMc=; b=MbIysY9OzbvBGsPAIKD1fKkWvHnYJ4jpcoM9JqWWmWsiQCWWaC8
	rdTcy0TNh7fL+fiOYCQGl+s6X1Wr+BOanVcucybvh8SDwzi1t2H1maDoalWaieYV
	q4eBPaZZiPTgaVNZXTHTQWxIvF+BdXWTCWqYDS/yBYK7QUkgVu2t3Cr5V3UWrcgt
	syKhi8uTWOIb/w1O4MCzH+QAkBUDexolWFznc/gQ5jGgbku5DvUDc3iLChfLuAzl
	V40Iug5ijOoN+0WhMDWukVLp7zFIaelmt+LflP1UmBY93OmgO99KI6am/g6paEiy
	7eiTxmv/L2sWDce5cGGd3hmFM3ovqUdeGog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792540887; x=
	1792627287; bh=FUjxBUfQtSTNc73Rr/mRVxUWdJbji5FsW5pmpvQ/xMc=; b=E
	Do6Gzwh6axbmRIOykaxwoXKzX5kYbfaawU3lyrMPrpgA8odfA1TMw0pDeiyr85lx
	VjCB0I65msU1RFu8WZfVSsyC55DWf4MHrwdaTUXqvyYMMsFqBbj4jkGUL8ZlWJfI
	JxJmBvPhNY5WZAUAKAZAOi3y9Z6V2OMnXd/yni4O0GnMkgWYID+CzhC9b2EZ2Utz
	3jM2xmz51z4b9LORfMBDUmS2QwocW8ONK4px6BRklsMK2b3pu8QTHaTODjhqDJ99
	WYoBUXnw/rq6UCY6vqMIsoK1CF8ifoTzQGt2DREpby1wO+m+JAfEaMaSlm3LAgWZ
	2SYcICumBSJ9/cOOH/XdA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792540887; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:bi3MgvbWVD7HHfnuahkpWS7WKrQuviuWVBej1dyho+lG72i
	dOZMD3QX4oKdG6z6XLsgvfv/xQrWyuPLqQcmLx1H/yEfnHDbfITT4tT5gqWR5jtu
	R2P5OQHo4GzZizCQN4eTPLKmYBnwC9eldC+Ld817taWpc0R/pSlgmm+l4hTCI70x
	D6TUg476K/ndBOp2GQTnkXCPuMDsN2SuEUIcoNC6goiU8rX/9iW/0Foz2Lk+0xcC
	2TAUMg0C0JxLDkstavmg6XlsduFFuNXJn6zuEpeX22+hns0EkJusY25wFRFbFmGG
	sD+c3DKdPLxMon8NKr2Ru+UDWRjjKc9Dtd7skUw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:1ti1x+x3skVBe0LPGMAEfoTdgjCt5S9yzPDko83HJZY=:H5Cge+pDSLrEdpsqzXVywHlNnjtIfztkv25bR9thG9Q=;
X-ME-Sender: <xms:1wDYaqAo1UemgoqMd6usoJsDd6GVxIfdaIJU_KGu8zDM4D_EbcHMQg>
    <xme:1wDYanHsdX5HQFghvthE6dEkr8ek23jYAO79nbAdeRiBmiaofcJYbYOXlkVBrMHpB
    CIcRWsPBYBHGZrgE4YcEQnV3iLRfuRh80278paLTAM1wkK3NVw>
X-ME-Received: <xmr:1wDYahMH7UeBBs1B0qqSPIweKM-oB5zMqoAvkuikLjtm9iubAskI1ReJYH7wM-ISwLxWvLy9tCnjaK86JsvZMkkdh2lkrjE>
X-ME-Proxy-Cause: dmFkZTF6ypRrMaPuD4qt69fhECHQW8nY+HctVORcXS5YCkizKAkk7nSYTXYqOSI7N13UQf
    71/xt/WgdINEaCe0bifcL+DdhgeNGlv0jE7kE1Try6kqH/aQtUpuPHsDp+9gA9AErm4Jsz
    dOPMHdI5gDiNjF3fzzjixSZ1rnFFLiq52F1E4ZitGzFJM32BPJ8Uo3XPlNIom6BVu/s+U0
    B+e8q6bEHOMGfziEMKUK26atZAVsLflVC/oFPB848LL9cO8ZCeIR9t0W8uOUT4Xb5A66bw
    KWIziooFS1oM93dG5muVkN86TAzrDMMJsneMdnRbHlMu/VWrIjUV+ckfqD9h59e5UbOIkr
    cHgW0oHvq2Wa+RDqU0M8G91CEFeQGVg74lBgppz3YAmlu++vQMYgzvncvTxXQYbHxVWV3J
    HGZSfnFLu7YnoF4SoZ0HFSfYV3I/cdySyNig4ctglneZWXEQWUG3TwvjQPL5eBgwkmbvcO
    WFj787lmA3bNndQW1LJBdp2QXA8OZiOOaK2hzvFXTciFEVzjBePZPCbhgk987Y4CXn6sK3
    p8f63xH1ap9rPtuBj0tcWwl00swdJIxr39MTJe3QYZ1UZtlnP1O8KqwhNgGvWYmiFUTyxl
    FCo/Beq8M9bAZzRft4OYYy6KCpXOLQpYwAQ+iJWBLu/4WMfE3gHhEop+2uHw
X-ME-Proxy: <xmx:1wDYao7KV6FwRIjTa1a5FrIwwjFUc3gCdFYWJo2GFubMG3gXh_G2jg>
    <xmx:1wDYakgCxfII70qETXcC3eUY2vz6aSSYYuulMBWhB5b8ZjHMpTgVlA>
    <xmx:1wDYatde8PlGsh-FKkZHPIzEXzH2PKrrt22l7Jv4SOSkOqQq7Hj0yw>
    <xmx:1wDYasyHyAmkvB9pWm7BspqnfKC8NKqeyGSF4cinwXyq8yqXHJc9jg>
    <xmx:1wDYaiTbAL43S4876XOHSRmbzgdSxe02K2hylmsN0hd4jfsfVoGGMXzK>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 20:01:24 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Ian Kent" <raven@themaw.net>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 "Amir Goldstein" <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Jake Edge" <jake@lwn.net>
Subject: Re: [PATCH v4 0/5] Fix easy bits of the negative dentry problem
In-reply-to: <d0bc6eaac2fc84cb43b569f49ee503057784b45c.camel@themaw.net>
References: <20261019000810.1837917-1-neilb@ownmail.net>
  <f1c42d0bd125c6b1c39f1ebaee41340b5f6f03f6.camel@themaw.net>
  <179237697885.1724252.11956785709205194840@noble.neil.brown.name>
  <d0bc6eaac2fc84cb43b569f49ee503057784b45c.camel@themaw.net>
Date: Wed, 21 Oct 2026 11:01:20 +1100
Message-id: <179254088039.1724252.11440960537426762855@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Tue, 20 Oct 2026, Ian Kent wrote:
> On Mon, 2026-10-19 at 13:29 +1100, NeilBrown wrote:
> > On Mon, 19 Oct 2026, Ian Kent wrote:
> > 
> > > 
> > > As is so often the case you've come up with an interesting and
> > > useful
> > > proposal, ;)
> > > 
> > > Nothing stood to me out as problematic given the scope of the
> > > series.
> > 
> > Thanks :-)
> > 
> > 
> > > 
> > > > 
> > > > 
> > > >  [PATCH v4 1/5] VFS: don't count references through ->d_parent
> > > >  [PATCH v4 2/5] fsnotify: update children flags only when adding
> > > > mask
> > > >  [PATCH v4 3/5] fsnotify: don't hold i_lock while walking
> > > > d_children
> > > >  [PATCH v4 4/5] Add d_for_each_positive_child family of iterators
> > > >  [PATCH v4 5/5] Use d_for_each_positive_child() in fsnotify.
> > > 
> > > Did you have any thoughts on how to contain the number of negative
> > > dentries, (perhaps) including directory entry counts, in an
> > > intelligent
> > > way (meaning "as you go" rather than "brute force" when needed)?
> > > 
> > > A significant problem, particularly on systems that count their
> > > memory
> > > in TBs rather than GBs.
> > 
> > I would need to understand *why* this is a significant problem, which
> > as
> > yet I don't.
> 
> I think there is something more needed to understand the problem.
> 
> The source of my concern was originally the traversal of the entire
> list of child directory dentries in the notification code to set a
> flag that depended on a parent dentry setting.

And why this is a problem?
If it holds a lock for extended period, that is bad.  My patches address
that.
If it causes a noticeable delay for users, then that might be bad.
I think I can fix that, but I would like a report of "task X takes 5
seconds which is a problem because ...."

> 
> From the information I got (which is usually somewhat limited) it
> was obvious the number of dentries was very large and there was a
> large proportion of negative dentries. The obvious assumption is
> that the implicated list traversal was causing the lock held too
> long messages due to the number of entries. There was evidence in
> the vmcore analysis the proportion negative dentries in the child
> list was unusually large too, similar to the proportion of system
> negative dentries.
> 
> I should be able to grab the vmcore again and get more details if
> that would be useful to you.

No, I don't think the vmcore would help thanks.  What I want is user
experience reports which describe a symptom which is problematic.
Saying "there are too mean negative dentries" is, but itself,
uninteresting.  Saying "When I do X it takes a long time" is much more
interesting.

> 
> While the unbounded accumulation of negative dentries has often
> appeared to be a problem, and the case Miklos and I were looking
> at implicated that, I also thought that traversing the entire list
> of children to set a flag based on the parent dentry was not good
> design. After mentioning that Jan replied (wrt. using the parent
> dentry instead of setting a flag on the child) saying dget_parent()
> was high overhead. I let that go even though I didn't understand
> why dget_parent() was needed. Using dget_parent() would only ensure
> the parent dentry didn't disappear from under you (it wouldn't
> protect you from deletes or renames) but dentries are rcu managed
> so an rcu_read_lock() should do the same.

I think the point is that adding/removing fsnotify watches is relatively
rare, and testing if a watch is present is extremely common.  I wouldn't
say that dget_parent() is the problem, I would say that dereferencing
->d_parent at all is the problem.  Almost always there are no fsnotify
watchers, and we need to be able to know that with information that is
already is a cacheline.  So a flag in the dentry is the right thing.  If
it takes a long time to update the flag, then that is a price worth
paying.  If we can make the update faster, then maybe that is worth
while.

> 
> So what am I saying, I'm saying that I think the list traversal
> that was causing this particular problem can be eliminated. But
> that doesn't do anything to come up with a mechanism to better
> manage negative dentry accumulation which I think would be better
> done as part of the dentry life cycle than as a shrink operation.
> That's just my preference.

It isn't clear to me that we need to manage negative dentry
accumulation.  But I'd be happy to see some evidence.

> 
> > Allocating things that don't get used much isn't intrinsically a
> > problem.  We have a shrinker which will gradually removed them - or
> > less
> > gradually when memory is short.
> 
> But if there are Terabytes of memory it often doesn't become in
> short supply.

So why does the large number of dentries matter?  Genuine question.


> 
> This might be able to be better managed by updated or possibly
> expanded settings based more on number of (negative) dentries
> than memory size.
> 
> TBH I haven't looked at that aspect.
> 
> > 
> > But maybe shrinker activity itself is a problem?  Is that it?
> 
> Mostly only in so much as it not happening.
> 
> Problems with shrinker operation don't come up as much as they
> used to so I don't see that as a problem myself.
> 
> > 
> > I think it could make sense to separate positive and negative
> > dentries
> > on the d_children list.  This is quite do-able, though there is a
> > small
> > cost when a dentry transitions from one to the other.
> 
> Not sure about that.
> 
> One thing a negative dentry needs to do is maintain it's
> linkages in directories and such so it can be located on
> lookup to effect caching benefit. So separate lists might
> be cumbersome and possibly problematic.

dentries are on lots of lists.

They are on the d_hash list from the hash table, and this allows the
name to be found in the parent directory.
They are on d_children which is mostly used for freeing up children
when the directory is removed from cache.  It is also used
occasionally for readdir and for a few things like the fsnotify usage.

Neither of these would be affected by using the d_lru list in a new way.
There are currently two sorts of lists a dentry can be on via d_lru.
Adding a third that is specific for negative dentries would be easy and
low impact.

> 
> > 
> > The only other thing I remember from the lwn article and the various
> > other articles and emails it referenced, was something about poor LRU
> > performance.  Lots of largely useless negative dentries push more
> > useful
> > positive dentries to the end of the LRU and we lose them too soon.
> > I think that can be addressed by having separate LRUs for positive
> > and
> > negative dentries, and giving them different weights.  I think the
> > cost of this would be tiny, but I'm not confident of the benefit.
> 
> Or maybe adding negative dentries to the end and positives to the
> front might be simpler.

An LRU must have most recently used at one end and least recently used at
the other, or it isn't an LRU.  Treating negative dentries as not
recently used would be wrong.

> 
> A ttl might be useful too, use it to discard stale entries as they
> are encountered (although the discard policy would probably be
> somewhat more involved taking into account positive vs. negatives
> etc.).
> 
> This in line with my preference to mange these "on-the-go" so to
> speak, not necessarily related to any functional parameter
> improvement that might be possible.

I think the big disconnect between your thinking and mine is that you
see a problem, deduce that it is caused by a large number of negative
dentries, and try to manage the large number of negative dentries.

I see the same problem, deduce that it is caused by holding a lock when
there is no need to hold the lock, and I rearrange the code so that the
lock isn't held.

Neither approach is intrinsically "right" or "wrong", but one has not
been addressed after several years, and the other is addressed with a
handful of patches.

Thanks,
NeilBrown
