Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB339A06D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294473; cv=none; b=jD7UEodtP3xrbJSd5MqnatYSodmu650K0ce8y09igZmTNysfhNtksWj3yxIoVvliNs1VagHMKFeTOeO6MVbYWQVXeEpXnE7QXXNaBnEC82PR9HAhG8iUyaR8zYZqnwk4pPk1U7IexeoP4rMlcFSzvbRjK4Wp+jAMzdek676w1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294473; c=relaxed/simple;
	bh=1kt6d8FnC0B98nCUGE+SmlFlqx1hfYRjftBJJGy4rKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsWZb87Uyn1SRm7LL1jD430O61u4V2p3BGjude+e7B/jNdWW1xRkOaE6ybZsqosKFA/eigcPGiMAwDgeFvjxgC28tBpHtNikvqRtibIp7OQMOT5h9oDC60USb2MwpombNE/yaqetjE+HgCQ88v0/n0RLMGbi66/7TmmB07b9EN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Clqx9GX3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Clqx9GX3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so30852565e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789294465; x=1789899265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBMZeq61/F4p0+3rD8e6cPnmdSCExohBg4rHJSwrdv4=;
        b=Clqx9GX30nQfRdw13CbQdmyLJ3EhK4HvwkoYZTGLzSR3/Mtk2Ew+ckNz4qmxddu1Pg
         huqnoBcf6fEDZ1tlmBxF5TxW4woeVdBrDAtRJmf24ha5dyFkNu6sFC+baMU/gbKlEG1b
         xAgCuRePr7lZ8n1R8bnVfiuZ/5+jXWgbdZNsSmbIpLMI83sgGVCgQTnNEAlcMuA6bQYG
         2pUhbELxb5j1/cJ2qaUX7lQSCI0Mdu967gXzufRcWRbLxjqr8+IcDPJismyE01wayKhk
         vNK1sDKxtRagtK0w6neB8Ii9vS7PwcPK0VxY1ArDGXgblBYkCjJHurPHAw1oh39Oc5MS
         HJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789294465; x=1789899265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBMZeq61/F4p0+3rD8e6cPnmdSCExohBg4rHJSwrdv4=;
        b=HQ/a38eLge5QTxBKswwHPbsChJ1oER0OQFXMpPwh57QJKzTpVNqh9dfwclX5XyMae3
         ZaMZ73uLn0HaMpaT9OlmOYArB+O7WHoh1oyvY8l9zZFiQMmo9hmecHxnNsBTcS5P7hxd
         rZTvYNHHvsEz2WtIHK35UxXJ22yFfxLE7nHyZfv7qMLITo6LiSMzPsBTAZQSxoUYzR3w
         Jwg6xgCwD+r87G1UA+1DyumRWN2T57ha5NQUySkJJbh6/3M0m+JIfpOyLBioVGTixfF6
         67K6XbdjoHYEjGri96TtAJhMkArzsFq3aUCOrbW1A6YGWyh2F9iZAHggEq0t2cbWFVIg
         j8Kg==
X-Forwarded-Encrypted: i=1; AKwUvBy+744u2XpzYmXxe7yRm11PBijaKK+VuOZajn30WYBy4mKO/Y+wjT5bfiAKUAxmtYsiJEdjuWxSlsRp0SA=@vger.kernel.org
X-Gm-Message-State: AFuF++n/TrNVHeaMrGQ4si+ZufP+NN1/n5a08xwovtLr4PbXjloy0tgv
	gGwdF49GMbhstfiMgyPZG+c1EaaOp2zQjN01LGQZ7YCP4/5/X9zr4+2trjEk
X-Gm-Gg: AYBFou0yERwUf2ZtVcg0/2r398w2gAIXNCr5kyk+OQIoBd/b5wb3ncxIaLrLpWv4rZn
	/htKmM4mSfZWillwgAH6/5Fru8G2UETXYHcITCfH7q0C09a+H5+13bsVY2uV/i9NUE+wLlQYu+w
	6f15ANNL8zYwd2bh1pTitrhMegGHu8H3+AHnvy5+qQ9BXdnf/n8M0OiarvvKlnkdic7KSQZkWI0
	Cjx2YDCr8xYaEID6Ztdj469HGDzzv4nmCdXQVBTN6fMggwQQDgOJmYKAMykpXMzJv8Ae03SMf+b
	X+ZtBvyKKR+ThrFSDOVKagwDczv/fZn0T/vYNdaHchYg4VjJiNDr1aa8kxsIue6Zt2vakMEQm4c
	6uFu8yn3NmduhN/LIs9+LAF3QEdIfiJqAvIYMERmNeouI3ELFPr6mYHgKl2zuYlrrozDd4IXhBe
	puJw8rL3vcwLFkz1274e5i+p6QMsK43iptb1R60/O4jybdZPsKTPC+ESDudrQCVsAKnJx+GGwRG
	4wr+LDBCRqYOb9Vry5uBiExNqx7L2DsIT7XWkczGKHiSzWt
X-Received: by 2002:a05:6000:420f:b0:485:8c16:5eed with SMTP id ffacd0b85a97d-486eb2f99fbmr13029738f8f.39.1789294464781;
        Sun, 13 Sep 2026 03:14:24 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4716.dip0.t-ipconnect.de. [91.43.71.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm19329616f8f.18.2026.09.13.03.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 03:14:24 -0700 (PDT)
Message-ID: <b8982310-19ea-4ae4-a849-537af8950117@googlemail.com>
Date: Sun, 13 Sep 2026 12:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.1 0000/1191] 6.1.188-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065548.086904252@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260912065548.086904252@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.09.2026 um 08:45 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.1.188 release.
> There are 1191 patches in this series, all will be posted as a response
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
