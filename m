Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585740;
	b=w8pRSawUqB5mqZqco6FvgFKa7zU4xWHW9a+ryIWEQFaTwQS/i/WMW6TiszCJTg/65edc
	 mVvzAvCvViAvUyj/piqgz3JzEBT+zSW9ax/xZh1GnRb+0Iw59X1A2zZiDq+eR9ImAKKwo
	 1v9xlAZ3hWqyyMWdNvYjulcldn5QabwbGXpuLdXov4+HCmbZtdsWBmZ/6U0BcEDbOliJc
	 VYicy3gMgNr0ysQZ9uM7O2dhmuBgyHNOO28THlAOlNunsdWoL9Nka/hmwJvcQBL0SnpcB
	 /2/A8S9Ige0eQXKtO0DGsoHgqQ1b+FqIa4oKe56CEceHCKCQdaL4MPT2fFVrGU2MqMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
	b=SdLTBXWrhgASULaeyRXui2OQPAyVlR6CdBol8Pvy3olF+qaRg6GlPeRlmJKxj06VCN3h
	 QZbdb4K4FNOVM3UUWvOg0hSIjBNT7ehVF1HRfSI296GarXEZegyoe9aMl6YVznBiWHcok
	 ZXpKnGwhCn1ouiPWVdYZpDG0esQL1XUXRJDdQ251EOr8wjNtfAjGybKmUWvrh35XtcgUk
	 LJl3vHh61sT8Wyy0HxgdEI8DuWKky5CEGFceBpbNBTM0CUDxh2dniI2oajAHXrfr17BqJ
	 NUck3BmrSTbTl4GHyK/NHbCsPSd+T1E0l5KSkdsFEoc9NUB5KQiZkw6+jZE7kM68tsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bpz6G8QZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C4606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 590C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bpz6G8QZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso6555785e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585739; cv=none;
        d=google.com; s=arc-20260327;
        b=WGMAUkO0WkGrWe+SWASRB0XFc7DZSdUafx2pG6EGIMNmKfQMZET8q/KFD3f06+cOEH
         0DmagUGSi5lcdd55vErYPakhOxfp34APagq8jzIE0YD6MG8F0XAT2FQqGqvr+Dt4EfB1
         v8zUNX8H3BaN0R/qlvcFO/7WtvhR98HqHuEE94URN38+MufaoLC6kFhtpGIU59CRLB62
         vkXvukLOI0vwqkmnDlH3h3zxz429o6ieTeQJYey05xC9XFRCLhARPIlezEZsiplX2MM8
         BZbGeV7sXVBDrQArkrDhbv5b2whK1DfC0kE/AxR9SvXzDu5jNss553k3iIi6NKuTcdjP
         2IQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        fh=Wdv8EzlKRnEPOlCAocZop547gM1g/Aha8KISdFsoeRI=;
        b=eYTBKQVTmvXzviaPKacdQa2maFHjNeXNG9Yet9hwFfnwCn/uCTb540BTHor1QXbAqe
         IPDfhHOgF1+1VFMqst6rQMvbE2/FN/WFx5JUMesSuSSGLjTu+3yvjMRsWbdwQqGK6bhV
         33INz/Vug9hfQlWKfbt+8Ey9smGeyYKQy2nWtTZl+mNBpeEdvY+6ISFeS2Wo8+5dSlr+
         anwL3kiL1Us7VVygKHOUFTWgyJvAJGF+XAuNqrOcW1A96g6qBHwKVRYSN2MYty3cAnsb
         9UEveSP/MGRAFfNyTYCiKGElx3Ygp3U25HUy5I7IPbZ1GOoBJ4ZHBPwApMSWuYtW4c8V
         xskQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585739; x=1793190539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        b=Bpz6G8QZmb/JGEgcjfwYuXE00RMfr7JbARsssfTOFZvsHr69zWAd04aGeL9wGUd1pZ
         kUTXyeMt0xIaLnG9FbkQAhKCZ6OfA+wdCpsO4GdcUL3nUZuYKFKcycoXBKL4jAF9QqZ9
         9UHbi2qsHP3kES7QIUqmVTHRFIf12Dmm+1t7A4oJKyAgk/ZHaf0XS5ZVZIDC2Mxo7COg
         3sqWeeLWgJKWS2YYXHC1g1peoEJSFbw/X3DfPoAvbXqBE/AV7ttWDaTWoGE39TAWqfan
         D+cL4iNFmc5+AqxJkCAzxZcGNVqoO4rlS5uKjtyNbPiVQ9SXgtZsUvXi2WCFyyUiysg6
         mwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585739; x=1793190539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        b=ubclvwpaysYWRhK63CLDY5sgX6PUXu012qcifuH9NqrWR4WNMzCnlD4TYf5ILNwLUD
         03pLeksHZMPZUKxKGqlC4CjrXR8Ip2w3GQvTtnCO0RjKkyXhtl2z8NzzyfHOLNj9eTbc
         A16mFK8RjyVDTp1O1WPrLusVr6gzcsmy9B6jj57zf2rqKg8mGIStSs3H2T64nOpyBt/b
         Fh/0Geney1K9Vr30D4n7QD2gBHqesGRiHRMTTss/IMi8NuC59/PXqW8DFkvXvnjYSBu+
         MrQoomZs5ayqTLu2j2/3zluxQnAiyPwa77Eq8gQGrlgNUk01JEYL4ojeoB7U8lhfswtD
         zOLg==
X-Forwarded-Encrypted: i=1; AKwUvBz4WDwN1HY2NLP/Db/s+6sPm067txLpmmoHFBCkYb1RSw/OfHZ/q2Z+QgYKEiX/XOvuPArwgkCowY3dJJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIXu9GxrtOetCkeSwnm/sVClIiaJuGCDHtd0JWj4y/0n7KLKzs
	Xm9K4ZaRa7xkl4KfuViIRQE/kzjNEH7aA/yUiAadlMEp78cPcV4QqHPHXgEjDm+v3PVCBKCS5+G
	zQ3V0FQjE+pGNM9ryiVIY5WUTaGP62dU=
X-Gm-Gg: AYBFou2OxxZ/UZdwfSOMU/k0FQcl/wnLmqPB2wDQ50leZoXUKzF4MyneO9i7G2Hq763
	cWumyglaqc5II4gEnGK0vMxJ6UFBinsVycyz+9ggu50tE9UXRm271At+hR1CPc3q+LZvwzBhnqr
	Vxrof5enUQ5iIx7MM05sVC0UseoGcLbNgofZYbZiGqtMMRZKcJ0AjdV71OFRc7MNyBg7MSGCj16
	SRNwlFHBbgoNsrYjc7o1TPRGf/3feA2hF3bi5YNu8uuFtGBYyaYQ7mQtiQ2T6/ghCTlPU2Qqt/Z
	WIUsGEr8/QN3859lM3R298ulC2qagJy76HCMDK4FTL8aG86ChtbF0dR9X/Ey7BOR/iotfqijBq+
	s+MhmN1Vk8cz2iZGPtKEiefyB47zkdOyo12ypQm4=
X-Received: by 2002:a05:600c:83c7:b0:4a1:d087:f6ab with SMTP id
 5b1f17b1804b1-4a1fdd22df7mr39936915e9.18.1792585738531; Wed, 21 Oct 2026
 05:28:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
 <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
In-Reply-To: <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
From: Ximing Zhang <xzhangjr@gmail.com>
Date: Wed, 21 Oct 2026 16:28:46 +0400
X-Gm-Features: AclHuK-iEbUqEIt_S5oAy6Zr908EnDTOfZaCdztoawpS9OjtMxpFrmIspAezEAM
Message-ID: <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is that a theoretic or a real problem ? "Test-only fault injection" very
> much suggests that it is a theoretic problem. Have you observed it on
> a real system (without artificial fault injection) ?

It is theoretical. I have not observed the failure on an unmodified
system. I found the unretried error path while auditing the driver and
used fault injection to verify the existing behavior and the proposed
recovery.

I agree that the fault-injection test establishes the behavior but not
real-world impact. Please disregard this patch.

Thanks,
Ximing
