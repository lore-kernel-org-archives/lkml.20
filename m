Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316134EF05
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607210; cv=pass; b=OXU+LT3CyV0tbnrO0uRVck0o/58+YKHCP6ZMZZqRk7e4FoAygdnjyEROcz/84f7brilhi2eN8wli/RzraguN0St6Iw2HCkUhMAM4VGtXCdTXLbLa5zinPh1hK4KBUmwcDdnXmFVfiB/s7iHhwaV0yTFleds0TZ0HL/yWY0qqUes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607210; c=relaxed/simple;
	bh=UfmsZp708Ijy54fCK/57bC1uRgIZdRWU2UrdakwbYmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOKPhs/g4Kmwn5Wh9RSrOgVTqFCKeT1FGBPPyUsiv8inwzSd8uz+uXpJvjBLENS0YWcE3B3JmEVBxBgzTcbG00gAie+1akPF6ARjUSTVHzp8jlNA/Rm+mAg8mZgPjHStEgNipz+HKsXULo4PAm3HVYPAIpp5H8Z/5Oc/v0nvFic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9Ja+iYr; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9Ja+iYr"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so92441cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789607206; cv=none;
        d=google.com; s=arc-20260327;
        b=TUf3IxPI3K/+U8QThSag24V58vDgtcu6uw+aymgWcdUMUkSvNpL6SKq/uIxUFSUrP0
         OL4U0QYy5eTSN+5PCguDRKmCNLuqTQ5sM/jGZzIR3lyDgtoqhe+qDxJmtlROtooySDx/
         GsUH9Yt4JtgnAizdBlBKVXqDvHnCn0y6TekFG7+powR4bPL1BR5QVTdzpxsGDIlFgMw1
         6bMgGqpQurcBkJGeq0uvOP+3neby/ADAhZ4ysBfS9ftViH5Lx2QhhjD5+jOij2Vzg3Nx
         XSIJCKCNVj3ccsRe+UA7QX0chMR33beGUa3aRveOTYO3JBJMz1K4ZKiKTrQXR3CHyJxX
         UwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        fh=hOIUcDo5J8sAUbou7ubCrugDhAmrjWrNn5lCkMgQE1A=;
        b=agykfM5XgcK0i1DSPWRpxjrDx2eFQKWrJxXd26R3LsHKU/eJhvTVIsgt0jkONobNJQ
         P9ljvJhO151F4LNwcNzJiFqUeYrxU+yExKRfMC1xQFH0VXtyVO8NcDLtNOZ8eIUehbU+
         8ev9Q8li+tm8l0gsr+nD2CDbkwA7utQLz2dFAR/ijXd4eaxTetOHKZh+h3ZFVgId3WRJ
         qSLNzQVzrISCq/AYpSNJDH0yDWAqWvinDrmpB4MWPYsevw+pmwtd99nG7na0ETClA5KX
         gYZpMW/kkgFBUh5W0Pnb5ydJ6UjJFUuHHNcsKHwpOyulEbvYRXtI/ro05C9r8WU8H2TI
         NXyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789607206; x=1790212006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        b=i9Ja+iYrTGq5fF4BO36dSNnLpRptWxPGLH6SXtT7gj+Cw5YBVAlrObueq2Bt18qX2/
         9XQHZ1nQ7pWh9tvDWO8OhlDb13n2yZ7NIBqOJ/JC6/62WMsCRYPXJhUr1jBEkm6cMRAh
         6uloYJIwr8CJe+FdYE1ADVB2eOnY34mx6LPXcrj0DbK+hggtBMydfwKXvmQJwyHRj0fX
         Ud6UFw0+aP7pEp8vRYK8qvaC4snzE+wXA7X07QqrwAqZkGdIYECW9/qoE9PkACD4LKsd
         RSSj8bydQIEUE9qworxEVBDOMpCmqhckOTbsou8+v+/exJQH71VoMW6+QhY/e6DePVgQ
         nVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607206; x=1790212006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        b=j7Xlnwng0HTW7vx0F2dNjo3sk6MjeQ0e2NB5GAPQmklfGw1lxA16IxAHxQO2dlTARi
         wOSW6iBC3WBd9WN8J0ZM6Iqmoo13Tr/QZBR8aJYN38qyeQun/iP1r5YHjlRXanccKp6G
         bTsFXAG24iksz3KnlgOlSloTJZIOiXxBzC7+UNfY92jQOqTYYtpNNnw/R9/FRVO7Y1Jf
         txmK9GERg7oBjRLohlLAXoZEEoyo9nYy67LQcNJENypGwrSsT6RgOsm/0neMauvD5TcD
         +ynshGSOZYogGGYBN7phH5Sks9GhTdzHXWfY6968il8wJ09bztv/IiobqwwyBFuiN5AM
         fdEg==
X-Forwarded-Encrypted: i=1; AKwUvBxwDNw48tnZkDp+4M29hHOpI7+qs/kR4S3Afp3/B8l72k+m8P0Gp9aX36lKjAEYGUeYXkORFAN3A0Pq2D0=@vger.kernel.org
X-Gm-Message-State: AFuF++mG3lN+aPA/c1daSHEkwv2YhckAzEgeh3Hr121NOoCXJRtj3yuD
	XSkQHUAbPFbfvODQSf4yrm+p03SdvJyXXtVxvBJf1zjhtOQa7hht9t7Abz2t/kndcVLoSRTYP/i
	DUZwsbweOL3yPztBGKINw7s0FAqfa6ffqOzRn9u7F
X-Gm-Gg: AYBFou3gDddnDM8yKBLvLTQgvuk6ItWS38LlvVbqv3jNoNJES0xsy8VHcmhbnlkRJhW
	gIWQmcKJ12c4TfZaOev7xend48SqUgc9LFFT49xlqE5gJS4VHag3U3PUSSGSrTRubOCLsimgznB
	SzD4BofDO7+0IOjaa45jnq33ZW37AuSGC7JJlOv4xae5sNCI3QRznrLP0+r/16EPRTXtGga4MI0
	TCgXAL/XS7AlaW5fExpWmuTvpwJ2U2hIhbHAjAaa9W8OTfDjdwAPTiUkDtMTxZ0EFSW0ZKtxJDw
	gFZ+iq3GvgWst1nOnIo5iakxjbjDJ9BaYTCmooTFmODDXuDZGj+BQ5jFuDbn4PL9cV2J3fgXMW2
	DhPqNSzqrgSb1sWnZeuGa8mw5jVLkbyaxf8GfQbw=
X-Received: by 2002:a05:622a:997:b0:531:2284:4b09 with SMTP id
 d75a77b69052e-5328f60023bmr5751171cf.11.1789607205250; Wed, 16 Sep 2026
 18:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909042433.1775591-1-tweek@google.com> <20260909042433.1775591-3-tweek@google.com>
 <424ef244-f0e0-46e7-bc27-fffee80f348d@linux.dev>
In-Reply-To: <424ef244-f0e0-46e7-bc27-fffee80f348d@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Thu, 17 Sep 2026 11:06:27 +1000
X-Gm-Features: AcwNN1UtZ3hvthqV8zrZe_2I0a-BHp5mZjUvG6bkreK5qsDS51UGzgeJ9gYHVWk
Message-ID: <CA+zpnLeRmo3RTAxmMUHepm+kmpG4nw+z_vhR_kNubqEEEAVxbA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] selftests/bpf: Verify program FD after
 non-autoload programs in lskel
To: Leon Hwang <leon.hwang@linux.dev>, Quentin Monnet <qmo@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:49=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 9/9/26 12:24, Thi=C3=A9baud Weksteen wrote:
> > In test_global_percpu_data.c, dump_percpu_data is defined after two
> > non-autoload SEC("?kprobe") programs (verifier_strncmp and
> > verifier_snprintf). Verify in test_global_percpu_data_lskel() that
> > lskel->progs.dump_percpu_data.prog_fd is properly populated (> 0) when
> > loaded via the light skeleton.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > ---
> > No changes since v1.
>
> The Fixes tags of v1 are dropped.
>
> >
> >  tools/testing/selftests/bpf/prog_tests/global_data_init.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c =
b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > index 7c539cbcf3a1..ebda60200b71 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > @@ -214,6 +214,8 @@ static void test_global_percpu_data_lskel(void)
> >       lskel =3D test_global_percpu_data_lskel__open_and_load();
> >       if (!ASSERT_OK_PTR(lskel, "test_global_percpu_data_lskel__open_an=
d_load"))
> >               goto out;
> > +     if (!ASSERT_GT(lskel->progs.dump_percpu_data.prog_fd, 0, "dump_pe=
rcpu_data.prog_fd"))
> > +             goto out;
>
> When the light skeleton does not skip the non-autoload progs,
> lskel->progs.dump_percpu_data.prog_fd is 0, actually.
>
> But, theoretically, this ASSERT_GT() is not good enough to prove the FD
> is the correct FD of dump_percpu_data prog.
>
> How about running the iter subtest against the lskel? Factor out
> test_global_percpu_data_iter_fd() helper first. Then, add an iter
> subtest using lskel.
> When factoring out test_global_percpu_data_iter_fd() helper, pls change
> 'do { } while (0);' to '{ /* no-op */ }' btw.
>

Thanks for the review Leon. That sounds good, I can implement these
changes. I am just waiting for Quentin's feedback on the first patch
in this series before spinning up a new patch set.
