Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E27443C10
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931102; cv=none; b=jl5phb8OQVraW6w6pNEt7dEjMh+4u0c/di2gCDWX5a2MJGvmneYWcuSjLeNphlVQBS/ewOQq/2SASd73MxTMN1cZ1GQ2QWuLC1X7HlovLlDB6FU+oZR318l3euhukgeSoadJUk6E80pdvwSs1dR0DG6/8aycsOD6+ga6a6hov1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931102; c=relaxed/simple;
	bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBZ9AEs+oj2goFKzwwF3UVVz7n0+YqvEo/dSqI8vWwiNt0ZR5MDPIMVFhNAXa8UIKwNQVOMizadWToz55RD8a+nFJQm6u8OvD/+IoLlGDTx1cDIwlVS+NP9t7gXI8NeNZ5Fod+SnEkGsgK8UQqUmorm9u8TiLtw1OBt3KhS7DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLbxvdm7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLbxvdm7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso5722302f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931098; x=1791535898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=sLbxvdm7KYpH6p14ar5HwMNE0jHQlB6E4xp3QidaU5IBkcLYPA4PavDFKQxaIF1R9A
         TAPGLMh0KJ2lV7lS5Pja7cBzhl6KjHuqOUCWlLtx6pVBG9iGe0gFEjuExAH+8DhL7QLg
         5HRYuljlLREXSTHmDVcmMyLRYOmYnacexy3kdENtWW2X/mGEhNUH9aOBJYxm2V7VPgwS
         zTq9zjInXJsfxJbacmvMtgdSUnKcMbCMlAe7VShYNzY9g+3UeaWKWE2zc0nd+yaB0mmi
         mFuqUcvBtXDG4zvbUfju5C75+wby58p5fUUDW+vk80c6HmINT2HYJ9FrnMTbiunW9KQj
         PTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=ENB5yrZVBgUcV1cGt6WLG9kbKGHEUDl2i1GmX6XcSg90qnoDF4Di1CrADIvFLT3V1S
         BRe3Mht3v+rSMn4Dhq9NOGWg931Bxfj6wBZxDjyurSlsISUa5lFmLxuHDre0GJde8mod
         +ISFAcgTLXzqpQUMV1W8H2DvoVTsuKqxpRVQzIwiC7Kgdj96UTmO0wJXTdzVJU+HiEUK
         tci9y5t4sQgWEP9s7J8nA8b7eZrGqIVbyNCVUlVOkvyyzy8/ycHjTEf2f/wovRW0piyf
         dwQl5vcYZYzw9LCWzeq4CPutcznWD91qKB05rcmqmXG6ypp7SPwQTnRaNCTqfvT+E9M3
         x4Dw==
X-Forwarded-Encrypted: i=1; AKwUvByiZTX+cG7RraNscYO5MMKkEA8OargFP89XyU+d+aQskUSqZ42UsE2JSGRC6e8iMmA8tVBtNQItj18svoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbWjAGiJDGMmrLWi55kszy60RqGzVh+wEUrvFdxl8PGxQWUpEk
	hGK80ZcUsum0WdE0ZiDGL0V8rLjbVIobL+v0dVFIrFFnTx4rG4PxNOi8
X-Gm-Gg: AYBFou2J/MNmPUilJdHEYdXrddZhBBM+4UFXnrP0RnTghJqO2BB3Txb9ysNw0qv0mlJ
	dNaEip/wGThnXjZ8ptjXVIHyVkWlFMNXviDD4mrdPV81y5nKxfQTAi39RbgIaM4OrY3CgV3WNQ3
	DvEeyRMf6ldSfCU+hEjQ1XcjJF05aRo5ifvkpIXkBg9hmAttFcRKQNs1EFmlZdG0vBGUBMBi/rU
	Way0L/GUkCXMOn+VWqZ2W6L9doz/BjqLiusDOwUXvV+XGdgnW/iiNVuwSAX+S7tNSQolpo/XswK
	efR0qG8B+HjDAiRU2TA0uviPLajOut5Bfr2sXIhBaw5qP/O38/DHbmK5PAc63oMpr5iQ66Kafjb
	UyIX2tixVHzlVKXmVPEFtz7kLR4wsKX/d6drk97lLiDV2UkkD5mhQGwkn/ifnVeRoVmopUv1yWa
	j8IIS+qSWnxLwNnDDvo4wajm3/rVOoUWJiC1d+8N5fFv0m4K/+9DBe4UzpQfCeU9dJEYU=
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr1928001f8f.28.1790931098356;
        Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm4165684f8f.16.2026.10.02.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:51:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Message-ID: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>

Please, wait a day between resends...

regards,
dan carpenter

