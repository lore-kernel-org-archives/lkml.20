Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223842;
	b=m1jJQoHrB9R9SU3wFPGFwzH+0WiHsurVjZOSub1hy4T8r2eDbvHCnJp+5R7bST5FyDqu
	 nGGuk58VrABhRrvYcD3xsDOPTVgK8fvd3IPI7NBM1yhxepfCWioI2wBZozojHBTOyZkbA
	 IDI7lzjHURVLPhnmuIR5nAUcPDTQcf6JWC9O9I6g30r/EK0aqUVH5mjhnJpXMu2Rdxblb
	 VkfChABNfbE6KtTEy4rhV97pRkfAgvde7qIcQifDuGxZKQ7/hIEQFByZzoY4wrNAYTM1P
	 ThikmuBGQIRAgn5+mRpYC7cF4fb0YHo2SSq70gkLlgh502lDmuoekbX7DMLiy3DFbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223842;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=75mp9zfOiQdzPd/pZTfE9rnp4feuOSyWnL8j0FSv1Hk=;
	b=V8S3j95uiFuAZDaY73P+Z1O81CVBOQVxpVzNFkAArHxUwMOu9GQjmWXBPXkOM9ie4XAJ
	 b3mG/+I9sh3RMlJmvKkAe1Z6AMLbfxLTLaSIbAN+zwhactGi+cOyKNmG2TJpCAC/SHLhD
	 X8WRDTetXTIlU4KLBwHa1kP/ENJZn7obcTtUScgag7hpYcsbkYRpEQscyHBJJ+ASMqqfN
	 YU5w7hkqpfhwNDJ1X2TJ6vnxllCH14M9fE76+oyToH5/BBtYNKooUSjnwOh8ONwbogtzK
	 VU2PJObIGXsYMK1v/WNRF4hAAUzLJVoJzp1LA4YvgEWsWmNbs0Sdnfiv8m6n4PR40Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7L28ldM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BA606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7L28ldM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225751F01828
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793223842;
	bh=75mp9zfOiQdzPd/pZTfE9rnp4feuOSyWnL8j0FSv1Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m7L28ldMVJG0SOofXWBXl1mYdhTrpZFD+XCin/EAjQDKodlrDw4gqa1ZXKJ6aWkoK
	 hyQaGvqChEtQgCcFB3tsf7ZKgcV1r5uBx2fDT8P2O9uA0qLyIZK8u71o3VmSOeVuBJ
	 dNGVudG5dm4SO4+AMAjEQA34c/cV1N6OqYafN5un+qVozZ753Z/4KB3VLr4lHH2vL2
	 3hRlt7+lZD2pezqZpKNigqB5jtzQaSAZO8lePQrSB9ox3zbv/tA4hHoMQdhfoNk0ee
	 /U0CcIcdNDylHFU5Y4PAP2ehoXZTnH+7Dd6GCFg7La9BumE4CZR8FPYF+7DHu13anP
	 9u1oNcj6YMqkw==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b8306b9f8so20937416d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUyfbsRU4Uwzhb4X4UITA9D6Z/2VkSmrHseIAX+Zzc/mkz6qHKglBQg93/I1yfxRw7f5hoWZr25fADWjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqGDy2qY9p7vLyzIafKIe4C/8BK6lgFM3arIpsCSAv1LngjtwN
	4tccJbdxPWv/RjufN0R1XD0kiSdR1Vmp1c0BKYpoXFOs58Q9bio9T0u7H/ZBLr7kmJFf4jsmxCU
	Wa5RkTtlyxr1ywktlENCZ6pDHeExa7sA=
X-Received: by 2002:a05:620a:459f:b0:93e:5060:f929 with SMTP id
 af79cd13be357-94408cf36e2mr560100685a.19.1793223841403; Wed, 28 Oct 2026
 14:44:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017002441.716615-1-song@kernel.org> <20261017002441.716615-2-song@kernel.org>
 <at_1V3XcGM_D1bY1@jpoimboe>
In-Reply-To: <at_1V3XcGM_D1bY1@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Wed, 28 Oct 2026 14:43:50 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7EqPazLJmRDoB4RUyA6FgB2Ki_oZDzW1KXdMhm+114Rw@mail.gmail.com>
X-Gm-Features: AclHuK-GjaP7ao4nI71C2Y8yIDK34mvBUk0VSFTRP4lxAJhnYpv80j_vMXIPBKQ
Message-ID: <CAPhsuW7EqPazLJmRDoB4RUyA6FgB2Ki_oZDzW1KXdMhm+114Rw@mail.gmail.com>
Subject: Re: [PATCH 01/11] klp-build: Fix dependent patches in a series
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

Thanks for the thorough review!

All these comments make sense. I will send v2 soon.

Song

On Mon, Oct 26, 2026 at 6:43=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Fri, Oct 16, 2026 at 05:24:31PM -0700, Song Liu wrote:
> > fix_patches() refreshes each patch on its own against the original
> > source: it applies the patch, copies the patched files, and reverts it.
