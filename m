Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2115733E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344650; cv=pass; b=PYnFFVLax1FT1f2qtvKVDrYjNUKgK0fPzeoSKvKqj8ttFLd6DEq9y+J54VoOak7mBRZXsGwQy//VEezqBBJFXofbHPaL6HvgRqA71lKrztN7J6QzbxWYYbGTpoZNd/XXYeYRaDBq3hm4w5rbG7d9KBk6iIgXSGR9WsjHIgqrrgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344650; c=relaxed/simple;
	bh=KA+rPTv5VVNalzwukEV1piJ+nvWJpoPLWw6I1lvrZWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdSpn6NW0pzRhkjvxH2XylJusiAIpb6GI5cJQ+uhVqMaKEZ6yox/GKIr925CbzFemu9w9NaG4AA+pRvZTHNcrXDXcI/niQDo9zdRf7LpMh/BOj9diyltZhjcUCndYk5zK3N8jJGf0BsUYMeAnm8uL4i2lfPt9n1tSooY7qIRBes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VFuMwuhK; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VFuMwuhK"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1988427b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789344649; cv=none;
        d=google.com; s=arc-20260327;
        b=b7N++P7Y3X24tS2FK5r5t9qgPIXPuGpui3noK1HSE9Mbx47jvUp4VmVn0d2XqW6AlM
         tRiy+tQmYovNkRd7h6HNV6vWbVwdz2q3z8gTqVm7mWeRDiGXScoemBo7p1unjomnpa5l
         3tsnnPIIyWXi9Ujz4EC8RTontMk+IvlSO2EzC5w0/Ou2/z9NPLXh/7x9Pa6FM9WNyb0r
         vFhpliP4+RQwFjpAdfkeo+Ho7hid/GTRVbrXtk/cZGgSXbM3OJTiPjTz4xiB6AgpXpqB
         6Y9Vt9BxUWfjekITRDmzGoHQ6OwUcW5bx2oS+gaU8Rz8PLJRPz7C6ypRNAuDC3ZpOERn
         pfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ceBFcNq/usYwqaerRcbMKaaFE+KCx/MdZ6c3TMQKCHU=;
        fh=xd2TwVmH4W4FZddSTRguJJxkgdJWm50RRR+JfrnRNks=;
        b=qfOBDgaxxyJNnjpw/LVxbDhPrK15p0zSgstEqg2FM71+3ksD906bDPo0TKeqaos1+I
         dott+9NqdI7PXOAMC18KqKmLQiSkBWPp/+s+owVLgHSXs5udXBskqtUgEqpySSgWbkRM
         KvppmuxUTqCZ+p8dxYxsKnqc0AhR/w/yzjbPudOGQVNPMCUC3dJXRFkeXbfGmb+DRFWq
         ssUWM+FXtQ2pnz/vkSa7/x2yyoJLBAn7CNhv0kw36YCyAa8NHbPNg3T7DFry2H89HJAv
         lqP9RUEzM51Xb5d1uI/NJ+X6LKcjZX9BB5zfy8JoeSSWi190LGizSYcvViCg8BLl8XZv
         +9UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789344649; x=1789949449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ceBFcNq/usYwqaerRcbMKaaFE+KCx/MdZ6c3TMQKCHU=;
        b=VFuMwuhKWpZLbLTVULdqImtYwv6yZUOTbedztWZERBz9+3FYrJgdedTbp/AxJ101rK
         Wg8msxRfxzCl7ldOI0iO9iPjBom60i2FqTXrp8ctV07irGWqu/2f5Geo8Nbh3zqbukws
         8G1rHOX6PtulrRi/u0leeQmdyjDP/yYU7PKKOQur7UVtYiRV04TylVoW37S64Oz99snr
         u3ERY33o+6Lz7V2T90AWV/WV3Z0jiukN2b0fUQpE/onyr1TzBP/VS1Vo9UXpSFjtz/aO
         pz3SBskJsizgHUdF7NvU6aYzUFQH6EGZeaeYN4pWZcrpAqIkb0zHQjKoqnNGjYivtTor
         YS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344649; x=1789949449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceBFcNq/usYwqaerRcbMKaaFE+KCx/MdZ6c3TMQKCHU=;
        b=SURJyye8QdtphKliYS6CTkO3GFOAuT0ZATTIDsTiVCPZxndOKukAoqZppLGu7kUnDz
         28HqH0J+QwpQrUoSOChG80qwiRtW02JcFEX2+P1psR+E9WFZCadJ+gqL07Epd9HOanpu
         5DCViqRueIxLUtcHpsaFfdIOkYGjvn/gZqPaLRGpj7+wuyVz9nMbC1cfMPTiJ/aCz79N
         XI2+r4WkSQcEQKbaRRWmHZ7HKSkycXtMC2TUjjtGSEnvHneoYBPR1zspV3zjorO9+v9B
         gcOZa2hGMkyk0GbIUXlL2/vyH/J0K9e4RFpsRZOKyi1PYqbja5+ieNyZd5jLsEZiTXBV
         PRJg==
X-Forwarded-Encrypted: i=1; AKwUvBxCRxmFr+vK8ewhVVUBClmP0mWHOoufPK7R3tbMAWtW4DOLaIkmfuT7CFqKMbuwBNdIy1ZnRdCCTS3bgew=@vger.kernel.org
X-Gm-Message-State: AFuF++m+9sykDl/EORMa9+ac1JRySkEN3wz6az/5OyLBqw6r2TZZ60Sf
	UTxsqLNG9n6r8j4jbK2Llm0E7obQ9whJaCKVT1pVJYgwC+o4U2IzI5fuq8O5xhhHvlGZJrWOJou
	Q1BQGxuVBncSdWsrt1OKqc7wzFDNiBX3ch04JpjVx
X-Gm-Gg: AYBFou2Wv99knes+W9VYcCSXsLWYmlZRPUYn5PoNr6/B4iES8q+I4UrzIaQtSHMaZ/C
	kr5ne7DUhmvlKZKLcd8d3S4JvNITVyWt1n84xgB0kv9TgW58fIBdxW+3pdkuu1oDsX/qMaUjEhX
	Hm2jw3kPlWvk7f3C4CHs6OG7ixx0SosZw2wWS6cmmd+YObLmEQH6eMyfpKicCxrlhddzFfulyL5
	YRbRt0h8oR5sD4Bsuj6JbcFZf+tlSdr0FwBFKIAZ30o940uIAuICdUgrFJ8LG6hmPlHLlH+gPV6
	abAA5+AJ2yl+oIkPCjwPfpOfQpxwSj0mYdW2Mj+DQgVy9EdkjRc6N7iZCc04Wfrqp6pIrH4ev0G
	86G8JXsj081jtWxi/mss8ZA==
X-Received: by 2002:aa7:88c8:0:b0:868:4538:c44f with SMTP id
 d2e1a72fcca58-86f852000c9mr556726b3a.12.1789344648633; Sun, 13 Sep 2026
 17:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com> <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox> <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox>
 <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com> <CAHC9VhS0JckwfomqLTUJkZZkDSgeRXYOjMmPQYErgYynQYqMKQ@mail.gmail.com>
 <CAADnVQJCJjy9Eiwn6-88c0iOk4LfgPU6KBv+w0JZdBzmXBMUCw@mail.gmail.com>
In-Reply-To: <CAADnVQJCJjy9Eiwn6-88c0iOk4LfgPU6KBv+w0JZdBzmXBMUCw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 13 Sep 2026 20:10:37 -0400
X-Gm-Features: AcwNN1XOcc2wDiZEgdl-zuy4X7NFEMcBCsCAlJzRSr-oGZZVEvXYbjHajbfewBc
Message-ID: <CAHC9VhTh446SkpPF-hUiLYOHipuurzkgju_nH9LsRGdERSAL1w@mail.gmail.com>
Subject: Re: LSM boundaries. Was: [PATCH bpf-next v3 04/15] lsm: Add the
 bpf_lsm_policy_release kfunc and policy object destructor
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Justin Suess <utilityemal77@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <matt@bobrowski.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Kees Cook <kees@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, Jan Kara <jack@suse.cz>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Tingmao Wang <m@maowtm.org>, 
	bpf <bpf@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 7:25=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Sun, Sep 13, 2026 at 12:41=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > On Sat, Sep 12, 2026 at 3:33=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> > > >
> > > > If fs/, mm/, drivers/, net/, are permitted to have kfuncs, then why=
 not
> > > > security/? kfuncs.rst doesn't seem to forbid this.
> > >
> > > because fs, mm, net see the value in bpf. bpf helps these subsytems
> > > to focus on their core technologies and moves policy decisions out of
> > > kernel and into bpf.
> > > while lsm people treat bpf as arch-enemy.
> >
> > It's amusing to read this when just this week we merged a patchset
> > into the LSM tree for the benefit of those writing BPF LSMs.  If you
> > look at the discussion around patch 2/2 you will even see a reasonable
> > exchange between Matt Bobrowski, a BPF LSM maintainer, and me about
> > the patch.  Alexei is obviously welcome to his own opinion, but I
> > would encourage those reading this thread to look beyond his comments.
> >
> > https://lore.kernel.org/linux-security-module/20260904-lsm-mount-idmaps=
-v3-0-920a1963675d@amutable.com/
>
> And that's an example of unacceptable land grab by LSM folks
> that I'm concerned about.

I made sure that patchset was ACK'd or Reviewed-by'd a VFS maintainer,
a BPF LSM maintainer, and the Smack maintainer before merging (I
covered the LSM and SELinux parts).  You might want to double check
your definition of "land grab".

--=20
paul-moore.com
