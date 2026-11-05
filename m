Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864339;
	b=IbWqaU71qtALKWYJXGWIN7i8RvI4ymIvdd02f9VdSyH6HfZh7KzMgluPcrJrvjLlFKq/
	 4xzuIfkEyD3jvNlizdtn5L4zZjHzFWr2Zrn5/GKJYTtqHzjfN+xL1on6HgSRTGVqNoUFB
	 y6ztVo0/ayWxvxXwrt5RIlUzuUIHtkXcA3igVLTTXCRHw4mjS/uCpvpyvjYhstVp5y8jM
	 H1O+s8aRT2kBWQERR3W2BY7KcshbddlkpZS6ZAFj31gSpRNrUfyz5FbLUE1Yi9MDd0BWq
	 6DHSavzlNqSiOdhIazpAz7m0EkVBN9t4+dyKmUxJHpWEInZovyiCgUnH0pjMcM05xaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CnrMMQppxmI6EGSsQCvw1P8oldla87L6eez+yQ0O3fk=;
	b=DAdHLb3clvqIdtJl5asu5iRjqWqhzn5AzoMjuQquzR0MHva/rDJX3D+KO0xOuoopk68R
	 xxHTJGpXjlkEM3gUBiUgWlai2I3bGPFdEztWwkbwgv5GeCBhpbxEoq5vGDiwRRzHS2YFY
	 lw6VTX6fUsxX8lQU0cKyLofgR7l43gU5sEhmyZL5425ksV3+2OC9FBweXKUQ5wSxmIf/Z
	 nCAY+6498CUZjYG7744R40g1xolndSt3HVGdGKynYamfJAiKMqH3hOz0SOxXyo+uVyQ7/
	 59yf8vm6L0esF/1dZnjLF8E5CyQqt37RmpxpY1Ldw+nHsF9xjU+oxpXomcE+b7ukK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jGxcuEN8;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95012606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95012606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jGxcuEN8
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so767548f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793864337; x=1794469137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnrMMQppxmI6EGSsQCvw1P8oldla87L6eez+yQ0O3fk=;
        b=jGxcuEN81wio3/XEklGBGKGH3fDIeW54XUe+UScH6HCEvSGrlDprVDTVLlS469A+VE
         Ib4nYVR1aiEr2JZINbYzc0Km08M4kMmqG/rAp9UjuSoS5TB+jHYJWyh8tIX1nD8SeGPo
         GtFz7iwxtD7/grmghvPlamKV0dzeNizNd02w4Pc2+STzodOOUmYIjg19lOdilHorJCaE
         AwP4dMkndzRXK3nw/zqvqgjkWJFfey9CFb9SO6f3fSnNOHAabAkLSQq8MAq6gNTP1CpZ
         dBe98U5gCom/dCK0E8/FwFzX32g6z6lMvoWYKnyIZSfqNdfZ243uU6J+yijR4B/Aim82
         S2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864337; x=1794469137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnrMMQppxmI6EGSsQCvw1P8oldla87L6eez+yQ0O3fk=;
        b=jdEZmlk4pTOP5mPkmqPsOJY457HB8jrpqVIyWRnNtLf6wK2hCvEUD/uSx21oxd8hBv
         ZAh+pBTKmagsN3segeueUOGcWA2imtaGpvBoVHxSPKWSc1IPj/UlqzPo6VrQWdBSANAs
         f9Vnt1vSpNV7I632oY5SQrPgKKwGwbGUCOZT+m1AyrIYF0ZJWjA/DnIHHJg4uT9JHlRk
         WwNxwlCMKptnHx8FbDnlqYXeHkyVRReTV2oOSCpiQSQTy9HMTAwRBxqh1cnLhCnJKdmP
         9ds/Cu1g+1i7N/+UWpMasnVqLaosnh8dihqb3WEzmF8K5JqQNSdnbaHLftoTlNGyBvbr
         +vDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzErwGp7cTVOR0olZJMmFBO5GP56WrJ5NMEX2VyD64zeGwZs968bIzJAGM6H4iLuo5xlM2wSq/YZAJpEPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JaFjTIJkq5Z66uYbBWsRxdMMtNPdSIzU7N5yC23a631lnUaSy
	eGac3HqFIYGnbggM/n3wpKBy3GPuahFyNYevgULM2VgjJX53AkGjtR4=
X-Gm-Gg: AYBFou2dm27a81NYnBh4+KOHUQhHfJ6Gziu/NFipsoCTc+Oq1TnUuM/SMp3fs2vLcvw
	IQePK/S8ZiCTKflnaPiokUgiuJnAtOr9ijOBaT00fnnuiPyJ++HN3zp4rxCoT8pLAx4vcyJLPWs
	ZqKKKRZjiZorApHDMul83Aa2HlQPKaQh+hweudTUP53peImbibjNVrwZCX6hzQz5LTGqNy+iN+0
	fZvCujh8w0hjlrPszDSNO9QGiaGziCk2QmzfXWY/jCf1eEwF7IflrR/8FB1Mi9dB2/MVHPd2jUP
	giIt0xCbgBMPSkYEayQWamroEgbhEkq0YbzZ7n2ymMERAvdBKbfF/pv4NJqS4n+2Z+5R9/mSMuz
	u68gN+Wr27NGzlFdhLYr7CqVjubrTvrofER4qrKzva+L4QW1EJXOxl1Lm3fypk4vwprDC9kVzAR
	YbTV/J8NH8JMBCAvL4gzhTYiKPtF6aRuI/b10YvMdDredJYafx1+vmB6xg1Bvbj2nxQQLHIroSC
	it4tVlbyQvx0zW2u6FzNm/B7GPfNUK3s+lYo/kbmkNjImwMbB2vL1ECj8wUdxlmRPzv0X/DPYoy
	9S6toraYCdhk1e04hR3krCNh2v+16caC7gVSLH82oY3MT45B4VbG8pwjO3Mtc+LStSAme8v2zs2
	I8A==
X-Received: by 2002:a5d:5f07:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e6e4f8c4dmr38866485f8f.44.1793864336714;
        Wed, 04 Nov 2026 23:38:56 -0800 (PST)
Received: from [192.168.1.3] (p5b2b4618.dip0.t-ipconnect.de. [91.43.70.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm8472216f8f.46.2026.11.04.23.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:38:56 -0800 (PST)
Message-ID: <5588d6e7-8507-46c6-a872-20c536901f1d@googlemail.com>
Date: Thu, 5 Nov 2026 08:38:55 +0100
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
Subject: Re: [PATCH 6.18 0000/1005] 6.18.61-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261104211043.516122098@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261104211043.516122098@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.11.2026 um 21:55 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.61 release.
> There are 1005 patches in this series, all will be posted as a response
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
