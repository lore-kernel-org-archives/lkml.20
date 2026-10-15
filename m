Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8130C161
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071219; cv=pass; b=u+VtTtU87/jT1N82SLDVT8gqbqNDgz5YzeLwyi841jxiWLgtSgKCaJxmem4uHij/sZDz99FfG0zsJEi/YQ3tZ4dAM+uHKLPIVVx269mXkaBJq6377OuaegaVJ/hEe0fxsHV9Gx83dwdoRQlkG/QncHU/C7ew7jUy+H68Siuk0/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071219; c=relaxed/simple;
	bh=Z5Ri9F4+OVBBIEGoV+Mr5BnCUO8uTyNyHHmMRGWppMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnJWHAiI2SGKyaI++9774svJ454VwZ87fbkIg+XOINpbmUyZfZ1djWIwdbV2QdeceFWkK0LOlmcCF9oOsim957+j6KNzpxELRO/WACyciPI0mBaDO57ctSy0R/yBy8tdqRLq14bHfKTKP1YyR9dSTR9RiyJeWH1w7d+toaEJSYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAuGi+DB; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAuGi+DB"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8811750eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071218; cv=none;
        d=google.com; s=arc-20260327;
        b=aPsnSW3jpownALuovcnjKr5bzqpE7hOTIyycEA6I7egvsZ+MyFhWmpkyDDPXaF4cgn
         8fZiJt1v4GXdKev/g74xqyWRbUGe25OwXY0f2V4ZHLIjJy+otlwoNImbMuY5gcIY+Lot
         phAn3sxwPfJN7dXH99RtmZsmP092V/fQuNZrEVU95wdOthQN3AE2Z4DCWbDMulS1abQD
         GljURjfNnBvG6xSL3PwEthqeUwB0dMUDoQAfCTnsrR4gJvG+lbOEtAhJKdlx3PLVP10p
         7CUUniTCSII/L36ufyohn9y9XGmtOguwXHDNYyRMVdvCDOQ051EMJXFKuq10Lx58xjZj
         +zWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        fh=AzvtwVgEoun8WcHLDkcyZPmtcLRQYl0fdjZB0ikfiXQ=;
        b=kp5Bj6YKjJ60YhOa1mh3PzcTx391/sJT+XQQhvyNFe2nH0w0fnSJTM6Z9ViW+dp4Lq
         nyVOyzg6cinlb5r9C4bXfHtn5BHhXPQOttsgSrWctOx4oMHwuhJBXpTGYLcrAbsFJSZT
         AHMCBLifNHTJ6QrxcAJ0++iz3OxWToHrONMcKfuN206kXHMOC6NQuNnwUtpQkPJVZAQx
         n826mnxzAMgzMI1MNJzLN29HyHBUT20c81cFktONRv7hC9CHoOx8xv8IxD9mcLzoVwwO
         UT50lnVheljQmLKTmyxw3MODxGjPoecIzN8lXF7VqN6XtOQED2FXF5ihMXvOnih9vJdZ
         qaFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071218; x=1792676018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=PAuGi+DBtlHOAXfkTuvEgYPIz9waslOw941falizFo+xSe5yRbqlb0CwWyGRG7sxfO
         rqZ0ccbiXIZV3s6UrBg4hAkW5k10nM4p1zSouygV07q2YjdoIBrZOZG4SLnYrhCbk/k6
         reMDApl7nJGdp3HLpPZFQzwZoZeozOpymd0qETxSV+a8soC6YUhMOHtBhEHUcuF/niAo
         foz+SW23qmoIa0Im0rN6ecC2P6Cc1EzG72j+rXNXX+WXRXFuS+7Y9F4AX6zYo5jqZX1H
         nn249Xm2CiJkoVEWUwbuDy4J/n/XylSd4tpYvN3vBd1ndmnnFYMATBUbchW8GuRTP6pV
         E7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071218; x=1792676018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=YuuVjEqKnNYhw/lXBLVcQkPdvCBTrh0ee6UHY3Yl2RFMIx0flPewpw/u4dO0K++FjS
         TtlIvqLgFfyl4MkLWAfzraaO2PWQlpH721KhnAShn5UWwVZ4bhlwOAfXQT2Z/zrGof4C
         Oq2juaxud0YJ9y6TM9aFBThyX2B8P1yDOmiEgqQZpK/I5E7RVQmwxUkYDCRJETTW2Vyo
         EdUhr6XxR7juJWbB4+n3DmNqY+23b8OQw5ERG101JbJotV6Gf1yXKTfm4LACBuTy8b+O
         3y95XO7cFFCqdKufD2xj2F7A/eHercGOv17MqXXqtMpnJj7/vF+wpyWkca7jT1yItrzb
         R10w==
X-Forwarded-Encrypted: i=1; AKwUvBwN3EDyk/g6f0oNyPIZHYhDRl/XCd4ZI0EuEbuh5uiWaxQSfF2+z+Frq4ZpUreWV7Flj3z7Q4G7/95+p50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzcgo9KAryunOSBc7m/RxG1pkwrm7bWK0s4rDLpK6uyo/wYqJw
	pTLGy266MsI+ci3bPrrbsf530nwvqoP3vmrmWhoHOSv4KHXIvqd5muvhS885cr/W62UOKGum+T0
	SMBHb+4ynXl0t+ikUinGBnBNbm/j3a30=
X-Gm-Gg: AYBFou19DdATd7bVT8UfXzhoSi0iMRZ/Xq6iWoLTDJQUG9Q5F7SJoWy53dCGA/A6mNu
	rZ7LJAhsku9vNfnjVgXKLJR5enxoYbKkz1Jms0WUM35CPOf9t+riznMXc1sUvYIkielHWqe65S5
	HBcPfAOV0UWNBPmqwx8aZrM5LCWG5+I7l5BW1kPM4ITgc1v3zqkxYfqCbzl3ceYkTsgsVfTbmSC
	NPcw42JqKupr1r/OO8jSc0aOOEgh47dHfFvM/xCB6hhXwhokLVJ51pfK2S8OtAfriuKS4Uak0j1
	w4ZpLYxl8Cok2q76JeT/iEeGlBR/Z2KiPWazXOGm05zhPx6dEpMAfFRDSXpgKhJQQT4KDGg+5D0
	YkxgLIulrOZ2L/SaJ8dmU/88=
X-Received: by 2002:a05:693c:638e:20b0:351:7bdb:6eb1 with SMTP id
 5a478bee46e88-3537e03ce72mr25493475eec.11.1792071217690; Thu, 15 Oct 2026
 06:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 16:33:25 +0300
X-Gm-Features: AclHuK-Vf3LgaGwxBoiNGM89Hp1VUWFEAhFQiO8r8Dz7zDRcZoB_S-mA-lnEEpc
Message-ID: <CAPVz0n17fZyoR+DPY2fznoFCEQbKeaH_qCSQ4j==_XefuNq5Pg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

I'll keep this in mind, thank you.
