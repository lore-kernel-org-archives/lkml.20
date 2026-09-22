Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF742EC081
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060349; cv=none; b=fzYj6qA9wwtsOmNilZk82VDIcHBB0nwWSURMQKpEQ1iTx+CACQfCuX5KNjlFNJg6YY61Cg/EQW/xV3OJbvGqf9piHbDBvWfpBzDptNadGjpVBTEmnY9ajYN1moqOtGhUyyfUBjCnregujnraCKl4sNtafp+1D2xpONajFWpogZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060349; c=relaxed/simple;
	bh=DIBIJ7F+V9aLoSxE9gb83iBtpIq6BCllg3PGaSg4PR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QL8OXig5TMulzpxk1jDVdgRL9VBXs1HVeSuFBFBnEgMxsoJwU9I4IX+H+qJSvtMM+ncQOmM5lgUVOVR3gYfLj8rtrKF1mB4PRZ/AEVHPYMw4o30l2qAIRbJ8rm5if0MXPb50qRaPtjXuwXL+Zg+V7K+DPc69X8bcIwSuoswRL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyQ5wX8U; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyQ5wX8U"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so19287815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060342; x=1790665142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIBIJ7F+V9aLoSxE9gb83iBtpIq6BCllg3PGaSg4PR0=;
        b=UyQ5wX8UVULJ/MJyp4NXsuXvJp+KPo0P5wZOWHYai2Flbc7D+KLvW0UxHM9ZzHQp1A
         fO6v98w/B6akiugXRUBLNcBORCEn349tfWAK86Kf5/8Lw9JJQK1N3tDzIziw9grMaxIv
         kEiTnjqRNHGBSMxTqONEO8tKMTPnrcmLHvBejF4z8hPPOGMt1WBVQvDMHvZ5QyPAQbKi
         DM/WvT2Ac2DVBuijkdKnQV9OSfI/+hbQt0/LNV9tyKE195i+viPRsPoktabfKghXOcyj
         DmL1EmUtInDjlXGWhuW+Jm3mqUR1FkhAvHh0aB2v0aYl5GzKxpqu+o+/X23QvrbmDLGt
         ydtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060342; x=1790665142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIBIJ7F+V9aLoSxE9gb83iBtpIq6BCllg3PGaSg4PR0=;
        b=kLcNwW5tWZhvot39OEWKRW5C5eD3gAhWmGYRlbNnM6jGT+7hzPxsNlzC5jR2onH10D
         4jkWDFBDI01RilJqV0OOxxWB+7ruzEhCpidpWJmshCjIiCEzJFX4hBgdBC59bbdQuZSy
         vxu/2CCnRYFeQDZiHoKqqcxxzzb6iCvAsoO/3f2lXLtMpOulxRFtZ1EGP0308kq0b/Xy
         KSEptLopTs99WawHPpdOUITadQqzyNDWCDckf5WsPs8wv2PHJk7NVyidWKno1S6p0hy+
         8JDJm0lhs34QRCcCkL1PbUeIDbme3mcgl0ZyzZtRZBTwFKfXdlUrHz7ZZ4cef0k5Ys1C
         ShXw==
X-Forwarded-Encrypted: i=1; AKwUvBzsQ1XyrLu37OqeCYzTFrCSgucHomq4Oyh7GGxyEh0Mv6K6t/dKTz9X3Iy4WhXkHQHnJIlW5vtuZ5yoyE4=@vger.kernel.org
X-Gm-Message-State: AFuF++k9CjSGEKFw0jXy3vRC/21vJGfeoq8V9Q/bXnJVkscnrQF/St3m
	Nqer7xsZTtqgoFWaiM2LPTAkioDpK+uI2mW7l5iSbmUNJK6P6sWv5S5j0zFDGQ==
X-Gm-Gg: AYBFou0ihcOi6FwO2pv6WZwjLn2BQsSlr7GblFCkRg5c2jdz/XmfvjecDu48p0fxtS/
	gxCNa40tX+eRVDfmMBZWF26wIhKlug5hg+NYPZEeIddugrevmawTPr3EPqxFH3Hut5nYK4t2akr
	GemUj3Y/Ojnkh/FGGWiZWVLc3zjg9/DD9OO5yij8tWZT1XYOY5ifMhowNA3VZWJIViXA6JdUKsZ
	lFf4uZoA5SKqcKSULyV4Dtwt9EJmTjphIFW/XmpFe+MlPC23ixLD2RtYp/iHTTGc17mHzwPi9wS
	mAme7tOksX+X+v1n+3kkrsTGf3C3UzMwTtrAgkYb+4TwRU7J9/Q30O//onm9vzGcfB+TCZtMjMg
	xLB1Y3DX9t2GZu/Z3XcZV70Zij6wjyzswOKR/vKB+t78L6IWiyQQ6UAjTeXkcL1KIGWkojZFRsV
	r+sbrRi2wDVhAj3CYrNv2rCN8AfS6nwlq63MNlWibLFf5uaqHzSrQ0F3Y2GTcihO8OFvZuRoIIF
	u/WhrDEx0+DYp0=
X-Received: by 2002:a05:600c:620f:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fd8a6cdb7mr25402185e9.14.1790060342213;
        Mon, 21 Sep 2026 23:59:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cd83aasm48853745e9.10.2026.09.21.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:59:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: honour the transmit power mac80211 asks for
Date: Tue, 22 Sep 2026 08:59:00 +0200
Message-ID: <20260922065900.1321130-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c164023223334f7095ef2a28f6bada33@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026, Ping-Ke Shih wrote:

> I don't lean to either, but ...
[...]
> Then I'd prefer SAR.

Understood. We will use the SAR interface, and I withdraw the patch;
please mark it as such. Thanks for the review.

Mehmet
