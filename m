Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425D201025
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900379; cv=none; b=Oe8vobj2QG0JQzVYPQKEVuhGzFble3osliOMRDl2P23EhBX0qFogdEhBT5nmylm9MeHh/WhSQKrYLZXP0gwogXgbBtWCozC8zOYWwTTv1dli/ZwIAk9BFkG0ZcIx5lie8IinJD0tWLwm6BmbEdMEHcTnyA5ahjGaEj4PGcVR430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900379; c=relaxed/simple;
	bh=ico0QIpUZP4Uo+snrQt7aZKGkSDXP3zOPooGnsV5Ok8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FDdaeqKH5SjpCzZf+sXxzC5IcIjGuLgLneweEzBY+wjncYB+RScVYKeZ/nkhXDbuW0scZuBprG+YGzIoDUnITaKQKXVWwIQnI17Wp9s5/SwBdjJZjHU20OqmNVBJDVzTIEJ4V0UUj+OyOSF9//jjTTsAK9s1yjlJqmP6MH4iqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQSdpbdn; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQSdpbdn"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab3e848918so37851937b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900376; x=1791505176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSp4W/DJKok2SYpqEMEDGmT6PuCTnIyUmJTFaN2P0J4=;
        b=qQSdpbdnXIGhrFYKT/farfeth9LZBj1CVxcUBnacPK0ddTNYG6SUIXJQIpnmBTlVSh
         0DrAhVsdqtX0YgGdQ1n5YqI/F6nEHgmO9lMAEIYM4GUKfcHbDfwL52nN+ixuSTA+sMDi
         8J6nqOXI/BNxMvEbxRdTr1Yfbm/25GlhYIu0IkQan3plO+knpwkMxnxLv/kDNYn4XGW0
         GyVtxvj8THKLEKUPN5OmfQCnMKy7KnDIQKBW/IzLFNVaZTpvvODMCEdfX33mw2R7VRun
         sa+/KFIHUkh7m3tpETMsvWWPoZtNC5WK+YYJ1X9aH+t8FNGs5t/9keVRKgnAOKv2UPag
         EqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900376; x=1791505176;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSp4W/DJKok2SYpqEMEDGmT6PuCTnIyUmJTFaN2P0J4=;
        b=dq3RTC5zT+o5rqV678BV3knJFE1rgSVv8Lyut1VJokZL9WP8kKdxrZGB7NtoNb6thP
         /WlwRPLx9kTFfxL6k8ljr4RSoJbuTjgkKnovFTgGsGT+lcdGwd/h0cUayzRsdsSokt7v
         PHedxrDoHumm53i5foj79q5kPP1O5z52y7HCuQzjIkML1zaqvCCJtHxcQh6Ezq/fad+8
         NRsN1Mx159IPnraJcQQK0ZI5OdExdimpT45XJ5MtL9Q+WznYQb/gLOvvwkuQ5uPWBTvS
         WOMxOY8b2NttpHURUrNV69HSfY98RG9NUIwPgSmZKe1wdRxdt4EyVGtBYdpTDcndJFdN
         p6KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCH6v4EMDCbrV5280WTYtci2px1hIVAz7UkzSUywl5ZsNzCt4W1lrO8toGaWsVxSzSBzdEgjL90WIgchc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5/MfgQR9unfRv/nKIxTR1mN0d7d2rGZjv2MQMtH1YlshfVJhN
	bia7aJitvLOw8AcVoIjB3b9PtLjMOuoDcidPimTY8rEvFXH2IZ6YxXUK
X-Gm-Gg: AYBFou0WgjiAHUQmRofYIR4I8CrRkPXAatMYl4GP8Xebjoc6U0xBcP6VpA68UYg44PI
	obApnN7V4Px7/b77VmIG1YiA5fo4zNV27sBP3IT5pCGfxcQCoIz9BzA/sm2DKexvpdwcXv91rKc
	tnUU2dSl6NSA8gHaXnnNl3S4kxKX6P0fJQ2u3/r8EUlkVBrrSbUKyP/g3taU9w3HfOI/GIJ3qBC
	qhkCdQ77vwcawXCe0NmDX1hEemIfSXWon9M9eVEixwyAxy7jBNeBtrl4qRheDvQed91DoHPFldm
	AdvYUu1jD2a+nbKlldhWsxuvprAaToObgusSd2sBpkecXo2cCumTNjE8B076D2iPQVKb2m/gtix
	940N+iagZ80sA/WGkeAuCofKRA2DTJBb7H8efwY1JeG9Ehvh91q0r14iGmTud/zODpA/UcW6Jnq
	P5GQ0mIUNU81oJFHVPNb5F2cTfAXY0wHe6tqHKWi9a+6LdkqoAeDySu02tDo5BmEtGS09iBIAY9
	LPmlK1ysRfGlXNUtA38TgQFLf55et/WkGeRRMstOwD+ptqa0fHiQNTAqs/fO2jJ
X-Received: by 2002:a05:690e:804:10b0:66f:9d03:fa07 with SMTP id 956f58d0204a3-677abdee8bamr306667d50.2.1790900375518;
        Thu, 01 Oct 2026 17:19:35 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae333e9a0bsm3205377b3.36.2026.10.01.17.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:34 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:19:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.233d2609b86d9@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-4-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-4-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] selftests: drv-net: psp: test that
 rx-assoc fails on closed and listen socks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Cover two of the basic psp assoc states that have been defeatured. Do
> not include tests with shutdown(), connect(..., AF_UNSPEC), etc. I don't
> think the coverage is worth the complexity. That should be done with
> packetdrill.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
