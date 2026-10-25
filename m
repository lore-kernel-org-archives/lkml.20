Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792908047;
	b=tpRI+CsV8kU+W7V33hf88gpKQfotXem+VV6et/Xfv8lPVHwCmGQTxXO0pBQ/wbJZkFmb
	 i2HuOWJOS5olR6RNd8UdX1EMVVg/8KH5hdefUg0V6deiRuiZgDfIwwGz0VTw5ZH3CR7lg
	 J43XdoIdvuXtJP0ph1pPQxMVls22cf3InmXRBqgVC6Q73ljmKEm+0Iy1RHhwVHtZooj9T
	 Ks9/wwZNJJc1eCMCS3fGXJ7rNewlSXUd5/0gx3nj3/tDcv2UoRFLJCaEknDiHKcRoAIvd
	 qNiCqJGo/ITo4CWLsLbZdhjKuoP21w9nutHSCFFIor3C2XhKgrcl0hjrIp0SzItzd6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
	b=yXdou3hEOlUPdpnh77bc9KSxKXXyPMG/3c2/l9aCPnIKtQ71R+C6BnefWu6dRn4t/y+A
	 qm9AAOoLA7/zSXM+FalQgDMTydmtfeoPnW9ZpzvWcODK5tgQCKhv0Il2vDHL/0gWWYLzZ
	 sMmRJQxtGaSVE8ctln/EmJCmtrugK97oATCTgwUr4jMsjH9rLnBhSn1a2mbvAimJ0OTVR
	 q1ITjsw5YgbKCdLT2K7yn7lGCLK6Ju6ojgdhhhUgodliiNhRP22gEAS40SFBYPEVcFsaa
	 ttmYc5dJl2vKVeo5z7LJweYIRqIim4I/VFEvvug58Q5Q9NigrVGWB7DWbALT1ij0ocA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aBDJCHJr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5F3606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aBDJCHJr
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1193396241.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792908046; cv=none;
        d=google.com; s=arc-20260327;
        b=MF+9vCdVwmkXURFN1LvNdY87GCLiYgcpneotTOtrdEyzaSEjWhsGsH7yWKkneio6sK
         ahCb1my4/p/fd6BLAAk3QJ3T7L6j4xYTqK7o9122gWWFuRuJS+mSSPrc6dXu8obLCwG7
         vFwUwXVpT/tux6RHCHVdfaDvKeFl6BadpB6cIrk2asV2UmB2wYPoQJMeNoRag2/biKYt
         9s2C3OMTtAI9jrpBqEjITgRL+izx8xG8pAp/9UhC1rImUtuyFUG8y+8yvRdN7ZCoYxKa
         7WAh+blPkTg66Kj8Vk4JcFNpDBHGcb6gPf/5uvl7w6lNirIlkYwsAUIZxM8pXSxYFSeo
         pGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        fh=6zfMBAfCDjJdnlSw9iAj9WMvm0htzufhW2A6mQoVU7w=;
        b=FwAFWHLUJ0o/NEdT8KZWmnDoATkgDeksK0Jjni7Krnz/umEr6db76dO7oI17GSgjQ5
         5N1Z0Q0Stw3xyUkt1sqUQTq8RjZBOMEHMwyp8GCuTuNNNrD84t1O2XhHfYjj9Dt5B2pR
         V/WRCjUq/yz3fHKeAqjhbaavztU+6bLSqCPyIVVY7H4WiWnp2sMmaCuyduzHH/BBu3jN
         4DpyNzg2YSt43h5qhrDi/4dX8APhH7gsudfNzecTGulU/yj5iXNK/9SWq8m2qL8+7Miw
         +LDHXDHDaymoXFwJ7oq99OENIuG9eh+FubMLykZHqTmBH51IPO5/vAgetj9RtxzQIcFP
         p0Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792908046; x=1793512846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        b=aBDJCHJr3gs5UqlwO4qkm5b+/q3qddgt24G0l+wj+ZVgzOa6uo+WBuTjtx3y2qiGal
         DnDcHliM2p8YUOMeep0mD0M1cc4Ke5wMGUnjdYG206YZMew4k6DsPtzuofGfcjGK7EZ8
         I2ILArKvpvwhFfW8J2NO17Cj9vOcYcKXRkuCy8CI0zIZJcvnYT2J5bifp6+W9u+pu8Zq
         JtXl3LBTHpQrAkrRhvNH9s+j5WVnhQMPv22OK+QrfbEfV8zy3p7BCTsAXEhoWLRMWm7p
         c6uVGhTXFDUmYjHZajWiDelmLoly6gz/zz/8PdANaUj2iPlaprdwX7bpfPSlSMr3TPcj
         MfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792908046; x=1793512846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        b=zXn4zMe7UGJ8zLm1792PyO/Rxb+2VXAEjlceZl7HdgVvcMClMbp4pKcq/m4y8nu97v
         fOiiAlRAp5cG+fbNBZvTJf1VZbtbTxO4Oi1QVdYvdGkne6KULgEMkG1tUvNdveT0IIS7
         9lKOlk4SX/A5SQyVnVO6bzaNSnCiGfaZk2pReVaPWiiByvLoVzVXHOvuUorcyL/lSIFn
         Mf/NpMNO8m37hEcQjOZGK4S/64BlqQeTl7a70ekbVAwi0izwRIOk9SdUH8doFjD6OktS
         lxwmIRUOklLH8VFjg/a1haVCKB5dDBBS+U77lZa0M9Tro/vsNltzI+FRt+VzmW2VMd0o
         r37w==
X-Forwarded-Encrypted: i=1; AKwUvByRJ9z8ymL+jjIycdzhio5Bnb27Jyc1NMXYNvNds9qxlNnEthaPux0rB3nPnD+nhXKZ+ceKXNPobQB/xGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+9OsxZMcg54uiG4PY1VxmU8P/dAme5xpdByuJUPukb3vsTw1J
	7T1BzKfkeEw2G/FP+NeukweC4Lk7ZkKxvAS9Rh7F3RnehB2hxlP31+LOIstKHcYn8lI53ZTYUyj
	9zFreKpI1pMLuUQtivCbMtPJw5pHko8mQnqfV2NFkMQ==
X-Gm-Gg: AYBFou3QhIK8llq8xB0sUROjiMh4Og3FUoXPay68v4/6Cwfvhn5qw/Uvp3xirjltyfW
	5EVqaJKTOdPR0FSsWbwodmkzo/OnSt0ATR4t8/AS8ZzTDZ8jJM7ocrCHX7+QrkAUFd04vA5GJ2Y
	zE5zviErH5GPMLpowivJwPIHvjEUbK+4Ty8dVmSTiWwbuSbDF6KzdshRup9Az/qnq3A+czrqPP1
	AVprST2giilWjmXoJB9jbetXg0pH2eJKo7fWXJfZbMN6CFbFvJg+ewN88M1S90TVN56f2BAqR50
	hrIJAFY3n7HPH+S8R76nfgLYrIA6QiQei0XjneQ5hCeCETo3yZ8jPJOs03RfSpTeTti3Htp2ZPW
	2pQtenLcxB+1vjlfxQhYgA8HnH87H82wsVtE=
X-Received: by 2002:a05:6102:3fa7:b0:7c3:3f26:8785 with SMTP id
 ada2fe7eead31-7ce5cc37c83mr1116161137.7.1792908046029; Sat, 24 Oct 2026
 23:00:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025052136.389541-1-dev.adityanagar@gmail.com> <2026102519-polymer-gorged-bc90@gregkh>
In-Reply-To: <2026102519-polymer-gorged-bc90@gregkh>
From: Aditya Nagar <dev.adityanagar@gmail.com>
Date: Sun, 25 Oct 2026 11:30:34 +0530
X-Gm-Features: AclHuK_TcOcKb9WAKxu1FqX-QDlLrI_sal7kxnj4OmX_2Ibk9PcCncKk3AAFZfw
Message-ID: <CAHLX7j6Ue5gVxc+bLZS5kphO39bs=Jf55Pc4nEyN-aiqtnmndQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unused argument from FBTFT_SPI_DRIVER()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-staging@lists.linux.dev, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the explanation, understood the message and I apologise.

Thanks,
Aditya

On Sun, Oct 25, 2026 at 11:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 25, 2026 at 10:51:36AM +0530, Aditya Nagar wrote:
> > The _compatible argument of FBTFT_SPI_DRIVER() is never used in the
> > macro body. The device tree match table is created separately by
> > FBTFT_DT_TABLE() in both callers, FBTFT_REGISTER_DRIVER() and
> > FBTFT_REGISTER_SPI_DRIVER().
> >
> > Drop the argument and update both callers. No functional change.
> >
> > The argument has been unused since the macro was introduced in commit
> > c222ea5d2f33 ("staging: fbtft: Deduplicate driver registration macros")=
.
> >
> > Found with checkpatch.pl (MACRO_ARG_UNUSED). The change was prepared
> > with the help of an AI coding assistant (Claude); I reviewed it and
> > build-tested all fbtft drivers with W=3D1.
> >
> > Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
>
> Sorry, but please read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
