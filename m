Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728666;
	b=bGaEM8ORaaC+cWdXMgHI6QjcYbEZRLFjoChfAbETKNXu6Xqr5wnyW1tIUx1oV2SjebsZ
	 L/Vhpa5nhtNWAQ4TxoIWs46P1qwGmJu9+hyQ8zA5UfVkYtvIg8dGMwF9hC6GR47uA58mv
	 BZNA1Zupu7Kr3VeViZCkv+clT9cwAzVNa22eveDwjYsBELDsVhxhZ9aZiQlCH6Cx0N1Sk
	 Mpto5KGasugNXR12Tr+V6T17l28OGSN7VOYTvlSNDqN15H06gPpejPMugYpb+yyIKKypj
	 R1ec4FnGp7Z0PE2JBN0LZ5Xc8z5pKnE4ZR9/wH96dPdeHqv4338kB1nzfwkJo/P/GvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
	b=haSXzYDEbkmd9F3RWJC59/Tt19ngSJWmt/yxssH1xCAjsp3iHUN7pvAi/2CrFVDYc9e4
	 gWw1DBtJ4o5kqNlx5Rl8POR+xSZjcTIsiG4yiv3jJ6NFZ2cjyMtrxiQHwlTaktAfHORAS
	 hp3cMEHtd26cDUbz7MU/rRxOI4F1bFiHjbW6jZhTjtxM6iMRLwu2/AiRTlOfPrGE0O/yH
	 REhkpF7vjiOFW+lHv3laPIGcyT808tW0K/vA1I8pKFNEpibz4XLk34mK22RiGmHh0VikP
	 3mg9yqpUCeco7mQUZzLxgyww+CKYPUebHTLj5uOCAb0/PhA1Cf8RvV6Z3fFZJDTSZxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mNNpBSfW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C75606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C75606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mNNpBSfW
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728664; cv=none;
        d=google.com; s=arc-20260327;
        b=NYt0rCLbh0UashPX38XX4FKDMIuvUicS4h4HZQP2ETD2hT9DlUwRT5tim7NalbF3QO
         In1O3BwNqD8HumugqSkj/GQVhQWNqaeBYwDh9s2z5fKMAh65vqDHzvsfHaGv9uCfLGY/
         fia20RJZNt1LdqhM9d6Ac1uS9fCdAAKS9RsuEGwtQjsNEyK3QOMuNrips4b2qteA9vKD
         UHh6SkIsSY9Vh4X+BDEYxpbZa+3Mkcjbpn8LJqtkV05EuuSu6TmIkgoZoHsjk3buQttb
         rNzygXwpDSsfy5y3VPMCshUYX1PUppZZ5qV+C7sqwymsMGBUhSjR7OkoDC5i38l+Jq1f
         kK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        fh=gQ9SdS9qY6iQPRD8MH3MSDU5zVySwR2MnqTsSm4aZmE=;
        b=VA6tJH7EQOK9t4oKazXwZmPr1Z9kHiXOFQdk7mjbW1x0fCFr3gyRSURvzbg2ZoUIqC
         VMy2M4Lh0BR7Us/nj6NLvzuQ1kulyUKv0R+yC07Opjfa68mNr3yOxy49dn3ptWFvab2T
         kySlaJ/oYpDp3WhHNjTKgDCmkLaWDzo6XfHFfZRyN0H+fikjCag2kJ+RJGZK06KRziUo
         UgAck/bXWKc188L2AJBw9YmMSyipiGnvQAzuC6GcFMCFB5QB3XFeKiobtGkUS4ojmsq2
         oesGXAKica7tHTJAaVpaXhf707NK9BEaO5g5+enmFNbRznACcs8GunVWK6Yf97VKsgBo
         wcXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728664; x=1794333464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        b=mNNpBSfW7U3oHqA/ynhmqeNxcf7VD5INJCcvqium3opsSQ6PpJHHG0HuQo6RrCGPRQ
         eOPXJN/3o/36RWKzCXa+DvnnzN0JteLWM44hbndWrNgNK+8Dq2ekmEEUoiS3qqWHRVBU
         AFM/SqwmHpALS8gQ108CebFr4blxw6ZjKVgDjh2F5bIvOshH0xMna3G15UGZYtJTpHE5
         c7eRZYr6+KDC6Te+/Bl1ijRdhQnNTBvF5JrK2tYBOaQELzEVRqyyEu8DRbT4mFfzFnh7
         IoyCQiGSL/6f/q/Eou0a7spJplQi+5xYxnh26wXm7ZE6QGeZWNE0btafYvSNrmOsadut
         0hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728664; x=1794333464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        b=QH+KCpARRz/vz2igtk99ea21HjhCEDc8l/vc2wLoqk+DGJebdj06PSJd9j2rR6bqzI
         V+eZWgFuKky2SjbhHRHivDMwh1WmFb8kt7NAjqad7BbZ8JTYVdwp3H7nNNB9ERus55y9
         ftNXI4urPrk8eI1Ne/jkV5XXTV2s6JwCZA2Bf4alK0XzMQbaN4v3MZbqhFM4VUQJpp3V
         iYnj2neSHPJ/e0lJMhjklAdbfIJ+foqAIHyI9ZJa0ruWzQHlN999YiAtI0vDicc3JYC/
         gNTLBA2jTCimSvEH8o+I3I6ZD6n1oVHi8aBA7RvQuXjgke6HigzHxETLfQ7s6h3+xSRz
         CD4A==
X-Forwarded-Encrypted: i=1; AKwUvBwHNJVnVaov8IpIYIjGJ62WKqxBn/l52G2ZIi3POCqwWlBwtg1gn0Wu5KDFxP8lz3YZ3cNW/RLUuFP1A5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SmJdl8Ejw7PIYrvwZHrr0JIuL2WQ+RyD3d5qAuiWc7QKdtsVw
	mpo7r0/QJqWoZbduKBgPbGo2dr+1lJmFA2KrwTh5DRayM8Zcop+bt0Q/TnvSaOygIBQI4eOXUqj
	RNJVK7bcXfDCHyyMSeLHAw3MMtqGs8uVd+ewnIWgM
X-Gm-Gg: AYBFou2/STMJjGn2zoe5YpOyUtoZxOw0JTFUk5GCQd9tGnXmANIxmvnnWKPmDpO7AY0
	JDf/BH7Xpa3eHCrVDTgfRSlXFMt/n+12m2FPzrPAK+sNjn6nfiNTDpAXEbdfJGDydvBAneK/aeg
	zDna0oeVnBKGR5MPVmMbkTyk/PH2+cLbtAZm5fkH5UIJ7YQ1bCLOCuPRD/TNlm/b9H1q7MP3c7Z
	TymsIj+CspzRGjys5WpRs9QWkMQ+FGkvBX/I7HKIdM0ba3SRDJW8lciZVBSfcghMUeWjHyYajxu
	FFlTH8Ymo0IYKygyN6T1vRYFdFBhZWmD+cut9F8yu9EvhARmNa2w/TEbUhFjpznkOeMLg0Dbmrm
	AGRYS/nJ6oP739rTgQbB3VwJCk2L9ZNBZbKcRXWjsZDZDHdVdWRLnDvMT2Ln16njFCA+75WuHCq
	lojQ4fUxP6RD7z1mxjb0wv
X-Received: by 2002:a7b:ce01:0:b0:4a1:d75a:8b4 with SMTP id
 5b1f17b1804b1-4b2e3c650b1mr815155e9.12.1793728663404; Tue, 03 Nov 2026
 09:57:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102234813.1069156-1-wvw@google.com> <8f1ccb65-e4a2-450b-944c-9883ff12bc37@sirena.org.uk>
In-Reply-To: <8f1ccb65-e4a2-450b-944c-9883ff12bc37@sirena.org.uk>
From: Wei Wang <wvw@google.com>
Date: Tue, 3 Nov 2026 09:57:31 -0800
X-Gm-Features: AclHuK8vz5vkqxj17UdSeFCslNabswTrlQCvg-mwh5UYxKg3Wjf31NJ5q0jNNus
Message-ID: <CAGXk5yr4LqdguVMBeXP=pkraY7rbQWMePWs0Dq4tbGE-dCLe=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	wei.vince.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:56=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
>
> > On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread state:
> > the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kernel
> > context-switches it eagerly in tls_thread_switch(). While a task is
> > running, the live register is the only copy of its value.
>
> Thanks for catching this:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
>

Thanks!

> but I think we're missing some other registers, I made the same mistake
> for GCS with GCSPR_EL0 and GCSCRE0_EL1 and I'm not seeing where POR_EL0
> is handled either but possibly it's somewhere I didn't spot.  I can look
> into those incrementally once this gets applied (or if you do a v2 and
> roll them in that'd also be great!).

I think you're right. As far as I can see, these are only switched in
process.c and nothing touches them
in the suspend path. Unfortunately the hardware I am testing doesn't
implement GCS or POE per cpuinfo,
so I couldn't test changes there. I'd rather keep this one minimal for
stable and leave those as a follow-up.
