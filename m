Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255303;
	b=jkaICJqY3w1JO/3MDzYIZovMvp1GzNiGZz4ABphHLhChpyxrcyA561WFs70keIblVusG
	 s+ydVsja0ro/BzOY+q/3f0IWOdyZmDSwW+jnr5/fGokwas1lUlLmD15zQl6bp/wpQoz5X
	 1Gmk392SInRo7NkjXNHububAZn8j57PCZKjGqei7HwcSYC06JIDca98N1LNEsQWU+uegy
	 lTZV1TDeg9JAJwPf3199mAEjFGQZOUeq7rqhTAmiIBxUMCO5KFI3QBgfgqnVK+c1F63TF
	 7PoGPP6WoXik9NYHJ31BL99bxAhsxN07G0mtKkFYyV/g/MBpc+zeFdgcP2d+MuFrhmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dcA3JlLu3QaK+Vcd+6otPpngHTSFEBthNfyVcNg6yB0=;
	b=sgeX84z3SPTV25U2dcKoftS+ZOIFL4swyw/HgK6p18FFItMDNqLZnEj31xBSVcxvR16P
	 jAsuEYBD13DqVIK+u2F8aiwWCsvMbJcamjmoj9ciofAG/JoBBUXCf2e6cU8GqPPVnZLA5
	 SBVfFk8n/xQPr6pbGyUhsdbVyNlwk6eF887762BPAMZcVhHJVV5ky8a61XOB3cSG4tBuV
	 mKkfXhkiagGuuv3SkwgHagZ/a+X70yEO9C6KJNzIS8lf2keylzNlGo4jgfLYO2QY1x343
	 HSM9NHvG2OUHMtnFX8eR+eo0SI81r+pSZsR6rIPRyCxVhxgzWJPzr3nj7i1d46njkmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=JM3aG7UD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D26C606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D26C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=JM3aG7UD
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso590919b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:15:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255303; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXH4vxQoOJE8irJ3Jsj73najfxyUjoOXDzGeCiq4ZEsln6vpINPASqWgi4Gk3Cv4tv
         rGcuRZzvSY2QhUygUOdEw+PpnmV0EKerbHokU/KCmJyiim77sCLSQiUvmNY1Ae12/KrE
         Eb/8zBt4W4LpSgy9o1jNr9FsPwsK7bcNQiVdbdgodeEKxroujczfkLhQl963VUMXP5oE
         VjId2fDI1CPRWinjcM+PE5buwYI8pU1UbZ9/BDOD9HveDOWVqQDX1qQSiiAtxVWElDWm
         umgDd3MfZ0cvzQZnSXL7lDZP+sWShUfegcSPyJWc6GWe6Mo2URXcKg1c+c58gewpQqeS
         7r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcA3JlLu3QaK+Vcd+6otPpngHTSFEBthNfyVcNg6yB0=;
        fh=bDo1ZObKACemnd81+7oefit4hSb6E+oJNecJOqJ8BUI=;
        b=YCQM/ePNpDdl1Q9ebiXQ0ko0yZp4I1AD/eRohMJdALKOMYZCrcrkxyKKh12AMPXWoi
         bXEXc22oIyrNilZ8Fyg9/xm/a6ArBpEFk7cLr1ofB0utRC5qrV91goSNH73yj6Gak3LG
         zXllcXDMlfS35BOPGV59nES/N1bPe1/NAvcj+NM1SFnx472+L86aE2X3htEHJbKSQ66o
         zndAepHUwVTmtboJPmFgw61opxVcBQSxfID4Lc1VaNrwJ03RsZNIODYQHTWAQf0DzvF2
         9R2+q/EgYpz2EfBhe2BEjmOlI+GtU/q3VnJx/HmZc/kpcNLTcVa2wQhAK8jBz9Opfcyu
         KkBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794255303; x=1794860103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcA3JlLu3QaK+Vcd+6otPpngHTSFEBthNfyVcNg6yB0=;
        b=JM3aG7UDhE3ppbxcli+QQzARg2Kk347vy5ytnvpfinkJQjCez8mFUwcYs8+/PrAO8z
         qQXYwQgzy8NbHr19R7sZA4uRrRbYDLtCZTFfnP5xl9j5o2XEJs++ZuMTq6tvsc8/HEJn
         psFEtb6JYK9B1K2UCYWdaKijgaM/Sq6WoMXKjc08cwsZyhvosTpftZa2yma2RSbfY9xo
         Q3vHnPYquzJjxSmB1OqnqGohXqzBVuNzvCn+GTJhiNm7oW7SLON4wQa1VbC7cxzBbOjC
         DAXh9HTRv9+dK3JjCLtk1lYJ3Sq5ALw0klGRsuHQqUUOUkAIo4X4iR8NKPL5u45oL4wJ
         ht3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255303; x=1794860103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcA3JlLu3QaK+Vcd+6otPpngHTSFEBthNfyVcNg6yB0=;
        b=16+S2hv7uORUz9Mo+Ljy1OHCV/Fo8Ofseg+5Co77VikWoLZ5qq/dmns0iH3ijmzjeC
         uumw9FzUMxP3jagbsGEGt8Wx9O87LqHvA651NGtoCmHa3Nqvv/9KhbgbAs6ObvVQyplZ
         EDunbDR4fS2KsP5Gd+Mz3BPYEW4lVx17+b22yju4RaYuQUkgY2QZNcLacJBInf/B253Q
         gLJRzL6JMoGWtdBnTf1jkRzEfC0BhV7/25E/C4ZNydxZzj3vSxjxuNYGCYX7l7aBYO+o
         FAiCRqcJGCLhF4e3dlNfdxd1GSghNmnKYA+EeAQ5BsX7RmFMrSDEtBHQzGwcXCHIpRjy
         gyeA==
X-Forwarded-Encrypted: i=1; AL+hErHSqLA7oszvIrjm7zprqFDWbjt4LVJFhCickMDEQXNmxKytaAGCA2AhRGGhLmQ1pSkWjkTe3ob72EzLgyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9US0b1yjrpYa3lkAt7wBF+M6oYarhqNsfGPkiEdxlc/4DXCf8Q
	cU6swDnW6YHglKDBTcf3xp6lsKo9+3vnFadzq2zQ3MQxdwRlwGpJH9wg/AuX3DHpsNjh6S/gyEc
	SsLJxO1KeZ0o932Ntg9V72aMVq3WPu/tEOOsJXso+
X-Gm-Gg: AYBFou2s1NjuvDh9xwUIxPLF+o2NBBXUk0I9GU9cJY6XweURdZgtrjlZqqFxeXIQGqz
	q73PSQNVLPqDhu4+08fbHwbvJTTMJLLlPL0cwGVuDOwhddbLS2audCHkWgnpX2pJkhUKmJ+39wt
	9oXeT4wYNJAT9RMf83QLjy6lVEzusuRLO7AeZIcmxQrF4kevm6sLLhEC6ft9GRrIaB/7GsS0w79
	6yH2/hLOZRKXtB4RtzwUk+gKWYl9ZNjQjU+qoB/rlPXk6W2qPBmaLG1JZa1xMV8MmwTXDk3vcxW
	PQEY8nt0J9x3REOQR8+VlzsIqBB3TrWq2NSbXtxYjQwmetAvdfpW8yzPvw79kqPjJzqTMmeHj7P
	KT1j9nqgOjhpjoNnKXaCM80RXpDNGjjf7KQ59PBdwLJMaDTl9tlsdIyiDvuhqarVFMujy
X-Received: by 2002:a05:6a21:62c4:b0:3e1:4e53:4e7f with SMTP id
 adf61e73a8af0-3f18f4ac9aamr162563637.27.1794255302075; Mon, 09 Nov 2026
 12:15:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-cipso-rcuopts-v1-1-31ae931d7a0f@google.com> <CAL4Wiiob6K=Y1ne0G+8L6b8fxNxdCz3z+THgCiCBX_5MjtSzcg@mail.gmail.com>
In-Reply-To: <CAL4Wiiob6K=Y1ne0G+8L6b8fxNxdCz3z+THgCiCBX_5MjtSzcg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Nov 2026 15:14:48 -0500
X-Gm-Features: AclHuK-R76EHDsnszW-O6Vgi4DzxwqLyNag33759siqThBnXu2JAqQRN94reBA4
Message-ID: <CAHC9VhQGms7L3EL19tB+TRKvNP3ttSumHOdWcNM2377-fQiEOA@mail.gmail.com>
Subject: Re: [PATCH net] cipso: stop modifying live ip_options_rcu
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Jann Horn <jannh@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	netdev@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:06=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> w=
rote:
> Le ven. 6 nov. 2026 =C3=A0 22:40, Jann Horn <jannh@google.com> a =C3=A9cr=
it :
> >
> > cipso_v4_delopt() operates on the ip_options_rcu of a socket or a reque=
st
> > socket, and tries to remove CIPSO options from the middle by moving all
> > subsequent options.
> > That's not allowed - ip_options_rcu can be read locklessly and must alw=
ays
> > be consistent. For example, ip_options_undo() reads trusted offsets and
> > length values from the options buffer.
> > Fix it by doing the modification in a copy.
> >
> > The core change is in cipso_v4_delopt(), the rest is ugly plumbing to
> > propagate memory allocation failures.
> >
> > Triggering this bug requires that the system is configured to use CIPSO=
.
> > (Setting up CIPSO requires privileges in init_user_ns.)
> >
> > Fixes: f6d8bd051c39 ("inet: add RCU protection to inet->opt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > I've sent a separate mail with a reproducer to Paul Moore.
>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
>
> Side note, not for this patch: Smack calls netlbl_sock_delattr()
> and netlbl_sock_setattr() under bh_lock_sock_nested() only, which does
> not exclude a concurrent lock_sock() owner such as
> setsockopt(IP_OPTIONS). Both sides can then kfree_rcu() the same
> old inet_opt. This already exists in the "cipso only" branch of
> cipso_v4_delopt() and in cipso_v4_sock_setattr(), and with this patch
> the copy branch has the same issue.
>
> The rcu_dereference_protected(*opt_ptr, 1) in cipso_v4_delopt() hides
> this from lockdep. Smack should probably use lock_sock() like
> SELinux does in selinux_netlbl_socket_connect().

Casey?

--=20
paul-moore.com
