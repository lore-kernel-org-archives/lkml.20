Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E90545297
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182675; cv=pass; b=Bn3f21IsjqLU+Mg4KSMbHwgpKSuPJqFtsL0BbqnlFuKmLI7v1iZlZzzXdjtZEf3iqfix8Vkr/EqyK5oU1cu41j6Ne0C6lcqbQT7P1eJW+UQhUy94mohQjNJlF9jjdELCKdWG8eHokOWOm9JDs7S6MMYccti68XZfpdAUxswP9ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182675; c=relaxed/simple;
	bh=McqDOGf5r1CnE1bN7FiRiYswkQTi90pIdMUmOHjlXZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=no9gtNCLFWsCcV7RTRG13UifJKWzxNcZbo6AESqaho6SHTqsCc3LgiQ22ekxAuu+2n09W8zCq1/iT0BsHk9vZqe195x4L7XMN3qndMVpgsfRv3X35kZURGVcDffB1aTm7QJrm8gw5dFWlUfdPI5TTj/B81MEMg/f3xJiOMU7CfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JjkYbBrz; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JjkYbBrz"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c6so828156b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790182673; cv=none;
        d=google.com; s=arc-20260327;
        b=He+DCNYUtlTAbA5gW6JL8ysDmrNzOsYpXY1udTxtnpB6bbD7Hi2vGu0eocHh2ts8r0
         hi+nN9h5Z8FxIDqRl71PZC+XU24RgVuhd2maDJ0aO46cInmJjZ+gXR52oOaCrUlMOG9h
         +vYMlMXdcOwNVViLMCL+P/u9S3WXMwvz9Z4Plr8i9ntnFf0D4fVl9bBUla3ijb3ELrwS
         84kvz2849HOnkYioHvwHMC9Q38sqoCdDzGWaqd6B8BfSaqlulErIS1REchAOKXKuT0t9
         VC2DWYDsAIEY8Gz3PWqfpfjdqwzOIvdP5Kb7NeCQQB2oLFD4Dx7IVggZ7PjhdQ0FSB2M
         mlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ijs+6l1Z4Lnz2cWqooyvDNYk6B/Cjo1CnXBD1Ikc0Ww=;
        fh=4twv+PEh00cxVVhxgWVZ23NgyvEe12Ux1M9yGAZBCio=;
        b=lZYEf1URO/76RsUzU4nXLZ7xhmWqmd8Fyj804iBmpoQKy01di+UbczqV+qbSVl/qmL
         gwhQ6NxDg2DRddR4wcEZ8CgqKUkMD8472+mBwwLEZmXWIEac/kL7FOGu/LPcuQ3aQ5G9
         spa5Pev2oYGBKeqRzbGW1DtL5NhBHGIISiwQ1SwSO1sHbUu/J2BTU6QFMvh5+uv6S0hQ
         xAaydwVQjPLm2KO+nXAP/kLG3rBMsNZoFFYJ/85D+DdePDUXhCJG+V6E2gaPOVaMSA6c
         tUXch/XGfR9KNIP/3/lBWtM/l2nkL/q6gSeEp8HQ82orJbpzxLPwdUx0chGZc/DM7CK7
         q9rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790182673; x=1790787473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ijs+6l1Z4Lnz2cWqooyvDNYk6B/Cjo1CnXBD1Ikc0Ww=;
        b=JjkYbBrzfIpHFHkcivEd1rTidlNFx00ArknNboJSZP9Nyth6ClIwumGeYFLEHnok80
         bfNrZQx4b/eVJgy3ezqlkuyPjwF1qqQfZSYxMvp+smJufFKk3sa4Vm4W7QJXp7KlhkgF
         QJ9qM/J5IkqiPjPNZI618VQT+4y4CNlv/sTzC1mR7RZuKTk6djaHgcndC3MGRfI/7pum
         QgOvt2A5uv59QxbJiGvSbKZwjWcjkHylEMCVRbwSofk7ibvkO+O9gjGzktpRC68n70C8
         b3Dwwin/JhXzLvtlswLPf59ARMM8w5kD2/xpOeu1ttgweQZHuQVoWguYKmSeppzG4Lvd
         fvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182673; x=1790787473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ijs+6l1Z4Lnz2cWqooyvDNYk6B/Cjo1CnXBD1Ikc0Ww=;
        b=YoKEiWULaD2riq7/h6CLEWPeRXYD1/LvHY5S0msr1CNMgRiANsmclPI8auIdY4Wne5
         11nSziv5ELbd6GXOBvKPtoqr5jPzQa3gODPIxIzLlfdQkPZM5FZ9jdeQzICyX1g742os
         q/7JL45PK1Ftww/MpfsxAV/VlUtQKfcOQtJjL6aDJ72+yjM+/V75nycg+H3KMeS/WolL
         pPKKAp9WJQUOxTv5BdpNqkDAh3u9/2xVaU4DLJVhU8KWtG5PK6UaWaOVFbOiG9vjc3uV
         5R+bKn1YZ/AiocoL4JvVKay9Zn8f0JbxUyA4lisfEGfB1bgM1H/xs9HnH0T/8wuNKALa
         /Eyw==
X-Forwarded-Encrypted: i=1; AKwUvBxwMSRHmzQkBKyFurXb3kQ+Eg+1aZW9MTsgCSe8HtjbP7xeMp4DWxKUdfzuHLmv3iTWviBw1/fEuXtX2Ps=@vger.kernel.org
X-Gm-Message-State: AFuF++nr12HwfuSQe0yLZwiZHgiKUsSnqcNqieQtGHLZ7IDemiyVflGf
	iXd1r5btl/eMfrnEiT2FVgp9SKaNRofOH/ThQxdVqDzj/H3CVVtLaWAeknL/nixLUMqkdi18whT
	OpsaVjWgX9R98TlYibP1qXtLfYVOxxgKBn9DYglz4
X-Gm-Gg: AYBFou1wIJgAYf4qj7q4qOgEoH1TwiZ+aS9mFyljyvW2FatDuk9J7kFPQKTkSApu+mi
	TbsSUt1o81uPzHcj5sQ3HP8NJpv4vMjNWtfgZLvq23bxYi6e7/3QXN1e/O2S01E12IERMxu2ZOr
	Vwlgod2z6+7/2Mz4AJH3+xW0IgIhFExzjEeaiRhhx7IxPFZJYTP+geXoUdIRIZnsYWEyfziQ8YG
	Cg7KUKqWpgX+3wyesi6JkHR97heeUuhO3V8Ed0dP1Smkw6ptL9CmaGYBKy2p342PEPBidDMet2l
	IGA0sCntC8HyzQD9hDzxpUCSvKMw5gIYPe3xUsh+Bi920rbq1DoJennRRoAnH9dxWKEJnWcnGxJ
	KDwQN8skKph4=
X-Received: by 2002:a05:6a00:2d11:b0:878:3783:8a83 with SMTP id
 d2e1a72fcca58-87d1d0b7a7fmr2881163b3a.53.1790182672888; Wed, 23 Sep 2026
 09:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
In-Reply-To: <20260915150739.284189-5-daniel@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2026 12:57:40 -0400
X-Gm-Features: AcwNN1XZMabSPPsGaBL7S-QH7qLqXRrYdrHmvEhiaqbQfwf82MsfQqNIw9dalxc
Message-ID: <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Daniel Borkmann <daniel@iogearbox.net>, dwindsor@gmail.com
Cc: alexei.starovoitov@gmail.com, brauner@kernel.org, john.fastabend@gmail.com, 
	memxor@gmail.com, kpsingh@kernel.org, matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:07=E2=80=AFAM Daniel Borkmann <daniel@iogearbox.=
net> wrote:
>
> From: David Windsor <dwindsor@gmail.com>
>
> Many in-kernel LSMs (SELinux, Smack, IMA) store security labels in extend=
ed
> attributes. For these LSMs, atomic labeling during inode creation is
> critical: if the inode becomes accessible before its xattr is set, it is
> briefly unlabeled, which can disrupt LSMs making policy decisions based
> on file labels. Existing LSMs solve this by setting xattrs in the
> inode_init_security hook, which runs before the inode becomes accessible.
> BPF LSM programs currently lack this capability because the hook uses an
> output parameter (xattr_count) that BPF programs cannot write to, and
> existing kfuncs like bpf_set_dentry_xattr() require a dentry that isn't
> available until after the inode is accessible.
>
> Add a bpf_inode_init_xattr() kfunc that takes the hook's own xattrs and
> xattr_count arguments, passed through from the program's context, and
> claims a slot via lsm_get_xattr_slot() on the program's behalf. The
> xattr_count output argument is exposed to inode_init_security programs
> as trusted read-only memory, so programs can pass it to the kfunc but
> cannot modify the count themselves.
>
> Reserve BPF_LSM_INODE_INIT_XATTRS slots in bpf_lsm_blob_sizes the way
> every other xattr-providing LSM does, for the life of the kernel. The
> framework keys the collection off the reserved slot count, so a kernel
> built with CONFIG_BPF_LSM=3Dy now allocates the xattr array on every inod=
e
> creation, whether or not a program sits on the hook.
>
> Give the hook a strong prototype in bpf_lsm_proto.c so that its qstr and
> xattrs arguments are marked __nullable. Both can be NULL for some callers=
.
> Without the annotation the verifier otherwise hands the program a trusted
> non-NULL pointer which it dereferences. Also, keep the hook out of the
> sleepable set. inode_init_security runs inside the transaction creating
> the inode, with a journal handle held on ext4 and btrfs and the parent's
> i_rwsem down, which is why everything on the path allocates GFP_NOFS.
>
> Signed-off-by: David Windsor <dwindsor@gmail.com>
> Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> ---
>  fs/bpf_fs_kfuncs.c         | 99 ++++++++++++++++++++++++++++++++++++++
>  include/linux/bpf_lsm.h    | 11 ++++-
>  kernel/bpf/bpf_lsm.c       | 22 ++++++++-
>  kernel/bpf/bpf_lsm_proto.c | 15 ++++++
>  security/bpf/hooks.c       |  1 +
>  5 files changed, 145 insertions(+), 3 deletions(-)

@Daniel, you were CC'd on David's previous patches, so I'm guessing
you saw my objection[1], but just in case you hadn't please look at my
comments where I requested that David's proposed LSM kfunc be located
in security/bpf_lsm_kfuncs.c as opposed to fs/bpf_fs_kfuncs.c.  It
would be really nice if we could sort this out now and avoid having
this drag out or escalate.

@David, simply for my own understanding, did you ask Daniel to do
this, or was Daniel operating on his own with this patchset?

[1] https://lore.kernel.org/linux-security-module/CAHC9VhTS7rSnBqg00ZxNkcZy=
h_=3DEeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com/

--=20
paul-moore.com
