Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339213C9C4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345246; cv=none; b=Hv7hoWEEnGDnVkH0if/ObpLhla9yOuJiytWnXbJ+bkSCfHbVZok9/IBWmyNv8aY9iBTfvrMY7wyIPzK9TCSwbOtIS9YA2izk4IdiA9VuPyrotlGnot9n69xjuRSjQ6mFpHMuhp+Ix+1aR4A9J+zIIHvfuwkuJksBofmbBDhDhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345246; c=relaxed/simple;
	bh=3aTF+AWXZ+myUFI7Wq6W+X6+VCBL+ZBF0FBjLK6jDM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNRoQc3gUTzFc/JaxCBayM1wpUct6fsx6HQtBqnjEuLkB3s77fGhU/RXwu4SIhEctjF3NDAyeQlzAs0av6EBie9KcPHsjJRtUfFIVWlsi7h8QcuRlBdbV/vZLbnLODln/pNMOxIqYxMoAzwq/2/3xH619pSiwEl9LwDUm/DxLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6FJn5wS; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6FJn5wS"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8706dfdcd4fso24598507b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789345244; x=1789950044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tBYt5yyCc29GaDe3JLWH4eveOS5QO7Xbs0vt0s6lq0=;
        b=G6FJn5wSKvpa/TN9ivlNxhv17eNOCaAU2T5Sb9DfMag8QRmcw8eTtwmbfa6Lry5YHE
         Cr2I3TA0Off5ubTfv7R4YCLMWhDq0yaEQX7vR6BKsDcEccw2cbJXXdDrs4XxiXudu9ea
         KabNU+O1JYSUXbPRlVgRCd2LHVFwpbyjGQW2lzPR3XpSyfRfncJkHAW/byDrsoA3QSy4
         pzQyrMHeOs+kv76MrY7tFHjVj3HvZHGtZxhDkHBNafYSyqvthW8SXZVX62Ok9MB+n/xw
         oqv5TdJyM7UFsP7DYFqF0KXP7BPgm0U9ABMunLMiUdVTirWNO2acoNw0RJF1nDeL0EXp
         MuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789345244; x=1789950044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tBYt5yyCc29GaDe3JLWH4eveOS5QO7Xbs0vt0s6lq0=;
        b=nTq4uqidqlMlMgRZKA0O2uR7sNtSPldIJ1RXI4k7ygaKgCogigpxobFEi4Nn0+6EhP
         chE+jXjgpIqizjrZFPaJ4fmhrqjku0ePn2CBiw+WZ/D2AMHSXNpVx9TO/jDa96yME9TT
         YWcqW5kP2CwSh+pdVnx90m12zOytAqD3myDtXjS8+DN9FmDK10TK1K4DWTsVNDFwAclc
         HtjGfstJbqlyksGHJMG3l85aFcwKbjTaUMM5XII8SfRV64XLDnmzSFUyEAQny/ItUU7f
         7jRL148GCeZ1cS3ki+gY3N6XZ46hMqbI6CUukh21HSeOQnbVOJ94R7vqW/uxLWJZZ4sd
         EJ5Q==
X-Forwarded-Encrypted: i=1; AKwUvByPiScGhAnZHIFXJ5Fjie6rWfM9U4Ge7cbKIFeYgcvUIRvhMz3I8YGDnurXsI6KHRTPESjj5VCy6n6EQYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kwrATQDabXrwApxNVqGfD9lc0/MfbvctES0g6bR3y7hvd6Qopq
	m/r1IeADfLtTsxlGNvA8xPV3nCMpBs/CFE4AgjfANkN6w6LNQI+JHLOt
X-Gm-Gg: AYBFou2i2M0Y5KxgiSYAa/+w0vmMyXvHK2A4nzqDKuQujKkCaYfcRI/Y0NRSBjaSMRL
	0NkqgmvSs52HNVu+suzB+1dg8Jm9ne/+D8cBitiHfy440eXXcXk8FBwhIG0vss70cp1PmMMvmrn
	zXyPSmvcPCGuXAQLc7fSk5EsSZXbpIY+/j6dNpb/VSbIhyHwbZOqTYnaPfHjB0Q24hcYGXGNKOh
	NsQK1hpV6G9MDv376I0maA8C3Yurphnl7zeIdouqQwS4TF7a8UHPjrMM3+WUQh0qqSB/sTBkRA6
	WD1Kgp8wZ9W269kTWH//h2VZU+coiCzPJTqUiKiYF2KvrC20uLAlK8SM5zXZ8fiaySppews2KeE
	WLUvrFKJqpTCos4J/vl93K8Dn4wzY41UuzjMcL5VipuiAKpaaX3DEBFhKYDzATa8IlTx7sAq34p
	VdR2bp43pEl/vdI3lYAHDvUfuAAp03OX/MzgzZEjcRaQg6Wg3gj1o5GCTK8MxVI0As8ft3DIapg
	Fw+jLT3R0Elp2qzvLBS323gB/+zC4MbnQ==
X-Received: by 2002:a05:690c:e3c1:b0:845:1064:5c03 with SMTP id 00721157ae682-88d1fbd5731mr809377b3.23.1789345243709;
        Sun, 13 Sep 2026 17:20:43 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:b74e:37b6:46bb:6c50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486c2df1csm31255777b3.19.2026.09.13.17.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:20:43 -0700 (PDT)
Date: Sun, 13 Sep 2026 20:20:41 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, kpsingh@kernel.org, matt@bobrowski.net, mic@digikod.net, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, kees@kernel.org, casey@schaufler-ca.com, 
	gnoack@google.com, jack@suse.cz, song@kernel.org, yonghong.song@linux.dev, 
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, jolsa@kernel.org, 
	m@maowtm.org, bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
Message-ID: <aqcb2eXw61LaFaqY@zenbox>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com>
 <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox>
 <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com>
 <aqTZdCz6JaoK16Fp@zenbox>
 <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com>

On Sat, Sep 12, 2026 at 12:33:13PM -0700, Alexei Starovoitov wrote:
> On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> >
> > If fs/, mm/, drivers/, net/, are permitted to have kfuncs, then why not
> > security/? kfuncs.rst doesn't seem to forbid this.
> 
> because fs, mm, net see the value in bpf. bpf helps these subsytems
> to focus on their core technologies and moves policy decisions out of
> kernel and into bpf.
> while lsm people treat bpf as arch-enemy.
> kfuncs are not stable. we keep refactoring them.
> while lsm folks treat anything within *lsm* and *security* as stable apis.
> So any kfunc where they have a say, will become a huge burden for further
> bpf development.
>
There are patches on the front page of 
lore.kernel.org/linux-security-module refactoring security
hooks and changing signatures. Security hooks and the LSM interface
is not stable, this is explicitly documented. 
I deliberately chose kfuncs over helpers to avoid having the interface
be ossified.


> > Where would you point me to?
> 
> landlock was designed for unprivileged users. bpf needs CAP_BPF.
> There is a fundamental disconnect. If you can tolerate CAP_BPF then
Landlock is for privileged and unprivileged users alike.
This patchset is designed to compose with unprivileged use seamlessly,
which works because of Landlock's monotonicity.
> just use bpf-lsm and implement whatever policy you need there.
> If bpf-lsm is missing a feature we can fix that.
Sure, in some perfect world in the future where every verifier
challenge is solved and BPF has feature parity with in-tree c on
a 1:1 basis, you could implement something like SELinux, or Landlock
in pure eBPF. It would be about as easy and trivial as building a
skyscraper from lego bricks.

There is an entire in-tree ecosystem of LSMs that would provide
BPF users with well-maintained, versioned, and tested access
control. Why force every eBPF program that needs to make security
decisions to reeinvent the wheel? 

There are real eBPF users such as Tetragon, Falco, Tracee, that
could use an actively maintained implementation of security models that
exist in-tree in security/. This would make access control in eBPF much
less painful.

Instead of implementing every filesystem, network, and 
socket access control, they can use existing solutions, and with
the userspace tooling that already exists. And they can
mix-and-match, doing custom logic/policy in BPF, and use what
they need in LSM, with BPF making policy decisions.

It would fix a real challenge that users have with eBPF, and wouldn't
take away from BPF's ability to do what it already does.

> 
> and bpf shouldn't be calling into selinux/landlock internals.
>
Agreed. And this patchset doesn't call into landlock, it calls a
security hook. The LSM hook then dispatches to whatever LSM
owns the object.

BPF already calls into LSM through security hooks. This is no
different than bpf_map_create hooks.

Nothing about the way BPF works changes with this patchset.
There's no verifier internal changes. It doesn't call into
BPF internals at all, or define any new core constructs.
It just uses the same kfunc and kptr interface that is available
to everyone else in the kernel. I think this code could even
be written with zero changes in kernel/bpf, or files in
BPF's maintainer's entry, though I'd rather have both subsystems
coordinating and cooperating on the interface.

Thanks for your feedback (genuinely), I hope you know I make these
arguments in good faith even when things seem heated.

Thanks,
Justin
