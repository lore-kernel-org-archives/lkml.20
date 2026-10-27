Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091126;
	b=ixOIMHCpndxEw8qFZzkq68dcffDOUNV0dGlkm0pkMl68P4jM8EK9yUlrOSu6RE8gmtKd
	 04E/mHbnGZ+JAStxjn4K0wrZ8IVxUnzF1pDjJzK/NSJzOxOMsh8pZjCyZPzf+BWQ/pnzN
	 cqfwibiiTuyERfV8Rz4/Oa6y1MIJt4X3dbSF+N+Y1hb7xwWEIA147He46l+bGACVuPJJC
	 2IvRokFNNzVEujOhhaUWC/uQdqKK2iWk9JT/IJPtgiweSdIir52oxxuf9Skea9EWxO6l5
	 ZyeYjUO7+mOlnePdY++Cto8NgRScvau8WtECO3nvhXAMbJv9ZPaoffagUWK7u428osA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
	b=aJgg/KS4HfkmrCgxWEOpYs6F9rAFYLIwqleqtnP/xT+GkA40KSPE7U795QCyxiuGhivK
	 +G1xtRlcsBfDs/ggj7L+ra0aFTLOfx1k70lmphrcvN3JnCJdUFUvjHorYMpYkWT22yLLH
	 473ABOyQ0nr/OQ8oZyJLdJUp83VDqIjkTv5xMzxG2Xkd2QuRLJ3UgzEX69/qbkLDaFq61
	 aoS3npBAAZzo45ufhzrEQwHUSg+xd74ajV/opSDADnAeV6cPUfvY//XtpzgPM0a4W+CDs
	 MR5tUqT/QoYr4xVbUx5HDOa3FDYOdqzjwUs0gouzENRazJqTd/2y8tV/aQlIKUxLV9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0077606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0077606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a1947498bso208779eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091125; cv=none;
        d=google.com; s=arc-20260327;
        b=rLcp8ruMOew4mj0D8EjM4Na3Xek/FQrBKcj2b2IutjvN9EhLzVmKsnXRyLXl+H4SSu
         tl7npG6PZySxGTt854LRzbiXWuC5H/N5YwE2W3CK0lF0PJ8Ys/nctCIfTzWvWk29gyaZ
         9/PpcKO71dwRbUwZkClQCYZ4j10c7i2d5Q0H1fDizGHwSLdowWuL1EI22hu4jhW5xAZH
         Bmx1plIvuvVvG+1+CZ6Pba2wscWnslfgVHHcfx+zk33GdpAsqPlXjbr1nl1GhGFlgjcQ
         Bk7JJ+Yma9L6S06iHqWtlCJdldzELnKUQwnn7iz1nKX3TQQiTyGFGSNDi3XjBtR3GcZ3
         HCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        fh=UzFYNrtkaDVNIhBV1rsk28lK0IxTOUE64c7ZIf69snM=;
        b=OeAHcex2Gr9xqG1+kmK7hc78/mTYNNEtNvQHpiy2rCt2Arj3d0tB9cAyxDUokDG0jH
         8p6OFg7iVkHXRgu79sNPHvCwv/XH+HZ8lXCWlw0zq5Jzgaouvv95o4JLKVTki5aIPGY9
         zpQwLKCrU/sL1L4t7lzY41CPchBYxT11vpCCv4PHx3COYIusrVau0vkIvyeMyfTcTzM3
         ZQ05KifNMZV/5gaamTcvzrrQZG4gXrl+D0klBEP4enRbZAttXjRBk8Cbv7SUdcfFpfIh
         mazrw+KJzWOvQlN4emfiyiRLYElnaED3DTamdAYfNKmcVMT6ri2RR4XOTJjdTQpN/R70
         Nykg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091125; x=1793695925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=pUf0+7wZWPc6vb08pmDR5P6yk7mSd0eNZggr2tJrJzBo7w39uEiKa1QXLZjKmWm7M2
         lND4nL5vqeLmDtdnhvuFcc0vihOhPvYKaLsfE9Bm0ztBkLkB82jqwgxcK0mUGN5F4HT0
         Yqab/3TcmGLFulnpxU5OwJi2wlujE4b54oEC7pPMBoxOyUitR1v8ONiQjoWzoRTs91Gz
         ar2IIukgQB0zJMUt4nOtS62GihnblGXHDNbM7czAPOIgkpWaxrl2p4PVrut6ORDx+vpd
         EhZZyqKNwyJxUGDJ/rfbjW5Bx0ZaZRG2zdnaTiXAaiQxEDeGAtFAkJxEEF4fgs774y7Q
         jLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091125; x=1793695925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=XD6P4KTFQiYSIl+A9SAPwPh7nMu2A34htZkIa4Ukdgc9lKYa136hEjTMTo9v+ZW1sv
         4r+XcbBWTe/K50Qpps6d4/F4kBRDIePG41OiGnYQZVjCCov4ps648J4xQ4QRkoIQoDCZ
         IGzNyACL0Dw4NLJYf6NIBbbhQ+EJu1cxOTFAqBioDWOtMxPG8itHteSqyZSrbFAmHeZN
         4zChlG2IDsgYRof6HrsFb3ouzmhMY0Lk4l/FxXJ6S+NGJGo5XouKkTjraEzwFtKDejRi
         ql3mqhYzSn4hPqQ3jI3sMcaSDyR2mgkP+AhW/voRihMJJwtkQSJSS2wtlqAsPIlTQYLE
         V8vw==
X-Forwarded-Encrypted: i=1; AKwUvBx+rN4O+24YefIOKUYjWdqIIvLVwxyqaQdFfBIq/j0u4dbkc5+jhOu5FR4pPUtSNZF5jQn3YwaXWlcCqGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN7+p2gt3XdtlBTwIhX9nNH+0si4Sw8PJydWXGzN/K+ofR2aIL
	7tIhvAOcMIQ/U2W/LEDhECudWDMLxd4fZ1cp2Lh3gp7xKCcgdtcyo5dvI4/Hz7cpq0gki9iOAg8
	kNbXGJ522WUBU0bXRa4V+XVNq0pSf12c=
X-Gm-Gg: AYBFou2IAasORxYaUTWAI4JGmKa+zDK5h1tHWEm7B9Zk877t/UXcLkEkkywgBC16RhH
	7PWtH8e7maVaVl8G+UoI2+6P0xeJ9i0kV38fLnAf8GrzeuGfaCB0I0l/+PpphmjGW1vyp+/G/Ej
	RxX8HskM6vghUPAZO0yL0Zpn6Yg8u/d5nqTiC3VfaBkx5s18O9LwZ+1w6dOJdDO/5clGXvjXuez
	cbe9BHO+MNLas+/bbQlbhXdM/pcfkMOqi6m+EB0eV2L1AzgKqapzQd+G3Njv64Iwpfb7YoNlEFY
	wrPV5FbqJZOLw1yEfWAUHmqytRwDH78vm+e9LC1y/AsWPrOp9Kl1OMgl1JDzYk/rcxZtGyD/I0V
	r9Q71UBnvjSge5JFMGMeVzvYNm1cgPxICB7YbLZf0i356z9i1XmsGJMaD5VbUcZZNplNwUXRQTa
	WtwHk40YVkjT78hec=
X-Received: by 2002:a05:693c:8110:b0:359:2edc:e1d8 with SMTP id
 5a478bee46e88-369e836b39bmr13749085eec.5.1793091124761; Tue, 27 Oct 2026
 01:52:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
In-Reply-To: <20261026222928.GA15139-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 10:51:52 +0200
X-Gm-Features: AclHuK8LjCWDpNP4DuV4ZuevBx5z2yzl2RQeYjmP-HIeitxouPX3pu1AzADU8K4
Message-ID: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:2=
9 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > Move all Tegra-specific Chipidea devices and their properties into a
> > dedicated schema file, by analogy with i.MX.
>
> I don't really see the point given it is only 2 deprecated properties.
> Maybe those can be removed? Depends if they are deprecated and still
> used or deprecated and removed from .dts files years ago.
>

The ci-hdrc-usb2.yaml schema contains properties that are not
applicable to Tegra, and conversely, Tegra-specific properties are not
applicable to qcom, nxp, nuvoton, etc.

The 'nvidia,needs-double-reset' property is required for Tegra20 and
Tegra30, and it is still actively in use, as you can see here [1]. Its
marked deprecated state appears to be incorrect, as it should simply
be restricted to Tegra20 and Tegra30.

The 'nvidia,phy' property is still used across all ARMv7 Tegra
generations + Tegra210, as the Chipidea driver has not yet been
converted to use the generic property. Therefore, while it is marked
as deprecated, it remains in active use.

The example I added is from Tegra30, which in the real devicetree uses
both properties, so I've included them here as well. With your
permission, I can remove the Tegra-specific parts from
ci-hdrc-usb2.yaml and tailor the proposed schema to better fit the
current state.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/nvidia/tegra30.dtsi?h=3Dnext-20261026#n1146

> Rob
