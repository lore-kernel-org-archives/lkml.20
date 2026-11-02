Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652562;
	b=NRysrefC1M+tdnQ7FX4ugFk4p59wAcNL7Yy64z2ew+SK+FKdCwL79SpiQMG/gEyBBOVg
	 bSH4ffLNQtr+ilj3C0eDRtMYvDa1YMGzbrhmWQLnH6KmJ1cU7JYLMS0LwviDPi+RyGtaT
	 0ajDzoLflctoFEFyiHE93Ot3FEXNRmxJ7jBqx32K+Ls3JvhJAhG25fJcPMwDIm/BXSOZA
	 1vuRuPIQqIsZNvLedIYz1ayUKgAwhOj7XgC+iyeyPH38cG70B28j+xaV98xDpfPCVQggk
	 3jbMno9kZYBkwQ6HUcVolCR//91fdIdabr5v/hqtDe/IslIuWxAidMAOGAOrx6hf16w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
	b=LsQUeEXeJ8Uie4nB9oHrjiDtmHHKGd8Azuz2EjkqFbzMUEIYXarUivT++5VOcksLAuKM
	 msKtWslKDsb4IoPvxE6V11W7t6UtSKk8Em7lOLSykZvQ5i+tyZfKOpj8Ii3MG8G7I3BMK
	 nlZO8uQKhor85Au4qsgrgTekTOyCBBwXJYAAxcdZ7nc85QPLfep3acW1Z4tV3B6PNA6mR
	 9qPXYyuHWMc/x4skXJq3Wn5D5f5alInPFJycNJPbb5N+f/nQ1cNvRaU91aBTYABnwHnPu
	 qL7I28nM/sHnyXINCyNrbWOcaBlBQJbb2Jy+VkSdrawwqcPzsWJZc+jyVhjTCCdPHKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy2hS9ud;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4643606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4643606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy2hS9ud
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so6076043a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652560; cv=none;
        d=google.com; s=arc-20260327;
        b=csHt37Ni+1Q8ZZ/TX5ztemdnBer1CF0Utapn5K4NCHc+nOD4OHIlQOIszWMGhDEjgH
         V5Zt6/LwhPjBRlz/y9L97mU0npp5YTVC9wbmyaJ3KCm/qUvDkSv5A5hp2sLsM9XQMOJy
         sGsspnj+ATUSOmTngvFcTLLsJl+fW6/YRfErywzW7+wA3nJfx4XwDjoNLA/mP1GRCWBE
         mBgMNbxwhiDCbhdYsn9ZfqdewIlrTmeOhl1lOZ4ZLUTp1RqJhGKUVPuUmHnKV51ADJpC
         nR58tkQQEfBN31gfQx5OwmL5GKIv9ikKftAMN2pLlKVc3po1GU0pAPE1wo/QkIbM2P7m
         714g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        fh=k5WW3ES3jlv+B2SjV5pa1QMWa+wEa3L1+mQ63QhH+eI=;
        b=s6vaKHCLYZCkVxyNjmSkUCfp4DleU4i3gkmHVoT5iJl88SxnjaZWsgGaJAmZXDOGBA
         Pm2DSPiPoTFtIoAKbGT80N6gFsaje2T2BpF5XB8YuIeDfBmqc9mH6O2eUlU5lY2GwAtP
         +mutWPxdjRGIa1zOMJttGPAzzADfDB0sZukF0X6/TuVxDWmkyeCZlcWQD65g1BCqGhpP
         hZoF1gaqzGIfkLdX8LxnQSTAy1G2beRQ6GYypu7mNeEBmVWOug5iVOcroxA18MGDjywv
         Md+G6bCA0r/Z0LTSQ+sU37s3ebmzVqCu6RumqzNAaxq6zeoPWxRGwLPI719PMCLSzVf/
         eT1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652560; x=1794257360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        b=Qy2hS9ud95X7n9esuBpUoaSmRXMK3C1B2qWzynHOm77J4OanH3hoyqpGF27NHPHbNA
         MSHI5tFqMS0LxRpmqtSjuubJLWiKXjXKoxfio+KO+tvROBDxTC3UgZJ911KInm6JzBPl
         HIwnwfbPNedmz2Il1UmZjxyP4GxXDZCEdfqoVdRVGmmN73+lc447BeBf094jEUzCwGgN
         AKYHZ/fKu2UL5YzcelEtWW8qEc6LC8tNCIAbx94kFzlwzNTO+9zhE+IIsLPew29cNVJi
         rPyQhBLvHgU2c0nJ87zsnrS4lPP81MZDjasPgfn6Fc3AHLrf/5pQ+h+qyMrb/yExXdrR
         9a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652560; x=1794257360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        b=xtdXrsQAlFLIhhEJ07YGD/DR3Wxym4po9XhrPZ0xgz+0iI7PdI/iXJ5xdTzagb01Nh
         pVuClDhqRU7VLnTQVYZjem1mzfGuFLIUQBstF3C0Z85YePQ14NWWwiCkgujEXZLU/3qY
         5Hy8ef+JFe8MT2+u+6Py0IcndtjQam+nQ7Ha92W4Ayma+9ZXEvmuB8kHrIJ9SiiE+46P
         mCfv92tQZPaCwQgNM6S+GaZ6wf+TdxDBlk1ayswgOHQdKChf3WBowRWHzo+bJXsnSNUS
         AIhO8RTj1wcoCjBS/yaaHXero/W1fnEGuJFFGn5H1YGEstWF9vBDbYYCF2PXi9i4dfum
         +QAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcFakhuY9CgssJh9mzm5jW8mil6nWL0elquuT4UFQ4N0V3OCOa4lQm6T68p7hvJOGcCxtoYdBPenW+asM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cHifJHrW6UMUa+ezHRHr2YlFeVtMVTQ7ki4QLZGv3887tFsp0
	MCdCcvYGjsuudEeedh0qIpblGQskjWPZi3S7b265QwNVKErQP/t5HB5S/lOdHC2o9cwgHgzKHEA
	QlK9oryFW43V51tyN2kHtEWG3lHQyJHg=
X-Gm-Gg: AYBFou2vgk2ix7C09edBLhZXCyQn0TTwuGSkK4MMvntQxIP9gxKl9eOACWhn4wLpLmL
	vzuxg6OfmugncDz99725GfXmkPVjojvX2QsrZTCzD8GFdA1ZnrjYX43+Mhcd12ZBpHKb+4yS9YT
	EXEo+kfJVlisaqZiU3LZ8KfGZ6WcuWKDVOItH8BYYeNeDF3vZtLYcnAEFg7e/icVsVvDh/GD4NK
	dR1RXJUUTyAUxrsnIBYKSoXQH0bZcdlOnkIb6z6ohEHzeUFYgjEl+dp7EuZMXbddZ9hfsMKmmak
	GWlU/ztu/w7r7PG6JZPbCYkf7kDq0s8YeVeLkcJ1uTotgMf+mdwsyKBJ6FnESBughB0PBeKhlf0
	Y9bi/bhezjYgVMnKWw3KemntiWurMAM4FVdeX5sM6wrePpvFVoiQqI7Cp7C1kxCH7p3rtGZ64Gb
	zZ2JK7PDDDZpHcM585tH4Ti9NMoEV3aJ3AWVnJgBPF/Brw4gHUTd+A9JreG/Lbrt2DZrzUk08Cn
	jQpVRd+cNQ8BVDhM76gWSljmQ==
X-Received: by 2002:a17:907:96a1:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c4ca7ab1f72mr900570266b.39.1793652560193; Mon, 02 Nov 2026
 12:49:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com> <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
In-Reply-To: <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Nov 2026 22:48:42 +0200
X-Gm-Features: AclHuK9vu6sBba2BxIIl6hwB1hx2favluLvkLKkyiaeY3qnyVXOxghpaXG0PETs
Message-ID: <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the dedicated folder
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> > For the easier maintenance and future development move most of Intel GP=
IO
> > drivers to the dedicated 'intel' folder. For now it only covers the dri=
vers
> > I maintain (as per record in the MAINTAINERS).
>
> I wanted to apply this in order to see how the menuconfig looks like
> with it but it doesn't apply neither to next/master nor v7.4-rc1.

I will check this as soon as I can (currently I have something else to
address which is more urgent and it's not related to Linux at all).


--=20
With Best Regards,
Andy Shevchenko
