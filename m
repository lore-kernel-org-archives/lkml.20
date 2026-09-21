Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4244B663
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978128; cv=none; b=oCT8QChVkZE3dRb4iLzeviJ+cT87vORpX8SQbD5EQV9PajL/B4AC/bqPo/vfi9ramE9XCTtQLYY615v7WLjQLToWMaeODjgbEKJn08UN9kiZXK5ePGW/7eV18fXzUevCZ9/5HzYOlgbe92O4jMFoWTb3hBggFa361FErq54ks/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978128; c=relaxed/simple;
	bh=0RaQGQqIo9leMXjyzQA0KC9Q+HujEJJke6QT7/KvSNo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhXbBRx73ItCTIvPz9a8AV1OKnUGMEzp1kYCWZ2aSs4VUGSR02KusdkehlfJc2qOp3ariPjEd59hPtb98GSlJZwhGESSrWBfl2d4HPAc1qVvHUdnwhZvT694I1P/3PJpdltFewmVvS6g+YkQuInjMEHAdN0BicWGWWYnAydIWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVSv3kMC; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVSv3kMC"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2916957b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978126; x=1790582926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lJf0AoDPq153hT3aZ9zolJbEGD9GJzVcss+BLxpyNVg=;
        b=bVSv3kMCmbOHD9t1EXb9tFC/DwYBsTtIXFRtmptsDNkCYfr4NYrol30HUMxWhXCrcG
         NugtI9VMwA04MFK+YqO3jzk0waVYkOzbUyv7Z8ktaJwZP0h6tK7qtSNee/9K+HZDAXaQ
         k9VvVtzoKhlSq1u+GU8FGZaooM5H3oO9hMOwozpuAdg7iQh9dqlaMF9YeCpe4fs4Trzi
         Eqn9sDPAn9dIAQmm0caE8yqWZJ0e0LMzWvyofFqFkCCzxnsEs3cRWExXZyVyxYkVsC0S
         LVdutyaNjzZCaf8dNp+a6oK5OHVsgu6AzNeIlV3YjbTYc+nLMCrENXIJADZfqHZstaTt
         5wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978126; x=1790582926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJf0AoDPq153hT3aZ9zolJbEGD9GJzVcss+BLxpyNVg=;
        b=t5SatTKm2rdiysVrswRAgLipcSKbeV++ZQ1iGIE5cr0OtGry6WApbSHsKG1eRZAyU3
         cmHcIMImMuFk2O9l6xo2YTzblA1v0GksxcgL9P6pYtblosSZfi9z9f9Uco8y560H2OmR
         3ewnnKCw0Lq7by5SCVg3Klg47gW1+cm0JnMvFVl9Bx9Av4WPsT8hRTniXs4XFxN4B+Os
         GzbbB9a1zEzVKbmo+CqPG1unjQNu4CAAkfqbyF7PKBf+O1m2ftN0WCPV0jq2QPxQ0JXb
         ssWEfMKP8Qvic1j+g3fbbAlj1IPdXtIBfotPHm7LWv23jkiCEHiBOu4oox1ffK/0Tn2U
         BmKQ==
X-Forwarded-Encrypted: i=1; AKwUvByRbc7JjoCNvVw9XFp/bXAsEy/Vem4ZgGan8Kl/ZHxZFic+pjlShCl1CUPrujCkeF7c+/NXTyfxAR/quDs=@vger.kernel.org
X-Gm-Message-State: AFuF++l94kelleZaVImdWAzLz234b2byq2Vq95SHtYlnO/3UbSSganEn
	GEwL3g2XoPZF4lajhtMgZI74my0Nd47VSqs8wUhquAwR8HRwYd3uVw+6
X-Gm-Gg: AYBFou0NccYebPnMix8DzXI7Lz+/40gs3Z/Quy7T+t3Tb77ZaV6pGiMgFxLcTAlYWPW
	S7+dL0VxxOUadarzK4OpVQaXfH6K6qunGI5ICuGM/gw1QO0+XSNRXaTA1VrdtKO3lNa8/xXUIjp
	WfZSFJWqUdVHHKrx98ZjM636l2KrXB4wFCtUwYLw5Lacq755jTg2hMSHJsMDg5HUtheLuK7VxOc
	x9hMbEe8t7nY2upHEuolJmM/AWF70b3bVHGUBCwl6xtIZnWUGJD4ofc7bgcZY60V5q055etYj8o
	uZbUk8rM5dHV1Q81GMbo/rkJFKPeMHSvjWRpp+Oa0xYCSP3G3dAbDrkj89aT3TCp7xrJiIM1i3f
	yMQIXh4+iaN/wpR9PQ0xYnlJ9V6cZfUz1RGKbn+6kotc8qEz4yGmZpCOZeRgUvJdyUpeNi/tHDK
	7HSiWhno+3XigDElTp+M9UzFQD+D0sNVYDpwjP7LLph79m6O67amoVX+25Cci6/cwGYld/J5A35
	dSV1JlcMV/l40s2TuxVbe5FjNDO6vrx3GjmOFq3quXNxIAVaNdsxAg5SLUeAqaXtkt8cIkQEyE7
	9H/X6xJQF4I=
X-Received: by 2002:a05:6a00:1c8d:b0:857:72ba:ff0a with SMTP id d2e1a72fcca58-874dcae6e87mr14283804b3a.18.1789978126122;
        Mon, 21 Sep 2026 01:08:46 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (61-228-227-192.dynamic-ip.hinet.net. [61.228.227.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a96f8da0sm2842130b3a.32.2026.09.21.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:08:45 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Mon, 21 Sep 2026 16:08:40 +0800
To: Heyang Tan <thy15333007817@163.com>
Cc: francesco@dolcini.it, johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] wifi: nxpwifi: bound histogram debugfs output
Message-ID: <arDmCFfgOGThdGxX@nxpwireless-Inspiron-14-Plus-7440>
References: <20260919040253.590-1-thy15333007817@163.com>
 <20260919040253.590-2-thy15333007817@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919040253.590-2-thy15333007817@163.com>

On Sat, Sep 19, 2026 at 12:02:52 PM +0800, Heyang Tan wrote:
> nxpwifi_histogram_read() writes histogram entries to a PAGE_SIZE buffer.
> Each entry is formatted with sprintf(), so enough populated buckets can
> write past the allocation.
> 
> Use scnprintf() with the remaining buffer space when formatting the
> histogram.

Using seq_file may be a better long-term solution, but the current
scnprintf() fix looks good to me.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
