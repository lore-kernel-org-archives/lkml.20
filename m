Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDB3C0A06
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753703; cv=pass; b=Ww0y674+hG+YNIXVaM3MVC7vn7qTwclc645a+JaJQjVNZ/nF8UJGh8oItj0h6HqCP4WzrNHCrgeapOGW1l1CERbXtgobA/JVB3CfR5dyOD7fbRxmwHM0juPwZKaBBlKujl/oPjTuxnrurFQV5Z4240IRDfjnIsw7rD1YOMf8XTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753703; c=relaxed/simple;
	bh=dxycI7gyGZDLAZBpb9cvJBzlyunbEEN3dk8hL+6bedc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCjAb4lGeHst4uQDD9sKqVK54RlFb/0L8+HbEeuK85WwjhQ2M9CLb6z1UjqcUw0j7/a089jvCyutvCJdTT6lnOFdP+6IZyhm3llR8GsOhV393zoSW2sdOUq4qqSGiEsQe4WxlCz+oZUVyFmmo/sZChiKIk1iJ3FV6So4DA+6gYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOfFfqJE; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOfFfqJE"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fded6b087so4629257d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753700; cv=none;
        d=google.com; s=arc-20260327;
        b=FuIrX4InZrG0Qi/5b4Q8inm8JFITSRMonE8v8qrjF8mAhfzJFfjuyTXEEvIRZNYe0f
         UQed82lQq3CmSEq32l9IfeBO1fgiwnalQth4vJCnT19V5RV5k7PEBjkDWd62bwB54a7O
         flw/P8Koz28tX1ltNSvcJEx59Ic8SCkshFWNZdwTgOAhK6LVx1xcmqaAlN+mNw2jSIVQ
         pKvQp6QPl7wkUfsP7YYNXbk4Gxvgk1U6RVggZUnPDRuEAHmRF2w3i03v/JxTQIcl/okr
         sSo1wxMhbYNCrJSA54VLj1UikETwfeN7vK0IfAvgEIJyc/M1/tFWhZWAm60Zqiajk9Ob
         NdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        fh=Wbd4VNgoUOkpA5wLgoaHhAqVUdPILveWsodooA87Z5I=;
        b=lE3pDGr0ZwA7yT8nwCb/8HgnYObjaHKLj6DMYLkhlLlBUjlshbp9ZK683zjV4q/E6E
         ntAEKs/4ic5s/8gjTeHaR/qdUSOHMnhiuQZ1T6CdmMCFMsSmcYPElgxj9g7Aqvp4oRz6
         ruddT/u497vTmuQbZNqtnNRNaW1YMTtCJT+cZg3QMz+vcoyNJjARBKKwbYWXdVZXc9jb
         cY9ROrZ0k+kCGNqXI785Lsxk60wZpYTvklyyLGJa7hcHKHBVbSjd+sOKNITlqvBzWNHh
         M2IL1JZvKuOaeICeslMubdofprpMlbCA7D+LhBXhOtd5+xLruEa8plugdXwqjuP1QG6D
         pl4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753700; x=1791358500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=QOfFfqJE44gEacuFIuNWStyD5onsRGHGxwx7qtjYYMax58VZC/aVsh5UICjzAjvfdu
         lWgZfKq3KWTAJ9ucQIxTl/EaHBogKcJgutjZBhcDFJ47tFZIiChAyGMyQNyo0CdkMIDb
         7wZjU4kNvPBAl0gHT5dR5XRHjzgBT3I5jgvCm37YsS+PKP8+kSsUNQWEjJYaID3NYZZ0
         Y5fpf7gJ2leVJru70rl+Jluq2EYxM9VXPuOorAI1oW/ZiVndCVQNu41yHTQkoXFx5Dzx
         9S7x56btwXHdshBTATDzBJ2n6S1K+1wDc2O7lj43H/N6AFgYKMlGyP3DqLTfMnsvr7zd
         NUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753700; x=1791358500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=xtc1C3t6sIC9Vt2l95hxr7h861GUsN23rwvZW6l3NWUW54V+D/JrUoCkA+b3YKHHjl
         0kirda/MUdnI0h4UfGhrdrLXQZxLnbQ0djfAslG97yUk8ygqYoihDEkNbL62DdExG8o1
         Y4e3+DxTb+peDTFv1IF9zQrkIZZGdAJbUBup2RBx6ckipdhDDo2iG01KCKEXQ8NUKxY3
         bua8VdqLyZbyN97KZfvkyAt6Pntj73XuiDBWXa/y9HIq6Y1qW66KJy11EiXCCnQ70iLA
         HQp9C9J2oCRqB/fEtFrihN4mwmtMcq9q2avFhqPNUpp7BJEfcDcJ9gRIvQZ2mJLbUSqX
         H1WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzECBmDcVzGt8bvEEK+FHHpWcVtvnNN3ZBplPLfAl1oqHzwcQ7IPmwI2KLThDpkh1oIk/5j06eXW9M7F5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoNnWTHjRuqx30aMHwSU0tg6Gv6Z9Jh6M+EJfXcWKi2cs9PDqr
	UG+ppFa3PzIwIvOZytAesAfNqB1HLADVzAqVyLQLYn38rWJHcQOWswsQCVUSfJhuaPk5RtIa40r
	ZWmo8gi6OW5a6ZUDBVfR35fvqn5V15Yk=
X-Gm-Gg: AYBFou2md6y+CO8IrRcKhD/HfL2rJ/X2L8Iwtx0FHXUYwuFTfcxx2Mxxqv1s86LORBi
	hlNS8yFC1jW6lR98gkv5KGTNqcVqPEUXUB7Cf4YZ+AGhMkMPWsAgZXXLxWYhZwQt8zBws57dJd9
	Scg2PLK8gpx6cXNcUL4kQzk7RXPcMCqawlybUr8x/gCAnODd6N1+CQUVOvDA3Q2bUYT/C5KkHD9
	wwWSeftXLpsyoMLgXhWTKvxXwNVXMGAP2YUSgGEIExVGurun7ujyl0+852NNPr7hzltKExaJ1L2
	0JgkaGOfXhu3Nm92Y8uVlH6HdU/sByxJzD4T9dzQudPMOd/zPUbR4Ms=
X-Received: by 2002:a05:690e:400c:b0:675:7032:8062 with SMTP id
 956f58d0204a3-67683474481mr300251d50.44.1790753700150; Wed, 30 Sep 2026
 00:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 30 Sep 2026 09:34:48 +0200
X-Gm-Features: AclHuK_3trlIGgLtvQDHQQi_YWTxQaLNnpU_H3rtwKQgUONqn5KgGLq9lRZ6SJ0
Message-ID: <CABdCQ=PvdfX+ZwF1VbQR+LSh0ZwhP4T8zSb-8+Wh4Y=L67LjUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi RV2
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 29 sept 2026 a las 14:10, Jennifer Berringer
(<jberring@redhat.com>) escribi=C3=B3:
>
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
>
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board devic=
e tree")
> Tested-by: Vincent Legoll <legoll@online.fr>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
> Changes in v2:
> - Collect tags
> - Rebase onto spacemit/dt-for-next
>
> Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jbe=
rring@redhat.com/
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 0cf60d1985604..d8b2cace4e7a3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -25,7 +25,7 @@ aliases {
>         };
>
>         chosen {
> -               stdout-path =3D "serial0";
> +               stdout-path =3D "serial0:115200n8";
>         };
>
>         leds {
>
> base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
> --
> 2.55.0
>
>
