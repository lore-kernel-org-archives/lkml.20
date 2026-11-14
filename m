Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677187;
	b=c4/Rdzomrdtz0Q5aRFOlyhYAJd+KTFEVXIBqXzjFumURDtj2Fov6mF/jZPWHhVRXXP24
	 4z3cMj+mowLSPcRrfOqTJAimMBLg/mOWR7v/qCgD0aLDWH+jXNPSnF9ntJgVq8KhujaaM
	 YNcD3z7SYpeURbqovAnY8JgQr4gqs6qAneWz9jkpbNSuyP+A9f18L4d1k01Y2iE44JIRc
	 6AglQKan65JvHy1eJLQ5BgxXKV6uIXNDX6s9G1q4xEzIm0eFLszXKdfG1w/zhdpBtNJY6
	 9aCF7M2weFTYdNVOfJKb8o30+GS8YAfmNAMM/yfvYl7k4/T4CQzs2XcNXzm/6QIwfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+znmWJGuLi0+VfYwsBvWce64M+CET7dyCJAEYtt+T78=;
	b=uyobtaJcLTaZJR7ZRE2c0npb5+wILb92xe/NAMn1voztM/e78wlPCg2D2LLgR8kh4Iwf
	 eYiXTPXUzeGJPE1GH5sx6sA6shRdA8wYL6AUcWsx9HfZneaJsJ88iLMBxPpVq+Jbj0RhH
	 U7lz83t00kMCXxGlOC3lftjYn7RAIlx10EsU+Ll2VqSmAFwcWjRwvYoP+HLyfDNMIKRb4
	 pyL4YJs8w6N2/TU/d3yJhze6yuNC54+nCkq85cjWcPIiBl2Ib5aPGmzHu7ZyTPQ+b7lhn
	 mymYd+SgwAXp6wcdnCFKNuGQZfJZ4OnljjUjqsTF8W8eGLnMMrMxqA10lAX+KmViC2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ciaaPeyD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9910606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9910606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ciaaPeyD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso6262195e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794677185; x=1795281985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+znmWJGuLi0+VfYwsBvWce64M+CET7dyCJAEYtt+T78=;
        b=ciaaPeyDyB30zKy8ePJ/fnq7GVNQET6QGcbAsEd7sOX2dAEwBufU2eRN1b3V2/5XDv
         t5wrRbIS228H46SsNzIwf//41KVxw6ueiFV+pQyY7VVS5FOVycxtd8UNp3Ky1bVJLhc5
         CDjReWZrfqCuKMv7Dg58T3uneM+uu7jmbiayZbAOkqkCmw6YtBezkQNlec/Dvegjnw+4
         6yAwtngFQVvINq1/WP2sDUW2P9aV8zn3K5C0tVMhh6gkk/Vpxvmi2cN0R6L6jUmkXWfz
         exq/PtuUJ/n/XsHfduargC5IVic+r4Ep6yTOPcK+zQd+fCnqCBsOs+m8Iv3ltRxkZkfe
         jhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677185; x=1795281985;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+znmWJGuLi0+VfYwsBvWce64M+CET7dyCJAEYtt+T78=;
        b=f3aT3dHBAh3TuaHNlDg7kNMbTrpUOeVej7KZVQtVU5+OxjnjmCtbgccrP2W21f+ajw
         xoQzX4iMSIbg7b4PNZb8dZq+WpX5HMZQKjYrkPNDe89euV1STkzbWYlkt/Q4ZDVdZ3oc
         fMl7e/k/gl6gc/IFCB9qzWxXYkuPy8n7xUnJdsxSmqKZfDd16uuZ05dQaItga5wnMJuB
         VARMGcZwIIDFqz/QTiir4faAO+EKRaOvF0+1ioGuXPI01Tf/S+6nsBf5j0/Hgk53VAPP
         7Rm72mDAxnfSANHlWuZuEL84025l9IzGcl/ocuBJLDy2+WhISWYMJwFxD6kLpUEvWGf0
         0Pcw==
X-Forwarded-Encrypted: i=1; AL+hErG5q1dWyfY9SzBaLVnDium0ZaPkOuoxTqJrXqKRWz4JIjFsswemiBK5YW1HaASVf+yBXQTu4nedcztCuB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wSh8kK1nLcEVtNBuiho77vy22tgzb+lQUD0hJpxJO+KHB63ua
	QvMpgMraC6lLwaoDztfhg0GAuShV85C6NKkI7oF3JIpR9WfjwMgZyRI=
X-Gm-Gg: AYBFou0Wx3zlOEDByVoXkNRzM8mlPaMiO0CIFwNYDRfmCz7Ay8Hk/Pv8QpNLmQ9IWWZ
	eAHCigSzUgEGANLSzP6unKTjfsdYBMRgvxym7k/ubIw9n5yb/ACcmXu2RYLWaNo/FNnFGTYqxlC
	Yhcrw8T7WPnvnnmiy82BoHJ3wvvj8eaZPerOZW2mcHdtLf29JLywL8esBw/ujbbFBZKXv8dSIz4
	0nqc2YRBfaouY30fOggQiQ5HRSiUFyCJd2REIVvE8UObMT7QIAoj/iGLMlWJZz0/qBa5v4UisJo
	0ZBI0iasLlsVSDv8Z4njR6hBs6h4BY3cQul9T3h2cYIQ08DjMeeNJI+qtstVYE/KAG02ZWPOtCI
	eDl8/yh35ccMoUP07rUhsamBFYf6PImn4Zy+piV3sNBFoekODvX5KNnQ9/PqLy4tolEeV+pf4E1
	4QnF0/3DNimisUHPDXV9uqA+1Vxh++vXV2R+7a+BQT1pLtg2Joo/FnReuLOd2ryT3w0Xtcy9God
	B4/rGfgkMyXgyGWxkPRgZPuN1+XiqpnjsCCv9rQylHT1XIRuD0jhOHMzBswVRMA7gkDjtltzsL4
	+13waiYjo+UOjbcUdoHJE2MQdtt2Tt8T1sUBgGqUEIT3uiYhTM8B4wzfHHjpd49prRUj4pd6F4K
	Kx7zqPg==
X-Received: by 2002:a05:600c:a10a:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4bb55a4f1d8mr90924655e9.15.1794677184998;
        Sat, 14 Nov 2026 09:26:24 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac4c4.dip0.t-ipconnect.de. [91.42.196.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm166424125e9.11.2026.11.14.09.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:26:24 -0800 (PST)
Message-ID: <7fd966f7-49e3-4ab9-adb8-03ae961d0da4@googlemail.com>
Date: Sat, 14 Nov 2026 18:26:23 +0100
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
Subject: Re: [PATCH 7.3 000/507] 7.3.5-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261113153753.358973689@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261113153753.358973689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.2026 um 16:45 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.3.5 release.
> There are 507 patches in this series, all will be posted as a response
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
