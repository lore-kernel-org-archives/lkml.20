Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416101;
	b=wjgRelTQrdLvcGuL/4f4ikSiO1s+TkmfK60LxEFuY30dRcxb+xzkHHp7AOSYp/CDpkKA
	 7ZE9rfJzxq8CibK/0TeFybAcAnmIhSVGjM2ramBesE8eDeiE1UTT+kBE/ATwsApKxPiFY
	 J1P3wcFm4fBuJa7WOztgCHAOuzjwLeZ3UuGElUg2QlICJW/KCbMP1rsCYsqzOQnBtX9mZ
	 AndvzEFyTed0OyrmEcdhW9ZAIuSL1Z9CS8qDWTiO7E+tfZK/Kt0QeiCV1st8o1BcROh9O
	 K4GbFQpBpLWe6IdaSgQio5TqaUEQ9oAkvz2asM5rZb4PM01bDkZAyQ1kA8rmxsIgwrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QxBjYodSWQbPceJSRF8tQfkfunks+Jqd+U78AusPnM=;
	b=aWbSB/M2f4/6K9n+pmqL76I6S+VZy5GZnhZf3beNKxAyWMYuMmn1351TRwO8mV88oF1P
	 a4snY7yfYee0ZTk5MyAyuFNWplQ2UfMPJxNaQrugbmzSDp1Za8Jd7RWkjRHALknOkyjGZ
	 ps0m4d2OJm0oyJTFisUg0nLp9Z8D2am5iFFXGpqPmMaAE75DTx7WG4AtvKVTSjLlrsTm7
	 lPNsQDc52rIMdO9hMnCQxJgFq9z8k0eApgy/7WXdvqGjfqamjNKkkd4d9R3RyBnKWRnxD
	 y/6iS/Ca5SU+VApRCdbB7q8kUoRE+SfJWHcuA2gLdQE0PNxxn5k1hYV+skx7+KLIOwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RA+sU1bI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2D606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF2D606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RA+sU1bI
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4adf4431ca0so914450fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416100; cv=none;
        d=google.com; s=arc-20260327;
        b=VqKGLoO+1rStR2pHa7z2QXHUvclY/E/7n4S0TkMgOfQUSxbTWKVIo5G042wkeoMZ4P
         0ogsYzJ71Am/FmdIMS/YKaUk+A9r592S5e4ne1opOSiInGl14vjEsMUvJXTzB7RIP1ha
         fo6myKZGzJ9R+eBSMPbyUq7xW2p0keDsSo0j04U1MjlyTwXT99NXQiJ76NSSrarz1Byy
         qS6rEIBtlNCX3/IhS6w8BIpewoumdRhYQOqZdmzk18FMKvk7jllWzGCMdCJa68T1MkwP
         4I/AMOVg7ip848izUBnwGFoWZuX80MvNbFBunYdIqckTqbN6kGHYo6QTRBSWSuqrxEEW
         zVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QxBjYodSWQbPceJSRF8tQfkfunks+Jqd+U78AusPnM=;
        fh=Mwele3s4pEG/7+KbQk4Xhu9PkaIy+MI4zZhIu2x9BnA=;
        b=FSyc8KDo1xh39eu0dYKIlBBdsue4eai0R/g5IJBNiFPgJ0Qb5ExBqnbEl+TCqZW4kw
         CleiZTQC+rlKc2SdeMtXzzVJqBBaq3YywkgIv9HzvX7DqDxXUsPjj1CUDVRN9hQszs1R
         K4kRADHhoGjwtkfGA/KzMZpyQktqvZL2fP6OSL/0I0T/r0IrwoA/85M2aGcTrMCidome
         r++IIZJof9Dqj2AuJnVvXOgTfPoZl4lYvs0txSBx2xA1ARDj+ie2okcSY4n3Si4y3mcm
         3K2c/QBx+dQvjXdHssv6znYizWovMDbJNk4LkKNq4Vb8/DHpyOXGAadjype8KiawYliD
         9Bbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416100; x=1795020900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QxBjYodSWQbPceJSRF8tQfkfunks+Jqd+U78AusPnM=;
        b=RA+sU1bIUDvshTpRKODFdeFRJL0qZJmbAe0uTQncFme/lg4+zVg7OYvEtId2VPYApe
         SX/RCISn/U8/RN+iqlaOr8C1l/66ofh/EHsZgpt7EeIeMsfagnrpB1dDEjnSK03YWtvT
         3aDiJS1o5vR5swCyI0SV5Kc871XyejlbjOgI0DFKEv3uKmROWnRulHfvnbhHDnAExUnm
         aTVlf4wUGYPZqbB7MCJij3w7mERaNCY8L+voE1uetX13GQtu+rfos0vRXuBZAwcWkOns
         qJs7Axj/nwrF++BAYIZ+zubKqRLRXgzTkfR+RAjdikkzNXq73R4JIb4K3vxd3wuHL1Q/
         Cntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416100; x=1795020900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QxBjYodSWQbPceJSRF8tQfkfunks+Jqd+U78AusPnM=;
        b=ePeRjSg5ZTMsjkcq3VhMKbgg0FDpOAQbJk+VZQfYvIv4Hg0u8AV0lR+oxdH6ABuyuX
         X/tAH6kAo08H2cuaz6jEKlR4yXL4rynMgbnvJWrOhYEKj1U5ljeJRvLyOdo2MwypOzf5
         edzAnIaFafH/1h1aPbSCRlkr865ps1tu8RcMAO8Gtz0KmX37YhK5viqPO0jsxRI6SRfN
         EFJ//tvrNTWUF0XuLWuml3Kdq1j0+8C50CQ9b12OemlYK/Sil/tzddr1b4upf+mklRhS
         jGICtkoSDdp5M2gSpfFlgdmm844iy4PM4W83lR6hmR+cAojWpZVAYKgIb7gm2sUXMFWy
         H88A==
X-Forwarded-Encrypted: i=1; AL+hErFOijbJt2SDxaXyQXQBgzCfIpI5Gf/0LKedowRsfetJNJahqcAyYPX86IYQmBnKe0IO5sj05C5IQD8K49Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xQaGaqaVkv4B38ta/UOj836K+XpcuaUEOoBULXrZRZ0m7VuIS
	wQ671cv00EQSTAiwhQRNWxsZ/KrstR15EOdJ51lL/vmdEbBClBfvZe2bvEAEUHAHfKMzpt9qriB
	S6ydteHtdmPvu6gef2DIVK/SWX7QXVgg=
X-Gm-Gg: AYBFou3Bnqr6nvK2M9HW51UVl1mUFqOHYcRgTK/setWbYfWBBFTKryhNC6/hEvAocIJ
	wymF/76ZvFE0GFo6u+TybPI4HE/3JrKEoS/0j3hj6JsJFm5WxGf9eALaMtsl/diJt78oWhp1d97
	EQ1pC9WntGHlGESoLsRmVXCAlsEuqExinNLdCm/h5cjsmAY58iyAHpXphanO3yiRzQ9fA02Axq4
	5LTpRlupobCwyODC+aSlkX4dek3MRgjzAN+qrd2qxyTpWkgfMJpqAd/FsBAsv4k27p2n43HICTE
	6UARvDMhNkZoqldLUELPcTZ5LD3QyhE1fOGbU3a5igg6aJ80H7+s5MGobgHWgyCbfA78T1bthpU
	zL/cwLu0bBO0Frr93wAuAULE0MwTa/N/KFEo4bXfr0Wvl8Z2JVXSw4kjPKVbwgW7duTqvnpE=
X-Received: by 2002:a05:6808:30a4:b0:53a:3533:10d7 with SMTP id
 5614622812f47-56b96298e4bmr2580318b6e.14.1794416100173; Wed, 11 Nov 2026
 08:55:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105031442.4164960-1-kyle.switch@motor-comm.com> <20261105031442.4164960-4-kyle.switch@motor-comm.com>
In-Reply-To: <20261105031442.4164960-4-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 12 Nov 2026 00:54:23 +0800
X-Gm-Features: AclHuK-U4mMKhwssiW9rHnMWYquQbzYY1D7gCMxyTnRq5E0ycN8owzUXZceUdYg
Message-ID: <CAAXyoMOTWjCHNQ6tV-KF2=DaOpXVAbX795hWA7Q5dUQxwH=i7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v17 3/5] net: dsa: motorcomm: use fixed-width
 GENMASK_U*() helpers
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:14=E2=80=AFAM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c
> @@ -2285,7 +2285,7 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv=
 *priv)
>         if (res)
>                 return res;
>
> -       ctrl =3D GENMASK(10, 0);
> +       ctrl =3D GENMASK_U32(10, 0);
>         res =3D yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
>         if (res)
>                 return res;

Just removing this line of change will work.
