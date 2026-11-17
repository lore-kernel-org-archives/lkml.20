Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936362;
	b=K9xNFU9mGVCYKX2QU8IpcdbPJewMWGgW010/92101YGn1L5/7tm2U03Kz8yh0k/xUP2c
	 KmGsUNMnUpGd+lrt9HHQUa00YflkJG6uOOTnfMPyTD+ULUpiI+o06Y5w1q4sy/By4DkDP
	 nQazklNACNf0K2uo0VS+YE6qY63fSaYklxnG8RX0A0kWojAt86s4xxqRE2sq7ESYagg8z
	 RpgFIeMZx+c3svAF+EheBt/nzTeOifbrltsllnm6LMMA7WJptNHxALWHGFc80s0Eee/R8
	 /akj07zy0jxACZL7N0bmSydhNABHrz/ozneid05eexDRCxV5saeQy7yH+D8YzUPxZlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
	b=KX8pzjtJAsUS5y+ayc4qwQIPIq5y5M7jmyXUmaoF9VPJ6pryZVr+cS7jvUJR/YU/SDzU
	 GUOMhSfnu3PNVL4dD5bP2EnwwW8OeobzGYMiaWXyXaO+BALFEiVtyLUDEYl91MNeR6iBQ
	 gsBEIO22E4m/pWAI8Wy5tG+tPopF+WfKqH9Rsw7z9gH/GaKzLNAOauyCMLX7HwqeOro47
	 q4c0iQaWcbqjkOWXoPYyt68XuCUBR1r9spX/Tbxja/ibrJlziZ//O2reHdphepm25O2SM
	 k6E9a0Spkq6S7kE0FwwULyULWebMzsjZ+zlpouCnuDPc+oNltkKFyNoLkODU1Y0YHZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/3ahPEi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7A606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF7A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/3ahPEi
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6aa912db07bso48019a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936360; cv=none;
        d=google.com; s=arc-20260327;
        b=eAvVzPcN70/6xlj//2YnESpajYO09gOqx2gGvxMBUUkK+DRVBa4+Fro8Iu3ZlclvIx
         u/SJWH9iG77cxsQIRG2lxgnFmUks984CFU7vRIgPqc0lntTu8xbgHF1/VsIzXCgJ4XKH
         5X0jF+8vSFWIAtz8yo6Czn78+sxjC9O1EJn/yd6216W+iNOsU26wJnuO3SdA9V3kuizJ
         ZOHcK4c9LphjLbKO8RQcLuZvtno236rHr3YUKQK1AAQFFgcgfG36lXbhhAIhUdTk8ytE
         m4NXZkz+CHvnyc7WW+Yf6lQ2QixiuavXHufsWfG+UCA762xRy95KMgogF5Cw6XYOXnyA
         oSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        fh=nWZUhKN+17FdpxB1WqDjgSzPlJUqkEYz1ant/AAgvoc=;
        b=skJ4u0FcN5fYYaBV30uUp2j5Vvhm7dQdJyi3f4eJiXnEx/P6NvoGremrFxsgf50Nb/
         HWvcfgI75DPegk6S+/C4nCJBx5I4wnRyaNSWe3K+cuSCAeqzd4/GK8kg5B42XokvtWtM
         tltlBE8G4rTMASRN3vtqLDsNxkW5ADJxN30KW0OMfQYhLJ8Rd6S9C+P6Pj4MUCcB2s2g
         z4iGi6JAFpYHTmBf9YUt1a35xM6Ak8pHWQGpP8aFF3ogjTC89K+mQcs47HiCtUyS6iBv
         LEc4GAbOKEcXXBNPHkUGM6/WI2//nZR1aN2AtNXyarHCoq9W7W49hpuUJYen8pmJTp8M
         MUCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936360; x=1795541160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=e/3ahPEi2N7JscSx7JIYQiT+8cj5RAH7fGllIp1T2Wr65wtMRkvaK66n/hFmq64URL
         ux2bNsR+X5gCZwCJpx9GcinbzAMhS4OgumXFCmkWEsYcLQC5FpFrqFwZu12Y0XhmCwrk
         /yVrqGxdQ9y+wIlV1Ib9/SXF/3g2rQIr1R5IueIPnw3bu5jitZq1QYwYIrspvLmYIFcL
         AhiV/octTxWJsSioLWxgsK/023TPSedYZvE7jBUYJbz3wVfCdwNLX6Bqd8El6H1FqWXw
         n55APV8IRc7J9ISdj3Oc7u5ujYoc+jVDlXIPqb5gR07zADC96z35PoldZygSzpKPn9OW
         3ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936360; x=1795541160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=2MQTZLx13f3nRybx8Vqe5pgtEnqrCVuZwau1MzfDgHnFGNFJFjwenZa5vk4cHxovdV
         t8KpEKPe8BjKOJ8/np4oiDMD+wIEJfcFYwCja5oXpi9/H/hj7OfbOyFvm74MnWGIa/od
         Uuuh311yQdgSt+88zVXUo4e9L3Fekm48uOy8EXJUg6uHR6qyb1aIEw2xtjP75C8Q+sWh
         RUggwx5GDH5lo73oOIOckSdhfPGOFzTuKGvihQEFZcj3ofyYRp0ae9BB65uPSPeW2SKC
         4iyW3IHkz1AnPL9snZ/1kEkNJ02jtjtm4vVjFcbMNdTbHzNXAoaY1vvdFlfZZgLdje43
         1S1g==
X-Forwarded-Encrypted: i=1; AL+hErHUubiYU0FfyPduWb0+87+t0ry9w0uwcGTnsq6tBfdOibr1sacVLKN4xf87iKPSxd1mCcBpwwqrf54iNYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+waI3iW71CXYX++DI1eHPutPKQWtrEg9EyU36yLklMJbFB8PAj
	lqUSz/tHxGrhILyKenpWEety5E/sezH+ufAn8yXkbQDoFt9C0K99uw2g5neynOAFS4yIf6rEcFM
	5dgk+qDgkbVIfxcqN7WDwZUPvuyQdKHw=
X-Gm-Gg: AYBFou2/VdJyKpo+d8GWi7OtB0341CBU/lFN0JyHxbf7m03pY4p9ahaUMESSp8zryZ2
	xyJeZznJmy53Cvbl/asKSc1Pu+C5Pve+q61DtGZ/cUSC61CpeOGmAvDyYa3m7aCFVt0qxo/8zE3
	DKOxzmEnhNCzwGrM8FYhpH8M5VTxzOyDzVJcSTBFmQgbLIAhXSaRZtpVS8eoaz7SVjLNegOMMHF
	EU8RUMAGHFleomg6IVPbW5fB4pCDmesw4ZWzMYKcp7KPYsHuaViQ2n9U2jXjTQNWWyBRxS6DyPR
	rY4h8rJWv9wQeSCqD9zyc3UVUpApEiXPYTM3+Hu71gdWiMhsnb83ulYq6dRSeZX/AZcDinGLiT+
	xDFWxuol9gD/X28zcEtEJo5x7hYv6LTtcEelS3ZfTkVpFvECnbEHMiZa98nv3vuynZDxsi2ZvMp
	y0hyXSU/wEcFI=
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c50965421ebmr1292812966b.44.1794936360337; Tue, 17 Nov 2026
 09:26:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110160554.918652-1-coiaprant@gmail.com> <20261110160554.918652-2-coiaprant@gmail.com>
 <20261116183012.11a7ba72@kernel.org> <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
 <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
In-Reply-To: <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 18 Nov 2026 01:25:47 +0800
X-Gm-Features: AclHuK_-ty3BkaDRY6TNyMVy_fEf9UBHYFECA18oX_curJlczmmtv3pUHIwGjA8
Message-ID: <CALj3r0iwtmfZAN9iS8yN9fic0Q9jVnbYP_Hz1VDheVvmh2GcrA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Fabio Baltieri <fabio.baltieri@gmail.com>, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=A5=
=E5=91=A8=E4=BA=8C 22:04=E5=86=99=E9=81=93=EF=BC=9A
>
> > I understand your concern that hiding the init inside the macro seems
> > subjective. Since you mentioned an Andrew ack is needed, and he is the
> > net PHY maintainer (who also looks after the WX driver),
>
> I don't look after the WX driver. I comment on it, as i comment on
> lots of drivers.
>
> > If Andrew also feels this doesn't belong in the core, I will drop the
> > macro entirely and switch to explicit manual initialization using
> > phy_interface_zero() in both drivers.
>
> Using phy_interface_zero() is what current code does. I would also say
> using explicate =3D {0, } is O.K, but i would not hide it in the macro.
>
>       Andrew

Hi Andrew,

Sorry for the misunderstanding, I won't make assumptions about the
maintainership next time.

Thanks for the clear guidance on the macro. I'll drop
DECLARE_PHY_INTERFACE_MASK_ZERO() entirely.

In v5, I will use the explicit initialization directly at the
declaration site in both txgbe and the XPCS driver:

    DECLARE_PHY_INTERFACE_MASK(supported_interfaces) =3D { 0 };

This removes the buggy macro from the WX driver while keeping the
initialization completely explicit and visible.

I'll send out v5 with this fix and the lore links in the cover letter.

Coia
