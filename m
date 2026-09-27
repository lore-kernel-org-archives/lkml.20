Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2C175A8D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529599; cv=pass; b=goxofAv8q7Ss+XKGjdB9H6pOtLxX+XGdUTW1U+TIVwZ5eQKheKJijGH8tinjKCij/UYMv8sYLbGQSjI0HyVE9/zdu0EIoGHCZhfeITf/sV5OrHhf8eYYgJj4Rz7YV17GX12QlYS4yOML5xqmxme0/Kx6VzacdbCHCcrw1yFoyJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529599; c=relaxed/simple;
	bh=NgU7t86W/VexiwqKV9fxVLNSEaHoaTI7MJusd6ZnYzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg/VcXPQcsIksJgnDEN8cPA8VCh98m2dwdmaSl0dvD0LHgs8zOkaXE7QSWnrkMZC93CAl1K1i+mJosiSby+xrxTq8zrzQer5HpXvP0RSPBpysWZPAV4zrYvxs7gSQpWEk2EG2sdZbrDaocaTrG/YZtHV2wWrAhJCEfsbk4cNiaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN/dTztp; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN/dTztp"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf2ab41bbso222880a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790529596; cv=none;
        d=google.com; s=arc-20260327;
        b=rS4WGASMMNBRkD7o35jy+tqHCHbROwlY8hVzTCIdRwCh8RbreDgMGgZjxXEALhhYy1
         1tPrMqMALiF7jJrfPITwWUDU1vugqQNqPWRYImWXn0LT/fjDX3hA9YsO7ECLJD+Xm3gA
         97Q/kS1VZ/BefdfDN8pIG9YO/0iHYkc2zFAF1QhsdO0OrZIC2bjyKfvg57MkSSM7CVd7
         1BKKFlZXS+u/gCf0in7P5Kga7tkUn2ONSPQybPKdMFuQg3K+tE8nBNFKn+kNa1hwLJhP
         5EDbXKmZFhRk536Pbvaxq9BMJlV8aCRUezKXYZQyOcbKln1vXarIc2Usebn3VCkheX5Z
         xnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/R4IpN8egmbt+t8Ci9l3zcVKOJVLWdh83YYmUmU9rXA=;
        fh=4uaSaPnoCKpNHSrx1d3HZunUavVUGPTYFpsTdfb/JjQ=;
        b=S/io1L2bwWYdCxAUokp/CSGh5bWS+6g1BcF478s4zyYLYdCORk8aY6glpdGR8rbcah
         8bDqmvMmZbB8cmPToVoGkfzmaJV7L81pn3dLTwCWGenzbgyD9MaaqIRkimMvO/eF5jnr
         FpdNBXS6wwSOsKBRuWOJqySaHU/0PUM0pe1PtOJYwV/Y/6z+fx20deCRcjmWdLGLjRgZ
         EQt0R6Xc4vJbOqaJgOrtlFPIA3+TCTmNRXkUj/q356B3vrlD/UHgqIw/oc8kVhao57i5
         8PWeM31NfZQl2smCHriIs8pZeFx75l5hfYTsdniLtfzrP1/TPCpfhsaG0D8/5kXtjNCs
         QlAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790529596; x=1791134396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/R4IpN8egmbt+t8Ci9l3zcVKOJVLWdh83YYmUmU9rXA=;
        b=JN/dTztp5uBkVnr6owRPG+oeELNoohat3/eUjTx6gvx9CdxgoF3JZth2R8/9CJJV/X
         Lki27GSbXucwze04slXd5e3AonvCAk0x8uHm+2Hk43pycy1aL8vXk4GFMQJqI28h/C4r
         TjtUuJlnwB7onadn0T3OLEZYnD5DEqEYVmM8Q78B/U2QCfLtc2JCGuYwLQrwILT703Du
         yY5KJcnwWtSX/MWqg2q8xkAJwXXMyvBiWlXoJ+5eF4p3aQDrFUcH/WJW0HBYOsClO9S0
         BWOSQZ7/JoLxZIZ4ocvWr13cxXcVqvVxZYerW42xk3p4011Ympib5kWh1G6pLABoq8Kg
         hCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790529596; x=1791134396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/R4IpN8egmbt+t8Ci9l3zcVKOJVLWdh83YYmUmU9rXA=;
        b=cKRImtV11kTewv8FOH7E4zwtZLXR/LlR+4qHifZkMiPnaFkVCVWDYhO4E+uezHxPTm
         ypz335lxOqk6fbG5T5vFe0MXqMqYq3Msa9W+MgYxOh6NMJhauY1chvpYgz5YVlE9psU0
         mvIB75ou9RWBMXZX/5LGESvxd02EOCAVWE3rdbJGjl/BCji7gtyfPgPFjoltGMJGW/oA
         G2rFLTRGRUkzvw+Ahvn2pdba+Td3LN8SB7HhyzHH7eDDzE7OBNwtOYzqN5I2jEqwk7LO
         tuHQHKlgdEPv1fVtIfHPyDaZyTeyOm0a/F2VZsYuWYKzJO+dOT0u6kyqHHj/Kp+Dow2Z
         shLg==
X-Forwarded-Encrypted: i=1; AKwUvBx7l6yFblQe5kA2UwJlW4vJW6Gd0EDmhsuu/5eOmhTXHnUC/543CmK1Cw13UuHk5aVNGltYfo8NSOvf7x4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzlQwzVIpX3AyWhVKBno9e65+3yWRqg4LMpJIXUQJZRB9n4ufk
	rOJFvrKTnp+7MwxHFcYpq2Fwa4rrC6mFKXbCE5LkGUUwS01pfns28L+OhkcSZZCqapqeHYwFVpR
	/KOpTctW0dCl8xWbk2P409Fq7jeJhsQA=
X-Gm-Gg: AYBFou3yjS9PmPdZKeGBQxpHd2M+JxIxNVeFEPU2BCEetw0Pt0QLIf4+kWthNw86p8C
	3FOsiBgbZHcjk+FUtqUYCJULf2jNQqEyGCAoGg3cqsHkY66ggKahxQPXVTj5n3zyvpXThOmKq/5
	JopqOPZQhgR/fDyd9wgqUu9J7IV8ZxzRq3kV/RdfxvnKe2cqbabKfgrDxrthR14Q1NZ6HkeH5He
	Qu0kMAcsErCniSVUqgu7OI6U642FFl13FI7H6WvDyjLxyzA3u26ZSv4WLtdV0/3VUun0PdhhPfX
	Rj662pjtr47bynb2Ek5WrSEBezJK0cScBKp65QT2Jt1md78UGZKp+iR1a5R7T7gUKLcb94NxZT/
	9pf4DZ1DCAP0=
X-Received: by 2002:a05:6402:13ca:b0:6aa:490e:5518 with SMTP id
 4fb4d7f45d1cf-6aae1fcf708mr7295949a12.2.1790529596172; Sun, 27 Sep 2026
 10:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904080940.575882-1-nicoyip.dev@gmail.com> <aqHhZO0GjMTOer4j@kernel.org>
In-Reply-To: <aqHhZO0GjMTOer4j@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Mon, 28 Sep 2026 01:19:44 +0800
X-Gm-Features: AclHuK8YMIA5n5DLx6saWD3JedHa-zp1toc5aC5wKE4OHA3Bf05WcoKKBxjw3MI
Message-ID: <CAAo+4rW_kT_GL_3cr8aSHkAM29yQQgNL4EJktfTirOi4nHwOOA@mail.gmail.com>
Subject: Re: [PATCH v2] keys: Fix key_user use-after-free during ownership changes
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 6:44=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Fri, Sep 04, 2026 at 04:09:40PM +0800, Chengfeng Ye wrote:
> > keyctl_chown_key() replaces key->user and then drops the key's
> > reference to the previous key_user. Several paths access key->user
> > without any common synchronization with this replacement, including
> > the /proc/keys iterators, find_keyring_by_name(), quota accounting, and
> > key instantiation.
> >
> > This allows an ownership change to free the previous key_user while a
> > reader is still accessing it:
> >
> >   CPU 0 (/proc/keys)            CPU 1 (KEYCTL_CHOWN)
> >   user =3D key->user
> >                                 old =3D key->user
> >                                 key->user =3D newowner
> >                                 key_user_put(old)
> >                                   kfree(old)
> >   uid =3D user->uid
> >
> > The same missing synchronization also can corrupt instantiated-key
> > accounting. KEY_LOOKUP_PARTIAL allows keyctl_chown_key() to change the
> > owner of a key while it is still being instantiated:
> >
> >   CPU 0 (instantiate)           CPU 1 (KEYCTL_CHOWN)
> >   atomic_inc(old->nikeys)
> >                                 observe KEY_IS_UNINSTANTIATED
> >                                 skip the nikeys transfer
> >                                 key->user =3D newowner
> >   mark key instantiated
> >
> > The increment remains charged to the previous owner. Quota reservation
> > can similarly select one owner for its quota limit and another owner
> > for the usage update, or access an owner that has already been freed.
> >
> > The existing locks do not provide common exclusion for these
> > operations. keyctl_chown_key() holds key->sem, key construction uses
> > key_construction_mutex, and the affected readers hold their respective
> > tree or list locks.
> >
> > Use key_user_lock to serialize access to key ownership. Hold it across
> > the accounting transfer and key->user replacement in keyctl_chown_key()=
.
> > Use the same lock while readers copy the owner's UID, while quota usage
> > is updated, and while the instantiated-key count and key state are
> > committed.
> >
> > key_user_lock already serializes final key_user removal, so an old
> > owner cannot be freed while one of these readers is accessing it.
> >
> > Fixes: 5801649d8b83 ("[PATCH] keys: let keyctl_chown() change a key's o=
wner")
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> > ---
> > Changes in v2:
> > - Audit every user->uid occurrence and all direct key->user accesses.
> > - Take key_user_lock explicitly at each namespace-filtering reader inst=
ead
> >   of hiding the lock acquisition in an accessor.
> > - Serialize quota reservation and construction accounting with ownershi=
p
> >   changes while preserving the existing direct key->user accesses.
> > - Use the commit that introduced ownership changes as the Fixes target.
> >
> > Link: https://lore.kernel.org/keyrings/20260823170448.3856516-1-nicoyip=
.dev@gmail.com/ [v1]
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#se=
parate-your-changes
>
> I.e. no bundle commits. This unreviewable.

Thanks for the review. I have split the changes into two patches
and sent them as v3:

https://lists.openwall.net/linux-kernel/2026/09/27/734

Best regards,
Chengfeng
