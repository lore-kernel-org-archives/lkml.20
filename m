Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794262072;
	b=doitAid1SYq7uqecaAA7/hDGr10Ur8TTJ/UaMxm/AfqOTrvSy+IRb3V2h7PG7BYe9G5z
	 0tly9lU+8022Ur5/XiU6g3qquonnANRKKyjIjmMGGjv0Ap/2BCDGKUILofiDUKVFy2TKD
	 FMpsfC6wmYyGxo/rwU1KE4l1E7ejS3Nj2QY9z9aOil4Us/wmTq5X3j0asI4rUgx9Mt2VT
	 qKYWKO1nx1bU0DLToeMTOVWTnGfb3BhAZRWFJJ8s7r7SjUcpnHSQcnm3p0/YpWspoa1Ep
	 URI3Zuf+3tUYnb9zFolKaKVwxs6Sz1jzmiD0Ip5aihB4TG2PMMjedVc81tVF82mw+Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
	b=2xPVeGfLjKRe08sZ8moDpzaiJWsSOPyRsvntVtWEc35pfk4CvT6NfBW88UPg6AIiQzhj
	 KiVEQBbNKk2O7nsvyDC0iB3e5g/xSUw19d+oKBIl2vUV+wU1sK35gyj0qJM1+RnmUreYJ
	 RUPcf9JGqLZhnMVpS9XPxdx7YfIx6MR711lTgXoMZHR3egi7l/TO5Ka/jBiPIPag8XEu1
	 Vd93Sxj/0cwdy/svJYLKSbd9DtGAHQSjDj5ZbxC4WElL8Yjxm1PwVPIIxZhayxq67DHqQ
	 6L2jjOGL1jIbuclMFvvzCToQ/pnCI8TpvchSkpIVDupiO43XoUizb7yyUDKTcmGwC2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=spacemachines.com;
	spf=pass smtp.mailfrom=spacemachines.com;
	dkim=pass header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BaWCv17P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F1606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1F1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BaWCv17P
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso2550996eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794262066; cv=none;
        d=google.com; s=arc-20260327;
        b=jeG/7o+/0NOy14Eed/5nejUYBPxqmOmebr4fZrpi71rPCpx4IgzNAvTGhxjuFjDPSR
         zBdk6k/BpSqvU78iYlm5Su6325iv35Kf0BU8ltz6r+9FOvlY0b6rKk2s6ddzD+XfjY5A
         X4iKMlcI/PmMzHlTzZ2ikpc8GS+TmEToR1BWJjUEeRzhIRwkYlYGJWkLfJOso9AS1dJC
         AHVCjPOsVU37jkI9oyLqmqjIStbOVni7TF1L2DfZfTf4fLZfSujvT2MBP8T6j/K/sm3C
         JDPR4V8oHXawZajmXmYXz4RhLXiQUGVaH4tPPsG2ZueveDxKU0zpV39Eqi2Lsa7Po7hB
         mwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        fh=CTWLWMeX5vf8SLW0mRrJnyT0gDOWUCBHKsFyaukRB+w=;
        b=bNYrb7ewzjBUcqLj1iRDQFtlmT20BX7/wuNNbN8uN76PhRUAAkSEOU58EaDJS8O9m3
         24PkB4GcxGfhRJmgG9TxEvMLzJuoKDJXVpVQr+S0bBkmd7YthfFwAvwLaiQQeBQiUqy0
         j29v7dUFCC2YGNuULmdPci0q/+kyzaTUlGD7rXS+s0YIsgvlac0Xy86yASQmoACi/7LE
         idYfU4f2dg/oUpn8EGECQqk32phoXkRPTTHZUkMFJoLjyFClW1bSUSl/uP0dw2HZrL25
         0kiks7hMNyxQv3sv5UYgHveZmjVh63R9/rmCCepp7vG8wYVbx3C5YgaTLAh90QGCmr0f
         42yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacemachines-com.20260707.gappssmtp.com; s=20260707; t=1794262066; x=1794866866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        b=BaWCv17PHSiTRyTlxQPASAWMJeZnaXjziuwGrHaCRLqUplR+O3Kjd9torHVzPfp+UI
         F27fPXDPMT0ZfDiQCfyyHaVBZnhJTOL+f5UKoRfCgLiketMQBubOzUgCYheQLm0DiEIZ
         0ooQfMaKuOnrI2kf0B/s6oebZTPCSw6EbpBrXQl3JUIQW1NBiVAvQoOOXtaJiAx0c3gi
         i3f7TFDaLQpscHuXusjrHwiDy1UVtthdK+fyJtyE+IcaCdO/oDUvwe0C6pNMWU0vXnay
         UUppCSBDgt1ALp3dSdpGiyRG2mf8fti5QitibXUlFb04c7/nD3OVDTMjyorP8BWCfO2u
         ot0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262066; x=1794866866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        b=a0F5lFsROV9m53CpQ4FZHCvl4mGSwIei7ASAP8xesjqz22HGgvDTiyiL/W70TxfpHu
         p6JpJ3VVjF2VPZqRXvYz9JkeAo0l2aI4sk7tBFmVj2HN7PotXdYCYMAUL4RKRUUSeGFJ
         +Uye2WHWQrElXuU2GZYjx4EA7oQHYcsyuIKHS8YT8NBmW/eik7hRyd8367YjnC9Hmpdy
         p8WD1w20sXgxvDt1NwAMIWcUyo3QkewTDz/qICxWJGUJYdBzFunqI647K5Mllm3KbeJf
         2sWNyySo4PGu0RXhYilwd7xy70hwypHONJUbr8rATfObY8UWFEP0blNZ6CV1CruJyjVw
         4mkg==
X-Forwarded-Encrypted: i=1; AL+hErFnzT9sJfw2Hk2chdswiRIkJp8bLQ6iNWv2sp4COr0818MlXPiGz3CoNhlcuZp3IgGV1T2dkj08eGLiR4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wcSf05SbpEfUAlrrhmxDBbhWLp2k6Y3X9n4XDAGkrz7qi7WhC
	hzXmgv59eLNQo4OyZJYMgARxeGRxMds1EzNf58K64du9o6HEW8+pUZg6xCjwu0d39mrEA2WqLr1
	af9ROcRm0BWBlKcYJCrmTGfhtONkoxdtaxQLZTwcnRA==
X-Gm-Gg: AYBFou0YgM0CvbodmztjEAHM/mHFGO7ayTb91em3yOR7Alen2qOmEIO+ZLd4z1cFZCY
	ihMK3h2RfZ58mezn+wCIB3E+K3aiPDybRdbP5HIZ4XsF8KIbYOaiaICcCTdhC/mk7s3nyE77tU5
	npVpCam0I7SZ90yLqMN2lT6zEThan37PUS9FAdW9ALWIQGTczsJzPSB2o31GksTkYhwt12MLToU
	oUlFtJ0pFbLQBUEzf6bbib2JO0EO7ZfFQORRgHhzNi9sdeRQBul/O848Y6En60ZSrYL01IWlCt7
	YGqYuq0UVUQ3tolX+v9MciNS9a83OZ1gR5VEdAJcQTTdXYesBrVj+EUozxbvL6MjzCbxittAeFr
	JrwmdAzFyLKnFpKKzX91WQjmdHFAFlDTz2dDWJvM1ZGfOHHFz6OJN3KISKuk=
X-Received: by 2002:a05:693c:834e:b0:35d:2633:ff79 with SMTP id
 5a478bee46e88-37520510ae6mr909969eec.40.1794262066318; Mon, 09 Nov 2026
 14:07:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-core16550-rs485-v1-0-6d15ebe1e5b9@spacemachines.com>
 <20261103-core16550-rs485-v1-1-6d15ebe1e5b9@spacemachines.com>
 <20261104-zen-aloha-35da49a7e72c@spud> <CADMKYUAc3QPCdpH8JL9VHk4d0iETsUL2ao2i4OhoHYoZGoAnnQ@mail.gmail.com>
 <20261109-sheath-companion-d7063fcbdbfa@spud>
In-Reply-To: <20261109-sheath-companion-d7063fcbdbfa@spud>
From: Kohei Otsuka <kohei@spacemachines.com>
Date: Tue, 10 Nov 2026 09:07:35 +1100
X-Gm-Features: AclHuK9l1GWI0bIlcJDD2h4RqXtEuzFkTr5VEGPfn7sQUhXhTFIqGkVSKW4Z4lQ
Message-ID: <CADMKYUBqti5CNTyR=ADwTUpKTbZLCgmDf4D3cNFrwaShsQO1fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: add Microchip Core16550
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, conor.dooley@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Nov 09, 2026 at 01:54:17PM +1100, Kohei Otsuka wrote:
> > On Thu, Nov 5, 2026 at 3:20=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Tue, Nov 03, 2026 at 11:11:31AM +1100, Kohei Otsuka wrote:
> > > > Core16550 is a 16550-compatible UART soft IP core for Microchip FPG=
As,
> > > > including the fabric of PolarFire SoC. Its registers follow the 165=
50A,
> > > > so ns16550a stays the fallback, but
> > >
> > > > it raises no interrupt on TEMT,
> > > > which the driver has to know about to support RS-485 on it.
> > >
> > > Doesn't this exclude using the fallback to ns16550a, since it require=
s
> > > specific interrupt handling?
> > >
> > Everything a plain ns16550a driver does works on
> > Core16550 including transmit, receive, FIFOs, modem control and the bau=
d rate
> > divisor. The only thing that needs the specific compatible string is
> > software RS-485
> > (em485), which waits for a TEMT interrupt the core doesn=E2=80=99t rais=
e.
> > Without the patch, RS-485 direction control is missing, but the UART
> > otherwise works. If you=E2=80=99d rather
> > not have the fallback, I can match the compatible in 8250_of directly.
>
> In my opinion, this is enough to invalidate the ns16550a fallback.


Thanks, v3 drops the fallback and matches the compatible in 8250_of.

--=20


Kohei Otsuka
Satellite Flight Software Team Lead

  koheio@spacemachines.com   spacemachines.com

 UTS Tech Lab, 36-38 Lord Street, Botany NSW 2019
