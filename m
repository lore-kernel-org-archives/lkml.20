Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA437F8B2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217411; cv=none; b=nN6ETgTHRm54qaYQuDsa7j7aTl8W6OScslvK5G5HiJyjuTcy6dcm2Fu3Py0+X8qtXoHGY0c0HDGobdQU/AQO+VBYb8rhWcwjjH6Gh4wPjdpOBd50YO4mCVKbmwNu0vWtDNlZejX4klA4mQAWoG43Vyb+Iym5B4+G0BLydGPEqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217411; c=relaxed/simple;
	bh=bMygoBzo7zb8McpuYeDordv+b6crymIVPjEpvtSxkRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezyu3DFRH559HEOqN2z4mEnA+L1jwVwKVIvFyBkfNmlg1XhsBWocwQF6GPfLAB//nPIruvJKh7r/OY3wtNc+9E4WWlUgsBzRi/fVz1F7pB15cuxzeIptp4/n3ZaCuKK6TnuDVS9AYJMQ54tTDMG+bPEqINOo2cnwMQpVS3Gu9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DF4FQoPw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DF4FQoPw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so32150685e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788217408; x=1788822208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHSzoevZ1MFID9XrLurw2Vtq2FQQH1mFe/gQnt2xYdc=;
        b=DF4FQoPw5a2orIpbaWVBawge+5bcwwOnJguyQD42gs3Kn+gPI3e5IqgVeuSrFnYt98
         Mco1ZnrSWZwfEkHycLuJnBLpbn/iIf9Q+7fd1ZstHc+1Nwj/09Zb8X2m2Z6W/qzPeAL0
         6h1xUIwvO2tU4mR5PTlVRuocpc4R8IquKTxFsPOdzWbfIr+48ik36IVYC4lB0J5tB2QT
         EXWNRu4m3X2ACPZGKEWOFapi3lgNvmf1gVnJ6zMHYAeitiUjcpI7Eyaif++Te6Gh5iIK
         Us6JPISxBJh/FW7MkPi1kBrCMAELNTQy4dUT3fGtN5eFThFQQbBL1cacWJx/9lzeoj20
         Xl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217408; x=1788822208;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHSzoevZ1MFID9XrLurw2Vtq2FQQH1mFe/gQnt2xYdc=;
        b=J6OIIB5IHoS1xIoXd90EPD8tAcG7MB5X1ftuLp3/1VD6g05BCYcdw17cmXl5ri8EOl
         ZOdE6q6Ibskusm7zDBb6hZ6UV0qIxU8JefH073rZx5ZrDB2IGVCt5fPYfraqAJj6ZriH
         gUMIAFb+Vkt2BSFdWt49XeZkmehNSvsOqsdkSeMTTbwLVE6JEVVkElGtesFncObKj4Eu
         FI66F9Fs9nhTo9yMqYaPfrmDf33DuxT9Bov9FPGzmem8WTslQD882md/UrSgVENOKWVl
         VWsinojlfjyGYEyEhCPPUvM8rpNMKdUF5YehUWtiGXABWibqPL5fijyNnxiA69MCOFqe
         sK4A==
X-Forwarded-Encrypted: i=1; AHgh+RrR5F4S0Y0Ja/CjAuVriYi8sigVfFB66O3zZz6DJfF+pG1hDlVeuhr+5WoFZ76/vE+jB5+v0ZT0xrFo7+c=@vger.kernel.org
X-Gm-Message-State: AFuF++n9J/uMijnDsmbU5Gjlhnd9FgAebOdPWSZxHbOAI8ZLi0qSMEhu
	9NvLgUugVut/Fpe45rLSeZuS7saCZSbykiLfilG0ijmtyId14xqSR/o=
X-Gm-Gg: AR+sD138G0lQPpE2FmwDcSf7RndwdjO1jHYDgNJ9ZU552Py0t5QBONoB0oz01ozzdgk
	lawHNseXGSpWkRS5W8Fyrsy9PTm9ewa44Sh1urTvczofVBR1kHDMBmV2zFaN38iRvOCx5JDb2bW
	M4ggZf3E/YgQFwEdTmyJsoshtMdoRmryv7GZeYyXBd4wTVdXYgY0Q/esSSUvnNajNKHc6yZe+U8
	n5PeCnq3bWGzYP6MtCtcg2z3wg6YfJrZnsxxM22WxFONAHCoaEbK0zjE8Yzyt9493ZdXgPIuXLV
	k8RZIDjS7o/+dh7gjoi8mgDnKn0HGImxFjd11JUILahc/LhhReJORmx0LfkbxeVqwDvX81Dgr8S
	wx8BxvAdWqw+jzN00xZk1bYqp9J5Kc9liaYb7rNLUjdlsgTjegkmP8J9TZ/qo5Eg36FU+lmoQ++
	EnLWEQNS8YAOycNxdVfKIrZKifzfx3gk/cYP7P/xQS+sJKpJmdLxHK3Yok6Rud34koW1xt+DKpZ
	vYfDmX5U2ozaPLXjVeF+aPhNcY5fVo4rsdZujk=
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr437781415e9.6.1788217407897;
        Mon, 31 Aug 2026 16:03:27 -0700 (PDT)
Received: from [192.168.1.3] (p5b057bfe.dip0.t-ipconnect.de. [91.5.123.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8b9a2efsm118147125e9.3.2026.08.31.16.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 16:03:27 -0700 (PDT)
Message-ID: <6496880e-6d1b-451b-b374-209f856883d9@googlemail.com>
Date: Tue, 1 Sep 2026 01:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 00/83] 6.18.49-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.207714926@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260831133359.207714926@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.08.2026 um 15:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.49 release.
> There are 83 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

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
