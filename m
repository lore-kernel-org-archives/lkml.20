Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7D441619
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407839; cv=none; b=hIJtkzLqkI9bJTh57gyvak6Zm2mkGIdjrRTfLekZNvqvYvGQ9BuuOo1v9Di5Zo5u9ODvH/t0EfpqYT+9jfQ3MAkLZUUqaqGpzAWth6arkGtTHOvuJQL1cCTWMz0E0215WfTlRvfeNixkEo1vaj89RugnMxeMcuIzjOiqu8Or0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407839; c=relaxed/simple;
	bh=8gcIc5zX6si5qsb6q2DxuxxIhhXy9/rwBO1dH9VLJV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB3WfqT+EMP5X6f0My4GECc0Ok05DMEx1kJH0IxYw44U3uSBtppsGbcY7+84OSP/aqYF3ozNh3KsYEyTyyRvNwKJw9gwP8Cun6HGUPf15RBHTdQ0tqikXqSMQRyGFnFLPNJ9qB2BMXwbRhx1CRAawKVWyh/Mbd0qO2sTdMGKbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7LNkvbj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7LNkvbj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd76b1361dso562475ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407829; x=1790012629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBKrvUeumU+i5r59LsbnvjiB+I7jzK030rNSwtlDdoI=;
        b=s7LNkvbjlM1WZODfDH1x461XwS7BeKHKwrqj7CM0BKifVJcCLNQe53rdvSK80VuuLs
         SUdY510Iml4USVxAV0LA98dnylYu6zGjfWfvk9/D95sC8gRLVgdG7PzjZmI5kBILAXwz
         4g8XwbCoLB6Duv/gCbK2mfTDb0uwNUOuMZ4xQD1bbcCdlDIB2ve1IDu8Nv5hmsaWepqj
         +3puSQd+cJeaSzyLb5iW4iPvy359PYVMoPw8QFg0qVK3yHf97HEhB66dPCL4T+Zuc1+2
         hamLrHjJtvtVkudyQl2FSQP6RzY53LRcrIm13MhhICSilAtgdeqNb0y+wnWpmCIAgws5
         SrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407829; x=1790012629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBKrvUeumU+i5r59LsbnvjiB+I7jzK030rNSwtlDdoI=;
        b=iqiLMjgknR9jhzdUPzT681JKprzdqhpr9YsAJEyHzPq7D6DQUFmwgFgeZ8O9OPMajW
         Qv8gH9TXeIgSKyXIQ6cjQDtJdaryi3suljrbbNXj9W8mGYvYsDhYs4m8xAiOKd4M2n9w
         At5Qm2oSV64LjE/EKBeIV6C4X6fbfHWgncvJjtIXcbQpWHIJRMNFLs83Mrg3Zz01Lj/G
         Q13YXRzJF2uCOPRKYoj2bfzg76WO9yLVZXCDXhW2t3CXbWhGslu7DO7H1Qph4Oi5c8y+
         F17Gc/geVCTwGQPiCTpZOSIDgdivFXwJrAJBNVXZBGyeTyeRHxqoqV/pUt7bbObaLIv0
         o/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWDQV5jAadiAtzR2SorfElVmo/JCQNMtKpopVeiXHHdBA0p6/gHzqNmaZp8GZEOYcSBV+yw5Md5HiHvWU=@vger.kernel.org
X-Gm-Message-State: AFuF++ni6ZKcDi6LPUDKFAlJcdJ3nBbTeFKK69RbQYheGQFJ14VuJcz/
	nfsFU8HGe9iD9Oih3pcukI4BLGIelpIjzZt7YFNVYpyyeNFQulPTuaFn
X-Gm-Gg: AYBFou08Bzsvr6HGTLV72EK5RnV8Bvkoi91pmeU9UUWoxpLnWNG7BWQ9twbMgQiV/+X
	zXiX1JHIQmHwlmek54n+H014yFFseXGFfQQVs2vQeyHkvpPWMaCzhoIj5Z1z4v31thLQXLIQNr9
	NqGXNh1kHbULKtViwlVlS4D+827LQXbMkRRJ7UZ8J7b2GjEOJ9PyACIy3VUPy16GpmJgrfRexeP
	0mZ8IdizdW5qfFARy3D6D3dfRiF1ZSpPMfuzehIFq0TyXSKAlKVU9xkPxjOG0/XLfGKtM3yNbPX
	y7XQ6srX+QuSKDkzTEI0bwnfmDEc+tXTGv6/bdrh7LnRj1Kg/qoJ6mJkcq+SxBAgpUBat0kPLwm
	pMQ37O4qTFYs/xzVaNkPM7VI5dJWd+zXWPPHb7c1RD1PIb1vm46Zr88s9PpmVaQrZpgBeVVx41x
	mBn+WG3tlN+iaUqsRK+5yuTY1MZxReLzEOG7+PXgzpLzfwuxyGlXDFOie9F1wpnD1OuUPw3yUWb
	JjTr8nJHPk7I6p4+nV7lgiZJps/8XOf8PP9
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr68629005ad.8.1789407829308;
        Mon, 14 Sep 2026 10:43:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3e2dab98sm46940725ad.28.2026.09.14.10.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:43:48 -0700 (PDT)
Message-ID: <80a9813f-13fd-4048-a479-5615105335e0@gmail.com>
Date: Mon, 14 Sep 2026 10:43:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/1424] 6.6.157-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065607.279695368@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065607.279695368@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:40, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.157 release.
> There are 1424 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.157-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Same perf build issue on arm/arm64/mips with:

util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c:14:10: fatal error: 
linux/unaligned.h: No such file or directory
  #include <linux/unaligned.h>
           ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[7]: *** 
[/local/users/fainelli/buildroot/output/stbgcc-8.3-2.0/bmips/build/linux-custom/tools/build/Makefile.build:98: 
/local/users/fainelli/buildroot/output/stbgcc-8.3-2.0/bmips/build/linux-custom/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.o] 
Error 1
make[6]: *** 
[/local/users/fainelli/buildroot/output/stbgcc-8.3-2.0/bmips/build/linux-custom/tools/build/Makefile.build:154: 
hisi-ptt-decoder] Error 2
make[6]: *** Waiting for unfinished jobs....

-- 
Florian
