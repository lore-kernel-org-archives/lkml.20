Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553383;
	b=Th8dQFt6YXrPkovJgLLF4txE1bs7YuZ19014VmcjlvHGlHTH7va7vGR+q2COv7SvDtVe
	 x2CpoZZRCP0C7Zk14IMPRGrJXJ6uq14pLH+5ukgGHSK7ivzheXx3rp6+tJ8g8Qmlie/DP
	 9rjcxmo7zXFbqQcfV7Zgqq6t4MsYMJnKYZOMnVcjZoB+RDvs32pRulEDEOpDBQp6K3dfo
	 NsM7NqxmEC9pLPFqTVrSoufm7ydi4TF2ssripqDpT/PUVHi8JABLgqfCmQtVOKV+2dAy5
	 SL9JWotpRAqeErwQO3ouNHxMc5IVvt9QEALplmhmSR8a/bjjz6fvvkq8Hij5IomlDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
	b=0phU+u2Kfeg0rgcfRogzdUpgL+aNG6dGz9+mzmKUBGz8CQEPFNH+MRifPYcRzBkPbwO/
	 PYEm7wmDniG8oQHb+6gisgpQaBRrF+4Xxb8brY7cgUXfq0Nw86yYGhBWKxmkxYDihqWhc
	 bRgEA/csUuVDeT/76fBoOPA2OB6ENb22EPqHBnagxgcqmJrFCBwUyZbhP9q11V/8n0ic2
	 lUCTtCHE6DFZ4yzR8uR2bL+05lX15lQjKj4thwGDb0bH5dK0C5Wkbb4nYbL6TLmFHkNi6
	 30tmgwZrgWiSgpos+x5J0Qy5EEoWZmEm51YnkrCbATxFDLf4JDTCvYl4sdghDfFBnqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnUG9xVT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C746606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C746606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnUG9xVT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2514625e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794553381; x=1795158181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
        b=AnUG9xVTLdG2KCI3LTlfqZ+EW0SHNF99nSSjPoEu/sbiQEVi8DDr8uDF6zuVL8LKEA
         a1DRif7EJExOV0daUciEEPgknP12dTcHPBYHwatKcOjUIm0BjagdkdO9hGkhK/7kDWRk
         /dA3EzD2qs78u5QpShlHqnHCCNIck+YhC+Z80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553381; x=1795158181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
        b=QI01wSlL1nYfUo7O4gXDtkj1F+839Q0BZO6+K6RzbOHWep7vV7lqNlQFEx3WYo4mbZ
         ASajbQ6iZFl8ftAF+Ha+CXsxDM3scH2NmURptDeN7yZrKsUcyND+T+MlWASAsn8q+euI
         bf3alonCJrx++dG8XCGSAdbDVWvznddu43p7eK5hKfarUyf62U2ff+4bb8ZhXUsRjN8t
         XFHB4ewwLygHdMc11MaEE2tJfulXzoaxCvOxH30EPWMAcJ864Mn3/O/BkYs+xptTUn27
         8wS65MIy3IKzzC7zPQYmLdAOproFhv3zOhcRS4Jb/2PKM2G4EtSTMAQtfd2mi8lLS4LF
         jLAg==
X-Forwarded-Encrypted: i=1; AL+hErHSe1RcAKsCj4uo7MeYfp7kGVx5J2HwsL5QUM0owbYdRj5qb99iqQt8WeLubVXhpK1TLjUJNC+O/c6EwhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z83rTyOb1ZR696RdS2usnItoQsurj7brEa335CM2LvEf8sir+vf
	h+Rk9+ei98QdNe/2RQKAKDRaisgr8YTQ/oDsuQ06GhpcMjI4UZNbo9gnLicGy9mrFuJRpzvJPrt
	ek9TnMg==
X-Gm-Gg: AYBFou1MCeHbDkIVagpfrBaFdi9cAkM7t/vd0SIb21H5+boZziFlNildHt8XLJ3m+uS
	u0y9BPysTmR/aYc/SUbQtHtldv8LiGFWCRf+vSBnj2QVrN+IxN/TsKQ05kV/1T2Bzotlwygx3SQ
	C7qaC7za5enSKOUJysdqb/ItWJKMoKpb8J5T7tSGtKKm1CBCSlm4G+oA51+NFBpSiKwV4dsxe6B
	oxAxfK0hRkQ2YENG6YNss98HTk9hN67oLLGB/dsOrTQQ73WdUDzF+qXa14Dn2JGT9UdKhThmSm3
	sPpuH4c6nHGPoglHcCFuWHt1QqHalBOt++YKyzNFYN03H5TkKqBmzffapGwu5w6zBJMvUMdaXFN
	U+xoGJfSRsckUdh08Sq18CGaC8oy9gU2BnmVTlpdl6WdsSJYTzSrWvlQj9kkQ9uvkwwcRxnDggJ
	a7gFQQUrn9URLCj5Y1ohdzEXha+WMYF7R79zD2Qj0+JaXj4JTNRnuwNjoq06gsjD9G8UnoGeUYT
	qh2fNL8mRjK4n/D2XLoZSjh7ANSkJbQ/HM/0AiXcOc+YF8gPcO+6SU+B5xyhI2RcbP1rl4GgAT2
	VdAe7zofYTX6O8dWVuX4zKv6bYqOytb7wNLB1zzqjqg9h0I2xbjvOHz/AcW5IloWSjelcZrdY7b
	gVjL//PU97g==
X-Received: by 2002:a05:600c:a00d:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4bb55aa854dmr31691705e9.33.1794553381050;
        Thu, 12 Nov 2026 23:03:01 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5721eee7sm11469335e9.4.2026.11.12.23.03.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:03:00 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso5634a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:03:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF/IXEqOnjZy6OMrVmuSxCJGRSDelsgd5dYoa19SDEYVXkv0IyEKTFYw4SXxVacivwFOdHAW3errm6Jr6Y=@vger.kernel.org
X-Received: by 2002:aa7:c704:0:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b7c82e1e32mr41179a12.14.1794553379045; Thu, 12 Nov 2026
 23:02:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105070828.1992653-1-tfiga@chromium.org> <028d9a3b-8de0-4a98-b3d1-07d83143361a@kernel.org>
In-Reply-To: <028d9a3b-8de0-4a98-b3d1-07d83143361a@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 13 Nov 2026 16:02:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D4c0aBrubQFdL0Q_WsY0rnK-5kGSngQRNwh5QTEwnT_Q@mail.gmail.com>
X-Gm-Features: AclHuK_f2bS4LODsYEBXcxmWe1_Ak54T63B6HHOldzdYHUE2j129hx3qcA3QKcA
Message-ID: <CAAFQd5D4c0aBrubQFdL0Q_WsY0rnK-5kGSngQRNwh5QTEwnT_Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Tomasz from VIDEOBUF-2
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> Hi Tomasz,
>
> On 05/11/2026 08:08, Tomasz Figa wrote:
> > I've been working on other parts of the kernel for quite some time and
> > haven't had enough time to follow the development of the Media
> > Subsystem, including the videobuf2 framework.
> >
> > Please accept my apologies and let me step away from the maintainer
> > role, so that someone with more time available for it can take care.
>
> Thank you so much for all your efforts w.r.t. the vb2 framework. You made
> major contributions to it, and you'll be missed.

Thank you and everyone in the Media community as well. Hope I'll be
back some day. :)

Best,
Tomasz

>
> Best regards,
>
>         Hans
>
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..af302622c849 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29512,7 +29512,6 @@ S:    Maintained
> >  F:   drivers/media/platform/video-mux.c
> >
> >  VIDEOBUF2 FRAMEWORK
> > -M:   Tomasz Figa <tfiga@chromium.org>
> >  M:   Marek Szyprowski <m.szyprowski@samsung.com>
> >  L:   linux-media@vger.kernel.org
> >  S:   Maintained
>
