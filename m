Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067128;
	b=VW/gLDML187rlzIIZL4peJsTvSUzO8Og7sLMcSYupqU+tNDKmii/kfRKFGO5WQv/MvhI
	 iMZTY+Zmnlzp8mHornRh4yDaVub8mvk8Q3u6jzTpdkcpvmmEpmaq/MS8H20f6WEO/1psu
	 OsaN+yP3D7pujn2FoKZ7akFzgcTA2EkQiBjVdQ15CNitHBSrYj+euWn2Xwm9FmEZ5EMN1
	 RJutSMSsBQD1Q5i2lACgYMjjSmFgscY+g2uBhXhsEgy5ZrqQAi6IL3hIpNjaV7z8qSvk+
	 RG8PHKjwfAEVWwHUPLAmnGEYw9C2X6sCObgoxJoWtQW68/KQmlTaft7RTlPEzjgwEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8bVkydg8cUTlVFBihjSzL0/TYhvgRpZwbeYZE1sq6Y8=;
	b=ytxZcRcuT8kCT0b3cwFw1MSeHybeBkuDO/7O0N2zHz8JLC8peoAUi0ROp0SdUpsPkyz0
	 As/wetEAGubmwwhjdt94DjuRfkv9zgCS9PLrF00pNH/cfdRtB3jBXvdC3gwiEHRiISMqC
	 dvRxq5zGbccL24iznGui56wxu3QTfFyyT08yx7yUM0CtBJpvXrZ0FUhD7jlJOT3FgWEDZ
	 q44o+6ipCEeMCCtjdAnZ50SLbPPdlN8mVw9Vd4Y88KsUDb3/gDkYBOgrr9/zHUnU3CVQ0
	 kTHgIvmVdtUP0yhy4+WlN6l2kqhAGjp00DTY3Ml32Z5fVnBrJif7bA4dE9vpzdEtJxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=lvVzSBc8;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA0606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EA0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=lvVzSBc8
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so11702485e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794067127; x=1794671927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bVkydg8cUTlVFBihjSzL0/TYhvgRpZwbeYZE1sq6Y8=;
        b=lvVzSBc8ejzHofWNmcbJejSxVTcWzIas2Cnj8c7L4gy7jbbWzohP28cKV2FuowkgUe
         RRgZqwo/MYl7HUdBhly9eCbzAIMpdlNA3Q+Y7ddosHxQ4co3EYXbEIVTbpKAjHdy3YZA
         +MXf1YUJTDXvJGvNBh6VxYmZjER7fDIjPPpGPlBhmDZBvocKT0dgQbNk8us7Wn1tx0P5
         ZkG9pON7+RvIXG4JSR5498vSpN3FcSB0EguYAciu4vNE87rUoE+lGwVNDGQ7tt+sy8kW
         kz0gOBaLOr52pHzkTiK0BtWq7rXCmN2iU/u6tOnzWaZOWCYQ5bEspASuPktAKfO6hk/Y
         dPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794067127; x=1794671927;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bVkydg8cUTlVFBihjSzL0/TYhvgRpZwbeYZE1sq6Y8=;
        b=FP7nsYFojcoXDi4CToErfcyg5CjX1DrLaCVpoJnt3KOK/AhkuZM6/L+SotGL8d9+SD
         RQpY7i/DovOlBVIrfbJTOdcZg7kDg4UT4OEqxUPkksI9DWgMhVab8qmlYvnlsss/BTkz
         yzuaHjz0/5ZDcJNVoVHnpLMQY28cGh/9n/dmL2EPV7C5PfRIrqvh3cfDRml50QmIP9KE
         x4U2VqJZzI5iqF/+RQUs+Ywx7OSG3M38bCUqVKpdY41FwldY0nFPG+N4QESuZfPEfXMq
         zorEiQCP8W5SHb+AQ6X7NBwOViaPNzD1XTyZ90sP6a7rAwgAJG/XiwwkSPn61Ezqhh9x
         kahg==
X-Forwarded-Encrypted: i=1; AKwUvByyLQm3z8KWgpE2PHWvWPSnWOx7K2tTrjtkxe6c1O3oHJiG53VgGYiXRIG+l+ROw6pSCDIZsJpnHb0N2dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WW+m77AVLSlwWeCOp+WIGk4PpnHILs5cI8GPSCa4bT4FppiEO
	bH80ejq5bncFBBTrUNGnun3zST39x274uUdZKqesLf8q14jrhNX9be8=
X-Gm-Gg: AYBFou1Rj23gpbcSG9jL8Q0q46PRW1LIFn8rrACVwyRgE+9P6GFKNjg/9hlvL2FL6Ml
	vsiphmRGA3Ia3uN3YqyzWUzO0eQJr46unWT+fu2R4w0vjcCGYfx6erd22MCRN2KfQhveOQcq7Vm
	DAwCXoMu8xZbns6rlK/5Q/uQQ5asipcy0p6eaX/jTiBDq5jloCyWoOHn1j84KBXf8R4lBC3cWf3
	DqbmOtlevVHuwBMs5lYLO7/6Hbpq5HdM3NWvXuBycP1HXeTv6+XdB99QzDNKKBl291k9GLGr8Bt
	IGGCjAgX80/ddVbVSU7HO6Z+dJpJhwrUv+m7HdRBtJiodvIT7/jPcaj+E8DmJlbfdlv9DqLDy1S
	lwbknGdECBw9eso6AUGeZbtNmk9RvTOBcTmAOxBbL+09SdJQpMdHivOFL8C5u4qgTe2j+YDe04B
	J2t/kN3HR7Q0fpnQ8EYxvIOCC55umB/gUEQyIwkKRqkVgjk1UYt4+drpqlBVWCew5Uu1+lCSWlZ
	gEjsu5KLLryMeohXb8L0ZMJdgm+bS5mMisQ97BkRn8KpTVt+g9y8mjWpFzrG4qxKZu/4+1qJjM0
	LMcQbuoZGZmiBQTTgcJhtOqtxqq3vGWxuRaT6Nw8jw7KgthMa2xGukz85qLPkUk6E9GTuhmPFtm
	vJP4=
X-Received: by 2002:a05:600c:528f:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b6de4a7684mr101920815e9.6.1794067126529;
        Sat, 07 Nov 2026 07:58:46 -0800 (PST)
Received: from [192.168.1.3] (p5b2acf48.dip0.t-ipconnect.de. [91.42.207.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm80634195e9.15.2026.11.07.07.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 07:58:46 -0800 (PST)
Message-ID: <bbf68dc0-8c55-4dcf-b5e9-70d3c31593f5@googlemail.com>
Date: Sat, 7 Nov 2026 16:58:45 +0100
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
Subject: Re: [PATCH 6.12 0000/1536] 6.12.117-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261107134957.653319350@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261107134957.653319350@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 07.11.2026 um 14:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.117 release.
> There are 1536 patches in this series, all will be posted as a response
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
