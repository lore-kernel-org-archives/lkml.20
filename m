Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDC493D37
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406028; cv=none; b=n5ZEDqrB51NQZkI9K6rd9DIqiJuO+b/rs6Nf/eM59lYeaFa2G7mGIc0jvY973sJZLsspP8pdS4RyXeABeahXLNrAHdWfxJTXim+mLGe7pERVu5unS11Wcwlzo6nbw/0ONwHSP8v9JnPmb1hzKvAjjy5ZLyqIJri1n8EhZKW5lss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406028; c=relaxed/simple;
	bh=uLTJwvuhHJuRdXlB1C8pmGPIC2/l0e58nI7GsoLCsMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJImzMT7vr7DhYZ3ZjuNgkQ5FQlrE6qEe8muH3RtX5HpojEtUDZEt7sTpm6eJA9P3kfof8sMTC+x78qmTXfTlDqgLrf9POBaLPdfllqAa2WOwu8eQXurX6rFZPd/Xf1Bnmo2Mu6hPug/SLdl01kEwsghqlLeMZtVwXOGdo4w9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nc84pUQX; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nc84pUQX"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-861a2ae9c51so32136387b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406026; x=1790010826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovEgINGmapqd39G2xDwqgD2EjPG8Mps/2I0DRD6EygU=;
        b=Nc84pUQXTCBvmG8TuYlKy9cP9R5q8sMN+ygEmfqCIw/5F4Dvc709PTAofOPxe+rRFx
         IZcylKrOoPm4Szlc8GwV/3sp++oiTgwH98v2jy+VOKf1dIR1WIDSxYx3zIWHQUZfLR1r
         SnnfE7IDp4DQltVebKfQGchmacxRPpVLttlXZvnxxIMOphJhIKpLi78p2L2e6BErfGT7
         tjwXpabW0kpr5moKngjSow6kWYeRWMD6eMnneyAjo3wjjmbRCraclqfonuFz899uUCJr
         WaGeLyQoCMkSX3priKG+VejsHg5d8OfTrvHPqV+JfMEt/kalBCyd4hutRcaLnzwW/zDp
         jEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789406026; x=1790010826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovEgINGmapqd39G2xDwqgD2EjPG8Mps/2I0DRD6EygU=;
        b=Gs4MvFMlkCloRQbBA0+oX2xOqaXawJC3EMOZrixbu8I20OYdDLVtFtWN5MXg4R3v5P
         RADmRQL1zaKl3NwIzOfaA3bQ9vEA6SXLNF4EgGGKVc3GHRnC3lNr3Ad1/SwtG81/8wGE
         AMs14Uzr5VpcY0AZtHWtAcJzo35Zeu6SsSbgc417zMMTa/TMJI+1SJO1HJXgty6FfHFG
         RCd2EfO+hoTX0gi/aYYvpZUiuGGw0bMw7SzRuCEhblPb+GJrQXTjecq95dhfk3fR9K7V
         bCEsdOdctmBwHiSb5wRh8oGaWQKQ+7as3EehzO5n1Rd8tdecGHLQngIHLizINoRPIySN
         pP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8KWmmV3cYOoKqqRnKctXpnFjGjMsJMf4XX9fR85sU1aT7AcnZTB8RD31fY8qshyNf675K7yP0iQLRLGU=@vger.kernel.org
X-Gm-Message-State: AFuF++liu9PA+SxijP2j8lAM+SdDxr0VJgjYmQGrWt5wBoKebo4kks0y
	Ec2GGZBITaFfGld/ujYvt7iK4pG8zxAXGrfrptWP56/T0U+GDzm6gnct
X-Gm-Gg: AYBFou33IjFwyrYp1r1Xxa0EUQ4os6fH+T47iucirS3Sh9PciNDsEwkEHw3XmI673E5
	XWXKfq3IV3TCMVrVpcDO/y78Sr/ivi6HYsZwH0c25jgyydZIggN8TSDFctispmn3olrBTMeVx84
	O6mrdasHXkx+mIMXJsKh51GvKufGQJuo3atSOB8jCAL3QwwxIyR83KUsiw09xQbvjFGfzKoqyAV
	TPDOX7m0xW6MOqof1n+aWoOLB0p75yJZDHZvRR8FczGBqpiwpQe/HzdjqhUzWsr2R5EzeaeSNA3
	2HxQqgw5Kx/SC9GaOb6cyeF5ie57MODZOcnD+GAEiOX5L/ssJhx0pb4xJ0ViEXmuNDokbcgONuc
	Q+kcxYxhsHI4IP9OlsvQA8yc5rcxp5PpGCj/7+tOCNmmqAmZCeSlvlN6GZHcn7PdbdwCQeIKCBZ
	zY0ItFYVEAuwDLwjuLKPxMuHn0WL6Ml9nz1k3VFs6FEx/HzlQi3qKAG5orBeWGDv8h33W9m5oCO
	fQgJE3ebqASLJJfT8XJYlwz+A==
X-Received: by 2002:a05:690c:12:b0:873:5bb2:6c23 with SMTP id 00721157ae682-88d22ece335mr12117147b3.42.1789406025821;
        Mon, 14 Sep 2026 10:13:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8847db4476bsm39563067b3.5.2026.09.14.10.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:13:44 -0700 (PDT)
Message-ID: <72168bd0-27ce-4bf7-82a1-0d1719ddc15f@gmail.com>
Date: Mon, 14 Sep 2026 10:13:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10 000/798] 5.10.270-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065516.948645775@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065516.948645775@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:53, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.270 release.
> There are 798 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.270-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
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
