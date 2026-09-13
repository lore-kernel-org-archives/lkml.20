Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CC377ABE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789298558; cv=none; b=P2RYy6EllhFhvVn0WDC1yBLZVyfMrtgPQqZfXBG7jHjlpHAfU2ZsDa8ZLP9WrwBOvLabDX8vnni1Ib2XJ7LFHBsivat8l+A1JJWGJ7S3pddboWxNumlXEXYXo/Rwfo9MvAQ8hdvJmBw5+ybrSCzL32faT8AeuTAbMElWXkILN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789298558; c=relaxed/simple;
	bh=zgYd+/+OrMtAYZdTW6ALvcgwYufAYjVhQV5KAyT2rEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biEOZ6NaVn3mXXrBx6wc7A2rHys9KMQ7fAPVONTb2ud07ut/MzMPI0g49tr+jabo5KNROKiwlJkuXQj+B6VaS8wIP+9oYRU6uDxjVc6sj2TCIP3PCmonCLsVxFAmA6DTVdTepMnHN2CEcjlzUaP7zbDNkJraDgtUakTJAkeuqRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=firoazOC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="firoazOC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so8828435e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789298555; x=1789903355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wECUEybq5CkpsVtthy4SjiDIXRDYyDXHnZHX7Ni0Em8=;
        b=firoazOChl0u0XiGd7RT/Y2i+WeL3uMgE8vzu8OmeXkrciMSc4KeZXh7a21fLGPtA/
         fl17gWiBNYHg94f/6PqEKNVH+fs0H1pIzl+ST1BNTrXEYjzJ5Yyrze2CpMT3aKeFll6S
         8LTqpFYYzCzptsigCO9AOyVi4EUzPiG2m9oJ7mGFVftz/FMkp4UCWirTdIQtqOcLbedZ
         NQHiEohJWW5266Lclar0ygJTwECQJuGLjuqLyMC63GEq9TxqLv+FDhr17UfSnGDa4/Pf
         a3IoqGH/U9D3ZQ2HKU1sFbeoPQ0gR1A2YWABeEn+2r5AoBohDbB5Ia/QZHHYUddD33c/
         hixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789298555; x=1789903355;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wECUEybq5CkpsVtthy4SjiDIXRDYyDXHnZHX7Ni0Em8=;
        b=ra8wG2Yz+H8dJQBRqJuGVWDKVOOI+3Q3zKd19ecnfFUbyJYHEMLlTxOLZlEZrPfMLe
         GyCpU1cOQ2uRrscuD9CrZLTcYlD0cEBud1I7DUSzKi3cYAZA4ft/eF5EHr2aMQipnrMs
         iK0CBO3hy6HqeJMxPjJrs5EaQh66/bGgPN0rgVTcuv82wNXs249R08IKaX8k3mUz1Law
         Z1+LUscBRCmAesamj2zqyOJzU821jrtBcq/xE24Sf5KwqOP6PtRPhh3RTHXRlVYZJuc6
         /3k6Yyu44a31PTey0uCsSpFtCHHE0CwEFHtCgpH7+cIrxwtxK9rgW9K4esOSZhVtIrS3
         /Msg==
X-Forwarded-Encrypted: i=1; AKwUvBy1n87jO5cm90KBdvla06bqgplYmouiOT5QlqLw099J+DfnW7LeegUat73cqSQh7fn9+Bmt7KZoeUWtp3U=@vger.kernel.org
X-Gm-Message-State: AFuF++nTcUi7djcLtku0C4v09bgOzBQc4ilDGfsq8tpMNaYuR7L9h1CF
	30NrJobQ53GKlsqO5Xl6+pSJNdND8XwE/eS/jUkf1zEkdVcoSIehuZc=
X-Gm-Gg: AYBFou1lauGV3FqsnI7vaTJ6At7Wt1JCbSFnG1jY5p4SDZl/uuQzIgBGI14/2AgSgwb
	+sOYjmfMRuDbhFf0IoSvP/r1SgTiWOJer+iZgcdVToUDgRg3vYRHjpvb7I0xFnyIHs5apNh3UVa
	VB+1mPcM3zgxXXZ++774zNNIMb4mV911Ia88zKMAE2r9J9dJFe/uCw0ER9VTPdzLOQ0g24jwb/+
	59FJcOsP+UxbSVTRX7GHhaKscdB+G3yE/rqfJ+f3LAsBBwutDFY5BOwQBRANIvXaBdoLDPbBimH
	S7EAiGnl27M8iu6Ql9FtDyiKkUavG7E9ZdTTn72BPDpef/CSfsn8qPTx76TDCnlBYpPVXJ01QyL
	a8KlYMcrNKlEceXBkSv/SgEazku72mCLNmAzJuzzYMqgQqY7MovGZPhXaRv5gx+yDuJviTXIu9/
	iuUNd4sO+UBPk86+yEpzLM3ZlGcZSHwb30nxdQZJDHtY6fI/qG6tRIYMdFl6mRdJkm7OREPyaHf
	fomtrCmWcDifHKq5m2807u8XlxaCMUg+QHfq/Ro1o3rS6hUew==
X-Received: by 2002:a05:600c:37c6:b0:49c:fa21:1c8b with SMTP id 5b1f17b1804b1-49e6cc1a4d0mr58613765e9.32.1789298554999;
        Sun, 13 Sep 2026 04:22:34 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4716.dip0.t-ipconnect.de. [91.43.71.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm282128375e9.10.2026.09.13.04.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 04:22:34 -0700 (PDT)
Message-ID: <2b7c10bf-d08c-4bc7-ab91-8d0e8621887d@googlemail.com>
Date: Sun, 13 Sep 2026 13:22:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 0000/1815] 7.2.6-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065648.999753832@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260912065648.999753832@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.09.2026 um 08:29 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.6 release.
> There are 1815 patches in this series, all will be posted as a response
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
