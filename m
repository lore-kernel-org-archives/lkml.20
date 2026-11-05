Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914072;
	b=NkxlJWFSu7HLO34swQLeutSDfilnIRUwM+ik4m4tSAKHyFGF61SHIJZiYyAIRmOyLplc
	 4SwqKue3/3jn6twuEmmQLRC4uDOosQ0xi/7zWteK395bRTEu3EsnvanoCmaDHhvDNbbFB
	 w5rDvoIZ4uTWSeMqlkNfsYYJFA2igfAQLj7icUvgG0G3NdASNdvHOi/H0ZY/zOjJYWsJJ
	 s+mTQEfH1zZ60m2i0wnCkeESm1+8kk+rF2nWzRXLjpo8zTFHKlV+DCuCOETmoM9ZEN2Qz
	 rSqoAxRO2hJzDKX1KI4qK7Nosa7viWCqzFEKuUQb1HFkHbt98IvovFfUKQ5Z+1uM4Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wX06EQOYjMy/aW6xZlZGYk/V5Xw9pqyAzAzdo7pf5JQ=;
	b=O+Ea4UAWd3t8W88Ft1CNPl8hSSgbSDIjMQT/H8Yjs7r7i9SgCwZP4fG98j/UyOkHIG5s
	 HKtiQ87tr9BxlbBc65FgSF02lIYNMbS/IjEhK9r8qTf5KjLMr3NNnemb3uXdtOOEwIxFP
	 kRS4F3z7mn7bMyY6g+EWdus8VUXuR43yEtz9LHeO1nrOsBUqgSMeVmeN5uZPy1rV9bk6r
	 MRSrfcV3yKx6LS2miUEcbGfyWbw19UKAuBFW4T3Ee7frCEUBSheelrdFgHYCyJi96xuND
	 eR/8hu5Xxt5EauXXOqfFF7LcWzbfW4zwe/521MeQbfZzL/+WUDkWJmCHn07fed05Y7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EELVhw4N;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF90606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF90606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EELVhw4N
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so148398eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793914071; x=1794518871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wX06EQOYjMy/aW6xZlZGYk/V5Xw9pqyAzAzdo7pf5JQ=;
        b=EELVhw4NwzpmsllJw3ppEndPr0Kp5G1Cb2qmC98OBb/yp1xyqlTgbB17fqaYyDCWkq
         JjYmNbdou7Nduf6zh8msHvBli0cAbihh3O8tTbt90NOGACNX17J5WiylNHcBvTukJ6za
         m/9rCaTrfCMbNkOEnkJM5r4p63Ha9msWBNYWmGNOlNz9Rx6mwdKTEI7AQ1MJSFcxdCdu
         /PzZemPVr8mI5xOn0Kw2mQhRIkZtcvJXj80mYT8u6uTimQCM2dwMvroS/a3X9hMZxFo4
         kLmLQpmNrsmqBYiVaPBz5HDR/zKrDgqdySqjDjvGFABVX/BNa2hvsENrhHMv9yiPZr6g
         bxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914071; x=1794518871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wX06EQOYjMy/aW6xZlZGYk/V5Xw9pqyAzAzdo7pf5JQ=;
        b=GISgRe2uPoI7lraz5psTk3sgW4FQ5nEPmn+0zlyZ+VHqoGRIuqp784ArzHso3CdTya
         U2fLPsZfMWS1SoH2eggWUP+zwg0S1kbwPQDzeMnfg0sXFO97PtG5YkTZ0hq/DZX4uwfd
         6VaYLSG6fEhpUSa3VV7dAz0pqS2Jmw3H5VrUmy520owhn71Mrkdc90MLEAs2ZiayjHFU
         XUQwgBGkc9F5VrxZsOPz9XeZQaDF6OktJ6mTf36tsoR8lTRFyaA5F6p56Cy8LaGs0IRG
         fp6peBAPuCbd0QJHb8nmmpEjME2U4UVZRnhbttcEa4pbee4aWnE6X8Jgy+81FaRMgZsp
         YNfg==
X-Forwarded-Encrypted: i=1; AKwUvBwdGYaGq9mNeVoTGXy5CYGl1X6Eu/t3efUtzEcbDwAIPjG/ay56SJqVyUVZPsgOyHmh7krmaWPn3DtefZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t+24mUqSlI1pcxF8VPnvD5UUaUqaK/qAGEI3QRIES57xq7u+1
	p5jsRcP31q9gdEBqsgTp7XKwZZO4RaRQXvn1vduxUk0SXmIofH3bxUgf
X-Gm-Gg: AYBFou3H/DV1WDwr6DqKQMtkIgiARSzFN9GLZweB9nKkoBVfyqhkIhjHGwtQQmCvGKH
	QV5SC4g/MF/XashWRGlJ1rMktWkxUMbqnn78p/qlcylYfzyonaXtXNr6o3rHZ3rOow6Gt1UN312
	W3HdQDEwA/+eyyO0KhjsSfcaLXZ7Iu6FhUEQlornUBQyabOXVUqdGhMk3UacD9VKjCNBfY3Njc2
	pGz8/lXGIzAeI/XhF8g84pFTRRZU61ap+lfMf8c49cmYm11bSug/Ay9mHMY/V+ychYz0FYNlw7T
	+TdYI18JsWEptAM8XXWNnwmKBclhxfEskDTHmjcepi+d+OkPyINo4ZXKZnA4koZrWumuDSww+YD
	IxdfFvLwrNWgYNJRItAiVlss+3DQJq/bc3N5vX+6qT8Uh+yz56WtRbC/t4yXKnVYSqvcPP4nvZo
	KHiwAVv10BLwmo1cdBlKWlmXuq7ODiui/QloIEhRCH5Wh8oZbTv7XvpCpRapj2m+7nW2OPWMqeu
	pv9uFxPvqIkPYu3BUncjwNWZhrE3VBd30bUR7Usnzlg8Rs52fQlgb+brpIDSMJbtxYeQVWLIW7A
	dIsMzUs4OA0dPxGpuDT7azBMk1/XKN1H/jpaYY/wtPNcf2fkW+Z9nb4=
X-Received: by 2002:a05:7300:10d:b0:36c:c434:b6b5 with SMTP id 5a478bee46e88-36f76621095mr567569eec.17.1793914070609;
        Thu, 05 Nov 2026 13:27:50 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72fbe241sm999556eec.10.2026.11.05.13.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:27:49 -0800 (PST)
Message-ID: <118849cc-6953-4f05-b1d0-22949f4cdec0@gmail.com>
Date: Thu, 5 Nov 2026 13:27:48 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 0000/1005] 6.18.61-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261104211043.516122098@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261104211043.516122098@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 12:55, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.61 release.
> There are 1005 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.61-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
