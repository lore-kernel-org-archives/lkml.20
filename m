Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6F37C0FE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753638; cv=pass; b=iieGLXIwZxsNL6a/3fFepqJFTTNFv+iq/DNb1YtMSvWFXL3AS1PiK1Oj75+ryzwiooZ0cqv6IA1ibCQLkFFqHffg0fYgx9iRI3zTu6oJPl8jkyy7geYesQoOsVqU0i7/yCfYozaUVFy1j1lPvm6WGWERiPERziJhe4tq87dLBok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753638; c=relaxed/simple;
	bh=ZQ9na8R6Owx5vwwgbJYlV2OYkT7SQ1YuPUuVW7uDu60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S28oKaXrBJBq8tDPES9ITsvEKGnyOTgmSjERnryHQm7g/kMKprDMa1WRnhk3vgb1tg3Onvn2d6do93UkAmlWOT0Bgfhx/07vmc6RHnk7wc7b0pkS5fUkhpZjWpdZerk0nS9inIqsAQMb0x5OT5wlGzxqokWOJH7CnGC2fQuYu5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRxZvETw; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRxZvETw"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d882so5719285d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753635; cv=none;
        d=google.com; s=arc-20260327;
        b=MZMzJ4c/bz/6w2WpCJ5iDm+lSrgJmTGLFSNRUfPZvMHKqkOqrKKGTz0fWO01iAlY60
         GPskjrkrSs//bYbIod+ivMxisD65mcb5YK62m5OAmbux2oc0M3nddAtCH/JeOrE6f2Wp
         JcRCOjFdF4gAhJaJbq/BLCbx9lHa480lyEagTXquHSyqgfk5KK1vMurMBLQSm9+gZP4r
         bwsDEA2Neiinoha3dCZnL5BBYxsnxDRswvOLsb4mW2/EjFUQWnNHiy6o8GQQf1qjqV+H
         IdJ3am6qlteeZyUREglE2oKeCbWM1kAQhHHO1xqVNKBN8+m7d6vNYcB2DeLYYwRpTWqC
         u+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        fh=l8I5kRLCyqZmy3qQkObz/a0odIB6m950uEqdjXyiNnk=;
        b=F9pWrnwR8d1XwMSolSvcFMMuffotb7O5PmfvLh/Egi60bnr8PLEv5UNqPIrWa9Vq5m
         S/o8C61iUQW1do0BT+/jyEkLv/bZCe84fsvb2RqYBFzl84Vt1v0dcFhU1LH1NCU45i0a
         G4nVLeSiFG5IBJk5ItP0KQjqzgHs2Pk/9ROUv4tygDuqVOl+xeH85qdmm5mswDOqk03N
         jN2Lzbd/sgHqYr3OYqwJhmws76UO+87XM9mf2j5QTkbWrJKzQ1s7KlVpBljiF4N12BlC
         7RiA1SG9LzDxvO9Rl6vFmnl46J6XAFJAGplk/J+RZFabQcyJm40fP0TtxdpEnvYeYufW
         qO+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753635; x=1791358435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=RRxZvETw1csmOpk2NlyBiaKR2FkYPnoh5drFAar2txGEz6JbAW/2QF+Zs/DvCMlmX8
         Qs183SGXr2472RZ3IbFudib+kuy+5nXd3UezA0gNWVtwZpewtAKA/FIfHSJhtIJNKuh8
         VCo0zsQnt3Y3URgfBnxrwdDgzxBbkezH7717TBFValEkysLB49EPz6r2D5enaUVfZJUz
         vwc/2+ZQZwYzs4ypfPRLO77G+d6w+MH+lKhWVc29IqZrMJy1/XArROfBVyJep05o4hJG
         ygDaFrabSUPit4XaApRPTURnv1M1z8sjLa2akTaV+z3Kw7H0IDmJwkeTbW93kUUixUFm
         KA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753635; x=1791358435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=LTNCke5+vV3shZxxrUfxb69132+oqPWJKBydKbYR0MrPOV9EYDfDFFQ3rphVZPV8se
         lDky/s3BLRe3XATb/E7ICO9mYkWqrnXZ/6lsVgOI7GXPpNcul5oThc1AwGxZq5sby0k2
         1sn2giXLdMqnyo+y19a9bSJzUHslCZ3psO3aDiXwn7HkL5rbESBddSXcgz5dkuEXlslY
         2CJNjYyXkYbw5WVV/x3H9ujfXnu/fsBrvAqXE5NV9yN5skITvblLFvedkv34AfWabgMb
         9Y1Z3DyhzgdI7xLp/GeSjKZIDm9xfh/ITuk0ObCxUjD+hox/r9phHIUBWSFjYYzJx14D
         kx4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzE2IVZ0Ag5RkifDHHxpYg0FO8nzDkGum0iP9VJ4jDt7bNjROw3uYHNm3pxZcapPmMeZMP9T9D2hTRC0Mg=@vger.kernel.org
X-Gm-Message-State: AFuF++nRgEGU5k5yv3C2mEa4pzE8JygLbz7ffLN74AlSItDL3jhLYzlD
	OW6MqK9xv6Y7cwg/avrWp9AweGJfTfVE41IoVJJ0vFzDcqlCUheAj09C7D6iLQkSDvdCYOIs4wv
	zzcFhPqOYvJ9ON/JMISjCtfa3+1lEPbw=
X-Gm-Gg: AYBFou2afKIUQpp/z241pVBbeLM/T3un9LHyxcNkYMnjnl95uROycqRXZaudk3ATwqs
	GXaxZkeIV3E22Q+5t7Pz90Ii7wH+N1W8Xl4JhVwDkQ/PP3PsRLb+Miqmab07rn6DCw0/ZrVsJKP
	ggK7pc1Jx/IUVc85aeyqOjcO9VNdoI6PNWzR+eYHq6PZ1rEQeg75ff3Ht//wkA3OUjZnjwA1zR2
	fmdMdzjaqCQO+b4cgUqufrdZURSIspj7rt8dbYi5YYBS/ql59sF+uYOqzbPa/VWlXk7bdvAS1xJ
	aDR9gYf+KndKq/GP0YxdB6p2gI3V8WbhTaMEw9JcvEbyXeIpIDpbz2hLDsoQflxf
X-Received: by 2002:a05:690e:4411:b0:671:1b72:bd0f with SMTP id
 956f58d0204a3-676834ef47amr147001d50.58.1790753635586; Wed, 30 Sep 2026
 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
In-Reply-To: <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:33:44 +0200
X-Gm-Features: AclHuK8bAkNOdRlVNFbch7Bc0dDjNYgJqW4vj7CakOzQrTXiV9dA3JxcFXe9oWY
Message-ID: <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:25=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > My static analyzer detected a potential issue in the dmag engine.
>
>                                                        DMA?
>
>
> =E2=80=A6
> > ---
> > v3:
> >  - Acknowledge the usage of static analysis in detecting this problem.
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Under which circumstances will additional background information become a=
vailable?
>

The static analyzer is a research-based one, built upon the LLVM IR.
The analysis is founded
on a symbolic model (not an ML model) for concurrency bugs. And due to
the anonymity
requirements, I am afraid I cannot reveal further information.

>> Were any more of your contributions supported by advanced source code an=
alysis tools?

If you meant AI tools, then at this stage, no. For this patch, I have
used AI tools to help phrase
the patch better, but I did not use them for code analysis.

Sincerely,
Ginger
