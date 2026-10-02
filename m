Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5D4B1467
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952300; cv=pass; b=S/sQaLCc9oukB2gVbyZDu15VvgnDlQR7dt8iWSWCTZCexLWWQrGWsZgtG4qOMhJJdXyuCCAOf7QG7UKfkbHsfHJknog8yR3H5exjLaMj4eU4tgM6dEiZuJku9wZ5fg1pG8gpMc+yPGT4aZV5J8eeQ7cMUz7TooMneuw03UoEsgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952300; c=relaxed/simple;
	bh=u8PLXXSTY0IAoYfBBSIw6bMv8+76hBg9C/vfZ4dsutk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqWNuYqvuC9wQQoJlZ4zSe0opTDw0pX468Rb607R2HJhEdpOkQPcvFd4LJCgr+HPakZDIccmvZOJqO03p83vSkDr2sX0njenG+j5PKd/qGJSi0w8rPhQU7JjI0FnDbkWcg0Gzlj/QSqYGelWt9B1yjNSb610J12CCU3DaHIc5Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YirReEQx; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YirReEQx"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-88b4eaccebcso661104b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952280; cv=none;
        d=google.com; s=arc-20260327;
        b=qZYhvLWujV0Gzc0zVfWKkIhAUOPmA/wG3Gu3A3dttYaGizaUhZ0osBbnq8XT7syr5P
         lvtOnBOVpaQV7/JGjyFmIT1WLeMSUUnVf2AUeEVoY5bsKfm+u2d7VtgDfUHBaA1fPHEL
         f0C5h5FJNK+VTGh7NhKi2QJqP/jUkbw3MUSxnsNNfItkHO4699bo4+1X++aRaGmfMCht
         GoEQdsGJ6oHr0d9M3qtcdle4YKj3XscW6bbsRZnuL/BqlYI3ujdGNkTgU+EXC0MCMnnk
         5PPQEUbOtowOLAbdPdMpMRngt9c59Ml3ThRM/gWddsyD2+6taKc7gdDLvAEh97KQp5uy
         Kegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LF2SkzXE6JWvXRVUQA23kKIKoZzi1sawVkhqirTYitw=;
        fh=b3aThhViyYPXpj1Td4b5G3i2eZKD3AF13Dm9Ha9BgK8=;
        b=McgiSuuR0eHyCwuql/RH++w5/n7rLVltaUyoT5VZHbVB8g1PlWFGrTW/El7YNodFW2
         B+/VMfHg39bNJy8XHCIB/m8S6VHaqG3cGb7OVrbwLl+smg2lvQlYJTaMjZLkwA32cS9P
         kqORmvXvMcZt8RVVz/FiHCBIAhWmW0i3u4z8WzG7GsHo/zgOZhu/hnU1FiQUatklrpPa
         6RKqsIvDpN0n+r/dYgEd2ctDXxK3fEiX1hqzM1xjmCFI7BFNav2YVus5d4mFlFc0HTES
         IHmIYyqDWwWwTZHUxVHtCsSlW7/u+yWbP9lQwmerDzEBBmztBwMJwp6Tuny5fytgvk5B
         Vj/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790952280; x=1791557080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LF2SkzXE6JWvXRVUQA23kKIKoZzi1sawVkhqirTYitw=;
        b=YirReEQx1ThnPjw0CX+tXJuIWYyItcf7lJD7IqchT69lnVBeErf45noRgqfqXFzrdn
         5eDkzjkI9YVy3JlBSzoqssVovB71mju9X0Z7EY7AcHUF6Zm2nAJX6+YdxvemTtIePYMg
         RaNMkT872HaWrFXgulqOoVIogHC/0hImmf1n1k9iPCuaPxEqjWgqll6+Urcfm7ezqagU
         XCRUQnJFdkjec+l05eg/oqh/CUQxQsS7zZaKyO2K+PLDt2NYL85d+bq1XJKVoxK3OMMv
         5iAhXboFoa5KZzufMTny1/R3jBlizRHs7lZd2mkJbkBwAkDDlb1Qs5KXm0zrcbY7kJqR
         OfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952280; x=1791557080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LF2SkzXE6JWvXRVUQA23kKIKoZzi1sawVkhqirTYitw=;
        b=UwpEP9PM5jqNqx/Kf787ZzVfUtAbA0l3HGnSqPWGk3vUeK/9ANDMy7LlkvlhE5BGTA
         T6GRXfMEkMwiZjBgX7hGga8R123RPKeGx9xYOmolxfyFN8Nz8pwV49fu8mb3KQdeb+Cw
         xqavkA83baoYICSzga0W8SsLPnRp1EdOtSflLD3L2dAccrj9rhXkSLDNbrK5PDpso9ey
         mi4mUJXwG912sufHgJhZ+PEsOF21/u+Z9OI1uyXIcZRnH8ttOwSQHxgOVViRu/nUxrbp
         rpYq1f+DteZQ6vyLgfPwyvmzdoGWSbUc2MN3d/t9OjSt8iXPGFt0rthFrM5QTDjR4D5f
         h1eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEv6HYtEKTiycufRVE3MOcCXrI4GEjLmXd0bj360O7bYTYBrIe6mm3S4QhN5RGQ4s+XQ+UYGMJ5HHlKaU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7gUw1YIlb3/uYUNZB7L+RNfYMHcT7MUJlicW2LD1Lrrqfw1VZ
	8z4mUIhXbSSVBaI2I7/UPxHmSqX6SiMSfKb0CRBtudvjCHTRNKdJNkMZVrNl7ZHBPvdOZ2nG9ju
	+Y70K0mX8DZgGyxXjTE+WW+Pl/XgLTDWxPodD0sEz
X-Gm-Gg: AYBFou0IcdN56hLrINEbYTpDhEVrY9zclfwDkpEQ8UzYbEr30YQZdfvwMEZ0CGGpt4C
	s0QIkikt8Z3t5vIiDMejGO742LWeyp8CljL1DljKDmZeTLopEv0Wb2QjCYdQpY4N0ECk4baYoYE
	efInbgIk5nejaM63IafOzv23dtMHkxBNjJNjOB8cEbN3IxZlXxSXAsRcwQFzskWWpwQfBNkz6mC
	4gqtMj2SNrt6evDvFLshs7K7uhfWvaUK6Fd/AcOejlDFXVwNLO5V2OUeVaFDW5NF9afZryEXwo+
	jSXo1PFUBK1pchQ8QN/rBbedxDf9IRfEHpWMXEMwZ57PwPEgV4Ba70DNJ+zXsccW2alpWyxO0tY
	LDy7dpXRMuRg=
X-Received: by 2002:a05:6a00:1785:b0:882:23ce:f515 with SMTP id
 d2e1a72fcca58-88af8080910mr2973393b3a.33.1790952280636; Fri, 02 Oct 2026
 07:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002011712.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261002011712.7-1-bbnpreetsingh@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 2 Oct 2026 10:44:29 -0400
X-Gm-Features: AclHuK9ayOqkrUXBAC_GcZ2eCbisR0JLLAs-LuRc-nBc_JmcBaIHgMmt3iLarik
Message-ID: <CAHC9VhTgs-ZXwagRC9gscGT1BqkrH63us1wLQCvnvmrALijj4w@mail.gmail.com>
Subject: Re: [PATCH] audit: annotate the lockless read of the audit control
 lock owner
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 9:17=E2=80=AFPM Babanpreet Singh <bbnpreetsingh@gmai=
l.com> wrote:
>
> audit_ctl_owner_current() reads the lock owner without taking the lock
> and KCSAN complains about it. Only the current task can store itself as
> owner, so the check can't give a wrong answer. Mark the accesses with
> READ_ONCE() and WRITE_ONCE().
>
> Reported-by: syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D39b8fea0641107a1ccee
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> Paul, you looked at this race in 2022 and asked whether READ_ONCE()
> was worth it and what it would cost:
> https://lore.kernel.org/all/CAHC9VhTXNPWBDRoPcz-Jw=3Df+NNAEhxbh-ySc56CUd-=
ZbuboW5w@mail.gmail.com/
> Compile tested only (gcc and the KCSAN instrumentation diff); I could
> not reproduce the race in QEMU.
>
>  kernel/audit.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Thanks for the patch.

I stand by my previous comments, but given the current state of LLM
assisted reporting and submissions it's probably worth making the
change.  I would like to see one small change, see below ...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 631d6d4a23cfd..f8c43ac6d5b82 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -268,7 +268,12 @@ void audit_ctl_unlock(void)
>   */
>  static bool audit_ctl_owner_current(void)
>  {
> -       return (current =3D=3D audit_cmd_mutex.owner);
> +       /*
> +        * Lockless read: the owner can only equal current if current set
> +        * it, so another task changing the owner concurrently can never
> +        * make this return the wrong answer.
> +        */

This code is fairly easy to understand so I don't believe this comment
is necessary or adds any value, please drop this commment and
resubmit.

> +       return (current =3D=3D READ_ONCE(audit_cmd_mutex.owner));
>  }

--=20
paul-moore.com
