Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793292473;
	b=CS4asAvr7huxQxiLm/LcnhusfVFq6fjeA2WKZElKSsseyGikTKxE2CNEFxLiDgXRFfqa
	 63ulyaXFGDP3H6A5gly+EF5XsFyMN02j2X6ZYSI+qlAejLNVdesRftG/0avnKPASWV3AL
	 gi9I4eM/6eQy7Za1CNpqebtI1794O+yuAMrlGAlwu/XH6LdIaKaUanIoRaD75rHXWPcAF
	 HV9ydtq3SFHMPsZPZRvoeDvhd2w8PepUKTNv1Q9XBr3SEJvTIoTbQyiYSpJvE1ppn2E8w
	 grJr686BnGqohQ3/9HQi6proOXORsKfdYm5g1irQwmsH6uVq+Uo3OK3pd4hRac99ngA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wsa/p8DFgC7lEBUBlf/AbqoCERuv8Vl8amjCmWqotBs=;
	b=NJUXn81o5RzVQBHxbCMtgEQuFyxFxDG2hkM30ZlLMbx1K02PXHEKQy/kn/naNgxNKahH
	 yNSTw9bkKphxzHht9UW4wFF5U8VPNyWI6G22Ly1/nOzuYx52Kx3XGkdT7eTr9Sqz8Bce3
	 GCzBuJFW27pK1xLIOPER4NUkTOBE39CNZgsd8XRhkwXYyq+wlSL05yC5SznoWz1Y70gUX
	 oRSKJffGLydCEj2WiioB5dISNgGYw/JaJE4AHWI3FUma7tDc1A+vm2n4K71bugdjT+2FQ
	 kvqvoROK3WRWvriQgJfzShJqN51Ozvybobe8MoQ3hv2XKmz4rKpHbYF7Lynq5GsV6/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zsxb8QNM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635CE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zsxb8QNM
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so4340835eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793292472; cv=none;
        d=google.com; s=arc-20260327;
        b=DPF5AsOgQcQk0wZQi2cbH/yicv20GUByparvEAP1grWiZT61qPQ7FFJWVyihY8Ao5J
         bbMOiNGgAgK21yVMkcD55uAhevimx52lFSB5AuZVCtsjP8mVFSoIkWw4V+Y+uU8PwykN
         kaKDiaiHMt47gebNa4jV0N4ItPWi+7oOIE+atNhjVStNwZfQ5UvGFflNkanqo0Pm8PQL
         7JPZnd19VbZBjVa5+VmtRPGRs9gxGOiPD/azckQT9eZwbO66PDeamAZ9rbg6bvjuo1Ml
         bG8XCSvixToWiUmsvF3rbVMLQ8RBn/hdcQ1piVWi2uQm4s2cjJjzHeGpEZppn14WREJv
         PbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wsa/p8DFgC7lEBUBlf/AbqoCERuv8Vl8amjCmWqotBs=;
        fh=pb2k+z60WwdqKa8GqUwB9qjNBMf9J1i50XefYi1Btgk=;
        b=OE10kVHX6gRLXInaw7db+l3kpyqIS/BfohPB2HNUUPa0oHO3q+pQ0ixvRLnQ0i+zVa
         Mks8FdvQQDZa/UBhV7YsUrhBglVuzINdV50NftmOBhIUoe6m+m4rIvBkOO09ndzWUzwd
         mrGu4OD3qEPnh+c+sXHvREZi0JaHf4d2NQoXzcoQnalXdguf5jtdv1GYnu3FZxk6UmY1
         8yJRKrezbXyMx2p6R5uFCQtDWrx5M+WW+bfvbWBe6dgJX6108IvEuhRUhZ7GSGC1TsSf
         jztqTxHuxCvkx1MJ6ZV1r4DcZk/Qat/D63JNwuci5H/ZrAOnx9qFEs1scKZ/j67Pmz15
         kYUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292472; x=1793897272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wsa/p8DFgC7lEBUBlf/AbqoCERuv8Vl8amjCmWqotBs=;
        b=Zsxb8QNMRF7TbZyVVzF7poTES6Uf4Mv5RAyYyFpBKODDngzB10A7xejT3tAxguFeNI
         0J7i3odSR1ZZhTqMgAGoI7M9Qafico1lRSDXvuVO1uPrri83kPCtvF/Ra5MsLyGQ8PZx
         uUzKJ93blfRoILI8X5WHty1tZFeBsDb09p6wrermm94tSC+lElC/BdYbff178ZM0hfdd
         NcV1NVNyy/Os9liOfD1sbfch5D670W4lEeWIxuVCe3hqOPboj2iWHGUEtIGAqhHI+uQT
         xHOIVSUFi5/ny/bKPcNN8Y7waCaeQgDFEuFnGsgYUtz7Zwlf1024la9jhUS2cbDs6o3X
         puXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292472; x=1793897272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsa/p8DFgC7lEBUBlf/AbqoCERuv8Vl8amjCmWqotBs=;
        b=FjcRcmiUqPvy8GTpoaSQRpl8I81EhZtqwDwEKQBgFwzUcdLFCbZUqk7ns0X7aUH4AW
         OsNcI6njX+DSrxXfiJi2vYINEzaj3RIUJ+Qff2KqcgcUcSmadCxeGFVknVWwhaPBDxoV
         W1TFKT30fow4TcmqSL3YREisV35lgo6Q/NNrGmiKDDgCSqZT/5irsz7ymMtfuJJf1I7o
         dJeasqysKyEbwUt2UKq7Ozw3ItMpn4Ynh5W3CCWYNHrSJ2E1BuwSGxeSJnPOaRyyyW+O
         i2OEDKJs+juv0BqcYnsKs5HQv7hZ07KR2gcQ6EWB25cbvyGrHd13hljaD8lRNOn+VTKu
         DKvg==
X-Forwarded-Encrypted: i=1; AKwUvBycEq05N6fn8/EbUjMbtenxGp7vkxZC7eNYBin2tZWwRWqEub6LrcoF/fDYAWJkn16qNzyvSC8kEsRp8gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAHAlQzi1lCke2db4Datb/AGfOB5O9x5FSWRtHzaTDvMEAlOcO
	m+kpvDtBRoTDcWiKT7h1OW/fPzaeTe98sFabt5zoGj/DHbj9H8NZfbGiZgYa2tHdlWFJ02vEVEm
	LlrLuVpkl8LekFtDucXsx/gRPy0eL9+Y=
X-Gm-Gg: AYBFou33gKmXjK8ipeFLnFLJcCzoMj78EAxpeRrzZgk9CVIYbUbZhT+i8/n9mJRWLlb
	c69oKU0AN1NllpwjA1z4FC6sBd5gcc+qxYZV2ULKEKD3XGDs25YVQoRyxwP1SRT1pRRHBuJlb9L
	waVAzP0tr1ZyhGCXpRTLjHR9DUkCGM4r3Eo0QOJSJ7bfa2AtXMGOirXSJVunEmXLqA7XvqMRZJW
	rMN3kKD22kerPcgiq/PECkGzOZcD1GFBf24aVKEEiAcZWll3kzmS7h2x2RY6ZXhSiQtWZfhcvPA
	GJXCr6Jmz1t7gFUpgveKSyAGsVNL+vO2XeVbqykQ08tAbdnpVJAfJWmEnE/jPap6g5UX500rDFB
	Eh+OBGavTOYm95iPYgnirSuxbJW8Jh4rryWT5o1aRgUSe8uhiLktcnvQ2BDE+xM2pYLw4
X-Received: by 2002:a05:7301:b09:b0:360:d4c5:7243 with SMTP id
 5a478bee46e88-36a2002d2cfmr7315065eec.11.1793292472441; Thu, 29 Oct 2026
 09:47:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029163516.2476127-1-hj351016@gmail.com> <179329193445.3327.7941488029152521409@kernel.org>
In-Reply-To: <179329193445.3327.7941488029152521409@kernel.org>
From: khj <hj351016@gmail.com>
Date: Fri, 30 Oct 2026 01:47:40 +0900
X-Gm-Features: AclHuK9K2vGmM-fNk5B8yoexTttxMSeGYWaivwlu1Nvp0CqoGWr9xKVGgD1Q_5U
Message-ID: <CAGr5VtPUE-gdEGDAnjuGvz1Pj1ROtKTavPYEPZFJXwtngVVEeA@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: em_ipt: reject hook values >= NF_INET_NUMHOOKS
To: netdev-bot+sinfo@kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks. The issue was found by static analysis: a small checker that flags
values read from netlink attributes (nla_get_u8/u16/u32) that are then used
as a shift count without a range check. em_ipt's TCA_EM_IPT_HOOK was flagge=
d
because it has no nla_policy bound and only the "policy" match validates th=
e
hook, while the "addrtype" match does not. I then confirmed it at runtime
with UBSAN using the reproducer described in the commit message (a basic
classifier with an em_ipt "addrtype" ematch and TCA_EM_IPT_HOOK =3D 32).

Thanks,
Hyunjung Ko

2026=EB=85=84 10=EC=9B=94 30=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 1:38, =
<netdev-bot+sinfo@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
