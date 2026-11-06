Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793999328;
	b=u44cV39mPpjfgl9PMEawBoLFMcZX4Yd4W97rLjJ1a3bhxdulg9HNT/Yjr6J7CZA0DHz7
	 GYP/5q6EP4c62Zm0IkWAa4LHKsPz6PnOC4pX0+K+/s4kHWun8nUuxmhy/Rz89FNG6v2kW
	 H7qpO/sj02G5xU7Ob/O2omkjC5oZAhPiCaW3ElgHcB1ZgDVWUrOS8NydpFWomogLMu/94
	 G8Xim6BXJtzELJ4415zMvxcaizQOOcSDGSGHUSZ7bDwxAA/W7muF95z3xTa9Ft3r1KsMH
	 WBQLS+JK83+bQy8UJqnvJdw85kny/3V9RYkJgF9ehECmGeyvM+AS1mbase6eW0EgSoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
	b=oLKzwObq1sBIII4jayDfyPKf4J8VrY/7bvacEozcWYRlRSl1IWdrEKFmjDRIkfkzyuVO
	 /awQSPAShBQnb31ApfWaCcW9vh06ynJwZRV8PFdPHjYS6lEDWYczSWzmSdfKtsd0zQnWj
	 ITFSCMaLJRN+u84yqr3aXpdy1cJcgnKTjnPt6MA+geUPyraL2IX3wsb2o5+CQAdZ2iY+L
	 FtjQIx6JVbhI+zzV1CypyvIqhk+nxtvy/gxPJgf4Bi66gzpqajOaPLs7sIEDKZeTgFmTl
	 PMEUqHSY1CvqyzYJZW31ym97LTJYoRZ00YVHIWaYUprWtbDzap/8RxVmORj5rJx2U2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eu4Vzyz3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC8B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eu4Vzyz3
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d1b35dc42so15023066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793999326; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7GTFPIMFnyUd3FoY7W8TuefyRRYwQF70LIR3/xCoiZQzdAf8HM3g0ZT6/ZxED3nb+
         kujJINfTj2eJG5LCj+qDgfRCftnZgcJdQmD/tbWKzyh6RPg6ns4BVqvMI/cYrUMUfJu8
         5nADua8nyfXZXuG+po3XxNNIh8PQUhRrIVbt3cxiq89CHgE6a6Az2Ey+bhLl+54j8Zv/
         Dwhx8m9KW7jxf2WliVcJaJKV394RxdYd/okZ4REniXDEUaU86v5UxAhxcGpCCN4xk/QO
         SdNmhGy+QWQp1CJiooW84N+FVAZLIEpY/es5CvIk+ROaaVls5D7ocZ+DttdksZ0pez5T
         KOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        fh=MRkIjVC0d5396hRq6FtXjnKYcqZ6vhxpwlzkJOZ0ZzI=;
        b=M/Z7Cp2cj4tHIhss2EJOeo1nUHXHIgS9cjMKN3/7Vva0IEtu7AJF2DnF2iU2mSNG+6
         8JHi9wHaQ5Dtn5Y7FoYZETW924VIzLdJ+VZsNmJis8gF9J9Y0KLQA7nYuE+62A/Rpq/6
         yN7Eh0FGbUUfWWxFJG07EBq0Gxp8mPKjEbihYeGSfQf/TjiB0e5awlO76DMQ/LoG8yL8
         KkdPlYsn7Q1zdsB4SFX+YUDTA4v2ypjuJ9yl3Apdj4VXo1Y6Qwt4492+GLFIlpW/DKwn
         W3ATNmPzwTKl+pd9TucOjArbaxEvTlTIalppNt0fF5vZiZMpWsqihUqZ7i+4sXlYbDog
         Cw6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999326; x=1794604126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        b=eu4Vzyz3FOMGxJC7sHkkwx+Bm3vSYEDbbHh+w6967R7IqCOqHclmRZnTh/i9n+MwRK
         uKabhaJRmS6+cDs9STR0qvExeu0MNhAS9E2JtLltKwlEy+vUeGI3r/KDlTc4oHi/2ist
         H9z/caSwPEqYQFeqfD3k/i0NT+hVrOkwTKtxvUcixGq4xHz2B5XbskS9jcJddj0sog8e
         Pt2PO8yHn/ZZ6mll4cApANSHoK3JFEniwbOAffk4d+KcyDhvR0ejHRJtk1TJFkYDqHw3
         4eSbTVaD4ztHGzPERPyLCfs6C3hvtyfCjiPUs64Y0E1fnUiWm0QXAHWsOxVf+WdBhXja
         yekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999326; x=1794604126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        b=r6YdIY6rArD1Iu4UW6o0zzY4q6vIJ9Cm4145tSw9oiXEdR7BkYFz2AOfFCjNM/akIZ
         PmE6low1hge4vb8WBoeDsmfi/AR745gkI+HljDehM6AbjzZ2scRQKKT1F/XfmrvGJOdX
         FhUpZzUafp/9yFtDJmH20ck4lQvRUcAejv6qseMFUeaiqJ9UyIfrlGSAOJOJk9/XVWp1
         HKNYRWS0+YIqjadO6Ki5y/3q7CtjZMpNo/WGBz6ud+Z9EjMzpIGGI8eh9kSlc+9rDeup
         4cNC9WqXoiLFINJzne/kJ/nt86wIiFtWy5+frn4sYOJ9PoFZe/TSfeDlZ+HFeuEZNMfQ
         E5fA==
X-Forwarded-Encrypted: i=1; AKwUvBzmzlki7MIGyOTil+Ll+Qq5blOPzaKKgGSqT0nIT608v96BO/udEUXSdZzwMHJJ1Mus44HuwYqr16VbMIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EZjb/yw9GgoSAqG+exwsjB9JlhWAoXiDYP07tYKz18WFNlqll
	HolDceqGxewP3BLl4V/btxfwbUZqOTygqQ9UvCNhP4dEr28nRki1LhlM36JSlyN7qos7Q9WY7ch
	LcMCTnPEbntlBrqdM426fw3r4HWbwAAs=
X-Gm-Gg: AYBFou1jSYKEUlebjQZq1R2TAHadaervYqxE2dO3G2wi7/4S7uaDUM+3hrjMMIn3YwP
	sMkTqrEVptAtgsowITClp/VgijGMjN34LEtQ8PMW0QWEmw9dUSbSgQ+GadIwGI4sNuFUpcqCsEj
	AXRph628hS3n5wo4izVWqP81LzFi19wwI2V/c5Ij6p5eDNtkz0SxmpIZJZatNDMNW03+CvCm6oU
	exKWBSXtMVX6Fcuy0kviLTVHHCxpnOvdAkv7sUbPqo7dSdtdJvJyvphdRXDthELd1WWTR0+0ENo
	Tk2cR/IjhNtQoXoGsfVJAFn19Vy88TR8Fcq71pIUWIR17Zs0LLD5HeMOIWJpw/PDCnT1K/cgnZZ
	d0ANjH4y86wvugT4W2LdzvqXVopiKKgPZByuk5jpxxQKM0yJZQQ==
X-Received: by 2002:a17:907:5ce:b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c4d524de677mr9637766b.15.1793999325372; Fri, 06 Nov 2026
 13:08:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Sergey Kacheev <s.kacheev@gmail.com>
Date: Sat, 7 Nov 2026 00:08:34 +0300
X-Gm-Features: AclHuK8gNSlyHOq3BH0lfB5PLWaS-qptjYfSCBSSXzK_ROJ0rOwb8P1w1O7g2js
Message-ID: <CAJVhQqX3Yq=TO5b+KW2R3nipk0-zx-wKL6jSP2SNSRZ++Ro2EA@mail.gmail.com>
Subject: [REPORT] Cubie A7A: RGMII CRC errors resolved by changing drive level
 from 1 to 2
To: jbrunet@baylibre.com, netdev@vger.kernel.org
Cc: andre.przywara@arm.com, andrew@lunn.ch, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I investigated Gigabit Ethernet CRC errors on a Radxa Cubie A7A
(Allwinner A733, Maxio MAE0621A PHY).

On this board, changing the RGMII pin drive setting from hardware
Level 1 to Level 2 eliminated CRC errors in repeated tests.

Environment:
- Kernel: 6.6.98-5-aw2511-srv, based on the vendor BSP
- MAC driver: vendor dwmac-sunxi / stmmac
- PHY ID: 0x7b744412
- Local backport of the proposed Maxio PHY driver, with the vendor
  EEE-disable workaround
- Link: 1000 Mbps, full duplex, autonegotiation enabled, EEE disabled

This is a vendor-kernel result; I have not reproduced it on mainline.

The relevant pin group covers PH0-PH15. The DT change was:

    allwinner,drive =3D <1>;
    ->
    allwinner,drive =3D <2>;

The BSP pinctrl driver labels these settings as 20 mA and 30 mA.
However, I am deliberately reporting hardware drive levels rather
than treating those labels as verified electrical current ratings.

The A733 User Manual V1.00 documents four levels for PH_DRV0/PH_DRV1
(sections 18.14.6.99 and 18.14.6.100). Section 18.14.3.4 describes
Level 1 and Level 2 as enabling two and three parallel output
branches, respectively, reducing the nominal output resistance
from r0/2 to r0/3.

With TX delay =3D 8 and RX delay =3D 10 held constant, repeated tests
showed:

- Level 1: CRC errors with pseudorandom Ethernet payloads and
  ordinary TCP transfers.
- Level 2: no CRC errors in the same tests.
- Returning to Level 1: CRC errors returned.

For example, a 300,000-frame pseudorandom test produced 141 CRC
errors at Level 1, zero at Level 2, and 61 after returning to
Level 1.

Payload choice mattered: fixed 00/ff/aa/55 patterns did not expose
the problem in earlier tests, while pseudorandom payloads did.

Validation at Level 2 included:
- 4 GiB of bidirectional TCP transfers before reboot and another
  4 GiB after reboot.
- 600,000 raw frames per validation run, covering frame lengths
  of 64, 128, 256, 512, 1024 and 1514 bytes.
- No CRC counter increments on either the Cubie MAC or the
  connected switch during these runs.
- TCP throughput around 111-112 MB/s.

A separate TX-delay 8 -> 9 -> 8 comparison at Level 2 was also
CRC-free. The small throughput difference was not sufficient to
establish a meaningful advantage for either value.

The persistent configuration currently uses drive Level 2,
TX delay =3D 8 and RX delay =3D 10.

These results are from one board. I have no oscilloscope
measurements, so they establish the observed effect of the drive
setting, not the precise electrical cause or a board-wide fix.

Would Level 2 be an appropriate board-specific RGMII pinctrl
default for the Cubie A7A? Also, is there an authoritative mapping
between the A733 drive levels and their electrical characteristics?
The BSP's 10/20/30/40 mA labels do not appear to match the GPIO
current figures in the datasheet.

References:

A733 User Manual V1.00:
https://gitlab.com/tina5.0_aiot/product/docs/-/blob/product-aiot-stable/A73=
3/Hardware=E7=A1=AC=E4=BB=B6=E7=B1=BB=E6=96=87=E6=A1=A3/=E8=8A=AF=E7=89=87=
=E6=89=8B=E5=86=8C/A733_User%20Manual_V1.00.pdf

A733 Datasheet V1.01:
https://gitlab.com/tina5.0_aiot/product/docs/-/blob/product-aiot-stable/A73=
3/Hardware=E7=A1=AC=E4=BB=B6=E7=B1=BB=E6=96=87=E6=A1=A3/=E8=8A=AF=E7=89=87=
=E6=89=8B=E5=86=8C/A733_Datasheet_V1.01.pdf

BSP pinctrl driver:
https://github.com/radxa/allwinner-bsp/blob/f9a496c24bf6b7cc31c4b5c716ece58=
b2c287f01/drivers/pinctrl/pinctrl-sunxi.c

Best regards,
Sergey Kacheev
