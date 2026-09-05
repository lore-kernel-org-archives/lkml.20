Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD937FF6F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594515; cv=none; b=BDKsD6QQMMvIvCxEuAZenRWCls3pvcLNLvTzC23dc9Pz/hMjumYkcKjjsLMd9qnYq7Uzj91WjL1ivTYQkkn8gMsIoDW4cAcbDSVki+3pyKeDi3iRgq1klI7ptvM+31orzlhn+JtOkKtgooyATdAY4jRjOsc+VNPrV/HsKVzYcpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594515; c=relaxed/simple;
	bh=z87nqZfl6/uArN3V8s4jwSF5APnYyEKM/id1m3lluM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scSGKnS1DHotRMp/RMuqdhBQuhbkIvneNtvIIjs4/VdHnM5drqkrdp8R/rNSgLEsgRr3jvkxQ0KDwzv2nOpblTVD+L6AA7/wlcg+TKb+8RpFllXsjIvD003Ge/Ft7QTItKPc2/qNxiYWnqbpS5BrzxemlQc6G/yx9y4WaSDQfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JSQUAxzP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JSQUAxzP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482ea739de2so1191156f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788594508; x=1789199308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z87nqZfl6/uArN3V8s4jwSF5APnYyEKM/id1m3lluM4=;
        b=JSQUAxzPX2o9aIZe/H0Vp7zaPSlg0k6FPTWHnyJ0/v3ZjwncVuLJQGEItCJ1Y2emQY
         hB3ppu+pM7fyy3PTzKptny1AV4wG6S1CFsngv0bOibDQN7FySIawU8H2xlibjZen4gsh
         xt5Ny8DHuUoGDkQ2/AWix5GEXChqHZn6noVl9v27rMOGMij8cT8guNCyXY9ZOxoqndZ0
         wTVzzMQ7f4hxe1+n9ghpcUHpWyLGeGgFw8G0yUKOAjCwRlthppyoeDrP2kAJKtq3khcp
         U6rpYfMxOI1sPHFxiaX3OfHKAKLTuIX0hQcmEEdiGLDiwKx3uA4d2vrk1n7OfhBFGwMM
         nzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594508; x=1789199308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z87nqZfl6/uArN3V8s4jwSF5APnYyEKM/id1m3lluM4=;
        b=ZIGGe3rZTyvGCHni8G8RRATL5QHHWU3+z/mnnGV0NHz0vZbkzaUfUuT8arCUKYfkkx
         XfA1WUNHo6rFobHho6zQjlEIryxtNn4nE+bCOxOKyRFl8+MuHqTeMnWSyHc2FZmxGw4S
         UuqN2Bm0FPbkSLKHQcvjnKfeEmz+wTaK2hMng3aKIys5J+JAJEpAw5hVYNl+CKW57Wb1
         Xg9GcCh/rDZj+RfJ0i7ncMQXigF+8kvm8avSCilOIrbBHVdwCkrfugLdCsBpXGCQudB2
         am8OvVruUcyKWxeTviJ2rJemegq/j8nahBkNfPWmnvhsi1jmBKeqMPMiEXCsiNcwZ/5j
         swPw==
X-Forwarded-Encrypted: i=1; AKwUvByieuvUF341MT3e3WN9dobCkTY6EIxgkyc++p0jRuiP395G6LhJgl8+KeWYX1MlXiKxzPyz6urxDix2PsI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNJu91sqkXqDJ4wGiaWUNtAGod51GXjpWidtH9jHBz2mVeWOXs
	CMOJnQTflU5rWPH6G4mLCjyUpM0uQ4xrOWNomdmf9Mm6AoFtVudK/kq9X/4rQkwbzbw=
X-Gm-Gg: AYBFou2wvaJzKn3Vu8x8e+ZD6/8w+t2+KTZmjqETgRq7tpaJNGJ6/DOLvOctUGZYS7w
	+yvQeMoapOsi3ND9sV+/l0970FDwYwI3MHB6a0lyth0GHU8CCGioXi+BJUQsWSYEnsoB8emH27c
	ulCU0kGYjTZKO7wvHl5PJhb4kMpEH6TuKvr4DChK7hM6LFz0s01ZQ7jYOpNyYnTKFHRipNcmyJk
	iUOwkT/CDoSAi2Dilyocx3ia2/I8zAg/Y+YyRp/80GTKjmGC/QQgHhyQwWa8v9v3qdOQIm8FTD+
	XvmktoL1+mcHU2YBEr28IDjN+zcn+/FxBIKHeCQMRFtbx02RC5UFz78C6jPRdEeXVkFBrcLylnQ
	XQL1/bxYyxiybmHNJgjtjwS4WMa+XPubvExXOJojdRffHFQDlQjPrC+JLu5YmDJ067FuMJiiXR0
	cdR1Uh0+K5Av04gsR/DZs7yirmIuF3qxQEXi0nmhhKpGrAg4TcNCr6L2ZoO19Lht44Gw==
X-Received: by 2002:a05:6000:38c:b0:484:3fce:6ad2 with SMTP id ffacd0b85a97d-485872cd602mr15031339f8f.15.1788594507963;
        Sat, 05 Sep 2026 00:48:27 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4858bc74298sm9121623f8f.6.2026.09.05.00.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:48:26 -0700 (PDT)
Date: Sat, 5 Sep 2026 09:48:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, Doug Ledford <doug.ledford@hpe.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
Message-ID: <apvFrdwv1djxwcq-@monoceros>
References: <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
 <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org>
 <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
 <07dcd177-bc20-416e-accc-9c137d70a5d6@acm.org>
 <CAHk-=wj1rTtCXQVf-_doFT0KbnCDObvuoG0yEv8eH6V+Yq4=vg@mail.gmail.com>
 <d5c64d53-1d36-43c5-9122-8a57b4bda9b0@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="565jwls4q6iwnrgn"
Content-Disposition: inline
In-Reply-To: <d5c64d53-1d36-43c5-9122-8a57b4bda9b0@acm.org>


--565jwls4q6iwnrgn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
MIME-Version: 1.0

Hello Bart,

On Tue, Sep 01, 2026 at 03:46:45PM -0700, Bart Van Assche wrote:
> On 9/1/26 1:24 PM, Linus Torvalds wrote:
> > This is partly me fishing for some poor soul who actually *wants* to
> > maintain this.
> It is well known that the official repository for sparse is
> git://git.kernel.org/pub/scm/devel/sparse/sparse.git so I think we
> should keep that URL. Pushing changes to that repository requires a
> kernel.org account. I lost my kernel.org PGP key about nine years ago so
> I will have to create a new one and get it signed again.

There is a certificate 8352E32F03C2DFEC with your name on it in
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/. I guess that's
the one you lost access to? There is another certificate
715C3D35C5CE1009 that is not in that keyring which has the email address
you're still using; or is it that one?

I guess we should delete 8352E32F03C2DFEC, and ideally Doug Ledford
should revert their signature on it? (There are two more weak signatures
by Christoph Hellwig and Martin K. Petersen that are probably not worth
handling.)

I recommend using an expiry date on your new key and joining
https://lore.kernel.org/all/lpcosse2026-keysigning@baylibre.com/ to get
signatures on it if you're in Prague for LPC and/or OSSummit.

Best regards
Uwe

--565jwls4q6iwnrgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqbyUcACgkQj4D7WH0S
/k7Hrwf/aOcdi2phAijAtsdEb19bkgmh55AOYZs8Xzh7cyFzOTQDCb+OVWyyev6e
ZZCZIFpTAcT0mg+w9dWePj/WMnk3QDWy3kOy/RVx95K4ELonyjFIqsJqg6E3H3mw
Qushg+gRTA+HDkRz7jqmptbmY63Ktq32omA8VW9C7JN1c3eqznfRgt5bs/sKWSwx
9a6Tst3KCJiY2SIQYbOJnjvMteCxI9dDWh163b67WetqLfafZS3YiEwxrXwpDxg0
FcjGk5KW5rI3lpnKzie0dWpfBqUaudvKsyCqK6pc7dvQYpY+5arOK36FDuL3hG8G
gc72Q0rQjGZshtLqVUcgs75uA/ypsw==
=bNyw
-----END PGP SIGNATURE-----

--565jwls4q6iwnrgn--
