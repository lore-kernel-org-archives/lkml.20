Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328DF318EFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352667; cv=pass; b=ueA3DgEGK8sYmZlLUo1T3ghJnybn9QuqQkuRY94St44auFmgjMkh4Q4lscOMOBCH/4Yrz6GQwH30gcwYFyxHDujvcf+cZFEpMQT7Tor4EZznFRmRU7w/7HS0OkXUUKTmbAhq9nFJ+vGA0+4GptZABWmMcvsuuPEVM3oCKOA0Eos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352667; c=relaxed/simple;
	bh=tr92RxUfetBUYnectTORLM72uF0Ccm/8PlWorGu06k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T14OK/sUktrdGKuu6ygADu67IFh4sVht2QVABVD6OmSjpN8yhDH0p78Stxm17mwsMdZQUyr46ss+llXqFaTI3BTEOdpVj6aAaw5rGTmd9D1wsHddH1CpAKXDg6fcRpUpEhS6A2YtTWk6nf8LY/rQ3jtnFbb97CV4wM1ET+ZL0mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxefRYVc; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxefRYVc"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-869d181419bso2528685b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789352665; cv=none;
        d=google.com; s=arc-20260327;
        b=O51vDoI6Sb4W7/heDVPZLNTm5BifYCX6vR63eVcAwHBAmJb59GAl1zHx1SVKfslmlg
         yEQw9M6qkBuobOUnFfQgDixUJqEpU3cDXbnIFujsc8tf/snhk1FdXzOmLZHUa+NRtDP6
         UEzahTKBaeUQMz+MPbpSgD7fvW3RfvUrdoQiJpKc2Idyw1ovABL7TehnY70Uwb5GcDJC
         eKRS01qn06tK/kB/iWZ8Qz8vyicluQm1x92ciP4gvoIGV8LlfeMOkYH6OWJjEtvneMMl
         eoCrOAJWE2oSW/ZkuMp4ZtnMd4kb2rkUkyrHQJkngzvPsXMSgsJi0JzSWOkkhdIf78JJ
         o+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=robbY/RJvD+ycB/sUyfcCcbZu7QGUhf6dyHtU9h8Jsg=;
        fh=8rb1ZAbyyzX9JOuZrZeiKG24TFXgQs3XpwqHFV+72dw=;
        b=sxNcD4yM+qEGlUUYQgkrGfTbDJeVimh9eNZFppyztJAs5G3Iw1OaoV7XwxeawPX+nE
         4cIFPX/pPPzcfnuC4+bqluvo1E36qR8ikzmmsiXssz03odLWRoIWcgdRVnczKQbQaTJ6
         LVIYjvXZnFLYhv/IyChEly5Iip7rJDSby0tNGX5dE+RuFRYFc3NzVrKys9QFSXVRt+aH
         FmrcapFE6p8EbMNr1mljds/0zZbSMAz+ba9HLNck5gUm5IBosiVqVm7xUW9DBLkUc69u
         5L/1TPmumwk6sOciELiO+Ehlu/UVXt3hxz+2G/mlx3sr5omBcEqCJQu+vCs1a/e3Ra4j
         Vluw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352665; x=1789957465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=robbY/RJvD+ycB/sUyfcCcbZu7QGUhf6dyHtU9h8Jsg=;
        b=cxefRYVcVolJqBSAHxTT7ytIlBcVR/yupayD6e8vgXDHIfSjHnzZLl5EGG1RE0K+1a
         vRfTAvTGGm1zjOOzer8bTitRH40nkprMil9toRIt6h4lqZv8vmIrY8Jg0iNAWFtCbqUz
         SUuqbYD/7huIZp4Xf5yKSgcjCbUM5VetnSiHLThNHL9xOcw+yYFW7EBN3cYBHWXKdsHf
         Ep1eAC4PguvLiTT2mN/0lDgdSjRLd3SbiRaa9cbQ6ZjT0hYqKs9aMBZ/rLAeZ4cDKin1
         2ziMfEBx6o6L8lQssQHjFCwloTJliFCcsHUi2jS8Oau36n1EdkXUXp8QLIkHDReqARfh
         ayeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352665; x=1789957465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=robbY/RJvD+ycB/sUyfcCcbZu7QGUhf6dyHtU9h8Jsg=;
        b=KHXnLzeZqVoirPmiy71Kfh9JuySKMi928vrCr5ZQ1uamAmPQU+0m8FM3VdVfTIjZtv
         OBKBRT07GnFBo22i3DxTYJf5fjwJvdwZcDeAhDPGEF3KCvYCmZfOwStr6A/cDQ9Tcv9/
         gzWHKrzfj28qBaOr+1cojzjwl873GhDGeoBORYu4Y3Efv81vgwsM3w/bKt6shzk6X+zM
         /RduMSsR7Q6VJgg54OixuyAdq5PLMBqFUWz0+v+vt0C1slxosDDLtyXBYubQfgq5HG1O
         nJ+oto78c+bA083Wku8jbbReze4cMcw2ggf/PW26+13zFCYA3OeJBMMkZJ2W+86gFgVt
         Kz8A==
X-Forwarded-Encrypted: i=1; AKwUvBwFkLaJYR5fGJz4GfpOM3cXBgsZe0aGZBoVnb9pc6ITjDYT+cCIbzLJAbViOy7IBrf5VyYtDWxeB3YsjyM=@vger.kernel.org
X-Gm-Message-State: AFuF++lZSLoTGpnMRRZ80FyjkpVesMIQYWlM3qWVIvN/qUcWVwYhRPZg
	LWW85TndVt+FW9Ngl07bTKsJh5thtjr1Ne/SnzqLtaHOlNfn9SHOnfbJb/U+YdcT8i/A0a1x/YN
	xKVT0LRLcaBJwSeX0C3y1Y/4vtFZlWdY=
X-Gm-Gg: AYBFou32AXIgN7ht1ptm5ZrY0yTBtntIqDLJvQgD0UlCT9ogTQJQFCtGQ19ITczgn4w
	kwj65NW7dN8ikwn9wCf53Jt4v6xFdsuZfYMs3tSstiVVwl7TvK/m1EmR1EkiYRQuKeVQrNKRS5q
	NCkzJV5iLkaDISkBnl/DznroKGlKKIL3ZmlDfj4ODFgUKUl46cWImoKlgInyl/zGKS9m9byT0Cv
	Q8mOmD3aqdJaADGwT6jtwZgulubfGN/H3SF185PhZ4HbzaCVa/DecAEbbRrs/mc2cXOabI2I+PF
	MfYxk2iSh/YFCa7mkxid7WfHUnYCYH7+i8kwM+G+G+inKnAxhdh3XfGCTXDa5a5JhskEj3eQph9
	WJ5pLbq4LJ6QBD10VAKkNm1yHpz0Gw14WZjQT4Bo=
X-Received: by 2002:a05:6a20:e290:b0:3da:6bdd:2308 with SMTP id
 adf61e73a8af0-3db4053d966mr790488637.18.1789352665301; Sun, 13 Sep 2026
 19:24:25 -0700 (PDT)
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
 <CAADnVQJCJjy9Eiwn6-88c0iOk4LfgPU6KBv+w0JZdBzmXBMUCw@mail.gmail.com> <CAHC9VhTh446SkpPF-hUiLYOHipuurzkgju_nH9LsRGdERSAL1w@mail.gmail.com>
In-Reply-To: <CAHC9VhTh446SkpPF-hUiLYOHipuurzkgju_nH9LsRGdERSAL1w@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 13 Sep 2026 19:24:14 -0700
X-Gm-Features: AcwNN1VHje-1mlgyoqyzgACqg1pNN767AgvJcvGzVCEPYAVsQlnEZtYN4fUz1O4
Message-ID: <CAADnVQLZscKkCxvK5puuOE1aN8nW6PnaS+_dx_zBQjjP2T-DFg@mail.gmail.com>
Subject: Re: LSM boundaries. Was: [PATCH bpf-next v3 04/15] lsm: Add the
 bpf_lsm_policy_release kfunc and policy object destructor
To: Paul Moore <paul@paul-moore.com>
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

On Sun, Sep 13, 2026 at 5:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Sun, Sep 13, 2026 at 7:25=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Sun, Sep 13, 2026 at 12:41=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > On Sat, Sep 12, 2026 at 3:33=E2=80=AFPM Alexei Starovoitov
> > > <alexei.starovoitov@gmail.com> wrote:
> > > > On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> > > > >
> > > > > If fs/, mm/, drivers/, net/, are permitted to have kfuncs, then w=
hy not
> > > > > security/? kfuncs.rst doesn't seem to forbid this.
> > > >
> > > > because fs, mm, net see the value in bpf. bpf helps these subsytems
> > > > to focus on their core technologies and moves policy decisions out =
of
> > > > kernel and into bpf.
> > > > while lsm people treat bpf as arch-enemy.
> > >
> > > It's amusing to read this when just this week we merged a patchset
> > > into the LSM tree for the benefit of those writing BPF LSMs.  If you
> > > look at the discussion around patch 2/2 you will even see a reasonabl=
e
> > > exchange between Matt Bobrowski, a BPF LSM maintainer, and me about
> > > the patch.  Alexei is obviously welcome to his own opinion, but I
> > > would encourage those reading this thread to look beyond his comments=
.
> > >
> > > https://lore.kernel.org/linux-security-module/20260904-lsm-mount-idma=
ps-v3-0-920a1963675d@amutable.com/
> >
> > And that's an example of unacceptable land grab by LSM folks
> > that I'm concerned about.
>
> I made sure that patchset was ACK'd or Reviewed-by'd a VFS maintainer,
> a BPF LSM maintainer, and the Smack maintainer before merging (I
> covered the LSM and SELinux parts).  You might want to double check
> your definition of "land grab".

You're still missing the point.
Christian could have landed it via vfs tree with your ack for security/*.
You have no power over lsm hook changes within vfs.
