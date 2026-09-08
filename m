Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3A2EF653
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843491; cv=pass; b=dxYMNKJw337AJQD6HpNNW4UXb/gxyFbXQgWRPWzgcJMXwjBMo9uHwZ25jQX4XpzlnaagKTCqGT/m/jEhcxh0hY2YZhOVKs36dvpCJn6EoaakQsKzw9jAN72Olw3rEWzRYNXgEy72qaoTW/B+DbgFdW2XneJxhKWXK94Id9WmGSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843491; c=relaxed/simple;
	bh=RgLJezrTBUs5CG3LnOFPDG4AOpylPG1JRVWLEgIQPGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJEXYN8/Oi6fikXrn97TyUmd4lZYAr0DaUGzSuosODUMYOc/AeSR0HCktnhGR9sp8JBXMrahka0z5W9efXmKlwJ6vh8jRHH9kUAG9AFT0scoIP2hO5TaY3wotJ81kw9tAyV20wpBiyExhOB67eang5brVDeqdHp6pBKdRu32xAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ja7ANi/Q; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ja7ANi/Q"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso512951cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788843488; cv=none;
        d=google.com; s=arc-20260327;
        b=MeOvRjsPvFmJ+kr5V3Sh3Z7kFAc5elWku4pTr9RJt7LWufIGSMEpj2eXDqdYH4hZCq
         awrz4FePWLnaYWUuORUquvVav8YiE2zBa4hnYe3DuSD8Vpvu1UUZZMS2NL2YsjLcsBYS
         64JCZ+6Z9fE0RVxvk0FPksKdzSF3BpmW6JFD79EejVmRbciwQOY8cQc31MexInIA7nc9
         XPtFXmYSMLHlMF+gLWT+ipJGSiSiKdkP35GakKTi0HRfAX1lq4tH81q06nLN5ktDU6m9
         3KzAlKJ0XXZLQNef7ubieoEXJ5oGXC0DdbChGkq28T5+7jFfQhOIBykwVCjt2z/uLi1R
         LaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        fh=aLPgxPVmSH4DcAFbUgPnS8IiffFPht/2+7RDderDLgk=;
        b=fSmvYdiCYTozM1LeLTaxm98z/zZESLxVRrLoCzGPcxg4P6pmkd97+jYDFVs0LAaat8
         pA/h8iozU59GP8NcjYMYEiuzmNnYc20vIStacUYWDxLQBOld9axV4aheCH8NPjvGH/AA
         iIt4IZY41/o0qnHXdA0kJEFWF4uCwKAAMB+O2dXpl9RmmvtsVUS78OrjouQZZ9D0Iebj
         GQtCrgq54W9HXscXWQ+8oMS9y54m07XvCwlZ5hSj75D1Q5iTJnP+TxnQ0eA5bMPPp4VS
         9MNt7/6SB5zORv0mUiI//g8PV4S4KIkPPQHDW8vk/cNwqoRcIF9X+5TpO0rcJsDVL8rA
         vnhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788843488; x=1789448288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        b=Ja7ANi/QfO8JQ96r+R+Te0+n1ZblgTrtam3QeDRQoc2mlfZbO2qw12qyvq1k+NhzeA
         VtZfNwia0lgLaQkMAEmhFYbMwLyZgTuYOA02zenVz9kU6nWbdso93EN3fqzu7qdkiOh8
         D6Vn/53mMVxM9CKzLq5qgylWFhJTkvbAfi2G6J6q7o6ussrF8lEDwGDdpSTCi0E1QyjK
         LYr3JxJtllVst9y+QSuRqmfDofJWZjIIXYXJliIPpkZBQ3b6kUw8R1Qg/JVLxh5Rn7MK
         zq9c1ijWZQxC417heZG/OC4Y+vBP4JGZpAyETOuJcIOAc3QyIPTNPYe/9Oiu+FOgBf6b
         WTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843488; x=1789448288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        b=XeWU0a747tP59uDzLN+8B1GojitIg4CKbLGQJ3W9HlWlXGUMl7dMVcf40t9N3ZM6/J
         ghBzQ8TbM8IV8AT5slHTItPYVtt81KiE9EHHzdDVk8Ix+Nt9oD8fxRUrQQP2glPJQPcI
         583tDkf613CZO6LLhlPfTu/K0BlYc7eCwYBzq1uFPnqIa0BEK9ghh+IixRzq4B8wtqbN
         XavHgauDc36GQosSzCXbT7/xFeVM7xpajl69KqOdAcuJ2N9kuvCO5KJSkNugpCk80DSm
         NYev2viVJJzYtmGK2ESPS9Jz0FM2k81kZTrz5lENP9tdBG7kXhHFyOTHIGhPORXaLYG5
         78HA==
X-Forwarded-Encrypted: i=1; AKwUvBykzduNO4ck2NU+lxCwEwBw+zGh425Yh+TCvu4j93O7PvpQEOG+9W+gHmo7qPrJFk2sOEs/1ZJ1boyHtKA=@vger.kernel.org
X-Gm-Message-State: AFuF++kzF6ImkPjg1JfkmPKeU8dVUP/qfiGMHjDgwUyUiHw/RM303mhA
	d5ZZaW98mW35r+cUVWO4mKqWLwRF6qJW2xLOd2H9Z/vTK6BcgsE1p4NoHKbQnlKxI0Qum8B9wpA
	/M8ibUKw6En5RQfXvoDoQC9GdLD8AuBon6ADPA98B
X-Gm-Gg: AYBFou1zTi/OHjhAoe91mL0hpilhvzAnzUtaZzk2VV4OFoGygLKSKQ+YaR3htc9B32R
	YfkdDgzepnaX4NsSh+ZC1Q/BcJR22Sej7vmhcMcbcrnIbyFxzJLQYaK3/hdBAFondjFhDnQYZCH
	gCmQ4jknuGJBM5OlmAzR9CFxItsNNP+EwEpvtvRAn/fEEXPzlDLnbWgud8gtJ49UYGbZ3DXrSH1
	mchCkJe2YwMjJaS/wMax8QA5Wf0Nh7fPlOZtrgb6OtUwcPii2DySLl72Ou+mA5nWSj422FeBgkJ
	NxF3EFL7Kz29NQXMe+PZ4UXKZybsRws5VHhKH3eR+rwzRoi1JJIluGe5kRF0tIMtjzBsviQ7TCJ
	iiU0iUQJGKi2oWSSjC0B0bpx3OtrWj3W2P+5NzTg=
X-Received: by 2002:a05:622a:2b0b:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-53082b07b6dmr24762111cf.9.1788843488057; Mon, 07 Sep 2026
 21:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <20260904031912.2133476-2-tweek@google.com>
 <4468d220-9d7f-47d0-8e5c-c01070ab2d47@kernel.org>
In-Reply-To: <4468d220-9d7f-47d0-8e5c-c01070ab2d47@kernel.org>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Tue, 8 Sep 2026 14:57:50 +1000
X-Gm-Features: AcwNN1Vv3IgsdJ48TcwQ9T2zgBF6SbU0dMzFnoZRARrkmuhvOX0r_mwDFwUWnFQ
Message-ID: <CA+zpnLdPu+os2SFU1UxR9ha0NqYwO52Hr9ogk2zaEUHLLcv1XQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpftool: Reject non-autoload programs for
 light skeletons
To: Quentin Monnet <qmo@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:24=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> On 04/09/2026 04:19, Thi=C3=A9baud Weksteen wrote:
> > When generating a light skeleton (bpftool gen skeleton -L), there is no
> > libbpf runtime object or bpf_program__set_autoload() API available to
> > enable/disable the autoloading of programs. If a BPF program in the
> > object has autoload disabled (e.g. via SEC("?...")), bpf_object__load()
> > silently skips loading it. bpftool still generates struct bpf_prog_desc
> > fields and attach functions in the light skeleton header, leaving
> > skel->progs.<name>.prog_fd uninitialized (0).
> >
> > Explicitly reject non-autoloaded programs when use_loader is true with
> > an error message, preventing the generation of broken light skeleton
> > headers.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > ---
> >  tools/bpf/bpftool/gen.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> > index a50540ef6521..1583150241c8 100644
> > --- a/tools/bpf/bpftool/gen.c
> > +++ b/tools/bpf/bpftool/gen.c
> > @@ -1340,6 +1340,12 @@ static int do_skeleton(int argc, char **argv)
> >       }
> >       bpf_object__for_each_program(prog, obj) {
> >               prog_cnt++;
> > +
> > +             if (use_loader && !bpf_program__autoload(prog)) {
> > +                     p_err("program '%s' is marked as non-autoload, wh=
ich is not supported for light skeletons",
> > +                           bpf_program__name(prog));
> > +                     return -1;
>
>
> Sashiko is correct, at this stage of the function, rather than returning
> directly, you'd need to "goto out".

Thanks for the review. I agree, I'm not sure how I missed that one.

>
>
> > +             }
>
>
> Thank you. Maybe consider adding a word about autoload/non-autoload in
> "bpftool gen" man page? My concern is that users who are not familiar
> with the notion will struggle to understand the error message.

Ack. I'll send a new patch to skip over these programs instead, as
suggested by Leon in the other patch ("selftests/bpf: Move verifier
failure tests out of test_global_percpu_data"). Thanks.
