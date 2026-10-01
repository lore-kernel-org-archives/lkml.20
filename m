Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297F3B3BE1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851349; cv=none; b=thoM1ryqlxggvAk15dCnxpTl3Ts468CQyO7Si+PxoQqkuJ00/dlc/k7KcPY7rUC2qcRo59GRnMoG+IDkSvM4tuqv5B03DT7ItFy0ZyFU5tQzk73sJqIJo094khjxZrkCoOuWfeKqhMD8u8epvpHj3L+6pPEpZ+xbcgFe2TgGAmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851349; c=relaxed/simple;
	bh=lQZTDSIHL00paX37Uy1dmIWO7Foaykj82cQvGVzut+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKrXjz0N8Z6SeJmCIakY+z9HTxpoovUisVKBn6s80mBhLSa0WwSqZl9gYNmSPFOxWlEL2nXwZfMXKFDH0rl9MKSqPRJTR651F5vXIjSitA59YYbxoyqdSsaAanUtM4Qcq1VkrmWNEcB6F9xXzPaQpQJzrbEuRJgr16qske/ZYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC2kfYEF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC2kfYEF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso42075835e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851343; x=1791456143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQZTDSIHL00paX37Uy1dmIWO7Foaykj82cQvGVzut+U=;
        b=nC2kfYEF/Usos6OjjH1MgnFunuUCnpr1MwnO4/lS1JlUW0eEmL8gfsM2ZSkUAlrMQn
         fTXWpt+gYV074DEQWAa5CsMT6KLmwNgh2Mn/RdacSGX+hm36/9RsZ/gACkmPMW7WVpzV
         K93jzjrEl5KrKujCm8unrA89z/b/BwipQlVPHHT1Ye0XRjOhg7afik2UI/kMluxrdXeC
         A4iH5FDby7tuLOFWfUsj03NDMdK0WAQoo/xI6y1HRJLxo1GNJof/hej/fbNJbdzo6MoV
         MGbkzL5o14TDubcOXORgF81z0hGMKEZyYgzH7wptahG3/xjnmrdgamxsO0SndOf0z65Y
         fGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851343; x=1791456143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQZTDSIHL00paX37Uy1dmIWO7Foaykj82cQvGVzut+U=;
        b=Pv5AF1k0dN3BWJq5G+WJ9VbMoqTe1o9JGl8+VaNvFfoSpKV/kjvwR+hE4DfWkcs76t
         tXSj5dF1ISXTmkXvsEy2jwBOVoiiQRqovCr7xXiOUfYWtpyLqilfa4bTF+05X1vA7YZB
         dQ726jdgxN03nvaq8wGyYEix3aLq3bcAc7KiOXsGcrhYu6Yg0xc1ek5MfAnLnqRm4EDx
         0ToV/pdOeJHomz5j5TLn9uLyqz+auU/iQ0aJ24TAE0MnnOfGJpkQaHxcjOJHYSZPw3DJ
         61oCjeuAaQ6h+hNxMVwCnWTHGPQL4F8mXE8xIVGkcFhHPTHf6TvQxkd4mManMWsgATLP
         /HCw==
X-Forwarded-Encrypted: i=1; AKwUvBz7yASPJoPlIOjOyaItgQiNSob2ItUHrJaojUDaedprbtHPZgsYppuPTTPq0ANFbkMivI3TgSkzOm66MhU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRw9TI7WITaIUQJMGjONtwR4RNPUgRu1c4nSmxusReKKvQbafD
	jOxyaOs/C0VJtfmCExAQkox9E7+v+QXju8ezQJFzyW+vt2ud6p+lS5zK
X-Gm-Gg: AYBFou1kwZLYLd4B1nkmsZoQydERBs2lj4mMYKMGq27DzCNhAW1G9roIvZNsNIBczFi
	TtuePlcnzkDh2Q1Qk6pYJ1haUnm88gxmG+E0KXmYZfiK2mspz8wnl2FsS8SUmcBCblL4i0GUJjT
	CS0c0NOfcEW00/RsrLt/g4FEle+CcSl9ND4IfPUO4w84tzUmZ4BRGdGhMSVOaE2ETO65S+FHOju
	F26mwoSvIzj/KYDpbXUGOHgN2qP2niuofxkvZY/lhVVSZs24PdfKohXCgf28O4k1+jCcW+uH827
	9Jy14GSfjcv0H5qj1I42AyTK7NzIdTTVkD5nU/BVW6FAa2gQCbnRhvzmcSxNrL9jckyFPYYwf9v
	my81BRIX/jEklrlXR88liTrdvZ2YkUI5JXBGrCmHb3EIvkRo4P9CzBgY7p4mjVCtzvwu1wjn2QC
	rPsqNcEFdwZJQ9YGmaNDWKB04WVymDlRQGbeEEQtNLrs4O7DZNSRcQJKD4Hegt58rtFG8uglbj3
	F/TafQ=
X-Received: by 2002:a05:600c:4e42:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-4a01afe84a4mr73565895e9.5.1790851343345;
        Thu, 01 Oct 2026 03:42:23 -0700 (PDT)
Received: from LEGNB0874 ([2a00:79c0:ae4:9d00:1f4b:c311:c1af:96c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f923320sm63394605e9.7.2026.10.01.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:42:23 -0700 (PDT)
Date: Thu, 1 Oct 2026 12:42:21 +0200
From: Markus Koeniger <markus.koeniger87@gmail.com>
To: Alexander =?iso-8859-1?Q?H=F6lzl?= <alexander.hoelzl@gmx.net>
Cc: o.rempel@pengutronix.de, robin@protonic.nl,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	linux-can@vger.kernel.org, markus.koeniger87@gmail.com
Subject: Re: [PATCH] can: j1939: fix potential race condition in BAM
 segmentation
Message-ID: <ar45DX0aPoWBvA_-@LEGNB0874>
References: <20260610090619.70626-1-alexander.hoelzl@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610090619.70626-1-alexander.hoelzl@gmx.net>

Hi Alexander,

I really appreciate your solution to schedule the TX timer for a BAM transfer after receiving the looped-back frame.

We use external CAN controllers in our system, which introduce some jitter into the transmit path. As a result, messages were sent from time to time too quickly and violated the 50 ms minimum interval. Your patch solves this problem.

Tested-by: Markus Koeniger markus.koeniger@liebherr.com

Best regards,
Markus
