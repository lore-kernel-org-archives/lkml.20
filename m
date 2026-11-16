Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871017;
	b=pfBQnx7PgVbJZ1fxaXykeollMipcOmzlwRPinK9J13OJPTU08tL8DNDQDPWJScp69VZ0
	 hy8LsRIldDuZfB/bJGSpeb5qNSGATXGe6TNn0AyiicnCUPVOPWr8ONTIdG0T0eOLMDbW2
	 LOMmdI2eyN9PX9t3C5e/D18FH5awwhbzJfiLQS07HeZE0CU5Lga2DNZLlBeuqYcykxG7/
	 Bh7mVFlIVMEvhIbBvf0IOnsVOWEacM/RacIWVnQxmZsugGbbx82nrRMKa7IJTXfDTOeRu
	 Z1rai52Tfn2Uk7HE2S4cesqta0mbeLrMyCq6gCvNSLOp0DBNcI9JjF1czB++++DJiMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
	b=1xU6ddyMFw6rOgjLzj0prodvlsfeTsOBMMwrfsbJxAGUImQ/f3yLa8j6QUA7aMw7cIn+
	 3dph3iwSOmy2g7FluLFhRdbftnf94d6uqQb2gr6ci+TVz6WErx8ZpGmSbslyPXEj4iWT5
	 kxevDrvA1WiCeEizNDZv8wPs7MI5Wnu+tD0tKXHVEp7V3Pw9zutJPIo97EZFGhgRuQTpE
	 UaYDQE35luljpeiShan6hkwSd3nYbeQgSxz1FYL5oUYoo35SKEc4vGuxMCFer9+CwZEhz
	 p+fC/nUTjaIfkakQRQ0jfEpg/R9p1MXtvNDkJfF26aEa6BxZs3YDy649nFlyafqYI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T5J4AAVI;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B147606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B147606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T5J4AAVI
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso311947fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794871016; x=1795475816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
        b=T5J4AAVIcWVT8mpCdn45DanP2QzcOj7RDXZc0YQPkwV7XUWICfE2gWG3vk+OQgLEAn
         gjmGnj0rEWVy1mXDgmohD5MtLcOJQ9pXjKbGLw1R4rCVUJuP0A4wPS9vJX0eFAdGWBJL
         jiIeQIhFL4z0AMgTQ4H5it1u3nSf4xmTXIpMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871016; x=1795475816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
        b=XbDnuOaa0NLrHk5k14QT8C8sXmGH/3v1ngDXt/0nXKWXLaVNWIiRWdXF9mAC8MSVPh
         YdcZivSauejOW02RHMGHxPFToffQfxODaUvIXs+FlI01+IlKq+nc0yli+2Bb2SCFi1Us
         eLNkcykbiHEtYbkmuq3hRmw2x5zxMDkaYNEBftmA9VFleBHQF2aXLaUWX/z6H/Yge2m0
         seomNToNmMXV0Qx+869qDNJ5YZ8fFaud1/wpahCk+AupS0n7mxjwa2C+h0v501BiWs3v
         xUniuB7HzhBODws1YPIRbCrj/OPYryuUoz/llSWEqDjdMA3e38OJf/5sLoR+TYifpRB/
         6pmA==
X-Forwarded-Encrypted: i=1; AL+hErGQrjg0Y0f78lYgv52qXRAnmmEsvTXvYsOKDWBcwVxuTHaG7Ml9Dt0J2yHpoAYMCLm/7657AaH51Windbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kl756XQWl5XQs6RVRpVj0mPAref8wApLGLbs4eeLc6C3B9lzA
	VG1z4Cc6ugpmWVaBmzjz7Yuw3HjyqdO1doB4rtUwvAAQdNAVPXkkI7SC1RMeWMEvF10=
X-Gm-Gg: AYBFou2wp6T0B3KmCUF6F7rJSG66O/gAqOjnciuzrWJRZiUa0hhOV481CfmVnUaoHKY
	JgTCThYRiObJkdzSm69Iy5MxYSgZT0lN4jaWdJJCGW9bbt6dVtU6n3LJpEYGzImWoS7BVsmxL6g
	cie3qeOZCbw8VFfJvi/BeRSQTLmmWBPCsmNitm2R0HfMxjudJfU6vGeAQBAFbSqPSaILf9eMR4l
	Z5UfjPsXjjQhn2afv9wkDNoxkSVS12Xjt12EasKqrNB8oSl5avn75U3p0Z+B2JAmiDZT9ljjZD7
	HQZkzyTNxgyNMUoUAhKtzffabJwButkmS6JwqU4u+/xv0iNG93TC3Bt3f0eD2GKK/giclD8MuOq
	juVzRRjLCdo/QNXZWWIOeI45iaKtIgvNhJUbgqpO1yvbf2bKnFQA2QDEYl505sQxPQoQey17WX6
	j8ipm1R42eKGf6AE1YncmP2ow+Sda5Vf6+zjl5ViEjcomPF3CxEcru9bfnBjCJBVXZe+JIuTNfI
	AQUBkD6WE6rSfhnOfzALyBu3x61ogmYDgfIZ8RR4Npye0BNLYb2j0+K6n9O2aghQEfxUIcszJn3
	fs4C9uYbKglZQ5tWhp4JFP2waZp4wKRvr4hyRLTuXEk8rSOq3zDx4h/jTVU=
X-Received: by 2002:a05:6870:8926:b0:4a2:4864:4ead with SMTP id 586e51a60fabf-4b4118f4569mr822025fac.15.1794871016004;
        Mon, 16 Nov 2026 15:16:56 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe1c7ba35sm8000666fac.0.2026.11.16.15.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:16:55 -0800 (PST)
Message-ID: <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
Date: Mon, 16 Nov 2026 16:16:52 -0700
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: John Ernberg <john.ernberg@actia.se>,
 Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
 <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 04:34, John Ernberg wrote:
> Hi Shuah,
> 
> On 12/11/2026 23:46, Shuah Khan wrote:
>> On 11/11/26 04:34, Michael Grzeschik wrote:
>>> While using usbip on kirkwood embedded machine, I came accross
>>> some stability issues. This series is addressing the reference counting
>>> on and usage of the event handler itself.
>>
>> Tell me more about the stability issues? What doesn't work
>> without these patches? Do you have reproducers for these
>> problems?
>>
> 
> Since we also had the issue that 2/2 solves: The issue we have is that we see occasional CI failures with ghost USB devices remaining on the client side after our system (server side) had been suspended, even if the device was removed from the server.
> 
> Applying a patch 2/2 (or our version of it sent earlier) solved the issue.

Hi John,

Can you send Tested-by for the 2/2 - did you also test patch 1/2?

thanks,
-- Shuah
