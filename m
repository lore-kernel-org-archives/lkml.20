Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808835;
	b=BiLjhB6xyb1RkpNC227Fwo5lPBWFzcK0YajncFWxF+m6iJLgFo355mU5Ro4UApRb1k/a
	 4CQfb3eeAWBi8NT+gDQdJwQTABB/C0GpqQrFrBEt8GOnOc4kLWPmqb91cbxEMfAMGVm8x
	 CxsWOrbaJN0I0MPLATrDSSuB/6XEYiy6oglIwYrq5pT++JWjtvcadlCYfimyUfey5NfGw
	 6wtyNxQJtNjY153jwG8Bsm7lja3l+zUtzoXMsGy/qUZRSPoqgS7cFfLO2NK8dYkogh2Vk
	 WWPbJJjQdFLpHTgWsJrWZNZOciIe4tp4rLYBy+JO2vxx6br5640gR3I3ZHq8HLmj3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dbq+C1knGtel/8heo5gmPJKIJmhELJ53YLi5og68HsI=;
	b=pJg1sDVgCGA7ZLML02j2AVxZylFavlI1O3xlUtLBVNYH2k8YI+OZq9U7L0t8oh9f/O69
	 +NRSavGQLy9z+FZWMs0w6LmHVfhz04SDvyIzKJ/mQ/cs4qbaPQwemZ97fRC/1mWSsgjHS
	 X34pUXFnz/ds4r0MV2cTZBTqN7+OxK15VR/rixZZ0q7NPn/Punp4JdJJHCLfwaTYXNazz
	 U1kCzo8UQsc+Z7bo/W++1YJVrG9yEGbWdEhqVONzuWb2vD2mVQjpaIAN5+KQGUlTQLqQD
	 V+0U8GjHLc1s1yw6I9ZShX0G65yHHioy5ctO/1MAid0iRP8Gh0m0maTOK9S23TqeH/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=GWaJI1zI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C55606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C55606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=GWaJI1zI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7132765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792808834; x=1793413634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbq+C1knGtel/8heo5gmPJKIJmhELJ53YLi5og68HsI=;
        b=GWaJI1zIUBB052oSJa9UtU2rFA/QQz6czNQ8xYEa+mHu29BouCsuGhzzCRrwbTmbnB
         w3Kyn0Jl+G3E0xjX4PG9qH0C6XPUrixLrpd33yo9GKJc8GpTXrahRdEnp1RNi3Lmj52I
         W3derfTam89gY47QoSd0mhe8/hhDLPKB6OQrHlWsuXA+Xx872AoZDbZIWjEwVB1zHTlZ
         eSywb10VDzfQ6qs3zeXq63+IQ6owAuaUwhgT39IxePdNQO1o421tWCNJGIUjHtVoTcUo
         I4146WfzVMKSab5szv7wOr6w5UpP3l1tYzjsMmpm88IBgA0I5j5ipszWfhfpgIhQKMQ9
         eaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808834; x=1793413634;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbq+C1knGtel/8heo5gmPJKIJmhELJ53YLi5og68HsI=;
        b=ni5R1C2nkdpnxQRLsWxc85d/iAHrh/WFEhEuE60p+WxDYZpwviswUbORVKDnRdST2R
         80YOx4tegmfFJByAXLc8+IfjI7HCqSf8/OsUV/XO8j0McwImdYyk80NiIFmHp4gZV6Np
         sWKfb5x8ybtUXJg3HwvxA610N4w2sw6BrbySaBk4TDR01oFGBF1l9vuwWc06skcmtrVm
         a8Mfe+BejfUoP3e0nRgyqKy+qNkeDJQLLmgOeB93aGaiO1cnHwIaGS3UrIW3/6UOcVH4
         mc8UbjoDPSH6J+6eRVk/dC0nRWlLPKHY2S3KVcQUJ9Oj6m3hvxPNJ+zPwi1SzdjjQDnp
         YWtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuobCdmibq1F2h+ZK9SvvRYwI8JtqJKjLHgsL/OXljr5ThIjQEA/bv0cO7aMBpl7KUDHsLQGIKzSqCcUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk9Cikn5jatGkdytTAsbpJk8LEzRkIblEvlpLpDu4bYlFLGotr
	uQejWNmIZIbWhnJwB0lqj4Vwz+th1y3+q0uN3XBxJeLP9iWTj+/DqEg=
X-Gm-Gg: AYBFou3sqzmqiyBub859tU0Dm3sYeyEa4F/VyCqp7eY4EkJngU9gK0ZHpbmpoVagxkD
	NP+/D2WM3ulwZ3OUEv78ZXVQWwxYrMApD0NLgjF84R+kZf2/GauygQka7pqihS0fW34YssnIScf
	OOdUBgjeQ0s2b2E07zSJYEzPfkf/Igdp+X3Vrb1lfjTzFNHP5zUHzdu31BNxRSSqZoFPoZ+1km9
	YFgVdO/WLxPJWM+122RLkeW0SIv7w3DPXpPCfsE9j/hCbRy3HT1g/jLjeiLgGMTRgYlBDIeafA2
	N2a5s6gQlPbsSMtg2PBCG0yJ02IjIfLvXJWyjs9tVLovT/h1+jvSasvPGWZOi+Xeq/rg/7gj9/p
	dY3UZdZkZTjTr119a53yRRtcB7SJiaRjoC4KA9ZzedVS8yY72f9jknr8xiXaNq+gMHO9jV249NT
	Oe670LD7RldujTtlYkjDDDKLTze/rVwRUb1q1EvDbtZYEmwzgOdI4+azX0ewFE5zXt0/Cc7LK4H
	+rvJIMfDvVRee+e8b8dTKVU9PvQlsJeXKsyP0wFG04v+HdjWkycD839VdVLZafImapM0/1OJ2ZA
	cCbkMt2G1HR811Ei0l45FneEIsDQajbgmCw73arE0VbXSIrad+lQdQ==
X-Received: by 2002:adf:ed8f:0:b0:48e:1d87:f170 with SMTP id ffacd0b85a97d-48e3eb83fffmr740933f8f.12.1792808833581;
        Fri, 23 Oct 2026 19:27:13 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac555.dip0.t-ipconnect.de. [91.42.197.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm1742797f8f.44.2026.10.23.19.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 19:27:12 -0700 (PDT)
Message-ID: <a4ebdccd-4f47-4449-b120-59e1d6bc4951@googlemail.com>
Date: Sat, 24 Oct 2026 04:27:09 +0200
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
Subject: Re: [PATCH 6.18 000/193] 6.18.59-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261023163714.201276352@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261023163714.201276352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.10.2026 um 18:34 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.59 release.
> There are 193 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


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
