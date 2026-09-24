Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37523DB30B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278506; cv=pass; b=a6mYNX35CHyerKwbinpdJQ4yndd8TWeQ2Uj1Tubj8vop1lgY40lF+3Q4zzXQzzH+WUih8UifTo7ir9QQLx4k5sCzvk4fSL1wTjWUQbUgNSvClWBfl3+oGqrXn80HnHUOSe5KJHoKFGRLEvbo/NnlxGN+2JyPy/eWaT2+ZT1aOek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278506; c=relaxed/simple;
	bh=Xh6cigaJGh2nl2K1gfL4NfpjbUyrPHxMoHdW4U9oa2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYgJF1X5UvhiXcN3X3KgBNQJzPkS+/3iUtHg7oEB6tKy0C3ZzkwKsav8gOGiukD9Nb6GWSMjVrdYtQ0JKdAUDh12D3rG677KtpYXb2yYbYNw3a9Ee6PUMJUO3p6PVmVEHLfOtIhMyOeT/kOCW4K7d8EE0YfRZbjrlSYfdTe3Om0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BrEolTOi; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BrEolTOi"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so716475ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278492; cv=none;
        d=google.com; s=arc-20260327;
        b=aeC4YZbfB1Z8MY3uCQwDeQtcq/0MFgXKufCKQ2nfjdpYEQlM4u+CKL+7Rb1OJ6uQx1
         4/bkKXWSJ+JTR8H1ruZQ/E7q/1vz0mLMvYNiTrtJ5g/iCe5AHhqrrEH/4rg8oB82jaPg
         +zc+PQ/ocB0QLMkq4JeL5YSMMtPany6zVCYw0OxdmwDIo0zbR+37c4oCFs4qd6yfWUj5
         n33hbvtN9JlOajG6XGQXSL/wOwKWJzzyxoDUzie4Y9rhNBJEAMzhzm3NLphxfLtQwiPn
         h7g62FimAW3UTyUjgPKrQJEdw2Wd28bIUxr9c1/1bDkXyi6tYDQaZ50rTAwM+LOaD/HB
         HCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRSn02XFlHAYU71ZYcqdkqquo3iQQ46lCWrb5uNEf70=;
        fh=Kj8tapVKkyRr0cZDfVyH7iUI4C3pOBV6eqypzqV4Jm0=;
        b=NHsh8k9a22f5Nzadvo4OCs3yC0nukFNBmSTMavdPV9UQ0ZeD2hr/n3Mog/VJzyreNT
         IP/SkfISP476axPm65FLvgGvM4LIrjMOQAbKrxt/r3gPiBKKYCDRl7FbAi5fLQyhGT4V
         t6/PE4PfsENk4YyFbxZrLXcxHbSolsDcX2SrOQXJM207i4OpATGEK0Cl/j2WijETitwv
         RzRfHNgZvrp/ta975+fm5rk/lSFFvnBLa7YaM46d+rsgT9x/mrBkYmQv5mSO1Ulr/y9a
         DbUh1rbcMWpcvomIyFTYTRB263hpZlgaSMWlApSXR+RZPRg0GjuXLzvSQCo+Q7cxQGzb
         UoVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790278492; x=1790883292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRSn02XFlHAYU71ZYcqdkqquo3iQQ46lCWrb5uNEf70=;
        b=BrEolTOi0ZFLGwdiqIocwy+8Nm8yKuI93x1FcsnJrcqPvyYPcC7gKpLMNfJYGEAdj8
         MrwtTQb92GMtS8P1PeBocbTgEk8V2GRVAghMuNw9sWsXy59mmtAUG0CFnfRnn+gqk84+
         OsLopjSLL5WPwUZi0k+lgf8+SdnW1mFd5NiVdc9YDA9rxAv2AQZSUDuyCgTL3VN/U55d
         5cNyrwzL8WKyZVo+sfBkSUsTxQgNSqcZNVa1Q60A4v/VCal/aiafVFk4jeHEJwaH1bBS
         LrUqREJxTykqnetQvwBpUgOKECBH7cAstw2MymTvAvJqZXs4f9Z/B/AgYmfcs4T19blb
         TgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278492; x=1790883292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRSn02XFlHAYU71ZYcqdkqquo3iQQ46lCWrb5uNEf70=;
        b=GtWV+buWiRbYWkjg1Q/ip842D2DDE+gtwUqNGxVNAq2x7ax9ZVv4KyrjQj/ryUO1aI
         WAONF0qjYavCXQ9lqKIUKwrcXljHSUBg8E0k+KgkepHgo5ZTQzEWl3zgCiTFKtHjcfVq
         nnT93ZHjBpgrcMbn2XpEJM9JSFZsWu3TkXJiVDfXd5HgOm8DDgNdy34uR0Aaj3Wik8/0
         8f33YE7SijP/Kul66U9ftKrSRwfleUcQL4ydBI00mRMSGX/3zdHScdBaiXPOF7gHETA5
         UJPV2H7vFRhbjXJcm9jYEkSrUZREcRpVd3WL9ilYHTpWf0PlK5DnMa9fGKo6JFqIreBu
         TbDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxbxCBUhf8c4bMUpSqRaOPLOczn4n9/vtc65lNn8YMTD7DWlh/HV8uwc7RyxewLxxgDcV1EYKt0ppVyA0=@vger.kernel.org
X-Gm-Message-State: AFuF++lExp3J93gBCsC4En6tXc0vZPx37TuJgKbP2BZmh7bX/nSvIfWT
	Jw/xQKHglHvosUpHRyTx5BG5XRLW8avaXIwsNsD2NWMKIyUJFyWCx9sDkA+u6PvDuezg5F3URE6
	vwG9oxScM4SRhSodA6HmjL9GANX6GSpoNbAjo+aPO
X-Gm-Gg: AYBFou1y9UOKwu95/HUmClrCmn96tG/G7Cm4YIAB5GkcGS8n7wggzA5aNV/4XzpWWDk
	Yk/TkSt/tg3B+oKTOfXWajhsglMi+DqJvnTtiDh2EzwFKe4XWoqfhqjfKL702bi5mf5aCWQ1QfN
	+lCUzmSpz5SjJfAMC596rZF3rHQzuiPOk8zAexcl825fWAYGZRYHLA4xO+QfgDH/F72ZwQf0eVy
	Xu3mFgOA/PoirDrT/v7s77d5jmMLsjscLBoeR3E1hFJEspBfW2VOTfvpTmuC0KFo4YrqYJXDHU2
	QZbZ7g89RsMFJJ6VTWl4haX5FQNYRRdxtSZPrinLT87q6ltUD26Fgm6a0cSGcbpsWlRMw/hYzk7
	PhxxvUkdst7I=
X-Received: by 2002:a17:903:19e7:b0:2dd:c053:82fa with SMTP id
 d9443c01a7336-2df7dfd5d68mr33739235ad.49.1790278491614; Thu, 24 Sep 2026
 12:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
 <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
 <arVKSpezisxe3pkr@suesslenovo> <CAHC9VhSwbHF8tZkZ00JM40VTBeXVgcVdoBt7NcX0XKaKSARWug@mail.gmail.com>
 <arVkWs7tG3ayGxyX@suesslenovo> <CAHC9VhTzGJz5Lt8tXYzJfMihsMOX3Wa=6b83dV8QihpRBfBbWw@mail.gmail.com>
In-Reply-To: <CAHC9VhTzGJz5Lt8tXYzJfMihsMOX3Wa=6b83dV8QihpRBfBbWw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Sep 2026 15:34:39 -0400
X-Gm-Features: AclHuK_3RmnxFwfWOEc5RzC2ZEn68Zk0RXtvqz1D3LH-whkeqU9xYC9Rbdxv0Yw
Message-ID: <CAHC9VhRuFWZtxqcH3kfRVgM42dR_9P5QH9JN-dkpudgx0LGUXw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Justin Suess <utilityemal77@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	alexei.starovoitov@gmail.com, brauner@kernel.org, john.fastabend@gmail.com, 
	memxor@gmail.com, kpsingh@kernel.org, matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:33=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Thu, Sep 24, 2026 at 2:38=E2=80=AFPM Justin Suess <utilityemal77@gmail=
.com> wrote:
> > On Thu, Sep 24, 2026 at 12:23:13PM -0400, Paul Moore wrote:
> > > On Thu, Sep 24, 2026 at 12:15=E2=80=AFPM Justin Suess <utilityemal77@=
gmail.com> wrote:
> > > > On Wed, Sep 23, 2026 at 03:14:28PM -0400, David Windsor wrote:
> > > > > On Wed, Sep 23, 2026 at 12:57=E2=80=AFPM Paul Moore <paul@paul-mo=
ore.com> wrote:
> > > > > > @David, simply for my own understanding, did you ask Daniel to =
do
> > > > > > this, or was Daniel operating on his own with this patchset?
> > > > > >
> > > > >
> > > > > Daniel and I work together and both have things written on top of=
 this
> > > > > kfunc. He reached out to collaborate, I agreed. We're also going =
to
> > > > > send bpf_set_file_xattr shortly.
> > > > >
> > > > > This implementation was chosen due to its immediate mergeability =
(it
> > > > > only touches security/bpf), but was actually suggested by Kumar i=
n v1
> > > > > or so of my original series.
> > > > >
> > > > > That said, sorry for any confusion about this appearing as a new
> > > > > series rather than as v7 of my previous one.
> > > >
> > > > Howdy all,
> > > >
> > > > Hope you all are doing well and having a good Thursday.
> > > >
> > > > These patches are excellent and useful, and have been in the pipeli=
ne
> > > > for a while.
> > > >
> > > > In the interest of moving forward:
> > > >
> > > > Would you both be able to live with the following: provide a securi=
ty hook
> > > > for lsm_get_xattr_slot or another proper interface with the necessa=
ry
> > > > abstraction, and keep the kfunc where it is in fs/?
> > >
> > > That still doesn't change the fundamentals around the kfunc: it is
> > > really only a valid to call it from within the LSM inode_init_securit=
y
> > > callback, it populates a LSM framework managed buffer, and that buffe=
r
> > > is then used to by the LSM framework code in
> > > security_inode_init_security() to do the xattr initialization using
> > > the values from the BPF LSM as well as all of the other configured
> > > LSMs.  It's very hard to see this as anything other than an LSM kfunc=
.
> > > I worked with David over several revisions of his patchset to review
> > > the code and get it in a good place, I'm supportive of the basic
> > > ideas, but this really needs to be located in
> > > security/bpf_lsm_kfuncs.c as it is an LSM kfunc.  As we've seen there
> > > is precedence for subsystem specific kfuncs located in the associated
> > > subsystem's directory, things should be no different here.
> > >
> > Hello,
> >
> > I'm less arguing for any particular placement:
> >
> > More so that the concrete security interest of just getting the kfunc
> > *somewhere* is much more important. I have no doubt that the function
> > would be equally well stewarded in either directory.
> >
> > The xattr kfunc in security/ question can be fought best in a different
> > venue where it's not holding back good contributions.
>
> This (the mailing list) is *the* venue, and sorting out
> cross-subsystem issues isn't a foundational thing, not something that

Sorry, typo.

/isn't/is/

Sorting out cross-subsystem issues *is* a foundational thing.

> can be cast aside because it is inconvenient.  In this particular
> case, resolving this before it lands in Linus' tree is that much more
> important since cooperation has been "strained" to put it mildly.

--=20
paul-moore.com
