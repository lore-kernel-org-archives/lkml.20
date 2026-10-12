Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ECF3E49F4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814179; cv=pass; b=IbRn1PCqoKerrXxfQdhL9er47QMWrxhn62gmZnixEuOObORKZKfEoYZFjJLSfeACxtosMVqF0fR/FqREQBxgYTxuuIrugZWoBfoYCWL2Uay6vVY2lfRHDq2LK8fmENm/Zrn+wbYyln9Uc0QYCEVRsAu3LUcjmhRelj3xDW3JRPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814179; c=relaxed/simple;
	bh=f//bn3Au1jT6Q43njaKS85w9HYMFtsLKrhgAT3zEK20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlKi2Tq3WFFFN4fGmCk73g8fFv5fodMBQqG3EvnzL3ef88s7UfFM7hBp0H1AkSocN0NcmBIwtdlh5n4uGIRxVhUEKNVqYqY8n1ey5eKKWu6PoQzblq/0I8HAVtU3IC7kLY5h17BzHFhAcl4k7n7UX21zqiG/DRXTl/Qzt0ZBIDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3xm7Npa; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3xm7Npa"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5337c7b9937so385561cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814177; cv=none;
        d=google.com; s=arc-20260327;
        b=rynXRkx7mmilQJz+byfYXrnZrP6FSCgBHK2G/gf0jHsnMkGo/57phYxAhvnC4vH8vU
         Tnq1E6ymoKqXnMOrTwKgPKcpa+lr+SbHaNXBEGoJGSKNrTjwWjHYY0o0vM4MkCsCesID
         87CKDqt3OYdLn1KdFrLjASbWYL7AGHo+JX9ksYcVLFgOsyhP3dFSFvxfH1eB6GKh5l+Z
         Xv3hj6RICdy5UAG4idp6ZtBHSewOv7qwohUwfoLWEVXNPvEkhByXn+bDtRRxGvdZvuzm
         7w1db/UT7uVSqnyao1mXPuOjKOTmFlZXhadxvtE+OFocTc+KFpD3TaJ+PSE2WTs/5bup
         uj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        fh=zKQvKddIj/NIc/tpqVFiQVgg2WSIpE8M5y4Gl8jwdZk=;
        b=eCSI5OlJRfeK/zWAde3U5k3ZoEt9o1i6vvfBMEZohmnmcUtU+HJqFKS9SB9ilqeTmp
         4GZ1zFJLUfr9aTPlQ3S8ECzcBYmVigp7kcCLNBgDFGLvTCse7plbrBR/I9aWbHbpAVW9
         G5FzSj5omqefdAesln3WW4GtmnnY4XeAioHlzADG+6dHbsNUwX9qKqgrrJBbWgWWGxBR
         k8rZJiCC3G49SFbkv4zWrJiksdtGu8m2wToIoGc5JdcVSJwnKy5eXL4bCWqQS5fqLA2m
         2YrT9HyuMfOPtFXtE38j7P9qDMl8fjAtWDS3KRDEnlWc0pPpEx/lTvSKpqCyDU3xlM9i
         tlKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814177; x=1792418977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        b=D3xm7NpaDHEtO/HB6QtEhOfS8W3GYYV+LWrxBdJTRlqjfjvC9BOx9iVpOm0xqTcSZP
         ncmbpWNbE1WESg0H6jnfDM8j7to+0oOuz+Ojjd/TtA1pwBJ97Trft86WWjkamOIA/fHn
         szx7pBQcqETdY+YhDQhIlycPFxdqsIqpdp9EATqRtMY+wscNOOG9EtPZa1AUukXLQHBz
         04VES/X+BBT2Kbpk9hoeyn+ppqqrAsi6kH46VseaBWm2jHGnErjl73K0OfBJmnfHWsiL
         TlLkws8hMUoF0oDldlrfJIrtth5dxGR0z2KEtwZlpO+YgzN5Vjr7NVcjZnjoH/4koi22
         /QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814177; x=1792418977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        b=nmsZBkaCr/bHqVdecUmbjtB6GdTJt14ptf1sJyRGC+N1naOYHQiYxDuITke5J47JwP
         686VfOgUg2Jb08TGdgq8tMB243yMnYoivsCuAMo2KbOo2MLP3520R23IZItlGgF106UX
         udcus2iTGRcP8P1Ynvzv358XE9AeH/SqLq0AajypvoxfpmRHF6eNzPvPif1defAdfBHW
         xmrNsqlUMvMZWg0wj3+fYMyxwMCzw1ZmFQ6Se6FNy+eFeNAN5W833NqUO3UCljY2+ZYg
         mOVhlaQm6Pi30zjN4yy2fg3pKdAQBeoibCyYiEKfgXp+75GSKqVkyKn+t7+1GssGpdO9
         R1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwevl0A26UufaHZWDkjCNfAkw9TmLcLxKmoJ7wv2vezjdaZJkgaEk9LZsZ3kLVNNXCshE6vB8YP74oU32I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL40u8ErjhT58v4cKM/kYSAUyTwm0vtHa9kFgXV+Jo/9uJpjV3X
	FfEeNGQN5FZZ0mgvo0uB1eryiKZ9PHhpX9WYgF4QwJZirQqJ9fqvGjTGBa6EY9dbwg7HQONUjXf
	cPrHoPYKjdSmpHLZX9rmlGMRl4IIX7VTLQQJy2rG+Ed3x/p8WGwQYEZt8tiE=
X-Gm-Gg: AYBFou0SrKZccXpLKVccgjOW03d8bSl3LsDO9n+7noAFhbk+Bp/5Oq4EbwLKF3bbk1M
	sdLmthI88GcQrKWpSwxq6+kt6/RNTTEUgYSMrnvN6kNdxBtabDRvQv3bSXseNRQUhi26+uKBVAJ
	PODxEWqZhWzztKd0an+321m6i67OOAjjX7G36vV1YuuCd3OHEIvMCdyFEpmozXK+3hLFUsawrya
	Z/cF1ZvXSJioLHr5i/gnLf+RkInUxtT/VRm0HbudWWMWYgGvRfiokhElOUbmGS04hIxTKJk/4xA
	zEjBCYBbLJdzIqovWWW6ZM2khghiw3wgrZ1j3tMJHFa2VYhXPwkl3ZCh0Cm4x9Y3+lJ9wTOtpNi
	ZrPAaOVWACOg=
X-Received: by 2002:a05:622a:580c:b0:531:282:6560 with SMTP id
 d75a77b69052e-535b4fbbfa8mr31251691cf.15.1791814176455; Mon, 12 Oct 2026
 07:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011223358.2327625-9-sashal@kernel.org>
In-Reply-To: <20261011223358.2327625-9-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 Oct 2026 07:09:21 -0700
X-Gm-Features: AclHuK_P4xsv10L2lCkSOtMkvWLnLa5t9EHv_n5RaY8Tn_1YY4noJVhURld5zAc
Message-ID: <CABdmKX3+V+kqgC8H3MHHsawkTYFb7ebJe8pO7uRS6-i4rijwNA@mail.gmail.com>
Subject: Re: [PATCH] selftests: memcg: don't close an uninitialized fd
To: Sasha Levin <sashal@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:34=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
> jump to cleanup before the inotify fd is created when cg_name() or
> cg_create() fails, and cleanup then closes whatever fd holds:
>
>   test_memcontrol.c:1685:6: warning: variable 'fd' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
>
> Initialize fd to -1.
>
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
