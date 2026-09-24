Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B93636E460
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278441; cv=pass; b=tThLv3a1EJaCAz5Qcx91oiMmZPjI/875n8E6hwA5mcW04mV8SaUFu06/SHMrA/bE3zHpuSIoO7nKreHUsna+V+Eqt+5D8ys3PaQ7S0unVVWenmwoeEQwl3gfFnyb8MUj0G744KHpAEHfpP7Yby8zbUgkUOBTuBO4NZS6rahUmsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278441; c=relaxed/simple;
	bh=t/N4X0XnQ9obqaKHrk7vetf+dDL6VPJaFNb/XYutegc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIDh77x4lfOdFesgTRqiXi3+wzR2DBgAN+5xDGY8AiRvmk0Pb6wham+IJVYalzBiCMNRWT2vz9LtPIY4YkW/TmdOkSnE4rFNlAEJ0xAAhdzArSynuxc2n5zn9FzUxiO/o24Lt/8OWRejy/HR3NgE0klMPoCneqPzabERWO5m9DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GeD5PrGf; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GeD5PrGf"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso51057a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278438; cv=none;
        d=google.com; s=arc-20260327;
        b=c7RQ3C7AQfT1hzW5QkpfAHiJz+4Ok2yku2qbak9h9zuRKkpg4jnO71qpoUiX46qmcd
         r6d+3wGaHBtvQYt+32QJaIq/PetAnLGRyG1FwgmwD59gNmj1SitfAYL5sQ4/vihszH8i
         TzOs1c7gOachVund0hMT/xMRjcAsW17EJZ8iZ8zQNjGDSwC96GwfRjwrzxg1/qzn9l7E
         /1VJz2aiDUXuzJYywdSCNltScUG/ThfVG1W9Ik/zIKQ64TmqAgrFQYBp8F6gSFrXcGXa
         KASMbaHfrTUt4BvCVc4W466LuMD11h+/dpsr0DYvXud0T7hUl0LMfoyc6W0s7V+qMAVf
         8/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Er0wNZ7ei/sffJZBS6vip8iLxFYHICi+dbdHiy3n2DU=;
        fh=hsxf7juuVpC4Lgg9M3YZWMkmSu6iHG7iiu2ZDqET++Y=;
        b=afkuDm4VPaVAUdAzwps6KJpDMmMMpK9wdg70qn9kw/7kWbYCQnOvI+qt8e/LbLkPr5
         ePb8GdR/sn6+np9hiK2vRVVR/3g4hExpmAxO68TGB8qDmfEnS2tbcz+kZ9iaUF+4a7hm
         lIpxwVuMPny5ACiD0rgsoGJQQXPnbYRYaM4S+ulbwbJ2tPFjJVn2OFvTI698i23TkKI1
         kGsizBUcm7cRkWFDcoeFzbTD/ldcN4nhNyqFddGKETo0BlABY6fASxL9tNO5Tace0Gau
         nwGZvwzsE7adVbecpQn1//FT16eEBbB68t8+/JnrfDu0ZTz4rJOwoYF2L9SYx1FKDbTu
         zRbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790278438; x=1790883238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Er0wNZ7ei/sffJZBS6vip8iLxFYHICi+dbdHiy3n2DU=;
        b=GeD5PrGfMnjZPhdCBFwzGInNpnt3BxrGUjomNh4N1K3ZP9F1k0lDJezDWB5DQhPTJZ
         0p58BADZ/12tdMpaevVRhR1H/JHnK3TS1Tpw3rFFAE/mWivIHgWUUI9Sdd/MAETsSiRA
         L5uWDVMTZDJocm2plpS4mzt/o0nTa98GymvR7SsQf6qUzOZmTHxOW6cmqIYNRh5cnvuX
         G5adkdOY9W3MLY3FeFDEEayolvPNPxqnlkDuuJI3dF9nnyAHmCQMX7vNZZ7aIc5UEg7f
         3b8xoKP5Wo6Ro3d98cJtXF7LGj310r7tDb9CWDqy1UIGlmE7e7JjB+yeq/bAEcsLatJY
         kPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278438; x=1790883238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Er0wNZ7ei/sffJZBS6vip8iLxFYHICi+dbdHiy3n2DU=;
        b=fbdmqBpAZQtofeY6tda5zjtYvHhriZA9rb2aXVrp8LaD+NDi+ZQKhGnO7pMKLNRDxH
         VepI+cqon9l2NlFZ/k/C61UWPra1tmW8+xOdAAJePa8cJ9bsCw7ZZak3ShL/qEU86hx2
         oQCI2bV4aiKe6IkkjS3g9z6iGAy09lLIc5dOcj6QVZhTWkFsCrvf90pzpZCTXGiwTAiL
         PWU9lzIf9grVj5jjBzfOiO1oWtO3YI15j6YHAmRjR46GDvNEEoKoJ+UsVDWOXZz0qDNa
         UDfJ4uNinUIQbgI0+Mxnm2iT+HIXylEugkaQwpjNd6L33pmISqWOXwVKRJXG41Siqizm
         +9Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxqjTTj1GsGolVKQl19PkSeGtMFIuEdW0sL2s5wmLJt9iODgoRABFBIWVEPtxhppwhTTeoqvgajYfG6ymA=@vger.kernel.org
X-Gm-Message-State: AFuF++la9qVxGdtl9hslZthpYmEVQ9hC7614mFzn3Jmi8yVrden72Yb6
	63Ml0itAVrSnauFTGMWM7iEQPCq2TuHSAwX9BhomIgu9D24+nfitbTYIy+VCyyyVVYvxR9sHBuZ
	f8yNBF7Ya4NNefwc6zHPqNLEgZLKo72ZR4eb5jhbb
X-Gm-Gg: AYBFou1+E/dMpK0Sry9AA1KSJ5U7xL/9aktniYIutPMutXv4YPCDnM6+9ObM7mD9O01
	XAV7ea4BfGLK4N9aCHcKhSd28qs1BxmkQp202OZ6HmVKrYl+x61w4Bk8SrjidxibzgDLTXY92lI
	Cs12nMxL90Jm79RR9rq/hFDR3b5KcDnvXeh36n8KfIiLn/yktvDlR844Gz93a4QzvyOefICMwZO
	VEzKYmm9WMIBtMF/FNGyG0SUCov5VLJj9zrMegUL9ygZXRZ1jXUwMpO+PsdO+gU7ITga/zHPA8P
	YATsJoTjpjWaEY0mhcQ1cGyE97K8W9rji5KxE0fZQg0wpGee6GthArlsi0t5f+WZbX0E9/YdDRs
	avtFf3WcZlO8=
X-Received: by 2002:a17:90b:380a:b0:39e:6c69:f481 with SMTP id
 98e67ed59e1d1-3a098d56a2cmr3187553a91.64.1790278438044; Thu, 24 Sep 2026
 12:33:58 -0700 (PDT)
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
 <arVkWs7tG3ayGxyX@suesslenovo>
In-Reply-To: <arVkWs7tG3ayGxyX@suesslenovo>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Sep 2026 15:33:45 -0400
X-Gm-Features: AclHuK8Djm6kng1KVJoAo1IKBHaXUoPUqY4SRBxOWSBr835p7OAm38aVvkcIm4U
Message-ID: <CAHC9VhTzGJz5Lt8tXYzJfMihsMOX3Wa=6b83dV8QihpRBfBbWw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Justin Suess <utilityemal77@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	alexei.starovoitov@gmail.com, brauner@kernel.org, john.fastabend@gmail.com, 
	memxor@gmail.com, kpsingh@kernel.org, matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:38=E2=80=AFPM Justin Suess <utilityemal77@gmail.c=
om> wrote:
> On Thu, Sep 24, 2026 at 12:23:13PM -0400, Paul Moore wrote:
> > On Thu, Sep 24, 2026 at 12:15=E2=80=AFPM Justin Suess <utilityemal77@gm=
ail.com> wrote:
> > > On Wed, Sep 23, 2026 at 03:14:28PM -0400, David Windsor wrote:
> > > > On Wed, Sep 23, 2026 at 12:57=E2=80=AFPM Paul Moore <paul@paul-moor=
e.com> wrote:
> > > > > @David, simply for my own understanding, did you ask Daniel to do
> > > > > this, or was Daniel operating on his own with this patchset?
> > > > >
> > > >
> > > > Daniel and I work together and both have things written on top of t=
his
> > > > kfunc. He reached out to collaborate, I agreed. We're also going to
> > > > send bpf_set_file_xattr shortly.
> > > >
> > > > This implementation was chosen due to its immediate mergeability (i=
t
> > > > only touches security/bpf), but was actually suggested by Kumar in =
v1
> > > > or so of my original series.
> > > >
> > > > That said, sorry for any confusion about this appearing as a new
> > > > series rather than as v7 of my previous one.
> > >
> > > Howdy all,
> > >
> > > Hope you all are doing well and having a good Thursday.
> > >
> > > These patches are excellent and useful, and have been in the pipeline
> > > for a while.
> > >
> > > In the interest of moving forward:
> > >
> > > Would you both be able to live with the following: provide a security=
 hook
> > > for lsm_get_xattr_slot or another proper interface with the necessary
> > > abstraction, and keep the kfunc where it is in fs/?
> >
> > That still doesn't change the fundamentals around the kfunc: it is
> > really only a valid to call it from within the LSM inode_init_security
> > callback, it populates a LSM framework managed buffer, and that buffer
> > is then used to by the LSM framework code in
> > security_inode_init_security() to do the xattr initialization using
> > the values from the BPF LSM as well as all of the other configured
> > LSMs.  It's very hard to see this as anything other than an LSM kfunc.
> > I worked with David over several revisions of his patchset to review
> > the code and get it in a good place, I'm supportive of the basic
> > ideas, but this really needs to be located in
> > security/bpf_lsm_kfuncs.c as it is an LSM kfunc.  As we've seen there
> > is precedence for subsystem specific kfuncs located in the associated
> > subsystem's directory, things should be no different here.
> >
> Hello,
>
> I'm less arguing for any particular placement:
>
> More so that the concrete security interest of just getting the kfunc
> *somewhere* is much more important. I have no doubt that the function
> would be equally well stewarded in either directory.
>
> The xattr kfunc in security/ question can be fought best in a different
> venue where it's not holding back good contributions.

This (the mailing list) is *the* venue, and sorting out
cross-subsystem issues isn't a foundational thing, not something that
can be cast aside because it is inconvenient.  In this particular
case, resolving this before it lands in Linus' tree is that much more
important since cooperation has been "strained" to put it mildly.

--=20
paul-moore.com
