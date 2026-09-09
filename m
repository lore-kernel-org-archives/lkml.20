Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843BB584966
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988072; cv=none; b=t4bW99TN9+w3j2RdQBK0n3rOhh37ZjNX9kyxXsnIk4GY2tawUKnzPXnELh0zeenl49+Ck6LTW9PBdpM83O+aDKF2WyTonmrQRUpz9xcPh+9I7wAR2UuA5Trft18SiEtgw4/B4b3Etd6/aEreQCJaC4/Jz7VX61OKxN6JoyhTj0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988072; c=relaxed/simple;
	bh=8k2rxuvEKvp/msaM++ohWRokfd4pezuIMblVCzlLN54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URcfcz+gbQta+AJqvwMFZE0jWOTBV65Qn9XaTebb7mfHFo8JqS9esMNvU0sQp6HkMMhFi/kcB9J7mUOs1K+PWlZW9SStRpJSJhoDVgDBdd/yHoHr95t9ACPPzrakQnr1nCSZ8TQNCSJuPr16WnQKvtI4Dfu/zft1ZmGmER2zWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq4Utlph; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq4Utlph"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso213642a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988070; x=1789592870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFArVIda1wvoblNEqEkcL0MbDi6T0NMYEvB04Xo/oDU=;
        b=Iq4Utlphn0SHrqTJ5fkQQEayvEMF5LSOkSs7bA/7RVon0EzCu6ZeSG82lkzZtpT1n1
         +J1m4QuOYrBnA7qOVSgFAxKBQOcV75mUFwrkY84u53+VTw/+vhECz8DGJXbYqGGsekLl
         3YTxdtATAwglI13kxmn4c0fNIA+LeUjFVBFSWFY3Xmf1gGszZmP/WikxenZocwNi2580
         mRopzArPnDe3LNIyKx+IrVBoxhic10UxSYPn+wT8yp1cFyLxx4nLPA4fIydARD6zJuWq
         MDiK5k0+k///BhLK2s1fgo9HOiSJegx8WS9BMZI+ulSfhTvxrpkrNBCJCssNI65qwGdw
         gL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988070; x=1789592870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFArVIda1wvoblNEqEkcL0MbDi6T0NMYEvB04Xo/oDU=;
        b=jxnz+0RlAvm5tbcekPbccKLu1wS6wvbhsFisKypztllk2J0PUQ3FyAZ0dkeZks+CMm
         j/z/JQzbIDUZeR9b3ZVHXRlp3XNBBMojjudrf5rJYq9g3//uXI1ourdf/9Yd8VzqKw3x
         nFZPg0Pbtp1xtinZQGi5ZndLzKBHxmAtVSuObLkgkWyeXfEeF6imZy9vgXgsnqDad3wc
         hZoBKmeJEh/jlVGKmeR6vJaVo2LJ4AwE8NBtNuHEixqyinH8d957wI1GQohmq1XbAmmU
         h/p1Aj+H6Vdx3Za2jT7qim2hLg+4Pw5a+n34fntw0jXyVb9N2WwucOQRUTWeuiHe3Gfw
         i7uA==
X-Forwarded-Encrypted: i=1; AKwUvBz4DPxrvlZ9KHpxlOLQdBZDdvpZmYkF2G4v3tQh2FcunCPKqZlgoZv/SeHrMDQbhVGyji4hPJstP+jp2Rw=@vger.kernel.org
X-Gm-Message-State: AFuF++l7d+cAkUxyWNcylM2ebavvy13PYnmhiOPDdSYuoKDuaMRgwxXP
	4b7Nq4Xwcz+WK4rDqawcyMXOGvAPPH8pL8vxWqluRZwyqVxjs/uWqguiFbTvag==
X-Gm-Gg: AYBFou2hXA0gGWJ8J+e1rKJJeXY2gF7jcEDXgSHXY+IPpoNU8K4x51QL7Mk5cmmDK8u
	Zts4zjsXESpGnwXYqfpSioGQj1Vbn00I9wo0Q2TjxyG848FrEtZl2a6wfkHleN/YdL3Hk++cpb1
	w79pccnoChi95VlZTIxxniimapmwiS22QOO5phTuAdMPJpjWe+SABva6XenGkQfL+XMWnlJTQH0
	fiXY3vY1g50IaeHTc3FNpR1Xcv2Jk/7AngTdXX7ThNxbldFPQiRFIY3dGHau8YuuddT6wTJNxvH
	Whb3TslnKeQULdlYGnysz0wfg8JdRG+jYNjsfQTVgbVokDtnmBC8HY7+3/Ve9pWCF8zPu1ch1l3
	JI2lus39vFMELhI4zYUWEV4quP2HhfGoa3tCfTEokIssMlENRwN9FIKP6YpAaRtcIZ6Kf0fNkLy
	H5HMjo25xhyeFpjFLte4HCp/jYN54PlZjurChTm2kId/HZIMx/PXCf1dhVh2hLXDw0YdzMEWyoF
	f3lwDJTlkDl
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr57919918637.9.1788988069777;
        Wed, 09 Sep 2026 14:07:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4a636abd1sm1300347a12.11.2026.09.09.14.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:07:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:07:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] watchdog: msc313e: Fix NULL pointer dereference
 in PM callbacks
Message-ID: <f2cdc4eb-254c-45fb-8801-4238a2b814d3@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-2-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:40AM +0800, Tzung-Bi Shih wrote:
> msc313e_wdt_probe() doesn't set the driver data for the platform device.
> As a result, dev_get_drvdata() in msc313e_wdt_suspend() and
> msc313e_wdt_resume() will return NULL, leading to a NULL pointer
> dereference afterward.
> 
> Set the platform device driver data in msc313e_wdt_probe().
> 
> Fixes: e9800b799464 ("watchdog: Add Mstar MSC313e WDT driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
