Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673010;
	b=xfOpXlP/J1beE1bbzI428lyw7clmDHfRY0BO1zZaMmiKhi3OZdUxeTqTzLS3rBm10lss
	 sRgWf9D/eau7pKd0UN9YxNfcpgDuFIOAA1lF3ndmORnp62Uw0zkV9K2q0yyfKUApiY3KY
	 YKIMx3Jx9LyTZT1OhDTs6qvCCh3Aj+90axbzgYwrNBw0TQkzTTOR7/YHlY8zkejqUhkHJ
	 XAdkTjuBGIFLYmWeND2jcA0Ed48FMxZsYaRqQhOelWt+IxU06/Kg2FCFF/vWlW0b79RaK
	 aAVgR/HgVRr+RasFYQY1nuke06+0qD1mHQvBlWIoaPN+la6Vp3HOnvh0N4T3NeMeBEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
	b=gp4LEq9g7l9OucQG6DZqq62Qx7O54lDU3l1B4S9RwjkUYwoygsb08hSWXl2/0T4QbwAS
	 C/pfnSNO9IbeL1lTum6YcEoUemrw/LQTRdWYvqNysZ3q5WgYBKkzteo1Z0xzhHcZvs40p
	 WhqX5J34Wm4ea/+Qny9TP7tMNlThI6vbssJYKrYg3ZBhN+doSr+cuK31bPDjc0JB3A2qX
	 Ys/Nfbla8iHHhe+UVrL+EPyAYx9/VOGwdRm+w5XOWaOhVWpXDfNrX+QiYO956/gdagHvU
	 Z5Z7e5ao/AHd96TtDtK3/vuaKitGiFmvQO9XjEfnC5EP7ZnCia0I0fMEUa7GW8cD/Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1XrLd38;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19902606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19902606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1XrLd38
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c7a706b1fso3254496d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673009; cv=none;
        d=google.com; s=arc-20260327;
        b=foVgumfRLkyiZ9fLjCim/NpeQlbUfSxwe/xFvUWKfNT97QMZfK+A9G2oj9HJCgowuI
         CbDFc5wcX8DgH60FvDWMZs4m359g5uPnWEY4oCOyfykQ8iukGG6d5An4dq7vID3MT9Yq
         u5+WVSHUB7wa70pW/hqCPcmQ5rIhWgDfPc70IWfpG3COgo3ZYQ44aufm/zxtX4te3abV
         UWiDrSiJho+WsAKROM2XvXowVhpeqzJ6HSR9nqXb+gh8EhkHTFwNG52x0ZYTYOO4kM6z
         WoMphWvkI9DENKa+iV5NR5gDiyBTguDrxLq2VskHHOdefziTMUQsjj8s1FO4sbINDPhb
         M9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        fh=Bq6SUXP6t9fZ3q4qx4l8GwbRY8ye96EuJzpvaZxzJ4M=;
        b=e8REHdOl4krAbJlV0Z6GlUd7mVRu0eaWNeatbE+aKo48YhHgWqCHySIBlUWorckaen
         gkmUGTEtx3g3mNPjEEUlRZm7ekagBP5KuiXhuOvd1tov9kP1sprAmuF6we8uVAOJqzRA
         TIhAS9GYrI2cnCDkWzXl6SQ2rerOq7eO8k/5b95FuZzo6dTgfcBEY/nBnAnoTGm72b2D
         Oe7ndTIKmzVV49+iQwTGbmmDRlkOPEoreFZ7/VO1ggonqTafIh4XP2BAOLfMoOdHee7k
         NR3cAf4X5cI/VWbeLJHWVDg9KwdVEOlvb16wvAjyZqnpui3gZWjdmYBoI7qIq8JlgBjD
         Oigg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673009; x=1794277809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=Z1XrLd38YhdY4ermbWFQQiCsCOTTHgFkC2KPtMPjHZOELX6ZCnB3s/4fhteYYqGoaS
         JqTUzWGwrppwpCjQrFaS90de61BcdPP9HNPUmUHJlNA6DTxI6tj8dpI1T2BgndfTP0UR
         GnLz8rYo/MC67spss1I4G97ytNeS2LomlDhV1ImxrIXS1nkmpbM8vJ8+jFqW4GE9T+wS
         bu9Pvq/kJvuRnbE8xK6u+FW+KmM4+/CvZR7U2jO+Q6GLfMBvutc7Ehd6cW67a97AQRRx
         /J6Cd2UQgOQwLXzdHIIIhryqP3RHHgMr3oXdwx8i7UB9mCd6GJ4m2iAHYDxBvziKutFF
         t40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673009; x=1794277809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=XYFiK15C/5RbqqPy67RH3mIGDl7teHsPiOJY+pQ49itWg+8IdaW9S7P5jrek06iAac
         DqxHDUAmopR0MY1cIWdaotitNumcJA0CkfQgIdGn1ikc2n36CZiepKSWLZ4Y+/3jsQyd
         nyyf9xqpYx0qvvc5W7eer2FKqJm0iAl4D9FytwMwD0N74jVWozN5wSnH539oM86jAmm9
         N0qzgwVkCQ94KH/NmF8k10ijHiNSQxc5Rxjsn9AgufyB5qUzTw3T0P22ctFFzx6ypS23
         TzbJQYBk/AaHUpYeKH718Ps3iJgG+rHY4k58lg6y/vkqFRjWW+a3Gzls/qXVc+ZzI3TL
         B7+g==
X-Forwarded-Encrypted: i=1; AKwUvBxhECGDVLM1JNn9qoqtVWlSrN5DhCBmrsDXERCWolBEamBcBgHoeWGLsBg7YndKgHrc2qN0M9Sa07+S0pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EI0U2Q+O8quLd4n3WQNEPEK/FszC5kcn/seAS1qNCrx2AwM9F
	zTGMuSqxy/DwENEs0kPqd+flp5Uk+78zcQSV9w737obaGD+CNxtt2NmkKVltGomJiUfe51nu4A9
	qskiuWa8wXAo2qEl8le6CU0PO8Mu+otM=
X-Gm-Gg: AYBFou3MwrMcHPGcHZULxzSs82S4FiRqhdfTLenwHZ6L5b4vtVR5FSEYUVS8lOUchTW
	qwjud7AFusABUo7Sz6pBQxCEqgnjAmtVbGDtbomyx85NokTVcT+V5jQlTYYDamYvMry7eR3InYI
	H8mZcfvHivP9g25CvVIb+NhBTtgKNMp/apDeuNbSHLz8z2oDa5WSB8Y6cFzmOyfZC+5eN3e/6pY
	o8COXMEbaJPurdh3cUjSChaBjygZokagt3L5gWP6oaloS1ELwT2FeKo39O2uhxOggLUL8lcMQ02
	V6dhOqFyKyzvnqhsQle/2Y7xU2G6SethPJaG59u3yz1tVOeDsBsrm8Rh6Nj2XvnZv+ro/xJbYb+
	FH0m0ws/1MQWtL9Bf68XI2kjlWwHnjys4RbVPtzgAPa00dCjiyD7dJZIYMjyB3CUya/x7hz3krT
	UrErlKDT63NAwA+ojjRLOrN0EG3o4tDzX5kjDIq9ms+rrP4O1C2A1eUWCdGjhzW104r3SPXvS7z
	7qHY+fzTK00Nvo3TWI0Hun/TA==
X-Received: by 2002:a05:6214:4992:b0:91b:bcf5:a733 with SMTP id
 6a1803df08f44-91ca4a134famr184970506d6.2.1793673008933; Mon, 02 Nov 2026
 18:30:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com> <20261029123611.1108424-20-ruanjinjie@huawei.com>
In-Reply-To: <20261029123611.1108424-20-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:29:58 -0300
X-Gm-Features: AclHuK_BJkt9xZLgswfj_Tbr6PqRdG4bSgV7lCXrKm_Oe95ue9Eiht-hTCdNBWs
Message-ID: <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jinjie,

> Say why a bandwidth counter is assigned for the life of the monitoring
> group: rewriting its filter restarts the count.

I could not find this explanation in the diff. Is my analysis correct,
or was the paragraph left out of this version?

Thanks,
Daniel
