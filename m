Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F26B492E40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973214; cv=none; b=m/hrbgCyhU8BfA4pu3xJtvvZd6qVWHSOdYmYpx+VmXnf90qef2dS5vhwhCJ3ZUhsCsSgMoKNAnGX9FYezMgN0nXA/nJsXuvUNxgOeOaoxdiZmMjrtuMyT6d3dwA3+NMhsw6rz2R+OR5rSRa8JXExIK5p224eig68yMHs+zmVkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973214; c=relaxed/simple;
	bh=VQZ4jsBa8FVHwKruCaLxhLSbNMbUQztOQATnNRIP7Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DavZt+ktwQz8u/H4ylnUDQ1swtz3mPpIl1y9fGb2mbtjw0l1zzzguC51AmbsLoAa64HCWUScD4M8tNVPQaT1oDRZlVGn1jelz07YfjEagyAdqbfKUQdEXd6CPqWNuLo6y5Co/p6l7QkwmrBZpksQKbK6js5whfzbzdIrZhNzm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJY+qKNx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJY+qKNx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d91ff7d9acso53293165ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788973212; x=1789578012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0kE2fYX+bPteq4jCJ9uTER06a1j6FkCAt9SyCELrpU=;
        b=NJY+qKNxsc2mu92pRo8eZXg7/EsjVWwiDx4l6HIXviOSDP8EXjUrVF8evks3AuoN9O
         XjdQccA8ARgztNiwxg0DKANEn7fkFxzP23Y+kLsuEeveBXecRw5Yf18kuPLDapnEagw9
         TUNFmRXGVpP+KIuFwfFITi1e1B9bXO+86GTwQPGQ+aNILpSThUwFdanAf0MawsHo21Re
         4OarcX2RstVHsOd3GgnQj0XPC7UvmpK6GzMkwP+EAufX4CiP/cg/YMVdysIPWbna5LgR
         gpQRwZ7oVSWSg0TAyO9vX7c5rOhHvMGisgWbu8koUK9N/zsAF33BqNAdnSZkVozQoB7N
         eR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973212; x=1789578012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0kE2fYX+bPteq4jCJ9uTER06a1j6FkCAt9SyCELrpU=;
        b=gKfPO7cIePscPwGOBtNQYPTQFHqj1bO3P3B9XO7E9vCoPALk9n/7G61AwpV7kGFHu/
         IZ7i6gcm8wARPDwy3Lb1QB95fkHRrFs9e4QJgL7lpq4JW4no+DFp02fhsyp6ZaICZbu8
         5XLG83tcge5stZKWM2Lc6rGvLz5BchTvsSGF7PVgRWy6aXgcV0lj2eTr0XkrECNKUGgC
         pggpw0zPF8/TeRYnihWLyy5Cpi52KIn2sF6scYC7nHXT5WDK1Uv2njQyTvpvnyVWhGDM
         TWKPIxYi1ChXxIIIorpRQAjkwA5TT42MDeMhawHRzlDY+XwEhVBuAZLeSwD9Y+5jYL5+
         ZjFQ==
X-Forwarded-Encrypted: i=1; AKwUvByqDUY+BXkFyNgKSFtN+rzJ/vMYW2flUBb0Glr+BgUVq+Dg5SX26yxaKFVFdHJEEWXHCe9pCcsu1JcSdCA=@vger.kernel.org
X-Gm-Message-State: AFuF++npr3SMcZ0X1oqaJQ8T3Ac6mKHhrsIKtij4cPiwA5E66gDIbp4i
	7HIEKxNWUw+2veXzgcfQzlUhjrTo3OYWWV6NnrpEt+qWz7/oFWMoIgYB
X-Gm-Gg: AYBFou3vJfMDYT8Ik0QHIOCHCOPoLuuWMiMnhagCH2Fj2Lw0B29eldTL3fAiYN0/Gtp
	l9Vs3/ulADxkzvQPvErzX1jQJpBiPnR/fumvk2EETVy3lgrHlTcwTrj7kKBQZv/n0ElTCpHe9GB
	a0/CBH6SFc2i+7OA6wh3FVn3aIA5abnIObgZBTiL47iZpjRAzdPH2n+GIzaE6TqN5dVm9P3dASg
	30Z5crlVarIsDuDxa7NIY9IN8ydXGHhPUPdlVsvMnhfw9qVfriEuO+QOtfB4C6Cm3aZyDawvtdy
	3PkmPVGW9sasVkLmwJRrCjixWbShfxQrg0a6H/LAxwO6e3Bl/Y1LxdKfs8f1xaQWhdDUbBb/ccS
	kjgrzC8PPRGPceA7di1Hc/6mhNiYzkksjWxMpwN1x19M8Ziy1ms0X5YKpVxvrXKWcgCP3AgFgwo
	n8xrFdsELYqR7zeDuyJ3UzVLgeBtZYTNZoAn2qz4JOdFZL4RqN12Os98a2jVxNCsUIlio6i+UEq
	Hobb+I8bFXo1pmh7s07O1Q/hZHb8EQvD/PWu0s3
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr504321585ad.7.1788973212122;
        Wed, 09 Sep 2026 10:00:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm7323636eec.13.2026.09.09.10.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:00:11 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:00:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>
Subject: Re: [PATCH 0/2] sh: mach-x3proto: convert gpio-keys to software nodes
Message-ID: <aqGP2P3-44dmCyjz@google.com>
References: <20260704-sh-x3proto-swnode-v1-0-0c039549dc46@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704-sh-x3proto-swnode-v1-0-0c039549dc46@gmail.com>

On Sat, Jul 04, 2026 at 10:04:36PM -0700, Dmitry Torokhov wrote:
> This series converts the legacy gpio-keys platform device on the SH-X3
> Prototype board to use software nodes and static properties.
> 
> This is part of the ongoing effort to remove platform data support
> from the gpio-keys driver, allowing it to rely purely on generic
> device properties.
> 
> The first patch adds the software node to the GPIO controller, and
> the second patch performs the conversion for the gpio-keys device.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi John,

Could this be applied please or maybe you want me to make some changes?

Thanks.

-- 
Dmitry
