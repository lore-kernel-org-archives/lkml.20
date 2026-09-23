Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE6378D8D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135255; cv=none; b=DyQkDlXeUzaFbikiG/7LA2qKvrKjXz5s76x5xr3WlRVNlMXFzVyLDwYa4VfFZj/g2jvtoSZ8TEBZMdTzlu8FpFgJqCT0qLmSd5Jip2qI1SWuRESKETmE/w7f/FmC5ngkeq98o1rpzQZRaci6zHxrn/7/Em7+QmG43LNa/h/TEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135255; c=relaxed/simple;
	bh=mds5LaoDnAhtJZjxPhR+U5MDg4hOmQ59qLngSFzyKpE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ChWap/I7M108VxdAuGyJ8wzm2DOdRF4yV//qVLVxZxp9lxuksQbIUllUKmDjcbx0gHl7SsoLeBnVvQ4jetazHe4qjCBkVVDVL3dPMWfyHdXP6xgGPyHDvLXaa4UdI8sIaf6hTwB0ok2B160vz7Di1veMX8tozql9EYlC22TnPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieXr2VkQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieXr2VkQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2641265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790135252; x=1790740052; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n50NtDqLH91LeFgcnpR6M94/AjIPFqSlb81bC/4TwTU=;
        b=ieXr2VkQxRTUzccch8PhcXMUGfi28PK6RxRLc8EmF4M3u44cR+nr9p5gLn3m86Us7J
         o01X//TZeghmOv58oRA1O+vGz0zCDN4k99t8uwnqvcgwzaQDNk+h9NXXRHSbtRNnYmjd
         SkzIAlTOErqFrXFUrizlkoAKwHWXQjGwhdm7y1yhWu5fjbXsxb+URMR+CczhiOUH6sPB
         6hhGkElzNRWVPpU6OwYjwT+Nbv9+ICGlf7qeI3ODXKzM6QSsVNuB9T1SqAd28qDCjY6N
         wNd1UbXZsewOrZ0FXV+faUIUs/Iw/aPLTBc3h7lWEpMA2XGEEd8ZoynFjUIVkOx5BZT4
         AQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135252; x=1790740052;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n50NtDqLH91LeFgcnpR6M94/AjIPFqSlb81bC/4TwTU=;
        b=b/cGZN3tgGXztzuhatKhvzHpYnGhLOaEHsvesOjJ3oTDnQ+KaDoOyFN6inNTQ+Wyx4
         aJ+wOJf9Rejfc1ciwOZuLKPwoeD0QEobF/2MaOjUqJDYik5f7qhZViCaTID6oBqGwDCD
         Knt1QigrBJWGdL0+yBHZXTLL6DaU1S2DAd6mJUg7X0KwycMQnB7Ik1hBHZspvzhgGM/6
         ZpgNll+xo+nQDUjZYcWFHJ6nqxXmM5OCP4vilcsxvSA9vrvgUBERolZ2/FymIzvMFeZU
         +NtSpEe+SpXOBQaHbC9/dbUjtgOTkLBiNrAqCBbcHJk6c0eTftk6/f6gReJqOXYbsWzx
         4YPg==
X-Forwarded-Encrypted: i=1; AKwUvBw79kA7utRh1/OiKe5/HhWRIT82J7igEBZKZp/AnOHc9HZL0uHWNZdeXJeBCsBdfNJF56muyrP1s/iLfoU=@vger.kernel.org
X-Gm-Message-State: AFuF++mj7fRlpXcZGvdsbPVxtJUO+e8mpEmp3+6Q2GW/hxIx5kgLGuM6
	Ro+ISMTSr3h1fouOgP42PBl6sBoEPLY0lcdc0Y23GywFNqLNLlqoZ5x+
X-Gm-Gg: AYBFou3DkwrxsNEf/S065wXN78Rtahwo9bcbf/VP9jd2np7WNx3t7SCjulmE3QUXUOS
	VtnRXlU/rIyX/fphTGTWuJUfwM3zOkyuuNugPWZaKi5uioU1zQKmudYpYRAaLoyJzr404SUohnl
	xsW07Fe9YQp9AG96OpApVZhhQ3c4IKx2j5RL2MzwA4Hc4oP4qLpYOY39rDdT2pCZXF5XGLUd6RR
	OG57PC//Lr8d/WQOqAyffJJrBPzNhhf/mAUlSpEeZ8nOZ6P+SZaVhzANHq7J1yy+FCi2NB2H6Ba
	7mGsic13Y0xDgW4aCk5AYL0XrwHGiBwsDDEwaK/jeGUmCkTGltDedr0DesGfAqRxx0mni3hfdHG
	JEKcrZijuJ/MYyGu/r3rpHtJMmYbWgm/pjQ8p4cPjLrGwlLE1yqiwEACSYPLQ1xnDqJADReXA11
	1+F4H0NuQ/8h/+HUAesqCw6yIpVKsKKiWPSWvJYNsvcmPiAqJxxRO4IGttv17p3nqlPD/gEZYtr
	X2kG7NPGhJsK0+m1ZTXtkE8DNeal7m0u7IPZOvolGN3qim/CGAFDxdlVpnEcKFod1wdFlHlMfa2
X-Received: by 2002:a05:600c:500d:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fdf139bb0mr13552775e9.26.1790135252023;
        Tue, 22 Sep 2026 20:47:32 -0700 (PDT)
Received: from [192.168.5.15] (brnt-05-b2-v4wan-169762-cust1351.vm7.cable.virginm.net. [81.101.101.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a3b46sm39159965e9.11.2026.09.22.20.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
From: Bryan Chan <bchimhim15@gmail.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Bryan Chan <bchimhim15@gmail.com>, Borislav Petkov <bp@alien8.de>, 
 "open list:EDAC-SKYLAKE" <linux-edac@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
 <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
Date: Wed, 23 Sep 2026 04:47:30 +0100
Message-Id: <179013525089.122719.12798013417319991127.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-09-23 00:20 +0000, Luck, Tony wrote:
Hi Tony,
> > The code works fine and works how it should be, the fix is just for
> > uniformity/consistency of the bitwise operations. Also fix the compiler
> > warning.
> 
> Details? I don't see a warning with gcc 14.3.1
> 
> Which compiler, version, and any relevant compiler flags.
> 
> What is the warning message?
> 
> -Tony
> 
Sorry for my mistake, this is not compiler warning, but warning from the
sparse, here is the warning message:
drivers/edac/skx_base.c:359:46: warning: dubious: x | !y

The command and flag used:
make C=1 W=1 drivers/edac/skx_base.o

The change is a style fix rather than gcc warning fix. After change, the
whole operation will be bitwise shift and xor, instead of bitwise shift
and logical (not), which increase readability and consistancy.

My gcc version is 16.2.1 20260810

