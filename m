Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275645921FA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988748; cv=none; b=u3o4O0zKn6yspuAnKCjn3zbtysJZyMH/wH0az30tQZ2WMsBkaqv43Zg1gZRJ70NTvinIrky+nyJT8I9gLs3/9+IKBgjlsLzN00XkZKFxPI46yH6DvW0eeje1nefDq7ejHBuGFJ0Yz3xSdvf3Z4UXwFfUGWn5DTPVOMGkOedGy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988748; c=relaxed/simple;
	bh=BUdZUC9kvXMtqxFxBtgzKJJ3yAa4zgVCDgOAePfWYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNC7WrtbVf0X6O+6MGrBrc+FaIczE6RlKbTs0UKsWy21qNF2Muf/Zys+w6h9VR7NjvNhmXXDZv7lfP9lU5ReElz4BJyeGFD1CnqceCbr3EuVpmRTv18L59fK8MiMxNc+FB7qZ+vgtHSD9EDXaYvpWFXcVo0xnVDBIsQGzVGuffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXENsh//; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXENsh//"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d58efc7356so82596365ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988746; x=1789593546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7azo53s70BncUSK1Vr25CtM3yK3TBQvzmoA81KUUK8=;
        b=cXENsh//b1Do1xt2RPAf1P7jgyzJbit50UODLjgn6Dva+AVxGoNDMhmD1UyXDlzYrG
         JHFWXumxHW9H/G5Ny5/Q6YZMqgexEllCqgK693GXfmdEBGyzb1Mc/R1i4oMHn/Rwbbjx
         cMxq12WmbOu9xvco8AxfS6fqX4Le1nyjXDk0RGpb1PM6HjlWOPFIInkSC8FSG58NSpNL
         t0mh7/RRMrFGyXSefhHEArh/4LrPikkjXUc1yYSLf43k71QffeVkjv84V0evwlq3BXxQ
         Qf7So5s4+IKvY5eh+5RqOIGDZKNr63Ngz+s/XyRCjHM2cc4DKbPz6+T1C8fRznyJOzio
         H9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988746; x=1789593546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7azo53s70BncUSK1Vr25CtM3yK3TBQvzmoA81KUUK8=;
        b=MRsaycG86z+jgG6zAn5ESCC8YGiHmiJnkEbGxUcEN9maDWRmbo1yZvZMLfjhshaBSi
         O0zcJhD6OAD7g92umSjDV5IZvk9ppartz75aRl674DdJyc/zz1dplHgtBw4+/XrEqzfP
         M4gjNJnR+E2gOVTWxJQ8D96fIC5ii4WXc+/cYQdCN0ChJpV/CdwCC+filkdQJGw4rT6y
         hig62m5v/DD67Nw5S3cNPsxw/nWt5AJLHTTTv+mIr0vxiMTJ3r8QVCzWee0nlOMRZQUR
         SoRXv0r3zPgyLaP6nEySbnlK+/oSah9V4QM+FvDCRBbXTyzoFQmGNmq5cha6UQYE64MI
         8LYQ==
X-Forwarded-Encrypted: i=1; AKwUvByMJf2ya+mCiGaYYQDyYIfTP4R2qvu4fKWI2v86M8RkzPpRMKp4doUZ6PBZqO5w1k+NfCEHVnWyuJmG860=@vger.kernel.org
X-Gm-Message-State: AFuF++mfNI/q2AtzalhxeHXJCi2xEJdY4v2+lEZ4hX0cvmqN1WV8bsJp
	Fty1UnhHruvUXZMitC8X58Xy1NK1NEmUsD57M7Wc5zzIxQ+0XZn3tet2
X-Gm-Gg: AYBFou0Mg5V9cYGWGUL/ES7mvWlXjKSjZZ8G703xVthk3zAKcZD/bZeKyJ1lbkLIsvR
	Bl5ng5bbL4WFCWwLotiupFojcSMlJLBhSwEleXkqVeixQbRdKYTTteQqogArYD72/w1o2mOVg3e
	SLGmhGXjY3g9VJBX6gjmypbHdbpxAyxL5JmfMIeLpc/GzHwjArHew1elrF+Oy4Qam0IIiuLq2Wy
	wjJ0zF7P/9OhULnyGnULxhApvJrbQu61UoJtFDovzKXPb5WsPO1M9lkuB9sG1hAb3ifP9RYiH3O
	btuwHzlSKCOrwgBjVQDGP/2LJ4zheWDUcKM8viV3FbnqupwxDbAPM3veHvLj9pLPFPr/H6HS/e9
	jPJ84LjTPmQQc9Ij7CkLUSUFeuVdbNEgaGkJl6bCTqFYdgNKVuP59y4fWw9bWJUDlMGOWDXYcFO
	Arh5CGkaaoWQFoAwqHi3gACM0Qs4906BIOkLHwXEZeUt/NIHrCPCrc44sU0dwcVuh0vtknaE2j1
	AmK59HEjbVMDg==
X-Received: by 2002:a17:902:d492:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2db125cce1bmr506327015ad.3.1788988746227;
        Wed, 09 Sep 2026 14:19:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959961sm79255245ad.19.2026.09.09.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:19:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:19:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] watchdog: msc313e: Sync timeout value if WDT was
 running at boot
Message-ID: <22e01d39-2e7e-40c6-9d60-ebbf81cb9f0c@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-8-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:46AM +0800, Tzung-Bi Shih wrote:
> If WDT was running at boot, the hardware timeout might be set to values
> other than the final software timeout.
> 
> To be consistent, set the hardware timeout to match the final software
> timeout (i.e., after watchdog_init_timeout()) if WDT was running.
> 
> Fixes: ffd264bd152c ("watchdog: msc313e: Check if the WDT was running at boot")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

We might need consider the potential problem outlined by Sashiko, though.

Thanks,
Guenter
