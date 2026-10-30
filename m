Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793320095;
	b=lNQE/HQgXyA7i+ZmwPZj9Sx2tPhQ8W+uzrOVAD+9lkq2LtWU/qMN+SdtLX9RpVjcvVG4
	 wAo1ZYhxBSCzX7JyfLObxBt+smlYd3aDTQtDkqpQNCOIFBhJKIO/DXFhF+EleMLUIqor8
	 Hjkz6P5xKCp+PByXak/ZbqBOiJUaTOKe5zPYeLCtqHAmoZPPBEh6jFgCGHXVAgAm8poKU
	 3Kc8Z/y22vt8DEPD8nE7439K3ECM1n9jEIJPJUVwbJLJ4fVZBtO/Cn66us5oMC9jwy7yi
	 2/ukDJhzgI1M9Ci+UHVDO7CFcDk+mOkUEG35wlITjChSNrNfWhUMIMVilwAZ26xvlfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
	b=UO7JM0HaYalmn5f7Xe3Nyjkx9SgUMKlpZ1K9MIxlZ6kbG0AuWqcXKLof29FvCgeGKV6f
	 V1xmU1vbLbcfuyl7gjnDTxHxjE0GmUw0pgKg/cjyHprBVMe3+MCU3Bz7HwXD/5ESIutFL
	 C7RsQebOK6ZCpBTw6NwYNNosvUldBYRiqXg00hH/rTmLYe7hNkRX36iXGqiPyOuru+p0Y
	 5B0weRzUILtGtn90gdyhhCzxhKxu7Vnvaxvq6fdVHrSxGVdWqcI2buch4SYy2Ly0cAAjg
	 V/N9gAhHLn9fcOhXrM++ezZ5YGUk6CQboq9IrhyZbQA8QrIexfY1MlzQxA+0aDmJqmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2;
	arc=fail smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4682977f9aso12707766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320094; cv=none;
        d=google.com; s=arc-20260327;
        b=Jv95CrCAduxJgo0FcDlvBwELvwhujL0QmhroDwHdNhuI5DPJf5m6H2ijawYe6dT/KW
         aO8Y/DAN2U6XnpvYugxEUGxVLbnkHlGR9MzmGgJA9t+wnMyJ4fEZX+4oDHVa/OaY7KVW
         EEL2bJ2RZSq69MkjNGqxyh2K5Rfwk5e0BUx6b0ImluY9HREEGwz+c7i4pzlZ7TY06Qo6
         mBABI0bSVVz40e2uSsqRROKG2BHmfDgo2ksaLNhDxoY9sqRv4FXes5+5gzmsaCgZwF6f
         wIEncEZXKoX+jImi9hC2jElkCm3AErlsjqFWn7wulH1eKbv+viiIEHR082gA8FlpIhPk
         KJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        fh=lDhr/mLXjLWmJMclqBzBrjjX7F0z7dL4+P8b2VtOXog=;
        b=QTTurk8Gnckcs4DiXcWXlnIt0XQWd2wIKqNv25142jWGEOVdTsJUWeAwUfrFyS2qxm
         3hnpurw2F0QMdhqazHKHBBbbKvtUDvS3h2iYn3StXyUftfIjO+4cXFyjoTHjhKNjF3Aq
         Q0Tz4jStXElz/qiw31cjDAZ8xr2DiPAM5oYGomDkNi7Kb3ZYi2UMVZOgD8vvU6zbtQEq
         qzE8u9qPY2I/8QUeomyb6ne9WSIfepjRgzvAzoLsuOo7mqbGyg2DgFXNhcsz/cCh2bva
         /epm8Yp94/xK7aiUyI++ys4Mo0Dg/+Vt9/2SB7INfgEzPFXi1QmxASVweGOEJwYT+MTs
         8/vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793320094; x=1793924894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=EPx92SD2/nlj7Gy51oiGKSuUhEEV6f/QjPP90GOkDFVvLeS6MkjDeipocwNmUYAOHo
         Nma4hshQFzy8X4MAfiLVXTjTch8fzebGbKsTHtFJVZmvtcJ/XLqiU+X5MXeqsCMVmIYv
         Za79hAeh1NeJmDlCqaGo8wCd2EdswfqWUwrXH4+pxbUG3u1MGAduayGdfH3uUrZKg2FG
         eri6QEgtNhdn53F3TkjFc1eyvmQSMpWYENciLq1Xsp6jUql6lXYYI0BBLIWwe3DleuAP
         Gnl0sybHD7FswrWEWSln9OeTt7tTQs+RyhYAc6FCxYbGnZJZKGP3TlK3uV0H5AyQZyiV
         9+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320094; x=1793924894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=hvuAMgAchSueH3Xn1Dd7GUyu4crZ7jlRVoY2h8A7Z8Yc9QJGwGDQpmyVibyLEUe2La
         jw9W7NFmmtWcspuYvetU8fQ1Ayqhd8hSZcktneJiMVQdsRS7tRgp9WXlNMFVS6ogr1NM
         S8S1h/JhhyTIsqiGnoCxgyXA+Zv9db3DlKKcOdZNaXuw+CcE/GhQd4ipGLIzwUkusgVB
         v/s25JYgdQ9PQiReUjTBeqQ20OFk/GTwvPl3e6m2KSX+7PfXmLCdwFzmP51hye0frHdE
         NFXdgYsh/DvY+wYXGygl9B96MiEQhGz15cH9m0a8KDF+CUVxTDN2VZZ01XP3Or42nPET
         LeQQ==
X-Forwarded-Encrypted: i=1; AKwUvBynOlPitzodYbcAknJuxGwxZCF1Iz+X8WSII8OpXfi1SMHQ4YB37CCGz8geznA/we1QIxtgMr3RwRPacCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7I8qWuKI/aXtxpuCbCLYf0IqhjuI4I2L9ePrrsKgO96hQSf9r
	3X+Ct4+RepnoAQ2C++pcmQ+WASJ+YS2Xd3EV1OTaEZnmDk8ECgj6TVuP+PCI0E3GZxCtlojb4y2
	AJaEGPfsTYV+SZW9gTDydNAoMLbpz8+iWaM5FCPex
X-Gm-Gg: AYBFou2ZEVNaCAC3vfm3j8LZ+ns4LALLkeea3F0Xt9FyCZgN0WXKw1DV4yo1y32XhfS
	7qwMI9Ikqs/I6thpqajqyiPXgwdG52Y2TbSPTnRc/NyVvsjmt2WMx/ZztvJmzSvK+sXk7Y5yhmY
	wxm63P2GGFu5bctNbVE2XIzCjd4cB5KvOvn0Z2hOrTJKruQl9IuUUSJz4QUs1l+8syKb2yREFL+
	1Ci9F9pgMlTofvQ9b8Vu8XFpWc+7j6bUoVEnuCr0KUAjO36swZadvnSGS9end/RHXq0PvQBw+J3
	2TSZHxj5OyD571OcOYQmQXngTkeGSV0qm5arrIK9izkGGZWLCPtdsQ7XKr6p3jOJpnHWW/Zg+bO
	yz5+A7WCQS+y0ig/pqRmxH7+63hWJBojSvacmo72skAVgF6JRn+G117Lq2bnzAKnK9OIxdPw=
X-Received: by 2002:a17:906:730f:b0:c49:a849:cb90 with SMTP id
 a640c23a62f3a-c4ca7a9b33bmr56944566b.39.1793320093443; Thu, 29 Oct 2026
 17:28:13 -0700 (PDT)
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
 <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
In-Reply-To: <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:28:01 -0700
X-Gm-Features: AclHuK9TILtLrldY6faAGXZBT-kc2c2frEEMYWdaANb8mW26TierZlqcroORRGk
Message-ID: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
> >
>
> foo and foo.constprop0 are different functions with different
> arguments, so I think we should distinguish them. The only special
> case is .llvm.<hash> because that suffix is added by compiler for LTO
> and I don't think the function itself is any different from the
> original

[...]

> I do think it would be good to spend a bit of thought on how to
> support at least one-by-one pagination from the get go. The same
> mechanism can then be used by batch version. I.e., think what can we
> use to provide data back to user which they can use to continue search
> after the symbol we just returned (at least for fixed set of symbols
> in vmlinux and modules; we also have dynamic symbols added for [bpf]
> "module", etc, we should support those as much as possible with the
> least possible deviation, IMO)

Let me sit on this a bit and figure out how to distill all of this
into a clean interface. I'll keep the .llvm.<hash>, pagination, and
batching in mind for the design.

[...]

> user code can be easily written by always setting buffer size, even if
> kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> let's keep it consistent.

Ack, will have size in the struct for v3.

> also, returning actual size even if buffer is too short is a good way
> for user space to "probe" and increase buffer if necessary. unless it
> adds tons of complexity, this is a good and flexible UAPI

Ack.
