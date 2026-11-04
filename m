Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802197;
	b=lmVSpnSa4wQr0DgdiK+q1zT4BYzP3Er0W5rF++1fu7T2AzR+23raIhpLNrMF5g5P7FZl
	 RLc6iKeuq8VbC3mje1BaUyqU+wmLlBQ88XmbuX9h6BAB9rrlrFkCwoNPFVjtr7s8DAfDo
	 sCO2v2ckdCcpQWCLisncNqtFkjILnxMwZ81wPFMvS+Y9Et/ibDHtRZ8WekjHFDu7lZml9
	 p0PWMtmTRjh3c3eFxzxZOre4uhlx2aCKHhpLqrd57rLf+SLbbT7/z9CrrxWIIMyAXQxdr
	 5Rl9G+mpDja/MMkd+JqBW1VsSNWGVUe60Mn4oXL0x4v3R6ftI4tig3YYKvSoVObtCDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
	b=1K63IVxsXB/pqkBsahihGsFfhj0lYpG+V4sw97dwLfj30FMhN5m03eiLBUF1jpKNm0Z/
	 srb/VA8qZ53Z5GFD2krk71syWG3r7T57/gGFPrPRL0oQ+vsGsljKBfLCnvOtMvnRehfHP
	 CSDANj+vFuE8Fv98V0e/fr6rKEiLgWHcq6n2jJkmzJMaMpYMTW5KMMKYzG7eBCeu78cHs
	 WPiFxKVFa+hVGsOGYb8kokxm8L380DKXF0wbByLPc1O3/58ibFM5La0dZNyEXjM9tpu0n
	 9H4yJABTWvu6SEW/lqAHEdY7AfkXYatjVQMal+Np3QS+flZ40Ev9yMaI3flt/ycjybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LsVrB1R;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F407606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F407606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LsVrB1R
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6789045e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802195; x=1794406995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=0LsVrB1RbPjDtXwX3qjLB1A3vbWVpqZ7HZf5pVQXVp4B7btdszFS1RljBh17d4QysC
         BS3cixxniLqtiMaPPHJK5cPfu73HovzOQC3aoX+YmxViTbcNeU+xrWcrtDpOK3olBzbq
         8BYj61J6NvVpkQGghxMoUWWxHaUL3v2+0S7dfFQuuTth1J1asNB7GdDfzPs5Ij5j1Fma
         CAHQ0lbRdCK0qEiS0+sQqrIdPbDnjliso64JP9yRZdlJQLMNlR49y+Q1lop64YIK2xJG
         yr/u0N5gPgEp75e1VVKhayMcmVrXJMOLfY8AaES0WpLtJCBYs28K3LQlgCNZwXYwAbjv
         QTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802195; x=1794406995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=XHnjX5pTmwnMr2j21oN0HvSc9B2d0DJ+wUTccE9dP4n3gTGVqddy2aOH9OsABy8toU
         WZQelY9XXxHHC90fo5TMVqyd3FWghtRmmIfgNgnEioVsm92b8PjjOgPYIiRWCKf5ryg9
         BN32OKNrsMKSFK3ONAJ1U5hsj4JBc9D+9uk5jcm7mCHBkMaxcMYeWtyOltnixDUThwel
         gWYMknnSAdtE8jTh9RaatXRPuhhefBfVSPFtctdb7Y4R6QGSNenPnZ0IOEDd9XeMswGF
         IC45js/iAO/u/ES3dumAvL/dPb0j2wt4faPsBhzUCwvWVeKNVx5Hd4RqXIWogT/ISh8+
         xTbg==
X-Forwarded-Encrypted: i=1; AKwUvBy/PSctjfunSI65eTiBWpw4qYUfp5xomqAFYOUvDkgo8qkEIrBAkkkM82q4d0yf1y8moR4cUnFVIp9wj5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gru+Bo4VcfnnLDf1msmOCvqdZER8SB/EJq6eeCBsf1TWX2djY
	ZehJURAAjipZc3vZC5vyaG9Zkhn9R/KlF8htzdZahFbb6jO2v6oCu3cY
X-Gm-Gg: AYBFou2tgE4hGmQTrH+BNKv8kg5xrlxXbhUTZZwkbUO327T7UzM6oB8lFuVCNxW5H3p
	x1Kfei2bGqxCoW/T54yr8SPIy/S7aW3QXTJRh0B2nZKF0Vjt8+ny9ST9hQsn+jzyU2HL8DdwY1P
	Rr9zCDDxsyiQKkzLC09CxQMksd4iGAbY6UdZg7qLb58qOsCCtLoey6pf/rcZv3ox9Sz6rqPYrrX
	ZChgaD+w1ysTdVyxsuxLj1ShEnRa0F63Q9pDcOabcFzaYIRR2M42NlgZ9pyhi+fy/CpMYiyCuoi
	cXakqqFn7yR46hr/zLS/ru0dq+9nU4NYAoF0QD5Yb/PhFbls8kTY4aXWjrGnIvdD51n4evOjRsO
	Cj8qYVBrg7aK7sKw3Z1Ic3iXZBPA7SKRCkfKrKEdXeDRQCDPGfiBNH3Oz5nokPESYyK1xzLPR24
	7iv6Z2L41HkK7EUNf3/zKjpA9O6plBAkA1pfkGix3lBgFyxNN91ElSTzQD7uF/Pc640X8k6T8+C
	YdrEqE1oSmrlcRhAZvYNOzeJomngqUjhMycvebRyDLsnRR3eC38s9GubYSGpHWgNLloS/rz5nCg
	Yg1Fope3zer2Jk+sBR0JMNLqRyU4vzQ3OPKcEFAIlEkYUneTkOZPivor1mecfhke
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr406397685e9.17.1793802195353;
        Wed, 04 Nov 2026 06:23:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c7480e3sm87089165e9.7.2026.11.04.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:23:09 -0800 (PST)
Date: Wed, 4 Nov 2026 14:23:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261104142307.431fc12f@pumpkin>
In-Reply-To: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 17:14:26 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Oct 2026 15:05:45 -0700
> > Samuel Wu <wusamuel@google.com> wrote: =20
> [...]
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here! =20
> >
> > Only that the user might really want one of the copies.
> > Sometimes there is only the copy. =20
>=20
> Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> pagination to cover these. A prefix query for "foo." also finds the
> copies when plain foo does not exist (expanded on this in my reply to
> Andrii's Oct 30 mail in this thread).

I'm busy rebasing my patches - they got stamped all over :-(
I should get a v3 that applies by the end of the week.

I will add a 'prefix' variant for you.
The 'next symbol matches' flag is exactly that (actually it is a
this symbol is a duplicate to avoid issues at the start of the array).
So in this case that application would always need to read
the next symbol (by name).

I think it might be more sensible (less pitfalls later on) to return
the symbol number - not that of the next one.

David
