Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590252;
	b=3Z40pxzlJrM8v+UYJbSw+xfos6ysIeanxRseCFfUrx5AL8upCjXLxeKWoGDgIZj5EfLa
	 k5SGz0Ts8gU9qidEuEpe9UZgaAfLS0Y7zlVc9hEfiPfcVWZJ//A3wNnGwDa0LsQhTvWXu
	 eXsQc/pmwViKv7oUMZacm7aEAlEyXHZ8U8iwhKIdvRsRnZjSv4s4EjUjw9OYpkwhl0YrN
	 FshgoizjmwrfHnvOhBrUEwBllqR7SChaICQC6U/FiidGJNckqhW/DKXdofCmE4Z3V1qcM
	 wb1WVjTW/Zd6vU6TM1xGNSUbPy0B36FhSMncPDVzzOqoXPH5EkTQIqWZO1SX04NDNpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590252;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cqDKtFMuzM9nM0G2aV2TVkGy3zyEu8z8hK7b+kmnLG4=;
	b=d5+TKqsTj4oyAnrtz34XNlKBxHcWYU7jpLHDcbkj9+6JtdmjaBAdG5aJkbDzCOGaDDXB
	 Dej0F07tu4lymDPJCR9n7xrDni26MZCDO6qqVkY0CSBizadqBCyQDIMuaFj3uPnVaNTWy
	 ePWcSvrz8MVzFaXhKReWAG8Ej8ny25yUKQfwWt0iGnuwU+pR4e6GOL88Tp/1zdPglts+z
	 fW5rJ+PiX0jtQb0dBrI1q7Kv2zTY3pKWY/LMZo0QVjsBl/Wocu03xNRidprP0aOkrG/MH
	 oRUxIompPrg+6XkOwzfvgEK21T/ScOJyZbduveOZmiv86aKm1uh5l8VKa3KaRep8K2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ox4s7H7B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ox4s7H7B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B251F000C6
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590252;
	bh=cqDKtFMuzM9nM0G2aV2TVkGy3zyEu8z8hK7b+kmnLG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ox4s7H7BoeYAZ8zyjP1xMQfAqSlN7aFGnFrA34DAsPj/FrYMN8nthOupxOowRluNO
	 1UHuW3V7e5rHXNZW+G4zirVII6VYjzhW7r9PnpP8TN7qXTWFe07numuVI4Nczu2bnG
	 M0sFy6z6rdZK/zFyCPWLwx3mVg+c7HOJ6tmWC8KEQMVol45a/F/TuPmPcDK+rpC3o5
	 BhzofZaBn+6uMsG0X0YJU33ohtDw1KydVkSung2QVv8BXSbZybtt/T8WYDqAeLdZGM
	 93ZQIQPxh6/jUy1bw2jZqar82+av+MVcWTHAn+qm59pTlrn4i3McLgMku+L/izmJtn
	 bqUvI5U3Xe38Q==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798eb0d13fso833447d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXRDLtq12KFkeOphA1wy3SwsAqEKsWoJw4+l4THbpaWGBaqtPDjjgychJ+9WjptDbadV3pBwrfJ+qeecg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ZJK3y3/spgMxdILBLpFCigmiub/LgRtwRXLMNycbmDMMADIj
	iiQNp4fewgyAvPylZAjbE89d2xViyO06xas1UbdV7Na5vXuJCuvXSaSouuXj8w7ESnkwMX4okF0
	fbolFnNfkPRtb8bpjAYKgncVp/ONEDXc=
X-Received: by 2002:a05:690e:804:20b0:677:a8c0:38c6 with SMTP id
 956f58d0204a3-67a0e4cf21amr417304d50.57.1792590251399; Wed, 21 Oct 2026
 06:44:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929024352.1433257-1-neilb@ownmail.net>
In-Reply-To: <20260929024352.1433257-1-neilb@ownmail.net>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 21 Oct 2026 22:43:57 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8GogxyNSt3NZpcm9-fP019PmWAgsNzwKCdYrQFvOyvkw@mail.gmail.com>
X-Gm-Features: AclHuK-re9OmwPwi_QV1RyAbfMBgOF9gAwJh6SamYX146AyGEclwJIeQKPZJtkw
Message-ID: <CAKYAXd8GogxyNSt3NZpcm9-fP019PmWAgsNzwKCdYrQFvOyvkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] smb/client(cifs): prepare for VFS locking changes.
To: NeilBrown <neil@brown.name>
Cc: Paulo Alcantara <pc@manguebit.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 11:44=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrot=
e:
>
> The previous version of this series had a couple of problems reported by =
sashiko,
> both in 2/3.
> 1/ an error from cifs_lookup() wasn't handled properly - it should be fat=
al
> 2/ The d_is_positive() tested the wrong dentry.
>
> Original intro message below.
> Thanks,
> NeilBrown
>
>
> I am working on changes to directory locking.  The medium term goal is
> to lift d_alloc_parallel() locking above i_rwsem, so d_alloc_paralle()
> can be run unlocked, and consequently cannot be called when ->i_rwsem is
> held.
>
> The requires:
>  1/ that d_alloc_parallel() not be called while i_rwsem is held.  cifs
>     does this in a couple of places.  A new interface d_alloc_trylock()
>     is now available and can be used instead.
>
>  2/ a dentry must not be d_drop()ed while an operation is ongoing, as an
>     unlocked d_alloc_parallel() would then be able to create a new
>     dentry with the same name.  In particular d_rehash() must be phased
>     out as it won't be safe.  This particularly affects the mechanism to
>     block lookups/revalidates while an unlink/rename is happening.  The
>     mechanism is changed to use one similar to how NFS addresses this
>     needed, though using the new LOOKUP_PRIVATE flag.
>
> The patches depend on patches recently added to the vfs tree.  I would
> prefer these land in that tree too with an Acked-by or similar from cifs
> maintainers.
>
> Thanks,
> NeilBrown
>
>  [PATCH v2 1/3] smb/client: don't unhash and rehash to prevent new
>  [PATCH v2 2/3] smb/client: use d_alloc_trylock in
>  [PATCH v2 3/3] smb/client: Use d_alloc_trylock() in
Looks good to me:)
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
