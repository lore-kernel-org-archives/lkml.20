Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F706582BBC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156562; cv=none; b=P6UnmpbR+/Zl5G/KKEhlSZbRg9vB+mDC+3GMHLFfEQl+zZdcVvRicCFD3Sitl5hhC8mYhjIHX5BsxD/8BGgelHGJNxfGFgxawxdUofFVqivjy95jhIzm8IvrBWoLiBhKmJ2OM9xkdh2Mq8cIcQNtcGqdI6PY6fFHLdl2VcfAZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156562; c=relaxed/simple;
	bh=ZXn9b98sKbqLypZH0aIB7sqpEcIF9OpKxPnoD71YjMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah3cVOikS8MbEbhN+RchtOJWBX15C8C86xXt6SkODcS48UyU0ZiPvAg652LDui4WCp2o1q1Y56sirC6RPQ9WZwFC3/9weB2YvvEB9YRcttQSy0yz7sX0nPZK3QPw/iryqeYvERUvHQyvOhFnq812NU2hOWKM3O+MwGHSX/3GKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=kJSDz+pX; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="kJSDz+pX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZXn9b98sKbqLypZH0aIB7sqpEcIF9OpKxPnoD71YjMw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789156554; v=1; x=1789761354;
 b=kJSDz+pXen2gTMr1K0N86h4wRKjFiyAc/HKeSQWnw/28uOwJbmU5uVlxHTBaeQv3pzXvqYJj
 40LCwg4AatMLsX2n4EYIsvaNxgqnHLsrpXCv3o8PSs83iTl+V1P/qZ0Z3Vj9yyQlL+TC9m+r0lv
 Xq1FO/miLdTZbtzJjj/N4vbxqDAM7/IedK7z9Vlcf4kd6qoRg7p7+prKd05UlrJAwB+/pElI6ER
 QdchZlFoq6uh4Af/VyDWvuG3GiOiM7K+ZqWokgtteb9ftwSNv7B44r2ZYxDra3knNRiRkPM32Zh
 VWOwxM8w3fwF0QnYh1pToFnRvTMTB95bFqzqdKs6iOpYw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8e3bd5d72649b28d;
	Fri, 11 Sep 2026 19:55:43 +0000
X-Mizu-Trace-ID: 8e3bd5d72649b28d
X-Migadu-Flow: FLOW_OUT
Date: Sat, 12 Sep 2026 03:55:40 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_TW: add process/applying-patches Traditional
 Chinese translation
Message-ID: <aqRcvOC72e7lna0J@wyuan.org>
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
 <20260817-apply-patches-tw-v1-1-c182c1c425ba@wyuan.org>
 <CAKspUh+bMqOYuV=uTRr35wt-xWd97YR=dfDQGoAvF5MjujOZEg@mail.gmail.com>
 <aqKgJh6MfOTS0KtQ@wyuan.org>
 <CAKspUhK+60mzSnh+_u_+8_P99LG7LkDp1xp1_feSgd0_ax5s1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhK+60mzSnh+_u_+8_P99LG7LkDp1xp1_feSgd0_ax5s1w@mail.gmail.com>

On Fri, Sep 11, 2026 at 04:50:39PM +0800, 葉宸佑 wrote:
> On Thu, Sep 10, 2026 at 08:18:46PM +0800, Weijie Yuan wrote:
> > > 5. Missing .. _tw_applying_patches: label
> >
> > This kind of top-level label is not recommended/allowed right now ;-)
> 
> You are right, and I checked: doc-guide/sphinx.rst says cross-references
> between documents need no special syntax, just the path. Withdrawn --
> sorry for sending you the wrong way.
> 
> Reading that section also makes my point 6 land differently. The same
> text says:
> 
>   For most use cases, the former is preferred, as it is cleaner and more
>   suited for people reading the source files.  If you come across a
>   :doc: usage that isn't adding any value, please feel free to convert
>   it to just the document path.
> 
> So the two files in 2/2 should converge on README.rst's bare-path form
> rather than howto.rst's :doc:, which is the opposite of what I suggested.

Sure, but I didn't directly carry the concern from the CN side when
sending this series, so now paste it here now (again) for reference. :)

<20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>:

--- >8 ---

The second patch updates existing zh_CN references to point to the new
translation.  In ordinary paragraphs, the absolute Documentation/...rst
path is used and is handled by automarkup.  The entry in process/howto.rst
is a definition-list term, which automarkup does not process.  It therefore
uses the named :doc: form as the minimal explicit-link exception, without
reintroducing a cn_applying_patches label and using :ref:.

RFC:

I considered the two competing preferences for cross-references. Jon
recommends using a plain absolute Documentation/...rst path, while
another view (I found the discussion in 2021, so I added your email
addresses, thanks.) is to avoid :doc: markup where automarkup can create
the link automatically.  I follow both rules where they apply: the plain
path is used in normal paragraphs.  However, this particular entry is a
definition-list term, which automarkup does not process, so the plain
path is rendered as text rather than a link.  The named :doc: form is
therefore used only for this narrow exception, without adding a
translation-specific label. (Seems to be a workaround)

I would welcome guidance on one stylistic point.  (Since I missed
previous discussions)  The surrounding entries in this definition list
use :ref:, while this new entry uses the named :doc: form because it
links to a whole document without a translation-specific label. Does
this look out of place here?  If so, I am happy to follow the preferred
cross-reference style.

--- >8 ---

And, I think this might be the best way to avoid changing the rendering
method? Although it may seem a bit ugly in terms of the writing style.

(It's been almost a month now. I might need to review my statement to
see if there are any mistakes.) Sorry ;-)

> > It's kind of weird that this series cannot be applied cleanly with
> > Linus' current master tip commit 50d05c7c76c9
> >
> > Did I did something stupid? Confused..
> 
> Nothing stupid -- I hit the same thing trying to apply your series for
> review. Your base includes my process/ series, which Alex picked up on
> 18 August but which has not reached Linus yet, so process/index.rst
> differs between the two trees. It applies on Alex's docs-next.

Oh, that makes sense. It turns out that process/index.rst has been
updated. However, I really should have double-checked instead of posting
it on the list to ask.

> > However, since adding new translations is not our current main goal, I
> > will put this series on the to-do list for now.
> 
> Makes sense -- it will apply cleanly once Alex's pull request lands, so
> there is little to do until then.

Okay.

> > > Would you send that glossary change yourself once v3 lands?
> >
> > I'd like to do that. If you have time, you can do it in person as well.
> > ;-)
> 
> If possible, please make the changes while you're at it; I need to
> prepare the subsequent patch series.

Sure! Appreciate it. ;-)

Thanks!
