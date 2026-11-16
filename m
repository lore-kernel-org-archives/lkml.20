Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854140;
	b=p2/qRl6UntcunfeindIVztyjiEfMkG9lacTqcocra/x36Fq4N7uhXxwuu/eO2Och8r8y
	 HZb6ODf8H+9DHVxIp0+2yaiMoCn3zv5lKXZacbp8C5KQr0Qci0dAtGkpbWIkIY1nGzvAz
	 +KB1yl9ShqaPOEZD49kfLrb/DSjzWKmT2NDEKcU3wOHD7v/XagEJzCLP68GIkxri66OcF
	 upodZsbYcnP46TMInkpPVhgwT+5TklA9RGt5j4o7ICJ6STTkcVDlB62NwcUWvudBb8Rk8
	 bz6gB3GnlIJeW35EPzRWzbYVsj1zBlmmsjzpr6LatjsGoCJDQCxuRx+yUW8IEzKVgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=;
	b=W4nsbVyToyl79KBBrAfelYu2hM09YauRjNKJ2SIZST63cVVdIP5VHDgBqDxk9AELcTOx
	 7PJEgjW40kmnWVF/J5eZDooO5bndpojqPsYs8ukDr6uvVDGNA1aOC5bhl/zKrcEh8XO1W
	 d8vFNPLLUgM6PmAINRyYeHE+GY20jyiATSePCr0NpEIwkSnEauKurex4kvC62mwnPxmI4
	 RHrs0JiCDHTjBGN7uOEttKkXbS0MRKVWM5fU85TIMHvHncnjZYSyZDnrq47EqvsAnX6Cu
	 b9F/+RVJHJ2nKFs9hEhIELPqJiazYP4eVJS7uZ5IYeyIFNGlx0FdEgNFzFFtyIHrPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="E3+6/1hx";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6442E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E3+6/1hx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so4035800f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794854138; x=1795458938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=;
        b=E3+6/1hxj2sx16NOC59UDyHnwicYd2BXhyX5J0HFKKh0Bi9Mmrg6Pit7Zxd7QWuruj
         rs7xrXDQra6ZSF/eTfdHvMV9IkMasjFZSUbr+DOllAIselgkMhGyy3TS8Xn9iMxGSDab
         Ge9bwzPp/nwI5nxBrxl2Gzj7UoMBIeuAgiiTPtU8/hu5kZFbIrwF4Wc2/6toi8T8DF70
         BboMkugbvcXP2EdxqjLiNJVqVickrZ9lcmh/10OmSjOKc5Ov/l/iAqgfseMnAMNeQ3kC
         Vz5uf8uPNhqWlDhJaqhfMX7P/0vFbGZWgeEQ7pz/Pi+d6ri3FCsVy2in6j1RH6blXZQF
         1Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854138; x=1795458938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=;
        b=WNopeg7mb6gEYVv4MKJ2Yije1shN5ijHbwkbEEc2rK5EXChScgKfPcws1agoX5Qxj9
         TlaoTPCwRr+TfwZUnVwUTmzOExWmsRPamgxqJ0TsIgxtw6NxQABBCue4jb89+LIWj7gK
         RvqkNMVnJHUohNlzmaJoQdodkg40J4elMSe1smxJ/HB3L+fnUTFoSWkxr78ONkJ8gM7N
         f5oHZ93+Xm+fEgXs5ZT2KweKH5P7BZBrtA5exLZXDrtDNIhTjca6A8yuqKpgvVg0S9BM
         785S+SfQ2mWS7HFHN0KeIHMrzeKXkJ2DfUZ/TqckcfwsTfmtBJdGfBDWLxlmLfr1WsLH
         fFTQ==
X-Forwarded-Encrypted: i=1; AL+hErE6n4mHwBwikCDy9anGSjLvzK5QVz7EijydPmNOULYrhczXt84oYfJTc4QJTQI95rd22YNxr9ySHW9Twbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZtMsS6vczpkHEOUNqYZ0K3SCCykouGQOvC6x1zkl43V5frncG
	+uccX6UqqESU4UmjcrjZuJfhHiPbZsQ46ZL540yniDy1578UT8WLmRNuKjYlN/+/wO8=
X-Gm-Gg: AZFdTZctMEqYVRZrfZXyWqsmN2Gdrm3wmY2J5w6nU97bAajmX5VVxvGd55DtcYoAvyh
	TQH17tvbeVoLpS4MsTlNitXtSV7GkifzbnSR6uXq15BlaTkg9NqGwUjpFDmUABDkZrHsMY0L1k+
	UQFHc2n/wpe01E0qItiBZUSsFOi/hNSIxg5yPxEVBkfZE2Q548R21J3d1QOLfCLcakuYAt6wt54
	kYnWRiEeRF+PX13JXETyvGbULD3s7ZffKLO4ZEm7PxXpZuLw6a/EkxBOPQHx9J3734fLDhHSdWr
	brwdQBNlhT9F5jILLXyNe3Cr4Khzk2VyPXFusg+kMAwl3oFcrfFF7mIzyVHRbjiHlH1F4C3+il2
	SC41I4fDR0Vi8/9vNoOsG+MwN2fQ2clKgbYPlFUUwSRn0kbiRPUj1KTNdF1GPpuR+Tv4IRNVQCq
	9U3tR9Lq1V0lWKAQxTstK4D29l7ts57a4FqLlfWPYN0p25UKIjjQsZFBQliZWdaoOxPanwlR9i0
	DdsgXj+rT/3Yd4xiQIJjEfKAWpMnjZuTdZbAMPcmXC2yB/q1mvqhv0OCv4TA4Hb9DGrTBkGeYaz
	wYsjJKhBbU6hdn/hPb+mV8cBWdvVdZs6COhHuY2+qip/Zuf3x9Ukw92gie0v3f1MIcVXS2l74B0
	5jkWojPFGdujQ+hDAksRVaNYvNic8c1ooU4KOQw==
X-Received: by 2002:a05:6000:491c:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-49c70a0f0cbmr22973182f8f.31.1794854137742;
        Mon, 16 Nov 2026 10:35:37 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fe373casm23015553f8f.30.2026.11.16.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:35:37 -0800 (PST)
Date: Mon, 16 Nov 2026 19:35:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
Message-ID: <avtL3i7n9cUARCd1@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
 <avs5thXfoZA4TBnE@monoceros>
 <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqnngouwa55krefe"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>


--nqnngouwa55krefe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

Hello Rafael,

On Mon, Nov 16, 2026 at 07:15:48PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Mon, Nov 16, 2026 at 6:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hey Rafael,
> >
> > On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wro=
te:
> > > > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> > > >   ACPI: Unify acpi_device_id list terminators
> > > >   ACPI: Drop unused .driver_data initializers in acpi_device_id arr=
ays
> > > >   ACPI: Use named initializers for acpi_device_id arrays
> > > >   ACPI: Unify *_device_id list terminators
> > >
> > > All patches applied as 7.5 material, thanks!
> >
> > While rebasing these patches (as part of my wip tree that contains a lot
> > more similar patches) to next-20261113 I hit some merge conflicts. If
> > you tell me where you applied it, I can take a look and provide my merge
> > conflict resolution to allow double checking.
>=20
> I've rebased a couple of patches on some material merged previously.
>=20
> Please see
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?h=3Dlinux-next&id=3D58d4ba8979133c41cd491dff1dab40626daa924a

OK, it seems you already rebased on top of the commits that made my
rebase a bit bumpy and you did the same resolutions as me. :thumbsup:

Best regards
Uwe

--nqnngouwa55krefe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7TPUACgkQj4D7WH0S
/k6vZQgAjLzcTYkt9CbkThW0RlljMQXJxP5fmZNoFevLodwamfhpt+348ZmhBkWR
pva0yzF64v2uFwtmOgge+e1azRuruDvxfilctoJgbCV+g8N8GlaVkT6OU7mHXpNB
C/esmpj/xKsGPaZnrbRAXqxJ+/KWjGuW2Tc4/CLmjidnaqdHoi6we+/W/YDZe/zD
hK5ahEuQfANr2sXtQMET7/79wAiZ0mquQalFQaDDF2whSgyu7dWdt3+ahdFOS9u3
DTc/gz1Yiu4f/sTzP8Hh7Gr6y/CnHyaILNhtxA3YnnMqLmQnPEONbSnbua34q36a
S4dDn9kuuyzsCa5pFr4vhDplKXzROA==
=5qsj
-----END PGP SIGNATURE-----

--nqnngouwa55krefe--
