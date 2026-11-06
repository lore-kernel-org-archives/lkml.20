Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793930452;
	b=UTJm3YQ9JtGx9lFci1a4rddSVTTEMnDlYgI+bpAnQZ0I2LUuBWGDXeMewjfx5Q944Jli
	 bTqvNlqP/qLePJl7V2l5KBIjzI6+pVrE6HYZPiffrQb+l4vu6poG6T+mgVH79iRH5Yjoi
	 HixRicZ4vZnlMVa+iq2PG6EDsIDcv2uyG4JJsiCvf0wCfbOFnJmvo3NymlTVuUZpLER1N
	 zps8wAuoUb82JFt4v5O/t+p8ahfMUqtIBVeeUzVh8pis3+fZMT3meyOlzVCjJrms7BXOD
	 TR/PbvGTXgUdc6IyU30VxcloDkjS5trpulkrcL1wfv0yoy65bj9aZVDkf5Yl42OypkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
	b=mYim2ziQ1nf5557oEwkHWA4WwK3DcqZNuaU1+4Ltt08QfZ0nNwhsOs1f4XTLu9DpgoCl
	 Woz+USY5iaRTAAT0fMoGX2s5s6RSD32sAdWqdh/AYQFX+xrIB5AERm9GkPDK2aOuUtxjG
	 4DvYEz/axu1GRzDYLitqLIUVXA7nbnYjeNWV7oAqStdBrcLcy6X+ebLG2mP2nuiYjNdX2
	 rl2Yt/Rf1fpgY/i501X1dbqK2uhR3Z+qmDwES2AsGRhwhsaN2XEHU1gXevhoShPOiSogz
	 O4aW9bOlbWCQC/5boP00eAh2D2fj5txbaESZDwMY5vYNFUsmTScncxo0eDF0l9u5Dzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD88606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD88606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so23158566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793930451; cv=none;
        d=google.com; s=arc-20260327;
        b=lbiqcgkF3AYbuwLs4rqoAwgA4yO5UCtuP/PBl0CnRXSMQi2eVe90yh2aqNwXVciHYJ
         vH4T6cyZ0BqENBtCBomtqfzVZCvbg78SRrJSPoZxBOF5OzzqXI9q3KiZH403hVeP8QzW
         IRsQEI0zCj114wPMT7FACqkCOz/DRwt9w0JN5Zjez9hkBF6BQkI6g6ciwnmaOK4eJgvB
         OGFcWO1axMwt+8fRV6rbUvtWR+GnZzPBiRv3qFmQbpJXgL+Y2VSE8GSPnsFU+Cph7Sh9
         D2tAInXaAFZKrRnpToFZBLJ2PDCqfGJ7j5gA27Pgb6qUsAj5OPAoakRssqKr0saaMLEE
         1Kcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        fh=TjrYV8djXe1hO3f+8mGphoD2z/uxrL+ugM/pE2npFGg=;
        b=OZlqMA5cbvueW79rfZnKuL2O/rapAMcFG0Vl9cN9wo7iq6ZkJPRnE9hYHBd/cbpds6
         4PGohEmJGYEaP1HlaSvUX9nvM5K8PTsQitqHgwOcwNardFp8w3ZusBp/ZOKPdf+ntcxf
         lRof3P0Fmg00EmFVKDLDE0LkeM5hUkTQaXaygc0ZEbMKeUStUkwmmAswjZ+X6itCjHXW
         hYB5cWBByDuVe5PUvPFdMHGBbMV8azCbW0GbrQK+oF+wrKaNjinA4nPH2VCyLLyafFDh
         QkT+jIdEKM7BceBvAtO4Na/5BOGjTVQLWJz1tEi+vdIeB3h/c0nAuQzsJA+csZAAVGVz
         x/rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793930451; x=1794535251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=n0sfVB8HDMUIuXTocfcJVzoho8pZXk6bz0tzYjFzYmhSx1pFhTaSZo2yumVp+d748k
         EF4jR91ea7ibNEGxROUSMHM011PgzTAI8L1qWD0ISoyr1JcQCXHPqNvsMWVFxbt9wB8L
         pVWLUNSqw5HdxDBqekaiiz5oT5qSjOrJE5ODDKZ/VB3w6uZmeyx/0kQYDZapcUrltRdZ
         8fR0loS/DvGXRU6jX9KX9o6p1Ldw8G7WKpqq2NCoD45ROybfLxtqHAL0Tx2xU7De+KLh
         gi5zSg4xLzZZYLvuMhcffDFLNETBzEZCobr2lGt0WTB8BXHid6mc2feh+qdplGHJNBHS
         He+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930451; x=1794535251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=wzSqgzy0ZahngU7UbgofKIYvUO/TI5wwV/vYD2JSINLj9EQQBNDIrtNeQXYyUpw+LU
         AWKJuZws7/R2SxiX7nvJWYV+1vz3ENsTlPFG6+/9m7buNByJ3DrHiVUZI4ZUV/dTuCaM
         KhR00SEz+uvA0soKRWgYJ+sq5iz7+kMymLjJl2wdfzsnrlehi/oVba7YTM6ofExb4ghL
         6t9ageFsKJL374iL9IQfep7bDqTMK8ajnKu5ZitR/ohEcolIb3fKr2CuWlC4HKYp8oOW
         K5VfL0Q7DJbo0tf7b1FiLHe+tFZoJMStzinEMoUd6SNvgxncXidpls/MdxvQ5/Pt/xLw
         1RfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIJc7iLU5SzgUsn4cffYbtLS6KWuYSmDXdbqA4ElbYNva2EQnWZ9WN/WZ4s/Iz4csLhrMacIofkTFU7mY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RfvX8ZH5CtpfBqr2kpAHZarLUTg9sZ/Vej1vYiqEqpzdl1WCn
	dDOkUJlT76LHfOgrh4e6COqr1h+fSuOFnIvTa4keGiPTntczPcYaRXmUMdG3s4hgftyCRaFZEuY
	pd4i3fWNsIsG9fW4f6jYj6Xif+C55YaX30Pg9Fko5
X-Gm-Gg: AYBFou1uUyZ9+ArfYzxFGQO+8HWxRs5Gy9KOI//7lO/q4yEMQlE1fERNxf1NlOoDhZ4
	DFIdo2ahRTwyDyywjEbBYzdHi5QAFIOhCAG1MjhC9yrpGxKiek2vAp8qZ05DW/jBa/w3JU37Xf/
	sMjs6GQJXxnv9/E/qYq5+n+kd0iWbeJKgN8+P33pTXJA5w9GxJvKBrihsUv4BB7lUVGaNOyb/ST
	8kZTRMEgPa2OM8iLMTo/uSiYXFEpAhWFcsvds8Qih9CQlvFi+NWDPz8XRunekZQUlz5g6CYS7rz
	qIHBtQnQ0dZOT/Ct7cHUM3DsbmleCXfXU2SRqBMSrIaAnSbSzySTSrbWp/AwjxC0sy8N+kf4fu1
	iMHq9mrxsmPZmVRVbZhT+nyFfgd6sPpuE8ZzVyZNQonApjST5ssq4YAUyEwCAsXtizDNRsXI=
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c4d3468f9f2mr101330766b.7.1793930450357; Thu, 05 Nov 2026
 18:00:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
In-Reply-To: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 18:00:37 -0800
X-Gm-Features: AclHuK_AXTODf6fbRoRayz3qqp4e-qEs_ls_rSieFkkllrojC2ZFyUBK4KHwxAM
Message-ID: <CAG2KctpBEtBxwb6Tayg8z5na39TVe9GQ1+Bk5ts6eL7VaKjKnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:32=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wr=
ote:
> >
> > On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Tue, 3 Nov 2026 17:14:26 -0800
> > > Samuel Wu <wusamuel@google.com> wrote:
> > >
> > > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > > <david.laight.linux@gmail.com> wrote:
> > > > >
> > > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > > Samuel Wu <wusamuel@google.com> wrote:
> > > > [...]
> > > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so =
they
> > > > > > would be different symbols at different addresses. Please corre=
ct me
> > > > > > if I'm missing something here!
> > > > >
> > > > > Only that the user might really want one of the copies.
> > > > > Sometimes there is only the copy.
> > > >
> > > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > > pagination to cover these. A prefix query for "foo." also finds the
> > > > copies when plain foo does not exist (expanded on this in my reply =
to
> > > > Andrii's Oct 30 mail in this thread).
> > >
> > > I'm busy rebasing my patches - they got stamped all over :-(
> > > I should get a v3 that applies by the end of the week.
> > >
> > > I will add a 'prefix' variant for you.
> > > The 'next symbol matches' flag is exactly that (actually it is a
> > > this symbol is a duplicate to avoid issues at the start of the array)=
.
> > > So in this case that application would always need to read
> > > the next symbol (by name).
> >
> > Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> > approach so the two series stay independent, but I can switch over
> > once your series lands, so there is only one search over the name
> > table.
> >
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
> >
> > Andrii, do you have a preference between the two?
>
> no perfect solution, but given you don't always care about duplicates,
> I'd probably return the found symbol's position, which can be used for
> further pagination (if necessary, user just does +1). so, let's return
> current symbol index, and have way to say "find by name/prefix 'blah'
> starting from position X", where X will be previous symbol index + 1?

Ack, seems reasonable to me. Thanks Andrii
