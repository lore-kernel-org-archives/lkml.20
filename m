Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636670;
	b=QO4Hi3KolARVztnWCaVu6eKk9VjeE8jod4/0MekRF43ShnBA/j3Edi6UgmUuvDCsgHzn
	 J5yU2Qbg27FwMzkqpSUrn2za/kOGuY1YfoTdt9x/RMBaiv8HoWQRkcH0dpw4flUwKXf2R
	 EbHhWsn0A8+9RVKDogQIli+5jukJ1hW1475Wc51awgEjF7XKP+kIyOsrdtpvbuwBzojt3
	 DYxQHY9uGw5vqrNMxZdoNPUG9OQQjcGbLa9JTb6s3Gq+xalf9kyIdOC4RmC5ky4ThObUN
	 2t2BlQuEkmTbWm/2X2e2i9KxXF8lew7cmsUQ3Ol8HslXwEfLTxS+x3ojDicnksFd1YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
	b=qSS4hrT58mZ0xRwIMqY4ZnwwiWte9bbqOBHLt8RRo1Cd1zcW3/UZi5c0J5KP7pE/ybuK
	 eg3BAi9yo3a3C5eldMbkpSFKZ/kxwFefTc87qbEpPENyuaiivxBIyIDnsn1RslUx3IlGA
	 P31q+a1wz2hARzez1oi1+VXvljvZLWMFOahRqVxo3FuNpZpVrakcAbAscd+CEn/sqqrhU
	 oOXOC2mYoCP5hJtTpWiOx+3hfJ3FVpUXfcNPm+E8viIkz/tY7STLtY3HTbYZpxh0mIRPU
	 r0q12szpJWakj0GmWikfayYDTc3kdYyX/iVwiHe+LLjR4ICBm8WHwxZ9gawSa3v/c7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b="Cvtx/GKU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951136083621
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951136083621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=Cvtx/GKU
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4354db11so24788011fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636666; cv=none;
        d=google.com; s=arc-20260327;
        b=ZsEUtWIxRatu2751anPQ91mJC8uo5cs+HlDZQTFT20z3k9aN7WutvQgO8Ais0RenEH
         9nEXMafstmxPs0vE16lWusS5OGIEu8GoEbzAsCLog/8TKjA6DGyvh3nCnRKsvnP1pOK/
         HWslgQ5M/Pv8Gx4wEGwqyGiv1zInbFdSeIqurlCg5UpGahJrJ+J0p2jJzK25oidPtuU3
         VD1Rou82Td40/ydnRZI0tlGSHj0CvDtq9mQqvDepXnXNZUCZP4HjHbntll0VpFm1941p
         byMZDFD36XV9tZ/T/ZlOcTsrTJpu1BJOwm5bS3KsOir7/wJRa+R7ThsAPGpqD2UeVvEz
         X4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        fh=rmoQ4IDDM8KiWf+Ggz8sIBgayGtsDcBw0+A5ia+57ls=;
        b=szRx/wY0YyJW0xjRM4PO2lbTrOmDLAzZTeC7RfS3oMyNAeuTY/vctEe0MATI6faSsk
         nYB0g4+19Km8s38dKxTf2kiJpZXgTX+FqCErwyDqW6l8ELDUDjGp+qZ7kQqv/dLCGBVO
         8t8KI4dlj0B+7h7hWfuDiHB3hfYu+6XTVf1UcayI0o7J49rXaEXP9gXgZ0GrB6J2DyR2
         Nyk5i++5R3LLtfCTU3jUlZ8A37VL7Kpz6/ZbA1HwQCVjqNGX5QAL8vPNG9zNBC2gpKyL
         N9FVHEGeCSPQEIyaiXcUogOlDjwy9VjDI6lQXWGfNWf/hdZKG8cGLz4CbLo8Mz0KevwQ
         ZboQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793636666; x=1794241466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        b=Cvtx/GKUYBKQvRH4AS3nN1MFE+pnvdKs7Nbh4c3CnDvqfKojqjb+1CQWMX9g0IHzsM
         JDqyhFLdMyxt3dAQvIoU+lOvi79wtI6ra95gmGSB405QeyskIMSdkxwEslehYMuNyAHF
         vbcR+82RL+yuPkpbz/gtyJypkrQkp096dXxMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636666; x=1794241466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        b=LmLHGQbGeUDbxfEZg1P1Dra0mxRrUaYNkh5lxyBb2+R/KR5ChoccR3CwvzlUi+K7Zs
         uE/FfgafgpxpXZu/9oW2QSonoG35jsSm26JeuV91bDn+1c4S5Pfh7xsDr8ZE0ffRarp/
         tN7kejVC3LK+ELUVDM6RoVgRqkoruidNfM+W2SWm0P8ajkY83h6xzxqHye0vxtqBzT+e
         R3V3y2B/J0mEKMaY5j3AnIQ/obYOC3VwQDUK3f5Z987gEir2f34U8UHuukZvHz1u8iV+
         DMjgCIPeMhxNYftiEiQc0ft283o1cVSvRoHLM0TQkJzkD7CYfso49TF6MH5rI2Y7/fyG
         Pokg==
X-Forwarded-Encrypted: i=1; AKwUvBwW9AW6f+lQOKyY4v0p6rL/q3YJkYcZtvvPoneXXvJJTk3iS99Y4sNSQYvCVoTje5xcvt3T7vsNHLuLGaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DH8X8GD+dfxlz3a3q3XDuJkIgd8QCkd/7ojKNZvoZWngwHqE5
	7dr09KcOu9ULDp/ySQRxIgFMqs/dIFYidyB91X+lSxlSnpLhvrMae8z9zIfeCPUr0M7AiNm7n7h
	zR5PIETJj63Y4HU/D7FwyGQ+O5Myx8HH8JZq6NhEbQ1qcAJBGSlEe9g==
X-Gm-Gg: AYBFou1Rdxwt+dd993ON6wSoD+JdyLbPGpDj5+b3pNalvtTLhpr7kIFhbEG2+IiIR+O
	CC97dKLC30cRKYNAmz9Y09FGLFJkvCkKhZyz3Dux+gBvnTG3tX8ONaOKp7I7Io3c4R0cMIHwYOr
	fHMaQOitO6Ma+i2cFRrdQLqtw5rWHy3LXgK8saUIPqDaR94cFvvD72Z0cPTaTQZ9Q7pEW/PTFQz
	Z/hA/SbTGu+Tdfpkm0wxeNHfYJnvBCxx/ComjW95J7GYVTKhKf3LlQ4czht1K24JwcqVB1nfTIB
	LJiZLAUdvHMqvKop3Pp/FVqb8awhERabvOd3alNS2Aq2bxerRqJAi4AlBFv09DZdKAmitiHVxAH
	qFjVadKFn5JUIbNJ8Y7Vj/Bel1+wDKb3oHccZFg==
X-Received: by 2002:a05:651c:248:b0:3ab:483c:9149 with SMTP id
 38308e7fff4ca-3acb7add2e7mr20838351fa.17.1793636665894; Mon, 02 Nov 2026
 08:24:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain> <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
 <auiwY5ReM-rqeG2I@stanley.mountain>
In-Reply-To: <auiwY5ReM-rqeG2I@stanley.mountain>
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 21:54:14 +0530
X-Gm-Features: AclHuK_Se87ahnZas561XVaIRSBRgo71RWDM89AU0HyMe8bpdXo8Rnq4aEXc910
Message-ID: <CAPwSj7WaNPwkrcMmyi9enkLFn4z6ihXg-VVde3CNc-Nj58j+Sw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware sample
To: Dan Carpenter <error27@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the clarification. I missed that this was a user-space
sample and not kernel code, and I apologize for the formatting mess
with Gmail and attachments. I will set up git send-email henceforth.
Thank you for your valuable time and the documentation links.

Regards,
Kurmapu Sai Devansh Prasad


On Mon, Nov 2, 2026 at 9:16=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Mon, Nov 02, 2026 at 08:49:58PM +0530, Kurmapu Sai Devansh Prasad wrot=
e:
> > ---
> > Hello  Dan, thanks for the advice. I've attached the patch this time to=
 avoid the Gmail formatting issues.
> >  I also removed the extra commentary from the commit message.
>
> This is userspace code so the original is fine.
>
> Also you can't send patches as attachments.  There is a whole process
> to sending v2 patches.
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
>
> regards,
> dan carpenter
>
