Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293007;
	b=GATC5BRXej6juEdNndEfguvd6XTRi6ZB5IQbMf+vIc5VujX4d0Z/Qtw68pe+m968MC/F
	 ZoeTCg1WSUJJ6hEACQAHlYMCHvL+8W/iVxW/bdupNNjrnmrr0k6PENl6kiCVHun50SrI8
	 yCe8wdumzxIf48xlncQhitNLStnlhy7O2H8+CkwDRV8Zkik4bS5aDHqhrHd+nkMLaRj65
	 SDbLMOtl9M2kEsC8NlZAPWnW/EryItBHSJtr0ZIM+cKoFr5DSLBPC+V2mrdKczJSR2njQ
	 Mt772QfTX2+hGci/B24eq2CveZCVdcj4PnFliq15hTrdqn7v8roBOG6Dv7MCQjxDf3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WWvawn1VUbfsdNDOyAeUMwlpIb5qvBLu/P7NpzoOW3w=;
	b=Cwb1q8Gccz0w26KoF4mKZj0Vp60HMnMOJEWPnIlxo7AmOxbdqaBjE5WHM85WFbbBfBPt
	 QtJR9z3/yHvsug1oPBw+droqMREQi/GIgUKox50lMD8XnF47dwi6r8xuPP3IzqhliHpC0
	 Ej5tKEOZTuK7yaqpOXtIPYbTH3rCFgpfxy+Ar3+Y9fjNaJiUlAAX4muqB5B9n9xo4ZCj0
	 P9jLXAt46xzCT6m8J72j+lSa1H3Izpm1/zxTF+qKB+7WjB0CJXbLSuoT+P92fgMP/WH+M
	 UWJ3J4FRmJcef6ryd3vPA4Pcx7iU89VuSxlHMBUicqMAhpAyh4hbaXtvTi9IkaplPSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2kmdhM2;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC99D606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC99D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2kmdhM2
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso15774135ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293006; x=1793897806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWvawn1VUbfsdNDOyAeUMwlpIb5qvBLu/P7NpzoOW3w=;
        b=A2kmdhM2exKNnvyAFa2M6blRrTjpiTL5CQR1Bg6lJMTZfYTIhn+APCFDkU55Q14HXO
         xs8Agxc6oD01+dFPI2ZbWfXL356FzDVJDA+bCR0X/EXIFEmFchaCPSoOtq4WRRvlFt5f
         QARHIyjpAx+mqYGToD/TtwgAukt+OEi5CxRaYTfhSttLwsB76eYyxGQiAL/5Fb3mRzga
         fIJAk4FXQ1VCHLP2x6bejZipvWurroHiEUxWCFbsNxdy9kppOSPKgBGovXwAGMUYfKhk
         DAMjJPhEUCn9d/gvputZnNFIf9UGMkMtxUu18x+DfTf2ehm+ZJdGEn9Y8uXS+/R3zVRO
         olCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293006; x=1793897806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWvawn1VUbfsdNDOyAeUMwlpIb5qvBLu/P7NpzoOW3w=;
        b=Qo0rYj8D1Ionro3itBtx6csCyLpZa5USPcnzQvZnMiaCLasrrGF5t+6jOv4v4zDvLC
         nDHn3u4mRoyAoonQoaxjmh/5BmInSy3j/HBiUsppMNzqeOn3MOD/jko1HYaUe0prK9ET
         DzmZgmYirqMgXxEDeIca4sm/u+z36m2zRQi6XV8Fv0yE4skzGH90Xd07QnHmuTu8GUot
         25XM0WV86wFYQ02WpgJhBmkTsq8DEs1DYu6hQj+E8F+P+hci0/i1eB6ppprUT6P2XEcJ
         tUwgTBUni1x8IKb1UJxhXPolAij+knbX5TQYT5VhTfdOz8grPh+zeowT1vvRbvULcFbE
         5ADg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7OwoQFBiyFwxm+7XuyJBev3pwKM+5d2Nf34kr6/heBNXlU5/0nsJuzlolgsTCLV9b6oU/2HKG7OEIVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgmMXZwiNBwVTOlVy95T/DXb2AkxOg99IVNA8syltIjg4ziiGA
	FRS5v6hQtaGeFmXqe7FDmv+k3IiKdIw4XNrLzueJMOu9IWmDQMwgk+F5
X-Gm-Gg: AYBFou1mu/HAZbLs8F/gRnoFYey6Zsx+gCTMOOSmgkFDiYxQHYWWRGXnOI/ok6l2o2e
	pveoZgkZO7xgQbwanfo/C1v6g1M2M95tjCgfQ0Qsakq1gu0Ut2OX5vWJqI9rqZjCUbG0rUvVpuM
	+sg1jbzl7DfLfz/qzeWoz4GjKZwqLBT+SRs1pZg1+ychCcrDC2nehkR6OD7lU2vo5guXkzFtzyM
	MBw1lx2tYRK3rJPesLXkEPcpCHEdhUutjeD6jjyi+8r2KZ7HSPum+Z8+Y+/2zVFPxUyWgZ5nD5+
	RveQoVbGxDK9/3zFA9L7zqqGIzMYv1cVtVVtUrikYgMXnzMS9cp1NpQcpCQaIAnhbfogF1fBkT+
	nVue5TBiehWKZH/UAIfMQQPV/1Em34Dd5a3KsehU2YdyPgPVrt+/55nvxOPVeBxUZWMI8ZhNHpw
	8x7NfxNNQiho+0YsU/jNfNTw8d5EkyDzSc96j0aOhgrlCdFlJi1XxQbe6aBACzxirJUwyETDEkf
	zo9ZQmcsHFz7SGKjaaMCTYJ2hfzZIahqhfNmzCzh//aZ341+0Ch4dFGNbkmV+Z2ZjRhf1OmFD92
	AYPR6JAMdN//wSiIg502EJfhM4TKbcK5Gy46kfbj/gs340dD8fbBu3/gMc2XhGkXEMz2YRoSZi0
	51g==
X-Received: by 2002:a17:902:f54a:b0:2ea:9c9f:b24c with SMTP id d9443c01a7336-2eb0036c512mr50551235ad.23.1793293006075;
        Thu, 29 Oct 2026 09:56:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3630293esm91935ad.29.2026.10.29.09.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:56:45 -0700 (PDT)
Message-ID: <ed8f6758-7fa4-4d6c-918d-160bd97f86b3@gmail.com>
Date: Thu, 29 Oct 2026 09:56:39 -0700
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
Subject: Re: [PATCH 7.2 00/88] 7.2.14-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028165942.107695352@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028165942.107695352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.14 release.
> There are 88 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.14-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
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
