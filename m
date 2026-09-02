Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4049C4D5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373318; cv=none; b=MYV8RESz77/8P5jJt/BgAgfR+fBgR8xgpJ5ZJI/bNgwu7RJqIKHvvXTBifSkKIL27MhFPp7IYyGxCpmR7plb0gfs2aPoAL4ns/0c5tteF6jzBLP+MtMwQ2D5qevgISp9UWi7PdX17nJqIzgTYrKhNxwoal801w7Ss3LT63ld1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373318; c=relaxed/simple;
	bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+a3jy6TKOhDefQIA52+Ri39Ax2dnNaislQBAix6Oi/utQ6TGplyTXgVZGM5WnEH66Uk2qy18BeNOS3LQADRtarbwmRTW938MsWwJUN9lT5lhy+QDoPFrElBkFCUyJMAZSIe7256B6YJMGnZBizXpomHgGGiCYRY03rTgbUjjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLN7+Glu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLN7+Glu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1725275a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373317; x=1788978117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
        b=ZLN7+Glu0LAZLx4xENIFnaGDODayMt0YjSdScOghFVRndDk6Vj7Sn/0WNAPXLrGCDt
         x4ZQKdEE5aWnPZQIv6ZZnSM04U9E432L8S0bHCcyf1UkOuwIxwP3iOxnpMlu+6FSUX9y
         187KVISIEdxeVoqRVPR01djwX4RqaCh+CsILqdvTkUpUGWecipSpO/A7ipnoGSOfpyIR
         gUuvUbjATw+A91JfgIvHIQ6xUBPyGQ9+aiFqZl6FITJbahRw3YilZYi8r632wuzBoWo2
         VKSgwddynbUQ76R7qVYw21purvFYvFZRuVq/KmH/zZ2j9eUeUUovotv1FJ55B4y6oldo
         AlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373317; x=1788978117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
        b=mOm+LgeEvrCR+HUc7hEYOsW5lkda5hr/3oB76nwjzaT2qzuCwwgTg38KPGRYfqdu27
         VBC307xf+Wu58jk1dYo7tlp3fMOenLhcew38cl1pwUBZcYI36ICAw15Ghm5OSl5RrzA6
         r2U5yv1ZXZ1v25K/rQ+vba43bcYOBVRkEB8g1cPOizvFktP0FYaam9yCykAXTJKX/8GZ
         tedB/cCyqyTyC8XlLakHa0OUJX1uNC5sc1Axj85fMJPkIiMqUgy79JO+/EiDFsCfSuQc
         8zq+ajPsM9Os5ZZysbAE+fTgi1w1iiU+SsuDk7Cs2XZtxU+YGbH0NzBAO7lQIBXePaZP
         yivw==
X-Forwarded-Encrypted: i=1; AKwUvBxEpUPCI227XLnjqFp6X0jnoA5jMCUr4qM8qahpTfIVNtiNEw0gZIkr47FomZjq8N7u3hjZx/j2oR50RjM=@vger.kernel.org
X-Gm-Message-State: AFuF++nzxBnYUVgm4kgU9YOf8Glm+9IgldgH/p1rMtt8NWT+30HqK+Wz
	I7FLPhp/tOQ1zWLxUzEEFOIyXw2nEtj18FpYaCIZKG8wguv1d4QpoIYX
X-Gm-Gg: AYBFou3jl+mU5jZ70vBd/NAyf5GZpXoktD2wFxzM+jZq6rP+34GYLQWnPI/RxjQsHCT
	oVckxGAj8gaDWUaDhZnL9JzaAwYbjLPvH3YRe3zUYz/lmPoyPX2FKLlzHUjjZU1pDsET8nwZLFM
	jYbE+HQrIGRzhJQPFXIIlfaZjvfsjS2rC51Q82zKRjEYyyHw9pzgLvYff/Omh2zWW/TB+SmzBi/
	wvjItPrUGoMrH/kb/7XLhuzL+IcQkqfAy5cvxax4EYkGqSlpTFw7i+mpxFGe2NXUTxIyNROF4HO
	kWLJt8X4r8+SEkOCE/vN/BDXaxGMx35tRazpaCMdVXJjRr343cadSgJ/XkI8WwQKU941m0zhqF4
	BKoJxK/Uiz8njki0yM91bMDfvlw+hM3A9Bv167eWxqDskX28ksmKz9+oNlh7H4YhopsQmcCa+zW
	RWxB8q4pb7G+4JHwwsZdgHpRbklZ6S+LDNlkKA3EWXNSY14cPk3oaZZ6Sm352cKtEn4y3Cnky4y
	X/AVQK5zzqAZrdzvqSglMrerjmFxNQ9lNt73g==
X-Received: by 2002:a17:90b:5109:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39aee152d79mr10767129a91.25.1788373316382;
        Wed, 02 Sep 2026 11:21:56 -0700 (PDT)
Received: from localhost ([2409:40c4:d:5c19:7852:60e7:cc2f:a6de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f7d77sm8745198eec.12.2026.09.02.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:21:55 -0700 (PDT)
Date: Wed, 2 Sep 2026 23:51:51 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apg16LtZ-ru9MIBQ@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>

On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> This specific issue is currently not on my todo list, yet.
Alright, would you like to me to work on this? I could look into
that side and possibly come up with an approach.

Thanks,
Lovekesh
