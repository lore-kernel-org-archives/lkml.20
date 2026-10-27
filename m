Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793136817;
	b=pJQlJWMiKztuv0fsmw8O5tzN26GV0M393zssRTVL4ebRwLOf8a07Nc+oOvn2l0//F4iz
	 UAaOBDk6bN9PCbfbXT1twCqRuyHXQGtbMjjqxlzHbdfFlEZVue+0NroW4ssa0NLe6EDD8
	 3RNMMf92LB1Y9wuehHm8NGYPlntKiETl+4eSFbmO46OVVe+32i24AzcgQUwa4dMRS7E3q
	 q6zs3vb5OLH7EueIgJMn01zgwDvp4Qain5rz/LtwLXnCiSGqfGogpqxM4b+H5wbHVcTdg
	 WjvKAcdq6eyJOJ++iTZZK4+9RY77b6DsIQyXIYJ67YZKSo5Ykzl4JbusdumMxmFBQ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
	b=TRTFX/8itgmTDetUMQgiemf/k6uDNqkNwbU1JrEeq2IIOWSqmq7ohzBr+rekdCMJlxm8
	 A4nwz1rZNuW0Tq7QRIlN98t+Mmynx2jc4ktBXbxrop1J3GeqLxZb34B6MPDspflo/7Ikt
	 FWhjGh53gxGNOCcnFj13aYKOWaDx/uh8Zb4kwyW4omaiTtH61Y5BsdK639uSvfeD9/7uo
	 /pTCDJJVDdisVqedgSYUckdw0BfnCQfjS93aQ2G5h+e7owCxqFCICXdrEQBcy6oyqLzZ0
	 GmyfQsCPPjJ2cddrYckCgD/IySHCKZmTlcIufo4nVXu7HTz+gmBFh5Jv+NkHS+zZ24g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F20606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c43fbcb4393so45310766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136816; cv=none;
        d=google.com; s=arc-20260327;
        b=ktBWTqMuRS0qMgYABRSJiRHLSu6jtcVi0S5PhAFB3qxQTQRvBmEwWHxXjIJtkVCG+O
         RMNRSpB+RD9F8CmeMFwS38bUW2PpK9SP+JE7rwhVbLOSlYlmRrfjBYfXV5C6M/61urqO
         k68Y+cpfob8Qu6xT97HazKRv+ISHc0mnMdaEkyI6j/IvWyLein5PucIudcmJUOATvUaA
         pP4ELT0BAAfVN95bbSvI+wK7I4q0wkuNNBNZW6oT9G8o/mTzqx17lrsNmJWf3OHxLbr9
         +kKm1pMeUZ+ZGqas9rl7OJpjOjRU5CbsnvS0dZcgKrXMnFNdK5P45LgiCavzNp2bZkO6
         YAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        fh=67APB29WBDGiFAY4lMpDk8o8xkSalRqXUN8vXefYeW0=;
        b=iWoHM3CSXM6ImulzvNIDj6Vw6E3IFX9G2SUUaBDju2ie/qqiVlhjzOu4ncV+WOdT8J
         MSrJud6w8RClkCU37efg4I0K4cNlODtSAUjXzg9Q7zrhAd9dIVdArBJz2D0V/paOoJXE
         pFi7/E2bnF5O2Y/IRFhHA6VwMRL2wjzWxNlyTZEZgveTbzdOg+gXXtElcbGD5xmQ1Gna
         4wPsOR91J/nMGxT2dX8TOq+z8Bueowv6WqXZqZSZyc4nuc9ybT240hw3E6DFaOadyDlX
         qYWh5u6Frl41OR7X+wyCt/L/Tr1ne8MoZMKXN0X0xqDndzAo2WWAVxpKDC7bTzr2Nk+4
         z9aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136815; x=1793741615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=g7sJnt3wPEA2XZ1mAxKwQvnescy/AmvEeggYBV/bXD3MuIPFGWm+VsYptXHbKr61hf
         4FARY3QXaMPrBKchcQp6zZCpKuI/KiCtA21MlAlJWGy2Kd9S3keQy0aRcUWfbZq0cN6O
         t+ZUnNAzQq8AqLVI+7wo+FVX0HtqrVKwSFypfrpl5HPN5xyi3yim1BdvxmiRypr4LfqY
         icHq1yhYo+CH2xebKoxORy5HUyL1KoPxjFvTXCArpeID1YiAuC25SDJHunNWK9AmqdIU
         Y4R0H7+oxgo+7Mw4vZpkb/AlAZHlVFwc006lV1hywQyMv9pBorAhHkU4CzX47qiQSyVs
         5QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136815; x=1793741615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=BIsjxc0uLbfVPNv8FpuowG+YnS+5g0oy0BFHzJpcdGgT7ZvXW+Ts78Zt/1WistRH91
         u1ywOBrEGtPcJbruszqOZkYByIqtliv22tvsas5q9icEHvThc3RxrybZ28HVypNZYjuI
         l6lN0ZJK1DpoCPiXhGYFcJRpv9UA9K4X6xrm6rU45lCcoQIJUsDCDpg7ZbRJflUabUNl
         LqCxsGcVbAmUylgT4i2PRqv/r9EHPgSgE9s5K2Jj8MVQRlsgZ9wqbN5Pw2JODfoXhxmt
         QVA2hbnuG/THWvLnkK8irD7SkgrIpUbR+M/JqdCknBn3eSk5Kfsc5BTMYFmwAwycwudM
         rw/Q==
X-Forwarded-Encrypted: i=1; AKwUvBygYBIGYOCDK3oEbogQKVyspp55UjESCit6cflwPJZ2voZCo1qiAzN0CTp5BKemPcNOr+W94u7jEGYRT1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxMKqNOQH0x0CMaTEI2VD8OpsG0qWpem2tb06Cx7V7Pj/1FyAy
	LwAKNbejNWPTRqkaMe4gyv88qudkLH2RzS/P1n0LAdgs8QYpzSYR0LoJhDo97En2qk+CyPU8Lwb
	5VQhngya+Mo5y3/QMmydcXv2tJA+Bdi/yI4GKDGpd
X-Gm-Gg: AYBFou2O8oLA9f0ZW9K3ZxnoLyhE6hVJlpoxIQuNQsBLiGd0iWwFRfCWWg279pVrhKn
	yKiRer/A7+Ytc5lH/c9KWn14xBlCacwo3G8b8YAaGBG7QPOnmDXfr7X1BBfEep/bUCuDmi9RyIL
	jsvbcnYBVHrfrv+HgEiKB9vy4Bg95TiYJoPWhhRkOFXn54/3FnI0ukqurlPWweTpSoRMWntJJRn
	KnhOQuFL3K+X+/3Pfu4fJm/5qeyGGP8Nd0hyjnhx4aZKtKDGcCkV4WuQRf1xLJEDCU7V4HXYlpj
	3/H9a4MjCLxsq/M0qR5bn+wGHoDxiNi75lPro99gLCPXN0ECqB3325H2whit7zZqEeO7zjVsCCw
	qPJGjT2b7mEt74vf8kfBE/v2yYu7E9feNavpxOPjghVgN8tD+agumSYQYdYB/fQrLf6M=
X-Received: by 2002:a17:907:6e8f:b0:c41:4c20:5a80 with SMTP id
 a640c23a62f3a-c49be03be8amr44212466b.44.1793136815046; Tue, 27 Oct 2026
 14:33:35 -0700 (PDT)
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
 <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
In-Reply-To: <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:33:23 -0700
X-Gm-Features: AclHuK_RVByZe0xeoKYD7y86VR2bYrI5dalonw-UmAvCLqjMUtZYQFJax9TZsKU
Message-ID: <CAG2KctpaX3Hgbnw4iXqrddYPJoqtVBFq2QO7tvEzhHDjgU_KAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
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

On Sun, Oct 25, 2026 at 4:29=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/22/26 5:16 PM, Samuel Wu wrote:
>
> ...
> > ---
> >  include/uapi/linux/fs.h |  41 +++++++++++++
> >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 173 insertions(+)
> >
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 34c6f219462a..b43f227dad0e 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -674,6 +674,47 @@ struct procmap_query {
> >       __u64 build_id_addr;            /* in */
> >  };
> >
> > +/* /proc/kallsyms ioctl */
> > +#define KALLSYMS_QUERY       _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kall=
syms_query)
> ...
>
>
> Documentation/userspace/ioctl/ioctl-number.rst doesn't seem to know
> about PROCFS_IOCTL_MAGIC and what range of @nr values that it uses.
>
> Please update it.
>

Thanks for the catch Randy! In v3, I'll add a 'f' 10-12 entry for
PROCFS_IOCTL_MAGIC (PAGEMAP_SCAN, PROCMAP_QUERY, KALSYMS_QUERY) to
Documentation/userspace/ioctl/ioctl-number.rst.
