Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794275714;
	b=reaLs8wjL+jXqqt8l1fy2+zEqINcaYfgv2GYAo5Rn63S+/FSmnIfEJv6PxhYJ4xlPLY7
	 sHfvZbQsMwUvJQYBqn+NpHprmduvubUUMmhL8LnI6RXDA13kv2nDQBVRw//m/hjXBAKDz
	 UjwtqgmCnVeKFzyFqViBpaP9Ltq/VFCCktCLkL59EUVFuAQKv2VzIqYIqRjDfIvP9Lnte
	 OEGR2vazxDnFHMLhJ+kmTIpC8T/RvlguS3yiMDSfbjlgdEB9fGZ9pyc4cox8oWEQu1mPZ
	 wzfhzHMFKxgy1Q6iPNI2zgK/T0NMcGdRUNHmtqEikZ4yJYdiKvzMpfbU9t9nB+McGsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G5v/GahrKojuLMd/w2vG8qQQPrMEg6DWG54+887I7N8=;
	b=path7aM2ed7Kg7x/hayZUTuFkg/zpIK0tCEXoU9B6JAqFuGJ1xv1tPZCXRZ+5a/ytN6A
	 U2/L9mEaNueUjx1HswJAaD61D2OFeuZqMx4r0Xv7Nho6Sm8jo4Z/P9Tw5qliFhhUU5JRb
	 5PK4l0ArlubT6ynCKqnzbErreYUn9ItW9wIu9Hlvn8E+2dGTG1Fm+ZKlkSakEwd+PyoWL
	 K4/3v32zzLm4AjxRAkovhBU7POk7e+PEVEsu6BFEdMZeuRrE+ovuNaUoykTnI1Yrkkio5
	 +YueA4zX7Z28RtjCbXaeK0JF8Eb5+vIzrcVIM5sWU5kffi1035Fx3UxVCCipwHyF5fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjxwd7ZL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D683606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D683606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjxwd7ZL
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3aae7df0971so16625751fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794275712; cv=none;
        d=google.com; s=arc-20260327;
        b=rpdEP23cq+MJEH19CTnkxZIinjyD6R8rkPd9wqQTnPoJRnHsG/FwyrUOTbmw8H6gcX
         GkMU12xxAXx9ezRsFbetyDoaqgdpykcutRbjHR5iq/j+WXl2olnI1/SuoL55ROirNKQf
         CAggNxUOc7pYnMHzuJ/ZXO2XC6Wy3rpzq2HhPfNE/PbwBVBQXmOuxfjJdFkxnybhwKXl
         zAPf1Pc1LVrS+yzWkO8XrF+ZqFzFY+Hl9ODIov0j0M90PIjQ9AvRRHdPWM9dKjYykI5t
         bLPnzFtez90R75T+5MvmCfGEaLuz6z40DwSxDWC7W/dV/rsLn1pSGSGn1s2xTDSiTBGN
         m4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5v/GahrKojuLMd/w2vG8qQQPrMEg6DWG54+887I7N8=;
        fh=k+KmQxhLKdrSQOxCMukTo+3YNqLHK5daoMHysdQV71s=;
        b=RYdMFQV8lkqrKI9flb09NzoDjy7pEOVHpPcOLQLzJPcTRudAKFFeo4OUPahBr0i4OB
         5me0OGSzcER2ZBXg04uspsQA5NKX0MO03Xv2cFMqDbokxU1FvH9Co3VxEG8PBFyEOKSJ
         YDXPahvk3DkBc/Ug2MFsuV1+cdlAWQ1pE8ledjWzcX2/rePEsn06iaEjZo2Hv1USVnRe
         iWqvLi/CCYCX9WHG6J8IGDtDnwX1/eDyM+9oCP/L9TQP3P6DffMfYuT4ai88UiuPND+u
         VXqF6+PqQtIOpXaXnC3jbzYmISzf7fc0qc6DkuqL6wSalaMxATgI0fIxxB3C7g5BkqvT
         Vwmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275712; x=1794880512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5v/GahrKojuLMd/w2vG8qQQPrMEg6DWG54+887I7N8=;
        b=cjxwd7ZLUIaX1vvHjZoJGgAxrKLIQl537Rh1UA6WuDP3Dxn6nAC7/9TOEQSOc2KSaS
         kV5GonmJ8K+DQmp7ZeTJFTr4XUi3N0Mvy2IToRxAvz4CeaLNEN7dN8wB/pyq8MrnHq8I
         c1x9RMqVsdaEGBKXKwtIqT/ISweCOf6qN+NIlvQo+yIRR7poQ1rqRAxiBd1SepBVHTMU
         zk3azEzOPK6W6ck6AyaTrvT5pEB9VEg/i3Um1on4aymU63ayhhzUN6BYGJG2XrTRTeWD
         n55V6iTUkc9sOFs/mvWXqx4cTubELHbhTrJbnaHsYI81yFyLgMBsZil+As+/deTZYY+z
         TKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275712; x=1794880512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5v/GahrKojuLMd/w2vG8qQQPrMEg6DWG54+887I7N8=;
        b=J0LMravUOzUis3A1M5w519FfRKcS7xG5vlUo1Uqxbf95AkChd2XZYO8u04LwpLLs74
         OVkyBTwqeRp/+fMBNVKoee9VWw4jBzqMrYbS4wSzerYDZyzZ1t6JAtF3tNUgO9iqSXMb
         6SNR/ZZEj4FfE00HF/ufjWHoenvLLq1mKGt04ga5jGc2CqpjykMoFT6tqqnLOR6mmrZg
         R93WPS5h71jOJV8NlWGtQuVzTGPX15+96lX3FA3x1jvIRGuaMIWWX1+0bxsEzt8SsGuE
         wNK664ZKYe6s4dv7Uibpxf5fF7N+aNK+AbVgE03sdsYdnBuX86B0HviId/l09/fryfe1
         5W8g==
X-Forwarded-Encrypted: i=1; AL+hErEIp5Gkfn/skEkNd1jPi947Jqo4b5LfPvd/4/cZHysq4KlXExWQ2koQoV5pXnotHmYGPWca11UjRQ4AZCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B03Yh0WEKe49BrqIYFeOjU3ML1uHhMusody5VDHi39M2pxcTu
	HPpGs5uw2fLCs063pw+VawQ7BM56ZQKHkbB/Z207iaqwGDpRvxdU3XM0tUxdxzRgxBcdNaX2Lvj
	jboUuQYYhZmIGgxOuI86qanyDrqp6Kfw=
X-Gm-Gg: AYBFou1TlEms+uxUI6CqfGCBfJmVbGENT8iwTT8bQnUfehLqmvU8sBzYAw8BMUcRsqv
	qDZb7qXGo+atyAS+RRiiEb5yzQdfZDimN3235Ns2WZTy8XrFNUbCENwbfPj+4U0F7Mzqzva4Zva
	b6LRYBuCf3/+oOClwhoTb/g31i18Ny7dNKgQLekArvOlaEWOnHFY44zF799purWVRDWdTAZiSv4
	Dzhcke3U9B7qsnLzxzy+6PebjiNahZ59282+31pHONImmoMvh6PkmYHqYjUMnRHrTj5LkLM1hFb
	y4ZIuQ9FdQi0YKkUaFlZ70Q+P13fLoVm4nNzJV4ezRqmZDqB0MdYcYqh5fqJhKlKg11XDxGMHP9
	MpPAp9sYbNvh+IwR+qjWgNminFwyBFfdXPQXb5BXCE7MJG7c8E4H+ASkn5E/zzMVa5mi7zrMI5G
	4ChlDvp4bcpiCIGYPf/8FIb92Tv/L9/5sieyfEPv2XOpYMY+fos1zehBgE2Y2kR+Jv/mzvCbYJ4
	w==
X-Received: by 2002:a2e:b8c2:0:b0:3ac:4254:fcb1 with SMTP id
 38308e7fff4ca-3ae09633214mr1864321fa.19.1794275712122; Mon, 09 Nov 2026
 17:55:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 9 Nov 2026 20:55:00 -0500
X-Gm-Features: AclHuK9XZ_iCium8ga9JJqtZmOHBmRJQJF3JqmfXysKknLs9C_kzNDlkn5w123A
Message-ID: <CAEdQ38F7kRjLJE_yZe2r+6U8W5PAs0xB+0-AkXAGdy4LHWyGwA@mail.gmail.com>
Subject: Re: [PATCH 0/8] powerpc/perf: mpc7450: Event fixes, SIAR sampling and
 sysfs event names
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:47=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
> Tested on an iMac G4 (MPC7448).  The 7448 has no L3, so patch 5 and the
> L3 half of patch 8 are untested.

I should probably mention that it's an iMac G4 with an upgraded CPU:
https://mattst88.com/computers/imacg4/
