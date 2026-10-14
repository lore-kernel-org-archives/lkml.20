Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD52475E3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944553; cv=pass; b=Z7Z5G8fStzDFbxv1FMkbwq/cIOZJT7PEQJia5hzMe60WI0Fx8gAGFhn4go5YB9ySatid+yNqEcZe4o3hu7NYtlh7DHCkkt1PBj8SvV8P6sc58ijtvnyJCYJhlJK8Iv1zXRj81WaUb51H+WWltzyJh9WByCYy76VUhs1+2zPYJq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944553; c=relaxed/simple;
	bh=KqbPDHN6YdzyiKMmIDyDQnrpTH06Mt4Ih2MF0snoOxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHbwX4aveEbTvF8VU1oig2O3fM7m+sfO2euEMPCvEj8ZjXe4z0x8s8RLfad+keRW1t0iUCnyPfwnbs89uC6F/fdoyxjnZJOkXiLaURnt5S2FLAQmIWCMRu5ffJMvNle6lE7Nc/7cBFCbEkZWsFlpxD1v4DEEccnAWRJvYnQ7tPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acr3poyi; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acr3poyi"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so3726747e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791944550; cv=none;
        d=google.com; s=arc-20260327;
        b=DHw7cjBQWVmj+8V4625S54cQFPxr8sY1A8n0fLkD8TtGkqaqQhCmjUijfq0XaMIVAf
         l5uNlf9F2kqCVMqF3nst+esAgrG7vRkxoP8qKmr999191Tki9t1hr01c10uUfAjkcoZK
         9+NTC92RR003fmCrK1JfMVhesmLqeCjsaOYQ5r529XiYEW/kMbgNXpdqc6x17JWNLVca
         1ru6lvDrKTxerTzoCuRbasSyfZuy5JqZ98GiX3qDtNDq8sxikt1kQCEoW4TsDQGFl0au
         zurtvT/Yf1QRktpl+gHu1z9PcrI+9Qj7X2avRvFZ+6kvQazpwtXXJwNEHZjzSzNf3eR/
         c6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        fh=8VHjALqgkQ2Adg2g6EHrywWdgFnBChl0KasEDeiJcy0=;
        b=LseLmo2Jx0cx2p2qRutDHIetR4iPjDodRlWPPocXSdGLqRDdeK3Vb1q6VnBp3tgs5r
         gikp/RMNWIE0AuQVEqWYXCF42xAYhPMuwtAzPfCuT/Cc5iPjJKmcJd0QY3odcNfmUz9R
         TVLiZ3fxbs4hahGcx4ZNo5I5U5aPCTVWL3/wvuZI0iF/uHTFDQnu+E4EyHVkhvYcI/JV
         3LcjvQGnNWCjptZkeGbWT5S/QZe1myMt9e3NW2pjimNoK0zBgs3mPsOSbGJiCzZ7qSRL
         dvaEhl4D/xFzXQwwr8jyd0X6+FPk3NkUt0PKjvIRJutgKvoeFVcPHSv+lsxvMMZzvxwq
         NupA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791944550; x=1792549350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=acr3poyixjN7LIw8cYOqWxwY2nyp5pzz8ZXyaN38LSN1Ku5HCuKSc0ylBKbF508Otb
         C4QgVATTN2tnObx7GjA6a0PakoCqg/sY/8jSAmmGZ5BaRrt7oIm8bdgEteV9iCFQUKLz
         3sGwPifyTuvnAirxpqkocd6XCQzokK+mF0/4Lg1w9vnflrBNHc4A7idDLIpxShID3JOe
         /tWWtKnZrsjU7lYvJtGlglmZ+A+lZmUp3GFH292b5v0s8R9EURVbJSqdt4QBINi1g5ZU
         PXfBHGk4ITpry6uBOz4zh/x+s+lb68laXfGpOZBg9TJc5D7DS/uL0jkLjbYP7oBHHdF5
         zZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791944550; x=1792549350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=kbNTR9SpFa9XJL3tc9GfsEysBkAlabWaQIfBBsNZgQJ71dxIZ2X8JpsfwUSWPB2uur
         zN5IVaiATB+oUmiYJqc9Qb2s92okT0q+7Ng5s7hJsqazpuvVDiuK+jisLu97UpyrHxoR
         OA61IBT5qPFLFd/u+qTHqYcJenJYTwzMnXx9JGZUZX05lkJ5d5ahcaCc/KBjOosPmod8
         cObXWkj+sFRXQW24mBCRXFf8KpGHxBgrhSFrIvYjNAPwsfrBWEFOn5UMhlPfATYmkB/R
         VGnOpkm380xrqjqkh+WvxXKTHJXbHShs8BzRlg0zfANG6fvRhEmYTbriZi9DpkOfF5Mb
         T/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBysAuw9c2qEIU6wOX59rHpXB6/PxqMJWjY6l/IRNrEpOhWHz4pMtUPov0Vn90SDXohBHlUl57zs9j/omVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8dxHknwSdKHEXYVdPZBQ6rdrwCq++TpnChKStHTpHXctGgxkA
	GPvouVtnA8RDeU7mJBKARwyU/sRX36PyNyI0rKuyKoTn9p9eu+lhBDiskfr0fwu/fEvIiNgt6G5
	y6r/HAYcwFdI7Jvtr8Ee+lqEw7oxXsDw=
X-Gm-Gg: AYBFou0lmGTo3Zmieo1K5AN6aLxB/gVZqiM86KrDbEVxPKYXerzQMfImm41tlQZe9gb
	V8WAlyfolMw5zlsaQ1OBdPn07Sf/SEmGx9V2BlW6gBl97/R380oIpEfTUH7dYYDYFR6LxyUT1AU
	2wm7PC7W9Auz4cEKm48UcqZGcZj/aliHXOrJcbwR3biLjpfulKdNBTIeBwUaclOMZAZzERCYdoQ
	zngLcWlm3Gy+VacGa10HGNSqsuqKRt9V3U0RmclpXtXO5reMrnNoJjLJD/7QfHDpbaJSXs1XezI
	FWhdVSUpOZwuPZ4DRPAFL2iD0SfKMOFo2tud34RGpC8b4k/Jo7XFNe2vJcuXmAF4y/gRZzzsaGC
	1/rvI/svuMs90ntZA8uzIiasV02ycEV/n5Z3WDISi5zo=
X-Received: by 2002:a05:6512:224c:b0:5bc:f02e:9b2e with SMTP id
 2adb3069b0e04-5bcf02e9c70mr3265873e87.9.1791944549826; Tue, 13 Oct 2026
 19:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013145210.103565-1-sashal@kernel.org> <as5R_xrDv4eVPdtz@orome>
In-Reply-To: <as5R_xrDv4eVPdtz@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 Oct 2026 21:22:18 -0500
X-Gm-Features: AclHuK887CDwAvm9A-A5lvdpxpUm0jxZaYwqU9DtjoFJ0z65i4nraDiY5z22Q4Y
Message-ID: <CALHNRZ9zhVaz9UeYJTFRph+0JMM8x+5it_Xv7Qhy5f2kh12MDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Diogo Ivo <diogo.ivo@bootlin.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:46=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> >
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Aaron, Diogo,
>
> I'm fairly sure I remember at least one of you mentioning that GM20B
> wasn't always working reliably. Would you mind giving this series a spin
> on your devices to see if it fixes any issues you were seeing, too?

I've got a t210 nano a02 that essentially hasn't been able to load
nouveau since I've started my Android Common Kernel effort over two
years ago. I think it came up like twice when I accidentally left it
boot looping for days and forgot about it, but never when I wanted it
to.

With this series, nouveau loaded properly 3/3 boots. I'll keep this in
my 6.18 kernel fork and see if any of my t210 devices hit the probe
hang and will report back if I find a case this doesn't solve. I will
also point other people I know with units affected by the issue to
this series.

Aaron
