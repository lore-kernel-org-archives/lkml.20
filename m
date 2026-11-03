Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793717274;
	b=imMFBtoBlokR8Xr+OHndwA9td6D/AJtaO0RiZoq+5J+OLvG8LvwLKriylsxgxDvL21HQ
	 /qa2OBQWxNM5OYt8DDV6jkxDyPgZ5NzsU5jbzjSvKOLZnA3BjdpEjMc+zmB+969xIB1lT
	 fFivmDiUkwegPJaUQIIVNUcwTYMZW41I2su2JeVryLbYcQL4O15l3Q+fo+5fSxJc7699D
	 i1kAn41OmDfG0uNXemehSesXTGJNOw3bCNJAy39td6uba80z8A5Bhh52BmpN8h3/O2W0c
	 EQm/BLn9pXqJRt4QB/ajn0XdDovCU+xX//9HYT6QuoZ5ydvDOocVuUY7Cp3VCoxzJ8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
	b=SNwxbksWbNWzqGAVtXTCNFWwT/nkohSweYDHZNgPN7+ayaI36xD2fnRvCUk9EAFcnPmI
	 Aq0bHkDKx51Y7JxATOuaUaFPysQsLj6YT+qjYpdcf5+U2J4ayRo+2VIQ7yKMcQquJhSoo
	 shn7lNmdpT+nHqV4LXNG544FnLaVDDSQzFbLH70jaND7md/zgO9lUT6vxt5g0ngl191Rj
	 tyla40qmv2dLRKu0EJYP9hTawCGw1xJp0i4YmYw1b2FKD1ciQ35vmirytkj7FTKjxofHM
	 PqdFwKyFMlX3ARnh4fpHflf7mH4jzt5nY4a3IdIaRKQs8KiSCP2Xe7YyoPQ/2YXMbmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UuQVJ/sn";
	arc=fail smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F66083601
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12F66083601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuQVJ/sn
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67b9bd530b7so2863036d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717273; cv=none;
        d=google.com; s=arc-20260327;
        b=LZqMLoDXVYYepivP2XyPwERQojF9bBerirrY74wQSGEMpT6JfQK9BDaT6d1xXWJW0c
         LUN1wnbhS6QlYK53P9FDo6v+XTWcEcuhkbeiWCfzX6pV5slQxOrEW/xQ3i7fF4Fni1vR
         +6ltQSYyh9dSyClvAQYy1ciWDoLsDY//rzzTlwHzTKW/yFZhoX6n9GiXKgZJFl2IZREk
         4p5Sy4+tyIL1CN7aPe9OnJ2WB5yeJRqaQ8MzI5uxxCSuTvWlhflvDn5zbJFjbUzRNGHH
         EJaDTHzNbt9d/CsMa7fRkkh9rVglJTjW1hIACF65zi0LxnxZvKvpypDIo7qfJlIB2JQI
         K2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        fh=0aZvdVVm7379UGAcXAwoSpkzrFv/UIffCqktm2WRCa0=;
        b=UIn05oDKzSQLYUV77rMp8RdnLNxFXzBOqxGY2u7qB9uGAyZw656q6gUfOEw/NDBIjo
         jrWzNC3D2xIMhQYVW2YnTXfB9l3QFkGFuFg6/6CKKRVGTFlMm35fOp9MaYtO8iVhWX05
         NTNQcKpw42hrDAoQNkiPJS3KGB0TOhQ3Cc4ec0wdIrkbvcbfhZHO6K83dB+g1wRZkizw
         fteJP28ClDHHCKHMxiSTpss0qtbJ2BhLgpL9ayZKcZcn7IRXkxsDeyrvipvyRohcbGyI
         U1lZq/qzSbRan8OHstccDa4hly6l8ylOxjJDjlYcnWQ67IDX13tIklDPf0DWXeNFaZU3
         iZkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717273; x=1794322073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=UuQVJ/snCoXiCMQgJPntNY0UAtPaFizeOkCkDOcdqTJQ5p2n/Qj9kIChl6SRKu4wsV
         rg0nCEOCcuC4vPbWN0LsXKBGZuDZrktSsZizVPg5XKoeEYd2PukKc0sMmK7IMWBBjiPE
         O16dQAmFWCxU+0/lF5RqX0eL4ydrgQxdT/3SMG7aHWhpKW3cG/G6kP1AeIElkMF6FUZ0
         A8qjyl2Y1BeQIivNo0OaYmBTy0RcVOE792IA/cFSaHtlWsM01ao4/05drZspWy9weijx
         F1cBSklbK1VOUTxdTqhqZST/BUEfciUuDJvBGWRKODM4SIfGu1XcenuzBfxvHNpvGH9a
         dZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717273; x=1794322073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=R0zmy+ri3lazrApEsM8xe5AJwnUrLshTGnXcSTVhmiFcca5UAeygopOqTHwusxxE86
         gwXqT7i4Zfe0hY4Nn/Li70sTsp8YbWZLsW8mxULSRh885V5hCdaMOJY2gpIm8v9xvWnu
         u55M9L20gQqZliJyqbsgXZs48eQ0v+aoMPmvW4NpL3DRMLodaNQQ+NIaTbkqYRt8gxp9
         s2mvcR32YTQ0YDstETt86idUtC50/0HDkjcxYNvBZQ+Hc3w/o6uZC+BvHMTp1s+EKuRe
         nIimGDMQYoPzEZQq7laeyR7QRNsnFaMHz4WPw8a0LBwv4bTQL7n1yd+L9bHz4Gfn4saz
         FtTw==
X-Forwarded-Encrypted: i=1; AKwUvBwcgewnDGO6QVaM2OZj4d+1xGcY4A9pD+aQYSDd6q9Zxablo0Ll56StRjqKmnfr6e6Outlyq0jGs96lTL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oXhA+Z3t2XHxBo2qW9+zltMgruQ/SLr5+FLrbx/IMCqTCfbJ3
	PKrD5oHUh6brQ3l77pLMFpNQkLl2eF5JIlks0BXmpcegzIRu/3iNQJ8n1B7YyXFfhXi3bX1KO5R
	8KyUSM7drt7Jb0oZIFsNyXvjbWyhpyA==
X-Gm-Gg: AYBFou2fbzhb5WtfSeBOMiG+nkDZHbFn5GaUneQfgU0CfA6Oxpmo+zfSTgbSAmNf0q5
	u8mRh1zzB7mqedhPddN4u+bc7/rfLv37tVFiAuKDbeaGhtW8Dh6VYwESBm8WMRjhr72TjaLHfCK
	5nGjas/ScAvjeAF1k8col1aQaZa6oqPoMy0DhQC6a9KQ5UFMOXnkNxlbIoqd/JOa7WqGbbhoHAo
	2vOdo3JMq6tjnHjAy/SeKszxFobPfMio3pMkfpA67aTlT+yvCyj3piFN+vTPxJ/RuIMwUyC3OaI
	S27LeA2pzuRuezo81B3ph38HnrrW1gA33K7As4JoHnqbnPOS0S0HJ1kk0aA3Rx9CPjd9+c9wdTu
	CuRrAcWIOwp57Garpa69RJ+7yf8+IH80GIb4whAgAUDFZ/H2TODV3By1LSPA6n+gVrI9K/BEc/h
	4viWjmdJr7PRbuDeI=
X-Received: by 2002:a05:690e:4088:b0:67b:e1cc:ca6c with SMTP id
 956f58d0204a3-67be1cccb74mr681732d50.47.1793717272964; Tue, 03 Nov 2026
 06:47:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com> <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
In-Reply-To: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:47:40 -0600
X-Gm-Features: AclHuK_bAiiHjTrLk6BAhfSIpWQ6uON5mPRZGYY15ZS0axcuvmvGLmO8IscHRKY
Message-ID: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> Does the downstream BSP have this? It would be nice if we could port
> it over. Then you can properly use the power allocator and/or the
> schedutil governor.

Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient = <190>
on cpu0, and sustainable-power = <1200> on the CPU thermal zone.

The energy model uses the OPP voltages, and Andre points out that the
current OPPs are A100-only and don't fit the A133. So I'd like to fix
the OPPs first, and then add the coefficient as a follow-up, tested with
the power allocator on the K5C. Is that okay with you?

Thanks,
Rajan
