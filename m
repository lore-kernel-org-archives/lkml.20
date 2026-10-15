Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5A55C30C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091013; cv=none; b=Wv4ZeLBNKwdXTt4h7rAh19nc3ZKw/nMAhGZR2ZypReQZ8FHE+sNwnUHEQQMsj3qMukgY8K3R5mt/esaqZfUtEn3QGgc80kZfjufskLy5UbGmB9DAXbRoDd3ArMZmAOZHQz8Ib6DsX04avMJi37ap3Av0Kz0GHYKjXmVtXFfeMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091013; c=relaxed/simple;
	bh=7b1Nk/ZJMD8drhAUN0wfc2gumfVbFyem4H6YFgUVL0I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Gu7OjppUxTSciX9EyPkKmrqz9fAS5RZwe80vWVzBOeKzNq2Zabsb7C/lfDVKuf0/b9QTXZ9igidcfcqgA698VgcU0Q71IBO8SmiXaCssgp7/Mlc6TrxDFR/I8i1F+yXaHPBsJmnRecWag1XxK2Lq3j2+3PMVZgQvvKPICv+auLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cabQjDQA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cabQjDQA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so2145025ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792091011; x=1792695811; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b1Nk/ZJMD8drhAUN0wfc2gumfVbFyem4H6YFgUVL0I=;
        b=cabQjDQA/k9ATVD4gnaKh4L7m2sori+UVd3ZH8wkFq9YfJR07+qoCNn8PbsY9jFXjD
         opQb5ZbNd7L/PdeaBc1knI0NK2tG5sRWAxs1++tNNLZ/CdDHfEMnP5RyublAYLkz2IDM
         bhqRcVtHNQEbSDghMBZJH+j0/jWlO6l0FUxF0hOMWaPSuGJ2lByZ4zWrBI+L6+Tckzi9
         tEFYrK3kDLUptKZ7snEhsyjpN7I29XjuQJqEySWe1cthQwJ3/mZ/RzeG/3Q55yWn+2bH
         Q2qA3mNKPEDvIv42hLV6cz09T5EN1AAEriNlOZXYe5RT3dmogzTNUryiQKDxL55QlniU
         ZkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792091011; x=1792695811;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b1Nk/ZJMD8drhAUN0wfc2gumfVbFyem4H6YFgUVL0I=;
        b=a/4a6kEjV4cUky/6bCM0cz59VcbeHR3VoIzTBuAJzmudkJKt83Ev0Z2T2m9PK2eeam
         rtvKg/yg61z5RjWfAw6D09vRr9n4nRHZh3iA5wqsF7aZzrR8nPy5j4rwZGsa1ohs+AZo
         ypTJxbQSF8E4HSCEbyNDYKEvkaFxBHJcJ9Ln0Wnu0HrrrFA7zHhNj75gVQn2nr7UK38f
         tlKw0BVKnDdecdnF+8yARHLAz58vME/e8b0T+1ZYJ16anA8Z0uieZrWlrUAuk67QkCF0
         DFV3xTkkYjk2M9wuvhrCpcuaAGI3JgZsKsAWpQ7NHqd1fv7yZhMKEEnv06olzQsAmIKH
         zz9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxShnNRqi1GUIvdqW/iDbF9CCsUCsRUGeQidBuxwiwMURQEavUXLxBldlvogZgrqfnHKZx6eLRZyuYN0Go=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ1ANE5m+RHl1A1sv+g7+iiiIQwsEjNysM1MVbdHzF14zXGq4+
	4okBMGEHRPrN+L/ACSQtUIIJ+RBnvPWDdlRx9hy1G5WMWGlNGr+sJ3X7
X-Gm-Gg: AYBFou3jSoYCDqyj3pjWp9Gw+qcsTBXtaimQH61sGJUEeiCvmdfr8E7oedCjr79q1z8
	NDlrIDZmxQFHgGjl4hOHcolnNXqKcUSSXl5faXAtm/oTlZH7itiV8ViC+SnWz9ogTRh9ubJ4m1M
	c9pDKc25384DmWGrn/C8VLcjDqXf9xALDtuysa/uN3pTcoj43Wc+t4theImnyWJJHv53eVs1DQ0
	ZymDwMS0jgFRAM5da2eQhXzWdjfe4PoLozfgpkXBFn73OmEloks/fTRndZLF5qICnedxoeYedOe
	MJx0EjO8nCijbVtViuL0O6NLSZtXHUZerbnF/x+8g6HHGOp++UzsUEnk5C2r9553LcYcm75lM85
	R+Y3NkiOeCn5tYZu/HE5sArOhar+VN5q7wD4X5jgUE4BGLeOKXHUXpbr27L48H21rb2FQTBVfKJ
	ewmUawLrzvUxM9ssaN8/3j25Ve3v22VXQlYed8lzVxatIupw+Q0cG3O2xiJ8suOCDGIz+6tNJ2K
	GSUW9HzlDsoBitOlFJ4BsQOxi/FlLzDfmRcV2NCSqeH439vOSNpzde+sxXZ8vcrtMUMa8BADM85
	I6Y=
X-Received: by 2002:a17:903:144b:b0:2e9:64b9:a338 with SMTP id d9443c01a7336-2e977140eccmr6102915ad.7.1792091010968;
        Thu, 15 Oct 2026 12:03:30 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8aad3dsm464765ad.64.2026.10.15.12.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 19:03:29 +0000
Message-Id: <DM5N8SCBZDQE.2SC93YN5ILEYG@gmail.com>
Subject: Re: [PATCH bpf-next v2 00/21] bpf: Add tracing_multi link support
 for bpf progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, "Jiri Olsa" <olsajiri@gmail.com>
Cc: <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Quentin Monnet" <qmo@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, "Mykyta Yatsenko" <yatsenko@meta.com>, "Avinash
 Duduskar" <avinash.duduskar@gmail.com>, "Anton Protopopov"
 <a.s.protopopov@gmail.com>, "Amery Hung" <ameryhung@gmail.com>, "Jordan
 Rife" <jordan@jrife.io>, "Rong Tao" <rongtao@cestc.cn>, "Eyal Birger"
 <eyal.birger@gmail.com>, "Pu Lehui" <pulehui@huawei.com>, "Jingguo Tan"
 <tanjingguo@huawei.com>, "Lin Ma" <malin89@huawei.com>,
 <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <as_7Jgy_sdTE9M5O@krava> <09db7d70-b7d4-4cf5-9447-6d16bac10794@linux.dev>
In-Reply-To: <09db7d70-b7d4-4cf5-9447-6d16bac10794@linux.dev>

On Thu Oct 15, 2026 at 1:48 AM UTC, Leon Hwang wrote:
> On 15/10/26 05:59, Jiri Olsa wrote:
>> On Mon, Oct 12, 2026 at 11:40:02PM +0800, Leon Hwang wrote:
>>> Similar to the tracing_multi link support for kernel functions [1], add
>>> support for bpf progs.
>>>
>>> With this support, I'll be able to enhance the function-graph feature o=
f
>>> bpfsnoop [2]. It will trace all bpf progs, including their subprogs, to
>>> draw a full function call graph including bpf prog call sites.
>>>
>>> The attachment could speed-up when there are hundreds of targets. For
>>> example, on high CPU core count servers, it probably runs 200 tc-bpf
>>> progs as Kubernetes CNI, and each tc-bpf prog might have 4 subprogs.
>>> Hence, there will be 1000 targets to trace for bpfsnoop's function-grap=
h
>>> feature.
>>>
>>> With tracing_multi link support for bpf progs, bpfsnoop will be able to
>>> attach to all targets quickly.
>>>
>>> When attaching to 1000 targets, fentry.multi is much faster than fentry
>>> on a 16c16g QEMU VM on an AMD EPYC 9745 server.
>>>
>>> ./bench tracing-multi-attach-progs
>>> Setting up benchmark 'tracing-multi-attach-progs'...
>>> tracing-multi-attach-progs: prepared 1000 identical BPF program targets
>>> tracing-multi-attach-progs: fentry created and attached 1000 programs/l=
inks in 338.171ms
>>> tracing-multi-attach-progs: fentry.multi created one program and attach=
ed one 1000-target link in 47.345ms
>>> tracing-multi-attach-progs: fentry.multi creation/attachment speedup is=
 7.14x
>>=20
>> it's faster, but the original attachment is under 1s,
>> so not really a problem imo
>>=20
>> I guess the api is better for your use case, like having
>> less file descriptors open ?
>
> Correct.
>
> The original attachment is fast enough. So there is no need to improve
> attachment performance with a large patch series.
>
> Even though the series brings two benefits:
>
> * One bpf link for multiple bpf prog targets.
> * Support for all archs that have trampoline support.
>
> But, I also doubt the value of this series.

I'm not sure about the value as well.
You also need to benchmark detach time.
Overall the perf improvement is too minor vs added complexity,
but the first couple patches in the set look like a nice cleanup.
Pls resend them.

pw-bot: cr

