Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CA351C3B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400853; cv=pass; b=lm/VHWPReRKRMoo3Q3ziHU9hNtA0OSggxioKm9PqbqYUlz2ajtLQ342y3Bo1cBqqDXAm6AR3Tdwn5V4GsmOKOTpDQCUJACueOSXxez6e/F/UF2uGrrV04+xX91Enf/ar7sOwSGuKIUlm/Y1c1Fnre0fuSGy2mTPy9ujxpvsvXK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400853; c=relaxed/simple;
	bh=EjsbS1eNmBDsqz3O/3wfC9b/H4O9xUxhKhhvWtJGAyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwMWFtepJxJOUUvhzoiXi842p5uF8xi59/4nuixgs6jhjbp9Pli+HvIi1yRp01bzTk3qkV7YCKxfBOTPFVW8YiHDT44nKZDfo2nEASmaN/hmmHrmviKYsTSIhDztd5DwtvWh5dpX24lM7F4QSZ3/HjTGaJ7C9zQzQrCg0SRjAHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co1OE/pY; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co1OE/pY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c315869241fso470703966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791400849; cv=none;
        d=google.com; s=arc-20260327;
        b=eKGKKYIQDrJwhoMEx/Scf6nNtZ3+y1auEEa52Xn0QSzo4d/RpsWAgojAayIwdrNaKb
         UpoMI1Ax67ziJTBTlJ55t2S74+aCPH0StCReryGHsHXK3WdArGjG7XBTTm3KxWWnafut
         PYDp+eAkhf5GOrKZ1xyCMSWS+vZWup6f8gW7QnkRydywZktMUvOTstDPiXp79Z2pFYz2
         0BxbqmyST3mcfoW++AFs9KDnTEhcH7S8g2kdvAussWOpLyn+yEGXSK19xeGR1JIhLBVs
         X4Nv3rDhyhp6Dnb0+vKrfALf4XfYn0mLnCDZnnhF6pNI2QKUPxhGQpTzG0zXgPZss2zL
         vdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMoO23SY9hhpB+IiBotOf4kCqfNYHJ3tVwJFHgs1Bks=;
        fh=RAf3vXIV7u/gKaTYsY/seXOXLCK7l7u8Yk005m8oBig=;
        b=IxmV8dmz7BjfMUfPlYhHSDHitOVKte538IH2fOrUfRC3IdXwPWunvbr7WvnvBDEMa3
         zFmfSYpnQHU9nMlbpCiKlOjtD16m54LqIf4MPDBmKVcet7LF044uOLPLPMbkUdO4oi0o
         hTLL1feJo2CofmBGdGuP4C8YUDF7FOK/ZBGW8usnJ/Toku5m4o7JTen8kvWRgs5Hm04m
         ZxtEe0Kar6AwNyZkBTQUjTCzu4ZYepaZXf+eR8i+58gOdD8+RcOCsSaKWF8DU6JZY5iC
         JaYfQXCDvR17DG4KvIUA6magVg0A0bItC3rfNProhDbJiFCg5dJtdRWod49Za843MsW/
         yv/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400849; x=1792005649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMoO23SY9hhpB+IiBotOf4kCqfNYHJ3tVwJFHgs1Bks=;
        b=Co1OE/pYWQaPA3/Bvm1pfFCnieDeC1tdutZG2smECrgHvmYfdh+etiAivqa4I8BOF+
         wFiTE66zdNcMpTilGaKDyr+kjTcnyY51Z1k9Q84qTub+jqrecPW65X/80jweUbRgtr97
         JQkRki1R83kdoT/EnjVvYaY+QVll+I7nYsyLg1Oz+lGFVkFzK76lPhnTT6Yvt3acdgUk
         s2QgkAjq4w2Yjvf48eg0RAPlNJwRvmrqmlOPV2NUvHBr3i+XmbmS7IeQvEA0daBwAR8d
         Ofa8DADoolotiElC7akJtAGPcu19/BHGIVMkt9WmMz5UY/1grl7KbdcNb0IEySPFG5rA
         e2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400849; x=1792005649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMoO23SY9hhpB+IiBotOf4kCqfNYHJ3tVwJFHgs1Bks=;
        b=qBBMIrZ0/9L3mblE962/x65rGigzfiKUW4uYlCwtZHqF3veAAqQYBiB5gV1cxMv9Oo
         tgN2X4gfEc669H6B1vAhvz4/U6Ki18oNHLg+pGa25hzcKHlg7lOg1xvSD77IzMnm/RGa
         sr+3xgX8P20LB+V3mXnrvJjnAAv0p6bIx75lFsYUTtU8XxMvuAi24U/0Iv17lw6IEOTE
         j3NejTvAW4rwUnKx7H1V7I2DsN4ki/VOALCPsGF2TBFxiXSfhBhJahbmgcWdzji5VKm5
         8w/jnX4sDo+h44G7FHefXrXJuEXXdWLL9wBISs85PVqlFmco8VCBHqTgikC+6e9xATEh
         H29w==
X-Forwarded-Encrypted: i=1; AKwUvBwL03Oq82gnBngX657R3YRdZPF+WOUFHST9NNfke+MkvbgpJMgftW79fFBjoUKbe8PAcqBaGu8M3O9Waqk=@vger.kernel.org
X-Gm-Message-State: AFuF++m0G9S5b27U3Jr5dYFsYfSdmrhrLytbAKkxXtn8AK0FHReCYnIM
	7X+fK3b8fRUOhFmdG9lVHILqFn/vZ6rtw1Y28YzYPW/jXeazoYxNA4kOzeX6qRcUb2QUTAYYYs4
	angPoEmNSc2hNfQo4/ylnYGtT6teRX262BHtS
X-Gm-Gg: AYBFou0Di7zyMMizOjRMbFm7lyclWYWu7gSSppO2345vYB4ypyO/1UvztUpbDKMm6KP
	EL/1enwla2UWBsqh/VizePwDM9WMZVRuWoOLjSQQFN6M2nlaur9upyDI+FWKfD13ltBVPksrGjt
	OCmvScSM0P/S/4M2nzQcmnVvFnQkEeAyiqI79dY8/yAvfMU9dukKrZ6WkyOUyLUJKCQ25KDSY2e
	cZ2/kZni7BuvuOLcNtHTvgxWCB5CS89FToI9WUrFaVm82VQMisavyaJCcdx7rOnfqP/Wrz4Wssf
	at3fJCTen+bZ5t2gqDhogzw64/z6tcJ7e5fP0vE3D1T6Zs6R9P/s44GeUphxdTkX/5moPfzWhBr
	lJCzIbd13eJoS/6HCWqmYp+biSBkWeugH1U4kvas46qlKCHokr4T7qCnM6TUajdnMfr6QHSiRAg
	OQ8+qhY/S7PYI/YWZ/6lUs7L5sV3xkZvZ+ZRrm+EzOR2IPhwMOMTXY0ANQSRUtNRBPrQ==
X-Received: by 2002:a17:907:7b89:b0:c2d:c060:172 with SMTP id
 a640c23a62f3a-c317bd9cd08mr366600566b.10.1791400849357; Wed, 07 Oct 2026
 12:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182112.821061-1-rosenp@gmail.com> <179139748566.2527009.10663595607133766847@kernel.org>
In-Reply-To: <179139748566.2527009.10663595607133766847@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 7 Oct 2026 12:20:37 -0700
X-Gm-Features: AclHuK9d-QkdC7CjqBtRz-soH3z7oZ7yyf2mAw6rm5tTthllCcH0Iu_mhkGjJ3s
Message-ID: <CAKxU2N_k7YL+JmdgoQP_9hRne+Eg8udFyEjLOeiKUFuus0sfcw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: phy: marvell: keep WOL_EIE across interrupt reconfiguration
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Stapelberg <michael@stapelberg.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:24=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
Tested on Helios 4.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
