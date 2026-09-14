Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF43A9014
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421709; cv=pass; b=p4zrxwFL7iETX4z7+LuGTsQmDI9PnzOG2KQqQ7n4VGcQHLa+DSfNHL/ZKFinLR4b6p1RCKsGo49xNEJMZvuVgxNYu/H5FRtt8x4XQpfpywNYBWfMr3Cw9KNfPfG1/Bb0Tsl2cuyyilBfFhdZl46APBnJ+GKmSl2raP/Gzaa3kJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421709; c=relaxed/simple;
	bh=nD7LUp1TGjJhbOe9RG6LS0btJNgYnVlQKhEwxYeyMdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7KXWeOmoyMae+h1dyrq7MY23HhxhKMXv5pgrucyv3ogb3eqa+0w0q4Fp/jwhPr98NyEuVFCRzuhyXQLuB8GCyt6pqSNlAl3hZl/pia4UZJJR0RsG2nrEWc1lonTrq9uW9pRZUoShK1eD558PoBn9q14eI8VBTUlA8c13sEQxcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mfD9xvzy; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mfD9xvzy"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so412a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789421706; cv=none;
        d=google.com; s=arc-20260327;
        b=lDhvrfLALaELjK8FkP+7ZXlx09syKTVllFIiFCNFshSdE1wR/FlhiSbzS5qLlGfQQp
         CfGlNL/WBKLF6VvBRvJaV1kimHl1c1NFEaVR7EF3NoMqssv2aAdAhXbP7CXN3gfh5Tlm
         /TmA7G2GA1bf5V7QQ9UNdXBwZDRWckYaOpEtjbkAqInC1DHpm/37eyxVYRyNkGpZf5H4
         dBoU6hg6vl63YvTXenYr5+FVXvIWpmLlIVjG/RnpR3S9XJkbFppaLRAtQGInyNBD21+S
         5bU9QMMjlZGYAK1g8WqTVZF3s3AmL67okJu2QaOgV1fxbsboqt9Sq53/0B1Ftg4YDpR5
         uEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        fh=e3oi8m257Nn4ACAOlQavI/hkoSWSQGzwRiX0gh//d4A=;
        b=Rw0bsgXcJAlAhAORF2W7YOVIw3GmeYUREcZcQ6T03Ovs77mmHi9QmZTppqCZMmmtCw
         DH4kFWzeS6e+LIgWJpSetIPekhwycRNdODx8DZMNMrH8jeEntlHdjXd200oNHXbl7AZT
         21FTjzvsXFv3z9uvLhzZcTreLjHuOlyHPKTvSvgHoZkv8+fFvHTcRSYhWIRQtfKRTh8a
         wFof9nKBYAl60NRX+hpDMp+N9i5dKg99Mz59Q82GUfXhnpp9Yx4smyyJqPS5zEByLyCA
         c/r8DhZlvFRls97/8ldy6rrmonkQPCGOFf7uWfYdNGyv+7STRDB7WpbhWzVVLfFpwNPO
         OrcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789421706; x=1790026506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        b=mfD9xvzyWJGAPeq+d9eQYU+2z2VTXEuL0D0i6SsclMnFbpex0Vt7qTMC6F9qgeGDYD
         dZbcUKnNRezlqh8MsvgSeqjVus/74loRon24EC4i1pq4GLqsljGK9bOdT+yS5O9PY83t
         3PfXQNQ0QvalKofpIBhIi3BGDiYApF100nOigLlt9L6P5qNeD1deVSfU88AZ0bAO/uIk
         T1coE91kDijzV+eszTYGqzTnkFmE4tbB57U2q5xxqyhxBZ8I2Bje+qerphnSAxriwNkz
         A/P6OJrKiXa6J/HnhcLQvjM21Ml5BS9s2OZBgad3C6LKIt1VzEqzWeoZXAk3c5by65M6
         IoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789421706; x=1790026506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        b=c8vLqVNEXZaivygYXLl0tAO6o397F/WXYrwQ0M15CWh6J1AL+6TvSyjiCCw/5IpnRW
         7RnfUWkf8+FlEwUcbb/AQzzSuIsuVkmxMSZubXW2QaeytdYkDvzsKUqTpUV/AtzdrAYo
         gxuQaTxL2EuEL7BV45YX4FMcpSPeQn7U09ZM+qMqeu7++qZrYIC3WSNVeUHPUb0XvB+m
         Y2d8sCETGJd9vpMj8xYYFxTFWGAmjFOIRhmqQB8Mb9BWJq1jWSw6aoD5YHh4e97cTOcF
         C5mlvmpxBbobXFp2w+W4HADbHZNAi2nNTS9gAdsdtl2ogMgRVaXOgjooNpTE7Y4iEtIF
         0nSw==
X-Forwarded-Encrypted: i=1; AKwUvBw5CZ1xfixknujKSrzGTxYSDj/BOsTcdnme1ONXLGvOH6CMHunZHCivgswF4jlSQd/PMctzRDCGYmLH1hE=@vger.kernel.org
X-Gm-Message-State: AFuF++kERnBlLRVxt2PWxnocok5enYovu6J1MBjGKMg532XNQrGLshOy
	tyjqHVe3g5IsO58aI+wGHKCcSdw0yjK230qo0xcBieXsHer/6nJ5AZH2zqpmPxBCYUpaF2lYJR5
	FCsFt5+C4Y5EUKpQgvry/gUcdfMPZcRKSAbTQ6veA8mx1wYzpA288GuAG
X-Gm-Gg: AYBFou1o7aWEDxIV7qGPYBtb/kB9vKIDHMZMCUeoWWYx0rvcSRCdCsSDPoFpBXzFk8u
	tt94o46a7Vlh5GDQT3ioqIi6ZXfqRm4xKT2CuoZvQbJY2h/qenKapQNBaki4A6eb2bgoL9+h7mH
	Irh4dkzPIckpA9ZZ7U5OcsI9XZR9ip2J4a85bb5EL0MCnEoSGw2pCw6amszR4cHYsO7xoDuGoHk
	47bRKcFwekFAerSUi7qZAgE0l1RuD09+vXFYI2hnBio8PSjfAVU6EzQXeF2m0X13COV+he90Bog
	mZTLaqS3hMyG/kbVOL+GLoPQneCMNMWWvCTSV6FqkOiGOxypMg2p2ELDK9pHVepHNw==
X-Received: by 2002:a05:6402:a6ca:10b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aa0435f63fmr15092a12.4.1789421705458; Mon, 14 Sep 2026
 14:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <f991a17dc1833f94bd6b01a777ddbde1c934933b.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <f991a17dc1833f94bd6b01a777ddbde1c934933b.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 14:34:53 -0700
X-Gm-Features: AcwNN1W8DpIFYqNLRxuWVsKDVFF3RdiLezPbxp2u-Etse3aKt2NiEhNr2J6UFOk
Message-ID: <CALMp9eQ4Kg=50BhBZHAQVa8BMsqcB7U3OGrUYqfZWxeqqFM5sQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> Preserve the bytes used by the emulator when synthesizing a data #NPF.
> Reuse the fetch cache only when the fault is the current emulator
> exception, identified by fault =3D=3D &ctxt->exception.
>
> Add an emulator accessor to copy cached instruction bytes, checking
> the RIP and cache bounds.  These checks alone do not establish that
> the cache belongs to the current emulation.
>
> Write the cached bytes directly to VMCB02 and fetch any missing tail
> through the instruction-fetch helper.  If the tail cannot be read,
> report only the bytes already available.  For SEV guests, retain only
> the cached bytes because KVM cannot fetch plaintext guest instructions.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@gmail.com>
