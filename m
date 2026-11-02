Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.228.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793639882;
	b=OpXyvn5s4n/kblNgNs94vpver6ebegAZg2ZiWOAVnnWrN0qXCtl7hFWwNhpsRwcQ4r2R
	 PEoxyBlE6q6p338SJc6vP6aEWXr36DNXJPHdDNj6jQ1zgP0Rmr4KNf3wdENnvkHNTgNcX
	 eWRTLodp7CFC/ZuRsk85mQNRFcxgVfKlA7dt9kCxRC5UDG6TPnt9/kBQhOwvknLVgWh69
	 vOT72jP0tbt7+CxXVYIhql6O6G4OiJLUc9nSYXMiz6LfVP+GmY6icEv143xk/XmyutyEy
	 IzHHAObj3GQ1k9bt52AR5o1UqzF/dy67FSsLnB3uW17H/3bzmxbQoIlcKHDvY8q/1mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
	b=xvTbZPH2E9jWfRDFIyCAghlbxoVyZdn5RrzclZE/tuOqhY0sSw4UoOoIkkbfPYF/ugpK
	 FjIH5LrOam5RHwXjpCDkJzQN+6VZv0hNDbX1iYaiEXEOthQPsB2bFmywm0dhsU9oZ+D1G
	 zG3w6boh9amxo8Mw9wcymDlMvYR7D2raKdBIZtnedQunA/+m0PISedCVF5oCeAjfJtl7r
	 irD3iZremDx8hQv4lBHuoF31YwJ9iwx3BW3rOp2WvNYt+FU94r5wUh0SeGIukqVaoDSAE
	 BtY4/zJ2wqLjkHY8Fv3OTMUO/Wio5wGqKQx+DUO//CqeMgwZLwUxE/XYJB2fdyaQzPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S8/xtf5n";
	arc=fail smtp.remote-ip=74.125.228.133
Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40E606A927
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B40E606A927
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8/xtf5n
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c46872a230eso218548166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639880; cv=none;
        d=google.com; s=arc-20260327;
        b=Rtr+KC5oIZi/rkh9JvGD5PQew/S5f3ULZSOmeNVdeqcn7DXaeuKmUjrZ8CipBRBJz7
         rA1sSZpRdJoXymxGRUU5hUc8/qSgktYtLIEl7j2uwvfii0RwFFCYAbU2EJCj9W2keyO4
         WBbiFaxzOZm8fmGLxioVfVH/4zhC5DZ+I0juNGW1EwGscHpZkZVUGO8cXvzrcufQrcch
         gEQ8KH3m5j+9ZWo1rznV6TF8rZ0FBq5MG7gp4IAYodXGxAREX456M6fNl93yO03FAACx
         A6QoB9jcpP/UkgL1uurU3+zTXLZO77VE+4Ug6H2emitjLrPr1EDdEfb0RLG+GQXKFvjE
         EahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        fh=0o+nT7uhOgQUvtPT6U1fLES4LoQ6HdZP1CrgxUT6V0E=;
        b=Tx7QfD5d9+MLnJRh4ijDCFXnQBgpiBgvZZl9Kq0k3UbS7c9lxx1LnQNafNZVSXRn70
         8CWA52BHb11uSjL0UU/XA+PO5AhVsH70q1HzvFoCrGAnwF92r8E+E/uWgq7LnHcF8uW1
         D70SoDy+o96QlnPFjKJJlm25Eu0PHSxWpHWfD2tE22SZn1SZX0QaDDDNQW3SIoy+h7DF
         hSRdcY+DEkD/DeMffvW2MGWkpjUSqjSkYoPKgbXbqZ+mpqbMl78LP5ADp2t7C1sgC25/
         U3Z80wayXy8g2+SJVc5FaIFNzkTpt4SgP/67a2dxnrGs0mHbtAlBKz0BqRPGheFKJDyo
         jX/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639880; x=1794244680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=S8/xtf5nI5XN+mtMXHEz1LgQElLtNOZC7vS3uIfQSWokf330we3vOZMQM3xeimF24A
         L8D2XJAqKIbQWbSXNbO5m10DXFZkkB3RqeZvytKJFR9BFHwTVKQWI21L5gFWqxEZIQxJ
         6gdPX43XHVtYTmQwtkCSC8t9g3zDCugDMTn9/07hXGXGiaqJOqGDkjGL+3vlLvUX4r2R
         9l9ulrjadXo2YAw2bf06JBvrDtSF56w8y7fio/f03UtBcCUjCvXX7qdb0iy/4yE1TXZ8
         zkBTI7KBoiL+oC1aKqtBsSiTjCgzxF6m4n4cJkrbenYuuPeNWG5DAA7hXBHmSgf/8nDy
         6Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639880; x=1794244680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=CkUN5W24z9xu6JxX0jEl3CjFxLhpbBnq7d4T5E8TePKaxo6yTF3tjgIL0745NyOWUm
         0kCSDAfVNsyuGwHjzFhicMW4GhVlq+vAxIBOWJlqmRfFlsqWObiGuWkl1C2JCDSDLL2n
         aMFTG7NOp7LtOWgkYYNJriE0WSMK0bYRk+QvEOwkva2LHdHRjoDUU/0it3m2vroxKdfu
         hWxZHg+/l11vw2eXxyVWU6mWdPwBfx+4iX37hPSYuWTmyDEmkAnPXG1hcban1GuWJ+IT
         7y0xgXcJ1Uk0+Fc7rLrbXr7rDNbDA++s8LSYBcnn7sdn5M0PvZg4vBq5Vy075QF18wFh
         fLNw==
X-Forwarded-Encrypted: i=1; AKwUvBxmyKYNDkKSH1oOR1+JY5BXoSUlnxk6QuK2zy/Kme2Xqk9FK7I3R0gEZt6jtd9we/gFncqlaWlM2QCcx5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xOO3lobJIeP9bVoCf2rlkvQkFUKmlp/FnRX0WMo6DyFdHJmtI
	fz1j1CknU30hV8Vja5G8H1wrJxcl5aJ4++YJsSs9T1NoBf0Qu+oCmSCYMIOLI8DhLtI2ffbl5Fd
	DNLepmCf/rNAPeEvYTr2aJJrUSLnwF3ECJUy1rAk=
X-Gm-Gg: AYBFou2DbFU2oMj5Vr/HaYRqS0T4nKwFeuwJLLoZJ+5wW/O6PblO51bxwuQSmRyhXsq
	mzRml2AS9o/K5wvNmHZG8uJNJ5lPySWAqD+/KnAcPwZA86fK+vmWElk1nGMdQ9w+SfZIF1O6VAP
	JjEVyUMbFUt5nY2gzAW91VbkqfSyZGXt15oODPvWbIXLgyUThOLw0IgE3+6cFW4oboBd5sO6lHk
	dnWmbH6I27YTWSxX8OmfDr4ywhfFUQfWx+DdFtxEVni1zMXUG+bZTnD13rrcARQkl6RuOJ94DPX
	IrHEu0iUyPgU13yHw+AIdEbh1vGe/TJBHqrk5/pq6saoG/nkbZ+pOWqoG0dNtT2bDNcozEeAfEU
	lNIOr+F+nWPa++h8Kidg9+4eBfAOn5CK23gLS3Gw=
X-Received: by 2002:a17:906:7309:b0:c41:c718:f5c5 with SMTP id
 a640c23a62f3a-c4ca7a15633mr908428966b.13.1793639880351; Mon, 02 Nov 2026
 09:18:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101192807.897562-6-coiaprant@gmail.com> <20261102115001.1820171-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261102115001.1820171-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 3 Nov 2026 01:17:48 +0800
X-Gm-Features: AclHuK-cq2cybZ_qtRU2eWVJYfCWRlRj-h4oQeg1rwA7i6-MdCUq3glp_F28zcs
Message-ID: <CALj3r0hU-n_c0QSw8frG3j0bHenDa35-c=WbnYU5QTGS8rOZsQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat
 in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=882=E6=97=A5=
=E5=91=A8=E4=B8=80 19:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > +     /* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
> > +     vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {
>
> This is incorrect from the schematic:
>
> VBAT -> 5V_BOOST / 5V_OUT regulator
>                  |
> Boost_EN ---------
>
> 5V_OUT -----
>             |-> VCC5V0_USB30_OTG0 -> USB3 VBUS
> VCCIN_5V ---            |
>                         |
> USB_HOST_PWREN_H -------
>
> So you should modify the vin-supply of vcc5v0_usb30_otg0.
>
> > +             regulator-name =3D "vcc5v0_boost";
>
> vcc5v_boost
>
> > +             vin-supply =3D <&vcc5v0_usb30_otg0>;
> > +     };
>
> vccin_5v: vbat: regulator-vccin-5v {
> vin-supply =3D <&vbat>;
>
> > +             vcc5v0_boost_en: vcc5v0-boost-en {
>
> boost_en

Hi,

Thanks for the schematic pointers. While reworking the USB power path, I
also noticed an issue with the modem power supply.

For the USB fix, I've reworked it according to the schematic:
- Added a `vbat` fixed-regulator node.
- Added `5v_boost` (VBAT -> 5V_BOOST via U16 and BOOST_EN).
- Added `5v_out` to represent the OR-ed 5V_OUT rail (Boost via D5002 +
VCCIN_5V via D16).
- Changed `vcc5v0_usb30_otg0` (USB VBUS load switch) to use `5v_out`
as its `vin-supply`.

For the modem, the `vcc3v4_rf` regulator was incorrectly supplied by
`vccin_5v`, which means the M.2 B-Key modem would lose power in
battery mode. The schematic shows it is actually derived from
`vcc_syson` via a ferrite bead (B1). I've changed its `vin-supply` to
`<&vcc_syson>`.

I'll send out a v2 with both fixes shortly.

Thanks,
Coia
