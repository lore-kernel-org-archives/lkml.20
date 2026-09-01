Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ED942BEAA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281077; cv=none; b=hOC+4kylBVJowk1RzOXxlPyGutqky/cKc8A+ffk0iKW4Vkd+la7Z3TtubPyiE4O7TyvnubHL4QKQFu1s/B3PL37zp++6dFKPJfke7lHj49u2xLCnL4OVB3P+0vK2jWRXkkrNONLenNEbg0NdoLUC9x1L2udww6KGYLCarxx9KXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281077; c=relaxed/simple;
	bh=BE8xFo1k60gypSs4ssodFBplGIq/3pRV/lXZBQbcfQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxNZ/vf5RtjlO40SzntKFecnEaL179Kk6V5EcnCs7I5Y1rCfXVcunnC6Wv8LkLIs+7cnA7Qp6l4ChhS5mJq+h+eX+00BWhSztGRvMSF0PaTUDLjw7UJUP4aleuyMa5omnU7oHU/O5Jtj+K0vluyGeVMfn6hI+9I7E7SSzygS8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dBq7QZEV; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dBq7QZEV"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso909001a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281074; x=1788885874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GA62kqcT+ePnUyibTOPCdIAFiDj+kwuH2zWieDVoT8=;
        b=dBq7QZEVUORHNH8cYSv82kNJHveQP+WjfZc8xhxuYD8HjMfDMuVsQTAqDS8KKFcwMN
         HczzW6fD++PAjT9IKEZTjthUfHJyA6ru/AOsxMBxiEc+ebI66Iu/b+fivuCKYJtpYGUz
         cmIHqb1TtovpENaK0Q2nuT1a4zhl8K4CRpt60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281074; x=1788885874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GA62kqcT+ePnUyibTOPCdIAFiDj+kwuH2zWieDVoT8=;
        b=L17WkLMScG5cmW/kUInH2zsfhJoRuQiuGmWA2vyj2JgR5FzdAK9hXjezCNW9h04w7T
         U9/h+b/kB6lePLJ4SdlsbCzUGSTuSMnjChthhq3IgW3UNj7LOGf4FgTJQbajHhUZXo+x
         JIm/OArMei9M2UF582XbzgddD8WcJoBdL2uQhjFvztp5iQz+yIZXE8IuJX+7QhlgepEr
         GkqSnTqBb++NabpBaz92eyzoXEereeuOqq57PGKBUzZo4lJjH/WFyRw/MXpnkhVmkh67
         hE+igFCatsGue+h1h0MUV6sebyTzVMAIdiNSIW8XOQGrUc3vPRpNCdhQ1d1S6q/tiXyi
         7z1A==
X-Forwarded-Encrypted: i=1; AHgh+RqY8z0TG3IT6Q9dWMjsmG7ESZxt4D13EbroiNJxVIioDpHYWLVO0jwr5zWdnaRlmhAGIBQBYybmxQPltYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mGJKO0NmVm/Dj+XGnTZetZgT1d6aXSL5mWyjAEszQvzlSvkKfm
	byxQ+256pONdt3qrA3Qo5hk4OvOVnuht4QDq4oW57umCreACEm4U8RduhOtKbMG+ecY=
X-Gm-Gg: AR+sD13fLqeuUBhtFAExi3G48AVqNnUIV4cd9GSzmYnIcNesPnpLo1cQgljU1l+8wQ/
	uRFDFF9xuIBIPV2WB+3RqW7ao1PN03fK6jdeQG3sSx5fTQK11ak5WkVtPhc0IP+3sJ/RJV70ArZ
	w8FOyC9QW2Y3Ks4lnESb5Sr2ZNDpkYE+1bDQXygTEPyGEq4+n7shiHcPU6cy9EDsf6FrDkXoJdC
	cLXFHmaoxtiX50qc5U8fwncpWorEfIIX6Kjg4e0xZjDjhGGgEZXP8E5mvuV9+t71u96jm1tzFNb
	DyLOKSGwahzXuF1t6yLPE0vvJ6EMcpvdJb2Zj+DqsdZINv4VeKHARCxowXcVMOUmSWWSHgk+qDt
	BvkpXXCzMwBjrCJlFGn3ZSA6hj/dszCxCkOb3blO4VlptahMSmNk2UViA8KAPeGIkCG5Vn+HyS9
	9LcS2m5y8cSaThKxmh1PvCPSmphXKYoDMfIb6Iosadwdgw3wZ/blx240Tkvpa9UFdylGo6Fw==
X-Received: by 2002:a4a:e90c:0:b0:6a1:47c8:c86 with SMTP id 006d021491bc7-6b1c667ccffmr35159073eaf.10.1788281074439;
        Tue, 01 Sep 2026 09:44:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30cb5a17sm187699fac.8.2026.09.01.09.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:44:33 -0700 (PDT)
Message-ID: <917c59b8-d3a4-44f4-acb8-7d527f36dbc2@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:44:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.1 00/76] 7.1.13-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.185608553@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.185608553@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.1.13 release.
> There are 76 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.1.13-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
