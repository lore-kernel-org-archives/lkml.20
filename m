Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6D509EEF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554690; cv=none; b=NgH/MeF9rh8AFcFiRezc4KVHB2Fa+PRVxM8gjRWpkzdPRJg6wg1koUs8IAIB6XaIw1vlP+AtWA0INgjl+KD3I+BHCCeqgI1L+UycqOq9pPmS3wHskJ9BqTl86ZEnj86HWOfRGQ3vW7ua8Ppix/iffiZwCFk8GEj4Y1Gock3JIUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554690; c=relaxed/simple;
	bh=KI2Il4P7f/4Gh6q3rtxLJcODMETR787SYpqX4hUjLRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CXggbhb6LN64/UK6x65Vqm8n0/XyVA7JECZoibfJwvhkMdpSfsGxfzyKcojjEyhe3uk9lRSqYfnWRDxK7GPOk84BMTCMqjDryvquUcj42mRt8IzMQnGb1wrQTmoeZLx704wEqgCPipIFtSv8DJ4KVrZwWNAgwEY+uk+v4eubpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=vM3EVsxU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="vM3EVsxU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so4039715e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789554666; x=1790159466; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=vM3EVsxUYRizuV/KfRTwWwwgppaZXhA0XIhWPngNRoXSGNcJnV5x4ncZPObmFPyuHy
         rlXNNLkOZpieusJaK1kGyac+AF2xs5xpsKZLFTNbU7djXUWylIkqEbLvdJ4cmlNgieAa
         UdwUecOJO5HVXYV/tiHgl5fR1Gg6A9tIubVdqmtt+rp/lDt2BoHOU38RAVCdEr95304e
         XH04t40AZdWDzCPRfAYpY4KxQsx1gIu9iRKdD3U8LW0/uHrq//KqgqNSzn3O7HjHndmA
         TNbL7D9/LEpyQ+82bJQfwAxpdCxN0keD2qUc4uX36Hz3AbWZXdxXJASd4lkivZrS3I/s
         XIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554666; x=1790159466;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=Au7z7Dhh1vSOA297+EfW9PuaxF4JEo0xsoHRfSd9ePx2H5CXXIqGL+46pz+7E1qKlb
         0CXANE5HELN/5EGJVR2gDK8PzyH5ptrtVGRUSnVpa5SQEFxNMlUsyllyVT4ZBPvBdbeC
         a7mZ9KExmHWpz3dmGJhZ+ZXBhIIhRMDe8iIcKVnrgE5wFyGFa8swHNHK4mHRi24gVzW0
         Wm6sMsP+shdUVL2PdtScjQ4nsxMOYTlSSsMLXOGgc8s1QQAudj7zWg31Y0mufdF6G22k
         XdrAwom84V5lKHePr/qUX8u2OE8shyRNXPeaWGIz4bdlaT+Tqt/tPHy2Kr2v0vbUqEOQ
         suig==
X-Forwarded-Encrypted: i=1; AKwUvBzpq/9cvS45/EujN2rXYTmE/qM+QU410XYyxHyyYOOXGnGbASAfOEsOBOyJkchB2QcwzlRfmCYKWDavJDY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/S+ymPK24vmxF3qgMtnOmbXGcSk04dbxrwDPS+n4yr0vWfhH+
	iDD7vPU8DPBaTAUVNLINCcFkQ8qihb08QE9Q6Lb1zM19Iv/oxUmFI6P8JuLn2KPDY/w=
X-Gm-Gg: AYBFou0980JkdWbxXL7y5v6YcP3Jdhfg+iN7SMfZc/9xebq+/7pyWqLId/xBdjeKcZw
	T5ZyvwCsa6j5ovf6YavgclPWKkodDMMYP0Irymwv5SiKhTrZ5KfU0CtSilgu4DYYyLG0U6K8Ypw
	DAq6DPwuAXzIoIPK84ZjwaXzzJyXM8DcoSfWcfv0Do+PNzSx52AZ5WYWUILmAC+gV+4br+Y/Na/
	hsX/DOVP/Iu3/NJNgi3DL60Rj0PQc8ICTsxRPrFKgJBFKjx4MJKXb4n5I1eXAcFzUylQCRlVfSZ
	as68Ep/m6WhfcMqgGFMxrTUWO7q39aLxspqInbY2hjx1rw2M27Bv50WMNieSwfBeydQQU66XKAO
	liwHKlPCTnpPC5dv/lXV/9MatW+fvX0B4ValtfiVtmu/uOn4F/bFzSLN30AV9Ww8nwzdkBEGLDQ
	/uf8elzj/HbryTJubJD6cRwmhQW0cR2+k7nHDcoFqg8Dyg147yxj4cBUSQQSfGHHgXsbRc83a9u
	kGtn9B3SiAojcI=
X-Received: by 2002:a05:600c:3492:b0:49e:7c4b:1753 with SMTP id 5b1f17b1804b1-49eb72fb6c2mr20631655e9.12.1789554665907;
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71813665e9.14.2026.09.16.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Julian Braha <julianbraha@gmail.com>
Cc: linux@armlinux.org.uk,  dvorkin@tibbo.com,  wellslutw@gmail.com,
  linusw@kernel.org,  arnd@arndb.de,  afd@ti.com,  aaro.koskinen@iki.fi,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
In-Reply-To: <20260904121825.43320-1-julianbraha@gmail.com> (Julian Braha's
	message of "Fri, 4 Sep 2026 13:18:25 +0100")
References: <20260904121825.43320-1-julianbraha@gmail.com>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:31:00 +0200
Message-ID: <sa6fqz9ij2z.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julian Braha <julianbraha@gmail.com> writes:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
[...]
> Note that I have only compile-tested this change, since I do not have the
> hardware to runtime-test it. Please advise if it would be better to change
> PINCTRL_SPPCTL to 'bool' and remove the help text suggesting that it can
> be set to 'm'.

Hi Julian,

I've tested this on real hardware, and it fails to boot.  I don't think
it makes sense for this to be a module, since most of the devices in
this SoC are pin-mappable and need muxing to be configured before they
can be probed.

Let's rather fix this by making it a bool.  I'll send a patch shortly.

-- 
Andrew
