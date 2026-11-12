Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525841;
	b=CrDqfUU1wXbxczRiJkYcEO3RiQTQGYQvurdXpUn5yCEzG1gsUlkwZ6hbdiyHDdqNFiHB
	 TN4K3ntQ7Zul6Az0cO8Pz7sXobhR5gwDOF39Fb5DIXmWh81f9+Ibj/Lm3jbTD5VFyJICV
	 QprO2ccJ0pqTZ4zcKkP3bmaOgwI7zUfxJ6oEyJ9CyFAizzkMHjnXqIBoSP2d3bpINCdii
	 2B6HUMK9joSRHJMnIPUv1Sdh3c2bC+gxlc6XszH9X4TQjlsmweK3T80TF0YQhF/l4Un//
	 lId0+F0WUUUcA2A14F8GAcCNJ87SKHx/wxwSS5B7RS/2KUefvIpR9rGQMkNRckz0I4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
	b=cnINRc2u1NhH1VXuxj6xGiyqhd78pMtoJmSwcIkRII0I2jQWJF5i1wsCSjkCUjjRcK24
	 3Brdn91csdSwwKTKkFJ4nZr/vKrZa/XhPtfrzyk4v+TLblszlb922Yp1+G0ynxZQTjBmd
	 vxzUzLj8Pxgqn/BpmdwGYWDN2iyXCNeB5L1JIoTPZB+6XWMpbNtULuS+915HSxo6qwy/g
	 CI1P5vzOCHdYAsx9wdIilp27uc1JL9Evtwhw4uR+KWgF14BSdWUR7+Pt4PiFodJkGLAdZ
	 8UAzP555I6Lja5azNoPrp4/6tZRxdhmwWGnWZ1nj+3RGzByTHgYa+S5fwDaJpqiK6Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ausil.us;
	spf=pass smtp.mailfrom=gilmore.net.au;
	dkim=pass header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42964606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42964606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f2049ea7aso36880185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525840; cv=none;
        d=google.com; s=arc-20260327;
        b=FvvGk+rCDwZHcOfo3TeuYYJSfSvTrQtAzueOmVWfVerUIMowpHzTFNy90Wp+QkKk7x
         KFhJe0zUzFw3o0sO6qB349QeE/iZyF1wPeQvM5IHlywvaUpRp8U4QGeVRonA35vh0pPN
         Vl2B6t5OhPmC8z1c3m4XVllLwmGYC4JX6tl6LQumSP5seVoE4L0OnDgB6V+6KB8U7bSe
         mf/9neXAE533Kpqa8Zk5lngHhaoSQylruSiJH6uYDDGVFPlpXKOJn0iEIAz4HKDS3Fut
         fhLmTbK+V7Bu0AeVFtR745Nn6bNT5g5iTWwwYcJDW3BSXVS08HZQafTBzDZU0AOuXUxe
         Lkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        fh=hl8pwKEaSUU56YRCQyw2o948Zs80g4MNCQib0MjM/ZE=;
        b=hE5qvcfHoNkRHIEew5TnrIr95a2P0mjaJw9XYF5izHK/fuNGeGpeRYwBmSnm+G5eik
         pH5o3983wd1PeFU0eOTNR9wFZGVpH4l8SnsQpJYfZHC9kzIUrMCtHyI9fPaftr2bmcF/
         wb+gAPuI4lXjguTu4QWc0DT0ZMh1pcpSUcGAA4prE8JGnpqZx5bzND+reFabt6C+YYPl
         E3dwPILj85QWTkSPRwyhFxgnnsh1HigWB/SwAGxffywMR0sZgXrVvt1fB661Co8slD/X
         eF/3zv/9OTK0I//KPiskiElnI2talOV0a5sjyZqswniwlKwRC2ATBhEGTcgunkVLeNwb
         kSrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1794525840; x=1795130640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=focqTQf7naFVCGV/My2d+xpcLS+yKtintmrypuRzht8YS8h99AlJDL/3AsFgqMzzSq
         LiYGDn8kpDU+Vupp3Eklu4tet98WA+Gg98hsss9HKVRYsSKcuOWLgCqfGsfC9WtJjhFv
         LVwgrg9eok9OlzpqlzH2V2tb6xEKnyNGK9EIbw7aYhPvoo9CRZELkbf0uLrIc2cGVhxU
         6S4QL30WvyiEW8bbRF9PJYgUnokd8ZbLUVvW9iSO395H8jdjvkvbCelBuukjOeNCOIvm
         Fgkyz48jdUU8emc2E0zd2TfHJq+ABdg8by9UYtuG/i481sA94eZ4XT8IFqFFLbKcla+Y
         4srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525840; x=1795130640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=rp30AVTynueqwhG3M9o05J1sW6Ncs4pBIeoXfxNp3HrAjo0dqoFVZHcrF7WCeo8YMe
         Wga9ohAGznok2sBc54WEQDx7yL97fNCP4ZOKuq0SW/48QKpzaCFA433+38M3VlwMZQiu
         Rd7dh/p1jD/gF8M0qa/wprShvWLV37l5CLbUlKxlHrEIPdDjG+EQKDriJH2g8gpg9H0a
         S5DVge/z/0JtHVAtLBRTRtUJ5ijWEp2UMyQIi9tkPX/vd4WXY+OQ/BdjWeSsGJG2olwS
         hcD7NgKSEqoyl+zvDHGHEVBCDPKZwJjFsgUh+9fXYdsI67k+1icU8DvITWaKI7+v+VkL
         gtEg==
X-Forwarded-Encrypted: i=1; AL+hErFSOBYWBy6j5ETinjK6U3z1kjNdtK0CV5ce+miw1agNfKh9MvwFXhgecjlSTUhivBqYGR6w2jyxcBY6m0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t9WnEkctsC/uT4Ezdzq94SWz4T+Y0DUDdMWsod9D1haUwKMWM
	bNcuAUlG5xshHT9CGvah/MaLem44vexdRGVMvUapoU6w3qrDaqfY33PaTGZGPen4P1y/OQ6c7oX
	kCIThOnRjH1iXq0oJm/TjaGI11Ac9GAi2zMHeiIGv3Q==
X-Gm-Gg: AYBFou1w8h3ZqMw9ryO4azyTyRNJRmY2UkfhxUquXWQjQfmbArLauyWnajFMC0sBSPl
	sSXs9T2Lxj7oRzrezBVrkqIpL3xN7m0UharIsmZDxMX3ICyc+v6mmPzejtU+YnV9vQVXOXetQ4P
	baVRu/BBH+U9+M/ZMWEnOx+iADI8CSL9ePF84qtfDgRgIeW7ynypxQIEWFtA5BsUd1OGsb3WKI+
	4aXCdu/g0SLxGo5oBlyU46d7p6kDC07bLA3fpo2k5aIYA6d/HJ1S5fWsM2iySytiA4vCKoxoR+U
	uwRNs6axjrHA3nJE6pKnA4SzLo3EkaZDvTsNrTfcUe0n9Z5Ov61TJF+jbl0cME2nkaCbOI6kP6U
	AMdiMgVlLF0EZEApXA0WSOd4HGF1H+SZnv29Q66lPCHQYVsNrJZBwoX6WwdpIZXqROX+vUYg7Mh
	btfxICxuGOLcynk7602ZhHkkO8
X-Received: by 2002:a05:620a:371b:b0:93f:43a4:a48c with SMTP id
 af79cd13be357-9494bc3a400mr175911185a.45.1794525840268; Thu, 12 Nov 2026
 15:24:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112025252.71375-1-dennis@ausil.us> <179448342405.66517.5463730214277229760.b4-review@b4>
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 12 Nov 2026 17:23:47 -0600
X-Gm-Features: AclHuK84GnsbCUnbGFWAfzcRIsf9sLCdYOCcLTFaLBRnNzS4e4KBe3sc65us-XE
Message-ID: <CAABkxwsn9bkx37C1oEuMC1o+5Jtf+EnJgw5o7pso8hGxxJx34w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, kees@kernel.org, 
	gustavoars@kernel.org, linux-sound@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.hennerich@analog.com, nuno.sa@analog.com, dlechner@baylibre.com, 
	linux-spi@vger.kernel.org, miriam.rachel.korenblit@intel.com, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> > Since the conversion to devm_kzalloc_flex(), the allocator sets the
> > __counted_by() counter num_components to the allocated length
> > (num_cpus + num_codecs + num_platforms). This only happens when the
> > compiler supports __builtin_counted_by_ref() (GCC 16 here). With
> > older compilers the counter stays zero, as before.
>
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

Looks like it was already fixed in
https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.c=
om/
I missed that when looking.

> --
> Mark Brown <broonie@kernel.org>
