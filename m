Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519746;
	b=xJowyvQXH9YIUjotQt683/GTz8x0yfDZnlBO0UeBewuvN1+Fi33zLbquH4YMxZlX3mCA
	 hbSGN8xnROqu/mKJbhYNIb4Jyf3+IIW/aWE08AI6ynSoSlq7oMlGtyPwHjcBA0UqOZOum
	 MXxh4cwLMGlrWXoTvfVzMcv/hhpTopBjbVIuN9dTKDXENkVRDevqZsn0vJoYR7aWKWJ5v
	 LCF51jL5OGQzHDjHW2DjiMR2gRyUXPQFaWo/3NNp2lAt9aZMz/ZAdFvVkIfQi3obma3tO
	 DhDo+5Xfx1xWUqzgpvZb+Jw8gtwwohJ6Lii/5LsjCcpwVGsrIbHNv2O34WZkm8ltk7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x3B/JDR+cURsrWXLjVWxo7FtstCSf95jnpcyvW1ZTJk=;
	b=WqnHyLTz1m8VBpk7nobv1B3O87qDUCVplJXC5OmLoZfuYya9RWnLf8OTJx/QL3qykzCQ
	 k+QHYejF0PEG86uKp6SFQGQbFsrQQJQvdsBg6YMrkzF6vNfEpWfeh5uQOupjmj8WErO3n
	 nZbmeGE6IGcVPcpVivTQyEhflizsOYv0Md/xoH/7Y0f0bqKG7dBQ77nRrhNMb/9vhAVQ4
	 /aZPSxGVU7KTpkyk0hekG3DugCg8ln/IgbzQ48KWkm8S8Tc7eOg1xSpUb4BdpxKXOU4vq
	 8Eki7XYn4f+jBYqMq/o4+Fq9AuWO0vaPVF54QlMli67UVDbsU/klpnhj0NxdUyu7ejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=HV+4cc7m;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E160A2602
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5E160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=HV+4cc7m
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so22982165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792519739; x=1793124539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3B/JDR+cURsrWXLjVWxo7FtstCSf95jnpcyvW1ZTJk=;
        b=HV+4cc7mostuDKBYHHlKh56mBjrsdI+7Rjv3fx2UN2XjhBpK4MUDjpm0mP9ep7gQZV
         pGlCHigQoegyoe7LZYe/pz2nlse/rcnjqbF9uydqi74xzqqTA/f1kF/ppE8dnZnK3IZb
         uo1vSRY/9hcXJrqaNJDoUaP2leWRWU/9l4o4hROEtRJBZ+GCJHDuqcaJG6apu+10N3GH
         nR1EOVs05VMBwu7kZAxICUamvibTxATffDetYqLQOIeXK7WsC6DmZI9h3jMY/nK+89gZ
         7YsORyS0WvI83OV3RRW7fWZ4unkLbwB3cbE0EtDBBeBCswGNYZQl7yxO+ymW1aJ5U8o4
         G3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519739; x=1793124539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3B/JDR+cURsrWXLjVWxo7FtstCSf95jnpcyvW1ZTJk=;
        b=Ptmwproi/Zt7RV1qKgAM+6dH5MkLUJmlf5K9nUHWqruceUK/Hx4m946ajYeVouCUMZ
         QMdXw5yf3Qhi4LqCApzpcx/Efjc2tzUBtnX1Nii3MU8vBuJLK2M8VGRZuxZnUYcF/HNB
         CkqlpqY6JmlQ6NIWOb00+aRxq9Uz2bMlujcvmGfTUWVUk6iQxw5aXgno5Mrs6YoxqNLV
         SL10+clvfuvRizq+yoMiRZWsdpRyOIUc3TlIet3fUO8/RNjshe6HD1X8wg9cCalsNZTb
         ziTor3KvnzRCHctKI/WsGvKVWrsqcXUphNET9lDHebAtbvVe1Sg2nCPA5Ybitgob5diz
         JHDw==
X-Forwarded-Encrypted: i=1; AKwUvBxlvtDqIccY9D+5tNgzxTWDkCWquws4D5d/1gHZ12CYKXKZpPlawkbOAIQvjLEM8NR6AgroXO9UsUavXFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHoVJ/8VvIOuB4TskYIpUmWQc/4AWmxGSr67nQ7Garn+LJ73r5
	oj9fiv9tq9CrmL0z3gwVMqQvRN2qj7P5zxKu8Nd/MebJpbezSv+ko2c=
X-Gm-Gg: AYBFou21hujViOjxLAmi/G4P9dt+e8lQ5tnT4aZ3m4HNst3tEL44tqB5DgC+b8iX8oO
	PjvAn9EMRmvm2jo1NuqAqJ5QAhcU5w32ur2WP02rb3d5iB5lonprMJYfZ4F5uhqqY0uurLwnHzX
	Wl48Ma4qqIGNq6cdc6kZ3eWPaO74VdZVE9k+o3mQWTL63xke3rO51fOG2kuvu0HdsLojIaCybcf
	ZbpBmsvKNeVU4plGWIMzI/E5Ibuy1uo4paBb4S3tjKNTBE4Np2Pl03Qdp8mbtgn35+zbVz82cWz
	YSSqQf2ZHzq7RvPIydDLISBbo/vqONGuWZnFpOdNZjadOHn725GapjjsOHSJJI49UrB40KxY7QY
	U2Zpzo6uuBw8lCBSTWeza0T13+v7+d9UkM7t5cp180g2juiD9zG7Stbguvda/CcYd9GC7P3ajRj
	IELWw4e2LYeq4rkQKIhDoqY9x2T9265lbq1Mi95kSsl1OJM7ELtuLZLZJIvLALJKVV6FhkFKbdD
	+I+M8a+mo+q80Qk5uLad84/15Qnyqkfa1SWMGE50m/tiycdJaXj5o78Wmyx9Q==
X-Received: by 2002:a05:600c:3554:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a1d76234a3mr246372675e9.32.1792519739356;
        Tue, 20 Oct 2026 11:08:59 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace83.dip0.t-ipconnect.de. [91.42.206.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb698cebsm23338615e9.1.2026.10.20.11.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:08:58 -0700 (PDT)
Message-ID: <bdb59552-51ae-447b-a3d8-c03d860eb8fd@googlemail.com>
Date: Tue, 20 Oct 2026 20:08:58 +0200
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
Subject: Re: [PATCH 6.6 0000/1651] 6.6.160-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261020075535.084584701@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261020075535.084584701@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.10.2026 um 09:57 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.160 release.
> There are 1651 patches in this series, all will be posted as a response
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
