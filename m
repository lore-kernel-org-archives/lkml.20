Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21DF4A2618
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886408; cv=pass; b=lNqAUEimY81MUWyvqAJHpeomve/5/+FX++O25V5JuUv+ShIK80DlefhjNAsVS/MFRen/jdse24TSRnIwrEjOKnsjDl2X/fDgtYyY3FLNLx3P96jWdR7JE2ls0S9niZbHrfPHdMof0fgj4Q043AsAvSkLNxXRFjlzJOdUjW4NLyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886408; c=relaxed/simple;
	bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzPNWyvXNsWlg+A4vdXF0fgXkccRjWehEEsqr7ETFvaM8l0NhoA3o3fFT22M/cxkBx4JQlFQI3DlYxEjHScRDh3gnmNbV34cHOcBZlFNhEZuiDgSQXDokuKdBsM8epxhFDrQv9FylaCKN6bqL2ovSbYP7QzO4eEzv8dpDkMWuYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET+EdqxJ; arc=pass smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET+EdqxJ"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso2631802a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790886406; cv=none;
        d=google.com; s=arc-20260327;
        b=rUeMCfDLVhs0VE8grc6U0YY5t6K88sThfRtbz/R0oIN2VtwgPCCIPYTP46+yLqtie6
         97kvYvYMWx1536PqnOycUssb4E97Nvt66ffQQ2k5GIX30t8UqO9LxWvD5xP9ZpHy5UGE
         QDCLQVODQ4HlOzwVF7CFqJsH2sJU/oxJ/p1s8YpasfExLPvHZxz0wbxPJfZeBNTvdFje
         yb/NvCoqk8u758fFGr9IlOIU0KQcxdG64DPuGcaKAbYJdYXD5ps7zPl5BeQXNvo6ak6l
         aOs8U2SZ8WLkWKYE0H+Fgi35a2WYPEnQPOvLrPuEhM1uqrin1VDz6+z2V9js8kqG8t/5
         V8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        fh=izjdI1kjg1NpufRO56AxN4TF0oRA4MP1EXU4kYIsxYI=;
        b=ExNrh6CcyRQMG0mTPalVbBF2VqOOOjDxRSUstad2pxMyd31jI7fy2A97QsR4W47KNN
         EJTgXS6crouiyeyd3qV4EcDsyNitl9qvnQlNPQ39YZaSffR6XPaTEUO4El/QWCaX5d2r
         pI/ZzTS8tZFKbsZe/sSNqYbQ0CRKlGUFzUETjbzexNMblsTAlpL7jg1dRnpauL/1HBMN
         /IpPpchHjJNy2PDvSVwlq0QuDghIklkFYyxeLSQBBDI/c84zoO/Fbny4Ia0oAvKUzjei
         uAbTCIGQRzYmwdv3UEw7jekpCEkE5mZVyh5z711XSyqeiuEHRhJ520LL1+f8DSiTZleO
         Ybiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790886406; x=1791491206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=ET+EdqxJf28CMztfvAN+a+3CH7wRN5EmQcy57T5G0DxTItxyCpllGwLCltwDMZCSjh
         6Sfc38AfPQKzr8odbgdEr347DLQDSsTrh0ApZu3LRGeQbaavxR5pKqgHwAlx+wSCuq+/
         wP8CZH67LY4EmDMx/lAP18EswWpGPJzruOnLB/f7oSnVFdHuQDcWsdG/dg2wgNuWjdDb
         cw+FKCnDMhb+ECPLSAIyj2/WXEZG6In7gOme1fcnSAu9WmTfk12ihEgKDvsG4jsN5btX
         S9UjJxoAZy7w5AamGU/4DpHG6DY/1rHhnwTIxS8pumBkvsX/jAdf5emTr70AdmOCmXRk
         o2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886406; x=1791491206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=iceVuMxZalMxueYBqB2tSbY0qp11OmoAcRW4y2VHVqo197vYsntPk30hj6nEK7oDw1
         xKkaSgXno45pxBhZw7YeMJdOyc/nBwLSHh9Llv3Io5NPmpPxDl8GzyG0NaarO02GbfvE
         RU2PCK2yQcYMGk2H5pyjqdGsa5HIVD/KH+u7T1c0gsV+YjHkjr7pFqd6WnQcUg/emnih
         AD3M+c3/x4fWJBAUQ1nYdrs6VdyvPfwRGViVIBaFZfqfkwhC6+LIs+m/i3+7Unw0aT0q
         wSxfMLg/h+VFQdLNLv/L/95KheC64BnmSrpuSew0ZAV1vIYEZZYQ0iwYCaOOJ9iKgRv0
         khdg==
X-Forwarded-Encrypted: i=1; AKwUvBx8EMqGzouY4H4WKFUAE9C7SuHXWVBvz8SlHdDtswmkHvvzq2TfsrpiYtYn7SiwTWkpaiwUVAuwaUhw2GA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlCbn1KaeINYNDKKvfuS20/ufxhxTprgHKNvyb66ezqZF2S/yw
	vL1KlAZ094m5ADNcmuTsAtD5vX5C7LsoN66ubsGjrc0B/QYcl/cexSfd5tAJDbqz50uuc6If43M
	uyopiFlA2bq4GBCx4E62w2B/JTd4BguQ=
X-Gm-Gg: AYBFou2SeALVd2Fh0GtLO6kmlesF5hUOPWbaeWfU1NNzM5lPbQl28c6z1+D1gWGWxdT
	tpY4z/3+ypYK0oWiZtsBfTuPV5OayzSeIruY51vk7S4Q+nFz0XzRZ0nYxR/f1aBCitt51CSHvYn
	D6/pYNsqGjX/WqAk17yudjg3jYlwThOVV7ARL7sHezG4HQK7e/16S4fI7qQmgVo20HNZ8ium/w/
	pSy1AqNJvzKphozJBTibxfzRsSr0r4xGheHTaizYIgxyKahxdCZQWWIeyY2sJ9TGy3Y681Ji+Cz
	DYk77xbsgLwy/DQ2zKe6syaNZrNFavzzXl+0pqrSXA4CncxtUOW4NKINXGcJNUU6RilkHfY=
X-Received: by 2002:a17:90b:2f04:b0:39e:6c69:f46f with SMTP id
 98e67ed59e1d1-3a6ceb1b955mr639282a91.46.1790886406217; Thu, 01 Oct 2026
 13:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
 <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com> <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
In-Reply-To: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 1 Oct 2026 21:26:01 +0100
X-Gm-Features: AclHuK9su90nDg_1A2BHnYBV31GZYMfhNVL2X1sfHL0TTMmKMafI4E752265Oww
Message-ID: <CAAxh=js3PiveOSst0brWjw7q+pOXTUbKNahOUcwyEuM0oW0gpg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre, Linus,

The B288 only has IRQ banks for PB, PD, PF and PG (banks 0-3). With the
current code it would need a made-up first interrupt; with this patch it
doesn't.

Which way would you prefer for B288?

Thanks,
Pablo

On Thu, Oct 1, 2026 at 8:28=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> > So we could revert the DT patch, and take Pablo's code patch, with a
> > Fixes: tag, but that would create some broken combinations meanwhile.
>
> I see it like this was a bug in the DTS file, so this if fine as-is.
>
> > And in any case we should add a word to the binding document, to pin
> > down what's expected here.
>
> Can we enforce it with YAML constraints or is it too open-ended?
>
> Yours,
> Linus Walleij
