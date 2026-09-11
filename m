Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611045D905
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118220; cv=none; b=cAAEtKMa1PD3JLbvnH8D7oFwIr2J67/bcy0oQibXAS29hCs6Okc20XDC1ROoi6vm4pBqbBaiAsfF/pina+nGEstiy4YKOgREkF79nHQekYA8fmZhdjxyFpF4mt2sU4OY6Uv+fVnrrr1AvDp0HyTARfKrP0Eq4BCYX9EF2DSIrJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118220; c=relaxed/simple;
	bh=9c1nzDHhGyO4LkFgJgh1cL44sqSfSbN2c9gKz923T7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A85Rt2Orq8agiugbmKhn17wKq/NSSDW3V2OndXiBEaMN7eJlkwuzheAgE1dNgl/7zrU8mG0oC+5HiIJHasRQhVWkBH4ULazhgdCTaKhwOsDN2obv2nEvC9iUdkzdbpppu3Y8U79sGBJUGfnxSEDv+OPK7/aw2ateDdqlI4EEr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKGi7LvK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKGi7LvK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so6749445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789118216; x=1789723016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSM/OHSWEmibsYmDwvMWryOqIC8loUCHyDzdossEC58=;
        b=OKGi7LvKXfl49hVeOOTCzHvH2tSaJMXofUkgtLIVd+iuEcKa5ktVcM1lCHXG6je42F
         xMGRFPHx1pu720eXBCZzyaQZJshcgn0uGJfWL+Icg7Ro/XcV7YmyNQHZAxy3ul7Soi8v
         s7xplouok2AtNl7gemClPHN47gzfV0rNgjoixxMoNPRNAjErfIENGczaM1yx1YEMozel
         K1MKzSDKWvx4Rzi5kNouba7ZpZLvG7EbktZb7zX4I6GXOYDhh3es69mRvqLuNtogyZcb
         DqSAuu1lgQcz5tzRypMaAOyil/jsNgenf4zF6b3rJRi1FsjMN0/trCF69C1RdZM3HMD1
         7WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118216; x=1789723016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSM/OHSWEmibsYmDwvMWryOqIC8loUCHyDzdossEC58=;
        b=jTvddD5TVPOSVXiAFIwI9OL6MNfqY/vHWl6oB5JX6sLqwg1c1pL435A4vo/8cw1kr0
         bOa5ukfMBRnrHzmLheGSxGWEVWulfWp7vM46xbcxDKDG3hrXnfqofquZ/p1fNIWe9LiX
         HkGhYVJ9XusupakVtwO6UoEDYvPyRLJjR2ugtolJlW8WC6pULDZFYnY3AGBKKs57scbL
         8Tk3/FGmzsbRiBIJRwepBIL99q4fbx8DfzK4vFi05XkBGXjLUeQ5J2ABwCMHKGyQXJH/
         jDVs5YjY3iqMb3Gicdos6G1o6q7kMzhKLWb3Un728sivOK+x0IY8rthF1VH+m737bKYF
         Is7w==
X-Forwarded-Encrypted: i=1; AKwUvBxO8Yrso7rOK7GyirQTeE9n4MpQwgghNDAiH101SS35q0nZv36K6k5TvS8sDYzaFb4Q9622xrAoRsjs8SA=@vger.kernel.org
X-Gm-Message-State: AFuF++lC9FnfrwtzyOIYDx/6ziovIR5XeFg0RczBrptfAsdcrAfhNPMd
	gE3UpH1nnrWrI75MEhgjyKL8OzdeWfnkn8NKFHlyvFQEzUkuBM6UU8zP
X-Gm-Gg: AYBFou0O5XWDo8/8MOVwfWjaiIE/Wf0PEyzjvCIGFgrg2cAWr2ND8u4YTvWBRTm9SdF
	E1QRz11x8Y389IAUCD/0/oKrU8XlNOb1QFHlLTrGxn2STWjIZC2gyGKwy0jjh7dBeNiQ3kvVVZk
	LteMpdmmRpRAOvJdf+v2uY33OTVgyaYUvmR/9pbwrDxQNITfOqwhy/DuOWhFUyyk3n4bP0VQKzU
	D9kDVNLeUMqQQoVLQuvjVFwMGkZMzglQGmoQjWAPk4H8M8+isSbEcURaR42fSSQ3EFQ4Nwf1D3L
	lCCJ4U0/KiVT+424js9lF3V0ALmVqXXKMlyjINVTJhQ4AjvVHivn1okLB+oZKJXbezsi3dCfgBL
	nbK7xkQxVtSHJDVxBj3nu7wDQ4JSx1pfWBNmYk5+s1w6JGFT7024XNERPQnIffw2YVeh5+oYmyb
	I6uOqS+2YktrLiNgME36x21vRztjSZcDuiMYCpVwr4+ZHkt4PvuhJiM5nO1b/xiX09H3+fKusr/
	TFtwYsfG2ny4+P8RlE=
X-Received: by 2002:a05:600c:c4a8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e619e0f7amr32254555e9.21.1789118215893;
        Fri, 11 Sep 2026 02:16:55 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm4494708f8f.15.2026.09.11.02.16.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 02:16:55 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:16:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Pierre-Loup
 Griffais <pgriffais@valvesoftware.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:HID CORE LAYER"
 <linux-input@vger.kernel.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, Curtis Vogt <curtis.vogt@gmail.com>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <20260911111652.703b865f.michal.pecio@gmail.com>
In-Reply-To: <2026091133-silliness-recollect-e190@gregkh>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
	<20260910170254.833871-3-mario.limonciello@amd.com>
	<2026091133-silliness-recollect-e190@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 07:54:12 +0200, Greg Kroah-Hartman wrote:
> > +What:		/sys/bus/hid/devices/<bus>:<vid>:<pid>.<n>/reboot
> > +Date:		October 2026
> > +Contact:	linux-input@vger.kernel.org
> > +Description:
> > +		Writing a boolean true value reboots the Valve Index headset to
> > +		recover its EDID service. Writing a boolean false value has no
> > +		effect. This file is write-only.  
> 
> Shouldn't this just be a debugfs file?  Making it a sysfs file seems
> "risky" as it's not a normal operation.

Not sure what's "risky" about it, it's hopefully a root-only thing?

And it's the only supported way for userspace to recover buggy devices
from certain failure condition, it's been suggested that this could be
run by udev scripts. Isn't it more "risky" to ask userspace to mount
and tinker with debugfs as a matter of routine?

Regards,
Michal
