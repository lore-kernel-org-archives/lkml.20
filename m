Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF143F4B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278337; cv=pass; b=SxlphntoJ7HfeCRJOyADEaZomacghigckOXgzWDtYH8wQopRTEsREhbRl6KcNbck4HuAuLgNfEOILWAUgJNnF574+udeX0QYoJBR2wKHQ4JT0PEDQDvZUH1IYst3uYPJvhxsyi/+SSIiVLCCOBwIirHH6kcm2LOavM50w3HfIWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278337; c=relaxed/simple;
	bh=Gp77WiCpsBoo+b95ZlkEkXec8l5ClFwLZZnKIIf5o+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNGJzKduN97gRqHYNAz6zhAJJ+Qi0InQoEj/V6N27yiIoiQZgW0jkvRFNp0KVNTSG4uWx06u8u1SuV5rw7CdmU0kYcerU80Ja1Zp38thvonpxBZ4U+Gp0NtqpaO8apJjYQgaQ30Q1QNyS7hfQibhVClfsNsKdT1ktsS8WEJjYDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvb2Mfrc; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvb2Mfrc"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so39159871fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788278334; cv=none;
        d=google.com; s=arc-20260327;
        b=Nf3xC2yLGH5JTN8PYSm4kSLA3FiuG4GSZ1tkXLjL4ZbMFpipokTNG2MIsMbjFGlsED
         iBS/4TQU774KYKiBPvbZPwVPMrtbsXjd7v192gsrsmG0Q7RXeOTBYz+TKo84CURg+kyv
         3VySRiJEl+78345VMz4igVAIGX/3e6UtyReZPL2GKIjaskA84WvIakmjxuWvqJwadNMl
         m4i951O22PrQ/V6vOa1oKR+FYUAW92IKKQ6VKi3CrLEl1TIMfIqA4Rgh3decnMvjC23n
         78Yu0OWtMwFNrTKfaP7InDeYiPYWoq+98oYhIwAV0Fc9U1L4Kd8KwzAfMDcPP2CMyCS3
         WfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gp77WiCpsBoo+b95ZlkEkXec8l5ClFwLZZnKIIf5o+k=;
        fh=Q+u2lmsxPvUDD3knojraFSwYw7mNewBR1adrCSerQs4=;
        b=h0/xBMqXPotDE40TBg0inf1AkLRHmQLhpKE2Yi+96fqzuAIvzjYWFe8MhWAxOigdll
         Vj0qldpVhBsj6Vgd5fgEd/9fh4qf1gIf5We4xotXzYuaO/x1NI060XlqsP210gZNNd8G
         IBRXZM7VcvGJzb6q1fRYHwTVSpgY784oyKRMF+gUOd4Pn7J3GlPE91tgMTTpxD9UiY3s
         Flvg3AfKZCq9mv0EnWoOFjU+tLZvIUmXLKaiBu0YZ1LaCRDarBdPIhyuKp7VQ1G4DDMf
         I/76VTiH5YVmD2DeMrsp+dqiX2jTxRnjWBsQw8FoPlMGQHnEfb4HGgTyQrrJPeLXqBv7
         T/Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278334; x=1788883134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gp77WiCpsBoo+b95ZlkEkXec8l5ClFwLZZnKIIf5o+k=;
        b=cvb2MfrcTtTRIwx0S9ZgRXE1jz3jJz9brUSeYk6nUYzRIda5AnFxS6xS8QSmSbLydU
         bxX59a9DEUGIHH5dzYvgT/vhOQZlIUeqNb3a3EYzbceZl+C2cM8XQRD1SrXroYFJSjuy
         S0xfRv+uLFmo4woiEQ6r7h7HUI1kdj3w24IFVhXNqDggk2TETWJ/FDVdUgHF7ppiEzz8
         bqDPPr1T8p6nz/Ii0x5VKwecZTNVR7gHPh5d4a2XRaJ0f0PKfojhT3ME/bJtctwE3PTz
         6NjJQQ7UlodFbu/0xKLX8v2IkUGDm/E3OaWV8StJwL0ZDVTG9WtmbYRQSxlTm7IpQ9vR
         9FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278334; x=1788883134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gp77WiCpsBoo+b95ZlkEkXec8l5ClFwLZZnKIIf5o+k=;
        b=bTYHSOFVMrrW9inEC+LADkFfnhXhpl67b/exlG97Cem54qOFO8TvK8UFth76IIMw+m
         0rF+d9sHdheGoalQdcOtrflXG0Li7t0rafrZPFARcgtO7A6X2e7kqvVJ8qQHjMjFYqlK
         YzyLMyqyg6D3htFsXXoFzFP+xOXbWQrgFqwQCJLYTKjvJUQK/f0C+LGU0hfeXaJv+n66
         1CoPvvbP+lBxuFkQfvdciXaO7Fc1fQH6niJC7PUG15zQXYxt7deswuQ+NlQvyY+upEHM
         Qzg3pg4Jr3orKZK6BkPAG9qRiOuruQTfKrQL+Gv+4mULGhW+kpH4iwMibg2G5d6XJ3IL
         QpCg==
X-Forwarded-Encrypted: i=1; AKwUvBzx17vFkdRSt0jJX9+h/iKe9c2yWCOc+fF5hKnjfVUryLQluQCfQX7M1z0EjOyRKHwfW4TIpaX22VmG4wM=@vger.kernel.org
X-Gm-Message-State: AFuF++ntum32w01IDFtx0ZirhWWzhfDfm+NoAyhILkRk/KoONWOv7NRm
	vchuhqhmvnVEmgu+mscXf+CYbyOeg2TvSNgxv+EcqxanIcliw9CQp8ttDZWXjSIeIyyg3CEIRtP
	wP5eNDpkSZHmie8lvEFN+4pUjttfyd0x0LG9cfCM=
X-Gm-Gg: AYBFou2wDLmTg6xK0Hv6/fmQQWUq3Kp0fzIP/037yumcABkRMO3i2cHWN0oiryMkPk6
	Ob2hjc3WGMYny0vJaOGbwrkHeqLvbuTuH21W0oM57gEw+SvPIHohk7/khEabB7N4gD8+gAR2Fn7
	tcQVuRv88wPVa+y9lRqxeW/tQrxR22YdVJXsZ1esc9yVRgdzQPPV6RdjkcerXs9U4+V7j4aMm8o
	OUDWTl4vbI/XreheB49fgZNw8om+0ppcmPdSa/aDyFJykAaxIlwbrDN/lJ++2UV0fvt9k0HZ70G
	FrSJz06qs2LiQuImQbxbCg/4Ebne+AyWu5x+rwr2l+5l4LAYNmVrfYyGLvFdsFoap42eBzmr5N2
	3gveQwFdotAjZ9YvSSXuz6UwX5HdJ+J0=
X-Received: by 2002:a05:651c:54b:b0:3a3:2959:a466 with SMTP id
 38308e7fff4ca-3a32959d0d7mr42050231fa.8.1788278332283; Tue, 01 Sep 2026
 08:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com> <20260829060524.2656620-2-qiwenjie@xiaomi.com>
 <20260829060524.2656620-3-qiwenjie@xiaomi.com> <CACOAw_z1UUG0e+LSGmer_mPv+YcYVcjFiMLZ6RwhmYtmrObKXA@mail.gmail.com>
 <20260901025344.3466776-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260901025344.3466776-1-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 1 Sep 2026 08:58:39 -0700
X-Gm-Features: AcwNN1UslrG6sgIPwtWDVRaPkOW7y2avsy5hDLrd5JTB-dY5Kdv2YguVdwukVO8
Message-ID: <CACOAw_wnDrd_iQ1GALuYx59Pc3-qJeZbNU1JajsHJ5zMSvabow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: daehojeong@google.com, jaegeuk@kernel.org, chao@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:53=E2=80=AFPM Wenjie Qi <qwjhust@gmail.com> wrote=
:
>
> Hi Daeho,
>
> The second check is intentional. The first check is only an early
> validation before mnt_want_write_file(), but mnt_want_write_file() does
> not hold sb->s_umount. A concurrent remount can therefore change
> resizable_tail_secno before freeze_super() obtains the exclusive
> superblock lock.
>
> A test-only hook pauses resize after the early check and before
> mnt_want_write_file(), allowing a concurrent remount to change
> resizable_tail_secno before resize continues. Starting with 506 sections
> and tail=3D1, the single-check version let a remount change the tail to
> 128 and incorrectly returned success. With the second check, resize
> returned -EINVAL and preserved 506 sections with
> pinned_area_max_secno=3D378.
>
> The first check is the fast path for invalid requests, while the second
> check validates the final geometry after freezing the filesystem and
> taking the resize locks. Both checks are needed.
>
> Thanks,
> Wenjie

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks,
