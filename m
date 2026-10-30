Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362852;
	b=5qrszE8ELiuMih47EJFr/0sz0oOvHzKLhrX8dVxJJmNTkXzGfyu+8/e7j0txutmUc+A8
	 YehXumz9mdUpLEh2KwiNpoE6YFDo+cJ/6pTOxm0ZJK2gbdvg7x2I7WVZLoeG+PYvqQe3o
	 1NtmEyQMmNJw5CVF7iAk8UuBtjMYioKT7rl9wvhnmj4YiYkW1QZ5PvI1+3cPTr0Cvf7rV
	 yL67Ei9KBUU3aRInqmmU+hjwrUCtdaKceiiUY1hK6ChJjztwWUqU02LKKJJYmfc7/yNun
	 4rO3C9lnESyy8nho/hcM3bPBS4sTB+IwfuIdfFI8M90e1e2ZuQnrrarmRciudRzDNNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xv0rjomnreEwJ3awHfgoaSBNl+BwH7nZQZWEX3r6cz4=;
	b=aHg6xUzB9cNYouIWH/huaRQkPp0g4cn8WzqO66btZTXuRTWYR+tQg8ZqBzRtHoM6CTm9
	 ku7l2uOrR+SE5kxDGn7Pq5AKsW0U3tLy2qYHVsA0IFBNdkzymdpc5zXHzEaveyN9l5c1C
	 bZJYHVIFHudwUNG0oMFsoFopksmepnv29YdErQAI8pXFEv+wzS1QdyVpKzVYam+F1cxh6
	 qtYcl6/uB0W6XZpjo9Qf1WhyKOtXdFY4y8E21yQRwU+Fs6wRWL3QpXEwpKlzzZJo0PhTJ
	 NBnI9pOcUhvWbK6RbGjLSmT8rKnFCYkXMvwiHv6wjEu07a3d4DAYGz6VVp4HBVXp5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vK9iC1Fy;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F840606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F840606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vK9iC1Fy
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so5995385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793362851; x=1793967651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xv0rjomnreEwJ3awHfgoaSBNl+BwH7nZQZWEX3r6cz4=;
        b=vK9iC1FyK8AU7W9Xs1PN7+oSwVPX2LTnrER9xMULro+BBAfwCw+NzzUq8fuPmFvUsr
         KfyA5E5NRHyG0gh84nXK217JDiNYXo+VXlaJrnkFx+TTptTjsSoxP8npCSPAqaifJKFH
         LP9MUs5hzGUGmUah3qIXvYnzzCfvMFcjojA0nE+BQYSUeY4wDD9ZzVf6PDtaU6qWlYnr
         0cQdvZvr4Jm6V5BDO6aAjMUrAEr7QO0mt+yW5+coI0oi+loYDLtocgYF4E5rSjh1BNsh
         cm7Pgk3MuRbWW6Cx3GX+dylge/XEjjqD9syV80ZpfAO5vFNvUVdHAwllFmp1hvSWITB+
         BdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362851; x=1793967651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv0rjomnreEwJ3awHfgoaSBNl+BwH7nZQZWEX3r6cz4=;
        b=iw204Rx8a+IWu13dLrQKDoSaW6tI71dYQ76akTQ259Z1gS5wR+BDIDDf82O9vUnbSH
         ZuBwxStxvFy9NWD316RPdIORRVDoGDq6IA/o5hhgKylx+XOqtU1+brcBwxe3klSECq7W
         4t7XZ2nlYcokLHJTZ65okY9fWOLBrZExu+oQwUiDiJgBC45AadhjDk6gN8BqhkCt1QKR
         iiB8RcF1JEIgeSYq271bfRQ32B2jBcQddPCv+HAOnFY+iTK/0QqBaa0UdBkOo2msXHwK
         gKFvJGHNGRe2VoBbzgtXT1InNodO4i+8jt59yrfh8C8pX08GvGpL99T0fjiAOKJ0f3O3
         NJlg==
X-Forwarded-Encrypted: i=1; AKwUvBwNh5hUsV09giScyvHko9a3TLtTdPt4k1sDiP9UibANqZCsN5eOKtUTC/yrmjBK9S1Qk9SN2/n0I72wWqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK7/++I9BO31HMnHRaFvKiN+02YuYD2fYi9A09UGiJbb0tUkYd
	H7NmpzeHsRfiUK7ITDktHxZ1g2IKB5A2UrkKREgjGDzp6gF18+KOcJs=
X-Gm-Gg: AYBFou2yTcwHmB8W58+HHjzyhLcWrOw8mDro0Wr5wjbVP6plI19iONMph9SG37upNXu
	htN2bV3MrxEYpiHxNVphIRsh5mJwTuCw03WUhCE8qfUf1ciQ18GDNA25L4TE+vzZ8qXcDLoZRLS
	q03LVLyH3iSqEvTA4hHj4kAvBd0ghgE6XllPCMvbDzVYG2/uZZg9ZNGtBH6aTzMZYl69pnFsVHg
	XZjZDCIhKRF9RpPKxNvxF6jxt/GzUCcfA5X+bCK8xIYql9RWqbxY5g5YxjV+iGmM/E1kvBLreWX
	TTONTqAB/7YxxzQxNQejzP2bIt6JQfYT9A7f+dzgBVafiXOsrPO1IpTmIljEuIaB3BCEpVu9l7l
	Zw49QPhZHPRtpxHYBj5PfTcL0+jwmHmi2bplpWjLAQa7BYVrWT75RKYlEJyrCyyuiDBubaLPvpA
	PponrN4+jbri3EiPgyH29WIHk7kQdfsEX6WDlKtZDxyUq6oyMwcjtILpor+6iiNH9qGsu+s4Vcm
	FqlNDbWkuW0RyjPXdYZZU9gP3oyBBUoePNDf8sxS/f5kG+DdF/7oCp8/vV43AD6s2TtBqYoiIWV
	dQrZyOsR1BSiib1+KJ3j0/Gowc4YlRhvL3ov4k0AJyle9BHHsp2KpE2w2joFz6YMz38oS0MUUbC
	BqUw=
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr43869145e9.31.1793362850528;
        Fri, 30 Oct 2026 05:20:50 -0700 (PDT)
Received: from [192.168.1.3] (p5b057761.dip0.t-ipconnect.de. [91.5.119.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm41033045e9.1.2026.10.30.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:20:50 -0700 (PDT)
Message-ID: <e24362cb-bce4-4a9f-b9f5-040aaa2823e0@googlemail.com>
Date: Fri, 30 Oct 2026 13:20:49 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 00/10] 7.2.15-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261030121255.257615100@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261030121255.257615100@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.10.2026 um 13:15 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.15 release.

Three minutes after the release of 7.2.14? Really? That's, well... ambitious.


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
