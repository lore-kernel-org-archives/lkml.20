Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D949442B23
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774649; cv=none; b=AsrLugtq8bPVqmNvPm1IPEgXcRRU472byJEy0tCZchSW3+QDdZfLmBaknLL88VwQJZIy63hwqqr9hjJBsUrHEkfI/ErSFJL2/X7rLNqgY1O3Grmcuf5f1lBTc3wDo0YMwXDLzaXmhFJM1GEgAphWLTsrwmQVvBjMR7+V21dtmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774649; c=relaxed/simple;
	bh=q1vbWVYZfrrPPpMgx2AV24vWcv0xH2e65F7GQzJtG90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Za5jKxp3pBrpStEPVEa6zsav2J/RnUyyVXsppEIdxSlLH9nIur6S8gyw002M63BImsHzYlRZC0JPLcPWVlV65OJkpB9Q9ppXIB1fdKDDH3QTfQR9QvSu7j0Ti/h74BK72kQLFL70dnQuuqXpPakecqLYJGxiRo1MnQ8pheVtbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M5ZCkBe0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M5ZCkBe0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1728650f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788774643; x=1789379443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb18HKgR/gRWdLmmzTs+5hKvWsiCHq7F1zLseYYFjf8=;
        b=M5ZCkBe0qY4Z0O/QQzvNMUKVIXcH6wv0+nvIeiAKOFKc/QGURoG9U1KFDc8NXZkbgG
         iqwN6IG+U8C54EMszpWtvZLkCiukA1HJ60+EwKslM5Lo3F/wZokyDpAqy9AFLdombz0l
         dRYIVfVf+hygi1SUnck4u50HlCx2xrhmgQcBnYu40ZkF8ZTBx5qB0b3mv+nqmqOZ5UlR
         nLFTdezqgzh/heqYTsekxmw7Zuh7YpU3dXYrgoXEPKvSeMOxE7dRWopWdTjYF8cTID16
         9W+KDPPNdEdSrUg8aqX/Qav733VUyd5Om2Ts7kAM0vWX2kRggesZWvSzhXYwyU6OpzMM
         wjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774643; x=1789379443;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lb18HKgR/gRWdLmmzTs+5hKvWsiCHq7F1zLseYYFjf8=;
        b=tDiejEHV3UKT/7lMgvtsfGhXUwX8M1bKS2X3B4LdjfdIL+6QMCzdvsye57FDG7cfvq
         JXZXOQZ2cjxk7VLukMyJxpZogV4/dgOYhgpTVRTEDjquvLy+LeK9KDfg3ayNgvt9lNs3
         z+TQnjIGzID64SBJN2CGS5+iVXHZDhOOKoQ5ZgYdbQR8SfSJ7nmkFkFzz+zbzbPzbGHx
         z2Zc8hr0Y/SKlHPChxC6Jsy+QgtQtJ4jZw/8XnMqaOmt6IcYi1ZdHyfunUskCuC8Bf9k
         CUt3V5D0v/3Wr6rSYhut5wl3RyCTB+qt/ST8GI8rKquTcmFOLwuGEAnwr1TGJeS2KdN7
         Q60g==
X-Forwarded-Encrypted: i=1; AKwUvBz5qKsTE/cTURHuRSXHqeFdCPVlwhxqB7VXPzXBh/vSSzcXBJw/5QudXfg5V8a1Nr9IN3ybvbSCfyAIlvc=@vger.kernel.org
X-Gm-Message-State: AFuF++kVaI35CQA2G+2Dim1eOwCXWRaDkSDl9qkoeS3utjtxHS9oUOVZ
	40PYeAExp+QfXdMNBy+GqJ34RTW8qXsQIQ3OsB9W6C9jdKedX8nWr6NIlszRLdAFJu0=
X-Gm-Gg: AYBFou10z7ezhrNjf3PKsyjUMYI5TwBtv95kKIxzKAkoTlR3EVeT9I/SztzQ6Zg+Vyc
	QTCcyPRcesEMs1b51YzweSINdA8oMyCZJRpLAZb2qknopHTBArvMdst+f4tl51eXLj3xTcaT7Wo
	s8cjt6HZBNd+abyxq8cC8ZE470IQHJCyBzk5l1YB3l28JFDi6YQhD3+IBJJxV5/zX6lbWWzNCnS
	nxvgBZye9iG0O8h9DqcQsCmTiWNOcq59aWmq8ojySaXS3i503FBdZXNA17xlRYJkRjsZMiL33sQ
	44YP2m7Juf9fSOWCZuxrn2GQkvnQ97KC7N7rwo1TK39YIbRoDGhKsf5u66i18E8/di3NVKPc33E
	5H2KTXboPJoEgoUCpLYeX2Mg/uwq4O7EdM4ukEtwTVq7fjttNgUFjUV0CbotXj6Y9J3j7wjSjX0
	SA5Zr0SzSPO/DMkzWViG2Pw3IE9w/5gwdgRoGeHvy+9A2icNims9B5zieCGzzEhEjD+X7aHAYP2
	xyC54tKhxubktqneMw1RgwO3NQ=
X-Received: by 2002:a05:6000:470a:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-4858707f262mr23189860f8f.1.1788774642756;
        Mon, 07 Sep 2026 02:50:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm20770188f8f.5.2026.09.07.02.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:50:42 -0700 (PDT)
Message-ID: <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
Date: Mon, 7 Sep 2026 11:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap56NTVMq8GlbjmR@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 10:47, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 10:17:38AM +0200, Oliver Neukum wrote:
>> On 07.09.26 08:55, Johan Hovold wrote:
>>> The wakeup condition needs to be checked after adding the task to the
>>> waitqueue and updating the task state to avoid missing a racing modem
>>> status update or disconnect.
>>
>> I am sorry, but in this case I have to ask:
>> Isn't TIOCMIWAIT inherently racy against the hardware?
> 
> What do you mean?

The interface does not state from or to which state it changed.
Now you could say that it is implicitly the last time TIOCMGET
was called, but that is

1. not clearly stated
2. not enforceable
  
> Looking at the implementation again now, it seems further changes are
> needed to fix the implementation, though. The completion handler should
> not be updating old_count. That's for each TIOCMIWAIT to do.

I am sorry to be obnoxious about that, but I am afraid that would
break TIOCGICOUNT

	Regards
		Oliver

