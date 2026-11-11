Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374896;
	b=Z66MUnwnWvRVWwZVrlQnvebKYxyrmCsPVq6n7Pdxi7Ekw9xXcxn8+A3z6d6tQdevwQ6+
	 5u33Hpl2JdKaUw2v0ZbrkPARa/SgiUKDb0tqTzBlsZr1bEdFbQF/ydDtgQlQJwnvnObFa
	 iG4VaZSmHGX2m4+KCGRmuUCRK/i8EXLuiXfYjm3PfpZ1IwXmPTgubhEn6gngN6oqcQAt9
	 hUISWmFFNnT3bOb3fXTI0ytv3Er1gR3x7Siq8YGxh3wTaOPoaT79K94mbuVXf5KK+HvJG
	 H/ija3ZyuJKWUiWkw4yRjf63gDO4rnfUVVSEMbYwt2AA76tyPRHcJFvutfvWP4yyvsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
	b=PJgXIZ876Z+j9A6UJzsIJ0On6vatxIYDE0BCATK+xzy7FbZOlGdkKKw8uUNK6H2/ZfZT
	 ZSvGLEXOJLuZm8M8ToCQtBPq+c0rSaUBQ+CZDnz4lf+/egm5UeCHmiIRy1Fq8dFNdAOg/
	 /57dFvSp3Qq6foutnXZ3vf0YufJYzVXDjhrlVD5cVia6kXwngoRstRGigbnrb00R5d2+h
	 IlcEUZEDGFoyvgu8SvSuZReZXqyQj861KPccFlKlPWn5EGsRT77wzKPRaRM+24CpRLilu
	 D7ibRP24vanxn7pHXr9eLPMLsVxvqCakEFnd14vyNDpDjtPBD+jfEb1xgkoO0KzTZWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb5TcgoC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb5TcgoC
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso22657161fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794374894; cv=none;
        d=google.com; s=arc-20260327;
        b=c4Ze6tJWOqsN8BKfeLXihOc8T1zi6smOohNyYnSBk0Hc5+J3yD10K1Q29sFmjzRooa
         78xuZEKG15LwYz34nF0k154ET+PcbiCOCnfKmqT2g0mIN2JQ0ncf49aVjxOuI5M/pIRV
         cmTALmvknyDDUnqG8ZcjGsd3HzXMAj5teoEMmUExPB+oRGi7KnJ65MujWAGDf/ha402B
         x2TvPfXnDrgX1Tl4AeGKTpuZ3D3u8O+MEtkhj7EhxRGJPbjUQ8jnLyAgOGKQdrAGqzk/
         O8k/p6wnBfztrLI7JoIEq5AeSGQeoql1zDBGVlz0q8YwYBWFWksRac0q9ciN/+bPeXey
         IHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        fh=tiIdWN/6H58GnaiIEplIaRzdasz0mWMAWN5s2DtBQaU=;
        b=nv+2HSru95EvKe3AIXbcl0uXKaJIi1JJN0cIKX2N8U10z+jnYJ+rVtCti9uvCQJeIs
         7YeofBs5K4O3elHNWQm6shKtx9SagKnOuyV8Vl8FJFK4vd7QXcFXbxoOV6MaSCA3AcZv
         fppiVsgWvI3LO3QAyGQP4QGV6c980HyIJIJQahv8pYtibbYLgBsp0Rumqfh7MY8Xcp+T
         bP747JlnXvsMCVTxG1A5qjd858wShKB4viubT01HzDl2q8f1roLmIuoaU70PZ8bkloRx
         J+QEHIippYIejRGmpGRFmGTQ+zDbfMcBq05xE1M4VOdCYPfhsd8H18JVC5mae0Sxhf2c
         8VYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794374894; x=1794979694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=tb5TcgoCqELIeNjBV9PYMO2XyjTx3xYv7Byi61nVP9HZNGhc/yflX6MqtMg72gHAA2
         d0ey3ZdiU87Naz7S/vmhM/hGchC9YXvL4nNwmGedLi4lf3yvJItS6DkkPOMeNO29muKS
         sOwnWXPT7qBxq84sfdU7SUzcUgiAWrCX1ZEiwUekbR1VbdfGSQ3/fiCyyatPVB9JQzvr
         XJb6yDvwjcISk8f+EdRU42hf86iGpox1ZKccBpvChLGUjxARzIPOjg09TlCDEcdL14kw
         ucuSLIoH4n1e4EWtofCqmPXp1TosUwCsjN5rLrnc78T36oGMjNbytrkdwoFQtQlpiOwk
         Ee+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374894; x=1794979694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=UoT4Awk7T8kSnsC3FvA1CakhkaJNya1LprVYUUSpOYHgVaYQiclO9e1X/rCiyNrK7f
         kxzcYFI6k4QyQRF9ivmXlcPuGII+eAtQBI+nUalLfdqYxrLpgzfN4oHZeeavyOMIpvGY
         fQP5Jc2NDjMZ6FCzDp4CgE1zy8hT3H3KcVQGrQcAyuzCJKsLW0AYZ/uRaEh6TLFssNsE
         qjTMwWQnNmLECRTH+cMq80ieGlCOyr0uMKNzLf1y5z4QcagPRazMpbokZjn5JqxdX1kN
         8R2xKHsA5EooPa8sK4rPIZF2cjSN0oJIyiWwqIZ62ewQF8bhCn9PKUja1+otGXao2MeC
         c88w==
X-Forwarded-Encrypted: i=1; AL+hErH0ac7l7wRXXEup+lsinyl5wdMBCxbBN7Yhtp5HqJtIZBp/q8TQvP+J9t9izTcvGMIeUi5HWadM+jwj42Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gN2+sICgVTGANAx+HBt2CpKoUtFy6QZdntcd/EgoJ4w987BTg
	6zsW4F/zvIHdwa6T9TwJ2TUlVvPI1ViTBvaZDqgM/O6+KayUgE0kKMfayMvKTJziz/9vGRKONVO
	WuDCTIb0Ox2Tin7sYSWzomRVsBCVLliA=
X-Gm-Gg: AYBFou3VAuOQWa7rs/4Jdk01fniAFRA2BczGNDSbkywIRLO15OfbkpDYH9A35GjaEkb
	M86LeBV2b/VML/fe9sDF29i1wk/q/CgLv72etYso8GRO7juX8jRorz/rW+cDCOrXyWc5lHaTmCq
	MyxivmuQLx85KCnOV6ixQPq3ft26PEsqcnXaLs9JgkKnKWpjRXZPgVFVehEbMNxKhziGD57rjvU
	nmqMpjGR8wDb4KejIDA5Fcde3UQcoB/oOD+DMmovLtgxhTNX3KfPUdo9SgYi7GVCXh/wcR0dK1r
	wtQy6x4obXcAfS+ZcuevG8hzqMnM8Z2jHWC+kd/eiQKbBNnPcqWuP+shOoeN6tswZsZTAWceVjB
	5RAlxnRHcY+4nPXRjCdZfREx8ppoz3vh459ibWw==
X-Received: by 2002:a05:651c:885:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae126de2dfmr1890061fa.28.1794374894004; Tue, 10 Nov 2026
 21:28:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
 <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
 <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com> <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
In-Reply-To: <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 13:32:41 +0800
X-Gm-Features: AclHuK9X5Dqhm5-z10kEg9eblLbAlNWS5sD8otV-cBTsQml1KPQHVi6FoGfBKpQ
Message-ID: <CAF7HswNubLB9ZJRsJge5_YEGY4xZJCWaLA9k+My_8HcmC4fRzQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> Thanks. Can you please let me know when this one has merged?

Yes, I will do. It was only posted yesterday and is still waiting for revie=
w.
I'll follow up once it has been applied, and send v2 with the reworked
cover letter at that point.

Kyle Hsieh
