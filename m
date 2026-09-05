Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C034E744
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788631658; cv=none; b=NV3F2mEAXeYMvDYmmqrH7o9UAnpAnV+lqCTNJqk1CF60IzPyO3RWXuSCioY+3SbwQTwRWMCYKkrqRd9da4udA935+Ug2AjCkXyarAs2tXNUYCH6v2pEm77c0l7z8rzf+uic6JbmUBwqOQlRi2iwY7KLYx+mUkNvSQ4iNnt405sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788631658; c=relaxed/simple;
	bh=nbv1eKJuOAUMEOdTIAnaLZ6xXeW+UqMsJKrxTU2H3vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+uA6bGmVFrsY5SF0rjcXCRekSqC3I6hLRygoeArFljpFD+OfNjghYJNvzE/kQQl4xv+urwP7guNKNTf87DMQteS9hPnFsowzZk2cZlphTmrW3SUrHpfCgaEnj7rmKELhO6VeQ4Me0P4CCiBVm0wPsJCZBerbrJ8dRhaj9MVhjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=j6zkrTDz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j6zkrTDz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dd6ee390so2349561f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788631656; x=1789236456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/Ho2DAvKn3GLqPGoIYnpqH3AGeUo66hN6WndlrjAOs=;
        b=j6zkrTDzYtHEfR8SR5EcYXLIRaAgwUiUzONDPWHlk3pMrzHBqZ4mTVfw8QpcCKB5tN
         QY3kJplIEKggLU9IUSZ3UNNx45MbWis64ZhZUhiNXb7tPDuEzTozIg4eZyVwWm1GMoVw
         7PFozrdLF2Y7rjMUxQ/ds4vQHxypH3SDAIrPRyHzaaFJMF/YeNRARjGN9eHvNgU6y4xr
         3p+PyjyYGSPmmT8mDoXymti2fzwpEw+b1nHPeisViyyCmk3iGmsqkyLLeG4dvvYx6gKL
         cxBZ4aHb2wOc1vwoNlz0Xl553qiYRhXZfS6mn5JT4/rCcBXfyK8fXvCeYUiW4Uu1DETt
         EFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788631656; x=1789236456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/Ho2DAvKn3GLqPGoIYnpqH3AGeUo66hN6WndlrjAOs=;
        b=kNroCClmwPfNv/zBvM/rOxsKYfVvTny1p0rls91gwz80aY8DMQF3Oz7IswQSK0Uoj2
         xHX8eX7A3frtzEVYWMKw60PBucqAitCuRY3fYHTMFiCio8y3qFB9mWwPhmDTzPmF9Rsy
         bW/bD5iNgLlB2OYbKYGm5iPvIsMt5TcePXeMVgu1MDuROYuDiVozoh6nNE92kT8HNZtH
         lcn/8hBABIr5PlWQepiKKz9FvkI8bWiI9/icEIqQtRcCG7gM0rBr2FF/m7N0hxRqhCsl
         H9SshpEtbpvT55i2g3uNhSzdKgU9xu8HQGUQFeWH3VPk0io1IIEM3bKrZ/qDrWkYKyAc
         +k1A==
X-Forwarded-Encrypted: i=1; AKwUvBytesJvxUVRkSFwVKlggx8FOaS6nirTW9ByjdZtF8KESmuLTk8aMBaTneuaVq4RloFlzkf2J7Xklrq5oCU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldo4kDKPztvG6JehTNNF3eXQY64Ih+TmAgtY4l8h2dfy2APVkD
	m7YFgpb4eIY5Ww0ov0FeLvp5RzPS880mhTrQysh2tNCU3kwqGQAhOIc=
X-Gm-Gg: AYBFou1Jus9mXupdcvIXiHpI8M1zUFEhieUIGGXVFjmAoNkh1r1mYR+2NGScICLnxbR
	sMafX1hmM6PsgmakKeYwaSbi5fJkO+B8zvW396fj07r4ao5hmNWSxlrst0/zhyzknGprWk62/bw
	jvbECIuNyJj8jmcuOjWQ/V2dFtGh9wxaE5mryK75xLHQ4HSNN8aRiuokh7Ev0nTJ9dlV4m0OHjK
	tqvjGv/lc6X7eVxAwpfo7UtI4ZJTFDK0Qr7WU+2OpmDjKFEf5Be8mn3SeAh9V8jU3GOvbuQy9E0
	OHPYjbVSNBoiB43kc53HA+k9RiZukIPoxUfwaT+s/RstaO2+XoAwmc12jcHk7sYcXIPsTDgZI0g
	Du0fwMADO4H3ke7DLSgfdcTsZ5RIFsLhGnFer/zI3Y88FrEF1hBQM3zyXXqwOY0wEvA6//gLnUV
	uYoKQ9GdXgvBYJ2BuqDpWzIiazOCaFjs5leMCWJe6ufXlZWmbznEkLh7t/1oaUI3kS7IMFkT5iT
	9kzMNePjTyyJ8ZqNz9zrzdfmkLbmI5VmEZA0kRg
X-Received: by 2002:a05:6000:41ce:b0:485:8c16:a336 with SMTP id ffacd0b85a97d-4858c16a7b8mr11206275f8f.43.1788631655591;
        Sat, 05 Sep 2026 11:07:35 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acda4.dip0.t-ipconnect.de. [91.42.205.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm13044687f8f.17.2026.09.05.11.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 11:07:35 -0700 (PDT)
Message-ID: <2627e60e-7787-412b-bc45-ed5d831a6bec@googlemail.com>
Date: Sat, 5 Sep 2026 20:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/713] 7.2.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260904045803.810145556@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260904045803.810145556@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.09.2026 um 06:49 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.4 release.
> There are 713 patches in this series, all will be posted as a response
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
