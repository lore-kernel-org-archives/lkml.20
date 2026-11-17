Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896651;
	b=yKNfIaPevAni+UzVF+0LxHAUQA3azN2LoqAg9SPWs7pr+tyuyOtp9HogCYRFKJ1CnrQ7
	 VGR/Jqh+0QzEZTT7zLWQ/g6a4lKEYK/E56pY3CQvWukNRESX9iY35KvrLntckVe3OTu1f
	 ewzCsZ01O4M7omb9q0PkYmo9BMYaPy21i3ltm09kHJwXeSB1RjcoHg1aLe3ckE0GmT1WQ
	 fFvToCVgL4cwpzXv2YR838KxsPJUY6ZMg9T6kLXByfifyhHQl5RQvlSV3gcPjKeBy01oH
	 tE7mZUMqYEHoUmBH6invcjNzfpudjtbfYQ0YKIgBhRMm8XsjCuyjbDe5VuBP5gcEAQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
	b=pXGcSTGZmNIDiqexUYbm8YddyGKKj4XAKeO5d8Dt8H5beCDGIIb6y3vaCrBukEBp/cdK
	 P5WBoWssdX4z2dnAaY5nC+qIgnbZyEigdGx5WuLhMrL7aCdnxGF824TTbOwmcAFtex89u
	 9X8wBMhPXgsJbkxCsRCkrWyfvvIPHVQHl3PQ88jpXh5kCZIBf6ZiLXSAdatvKE7J+R2dh
	 28btHoxNqU6moLPmNEK206kYauX1KVMrEkYz0ltcq0C2QdA3eLJth8yIArcuDuphkdZhg
	 8Iw2xUpdtprltTtmtvzcAI0YcBjcuHg/NMf1M/ONZCzGhYiv1X7mqExZ/zB+uNLLvuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MGOoJYc/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90607606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90607606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGOoJYc/
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c50489cdf7eso158535866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896649; cv=none;
        d=google.com; s=arc-20260327;
        b=H72EVArtLMOuFysqJOVKRmW9558yxcl7+hEdm6i2k0HByPwypWTsteKJKe6cLtsaZc
         Gc6CsqRp0zAvVHGTLC1BUo36Wn6a174f7Etfk3sEfVxncHNGXiOfA5WR7DP0ZdxoyK6e
         KbDolU+1Sk18KIxGF8er6sNuO51JmTlH4kdiH93CtmOyyqkOz6GHjlomUgK00blq5bkT
         Ftpb0JSWxhne+02MuLN7gtjUTTuSksBEm3AlOcOT081lEtPiJV66lGBe2Q0hgDz/IN5Z
         e2oRScol9W4h7ENvFflgGGmkyyufF1d2yO6OLHqWomfvYP87kRoLq1y2yWn4X9C0leKt
         JysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        fh=hJXXqN/r56UBLA44mCnZCbB70cwPSMPZemor9hTPVvc=;
        b=HI2MzbFQFl6XO0w58dh9KQ86vAUvOpWvqO66reQHuAZqX7+bdGvwkGEWScvvV7tjq1
         HjSPhfLYhM1svI4mWQLAahJSJ2v/LvtHTKaNcYd/jW0SN+wSYWo4eEibmV9m5xxuoLSr
         uxyBQ5enp1mWvs5hng93hIEazBO4SPKfzJAhiiXXghOAnAZeqbwDmM+S9YKkN1S8zL2E
         SVqf15F0rx81U9cVe+diEYmj60koH174Qx+wo/11jt2uOi0cqUlS+HZiXLii+Io2LdKh
         PSgn8HssDLyZiA5sCBYqT02t38SD1mGbWYV6OzXO3n1y7ecZsqncxSxL+Y5wcYMXuct0
         vI4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896649; x=1795501449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=MGOoJYc/vMPkJIk5+hgWI61vPC8mDN2EPmKg7a3+DdKw8J8CmAtLpBlLhYvXNoLYNQ
         wcceMykdIvsbZ3xU8KwTyHb2jj2CPbE5tRRKMTvKPFSHUkjYE9sBvRf9Q/phY6yXdvMU
         LwePJR15bLB+OUdBbZ/a4zXsQUO0A6R2ZKA47fJheUhzPw8tkqQRw6VC5CmkDGtywVvK
         tx2byuS8jFwYvEu1YS6f7SojUXBTmI/MOlDp2hY78Yw9oqqLXvQpXP0AgAN0Q/eD5790
         a2US/5FXUoW7jbW9wuZyAYaDpKecZOWv0Y6YXuluWv7VRB4QorkS/K2McQ/qVT6AzFss
         fExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896649; x=1795501449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=zGABVgxlllV5Y+Wdt0NAAgeibwarevv5okw59fsq7JDi2XsevmOiY1P27jyZDFHUH5
         9NRlhWvKxvKbr4NeImlz7m2QqafBxULwUlS7fD+ZeorbMr+oczgapeiAXDMXCo5yQ4lv
         xZyVd0GvCZSeodob4gEzu4h4bJ962DtW/4G3olCNpOqiNtbGyL7a0fu9MKidXugBAKBb
         sfmgDK1okq4Q5V9NynAJfnw2VWHGRgnqmLllgUdAyB4Z090qcZmOMKYiSuINbxMrwhNx
         sf+VygmO7pijtmG/XTTFjN1io2j1JiSXWoIDJh8aJ1CfpnxkQJR6vImPdeoXN4tpf7yR
         I8wg==
X-Forwarded-Encrypted: i=1; AL+hErFHa9uive9/mn3OfDyEwLS0gqZFtbX1OaSavV97sYbgJ4VdGqHfMYaeXnMP810b6Pel3bBrwaI3XmUMKyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E9SS8o8wuVo4tsHIFBuxFKJc18K+sG86vj4p1hz94DbDDQeRU
	ko9OQDwFh61Jq0G8EA458lVKgdGHCNnK8OyIPCrTuFOhKLGwgItXOfmOBqDrEvh7Bpt6uUwWmzp
	wg7p3v5beF01NX3gAYZsZe7+EhsY/AmM=
X-Gm-Gg: AYBFou3ud1tAmt1hwiPyd2npldX6ukz/ufIokQsI0Np9FFFjnmnE8SVKGFAtVqzZDdI
	YgxExdsABZquLXdlI83Qy0P41h4fC+BfO2LtcJm6ErfmP4hKQxLUUdQe6jVPWnJzHMc7yIZahwE
	HwFxpq9ikKZO7soScZ/zJ2DGqrGrK0TCNa6F8AhOd53mzNby65tFtKgdQ8tPEZNXElo6NF6Kvs6
	uZ3OXcgkzo+wkCRleDWhiA+8gmcEF2tt3ABd443LS3TLW1hEtjL6wzgwp7eshHgecC4ICzkKECF
	vgFOejjRNPLUq4/Mh22RFTQ3V1ICUa8uxpXk82qHSSAN7/DEM1V5bJejn6ma+hSI5y79afOl30B
	Ib92yMfkNSxPQpfK8y2hnhXVoGP3HB1rBeQO5MFkLWaZuHqv1tgLM/Ex9RVCVgQ3wYNoCwAVMKJ
	RSyTmVvfdzDkk=
X-Received: by 2002:a17:907:7ba3:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c509636a832mr966830466b.23.1794896648621; Mon, 16 Nov 2026
 22:24:08 -0800 (PST)
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
 <20261116183012.11a7ba72@kernel.org>
In-Reply-To: <20261116183012.11a7ba72@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 17 Nov 2026 14:23:56 +0800
X-Gm-Features: AclHuK_nLO104gw1yCZjvRwQLJzYX6sO8gDm56OtDyoqEcCmc11J_KEsaJmWM1U
Message-ID: <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Heiko Stuebner <heiko@sntech.de>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=8C 10:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 11 Nov 2026 00:05:53 +0800 Coia Prant wrote:
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -159,6 +159,9 @@ typedef enum {
> >  #define DECLARE_PHY_INTERFACE_MASK(name) \
> >       DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
> >
> > +#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
> > +     DECLARE_PHY_INTERFACE_MASK(name) =3D { 0, }
>
> I wonder who suggested this, hiding the init inside the macro seems
> a bit subjective. I see no such defines today. We'll need an Andrew
> ack for sure.
>
> Please try to add lore links to previous versions of the patchset
> in the cover letter.

Hi Jakub,

Thanks for the review.

The macro was originally introduced locally in the Wangxun (txgbe)
driver (commit 47f848aac4e7) to handle the uninitialized stack variable.
However, their local version incorrectly uses PHY_INTERFACE_MODE_MAX as
the array length instead of BITS_TO_LONGS(), which allocates far more
stack space than necessary.

I was just trying to fix that bug and move it to the core header so
both txgbe and XPCS can use a properly sized, zero-initialized bitmap.

I understand your concern that hiding the init inside the macro seems
subjective. Since you mentioned an Andrew ack is needed, and he is the
net PHY maintainer (who also looks after the WX driver), I'll keep it
as-is for now so he can review it in context.

If Andrew also feels this doesn't belong in the core, I will drop the
macro entirely and switch to explicit manual initialization using
phy_interface_zero() in both drivers.

I'll also make sure to add the lore links to the cover letter in the
next version.


Coia
