Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE328C037
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423568; cv=none; b=p9rmnUpU8GxOY0KGH1KTuFeQxiDYKNXHJcKzih0x++wgwksvZBQg0wb4nRDF1CKwnTopQoKHkukrPRvAUfztnnwZ2vWTYKs4hnfW8RWi1yFjgW3/YiQhyzTo3vXSHb78GJmcHSkCIK+/sA30CEqiyOj5BQlR8Zk2WQ7lPErQKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423568; c=relaxed/simple;
	bh=LNGo9Lk6YmczPhmSAhIOAoe3rGeQtCB78blB4lGK4ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kylZY8kxu6FF362FahgoPZvBtGkSIRST3F6RWMhbYgtpFU7FnFaqh91KCPbBegXuPvMq4ifYkN7g1yHFAU8G+NqhX2yL81RT4RMQeVE3a+IQDK4M4LuOYN/JD4hHi8JoN+gnjrRlQykgtnc3DglNN28TJXB4QP5d71G8/6ac3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUa2i5PO; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUa2i5PO"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab06778bdfso531748a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423565; x=1791028365; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOZJQtJF+6fvMtqVqH7Ln6MjEBTAkHYNteQQULMHp44=;
        b=mUa2i5POAb3aQkstDAzP2yPAI/sWYdXK8hXR7bou4CcpG+EKqTVD6hiJ+CPNwudPbe
         qQgdrP8fXTfNdthd8MceEm0Y59d+QsTnmFd2Y5UNI4seX425tA++2l2E4r/urO4Rss2U
         JP+RwZRrfQh9L2fjm+80kIL0Q6q9tXJgSX4+yCCLeDQlqKrRGm6sKVYlGgwsSoOrsOqP
         DuxlzNMh51sHRL/6BLobNj3rYvyrbnehJ1eboUXjVK0BVYoWVneysqGnFfouMuC9OfWd
         6wEZlnL618uYNo9gufrkznMXLOzmCWeyLWqBCtRONonwcS0zx+k+SHsqstmDfh3IKxV0
         BFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423565; x=1791028365;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOZJQtJF+6fvMtqVqH7Ln6MjEBTAkHYNteQQULMHp44=;
        b=SNfuRq5tkI9v08R49y0ceF3uETJ70ZRwB3sb7Yrr7Q0R8cgbUjLCcNZ0wWyVgNFhN4
         3g9G+z2vDOCRrjVgkDjbf2fYuP/3HmrNkJZ7XEDTd4nQ6tdRL6ok7tVXpMA8evK14OJE
         ovIjPRQDllA7LDxLchi75BOB4gWKjP6zaY3QcX+rM1iASM7uV5CYbkXvV54MduVOZx13
         NLFjt49ZMVRWaKGZIGTNXo1V1UYcZ8ConDA50hNT6aOwUpapOIqQb1pfRcR2M3ZPfpam
         NkCQiG5CTLBJ2su0FFj/PmE4n+9xoEFVAuqSsT+Gn8iMQ7kTOaqwq7J+NexnMAvjoIjf
         d6jg==
X-Forwarded-Encrypted: i=1; AKwUvBwFyufOqE1LQ/8/FCaB6o7XCZ1Pa1/KoplcFf6t1x+6cATs3FBhb8zbJ3r64PkBoxq0ylAls/hoVw7TUlo=@vger.kernel.org
X-Gm-Message-State: AFuF++lJDHPVVCtH+Gucu+zk2/mW5aGpWb3aSFaH8q2+20WdaYPuzrKq
	Lrx6fDJi6o1FEYo8lLZdGBAV00ZsNqGMFECJJaJ323UDLbztVz4fjZi+
X-Gm-Gg: AYBFou3p72qvBPCKIi5vjEcoFCwZCvzznz7z2pD+e41N233wPsVjtXMcSwK2yxFD6Ck
	txxpti+/ATD8twU2Au4R+RbIfKmh2nVjcmR+Xm280CL9OUnnEDLyxKDLsYPZDYr6y+gAyU+8Qqq
	P2b86NuBF5bAWUDnMM1p7sUOh9UpkTEiSt9Ll+HLpa0DNVZpSKpbjzTUmsAN+8zlgSNhL1N9aTV
	5giQ2NFdGHtvM+9DIBBOrXZWql9fLDEXoaTeajazdRSROYyLCCmayeeI4+qqRZPX+onFOgHQ2Ki
	UK8KQKzlWz4zQJFthKZ+0A4MNkhDW1SSmnet0snpAbqiOe+ns/MWeat3BaQOGaLJ8Z8pBwhobUg
	3CS5kCcCy4E3QsgYL44WVodY7hQ4eaNRa2zvcsiC7lgNC2XdFOSf6NM1dGLh60qW72RNVAZn2tJ
	oHia94jltZT7OE3AhZey76eXntUUPKjJVphQfOBX8usuYh4vwguOqN1EFwKfWGey1eoR/PNA53x
	2pIsP5xP5Eu2/EOTHcBm/pVvAphN6CJfDLJcwsNNaU=
X-Received: by 2002:a05:6402:21d8:b0:6aa:734b:1a2e with SMTP id 4fb4d7f45d1cf-6aac9090952mr6404194a12.40.1790423565326;
        Sat, 26 Sep 2026 04:52:45 -0700 (PDT)
Received: from fedora.localnet (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ab5be57b13sm414448a12.33.2026.09.26.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:52:42 -0700 (PDT)
From: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
To: Roman Stingler <roman.stingler@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, johannes.goede@oss.qualcomm.com
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject:
 Re: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res wheel
 mode
Date: Sat, 26 Sep 2026 13:52:40 +0200
Message-ID: <407JHeAkQjaIVOP3-Y7zGg@gmail.com>
In-Reply-To: <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
References:
 <20260923181203.422097-1-roman.stingler@gmail.com>
 <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

I just wanted to point out that the original patch has been reverted due the 
issues caused so this patch can't be applied currently, but I'm working on a 
new approach that I hope will fix everything.

On Friday, 25 September 2026 11:50:59 Central European Summer Time 
johannes.goede@oss.qualcomm.com wrote:
> So in so far as this is a solution at all, it really should be
> limited to Bolt devices only. Although I wonder what switching
> Bolt devices to the hidpp driver wins us after this patch?
> Do they still gain any meaningful functionality from the switch
> to the hidpp driver?

Mainly it's getting device information such as battery and connection status, 
but also, theoretically supporting multiple Bolt devices that have different 
capabilities and settings. E.g. two different mice, one with high resolution, 
one without, or two identical mice but one with invert enabled and one 
without, etc. Unlikely scenarios, but at least theoretically possible.
And same for keyboards, it enables separation by device of any Logitech-
proprietary signals coming through the receiver, as well as optionally e.g. 
media keys and brightness, etc.

Cheers
Erik



