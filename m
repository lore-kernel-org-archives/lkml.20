Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CED4FE2E8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983033; cv=none; b=YTOQGES4EHdJlG6vcQ7qeVkBnCRKPynwlr+D+s0XWdQenlPGdTv9iaSGEptCf5FH4s6bKVSmOGcSlC+nPqxZKd56vmOPSDD6JShPhqSJv7toCGISF1pGsrulWs/pZ0RdkAGC4N9SkYATxP7cx4iZ4uxp+ptCeiyAmYSTu9Q3lXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983033; c=relaxed/simple;
	bh=w7IQ5SmN66Cmz7BFNaB7Dcx+rS3uCOjFI/RUyBBxj7I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jr7hT+bTPbBumbNU1CqunS0SE4MdzrOf0P60uqkNYcHas2X/UUrGXCjzEESOZrV0doiw5rqgl4o5qRSiFuChIO2jdgSGjT17mfH23hdH7Mok7kpuNtfi/rwbDgnjEVzWwnwFvuFKgXnGxv84qDRrvy/p150GUe0VcGKnYmcVLco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com; spf=pass smtp.mailfrom=zachschneider.com; dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b=sAdQ50ue; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b="sAdQ50ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zachschneider.com;
	s=protonmail; t=1791983023; x=1792242223;
	bh=Dq3DDbqmOY1X/L0Ddbisgc644Vl94jil0I3a1cjoZTc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sAdQ50ueiLVU/PRuEkis8Sp4lzuIJSOSkjTEMl2ozdn9stB99ejE4WkCLToykUr+F
	 3LlZB8e2KUiT1MSSeqdzkNNTxey+nMyA6ZxH3ev+NjJW3NWLIgALPGxKHTu+l/coIB
	 v/pbxdlQEFiAiz8aef88MRRYGeoz0ipielsHtiY3lYDnmHHDeelk1axUfK8Rcuy8OG
	 fLX/bYqT5YdHE7ZsWM/4k91qY6IL6wVZBu548lqNXp1aVTs4QWDt0mcM6yDO9TkWZI
	 nOVkXtb2rAFGU0hmQESZh9kqKYdfF4XTQrua3Q9kF+U7Sst+QVUTliKyKQjcZgjLoh
	 VGc7EWk+RcW8g==
Date: Wed, 14 Oct 2026 13:03:38 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Zach Schneider <me@zachschneider.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove remaining comparisons to true/false
Message-ID: <lpfZsbMLmaIzZ7HynGEtUr-ckIqJuV45aYX2Wp1UZ6eH9zWMVDXycF0h0Brr53k7evaZwxJbEsxUuL1YnXEc1SzioY9-H7-3trp5NCdfRc0=@zachschneider.com>
In-Reply-To: <2026101410-estate-tasting-23bb@gregkh>
References: <20261013214129.699212-1-me@zachschneider.com> <2026101410-estate-tasting-23bb@gregkh>
Feedback-ID: 134141743:user:proton
X-Pm-Message-ID: 2f42ef1e20f5204d2c179911e71a1f57a72c89d5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Please read:
>     https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

Sorry, I missed that policy. I was trying to learn how the contribution pro=
cess works end to end, and leaned on an LLM to get through it. Your point m=
akes sense though: the learning is in doing the work myself.=20

Please drop this series (both 1/2 and 2/2), and I'll come back with patches=
 I've done by hand.

thank you,
Zach Schneider

Mobile: 260.435.9767
https://zachschneider.com/
https://linkedin.com/in/zschneider


On Tuesday, October 13th, 2026 at 11:56 PM, Greg Kroah-Hartman <gregkh@linu=
xfoundation.org> wrote:

> On Tue, Oct 13, 2026 at 04:41:28PM -0500, Zach Schneider wrote:
> > Checkpatch reports "Using comparison to true/false is error prone"
> > in rtw_wlan_util.c, hal_com.c, hal_intf.c, odm.c and
> > ioctl_cfg80211.c. Replace "x =3D=3D true" with "x" and "x =3D=3D false"
> > with "!x".
> >
> > bwmode_updated, bDisableSWChannelPlan and the HAL_DEF_MACID_SLEEP
> > value are u8, and rtw_validate_ssid() returns u8, but they only ever
> > hold true or false. ODM_RAStateCheck() returns bool. This does not
> > change behavior.
> >
> > Assisted-by: LLM
> > Signed-off-by: Zach Schneider <me@zachschneider.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 2 +-
> >  drivers/staging/rtl8723bs/hal/hal_com.c           | 2 +-
> >  drivers/staging/rtl8723bs/hal/hal_intf.c          | 4 ++--
> >  drivers/staging/rtl8723bs/hal/odm.c               | 2 +-
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> >  5 files changed, 6 insertions(+), 6 deletions(-)
>=20
> Please read:
> =09https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
>=20
> thanks,
>=20
> greg k-h
> 
