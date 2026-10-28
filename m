Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221025;
	b=z2SyspYeC+4REG4iP9ubkfTNmzSGdzCI07MsMlWNisH2ItOcS5C8diXKUR/DaxxVrrOE
	 X+VA63uEh3imotxs8p2TyTgkYR8e5PFwDdCjgZUpr7zfAC95wosLSaFYtJ1dliHjhGvKD
	 AdMdNroDb6Lxbf5wcTNtyU0B0wTF0nJreUDKIqKqzcCaKoKucgppjkTs+QPqj4yIk5bNR
	 XqAhBE6UpLiaBV2wjY1NOPDL6jnkjpMjDhWnWS/by7AnxSJy6zqmoLejkyCMJ7w0xqDof
	 EId3m4T2ccq5aXo+EXrCFuj65bmMonF5oO67Q85Io7j7/jKs1LGr3jDHdoiEEEPRmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
	b=M6bfxEKavwxueXKBe2JbIkJ9sMqopwfMORS8ncIIBROUTUISbzYpqOa4CHnDp/ahiwdV
	 LlCP11ju6OlgCeOA3Ib1fqvpcRv52ANNb5BWTSRuE3oyluDRwZjwCr+xF3qFm6139ShZ6
	 0S3TGTsQc6/PDEoNgxzPHdzk03zhPdJ5islElUUGpSHBSjT0CjQQ+PpDKmldct3OnCUh0
	 n/1Sw5tF7w/igIFlj2SgDGQC1Tp0ZnOBhlGbC1S7qTKTP7jhmPRQVdw5KAJuV+2YNv8yP
	 l9WIiJ1TQfit/0D7TBMd8qtsxQE0IVNlmXJ30eYS3CdAhi71jt8MtKD748klUVt/9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gieqk1IT;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CAC606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gieqk1IT
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a17a332ecso1981436eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221024; x=1793825824; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
        b=Gieqk1ITl0mmOTKbPJsS8Km5XhNPy/4pHSxLDepnbhSdn+pcQzY8FMVEkbRmsgn7CL
         rKYt9j0IxxhX0NgRwz1sDznqYEKlHd+3a8qxKlggP+IzWKfF2FbtSVsmtz+bdqMLZdo2
         2ERIRWuaj0YYiiYcT7LAbqOK88JgCK6ST7p0dEzfnP/KH5gT8Ec59HBGBvXbQlOAcU5h
         JQQ8BeqPv7PrbkieFXoQKZafND9MVGtjpgqW1rLMbkDGkSIHjA558gIX1dQwhgWbOOCj
         kEJAeD4daHuqaIZ4TYUyFLLoWD/M4/fp1YIcTcPJ/2Lxg1Lj7m58YHjoErZa5n/LyyiN
         tK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221024; x=1793825824;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
        b=ClzNL08ojpsEc3Ndvu68WfCPCeqHijncQMxs4mNhngYME/cgTrM62z6sBZGZu1fIHC
         /NLMpPUiBayV/uqw3eeoTdZq/VwkIF6tRh1a9RWyLtmtzVrS2iKaha0eROy+E6GekiFj
         eVdKPlaNDcx+YeWJu4VwS+Uy+oBweSLdepxBHBHLhNUP7Nr3XUqzbTpE2/iMFrpxakhH
         K4EM2r0hG0As1CFrRYIWfcYqQQaLoluC3zHnWDPohJOth/To9TK7Y98wGXgpW0BL8Ziy
         XkOx5VI5HsW8FvT6/9TEJ65nMo72sXm+qtTLzgGOEGKtbbhgZLbZv9kEUQEaeM5+nWNM
         8b+w==
X-Forwarded-Encrypted: i=1; AKwUvBzQI3KLtLFkheo3fCcIlOwV+ld4iC7Z3Ay+SwZVJHhRUYNFtOYNsL4hDHHwoMOl64LCg5I9566q2WTR6kQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT1BAi20RjWtGUJH+5rClBPzRJ/FG5KApc8vIOotqJ8kosErpr
	tZLx4ZFB+2vdavCpfdTgLOBne8pBAurHOq1Zd1y3RBUMLAk7u5zDxaNb
X-Gm-Gg: AYBFou3z8QPfauaScxAZdijbWlhTfb1nO1wCblVeILVzpbWuADKTKb+y+BxcbR/9AC3
	S9xW7yBOMEbY+YbpVu2PsAVFTKk6/+ebVymUc4mM/1Dcd9q9ADKbk7iNTpwI+9Vl2roYHqeG94/
	s+1wPMNrRXJSJveGb9ITYO2sD40Xt4pRvDO7vRV4N2iXql2VP/GMhSL8KoSh4gOS30Tffz8F9Jb
	lV5UCLEteoJOpz8Iyd0DUkQzzMZJ/wkXvu3oEn67MOqGenCUFO1NrnGEvilMQKqJQ8pTJjqp9Vc
	U+llK5Pb3HOsvuBfgQMkPvazDAYxN1EqvYBv9a0t9frzAVjX++jyTyC8riY3pY/SIm4ZCV3JxrD
	AsnGwakgwdxoF44qLHxVBTJwh8/S3KzSCy+jJYC4Kn4aezwznqFn62JDHB9vmSCRbg4ht4Rj8gS
	h/c/A20BvzZQ/Z/Wz0XtageoXmxAxjEZdc9aUlEMZc3plx29HYBZJ83oP39xSN61/JOgUne+51r
	jZn36tUjFnSUKkTkQwEDTTPnWGUNX/vPeFs5IVMI8gIUQfHnC5R1WGPxm/kEW6UWbtyfJjnzsCN
	AEPSuAu0uL6WGajefizdBBLqo2p17bpGNCw=
X-Received: by 2002:a05:7300:d508:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a2014adcfmr7152319eec.14.1793221024030;
        Wed, 28 Oct 2026 13:57:04 -0700 (PDT)
Received: from localhost ([103.89.26.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908542sm9812986eec.10.2026.10.28.13.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:57:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 02:56:58 +0600
Message-Id: <DMGRSRF4BEVC.7QZ92MFDOJ82@gmail.com>
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, "Luka Gejak"
 <luka.gejak@linux.dev>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is
 full
From: "Imtiyaz Parvez" <reza1234khan1234@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, "Shagor Khan"
 <reza1234khan1234@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019165103.5990-1-dennylin0707@gmail.com>
 <9bde49a2e7794e4fb6bc3ae104eef87e@realtek.com>
 <334c6e785a5d242c6f168d57d042d63b777a242a@linux.dev>
 <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
 <CAGEkeHevidTtTNj-qfy6kE_O0wRvqT=F=sG+Hy83BOkRjCUqeA@mail.gmail.com>
 <CANQ=N_C3+gpQ3O=SXYpRCGTh_MC1y4TEfnxF90SWgUVF_wYPUA@mail.gmail.com>
 <CAGEkeHdT1-WwJnF1wTkrrRQRzrEYESOoDeAYE+fiV0gROG+6sw@mail.gmail.com>
 <CAGEkeHf0CLjxhGySt2axf8gXMrCcn=cEHbe1aXRW4FgcbxjyZQ@mail.gmail.com>
In-Reply-To: <CAGEkeHf0CLjxhGySt2axf8gXMrCcn=cEHbe1aXRW4FgcbxjyZQ@mail.gmail.com>

Hi Hungyu,

> Have you had a chance to test this patch?

Yes, sorry for the delay. I tested it on my laptop.

Hardware: RTL8822CE 802.11ac | kernel version: 7.2.11-arch1-1

I built only the rtw88 modules from the v7.2.11 source
tree with this patch applied, and loaded them.

I used it for around 2 hours with normal browsing, suspend/resume and
reconnecting. No new warnings or errors in dmesg.

Tested-by: Imtiyaz Parvez <reza1234khan1234@gmail.com>

Thanks,
Imtiyaz

