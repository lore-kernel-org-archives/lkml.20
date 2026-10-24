Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879413;
	b=MSEdbsZTxh7lPV400R8pigkrKmRuf99qJjobRMeHOKfMK3J2ijiKAbUoMzZewJ1vNrki
	 JnUWGj6g4jVUpUZ4T1yYRQOsQLhR5/5AKbmigMVwHvwYi6rw63PnASSunIRB7G8DaihtS
	 s2eLhmImoH2y1isZCfYaF+INWI7sf2ZhkKHPjJPARmuKOKGbHcPWxFjihbvlTdxk1AwCq
	 F1uRkz4iMd05cZvhToMESLt5aqFoAYftbABmVileZoEgrZGiZqwl0d2KKKkOy0H9iH5hJ
	 ci+sh+KAFs3/OU9p47wCs5P+AW0tltFlarPC3BlKGBzorIlUBqLQk7z/EJaLNqlni9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1XuVauCESjMayclqzV/lUH9urIt5dAvvM9cpIkZ6/bw=;
	b=ykoDtqcQnj1S6I8T7gHT6xOz5gQ6dyzesO/WVfnMAiA+0tMEwASRIeSjsSZU/AXRKmVK
	 39eYXTSRPQYu6K0EenCaxc8ksJnZfPxRW0oSePQxu1gONSYWym2zV+dx7cl5U4noQg5VZ
	 roLIfpqFTG+vEufDZc1b1gZjvlYcnQ4b3f9X9w09kh2C5MBjlY7MMHQd1ATVPZRSdyYR5
	 pT75UM9+/aEfHL5vVBR2TZdi9hxm8nsa0pSyNILcQhYhQupQw44C2vpbj7ANUEMD5QLjK
	 Grr8MfFYOOK2+NV2atXypPQmfJ9UWGLWlI4KxaH1D7KJ8hy2xF84Pio/HeE/AiUlN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqWYla3S;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB9606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqWYla3S
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac9d666d4eso14900527b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792879412; x=1793484212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1XuVauCESjMayclqzV/lUH9urIt5dAvvM9cpIkZ6/bw=;
        b=CqWYla3SEBiZecqrvpAQLYJ+P45RSc8QYH36yT8PLv50v/QhE7Bb2roaj3CYQHSA3q
         yiGvQl9wDwQNNJIVu3DyxFLDekIQO8W8qovOs/PKfIR6nDM/0DBDBUpA+lUAPmV8Gebn
         H2PNVys3AVbK1mJS13qBYB5jd2iWYirZQHuOrEYAXIENCOQV5IV9ABzb+4rCi3BFapz5
         ek5pJ6sz8J0z1mFlDHz47IokrvqXVX9UzmG1cf67hNxN36mgKGysJInw2+aG0cqsJdPg
         RKYuyz/ZPEKvG8EvTe9R+RR7FBKx/2+H81Zs/KjleIY79QrQktpA8tPW33fdCifBEi6z
         yf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879412; x=1793484212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XuVauCESjMayclqzV/lUH9urIt5dAvvM9cpIkZ6/bw=;
        b=Bx6OYzbrbeQdIHv5/RJHCGO5cn7NhLgZ1AQJhF+SfhRGrDJF+C5SEVGU4CFZRz5Z+o
         j/IL9utrUsUyxbaOHZnNY6Ilkc1RklLMrr5u31A2WDzmBqdSTWeBdDb+Z8stP4V1fxKB
         I1vifaoWGfwfQoUICRn7mSmsDbCcCTE3pcXUyHjWZ22VJAGyAILHlHF7caWgH5fib01H
         cS4ZlOAN8+29E84lCdJ/E1+qJst8zaVETnFckaiyZwVlAi26RkcoeJHJehUS/baZkdPx
         4diNtHrE2zbHJ/r6L/UD/Q4h68SmeckE/cFF2szVuNieKeFnGTcDMTbgi7LwuapGcbwj
         Z9nw==
X-Forwarded-Encrypted: i=1; AKwUvBzRNefVg1Ik29PyUVk82V2BkEEJWEA5+u4iP2zBYWoEOdbJnTrS94dh3glW+cX8Jyfr37Q1Od1F97HDSuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj2ZFaovcHU+e2Rmlr/zfe3NnU4HVv+EaNKaKhO6rx4g58GOEk
	FZFC6U2NjwC9OkvFVTMLmhzXrV9yrcp3PFKr/b4vz7gctJufBjganC7h
X-Gm-Gg: AYBFou3hPQJnXTS4/dO5bBDM1edTic0CbIKJu2FPIXktvuHXeu64niA0aYTX59uYpXm
	8NITKGwTJoQ3lM2qS8gmvn0zG5eBP6TIHFvZ9/INrGZ1035+TvWyGHiJI9QFInFU3GTSWM492un
	syiprffwrF/oVshbcbWCckdewYds0soooIpjiJwyUyDh4BHzQgrwntDtbPgP/FYRd2EV6kr6OXY
	4ZzK2JCvl78Xqe6mpSPJD9g/1So9plCpjKsgw2rMyUmb2dNFi5MgrZNu2IsL9OBIpsZhpi1zu7M
	WHWZpWmTER4+SHd+d/lVKaEdIdt8Rgqdio5LEaZdCvCUAdcue/8z5SwomnMqK81dL7qP8X0Kmg+
	k2kSs47PhEKvxr00h1nhllpqL4MCAcduUD8Tq+U5yrHVYTj6M7iPMS0IryJHXPmT3NlUjPyM9ZT
	qwzxQjXZqDYe2SHH4FjhAqIxNTLwC7+ajVWKjnCT0zgwTri+MGGZoE1u3BxXCVVzKxU/zscLTnU
	fPI0q13SZ2TosmMNEfcquupLDeOYBzcePj2JvZBiPxdma+BSdxqfV5jfQ==
X-Received: by 2002:a05:690c:38b:b0:8b0:6a3a:9aa3 with SMTP id 00721157ae682-8b166c0c9afmr18231067b3.52.1792879412042;
        Sat, 24 Oct 2026 15:03:32 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f15a:4eed:c4ba:3585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166dd01c0sm12800017b3.7.2026.10.24.15.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:03:31 -0700 (PDT)
Date: Sat, 24 Oct 2026 18:03:30 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Farid Zakaria <farid.m.zakaria@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	John Ericson <mail@johnericson.me>, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
Message-ID: <at0o7LydcgezBf7D@zenbox>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <at0agiPbtxz5zD41@zenbox>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at0agiPbtxz5zD41@zenbox>

On Sat, Oct 24, 2026 at 05:43:26PM -0400, Justin Suess wrote:
> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
> > This is a proposal for an idea to add support for landlock to work
> > better with build systems such as Nix where they want to apply
> > restrictions but the paths may not yet exist.
> > 
> > TL;DR;
> > ========
> > 
> > Landlock rules attach to inodes that exist when a ruleset is built.
> > That makes a directory shared between trusted and sandboxed tasks hard
> > to confine: the sandbox may create entries there with
> > LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
> > time, and granting read access on the directory to cover them exposes
> > every other entry as well. This series adds a rule flag that grants
> > access rights on the entries a domain creates in a directory, instead
> > of on the directory.
> Hi,
> 
> I'll chime in since I run nix and have a little bit of familiarity.
> 
> Looking at my (admittedly bloated) nix store.
> 
> [justin@zenbox ~]$ ls /nix/store | wc -l
> 259356
> 
> That's a lot of inodes. And a nix derivation creates hundreds if not
> thousands potentially throughout it's build.
> 
> My main concern is that rulesets are generally considered
> immutable after enforcement. This allows for well-defined semantics on
> inheritence. This from my understanding would mutate the ruleset after
> it's already enforced, so changes wouldn't be copied to inherited
> domains automatically.

* nvm on this, it looks like you are adding them to a different
heirarchy. The point still stands though on the inode pinning, which you
pointed out.


> 
> My other concern is with the overhead of automatically generating an inserting
> a rule for every new inode that gets created. It seems like a complex
> way to tackle this problem.
> 
> But beyond that, let's go back to your usecase.
> 
> ....
> 
> Basically from what I'm seeing you want to grant some access to certain
> subdirectories (including newly created ones) but exclude others.
> 
> Presumably in the nix case, you want to grant /nix/store/{abc,efg,hij} and NOT
> /nix/store/{xyz}, but still allow /nix/store/{foo} (the derivation
> output) to be created and written to. This would allow the nix build to only
> have access to certain inputs, while being able to write to the /nix/store
> and produce an output. This is a valid usecase that Landlock cannot today
> accomplish.
> 
> There was this NO_INHERIT series I proposed a little while back.
> [1] It's sort of the inverse of this (removes accesses inherited from
> parents rather than granting new access) but would accomplish this
> goal.
> 
> With NO_INHERIT, you could grant whatever access rights you want by default on
> the parent directory, and place NO_INHERIT on any specific entries you
> don't want to have inherit those rights. 
>
It seems like NO_INHERIT too might scale poorly for the usecase. Since then
you are trading O(store) for O(inputs) so not much better (strictly
worse).

Thoughts?

Justin
> So for nix use case, you could grant no_inherit on everything except the
> inputs you need, then add READ/WRITE/MKDIR etc on /nix/store. The new
> directories would inherit this by default, while the ones you added
> NO_INHERIT on would be restricted.
> 
> Additionally, you should also examine the mutable domains proposal by
> Tingmao Wang, which could also facilitate this usecase as well [2] (i.e by
> dynamically adding and removing rules with some fanotify/inotify glue).
> 
> That being said, neither of these two patchsets / proposals are merged,
> and the playing field is still open on this.
> 
> So the problem you are pointing to is legitamate, but the solution still
> needs to be considered carefully to avoid complexity.
> 
> Justin
> 
> [1] https://lore.kernel.org/linux-security-module/20260621035223.2651547-1-utilityemal77@gmail.com/
> [2] https://lore.kernel.org/linux-security-module/cover.1741047969.git.m@maowtm.org/
> > Motivation
> > ==========
> > 
> > The motivating user is the Nix build sandbox. Every Nix build runs in
> > its own sandbox, and a build may only read its declared inputs in
> > /nix/store and must be able to write and read back the outputs it
> > creates there. Nix enforces this with a private mount namespace: it
> > creates an empty store directory and bind-mounts each input path into
> > it, one mount per input. Nix has paid this per-input cost since the
> > sandbox was introduced [1].
> >
> > The cost is paid per build and grows with the size of the input
> > closure. Nix is moving towards much finer-grained builds (many small
> > derivations instead of a few large ones), so the number of sandboxes
> > grows while each build's own work shrinks, and the sandbox setup is
> > becoming the bottleneck. A typical build has hundreds of inputs; large
> > ones have thousands.
> > 
> > A microbenchmark sets up and tears down a Nix-like sandbox (user,
> > mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
> > removing the chroot afterwards). It compares one bind mount per input
> > with a single bind mount of the whole store plus one Landlock rule per
> > input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
> > ext4, 16 cores:
> > 
> >   inputs   bind mount per input   one bind mount + Landlock   speedup
> >       10         3.2 ms                    2.3 ms               1.4x
> >      100        11.6 ms                    2.8 ms               4.1x
> >     1000        79.3 ms                    6.4 ms              12.4x
> >     5000       400.1 ms                   24.4 ms              16.4x
> > 
> > With Landlock, an input costs an O_PATH open and a landlock_add_rule()
> > call: there is a single mount, and no mountpoint directory to create
> > before the build and remove after it (removing the 1000 empty
> > mountpoints alone took 17 ms).
> > 
> > The single bind mount is only sound if the store listing and the
> > undeclared store paths stay unreadable while the build can still use
> > its outputs. Without this series, covering the outputs requires a rule
> > on /nix/store itself, which makes every store path readable again.
> > 
> > [1] https://github.com/NixOS/nix/issues/179
> > 
> > Series
> > ======
> > 
> > Patch 1 lets an LSM observe inode creation through the
> > inode_init_security hook when no LSM provides an xattr. Patch 2 adds
> > the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps the
> > ABI to 13. Patch 3 adds selftests.
> > 
> > Testing
> > =======
> > 
> > The series applies to the Landlock next branch (3e271a27c46f) and was
> > tested on Linux 7.3 with that branch applied.
> > 
> > Without patch 2, the five new tests and the ABI version check fail.
> > 
> > Open questions
> > ==============
> > 
> > - A created inode stays pinned until the layer's hierarchy is freed, so a
> >   sandbox that creates many entries in such a directory keeps them all in
> >   memory. Should this be bounded?
> > 
> > - Creation is detected in inode_init_security, so on filesystems that do
> >   not call security_inode_init_security() created entries get no rights.
> >   Is there a better hook?
> > 
> > - Through overlayfs, created entries get no rights either, because the
> >   upper inode is created with the mounter's credentials. Should overlayfs
> >   be handled, e.g. via security_dentry_create_files_as()?
> > 
> > - A file renamed or linked in keeps only the rights it had at its source.
> >   Should it get none instead?
> > 
> > ---
> > Farid Zakaria (3):
> >       lsm: Call inode_init_security hooks without xattrs
> >       landlock: Add access rights on created files
> >       selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
> > 
> >  Documentation/userspace-api/landlock.rst     |  42 +++++
> >  include/uapi/linux/landlock.h                |  18 +++
> >  security/landlock/domain.c                   | 182 ++++++++++++++++++++-
> >  security/landlock/domain.h                   |  28 ++++
> >  security/landlock/fs.c                       | 176 +++++++++++++++++++--
> >  security/landlock/object.h                   |   6 +
> >  security/landlock/ruleset.c                  |   6 +
> >  security/landlock/ruleset.h                  |  14 ++
> >  security/landlock/syscalls.c                 |  20 ++-
> >  security/security.c                          |   9 +-
> >  tools/testing/selftests/landlock/base_test.c |   2 +-
> >  tools/testing/selftests/landlock/fs_test.c   | 227 +++++++++++++++++++++++++++
> >  12 files changed, 703 insertions(+), 27 deletions(-)
> > ---
> > base-commit: 3e271a27c46fd591d1011c7de5a644a41e2010f1
> > change-id: 20261024-landlock-created-rights-9340b00a8c4d
> > 
> > Best regards,
> > --  
> > Farid Zakaria <farid.m.zakaria@gmail.com>
> > 
> > 
