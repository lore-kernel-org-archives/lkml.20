Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A674EA38C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417485; cv=pass; b=Fv+SSSEJr9Tzj8s3foYE0+Cb2/vDY/p2IBmBAtBUm7zkp+7fwjrEbS+rUcTvRvBGAR51TUQUqFBWX4GboCjlLiR7bJ60DyM85gnCwO3o3AslSz0DGLikXP389YxD2tzfV+OG1vf01cqI4hmDr73IK1sd49IoGPZpdTDjABNH3T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417485; c=relaxed/simple;
	bh=N6otFQ+2tvXWfIAg1Rmz2WPlSNDcEmt3lrNhdwAkn1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBf4cEzdm+ZNl9wUIyOibsk7imde8M/a1j1ZsnMvlQTP11pn/+68pkOZVWq/lbiOrn+ElOb0oal17DTSE1nn6thmHC7wdlN0mB4kR54TzeW4fg3xKegxJYwf6BSYtKafqfhGMqcyzgg/QP5wCANxqlxmoV1fpBD7p71gJLAF2Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMJkUPsu; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMJkUPsu"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67489c8202cso1755816d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792417483; cv=none;
        d=google.com; s=arc-20260327;
        b=LZ6o1Be5Une1bCd5Nvxf+DR1xIkVZCNJYLNhImmsiK8SD+49B9+UJpxlFNKnvoKtYU
         Zwm8zaiWEg7I7BfnsMgJpPegQ8azk/MmGdOubnvq4c8L0u8Xe9F4sb0RWiSgsmZ5kiDE
         fw2u6tkqmGmaXQoXUxiCNZEBoWFWW2Nt4kUyPsP5vGME9B8N6CByr1Sz/BSII7Lze+39
         fn6Yqn/+SWJ/xWdnJXc8crZjbUToPeiDWoPlFgiD5ERM79dS5ixtEigpJgNkd9J7vFZ+
         1poiWFfsdpFc9EqtmwlbhEr3eFg/2nDWO+s8crV/QwBZMpgpmpT9kUqKZkmq1OJJz/Sf
         FL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c6zrnlMaydst9vfRtkenLVpyYJzF31Gchs+iCqt4/Js=;
        fh=e2JdtflzTut5S1cbN+WxAaHx6oFdKjPzF9SacreeWxg=;
        b=NXio/N3Bc7hASKFdRxgz9IH1DOl2DH7HpkDVSMmeH+RDmSQ6lYpuepEcKAUOdP38zn
         rfEYhXN/8Vd9cNrdVFgz6zC6RApPqdXBSjBxOPYIBCDBOltCTLWeMpSTg9Uk01aI+YxL
         q1TQxplS+SpyR0xEaMiFWe1F+CcSvxzYM0QGpFQ6foaODzMy1uCDTPaxim65V+pOuC9D
         ogFQdyhWCLh4rsbzgSJjS9OUiLXEDh/GgdtyYeMHA4pqmSiNvUCA6/ppKqToj/U98P+5
         zO5UxrBpzL7BDMvNBAwwem8edSOh35Z2hvsFuHpJGyODZ33yUriMUWnqpjG+YTFVZeTg
         y5qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417483; x=1793022283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6zrnlMaydst9vfRtkenLVpyYJzF31Gchs+iCqt4/Js=;
        b=XMJkUPsu1t0oqb5FTHAqh0nN0qy6nwNumSAxhKyxdMBQDWkyz8dvy3OwUdcMdYKav9
         J7rUr990EwuAOO6+Rf7p/N/RdPKOv+vXlT3m/8Y/UnN6mBv8f0kDzMbMi6w1qhRuN6Fm
         KLLIizDyQU0/nF48oxtIlGvUkKbwuADh5oop+9YCoXq4LqBMsOYBn2ig3jlq41J2MoNN
         sQM4asFhIokTdJ0aTkxh51Xz3TF7ne74++5EvVb5dIdPgHnZuNB33kwDpFUX6qgOt2Mg
         vv3j+qgvllqrBqbnL85i8Sbsr8sRix5zTjOODraxLih9YbAZcbwTLz4S4pJF1iuTBWKp
         i8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417483; x=1793022283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6zrnlMaydst9vfRtkenLVpyYJzF31Gchs+iCqt4/Js=;
        b=EBk27sQivdOyryOyO9adOjgtEQd7K5EHF2On2NVvBAvr1t/Mnie1pIyU0/HcjlFiCC
         rWDp1SHKBggAvjZ0Eg0FldH3NclKpAg406crclTkQ8xR50KY+xaRj4r3SgpdnZ/kW9JJ
         t4GCWTZCfH0Pa7QGR6jPtbvRG/SmLaIYPXOy4RdaUHax9RbRit/24brDJu5E1WzDQy0d
         hpgZkkzmCX9NtVjVrGofkXxGoDBcWughSdHhWZfKKj2rfkgk1CH8lhXZQw4WPNGcrTRv
         nFUB0RmchfU6//MyndSYqkTMCXozwJ2nTNYTxiBP1wi9yYwwTBnlX9zs/AifeOQHrWvM
         AiJA==
X-Forwarded-Encrypted: i=1; AKwUvBwU5K+XJjap5G8JMU//4R6QNNCSY2xJvxZckrKKlr+3G6Jr41RIOiGZjyzyxAtKAzlVNelcYDGmuyFR6ZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrQgrJ1fc+WchjpyvwailaEQqjrJ4Jo6cQhR23AT8eUwRh3Ajt
	wpHEmNLGC1V71G1hvMZ4dxJhe6d1PMBGADV9IU8o/WFMRueHEXOaI90IFnasGWBOMuflJXLVyE6
	qMhF1xMeOridx/J54JOiu+hwL/KP+eaw=
X-Gm-Gg: AYBFou3xQ/5PFdxcE4mu9hz/B8YLUA7moOGUN4h7mUmQupPWRAap3QgHskkkPOqS+FM
	0Ruzj0+qfftyKwAjQ6iFIHXpJvaKZ/X+iVzp0e85tETEcDgyKTtS5NJaOCKT34/wGDjpkUdj685
	txxYd29KjWJew8zXnOY1u6fwKjErkiqU0VSSBCiJX1B0ybBxOzhIS6QdORP6U7ItOYUCtHTzx8P
	U3hqz86c9LaFR1JA2NUt7iKtZ+wlWbiNhksO414mrRr1cfH64Tm3MEyEQtoHYfAqF6P3SY6Ut5O
	OzeZFsm6jeLUb+T9Ih4DLF4OJUamBJbPV72YpfJXMiPUq5K8YCIYl2r9c9suJCAnzRxTZVjO96Y
	GSDt64PzOKA==
X-Received: by 2002:a05:690e:400b:b0:677:d31f:5a6b with SMTP id
 956f58d0204a3-679ca744115mr2203453d50.16.1792417483474; Mon, 19 Oct 2026
 06:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0012-v5-a0413a339b72c02fc885@gmail.com>
 <b273a680-6b96-4fd6-94e6-c1a79922efc2@linux.alibaba.com>
In-Reply-To: <b273a680-6b96-4fd6-94e6-c1a79922efc2@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 19 Oct 2026 21:44:31 +0800
X-Gm-Features: AclHuK-1bDPBzjxBFC-g5JhoX08zvMpID73JpPkYTgaCzs0JQP3z-Kv1Dhf22ZY
Message-ID: <CAFRLqsXdt0sDKAkKmWH0aL=urZgWWEwhGjnWpkx5CyDkDqnukA@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: Keep the dentry lock inode alive until callbacks drain
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, jack@suse.cz, 
	akpm@linux-foundation.org, rgoldwyn@suse.de, srinivas.eeda@oracle.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=B8=80 19:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Commit 9f70968af3e6e ("ocfs2: Re-order iput in ocfs2_drop_dentry_lock")
> is what moved iput() above ocfs2_simple_drop_lockres() to begin with, and
> it was a deliberate move:
>
>   Do this to avoid a theoretical (I haven't seen this in practice) race w=
here
>   the downconvert thread might drop the dentry lock, allowing a remote un=
link
>   to proceed before dropping the inode locks. This could bounce access to=
 the
>   orphan dir between nodes.
>
> With the new order the downconvert thread gives up the dentry lockres and
> only afterwards reaches iput() -> ocfs2_evict_inode() ->
> ocfs2_delete_inode(), which takes the nfs_sync lock in shared mode and
> then the inode lock exclusive.
>
> Thanks,
> Joseph

Thank you for the review and pointing out the history.

I will preserve iput() before ocfs2_simple_drop_lockres(). The stale
access is in ocfs2_get_dentry_osb(),
which obtains osb through dl_inode->i_sb after the final inode
reference may have been dropped.

For v2, I plan to store osb in the lock resource=E2=80=99s existing l_priv
field, use the default osb lookup, and recover
the containing dentry lock with container_of(). The mount context is
freed after DLM shutdown, so the callbacks
can obtain it without accessing the inode.

This preserves the existing inode and open lock release order. I will
send a revised patch soon.

Best regards,
Cen Zhang
