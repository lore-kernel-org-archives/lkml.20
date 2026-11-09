Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189440;
	b=1yshPU9fDMKfsSvCkDk+mwzWleFU+g2vjnLXZJ5/NJRjhGl6b3MLln5j8UZyAA6jBS7v
	 QqLc0Krdt74dyb8W5TkYhp4/PHM2EjWM5cYnq1iW5EJhs6Pfve7e+CdEUGDHNggjZqyUm
	 rM7idY0WSD4rnJcl7TcJ6rynbw43xsk2rPHzWlbtCVnPymbxXj13YhgaQKD0IjANItklr
	 vCvvBsLQ5vCckRf6CB8ObzguyN6m2rr4ig+AS2Fj4yOi9OnA9kJHSxFE+y0BYYAtOhzBV
	 5H8SssRvJIm+9KWRgUmI85nfTJgUXAG381MdAGzQScYfC4KU5zw/fdCee/wxq6/jMvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NPpBzy9rsAwjnSihJCJz8r4JLNePzNIyAaNAKyPfXSY=;
	b=HHgHDCiGmuzmNg5/Hn7AejpQ27huxLOsz+MxraheoA+R4J0SOVKNdDwGJetZ5iYgXyQL
	 xGcBv91SGQnJr649/jD6PprEyK7KVD4qkzwl3JSZ7ZJ3YCGGTrQPe9i53JNHdI/frZCLr
	 XDdmHDCrL1ci3D4haFvLYfhLJSlDaTHaXVl3Q66uFT3avqqu8JmqWLLq2f7fR6HW7WbHx
	 jjRt185/Mi1tvmxoLBnFaVoI910hOVSv3iyF5imvh+RwJIJyUykkXZ3pksm7af5Ud45Oj
	 sl8bzJSa5OlO1HS7FGImQyRHCLrxqeg1spnqJwKcvMkiC/1fe4zsFod0mQUyZWe6oXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLuxsJ4I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0A606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E0A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLuxsJ4I
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so2117785e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:57:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189439; cv=none;
        d=google.com; s=arc-20260327;
        b=n0c//VSKlmVlWbNGQf+uYFiMNHox9NeB3lhb0LcXn9747jVZCHC4/jieKA6CAlRQMc
         bcyNc8j5nuLAES7xvlOYgrs3kkQhG0OjfiEq7umBYoyxyzD3aTrs60omDWDXm2iXt0Fu
         /swv07TiPR4GgAI5/rJnrbG4P/pJaEq+YmcfZkpb22jiG6iluyK7bO/sphAEcVDqMlPn
         FHKdaC4EKMbdArK7nqYgep/lswlPZfGhQ5B2llShiDwNlr6WPphQIzJe4rNgdYg7TWJT
         treH8H+qevngLvl+my9jiD4V2/CJ5B1fqQbj9MxSlWJb27lt+x96AvsQ4w598mAOmoyz
         DhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NPpBzy9rsAwjnSihJCJz8r4JLNePzNIyAaNAKyPfXSY=;
        fh=Qp9lJWDQu5SNHMr8o4M5TNhQmuznURLnGv1hJvWiAvI=;
        b=I7Cz3FOmL6QmUYYFH5MeGfnTVSLwNY510H5okv9O/rkm4pTS6jCnCVTYE5jXCzTs4W
         PZDY/sAsDf24J+jn10PwXSSdulUYpenYVpIe5T44LBJnjqM3InNCzaasm193H7AWDOee
         VdGInozIF0CxDkqomx/SRwcGL+pjIdpe4K9KlGavDOPi2b5qehzwwc4uB+6L5HRtRpaF
         N7GWZDtMaLi9QYN99YfYGRWJ9HD5zB52TbnVHkbsCBj6pmdYEWgSs9sZbY6MY3rpHbmz
         bt/BP0ZyejpfQrtJ/OhE+Le+bcxugSl3DzyuCww8WtRg0j9gB4roLZbW4RMkTBLR+Ltt
         inmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189439; x=1794794239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NPpBzy9rsAwjnSihJCJz8r4JLNePzNIyAaNAKyPfXSY=;
        b=HLuxsJ4IP5OUkWgfPaGUApudypO9O4vX4JMcj9VVgKQP5DaSsTW8OU1dInUeenMjvo
         dLFWbWsLY1zPtI84efXesdDNOs1L8A0Ij1EzemG0ZJY4hdS+PZ601/ghCcfyL2x0zqlV
         c4zwBDgYbS4kgDGujAhVMzSe+WDfB4hQDH0DzrznKd9SuH7i/Az47FZm0FLVMG6uf8W2
         3Nh6R4WXHtYaoFrCTH6NuRLT4+gnKcCEFNfI7/Aps87SPfdpKcTpQE84yAFzL6j60cEN
         W1YOxmr3QkYZXvMgUMrhcRyyYVwwEfTGVG4pXBSc7PgSHLLH2sfC3/755Tq++sNAPVlZ
         AG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189439; x=1794794239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPpBzy9rsAwjnSihJCJz8r4JLNePzNIyAaNAKyPfXSY=;
        b=1ZU8y/GFF99XMPdlJ6yvJnSgoBhy6exoOak46pbTbuyjFrzpk36oOWfMTbI/dkBuhU
         v++PxApgbd3Df2gbf9QYVk66RhS/NEiJVzZeOEAKFmX9ImzBkLQ0euGxKrH1vnWLWDh2
         QYTscuwrBKuwZFX8gzjWUnYHEQWswdWVJmWGTvHrR+VhzVqoBe/gWBmQhffj39MjNvyo
         14BEcO12las9DDXH4aZb7KSnemRnFLRZ1DFTEPWMJf/Y+M/QFHWbgugAhiYUdVNLOYlW
         qRH1s4Ssf/FMDSDUw37XvfoLTNanZSaL/VcvAhGs83ypj6eweWCmMF4u6vu2h62n/tvw
         ZjmQ==
X-Forwarded-Encrypted: i=1; AL+hErH1SuU2+xxj6ao+/o5O+EQwU/WdAJM2EvMFoTErAUkMZH9nEXj+n/3koPj+Rv/3s5/L2izZdblwHMOgWQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0zoD9hWAbd/E0A5Ea7fQ79EQZihgfiQBWn/pFjtqF7NKYJLlV
	uXz2nHJeruDJglceE4v+OfJgwxdb9UbLvh0XaXUTszC7GWUlH9CfG7uPqNiP+DW2/eAPP7ECVI/
	fIS4F8wvarX+Mtvx+x6qxAVeN9v2CFX0gAntQ+8o=
X-Gm-Gg: AYBFou2YlQQrHjGJlosJHvMpClwYa3s0pFSYXO8lmltn6oyLiWBOEJmrNBEDfzoMu8Q
	oNzDKui6NeWoAogXS5npEpvgweZaPAgC9qkk3nwsXqSsML5m+1ccBRUtOwHmPIlOzPFDbhwFII0
	K02giqjUetpzHbsMB09/xon0ABqDwF8hFjcHALkGuY/Qis4nU8hYA8pz1mJv80l9vaHWBOSlmka
	dI1VUdMh6Hq032QB+wX08B/qoOI5vpvx3FTtoEIVVlaIEb+PUeG1W94Gvw3jrJspihGWmRUB0Wc
	6trlqb2z1oNeiejLqW5/RxU+VPEAwHwL5tOvpbrBPMBynHin+uwWJ4GNny6m0UlT0LXxTGS6Wro
	XqXKLfKH49KpnukrRwZZ9GTOW7luchkrYQOFqMA==
X-Received: by 2002:a5d:5d06:0:b0:48e:d88:55e2 with SMTP id
 ffacd0b85a97d-4958c779a6dmr4992254f8f.42.1794189438757; Sun, 08 Nov 2026
 17:57:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106104842.441067-1-pkfxxxing@gmail.com> <173fb0ba5a3b968783dde74560d10bf9@manguebit.org>
In-Reply-To: <173fb0ba5a3b968783dde74560d10bf9@manguebit.org>
From: Yong Liu <pkfxxxing@gmail.com>
Date: Mon, 9 Nov 2026 09:57:07 +0800
X-Gm-Features: AclHuK-Ge004zM02tecHDLrP6fkj9vXH2gJg1fG6dEv2LWtemSwDgssoIQ6OT-Q
Message-ID: <CAGAoTxyFLVy=BiA=VVgRAGFgectEwio5yeni3rk6DWc1emKfMA@mail.gmail.com>
Subject: Re: [PATCH 0/2] smb: client: validate ACL lengths and compare encoded SIDs
To: Paulo Alcantara <pc@manguebit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paulo,

> Applied with MID_SID_LEN and MIN_SEC_DESC_LEN removed as there were left
> unused after patch 1/2.

Thanks for applying the series and cleaning up the unused definitions.
Thanks also to Namjae for the review.

Regards,
liuyong

Paulo Alcantara <pc@manguebit.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=B8=80 02:32=E5=86=99=E9=81=93=EF=BC=9A
>
> liuyong <pkfxxxing@gmail.com> writes:
>
> > Hello,
> >
> > This series fixes two memory-safety issues in the CIFS/SMB3 client,
> > reproduced on mainline commit f66469d9905b39d2c260a15d7d6db450f4db67c1:
> >
> > 1. A zero-length security-query response can bypass the caller's minimu=
m
> >    and return ZERO_SIZE_PTR, causing an Oops during an ownership change=
.
> > 2. populate_new_aces() compares variable-length SIDs over the maximum
> >    structure size, causing a KASAN out-of-bounds read during chmod.
> > ...
>
> Applied with MID_SID_LEN and MIN_SEC_DESC_LEN removed as there were left
> unused after patch 1/2.
