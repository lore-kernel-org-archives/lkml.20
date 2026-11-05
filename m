Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915809;
	b=m8GUzmgtFspwH6ZPO+JSRYPZkXk8R8f81Y5a8Ykjk7nbGaEAn6mSVeYvuxdAGh/MacdI
	 hZvul6bZpPesFKElE+s00Xnc1ykldfP/0EPwd8f39W1gCzUC5SEitPGFGlC7j0BG/qOC8
	 d1KxQwpUUrlN2yF2xsgJYaBliVvdXxzoU6tBWZYaWWVGoCsYN8BbsptvKu4/4fRcAkkut
	 iza7SF6EC9aAaONv3DyGqwCKJDmyRwu05RXira0uepDj+Td6dRzayon7FLvsAjrwhEP9W
	 QKWR/ZB0PSttodBRcJyq/5DjuEti9HhxvkpYQMQvOnC3C4YpjcAcNZy84hEnmKKYD7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CPyUJuu2yeOSTelLItaNsxminWyw+/YBw1HOW8wGPck=;
	b=wN5+CqLXYkgFexEULdY72RidR7UkXPtuXTTU+abPKVC3pQqmS9dBv2XBmxLZ1Pc42V84
	 JsZX3qiJeybVZ5uc9cmghk+maL/wDSpx4R0P89CqzIIdub64uv5xHAjdAdhnJKNYeHQDz
	 6BaIWqwlZ9PsqFhodq9tvVi4iksWAoVVaY9DH2LPbarAGN2iQBUhOmNLehF3dvlrUlmQW
	 60u/mBZw3jBJLKGD6RYYEfMs5Inj76a20JUXpBK2BjCUPhXzUQzEVpW8lq6QrAF5jEzlO
	 rL+lg4Ux8Gy500xopSKWfz66+ctK6kbow/ctFzCVyxyxE3xqxWTJxVKgtjpP7W3M38w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8zcnrW6;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48221606D80D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48221606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8zcnrW6
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso78850eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793915808; x=1794520608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPyUJuu2yeOSTelLItaNsxminWyw+/YBw1HOW8wGPck=;
        b=P8zcnrW6mWnaxoyc6Z4odI5ZW3ufC1DKRm0R3fv2ovHISY6QKwLK7MTWWElGe14nsy
         +VZiDBWbTvnjoQZ0yJ2n8NfO59f97nM4m0CZhNQiYuDOLrJd95NFQPgRmAq+JFKgFrIX
         R7iqRL2PiDuZ2qmKBNfo+2YC6qHRPDZMLP8QBn1g9ENbwqS/j6/DLlz2SFiyJEPFF7kj
         N1/Q5EciLtgaP9RvPIyIr+ZLc4CR5VaMBavsGqglPGln6+u9qyLE7ohzSf9bXtWdzHM0
         iUP2oI/ycLvmhj7Scz2AsfDGsUKlWMqy4LQnhNFBlAhPXNXbz3MxkgdisG9HVYQ5EtdM
         odIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915808; x=1794520608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPyUJuu2yeOSTelLItaNsxminWyw+/YBw1HOW8wGPck=;
        b=0B+F5OQDuYXRLSA9SN8UQp0FpUyaYa6FjOTbXs86htg8J+CTNWdvOq7VT9rS+eWN4c
         66VJ/Wvl8cyo84ijgt35+iQEtDtcTV7rZ8C1CHJEHR7AMSsEX+IgNULmPhhrJAOcxOgT
         mLz+RMCdxP4b4tNxBPgvam6/h+EE6GHf++gAoM0Ezy8yXWF9TpKIgnX8oYUdAfBlf5gK
         oIsMKnvMYHDd7b2HhBXsCtbLUJYT3+e7D6eGa7sHFlbK1ZKYBbLed6D5sJ0hgToe0Q7V
         msKHUZK1D9/+Vl3weuvDhoJyFQ+3Izp+NJejpdDplza99ITCSlLZw2qs09yr5pfZ0dkp
         FhFA==
X-Forwarded-Encrypted: i=1; AKwUvBw9TIn4/4vVPSgGlSLxI7AuOFk1JSUXM7upq5wj/jPwjyrmLtYIc0x7drpqtY70Hq1CXDri11qlgJQxYYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lipivBAPhzPF6J1MPFAoj8yzzrhoNCKyNVPBKlwkv+Q02INnB
	cu4DwZkhStqwnf9ZSTT6jbdGu3MwwT/M9nryqlhQYRvYEFLE2pP61L3S
X-Gm-Gg: AYBFou3XkEekF/lrSZnNAeyUp3YwW9U0cKGGOaGmeh7GBFP9c2ZUaPw2xKQlZpwN+wM
	QX7SUr9qpLu5d42N3iDIIUploE8dqDNNZlG8dvIksK8hDyciT/EUJwI39R7ysgAmVvDOkJXwKoc
	vSj1UbqheQhxk+fSk/NKp9bF+0SsaU0mbYrjj/CtfPjuguUAIUDyH000JArNlHOOYTM3k2jpmDc
	hpBdZxNSfqEvsFsXZK04nTf/qkpXfLuAgRbrA8+Tg27SjTIiUkaN7O24odlCEZ9jSbgcoVXj2hK
	bZYUs1AO5pgIRFPdtOEezP5GFIdt8WnOzHIE4c75Zc922yh32kt9e0+xGLnkToupq46DSWJU4TI
	hVy8cqqNoJBChOhkI00wNKsK0eTb7wi6WH11pq/X8+Za9xSf1nnREowKJR6Du/lrahwsFOfUaoq
	W8esKnuMeZAhuKEfgJ6d1KSXtVG7d6m/ZSjsFWEPCnZ7Q8ieK7zQDWh+QCW3znyTicgVuZyrb7G
	E7WRiVj2buyovQd/N6sSqgB/CVZnZOg6rO/3eEucnqXE2h+rj/X/eklr2oX+FLWWsRzvlBFGiwt
	wHF/LO8sm2BqmhBYvS2rRM6I/rt7RDnsyLSgsp2DF6rvh3jJZ/JkRJD/fHgQzn1kRtaPe3gMghN
	p
X-Received: by 2002:a05:693c:40c3:b0:36d:a465:b38e with SMTP id 5a478bee46e88-36f72cc18cfmr774374eec.5.1793915808199;
        Thu, 05 Nov 2026 13:56:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f736a1da4sm1053048eec.7.2026.11.05.13.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:56:47 -0800 (PST)
Message-ID: <99b56b59-a1f9-49cb-96b8-6bc844a878f3@gmail.com>
Date: Thu, 5 Nov 2026 13:56:45 -0800
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
Subject: Re: [PATCH 7.3 000/547] 7.3.2-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261104211038.406938024@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261104211038.406938024@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 13:03, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.2 release.
> There are 547 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.2-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
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
