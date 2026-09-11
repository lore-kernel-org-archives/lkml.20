Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69262305670
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088145; cv=none; b=YgJvMN5zlSN7sJcgSm53feWYNtCvFQ8rRqFCBqQILzNyXMtDLf3L5thwgyoxI/Y2F3q8dX1gwh8H1TLJwWhJtOGUnC8CWTKDPYm6dSn2z1M99auUJDqrKdKxSe+qr702PhhvJvQra1Q2lwij/icsx4lsX+95Dg0Xrea84yk0uwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088145; c=relaxed/simple;
	bh=kQWpc3BV+U9JUEReCtGuwJXKFGM1uWH1U0sMLM6Pdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fspUtLoE2o+sX7D5kLswg6bSdPUUBd6QvZzH/dfDSe9ov4OGmbtfMUjxnT77OfB9frSr/z7Pxku/DlxfNBTKpxWXFMRPEJkkwHGQRGoEHuo7ZiPsTglakbrzy1VcHY9fgi09rM2L7RMXwds0XskhTCUMT71aT5Xi6t1YIvbVNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLOEP7dw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLOEP7dw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so429915b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088144; x=1789692944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=JLOEP7dwPdT9A4akfGf74DcuSKrE6mXkflVWY95Hv4VnlXqUTcMYg4IPbNhryibEpg
         qIxTvlnQbyk1hwEzRjeUUlfKmKatkSPhZWlrbqVfvBHBA8zK9S+J7FtnI7jJ5nHIv3wD
         BU6ULdGw7Cs3thAq2W5CUDnfUzxhbQi2G6Etk3j7QglfeJzQdyGSd/XaNZf/XA2pPHzH
         mUvfN6mni2nnb/9/VeRVdpiQpnxmo5AG+CYAbL/pirX44QkGYmAFoBsd2Vc14gOT/ZE5
         gSQzEP10rH/dkZfhcQ+vsEXk493bP2is/OKFle0stkHDqlaJ5f55o1sC+3QmhSOUfe9A
         7f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088144; x=1789692944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=VDeEjx3DSQK95r1xJUNk3jE9KzH/VNyZmNPi2fKO6x9mKs81JewBhlxIMpf1dVUQYp
         7m02+vWEEYn/QLwGPK/+LdEtnViptV4lC8V2DurqhoCbZJ7XS9FXJCn2GXQT+FkpqlIV
         wSazUjS2UmrjoVuUk89j0ROKLcLVi17I8a17Z+I2d6BxcI9M2Lfj/GAb4EkcuJtHelRS
         Nj1TAxjQsqNH84iLUCroc4YAzEK5b3nNbF8dTnnKxxGiuFGN61xgMlisn0/2ep5Uhvv6
         LXTPO94Q/wnwQGXpegLiog5R+demDDwgP4PcDn5JaVgJ+oiFJhVPS1toVujNmy2X1eeY
         QJOA==
X-Forwarded-Encrypted: i=1; AKwUvBww12rLI+s+oZeMzxPlL+2EKX8n3UB6SOq6ThC8UMoI0W1O80b7M1D57Mpfr46aHwgBMREeN+BLaOrlHyE=@vger.kernel.org
X-Gm-Message-State: AFuF++lL/MOyOnmIyMy0gbhApZ/CVjICI76+cR1sdfchMUnZmfAwYSb6
	Hn3LRJF9gSweOOPG6ez7QOjSqzBMLcWXdNSRAzvkYjpJLJXh//iJFQXv
X-Gm-Gg: AYBFou2LracjWhWHlLK4/h4XTlAAnCQOpTrqVe3mMgD/UkyHj8fl/XHJRbN6rfMvZ3Y
	tuExd9oW/yR1AJhJmw1zGdGaFFs5IB5RQRGxoJa39EMgsxyDN5xRLcbNU9pkFTGTtETfCIihRhK
	0RS2/Ky3vONdbLYn1SIoCdwrg7HdskLhmfZHrl8AsDxteAV+WekuluyO3kIPX1Qksh4POtMaxLb
	TL2vXCTjJxwLxXrGu3VijjSBu9/QF7EcA55rO4zcwPK2Q0zKNu/GP1nIgD5gkCj0BOpdJj+QEt4
	avlKRictQNgs8LmauO02pUSHkg4Jo0JcdOmSr7QErFO0qfAdzm4/kmXXskLg4q75ffdFlaH5Dl9
	5Po9KYSKl/ipPIWM8Y88kYZhiQvQBbwYzvDf+YJN2uxK1GzEEbKC3PoVKItNwlnVzQwjWY3oinM
	smAvt9n/ymo0xoC+c6SiiuvRRYhhpw/NiDzer9D/zsEyzHAX21x39P5v7GMTsK3B/UDpJHLKvLR
	jYUhjhQjV9y
X-Received: by 2002:a05:6a21:a96:b0:3d3:afeb:880 with SMTP id adf61e73a8af0-3daed895710mr2723199637.28.1789088143739;
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm1469131eec.30.2026.09.10.17.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:55:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: arctic_fan_controller: default PWM cache to
 MCU 40%
Message-ID: <ecc9ba0f-03cd-444d-8b47-f0e8719089fd@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-2-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-2-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:03:59PM +0800, Aureo Serrano de Souza wrote:
> The device has no GET_REPORT and every OUT report carries all 10
> channels, so the cache has to start at some value. Starting at 0
> means the first sysfs write to a single channel also sends 0% on
> the other nine.
> 
> The MCU factory default is 40%. Initialize pwm_duty[] to 102 (40%
> on the 0-255 sysfs scale) at probe and on reset-resume. Any initial
> cache can be stale if the module is reloaded without a device
> reset. 40% matches the hardware after power-on or power-loss
> resume, and a first single-channel write leaves the fans running
> at a safe speed.
> 
> PWM is still not taken from periodic IN reports: the device is
> manual-only and the host cache stays authoritative after the first
> successful write.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
