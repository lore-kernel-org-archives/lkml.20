Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04B36BCED
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822345; cv=none; b=S4mZk7eeIvyMNlEX5A0ZPgNDbAKpTsoGdRE4NHXal5zW2tdlpsXeElHW82bSlJ7W+9h4NXc8751Zqf0VSeGAVOAWyXq9cduXttkQEMXiW1UA7PToQ3ulyBri5WgXMjj09+LMQ1vcoI/SIITIJv0tojr6o2zQ0OTc6P/agbcjYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822345; c=relaxed/simple;
	bh=HibY2yVbJXZTc6DBlwdMDBsFHqSRLxYPMVNLoQ1p3wc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p/4gLNNFCcLdUuZbxGI3w4ffw6FrgaKglRHc30S8sb/reR/Vm4Re7ceCHBDizSzW5CJ7kLAotl5i4myfYyCFRB+xH0v6I8n4MIoL8DbjavqgyrDMNKQ6GSCcggeD5yLJYpXtYmxIIz33rzzJ/v2jvExmLJVsV+PI9K2px8pVqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUqcBjtF; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUqcBjtF"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso2944009eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790822343; x=1791427143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=EUqcBjtFMW2uQXwjhQFuvXhuriBq4K8NEP+UBrMQrdX8U4xku8812n+V8uaio3Dpkt
         wq/WbZ/awAGDjotCcnMidglbTdcIeLM3xWP8gy4xIVD/+eh+GmkBb/yrWmxxmpHPQdu7
         33mnhZPr8xyYu9AZVS5IlXRRKl6nH3sRhHZ/xfgGlUpFtozypwIdDP8lH/N4C2LzLK++
         FMeLWmLJafvm2DC63dcnktfVyYXns6DQThXtxzyQbR12Mh8Yr8IGhSIdNOgGhYHinPY7
         Lh2SvDLSXMI1i2vRa1GVqHZAQVXEpDfE2cuzN/bGNzJimVo5bTLWIbI7j4QEEr1CEpZM
         +vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822343; x=1791427143;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=gDYFibEB/KB9ltdVFRRf7yYNnNjLgg2+52t4gBU4jcM9bqLjRGvZu+tEk9OTip4W5x
         Cum/KV1n0T1bh/PNxaqrKU1Yx49Pfj8rd3i+0wTWm9qBJVoTYPrW4zI24GPQmJSBm8bb
         zteOr13EJLdrUkkcCK2viTLb99psSKphadMcNoLOq4NPyKyxUsTY/Nv+foe8Wbj3vtqo
         0xcgjHmNteN2mDfMgLXt2mp+gNyXtkI8rm3pq+nepUzPupFqW4lRyVodY+qstXz3MuyZ
         NwtqaVg9vxwSzJrr+MfX4OExLqagFRljpYPQPn/n1qkqO2FDmCEjZxicMWaX4sqcB8ld
         WSuA==
X-Forwarded-Encrypted: i=1; AKwUvBxMCKaa/AhcdSJ90nBvBzp+ZxcTgIiTvmQ8UVBeIrMkFbBz+/O0Y+tVyU1+TfiPTRhBysUlM0BPmeOjfMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYII45MtXVRuIVAf5w/HFsXZ74VtCS6P+djq5aKEJqkCgKKvcqw8
	pDvMg/DfsHJ7w/D+0pN5Pin2BX+jye5Svn6tXwd4W3/C4Mf7+gYaFDXj
X-Gm-Gg: AYBFou2E2fMrmYmxCeDfIF4AxdyZd2HHzbhjU0tmLkL+OqbUn7sXtWsSnC2VBRFo84J
	ZlxDThY9d6Q0ejjXiVHQBXLkl0Ev9qyZ6Q7+zAUSPOa08FvlZYdM3bynEYMCdqfded4SnrNgkr8
	7qNZO+Jp1Gkew6VbcxDPAbzKwNxhKRC+GH8zqSIoyvFyp9DDvgevTk8wqiqHSRc2hGFzaawZPjs
	Fj9cq3GKEhPhhkvO8slxvI5tBB2Z1h8RClrlDs9GlccN91iwEfPQWwHRozeaXNOYDs1I0nAYm1M
	fwCXH014DaZKQV7tE+33ozudZ8kI4JB71UcTU1cQR2KKDMuI9HnCMjS6MOEl1+yQfUXZyfz3uz4
	avapyjaCyfZHfIYibkEGQnF97RTuPFheO3Zh6mhAS1R6O9hE7VAVWg8sqk2fLriPN0nT5mews+C
	2/jWqfJe8PNix4NHUZa8Tas61PWZSOZPowB4cP/Fk+vrP9zmxCD8dSpNCh79QOeCMLAZJDQvIJF
	BF6B0YVZTYC+aPeEd7ZFizUAROyL1a95imbaMhtjcpdGSP2IfpN
X-Received: by 2002:a05:7301:468f:b0:346:7bfd:8504 with SMTP id 5a478bee46e88-34cdd98c9d9mr3520723eec.41.1790822342788;
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Received: from [192.168.68.59] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4c1ca89sm2351755eec.27.2026.09.30.19.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Message-ID: <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
Date: Wed, 30 Sep 2026 19:39:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom/qcom-msm8960-samsung-expressatt: SSH over USB
 no longer works
From: Rudraksha Gupta <guptarud@gmail.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Language: en-US
In-Reply-To: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 03:43, Rudraksha Gupta wrote:
> Hi all,
>
>
> I can no longer SSH in via USB. Reverting 
> dd0c03d685225cb8fc60c477417d1b9c3b05ba9d fixes the issue.
>
> Please see below on logs that I captured over UART (v7.3.0-rc5) and 
> USB (v7.3.0-rc5 + revert).
>
> Distro is Nura (formerly postmarketOS). Using head of 
> pmbootstrap/pmaports. Instructions for this device:
> https://wiki.nura.eco/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt) 
>
>
>
> Thanks,
> Rudraksha
>
>
> #regzbot introduced: dd0c03d68522


Hello all,


I have identified the culprit:

> CONFIG_USB_OTG_FSM=y

If (v7.3.0-rc5 + revert), then regardless of CONFIG_USB_OTG_FSM, SSH 
over USB works.

If (v7.3.0-rc5), then CONFIG_USB_OTG_FSM cannot be set to y. It must be 
not set.


Thanks,

Rudraksha

