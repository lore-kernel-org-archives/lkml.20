Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2325248165C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281229; cv=none; b=aJCkF/DgzeFOTS1XGsXfjSRTJQXxCffb67eDnZvcd0+rAqZE1+qZgKzXce7kGfnoqiW4/rzjErXnjFQuCInR3l8EpndLO1GLFNCdZuLtewDPJP5SwVcn0rac9Ze2XTpERJUK1xjr5QtKtmjb+meZFLOq5Gd0+kjBXWy5nAcZ07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281229; c=relaxed/simple;
	bh=bPsnUJ6dQf379tAgPrkAWtTN/5CZ/7hAUIkD66QNzTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0Gb0FLl1B2oTt6sdTqvd4fAJgGRwiXW5gPsw9VtjPXPlLAVwxpnLn8QNzwYe5DHOuN1CE5M+BBitZ7EAT+Tg4akAt3wc/I4Rsk9IkTG2WCKajocGOznJKvLSwYvS16mTEt/AHwS+OIzzRn0LLUfmCdcd7PCB3inJeJaapg+Uwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I1I6xq6u; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I1I6xq6u"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f64ea07036so3205755a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281227; x=1788886027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UuquAVnKS8MT/Txp2C9I3pztBXGTrckd91hiHPlo0c=;
        b=I1I6xq6uofmLEV4swfbrVEhBWXLIU8nDO/YS8/WbGRjgB3F0MFfvDDNFzQaDrYm54r
         /+njLYB9OrVyXjQhwjdFaP7con1kGAQvA/rWxJW/FpB+1B4VvmaB1BkFv9jLuTFatdXf
         vAjGbjQpsDodbE2LFFe5GGGbhVo8JR8QKxy+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281227; x=1788886027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UuquAVnKS8MT/Txp2C9I3pztBXGTrckd91hiHPlo0c=;
        b=aTcV8slOqkJzOnP+bh3RSsa0sOCr2Zdnpkz1WXWf7coa7sCkmM5uGeTENDfW1+M5Bj
         Nj7FcqNU3sHvhvh/tSDhchx9YqPMiE0KEITPa8ZczImOUTLR4zJyPzNFld5PBb6W7qVv
         x5KpKnpONRKflswHnz6kx69uBvGdrv4WBDNkqpzk8B2Nqw9HmipUsJycf3bmUXjd3ql2
         NcyCC3uBtwAEDTkrJF0vLxcy6/a4beXQtN/jYea6VK4n92dBGfV7TT6/GH/x+v5iLSG/
         5RmJ4P56m31SdRctc7rUnVNK+WvWKFznFFbndU4+RuqLMLRyGR9Y4oLHTPv3YAUISop3
         dCng==
X-Forwarded-Encrypted: i=1; AKwUvBwboR9OmoaDT8a1erP72nS0NJxricWk0Ip4KAaSB2WDyrLKxb/XtQnzh1QR2IZ1Plbs5X17vo/UJOTGQlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nF04cV89lGB1YfZF/C9vcKScdJ+5Tdmf6uEh6r+ERr2sKKeMsX
	aongvrtx8lEWLWlv5lhqjLaRbtucN2IMGBV0d2JoU+MG2u3kq1i8eibbj0ijRuxHQQk=
X-Gm-Gg: AYBFou2Py2mTNrFfUvvDqDav0/WiWfaWq4+eAXZ5185rvGriaQgK1T8+RIstDlIHFNf
	JoJQ7QqELUAUZU6LbG9o1+qKzEROTLosclNDryRymQSOiFD3+GvquYRVeGvGNtC66uGvbbi8uTn
	5SpQ6JBgsA/aAf9AwfcM37kib3oXR6rDyDwl7fPrW1Xzj4oouTkSRgVFrWmAZ1VAi5Yphgd5Tqs
	4yoQhFmiQvkTzYhaAkYI2p3Qe0tW03ltsSFgYmxd5dvFv61t/CsKPIf81B+sRYxBH4in08D72+i
	sZTCJBXWcIWh1CHzs3Oet5PyUI6OvHAJRERs5IXzk2CNXb/MnRoPcV0yuisZIDpIYCj5XfBgW3z
	SYxyPllDnfWMGikZkgxVMOSHolF3Nx+CG6ZohwFN8LH6y+OpYCdMLR8Qor3ZRJ2yW0DX+4EWAp1
	bArD9bgWDZtRxiFAVTL2s3QnN9Z19py2xUHaGq4zXTbSvsNofQYHGIkQ2iUzdcbHp4qEeU
X-Received: by 2002:a05:6830:4491:b0:7f4:eb7e:c8f7 with SMTP id 46e09a7af769-7f4f2365bb9mr33007715a34.5.1788281226907;
        Tue, 01 Sep 2026 09:47:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96ce0dsm11170515a34.13.2026.09.01.09.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:47:06 -0700 (PDT)
Message-ID: <a804f5af-6716-4f2d-a87c-ccdd4116c4ca@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:46:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/92] 6.1.187-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.482388899@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.482388899@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.187 release.
> There are 92 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.187-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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
