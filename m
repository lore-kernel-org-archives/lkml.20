Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A54AA593
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368918; cv=pass; b=uMYkBEhItpFrjSU9jjMlljpo612T31Dq8c0xhr9YCEa/5k0Csq4s+Prb2tfEC9d9/3jt2L4QEa/TqFIgp4/3B2OL3s57TqO78HOEz98RPlrwNXPYca4X3HRy1CYMwLESliTKoJGAAcYSYcQ3qf9hBkoM1y33McWTNDaEqt7hg/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368918; c=relaxed/simple;
	bh=QG1zjpJfnhWFEvPDt5X/M/5gI6ZKh6bIpAbhyhDnR38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+mv++XJ7V2y8iMjsh3eyoqJnwxeIlQJs0CNdJiUY1lBxHND+/Ev9UyQcCVRb0oYWLQNey1kF3Co5j3jaLZCkVWffxTALrJ/qRWLdwh2/8qNTGQVRB7OjYiHbPrmqk6rT8B12QyGjqBn3bVxsaRv60y2CydeHbCFamBizqJGtx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny5VfGDq; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny5VfGDq"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2385634a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788368915; cv=none;
        d=google.com; s=arc-20260327;
        b=rcJ3pqvGDSuhv+ZiZEmeQygQt0RBfW1JByr7tFQy3tAoH7bpadoHd99zNOxddZbnIR
         6tbgyPQ+95+2U6nqgdL4bBiXSTlvWPbxuKSsUalzOP+dNJBf0VKbShzYXjZ9lQuwfYON
         RTe/TTAtsRpbmNwL37zsxYrNDi/tHHrfAFoqdotS6Yq5R4qwQsYwixNxVJCBA9Sk1I+Z
         97Gmn/c7jC9V3ERPbE9zg2EbsXOSfhtrTZK7MSkOellyBYYE56AKLbD31EQBwkf9FX/b
         HunyBmOc5EOCDV23Y9TspbARYtOKl1phNEn4jeQURhsDXYUd9D9HYyOjvDqsL9w/4zXz
         H2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmtfEAR2Y5+urGpoDjih/WPk1lE/DVfGd0l5q6mP2NY=;
        fh=elEMQ4yqTPMr21qwLbtv/1q7Uy7+B90wQze9ixJQqMo=;
        b=EI9JingSa1zz7yBuRhz5EieBVqs9EXHQc9RSzfvscJKgtlHOalnZTZOx1Q0f5SLCCb
         daQKpwO5p1I1b8RoZ/vzbO1F4Bh4z0+7cUon8xZI8i3jk8ldhB9jFhezmZn9AQKLvTgP
         9+HXmYSnwkurxJxwpJvTM+aB+tNVrM4oouQfN0JzAzCOtFNOko+Oi0qr0/kwFe1gSmPE
         gaAMnvn+I4bNBoGWc9K9wLC0bLxCV/irvVb50SRgPxPebOkSyeFgTzws9rHe0jLsyyPb
         LTi+RX+YWbb9ETasX70zx3i8IbCNV9WVePoEJrbmh8cy3FKUbAOIs/hNJeNpXT9iSvx+
         PR1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368915; x=1788973715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmtfEAR2Y5+urGpoDjih/WPk1lE/DVfGd0l5q6mP2NY=;
        b=Ny5VfGDqBvl9g555impHScDfYeJl6q6z+FpmGwGnOZKycYBB/t2MaS4q5w5Ihip6/z
         Wn3EH65g20PwA6opZdNmqAoVDyvuqRgWCQ7NHqv7E17sTC29vDmVDEqwNVbUfsXlctb8
         BDI2QrOUZF7Qr97eOJHl31bf8T9YSF2EUhE8i2bPCizPEWb+wlzuVf/THxYI7iZeng8L
         bkQ3XTHlBrwuItiv4saFIH2kPHJo37jOODEoXoFZh5bJHeU64d1i80kcBcuRlP6wlzdL
         NRNHcxo95EBlH7kgs1PZA5pNYvDAi/Hlx5/j6PvCubq4xmTl2MXeYjXYIfVC15gnAurj
         Sh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368915; x=1788973715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmtfEAR2Y5+urGpoDjih/WPk1lE/DVfGd0l5q6mP2NY=;
        b=tRV4IyryXwUT27rcvg9wx7khQAfwDR8QiYT+aqJfosTcwZwmiulKkfWm9T5xaOGwbI
         c3bHOOqieReUwOKdNXDE6h5pLeEL4ievUClgnC4vHeqIdWUutMyn+w0LOrABb0YhR0Vw
         jK57G2DtFFw4dGUqBQVICFnX4jgON00xvYZ67CjR9A6vxd3uENoLCC6kQSP/hNzvUEW8
         S0oTA/o8jMDjTnSKerjcvN9j2ZaIY+8N2ex7Feu6jeq4KoQbkJGqX80Zzk1nEnof4VW7
         iSeuuezoi/SWPVjNznmstxnvQILsoTwq8ifNDotvIw1QfZwTNF7OIxGi0zpP2fbtgoog
         qgcg==
X-Forwarded-Encrypted: i=1; AKwUvByDcQ2SoeNSFbyt2O7SC9uiK1ElLucU7CwmmxhaG+Ae20w2rcFiPHk5qTetWDgZ1p+odFmPIgLX1QKGs90=@vger.kernel.org
X-Gm-Message-State: AFuF++mf6QWt0HJM10VtQGNHfRia4DEfKa/SGla9ch3LeET6S+avyn9T
	zwEoSxPU3Ycpoh7RFo/ulhB0tXxukD9oeev9hFT+caWgqFG+XlaiZzswFPd5gW3HvN1r1B/jAQS
	McUA4iG7Fx7maBC6H6+NIQIEYSvoDjiI=
X-Gm-Gg: AYBFou09AFUwv1nfGi578UL8k4GnkVrDM5+RkJCjKWCqAtfMPEHVYFMN8Q3gS5HftpA
	N1tBbLd4u1vfc3SOguZIsyeMIEeiqxMd9tZv82S83rhsJywJMcFanmymOx8IEHz5rra8X21XUcj
	Ghv5+iz9qlvBgQlrEkMjxrUwvy1NRaK0BfHj/zxTdPJixsx9Mzk0/yEJzWowCJc81qTHAuCX+ti
	ujrhODxukyS9/jJ6iR4etW4yKvC+mY6mX1eQrsTevBiD/dxuVDZOHJ4b2R7p1CljvWtJb1ZVqhH
	WKo0s5aZ/27dq7creHA/wJ1RSWcfj+llq/Kc29/wXi67WQ==
X-Received: by 2002:a05:6402:a203:20b0:6a6:8dd5:ef33 with SMTP id
 4fb4d7f45d1cf-6a68dd5f003mr1625715a12.20.1788368914490; Wed, 02 Sep 2026
 10:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
 <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
 <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd>
 <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com>
 <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
 <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com>
 <6n6r5zvcu5ojihyb52rhejlky7xrn2a2p4l2cgfut5lsscunek@bcnpy7bifjrs>
 <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com> <3ds635aoslm67h5exattggmcmitru3owqrryexdq6ue5nubh4j@cmbhmsq6xdgr>
In-Reply-To: <3ds635aoslm67h5exattggmcmitru3owqrryexdq6ue5nubh4j@cmbhmsq6xdgr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 2 Sep 2026 19:08:22 +0200
X-Gm-Features: AcwNN1UUgRWjh1gt6kF5dNLawq-DAT70hONdPtxUPiFx1STkZP2ICll21p7kdxw
Message-ID: <CAOQ4uxj4sYikVUEhV1pdUdzoq2U4pBa6RheZa7a0WanBmXkEow@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Jan Kara <jack@suse.cz>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:52=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Tue 01-09-26 23:53:48, Amir Goldstein wrote:
> > On Tue, Sep 1, 2026 at 6:57=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > >
> > > > +       }
> > > >         res =3D __d_find_any_alias(inode); /* recheck under lock */
> > > >         if (likely(!res)) { /* still no alias, attach a disconnecte=
d dentry */
> > > >                 unsigned add_flags =3D d_flags_for_inode(inode);
> > >
> > > Thanks for looking into this!
> > >
> >
> > See attached patch (again helper named debatable).
>
> Thanks for the patch! I have somewhat massaged the changelog and names an=
d

FYIW, I like your simplifications
and changelog definitely needed a touch up.

> sent it for inclusion to Christian. Since this is messing with dcache cod=
e,
> it should better go through his tree (plus I want to give him a chance to
> stop this somewhat hacky workaround ;)).

We'll see...

Thanks,
Amir.
