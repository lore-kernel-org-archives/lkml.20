Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792965703;
	b=dk369KRwzkuRnKEzChw8+RljEw3CGQ5pN24NBGRZuQOBtnj0JamOT36NsLyyVhX7l6Dc
	 wkL7813TtLys1uqgBIM2OBPtDPYYr4Zm6ovRfPZpa3P79u+iU1aOG57K1M5w05ZbZWAr5
	 mZOPwYE+9km6hUOeHp+LANUgGdrjROFoDjvr+2JIUPXq+Qb+0nMpu+34zjg7TjYWpUfTJ
	 v956WJshX7x+uOBlVFYgPGk7hZDzMowzatOLQBwQ5zFDX+2JzN57rWMHrNgvIe0OQtp/z
	 7AhMSMUebaeLg6qhoitZN3DcAo7c2ZmYydYEWB0mL/H+W5gUNTjf5ot4QEJJf8xhjlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
	b=yxC4Vs12oubj6jCd6cigaEFZa95/gTdIaCZ65sUAU7rUg5rU/raOflwRHW1QfSifHlbM
	 VGsSOvhMmpIDjJtlROqclRbKdoPU0JW0Xo3QJKutuxhturbNK8njwtyP1rIA/3Lo8Zk5c
	 VoOjQ4xYn+s8sN/1sL4R1byd+A4Fxb2o03aqPiaIRddHIUPCIu25rOn0umdvw2zEoB7GQ
	 N+l4zuIaVLE6BMQEmeR3cLIJJHZEN80cQYJNcQP776OWDMRGxd1jKEc+bDgCzl6WGNz/9
	 q5ZAaqKFlDqrIqYaYvUCU08J1ICJNv31lk0OOws9S22tIEvZsjkrnnHYF6VJGQ3Lezw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQTqNWsa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C8606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQTqNWsa
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso517708a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792965701; cv=none;
        d=google.com; s=arc-20260327;
        b=rt1r8udmWt38NNwsCT3XKyVoQEtXp03X5uB6LE5WPQk3V3ZJVeO2E69YXru6kLGOcS
         ZHQ/H4xooeO+MoEFk7JpBeQU+1DySnvmszuLzTOwvf1Fa29vz4ZbliJdTTI84hLW6YZp
         fH3jkgpXEmCXQAZlhBF2iWEf9vUMUgXxzv2y8ohA0b7TU6rODTUwCI/jromhy5JaBT7b
         SJCdDMtD7eBOrJC7rcIyOFCPa6a8UxYyDpIolnEtS4PxkSVMi3zlyXXIhUoVsU+qAZoe
         A9DmIjhTgzNA7gTPpTgbS9LoqALflJ9teL1Zrnl2cA2lAato2b7K3DAS0MlUgotK3Kyc
         DxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        fh=z6WpRLcB81QbK5JsaBDa4S5x55j1TY43gBavAsTxVf4=;
        b=Mo5vh4e97g66eTKB3mHif+aD01oXcrDm3lYOWryaxadYMcarhkHBKhqdocpuE8/erl
         SAWBrSpvSfoMgXOoZqYusvRdhDR3tihcNW+eKEB75J9/fwH7YomFwhOjHAgndVY3aCPG
         Dn0DQ3y+D4QrsNQp9tgdOWe1uQTrVd+5gfJSI5jFss+EtPoCjbtDWjZSDjAWI16U9OuS
         6c74FHxXFZ/FiUahA6A6HNrpcLtX3iDNZ+6rCvgvlHk/33yEdXR3JB31hTJ3jK09gssM
         Wfxi2dHTLRHPfsX8K+NZBJ0SytTHhH1x7XOay4vpJpp35CH75CvcpEDLZ9KbIFZMnMMT
         6i4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792965701; x=1793570501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        b=mQTqNWsaP28KlZxGFeJR0y+EVK/2CMqREV1iqCJaBvcJdV7FRgvMFnrNFcPy0bMpAE
         gaHiKNgEvBzDtWUQai4tVtr1YEXiAfmG0Ad07Tk//xDOzjCkvtEEAG2+zP1EkJZtanL8
         zEfRnqMui4CLwIZ5gqhyNuUH7utRthl/abV2YLJLIeLhyoQLtYep9z1yTfWMAthG4nXi
         Y23gcTF1MDe/yCk5HjcnLlBDJPW3y1Mbxahf8FzTAQTxz8q0QqI0iO3gk9uZ6jJkJtgc
         dw/QPZcG3tnVdkeb/L5rf+5PCGFHx0b4wJ2S6AfP7dIqWl3uH0cyK9xq9PV8In/Hwhrw
         j/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965701; x=1793570501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        b=yzpeLqWjSJK3sU/VbxNBfb91+AQzg6R3WCUxflB0B7lgwHiS3PcgcAllT0mnFw4gOr
         HCpT3K3YrYG6x6txqswOMM3rlMTWi2CXokBsTEFaz7ZmBJlbZv+inLEyhrkPrB3L9/9N
         3Hr27Zr/iI9LGOvUoqa3A8BX7LouSs9xaM0tCDNVStxY339N6Bc+RmEhj3fTSG2wNKtl
         ZrgeQjK2pjP73LTiOkGA0ovmpLmeTjpemUOB2mFHGz3iZwCTpKr3qAOjnvhCHUhWuRfc
         /eHVRuV23iAe1Oh8solemiGmoWKjYHXmAeHPW5ptZOXn7cd4sKnopo/klZlWHGd1QwkJ
         qjjA==
X-Forwarded-Encrypted: i=1; AKwUvBw64UbuIGVMRWQLr7hXuu4Wr8MB0TMfo+kIa2M7CUMXSHtENa03KL3QCXmkqcQ9PVeNdwXlhzERv4g2dSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiBJctIx1zskzPe953Esjseo7zOEoZWqRlWS4WU97LA3IVDGxO
	LDnLYt9AtySZyt6hy/QZ2iUy+pd6OG73U7vDaDZdKmGbRve0N/qcdYCV8VNkhnH8jSXoxcrYVFg
	RLlbl8giE3ukOv2129KxUxi7+dyowyjLanHZt
X-Gm-Gg: AYBFou1X7GAfRBHUixH78RKU5AmHYQqX1aYPazcbpLnjVTjuufPbU3E8cV66P4XLLL5
	E5c6WdyAioSQri3heASegSJgDOUGCKE74z/sy9q64uuFu/0t/Jyzb0levxy1k5HxrgC9jnu1I0M
	bIPW5/IAF0o7/GPDGhphMYOwq39SUcP75dyNjEtl6+79TWo02uz+ac5rjefv6C3bz076b5gQqOE
	U09zT/Nf//euspAlVaMypmSxMHFNOPmCQh+A4SafvCjglXfUnxbs3fdk2OlNJIVmuRWCVmL546y
	RLhLTOUhH5jS7N3qWYakLCsGe5B51ElKJ4xXLKOSuJJjh6vCua2FPl0xEOw+/UmU5NQGhpldeXg
	61NDtbkJhxkS54XU9GoZch2/R0YU3Uyjodz7VGmMJNGtrnSXjenxeop4X7o/DHUVgpiznV/ZZxo
	3kyQ90I9kec25laZx62sbL+VE=
X-Received: by 2002:a05:6402:56:b0:6b1:fe71:dd4f with SMTP id
 4fb4d7f45d1cf-6b443000260mr4663395a12.24.1792965700946; Sun, 25 Oct 2026
 15:01:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025074237.1050419-1-linmag7@gmail.com> <20261025095252.1749067.mattst88@gmail.com>
In-Reply-To: <20261025095252.1749067.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 25 Oct 2026 23:01:28 +0100
X-Gm-Features: AclHuK-eQojPe5lJyn33drATNBGWugIoWrGtsC9eLOJyaaSVhTFrZYxNKdFyp3M
Message-ID: <CA+=Fv5QxcYhWtp1GgtMWLSzoXLXNdFkx7LreTDsPU2abv9gPGw@mail.gmail.com>
Subject: Re: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 25, 2026 at 2:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sun, Oct 25, 2026 at 08:38:50AM +0100, Magnus Lindholm wrote:
> > GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
> > always returns zero. Keep the UAC bits when translating them to prctl
> > flags.
> >
> > This was uncovered while running the strace test suite on Alpha.
> >
> > Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> This has been broken since v3.7, so please add
>
> Cc: stable@vger.kernel.org

Will do, thanks for the review.

Magnus
