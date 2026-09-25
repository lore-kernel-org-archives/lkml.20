Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD522E8DEC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296533; cv=none; b=C6Vr87opw8UHE2v+FWZuVWJKe3NH9X2w8Mt3TMGDObds+MI9EEFdpHU/erz+J6TiuNZPcx4jK/yAlVAwVK9nyL57O5JGUg+Bycs2ji5eyU0hfpDSUovKWhTKqmz+egF6ry0Hd3ocJypIfZdcN6sQW9B87/He7E932RNFEQDWQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296533; c=relaxed/simple;
	bh=hebUzPg3vAhQ8dkiTbW/tOA0dd+f08mr+mLd9kEW37A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FeEQ/rZ3alNUdm7F3GlLLw7sHZGhLXESlzz3BP+nei9Z2W0jcAZ6EfH3coD5reOL0fviHlNp2moxaf18OU6aWIAD9xOAnTzp4Fvpo4wGhCu3nK0ZiSntIsQm6q4R2aIVBgQxNaW6mzGw+IrOC0Y3KYYprRiEszzEFvA4clSg6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N43tEKoQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N43tEKoQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so1325305ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296531; x=1790901331; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hebUzPg3vAhQ8dkiTbW/tOA0dd+f08mr+mLd9kEW37A=;
        b=N43tEKoQpfHAfiP6Q4u+7/dEpIF/wQjFvdLvPgtikIPqe+JpOukxwhL6XLgTRL/8N/
         uH5GTe0+XhtTOwdNpjaW6g2rDgINNGlz5EFtq4KLtOh6jyYNasp9NTdDWl6tKwEvVMwS
         HnMh3IslMrW1MvDE9JOKt8G9PEYDgVhumEW5N9ff687SObTzvBlyz+kGlcZ1ovtHSgvh
         FDsCXVOY89Emibt9Kzo0nrhZtUSLbol//UiTGC0iQuKdXgFo2B5LCJmcQFI3ZAzX/bGt
         o/o1aeZakJE+sBKnLWBve0/rM1zHUohZl60jybkv2qlv9AQC61E7mVdJbAsheFjonhXg
         MnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296531; x=1790901331;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hebUzPg3vAhQ8dkiTbW/tOA0dd+f08mr+mLd9kEW37A=;
        b=NPfVwt1ElMLTzWylAzPFhDNtrBjf9k9cEM+wyp/PBV0oFfCMiMMCp/utKFtOhPMo/o
         fDAupk3IIgYdzFz9XFg8PCzv4/V9nuJSu44i1M2FdzgpA3XM5FzLcUdS91v+8zMIvpnQ
         IFDrOWZwctBEzWdJDedaebSO4kJpJzBvjMFrxbKMoLN3dpTQHmzKb2F0uJuO/f8hFJbX
         6gzN85whPzt34cabNSWRAwbbbBccPEm3Fg0uupdlFq9hYPdixwjdBg9FSqrHXIRVkYeO
         x+mtx+wCajRBvDLEIIgvccXdHc6TbcRuu7zHa7j5ed7W2wjRiL9vJtoY6+wxnCXFvj6I
         RYyw==
X-Forwarded-Encrypted: i=1; AKwUvBx25vNJqGhAKzM0lBTuyLW94TuilLD83VPCF22Hk/qolEB1q650MeoRPfCWnhZbsSsn2xQcb2W+GkOzVo4=@vger.kernel.org
X-Gm-Message-State: AFuF++meUQtoC3VE3lsjWre/Buw4TMm4+2ytyjP1LmhCuoEvq2A4ZFuU
	3ktMQO127u5PZ0U7HnLilHeOwZJxjsInwqD/Cwmi7kLOGptOs38aWX8j
X-Gm-Gg: AYBFou0CkVIHXWys/7w/O38RvN5Rs9Q6azbGC6DrZ0BNWvnOQbbhStvTFImg8lBF83V
	LeqmHj3a4jDlJvELIdcJFVEKPmVg8ZBlKs35c3LRA2lxLqkpL97nx2vxUUtE+sbN53hHIINwb/n
	naYWoK8pTCKamvAjbkRgX/VmvpKdxW6/cIZwyEupQWVcUMJgaX+TjKGuZtGUS9lGOJUzRcfvV0P
	HiJK5OTVVvFDsZvf/4EJuCGV0KwpcVQZ8qNW6STo5CVbtUbiqkmxPdiqaeKyp3cagGXhEL21Cky
	j+WU/PV/YobkXl5f8Cx0SFqcvpF75KvDPO4FNVC1Q0vvgh7my9vge/fYYEy1+ReCgbTboDbJeRL
	njY+Tw1zvw4TuzzcGtGn8J/wHzpdbRKRqFTC8NXV6vFWACMi9TQS+bz1J9MxdKE7O4e+ynAVp+X
	EVUhWSZjkNErHpP862+3wJi15Q9Uk8dobpSPXGxEaulgudy5TRYEMcEyZZv/HWn8hECOdi6Ihst
	RxKPweGQawf6ecguenF+zE2qmYBVxM1TL5HQ5/f7r9bzSSLnpwRhW4ll7FBHfx5TjqkrnFjphUo
	yXWB
X-Received: by 2002:a17:90a:e705:b0:39e:6c69:34cd with SMTP id 98e67ed59e1d1-3a098e81f58mr3708276a91.49.1790296531345;
        Thu, 24 Sep 2026 17:35:31 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm209930a91.15.2026.09.24.17.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 00:35:29 +0000
Message-Id: <DLNZ5JQGHKP6.3TN7S6R9IFH5C@gmail.com>
To: "Florent Revest (Anthropic)" <florent.revest@linux.dev>,
 <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "KP Singh" <kpsingh@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Leon Hwang" <leon.hwang@linux.dev>, "Junseo
 Lim" <zirajs7@gmail.com>, "Sechang Lim" <rhkrqnwk98@gmail.com>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, "Hari Bathini" <hbathini@linux.ibm.com>,
 "Christophe Leroy" <chleroy@kernel.org>, "Naveen N Rao"
 <naveen@kernel.org>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Pu Lehui" <pulehui@huawei.com>, "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Hengqi Chen" <hengqi.chen@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf v3 2/3] bpf: Skip the progs of trampoline images
 that are being freed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260924170543.1017048-1-florent.revest@linux.dev>
 <20260924170543.1017048-3-florent.revest@linux.dev>
In-Reply-To: <20260924170543.1017048-3-florent.revest@linux.dev>

On Thu Sep 24, 2026 at 5:05 PM UTC, Florent Revest (Anthropic) wrote:
> call sequences, which replaces ip_after_call. Tasks that are still in an
> image that was put skip all of its progs from then on, including the
> ones that are still attached, like they already skipped its fexit
> progs. The call to the original function is left alone, a task that is
> before it in the image still has to run it.

So I slept on it and you were right to argue that skipping fmod_ret
is a bad idea. bpf-ci explains it well.

So let's patch only the progs that are being detached instead of all.
Pretty much what you had in v2, but also explain why list is needed
and why just patching previous tramp is not enough.

Also see CI re: lower limit for x86.

Adjusting BPF_MAX_TRAMP_LINKS for large page sizes is a bigger change.
Ignore it for now.

pw-bot: cr
