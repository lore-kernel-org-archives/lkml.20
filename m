Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793870362;
	b=Cv3engkgAEBXNAYX2L8/pvw3WErfLsp4qxbIHhgIV6fCFLK6xW96oEnXuj9E4elWDVab
	 Ee4uEv+OHMyoiIJYW+Fx7bV5Pie718ao51grDeXNZELBiPyzpUdIzz0ni1BbG2CdyAXjV
	 8o0sbYlb84QYEsiTGSnD4vYoKx7urfS7ZpKZTgVd0ffuGozY97Abet1Z/HCoas18wDH08
	 rtvuzaAsaH6gE3RF7/x4fzFfVIP0nPgdUHqp4VbiZbyTgH+APNC6g3uz1Jl5hs2gH9YfQ
	 H1h8etzH7bGu4SJyT2TCuBTuRjJyv5HcLRenpJnkFJvI4sB/Ng+e6attn6ES9duZTuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
	b=ft+EXgO2/FPMquljBYPKXhKFFqA/tKuNJ9wwNP9n3yF+IyaxS/nUQWYVInQ1JeAOw1FY
	 LFzgiEuMeROlB/ou6bUNqAdyQCerIn4KBo5OuTuJWbygR3pV7WdbH/CaiHAuKet+Sa3gU
	 bh5dG//OFUG5HGshnvldDz6GGIlQXg2DVeNLEWMjSpy8uzYuFeq9JBHayGDeuSlqs/xzT
	 bz6mE/2B6tpyqTdlRq1wnrQTrwEa9T3X6ox/2us4Jk4JLSMyc+CFYWJUfjcEPzySa0Ag3
	 asLthpJai9ecq9Tcs0VDtAMYqDJ3gq0CyTZx4Dxpy+xS11kbGwXHyIpvOE+lgrkm52A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRDb94of;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC47606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC47606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRDb94of
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49de8ea072cso663170fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793870361; cv=none;
        d=google.com; s=arc-20260327;
        b=cYcm6ntUgn2VPrcyVBMBodNqmIxthTz/QNHO4ReGkPgyQ6oZrNaTVK1vFdB3i02oMZ
         Ek8qtkUY5MSPuRt8G8hvrPdzIkX93JblkplqWDFWSz/YCZGgGBalEmjnuOENdant8sFE
         1MAhcUXHoKJulWY96Sgz4CXDnzRuu9VFPYVFiDsAakklSm1X+pRdRd+60STbIlGG74+6
         K+tpzwqMWFtISkOQVnMmKv+WWqixT6CwBh/YF+HpyfwOW/MFf58VmAdwmxo1lIFAzRiG
         slu4F116wYMbKzc/eM/g+JSqXlv0k3kL1+HgLnd4dVohBoqwSEI0w2W6KsDF0ZXW5npi
         h3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        fh=6ry2bSDF4aguptCCOoh0jabjTo0h8+BCjaJGSqPR9Yc=;
        b=OdO3vpwE9a1bdMTcAaIMEG+RUgBq/OYfdItOsP0XSRtUHTM83MBJOPfNTwmjE/Af9z
         fCsm3q5ORx3RRkwfPuCaMw5rE/Hv8TlzCq+CjcI7QYkS9RxLvm6D6QiAw5YVdAnQCGk6
         fx9Sk9N5dRqhjV0niRWXj3NLh+Tv/hB+Agzz8Wg6dThiAoNnNJ2i7GKSp7KJbYYjVb5B
         w6YiHYoMqzHyBHDdS0xOMErmEuDJWMrJgLkshKbCz0x+C9l2X0GS/KK+/DElhnDeJaVp
         JptAfjwq2fSLehB3ajOohgWTZrEAGTOEEuAnGD3hvIakfgHP9/T4MiCdnE4SJ3m6y7D2
         IhdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793870361; x=1794475161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=lRDb94ofVYHR+1WQwqiDrJVy5WTe2mWB/507MvM+fsdIOGBt3sRL5H/oft6UVGYBTi
         DVmRcCepPEyAt4m40GJEhUuZEx32YrCy2Sdf3yqbSAzLyrlCN4NVfO+4IhIdmUXBPxJi
         thvR8yCrwaPWAKopJovEadOcE/QJdQzTrJgcTEMEn0fmtmtTlfwTn8F+xcGHhD6/5sG1
         AL+mrQy9EFmutVMdyy+JJ5ldiFvjiCihI0TkLrAHTM4QSFvsdnZe/I6+bQqTm9HoGUEq
         vcGOlc6oQhacHGqfJPeiEYwQbI2r9B932gx28a2WeS+F3cT2W8OCtbPZXzVw0l7q9KH6
         2S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870361; x=1794475161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=f9RQWyo8tXRgNTC5Waa//XLlnQ9JwynBNp0SXgpsEcHdodPqqwfWq8uZ56uJXx4O4F
         moeiaz7RdIax1k6P5hdLUbddouGOXDJkQzfVdZnd7T2GQRk2ZjzctBqrELb8z9wJUjbs
         9D0l9Swdw6UjcOeYot9ipAUeHipQY7yrk9uqq9keVoNDzle3DEXb/hG/EjCwJD5d+MfD
         Or235BbgwCEjF2HSUjgEfrwn59dbqvWFBA5EEm2eqL7cZB855MxJ6VDApPv3pty48rQy
         BCHxTIS1DJpLISMkcZG7dwKQ0nh6RrOpIGlQrb213sw5VQqzXUsH3mPVu+gxhlDKlwwk
         GGuw==
X-Forwarded-Encrypted: i=1; AKwUvBxEoUO+cUNIcK+GqriA3l7a3wZvB0plJH81l31YUhVAU1LcBkrsciN90i5Qaa84ifjuarTNeCZyYPxAILA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S//WJ5Nx4hbPDhdI9/Wsi7CVzyxo72M8IqXbCE9+b3XqIviQW
	uZ2mM86EgwnCSRNh3OBWDEvWiJOpTycxRrGeKewl7JS9f/92VN5bCY9dofToBmW/Ho/6J3pW9s5
	IlRLgZUkm8MQ6148tniiOopMhHQ/Xru7XfwoP
X-Gm-Gg: AYBFou3ZHhgyC3uUdBeYVBKKpiFZxNS0T70zOXuYkSGYXdVt2AvKKZALo3l26sODJ43
	l8clq4BFNBSUl4aGIMhop3k3EM0dVCRT+woYQ5ypLw6DhbgtSNqFFvgYcmk3FREMQ3FgxzZMQ4E
	V9XfWZqPhmoZ+y7LWptQ7X72Y54YJ7KevA6CcmaX3AsYmqJPcDlSmxuZS0T1NYpVYWcb5ThZ0g7
	F5dX74V8KY3qmlx5qo83pJzPUVoLAJKUh9pxbAVtVqrBBlQ6DwRisHRZ/OWbk5WUBc11V87pZu+
	NxYmEMwAgJA8V6/9nW88pxQbKlKMALE9Ve6NwSlmI92wxNs6Iw7IY1ongn+ddkOAENNSV6VmA6u
	xQ2ho1VRXprpNZauq8ATS+DV25PQ+3WdTn6g3jQ==
X-Received: by 2002:a05:6808:4f61:b0:55c:836:597e with SMTP id
 5614622812f47-5640dd5ca51mr14606352b6e.31.1793870361392; Thu, 05 Nov 2026
 01:19:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Thu, 5 Nov 2026 17:18:45 +0800
X-Gm-Features: AclHuK81XJ96pBCTYU7-hDy4yf8gIUQ_g9ciWuO0heyn1wGR422e790m2Wvg4ZU
Message-ID: <CAOeEDyuRboYqBUOtLke=X0F66_A8NCHanc2iXt91duLRFGSU9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Gentle ping on this v3 series.

Thanks,
Cosmo

On Wed, Sep 30, 2026 at 7:19=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v3:
> - memory@80000000: keep "device_type" first, per dts-coding-style.rst.
> - Link to v2: https://lore.kernel.org/all/20260729114312.3947300-1-chou.c=
osmo@gmail.com/
>
> Changes in v2:
> - Added patches to sort I2C nodes and fix DTS coding style issues.
> - Carried over the second-source RTC and LED patches from v1.
> - Link to v1: https://lore.kernel.org/all/20260714120816.1504058-1-chou.c=
osmo@gmail.com/
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1315 +++++++++++------
>  1 file changed, 902 insertions(+), 413 deletions(-)
>
> --
> 2.43.0
>
