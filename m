Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240120;
	b=CyAAhGOTzJJFcugfz1iaYDlL0x5M6Nd/XT9VkTGhgRE+Sy7CSlDpAMpEzDCpF1o+NgW7
	 pF4WefTfdnYJPPOgEfhXyae6jKFSozePu3V4bzsUfQKs4Rpn+hFVaobJF+yijl6XMVYz1
	 MiMcBRNRcTSf0wdvQXqF1PsLJ8hMBDBWyaxmd5PX5keKZS9I/mLXUP6dRzQS32nMVmpQ5
	 WWHEmiHm7Ec9cZpugWkj0uNhSAttvY16iRshs8E25qHzUaCJ6+O6myK0HtTWaPmx1WDs2
	 84h8wpbxi8EUabt2d6XK84m+Z4wX+2n98yb6hdvtqUQGd/O7ipaa8JY1zlHzdnpvGBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dhqqpxGxhV+d9yusyc+fq0FJI6GkW6OrpwpzJ7OfA8I=;
	b=n/AMdtcXgCAhl9bzGsdxB94KCIGogXyfS+YsurSJ4D1609K8xFsJ/9HISgVuoqQHQZNS
	 d4k0gx2xaUDwLLtlSKB3jUnZwp+2R7/QdVJda/fKrWLOqGMDC+exLpal6urqQvtjWtAfU
	 sTrqqWs3+aY+LbsXvM7NveQmNrxQE1lq8AOFM3LKJIfygbxZ/wzZAHKQpf4fDtmipV6OS
	 ++WsB2AJjdk1JUrsEWkoIryllFwjYU7V4a5nQo9KqFfhHLkr6yg66b0tfUr2VcEN5r+1v
	 vSRgoK7XnFizw0oJLJxbwWKl699yBjI4kIMg6CtxQyK1RwmbJ6DjEMyZQM7aUVHxsCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CCODWCd6;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87837606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87837606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CCODWCd6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso14033335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793240118; x=1793844918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhqqpxGxhV+d9yusyc+fq0FJI6GkW6OrpwpzJ7OfA8I=;
        b=CCODWCd67waSVo9IjzUtS95sjmvA7mxAVZEvYYxJ/45BaAmf9i4FhSKhygBKjJyzm7
         OOcfNFBB6tGIDC8F/kR13vXpBY55CmVuh/XBW47/LQiFcw1UDptf00ogSt8kQPKGbWXQ
         tIEJLZtBW+e/EMm30HRKK3o5bZkyrx6yMnKUIhg8Ww8CHLXYznA2Z6N82vAYc9ctOuIf
         8kY4IFyuCcjC3iUHPqVT0AD3Qf9HhHHYOFTrkf7+NDTBSBVdmmG26F1elUQ8D0w71FfL
         HvS0j9sfuYFITq1d9JrieyUaqUJVv7wXblv2FehOBIJ1psuvIx6pDXwv6gFNpzZhf6E+
         CzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240118; x=1793844918;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhqqpxGxhV+d9yusyc+fq0FJI6GkW6OrpwpzJ7OfA8I=;
        b=xeNyEu6vmU7RejFyJorv0QxVkfmmKIaPSPhyDD8ZaSJ35ZqeDlLWe8QhF/TGytXG61
         Ap0n6bnibYdBWasWAUna5blS+X+qWdYPBwDyBFUhVszag52p4W1YJLVCkOWIut4aA3C5
         ZPZzrJAAoxYdyfnmnh5fGMMBVGEMRdRkYuowAEjw2CImuSUjdzvf/KgA6pOEV2KGEY19
         PVZK+m4FrZa1c+v2FyAJtTpVoNhYl6+U9BZ/Ls9rBdKtSLOMGgo2uz21txXCpoX2e4vj
         dk3+9DOpGTMlL4rlLOi2+cwt1nlMgNYJ9jNjXV6k5eA60YwM8IXP3j/KGJEVa3dZf1jo
         fUbg==
X-Forwarded-Encrypted: i=1; AKwUvBxHrrz2KfJ4GqhMWu1QvLOyyYoI7wbyAlaxkNCvhhd4+KTdRGxKfWzwAiGfd3jE8CT1HShL5q/xJfo8Mpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4wCdCpOo75ZD6LcQoy+kACKmxy2XEazSbkgDYLp4Wns10wz2r
	1uM8ZGtvAv+AHMuLYxWAZh9jnO1q1kG/C2Ddwfcm54JreP5thyqDSDw=
X-Gm-Gg: AYBFou3ozBs91+b/SolJrB89ylDOxmbEt2w/yZknZ+1zhgR2nna/GZxBpAubMKnIeYa
	X4MXQvaSN8lU8oeNzKpjjJ1+F5+zeqnw4tFgy9L4o9RM3zFLwvXnq+PzKZhu65LJcqsy7zd774p
	Fsb4PQP1FsMzcdgm4kuvtW2+iKGH78AtYrkJsFCtW2A9gsRRp5WpvyT2q69OM2dK2pYAgevA3fn
	W1XcL6VC/Dnyps/tTBPhdTex8NCV1dLPn/9WZqpPtJ8Zls133gnHekrWR8lxWDybc5TFc8u3lIA
	DR4A6QI1kYXP3fJ/oEB6SH8zI/NgUEl6USr0BjU7LOJ0tFPWIWONUC03Bt2iwFmm4A7SZYXomBH
	9HHsjWRPmTvOW8/ttJnuP6KZVZV1faE3HhAOUmQLpu5HIcymSY2W91AYdz/zL0/AqgNR5dQCkKu
	CCsi12NmdWPazFULxYx1KmxxBcEEZWyfT7PFlV3++lptpBXCQYkbKJW6QaKdjuXjqNurUKmZpax
	d3mG7HhOGJOsxeuRT0JjGh36D8LPGnO+ZqdJ5YnmAnaEepVw3mF34FveV/9RB7gKyRUbzJZ39sr
	KbOH1ixV3+AMQdSJiO8btgTxE2/Ytzm/Mn6VPJkzrtX6g0BT/k1f3zGHwGqPIOXx6LhlZ7v9N9+
	1ktvjXw6/FCpYMGalnKBCAlWo7XE=
X-Received: by 2002:a05:600d:11:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a974528f91mr69963645e9.0.1793240117667;
        Wed, 28 Oct 2026 19:15:17 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acd9f.dip0.t-ipconnect.de. [91.42.205.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f50d3sm46337915e9.8.2026.10.28.19.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 19:15:17 -0700 (PDT)
Message-ID: <054aab03-ce22-4beb-9d7e-b6d8264fadb3@googlemail.com>
Date: Thu, 29 Oct 2026 03:15:13 +0100
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
Subject: Re: [PATCH 6.12 000/247] 6.12.115-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165947.349197979@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261028165947.349197979@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 17:56 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.115 release.
> There are 247 patches in this series, all will be posted as a response
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
