Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794158176;
	b=ycHG5u9sxtHrV0diHaU+KaEUXcJT4WVJUbYglC8sw2dIrEjaYWyaYHU7qm6H084c3sIg
	 FW5rvTowF6+M5jxMe1J0Wbjd6n9MnBdRnHRxsNsHqd/HcUfmrZbiNSs9/eob2KcnoX61n
	 oNtXjZUcaqJ98qvGBmz4Su06Ioa6G5/f6VGvXC5g7WZbJ5PQ8eng9CtaotFw3yKxJTIdK
	 9Mu3jXf2CCxNRL59ft+/tPsk4RAZ65eGw5cmBJRLF2Cqz5r9/pXqCUJSMRmp//HHjER/o
	 nGL7Gt7gpqY+eNIfH6bHRBwYxxtNbLWLKhtnVqJVsbsJGJclkZ6oXlBNnqSDatieOIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=elrB0jUAIbgKQ/C7FBbnNf3iANhILhG0hfcp3XkR0FQ=;
	b=T6Zz6VqH9hGab7258A8JtMJdTxt7lUWoPE96JcxHTs8cKx/z70WHrNFO+j02i7JMK/vW
	 Sw0An3Xes8A85BHQ80gScHL8a2JCUu3xRdZEiCan60Dg0NtjWn9doQqi/V/TJ3HGvHdz9
	 fM/eaGtzIpmj+Ghc6ekBqPDmXkw3wmY/U+aht/qOZlQGWDNmnjWTXLhgXLHHrRieVzPfv
	 C87sW645Skrxsmg/EMEG7dh69Qww+WOQ9AHjWiWOE6kOb4uzmUHuSDygM9/7LeIADvXyE
	 dc52yWRlt47mZxAst9A66wC1AzO7S56zXkHeg3QFwZ701N0ZhMuXGuotqsg7cmyEseQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYLXAc8y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B3606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYLXAc8y
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so362685c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794158175; cv=none;
        d=google.com; s=arc-20260327;
        b=AZnrXLaFlne+JRPOy60HAiUDsG4LIb7ZpHEs50EXgZGQqc2YlLQNUFCtfG4JNjYf9Z
         yMH/K2YqcUvimpcAASYR131viNwIoTijh3tFgq+RQLUVB8aL/AUMGNVIJzXyv91AuJKV
         Xzx0pP0jZYpGAig4p7R4fnoAR8wfOzBvsPhH6mXejGwx+Ub9ekuo1mMUFpun7sGmmWZ+
         r4rLJhCXh+ggru4pSgEetsZX/i92uOVwSGErby7+uJ4rYLARXCuRxZWKS1RCIqHVUuUw
         xgtOesuKOOVW1SNPyrkTp1nTw72ewOp3T55jxqe5anvC+UmwnY+002tg8UowSPIQFPG1
         WWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elrB0jUAIbgKQ/C7FBbnNf3iANhILhG0hfcp3XkR0FQ=;
        fh=0BzotVGZGGMQ2KnyI50sR2ZmbS0srGkmKBYlu/PUWvQ=;
        b=OnyPZ7GtDJy4Fne4tDOfbBiQ6ZopewpLgdpmbICyGhRv2Dh7OB0m1yOgEW6lIIc753
         EL5MtdZwCcX+KiluiMB1lAMd6luxsszrFYh/XrbOKOurRj+30ECtJR1Z88Zi67vX5h3u
         yVQb+mtkfaWq9rYZ/CSzxh62zu6AC5/rJ/BSy8R9RkTlambl1j+3IlbBaQx4tcxpPYXP
         XbFivU8vtpyEmqrMy5O5rnRu3DuIOW1E9m6Xkta/yvqwhH7aorLJ12qxZO0vBAfUjGpa
         DtlTYhK4ZXSOWo5+GASw6PZIrPZVQ3tEWjUj95DbpsgZcGSkPyyOfoZLQGf1vYYfFN0Q
         jh6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158175; x=1794762975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elrB0jUAIbgKQ/C7FBbnNf3iANhILhG0hfcp3XkR0FQ=;
        b=QYLXAc8yuXsOoWrvJlkiHmQWKNxQNVXqZ/9ylB/rN4Cot0HhpnCGHWRWB5TLLG6B1N
         LK0YMd5sTR68WUSj/cPopOlL9xKyKcWuNk4asxAVXIio/GPOPgY+eikT2z2ZwlleqWYc
         Nvq0DstLNjdv2JelaJNYDpJ0IKCLL08ZWNle5ZviC77x5Wr38IMh6zMPSl6XpBwARBDC
         bDMjQITwR17Rm/3cxPvhz6IsJhF2RDpMU0t0XDYChIigwm3rCSIEFbcH9xgl9A36UOCs
         zO83E+GGWC0dEm9d1f7gGoVxhSSkEjNzd+ZZDm+V0kGQr9i9AbbG3elHWqpHWrpKrlK9
         vcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158175; x=1794762975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elrB0jUAIbgKQ/C7FBbnNf3iANhILhG0hfcp3XkR0FQ=;
        b=UasohcUcFMyTlLiDw/6uvrbzpK2CZvFIyk4eAIjZ9w3x4WNqttaAqNOMM/LereI57X
         EgoBOyQ3EuYJW2G3r6lRCH5ftnwZYCVxXFDzFK75o9MHwZESzHq2Aj5ghkzYVLLSZz8T
         Pvpp+/Db8+52n5CRMll3bE3zYzBGSIlwo09qjwse9HVavMQYLDZuKMxT3x/Yp6CzAZpw
         kDXcNiga7eO/IcefEQsdXzoP17akdOBxqqR/OaUD0xexw/KYky60iCVzvHwSu0Iq7RYh
         IHOL83rrMNzKFItOd07RTnKhIDZC2oBjH3zLIphSHgqxNi1OHG9kxiR+Tbni6EdsYTV6
         cBuQ==
X-Forwarded-Encrypted: i=1; AL+hErE0E63zHyzqHyoq3vlsWRi2qKomAyv+IclpLj5hcoLxWLzsMEWFBONOQMAZqXq2bkb6xancheYK6iwgsEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TbX3t57TuSHUPFv5VBkU/3PtGlZjXX8EkuFbrluh0OfbYHYuP
	PjvampVfDJRMqRUHEiOq5ZfiS2hPfequvJ0v3EqZBMMp0EjWXq9yO/ldCR1uqIIlxaU6Fv0UiwK
	ccrhf3Pzj92ZBDvIx+h4ojNRS/cv9NFw=
X-Gm-Gg: AYBFou0DhiJQgExxvRpqSquVWfixkTXwUrRYwxL0EK1JaXjJm8CXDBWsnUO2SYtwYTD
	b1RItKIJJ47gTS5teCuX0M0m8iqn420G44QWSmvWvxpvp5CV/Sai1DNHzUiaGjJ+73BqxYV4hTi
	+Lig9shbDTxUCLxEaQZgtRjCpfdBBcYg0fHt/6bQG9f1/dDO1QJdL1vSQMH8n5dG43H8Q3+Kmce
	DRG5ug/AV7yiTjRfH0A+NVpf7w0rNMU9AmAx/CaUQnGeqVcHRMX6tRoH0vWraJ1AL96ZCgq+DIq
	LOUkY/FTzWvdAXbAwHzLoCYeHDqpoCwlGsQvx+WDwz+LxLxZC+2XL87RtK2yMJEwMRC88GEa70Y
	J+zijcQAISC8kJ3LINNPaRUPV0ryBSAlYr+tVjxG2VfOm6ef7LmAAsrh8nFrNbwvyOUY76qJKDd
	VoGWqVRENn4FSUErQ=
X-Received: by 2002:a05:693c:42c6:b0:359:8492:20ff with SMTP id
 5a478bee46e88-37254d9a084mr3476444eec.12.1794158174728; Sun, 08 Nov 2026
 09:16:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107142006.3711973-1-hj351016@gmail.com> <4d6c1da5-bb74-4fde-9cd5-9f361da26bda@sirena.org.uk>
In-Reply-To: <4d6c1da5-bb74-4fde-9cd5-9f361da26bda@sirena.org.uk>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 02:16:02 +0900
X-Gm-Features: AclHuK9i40GCpnkRR0bNNPrQH8ExOtzwwehbWdVg6Fmq930oRUagKnaGTsJ4ME0
Message-ID: <CAGr5VtOKK=FA_PJWvXr16r-RH426M7trfsXCXGNgPZ20ROYgVg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: twl6040: cancel jack-detect work on component remove
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rebased onto current ASoC and resent as v2, thanks.

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:05, M=
ark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Nov 07, 2026 at 11:20:06PM +0900, hyunjungg wrote:
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > twl6040_remove() frees the plug IRQ but does not drain the delayed
> > jack-detect work that the IRQ arms, so the work can run after the
> > component and its devm-allocated private data have been freed.
>
> This doesn't apply against current code, please check and resend.
