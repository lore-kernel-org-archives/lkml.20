Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6C46D57E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396075; cv=none; b=bLr7NZEYVY9RABHQOfMrTHCSjJLt6kAl0TZDzimqYKTIeG0xUQfPOi7CoZYROCYEc2MXkWjrZh26WqUi0mXY/NkzSrc1J/6/a6VDaxTFizzIrIRVvaeb5lz10mRMl7wpNvdXKpRBEPt8lV1VJ7eIS6Y2rScsf4Q85lOSTVPOxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396075; c=relaxed/simple;
	bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeDQT9gNxIbYILlaeVnquCAlcIoGp+w2UfeCPueFjybDla4/dXaXSAbov3Hc9nM80afGRzpX7BMScKVSjmlN6D+OwqAYOK3/Mu9FBUsBY3S3v5umOo9c7xJMCX1OXrqs18B2xMQDQXGoo6xy/QW5IeGSC13xT6ydf2mWMUFhYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAYzvl34; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAYzvl34"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so3942520e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396072; x=1790000872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
        b=kAYzvl34xvMITzwkVi5KFNqFmp1aPyTG2uzUg1HFQ98jDZz7yJI9zzLHzC+Ip0Dgy7
         s/+lLf4FtgU0JVHhgwM0s+GbgHlhy4l/KkIQRHlyv+xLRRQnBLBFKN8YLNM8AHwQJnWl
         xbazWxkk03SicAr73djJkJu9vwLSOMo24TY/JGxDLoQJW7frHwNtm4Xvrd2q4Gn9UyWQ
         3V4gGiGxGCsoLab9NSgFKkjIoB5tOO6HjSLea9KCulftaDJEwmH5wjFMBSf0gAjeab1r
         DL2CwEA5+o4qL8D3Akx8PBfEVoCb3sfOoyJkVs0J/DrfH6pV9Rh93/ei0uoi7rB+sjXY
         EAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396072; x=1790000872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
        b=XPeT1QwEInz9yXIPe6t+vq074OeVG2Qhi9aL0f2M+BoZ+hvUcA8R01UD8zIDzOZnhJ
         7tEjz3O0ZMjmTUUhilCeRFDSs6mUbNZ3lof2a1Ke9HkC4S7kugVnmuJlUjkfB/S3MiuI
         UT6Ku7TGtpfF2DFsOFcMTLJ2bvvNbBW5wFMGKvIJtQrE4eW/8UtccCuCoYOPRjcQawTx
         ZByOuOaoIxjEOCox6CNVFKgZSRzESJV7Hhy83EIUtMWVbTwlF700et+imJtfEaND4SWL
         zK36wgWid+lrgd1jP/U44+p93EUJBCTraQFtEOOMDTy8B3CYLzH02Rb4UafgMUEX+W2b
         bu3g==
X-Forwarded-Encrypted: i=1; AKwUvByGxnX7V1Fd99bM7SpHAkn21utONX3zsb5vwiHN0qTLY1yPse0Mt3U6SaK324YEObK5Z/1sYFGhcrqdGco=@vger.kernel.org
X-Gm-Message-State: AFuF++mHmASXZveAvS9XKR/+rWf2iu9YrP+y3BAyh6yWJPXGLIorLekT
	C50CaLQBaJ++jKSI4G659GENCvUWBBTCLyMRk/8Q7Lz6CmxUFiC8Lh4=
X-Gm-Gg: AYBFou2+DNeR4TbNvQqSsg5CaTK86oVu35M3RviO8iz+rabONj9cNDDjc97KAOORVEd
	2xl0qBSSQhgvxywIzpimsGoPwi9LGU1Kf30lOeTEhZXBCBEofsfoN6c0jH91510fAduefvZPayO
	xVe6nXV8ZLgXsgxUw0agFkHaT65GVeg+mxZsAPi5t+eSua/a+yuN5KlZEznfa6GM9NLlig5ic7J
	VMyDABvPFpx5bJ0nmnGhiEGZUEmyAkQMEiooXq5y0guBM+OBOYQHIe+8XQvhODl8CeEWY5C91iu
	GdCEz95xmnjOvXspw1HXl2eyEn4XaQPWcmrRXbq7iuOceHCULn39WliORliRnFhY6wMyG+YrMRo
	tb/YC6YIfnIHjjaQ0cFYMan1TFrVrWduY6qx/XmyOtAEfbuQ8bRNN6msCAsj1FYh8asgjZ2rmVz
	8sBHaeAeSOTgiscgAuJJ1Thisfsw2tU1dZsssZfRigG3CXX1GpoacRaZP+mbB8THr0136vcDunb
	AlUm+DfkPpFgJ6OPhB4u4Wuw/wmchPacrHQ1ttP4PuDIdQT
X-Received: by 2002:a05:6512:15a8:b0:5b6:1783:f0f2 with SMTP id 2adb3069b0e04-5b8ae66304dmr705721e87.13.1789396071748;
        Mon, 14 Sep 2026 07:27:51 -0700 (PDT)
Received: from localhost.localdomain (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a7cb8sm2544114e87.11.2026.09.14.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:27:51 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: lee@kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	sekoohaka.sarisan@gmail.com
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is not initialized
Date: Mon, 14 Sep 2026 19:27:37 +0500
Message-ID: <20260914142737.603133-1-sekoohaka.sarisan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
References: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm sorry, I didn't notice the part about commit description.

Also I don't really get it how is this dmesg message mandatory
when DebugFS is completely disabled. It makes no sense to me.
If user needs these LTR values for debugging purposes they should
know about DebugFS. In other cases when DebugFS is disabled these
messages shouldn't even appear as these LTR values stored in DebugFS
don't do anything, at least if I remember correctly they aren't used
for any purpose other than debugging while being exposed in DebugFS.
