Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658B41D11C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682823; cv=none; b=Cw5NnhdKKox5jA/ER6YUZbDbS0QYIQJMEEOdKv/3KSDVVECqjfiDTjoL8ExiBudfzzCFPufPdDpqmSVj2+QmydQ7G5p0anOwQH778CNSy9Ne5lab9EXyL3W18Sk0bRVnZqWmUB0jq2iC7DXD9VVetnp6CGD+GsHcIUyVBWILh4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682823; c=relaxed/simple;
	bh=aIpw/5pYzi8Abvp25b2x2tcGOSbn2XKWW/NoDwdH4rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqdVYRYFhEUAaxtlqWi3+vyGLZpgbb4C+IuUHXF6YZy1OMEvGo+b3lfUME5Gf60bmfLyWZiihJ6RE+tOF0ukcn5cN5ii+pD7MCtrAuK616kbr7TAMNE4nmPOu8H5An2PI50nBk2hHOwAOdd/vNV+2HdVR16t7ne2NhE6YR0aiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN3Zjgf5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN3Zjgf5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1712118f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788682821; x=1789287621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skUEh/fsWDrXfhaXpLnYhgK3w3JSqtI7bPrtN8rArKI=;
        b=bN3Zjgf5dWiZnq00HVzZczdnyyHrUd67wy5HngT7F5zqR3fzJtVJHFx/RxHZLrbeXs
         GiJoqiwv81BfyQbIJIz0sJOqDWL6BtoYmcs0ENlepFTEwnnBxq+K5lUI4HrPyaMBJkml
         XcsL9rHH0ZOvULBl3wa5cUjyAgfc+DYM81lLGp3VmZogydtomILnuwgBTDjhzSRhodiT
         7Hq5EoWHNqLFIG5xBNikwmqmoDhbSp0EdneP0P8us3XWACWkOV6Q4fPaUKBBZRqIZNkp
         5Yj4UA4mIk+W3cUs3ZGX0P3rEaEoai3T1VKrHJ6CD0LnwgHfcvHSPlUlgOPrKHwEXpIP
         c8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788682821; x=1789287621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skUEh/fsWDrXfhaXpLnYhgK3w3JSqtI7bPrtN8rArKI=;
        b=mNsPNd/UlEYDjy7fwxGrvWieN7euQIeeZ7SUVUSd8+V1f7sarEq5UI3OUhG3369DKs
         ux/LhpXUZUV3azHQwi+GnexolqVqg+7uVEsbNbXNSgmD4sqmVSyUJxqrg3XMwLWO8FcX
         9j7TOV6fZJZGIKHsBiTXrJkUpB5PZDSj/KqDSEd8QM5smPuSEyC0H10stiRkGZ2XQtGQ
         kMFkEQaCYXqAOMew89ef92r+94+FE5j6ZmNbwY7atHLMM9BWnWxlfG7BoFGCD6OFFJZW
         riiS79xQo+VMAkNgNl/pA1haBSqsU81t/GFQSOOIUGqig/oeCs9OecGnwJcFwWoWXe7o
         CR7A==
X-Forwarded-Encrypted: i=1; AKwUvBwcS86sANbRnxOhlyKVKoUPMpTz6mn4L2ZoY9kdvZ8mA5wsNOiumybm+IWO4dlDmkgygVwGneaWNDf3EuU=@vger.kernel.org
X-Gm-Message-State: AFuF++nv6JTkndNVSXH1Y3n+MbRhWITGktc08j9RYOU154LpzO2ToHlW
	IOQyKPcQCIGlRkUhVm2jVUfY2tf5p+moDh7MkYrdgeW1pAQOLSczArOkiDKnKA==
X-Gm-Gg: AYBFou2QsQJTb38NdgXZzwVT7lQZGMCC9xNjf/ReNSKBVXjeM/cPD4lmh8fUI5dQgt3
	H12TIvtjN+APtKQJNp4zT6UrDKTd+SOIRoop0zHonS8osz9QVgWkH38aFnk9vLnYhCjDFP3F8gu
	AwTgYEMmjcsN+wbvaqD1JQrGWJy7l9uYsFkOxgIwHr1vUlDRPo2aM+IGN4Cjt3a7y03eT/GpuRp
	qQDNDPgZFsRbcces4ORFDwbQrIi9ibzSGQz7CHsytOKUxRl7RChBMhe6mWfgn970gwJON1VT4qJ
	A00Y/IC5WcbXokDWfddj9F5/gvpIYqQwoKv03+hL72fZJOVjfcdL/ku7YTFCbSvxMbqT6UeNFnv
	dBN7AQ4gco62ConSd2UEjXaCqB5f4a0tASfTSe5aAr7wDdycXye4MxRNfP5AhNHNneYx9H9p6G4
	+gJijosWv91d8F6MVohLidZKdwENv+q2YPpiey/yecwKAzqCppxgIH5Lym0X7CLzhgaw==
X-Received: by 2002:a5d:5f94:0:b0:485:8c17:975b with SMTP id ffacd0b85a97d-4858c1798cfmr13683055f8f.29.1788682820569;
        Sun, 06 Sep 2026 01:20:20 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm15868241f8f.19.2026.09.06.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:20:20 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next 1/2] wifi: rtw88: usb: bound what the driver feeds the after-DTIM queue
Date: Sun,  6 Sep 2026 10:20:19 +0200
Message-ID: <20260906082019.909573-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <05f0cbfc6a744053863e3d7233e3ea15@realtek.com>
References: <05f0cbfc6a744053863e3d7233e3ea15@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

thanks for the review.

> nit: a blank line

Will add both.

> The pattern ' HZ / RTW_USB_HIQ_RATE' repeat many times. Can you just define
> the it as a part of macro? (The macro name should change as well.)

Yes. v2 will have

	#define RTW_USB_HIQ_REFILL_INTERVAL	(HZ / 10)	/* jiffies per unit of budget */
	#define RTW_USB_HIQ_BUDGET_MAX		16

and use RTW_USB_HIQ_REFILL_INTERVAL everywhere.

> Will 'quota' or 'budget' be clearer than 'token'?

Budget it is: hiq_budget, hiq_budget_refill, rtw_usb_hiq_take_budget().

> It looks like you shift refill jiffies according to the tokens you are adding.
> How can I understand '+= add * (HZ / RTW_USB_HIQ_RATE)'?

hiq_refill is the point in time up to which budget has already been granted.
When 'add' whole intervals have passed I move it forward by exactly those
intervals, not to 'jiffies', so the part of the current interval that has
not completed yet keeps counting toward the next unit instead of being
thrown away (the usual token bucket bookkeeping). When more than a full
burst has elapsed the exact position no longer matters, which is why that
branch simply resets it to jiffies.

I agree it reads badly. v2 will say the same thing as

	elapsed = jiffies - rtwusb->hiq_refill;
	add = elapsed / RTW_USB_HIQ_REFILL_INTERVAL;
	if (add) {
		rtwusb->hiq_budget = min_t(u32, rtwusb->hiq_budget + add,
					   RTW_USB_HIQ_BUDGET_MAX);
		rtwusb->hiq_refill = jiffies - elapsed % RTW_USB_HIQ_REFILL_INTERVAL;
	}

with a comment on the remainder, so the intent is visible without the
multiplication.

I will send v2 early next week together with the changes to 2/2.

Mehmet
