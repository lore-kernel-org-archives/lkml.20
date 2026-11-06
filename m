Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990549;
	b=CzqJ3a7itW07NbjnPpuexR+Ks9hNiZxdGvvNMGhCTU41WXr6Xi2SvCrWWvVhK0eqDX3p
	 xJqGYwC/zo+g3ssJKyWRAFQ33hwcHJkDZTsdAmSjoet13Frw9Ije/TZLgEfB/i7fWYqjk
	 +hupkCoCZHEl0mfD94UaBnp4o4dRV/cwQieGMYTBJGIgTX1G6UgA4h0f6IagrEkkBwcGL
	 qAo4WgkPDsU1ucUOyqaGDIjzs/y3rVxHp3qi3SlDSY9jtnW91Mb76qU/nzzb5+6CLoEEw
	 1IeqZkGO0YbX2xps3X4CUEkmPk1feryWTZ8Kl6pKBlApEwTmyw2FKm16bvB7aS3RYQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=b++CUAb4BP1U8numax1mGRF0DzNVSZ5I1v60rh5MgMY=;
	b=H2CMPX0LAH5uHPWPEnioEeIjIbUJS2wfW20w7qIOMYOVgaRrawHPqmdqlqbIQUU7IaFT
	 tRl2Oyp06A+ejkmWRAllTCUyJXm74vhuMKLxlJHEiqQST6R/8AkuwGp4/Ik2kQRgt/Sul
	 pjU4E/+fxb6CCOU7dFuCuDiVjtlm8hPk2TnHDQAeolQUvSTxhIm6lBcubxNHByTN8n1G5
	 Jd8Ale6dKN4dFYEXYFX3rOpQS5gE3qvT5PjiiAJUudIDDCaFAgPODBU+DrfOQleFq+YKu
	 05k6pK6I4aSdWL2XWVaRRwy6mlbnQpS0KORihnDU1sbKWIobfK3UTskdhAL1wUumvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEHDSgsF;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52928606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52928606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEHDSgsF
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b1ce85287aso1013983c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990547; x=1794595347; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b++CUAb4BP1U8numax1mGRF0DzNVSZ5I1v60rh5MgMY=;
        b=fEHDSgsFw0PWgjibjJSPBMKhNwFVGpIF9UErblzEB/MFO3vRzk7A78+I8fkDAIv+ia
         JFz41IIL6XFdmSv9hXwOvK/km4+CIefQ4p7AJGqQBX9s6wOJxkHKc8SoWq3LA3SlGvmP
         oqyc1J/gO4CcZFC6+h9+t2qWu2yqSSivtfgKXF3V9spf7JARldF9Q2nZtvdqcc/wMtSr
         tjodfEDz/wUHK7kRKUMoi5gkDPEpZK5NPdstAGZLZdqX5NnKrl/ymOhDGqwoA7ORbZmy
         861w9DL1nrQ241ehAaUECAmf2ySYJsSL+RTQQtnD4Fwy6AtqW/4tqbadOa6mLyjS6MB0
         oB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990547; x=1794595347;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b++CUAb4BP1U8numax1mGRF0DzNVSZ5I1v60rh5MgMY=;
        b=L/s81GsJsVVd6xLLetbwAEGGynUJW0J9oObTsF9KMA0tA2pfrbJ/bYeRD4TYyKXbjv
         Yjv+yWAynVS9uFmu1MqrhsqB+uiEG6VbucJU0aBFcz10RNb30mS16s5WCVMF5EvoP/+2
         pd09nuyaLxlASy4oWp04SNOJxdqQiEvovX7vFI+Zh/7wEg/yza0EryNPwlTKgZ/kmo6j
         FNI3ownt97q9vCdHf2E09uFYobr+GqfGeBjZuIwQVG7/45bX6IjJNEaeCGgJjHRDaFGb
         AwmO2H0WKuVBoktKF+A/aE2jFmIIOoaRjKHzPqkX2v8YeuFiVdolcQNcJitUXWSOlN/S
         wHFw==
X-Forwarded-Encrypted: i=1; AKwUvBw7D6KV1OmJzSb0vwzokpKkDYCcB8pre2s3KEH/sTEOfXTIMCYC0ZMd/Gp5dkP7jNjBXzONy1M/Yphj6+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OL8I2kAcIMWMVsKZCEDyAnqURu0/0mG37R8OZR0PWYcZ4BeyT
	YpV3qxl0tadYeogWpQZLeKkEpmzzdikhR/myTpSN85R63wT2W3znjJXn
X-Gm-Gg: AYBFou0qITFxFnUlM+eYCmhoU79w/edjOmx4RcwATj0IU6S9Dyw6k9+mZLAfFaL1Om0
	4sxSC+uQiWg+YJKPlZmLb5pgQ/JCh08XeEfYIrK0VtFW6a20+UA1utG3H+VlrdtQAYndAzJOncZ
	l8YyLHHvSs7gY1TGBVbjlgihIbpzYim1+uiJMicnSk5oplpWCOLoZ+W9/bGTCDcuXJdG8UITnV/
	2h7UrSmkvarmdDXiUg+4gYCAF2XeIrr1n3EsVUQBHTRh2KtbspUf7TAuugFQ2dCCkQBK8tzZdU9
	sEdKdbeXjanAgDtMTzB7tkdJjLwqF7PeqHKhYLNviALfW0nra4gP/X+f5Vs3scO8iSm0q6zFGJ1
	ghSHxQDP3HMyg3TIadGYhP39PklrTVwYb7uu/wty5TUZ1/m1NqmOF8XAYLWQLhlio25DzNIS7ec
	3BMht2LvcK+oj3wr8zKS+X6PEQ2xRka1cbrjvvJknjnzAlfdjqsSWiXhCRoGkXvqzM5msMJHrnM
	G78qU2M59us+WJClumzHUlB3/58RpLSr7+P+4QnLzRC7OpW+hbnbF24IA8RqFrynOkOO25iqCzR
	Fl7jrrHxuWb62naNTWAw67yxkywBN+xEtZyhmBcMBo3aEKCkjDSerg==
X-Received: by 2002:a05:7022:1216:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b25d31ca3bmr3593001c88.27.1793990547018;
        Fri, 06 Nov 2026 10:42:27 -0800 (PST)
Received: from localhost ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm6719300c88.8.2026.11.06.10.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:42:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:42:25 -0800
Message-Id: <DMOCKMZIM4I8.294MHBTBW494B@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "Farid Zakaria"
 <farid.m.zakaria@gmail.com>
Cc: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Shuah Khan" <shuah@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "John Ericson" <mail@johnericson.me>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <20261030.ohkopheePh2a@digikod.net>
In-Reply-To: <20261030.ohkopheePh2a@digikod.net>

On Fri Oct 30, 2026 at 5:09 AM PDT, Micka=C3=ABl Sala=C3=BCn wrote:

Sorry for the late response.
I welcomed a new member to the family (kid #4!), so I've been a little
more busy than usual ;)

> Hi Farid,
>
> Thanks for this RFC.  The Nix build sandbox is definitely a valid use
> case for Landlock.
>
> I didn't have time to do a full review of your patches yet, but I'll do
> that next week.  In the meantime, I have a few questions:
>
>
> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
>> This is a proposal for an idea to add support for landlock to work
>> better with build systems such as Nix where they want to apply
>> restrictions but the paths may not yet exist.
>>=20
>> TL;DR;
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> Landlock rules attach to inodes that exist when a ruleset is built.
>> That makes a directory shared between trusted and sandboxed tasks hard
>> to confine: the sandbox may create entries there with
>> LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
>> time, and granting read access on the directory to cover them exposes
>> every other entry as well. This series adds a rule flag that grants
>> access rights on the entries a domain creates in a directory, instead
>> of on the directory.
>>=20
>> Motivation
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> The motivating user is the Nix build sandbox. Every Nix build runs in
>> its own sandbox, and a build may only read its declared inputs in
>> /nix/store and must be able to write and read back the outputs it
>> creates there. Nix enforces this with a private mount namespace: it
>> creates an empty store directory and bind-mounts each input path into
>> it, one mount per input. Nix has paid this per-input cost since the
>> sandbox was introduced [1].
>>=20
>> The cost is paid per build and grows with the size of the input
>> closure. Nix is moving towards much finer-grained builds (many small
>> derivations instead of a few large ones), so the number of sandboxes
>> grows while each build's own work shrinks, and the sandbox setup is
>> becoming the bottleneck. A typical build has hundreds of inputs; large
>> ones have thousands.
>>=20
>> A microbenchmark sets up and tears down a Nix-like sandbox (user,
>> mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
>> removing the chroot afterwards). It compares one bind mount per input
>> with a single bind mount of the whole store plus one Landlock rule per
>> input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
>> ext4, 16 cores:
>>=20
>>   inputs   bind mount per input   one bind mount + Landlock   speedup
>>       10         3.2 ms                    2.3 ms               1.4x
>>      100        11.6 ms                    2.8 ms               4.1x
>>     1000        79.3 ms                    6.4 ms              12.4x
>>     5000       400.1 ms                   24.4 ms              16.4x
>
> Did you do this benchmark with this series?  Do you have the related
> code to easily reproduce it?
>

I have uploaded the benchmark and steps here:
https://gist.github.com/fzakaria/3c9589f17cb54e6e35165e11402686a2

>>=20
>> With Landlock, an input costs an O_PATH open and a landlock_add_rule()
>> call: there is a single mount, and no mountpoint directory to create
>> before the build and remove after it (removing the 1000 empty
>> mountpoints alone took 17 ms).
>>=20
>> The single bind mount is only sound if the store listing and the
>> undeclared store paths stay unreadable while the build can still use
>> its outputs. Without this series, covering the outputs requires a rule
>> on /nix/store itself, which makes every store path readable again.
>>=20
>> [1] https://github.com/NixOS/nix/issues/179
>
> I'm wondering if the Nix build sandbox can create the store dir per
> build before the actual build.  Isn't already the case with the bind
> mount?
>

The problem is that it's not always a directory; it can be a file or a
symlink. The builder communicates success also via the creation of the
output path as well, so the pre-creation of it would circumvent that.



>>=20
>> Series
>> =3D=3D=3D=3D=3D=3D
>>=20
>> Patch 1 lets an LSM observe inode creation through the
>> inode_init_security hook when no LSM provides an xattr. Patch 2 adds
>> the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps the
>> ABI to 13. Patch 3 adds selftests.
>>=20
>> Testing
>> =3D=3D=3D=3D=3D=3D=3D
>>=20
>> The series applies to the Landlock next branch (3e271a27c46f) and was
>> tested on Linux 7.3 with that branch applied.
>>=20
>> Without patch 2, the five new tests and the ABI version check fail.
>>=20
>> Open questions
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> - A created inode stays pinned until the layer's hierarchy is freed, so =
a
>>   sandbox that creates many entries in such a directory keeps them all i=
n
>>   memory. Should this be bounded?
>
> Only the sandbox creator should pay for the related kernel memory
> allocations, and this should be at creation time.

That is not the case in this version. The allocation happens in
landlock_add_created().

>
> Another property that would be nice is that if a sandboxed process can
> create a file, the related policy should also make it possible to delete
> this file.  Is that the case with the current approach?  We need to
> think not only about the lifetime of the sandbox, but about consecutive
> creations of such sandboxes by/for the same program.
>

Partially with this implementation. The sandbox can delete all entries
below due to teh hierarchical nature of the rule but cannot delete he
entry.

I will do more research about consecutive sandboxes.

The research I have done so far from the the feedback on this RFC though
leads me to believe Gunther's parent + basename approach.

I guess overall this RFC is to add support for a feature where we can
apply landlock rules to files/directories that are not yet created via
the Nix use case.

>>=20
>> - Creation is detected in inode_init_security, so on filesystems that do
>>   not call security_inode_init_security() created entries get no rights.
>>   Is there a better hook?
>>=20
>> - Through overlayfs, created entries get no rights either, because the
>>   upper inode is created with the mounter's credentials. Should overlayf=
s
>>   be handled, e.g. via security_dentry_create_files_as()?
>>=20
>> - A file renamed or linked in keeps only the rights it had at its source=
.
>>   Should it get none instead?
>>=20
>> ---
>> Farid Zakaria (3):
>>       lsm: Call inode_init_security hooks without xattrs
>>       landlock: Add access rights on created files
>>       selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
>>=20
>>  Documentation/userspace-api/landlock.rst     |  42 +++++
>>  include/uapi/linux/landlock.h                |  18 +++
>>  security/landlock/domain.c                   | 182 ++++++++++++++++++++=
-
>>  security/landlock/domain.h                   |  28 ++++
>>  security/landlock/fs.c                       | 176 +++++++++++++++++++-=
-
>>  security/landlock/object.h                   |   6 +
>>  security/landlock/ruleset.c                  |   6 +
>>  security/landlock/ruleset.h                  |  14 ++
>>  security/landlock/syscalls.c                 |  20 ++-
>>  security/security.c                          |   9 +-
>>  tools/testing/selftests/landlock/base_test.c |   2 +-
>>  tools/testing/selftests/landlock/fs_test.c   | 227 ++++++++++++++++++++=
+++++++
>>  12 files changed, 703 insertions(+), 27 deletions(-)
>> ---
>> base-commit: 3e271a27c46fd591d1011c7de5a644a41e2010f1
>> change-id: 20261024-landlock-created-rights-9340b00a8c4d
>>=20
>> Best regards,
>> -- =20
>> Farid Zakaria <farid.m.zakaria@gmail.com>
>>=20
>>=20


