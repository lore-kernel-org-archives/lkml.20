Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0E49AA4B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357951; cv=pass; b=m72+9irjlVNqI3ZDy1HQ1PIiq2IYUbkZ1ZrxoW21PYVBDuT1nqHD5kI6P1X/+NlTKSq22Bi+pDZJgnusVNLH90PkPznepB4RnEuyQ/CiNhLPQE5PQUPVY8l5xra86bzu52WYez11IUzcwh8D5MSX76rCOSvMHMnfIOtI52t96D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357951; c=relaxed/simple;
	bh=NPsBucZoFwuxN8LiTRthSe0scFYGQmpl05b1JbjgYpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlbNEscgSSikSJncPBvx14LL/5NYbk74Q1QcCrmZW6Cau+iLovxIho9+vWPXehG+DqQ3wO9AQnph6VdlYJvLXWXvPnrDEbs1hpsLVo+O2Q+6d7AnCBP1AT1dTtU4BbXIqYjrg5yCCN+nu9nTpcF5sEMFxAmaSF1ztqRXL+Zh0jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irKFaquj; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irKFaquj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1631353a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792357948; cv=none;
        d=google.com; s=arc-20260327;
        b=JCSSA1vLLfpl92//3VTUxYGeCHoPYpfS9QN4Aw3yRBVPYOazvn2TXRHoebEfRfUP+U
         MGuskOqGWGjL7KFiZVAlu2v+vdqwIB3GMqLHRph0yo0vxL1wLN9x+tiP6uKTJ/kTzO2/
         JmF04gKKbEAWlnRrJF6wcK3ZPuVgOekM+HFx23xU1c4ixMtLlKIpBJoGz7n/qJk7AylL
         fHwMju0gw122UDWhtmV+DKwGpODQ3s3KjpcGjkSDE6N4Wd+YpCuBflM+oKhvwkXjCaL2
         hpfEXtsXiXfukJzeJ+cgtJOCh3T6i4Ykmz2fvGei2IwDBtpXifb7Bs19jRo+IqZvHYv4
         2jtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EAVBbyjDy1OgZjxuIB+FMdM7v3vfb3dDBg1zMveAqQ=;
        fh=QQXobB4jQoGzVOu7wyRcVZs3Zx8/tWUyJ9zbF1D1t4E=;
        b=JilPPN0gXjqnsbGBr9mRYxOsuxI6GUjBkjqlZ5baC3u2LfUCw2f94aQRBdnP9fw0Sg
         XsH3W7GUgN/VZ/1X+QWRo14CNHI2NkfLY4hw3rnkcKjtSpwZ8f1LPiuSb63y7dAwuEid
         ddQjEcoIoIffvSOqc/IKV4AK5JogeXkTwLxQ+VhiuAytq/GwU6zbqbSfkF1S8Br1b95r
         gPQCYe8B0Wpu2jhOtKrNIlJ6WnBb8aqKRSMTHQ+8cTJ8lkUVVR1D0+7mDF+rviyoDSKY
         vwTIiYB2GL5DZJxIK1Pfswzhwv9p/+AKO3kX/IqvP5hwMZiTLeEPbU3DsONs48whVqaG
         uBpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792357948; x=1792962748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EAVBbyjDy1OgZjxuIB+FMdM7v3vfb3dDBg1zMveAqQ=;
        b=irKFaqujIcNIfHOszmaA9Phyke49g8IlIzaokVTm227c63VyLNBw8fEpPo3hB/BKWC
         +mABFka9Be2goaVwu7CrfheV5Z4XMdvud6KhxOZdDSFFNN6Dbb89bsmAhqt9pfakVufJ
         c6QMZOLUbtBGruXxjQrocF2xa9buR7S5hpBOozkHSba37E52cEo8qghDYecOXXoBddX3
         IlqTCh/klMUV/+fRaTBoCqz/KG/1ChML3oYFlJrLOW4g1jkkRfHiv9JeF/0r7BzdJWrc
         CHVguQJTRsWfbzhxZ1ySDOLxdBAzzIphhTWvt1E0pm6mPZqrR73GlZOXciME1LpImhz9
         /r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357948; x=1792962748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EAVBbyjDy1OgZjxuIB+FMdM7v3vfb3dDBg1zMveAqQ=;
        b=sdwE8ZYXukJuZOWPIeyYD5KRcIEo39YP2O+eIQRYWQlIamEZywvr/P6qa8+yaKmRHP
         YP0t8aL8fWlY7d42D7qz798OjEk3PokmQ6kEWoXcALSRCnBgYzCeDtdQF0IL4RdQgeL2
         nwWuI/FINVCpIe7EF9JAInDXVk6CS0GFRUWLIo/rbM3lz1vfeQnLFnAQ02hUuTKB/4RG
         omEVbUA169nD2Ek37kZkKb/ppt9dnZWBJXu9vXzLWRc60PkWZwfBEy+0eJ1nzgfyA1iz
         rmbMM0MMHOJUd2czbi4GWcackVceuCsAa4kJuGynmds9IhJeviTGRYoeNae4eJWTqXDs
         0KCg==
X-Forwarded-Encrypted: i=1; AKwUvBzVACo3t35imsCHiI7r91hyJ5MGNEqlqx91dwF2ZF1JelJeoRW/NJpVFbOKyNOOGyghoyDQKhCiecLRFeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbcHunKiK65MFn3blBFVhoMSmcCEHji7n6hujMSbAwDFgkafS9
	c10rfY6BhJma9Hicc43/K3KTUbrzUK0KMqSn1O3zcTb+3h8N1vci5n73LcX0a8ALHThS67eDaWD
	TaqrqO5vFIhOrD7gUFloX1MqoloxktijQHK6b
X-Gm-Gg: AYBFou2ICn87m05alfni1km9OzqZIPToL64/MIJXrGFXVR1yd9YFvosGjq1s8krMpPC
	zwxUp2P0tWHnr0WTPGIwIeysiZ1pgskNaJ32mci1Rhk52QO1EPWRDKp0TmcpW3/Ot4R5pFParpo
	6rWCCfUk+UGzOubHW+GDuVcg4HxDImtE7bI0Ki1OQj2f7QvvkWV9eJ8YUsDZc5c46SKZ9cf1M8s
	q0CTgSt2ciGuRlnuQ3wRLOiKh7rqkhZi64ZAHjEt9Q2WpC6n2SmTwYZwXACbP7hDtuoNc1Sm8nd
	NogoB2i6lLUru/EIboK9gDHvkMtOs+EZtiBeG4Ka6PImRv9tKX6ZZLKK8IrzM1kOiSIeOrGZhSn
	ydHmdDnLLHMlUdAVka3aXT9lFAymjwNknMnuo0hf+mLLKr/2bWAI2
X-Received: by 2002:a05:6402:190e:b0:6ac:b9b5:8e8b with SMTP id
 4fb4d7f45d1cf-6b3a8176960mr3673422a12.15.1792357948108; Sun, 18 Oct 2026
 14:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018122734.2594904-1-stian@itx.no> <e3068b5c97884032e7cbd12c78f6b5534d75e30c.camel@physik.fu-berlin.de>
 <6e2d2b2b7aa4029c261831016d8b6c40bc335341.camel@itx.no> <4f7dacd9b4cf0a43209be84f2408e6f7e033fd3d.camel@itx.no>
 <CA+=Fv5R31wpXsm-7_H7ZR_U4ASubis+_zWKotpj2iNeWW_MTUg@mail.gmail.com> <d233287d5dcb6726403703a7b923b05a8134cb1a.camel@itx.no>
In-Reply-To: <d233287d5dcb6726403703a7b923b05a8134cb1a.camel@itx.no>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 23:12:16 +0200
X-Gm-Features: AclHuK-e2-z8ormz3qEfmYHF3HvTKszgUZZKRMKr4teyS0FgOEFwplPC8KtpOVc
Message-ID: <CA+=Fv5S1kF19rOgYjYoMP51QBvhEng+HbO9wDdj7Ue8rVrRO5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] sparc64: Randomize mmap base and PIE executables
To: Stian Halseth <stian@itx.no>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	"David S . Miller" <davem@davemloft.net>, Kees Cook <kees@kernel.org>, 
	Michel Lespinasse <michel@lespinasse.org>, Jan Engelhardt <jengelh@inai.de>, sparclinux@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stian,

On Sun, Oct 18, 2026 at 11:08=E2=80=AFPM Stian Halseth <stian@itx.no> wrote=
:
>
> Hi Magnus,
>
> On Sun, 2026-10-18 at 22:37 +0200, Magnus Lindholm wrote:
> > >
> > > Additionally, outside of qemu testing, I'm a bit worried about
> > > sparc32
> > > machines with virtually indexed caches. I've heard those can be
> > > fun,
> > > and I wouldn't feel confident about implementing it without testing
> > > on
> > > the "real thing".
> > >
> >
> > Stian, following your exchange with Adrian, would you be willing to
> > put
> > together a native sparc32 version? I can test it  on my Hypersparc
> > SS-20.
> >
> Sure, I could do that.
>
> Ideally, I would like to get this sparc64 series through review before
> I add anything else. Could be a follow up series based on this one.
>

Agree, no need to mess with this series while it's in flight.

Magnus
