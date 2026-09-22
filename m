Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C024E0B8B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071659; cv=none; b=RZNVJvSKJqAG4WQhqw9rGIJzeGl1m0dX70XVWf4wd9dvV6tbmYpiPuoelm4OOtVM3yd2Q5C2pkZ54tmoggYiw29LOqDLfOri5XsMB9GLcheyNUizZRjzpBODh0r2Ff3gVMFrxeNoFcSubNRpIjXnvGmXfBZj1P6ubbODKBtRI/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071659; c=relaxed/simple;
	bh=e/QbGjIvokxqCfY0OdfhXUChmkjkDlvhD/a0sn0aZeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLAEeLEgkL68lVyfmCBsGEgj8KFJ2DOQFUlVbr8VWMXNu/i0f8Te/QiUCrEOReC1NcHpTJVrMEv4nnRNkVWTmmULrK1sLmGcmDUd0rG0xoyDqV939/NDcjua2K7jUYuH7Wx8T9M73ZzxotDsMTMZTjM9tn/wWXnnS2rk1lDPf3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4E02mir; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4E02mir"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso5351814a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790071654; x=1790676454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M21NvE6hEk+bHsAyKs+VPRDnarAHkFKIx7tvnOO3mWc=;
        b=Q4E02mirdAFsGxsUn8GNzLsAM6KQFisiieM/GzZeyWlPaRUlF7hx/xx5bvxG2oxT9m
         IzG8gpIIGSAgVIew5LAFmIKMXzEZQ5RYLCeeyw2ayIaiyNGR1hMC0yKS+lovk1bgy/Vn
         r7MCTwZf1p1vdR54p0Un1lDhwdzZN1MmhxeXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071654; x=1790676454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M21NvE6hEk+bHsAyKs+VPRDnarAHkFKIx7tvnOO3mWc=;
        b=VVAFiVUqeVnMK/GXa9BQVCl6f2H8CcQ5U/Ar+us6nbIrPY4FjEHp5xcgJAa04q5vCO
         kO7mmKjzYu0OIxWNZ5ek/5jI6SkmHArzr8WCfgG2mMliWL4ioqshkXWP8+SidqEGX2aJ
         rp/BkGqi4ozgzbxLCCzPU6fiU1rwWWtiD5d/KE9XOtxukedfV70QuTqtmpQ3as2CShPR
         qRp7CkFSw2K+k5w5Y1wji+4tkiBdUgC3QFMlgpFZ+kkXZJEltnqqabk4Kbn+dgg1U4GB
         U99H6ilWjt8wgFhMzW+jvC7Z8dS6D+k9jN+/b0RPTBXIeyYDyPFJnlm6x5xXS3mTTr1s
         pVdg==
X-Forwarded-Encrypted: i=1; AKwUvByM/PL8DjV4yIlhGh05o/N6hraMozvleXbIQ1H2R00IHAEXyWB09zxCkO33lGmxXwTPSdef7hcmdcZa5sI=@vger.kernel.org
X-Gm-Message-State: AFuF++mHl4SuWTFCzEwfZLiDTrrt4xx/D4guZ1FyQ6qD0u7KJ7CzqpS8
	5s2oPu/IK4PM7IbYx30JXpK4V7agXVmEZhH1qiZcsGQzF6MOKtmarFdr/G0wjV1Jedw=
X-Gm-Gg: AYBFou3Bwv5PZbRJAJrIwx67NIQHgcDlwSDnHu8chu7btovrpbC0yMD3W2hLDCPpkT4
	MopWhQwj/VpLfa0/JZLGwNWv+t4Ss1GuI8NrYCTlgCHe14+8EW0uHt46IBI0c4y2HqZMG7ZlkH9
	fQVSjOHkFp0RkvbcA0hdXb3KOHDYskswtBV87RMoclQBKF5inKXqJg3oL7S+Zlw/V0Xde1oeGVR
	0digyUBhLPXWPG+WoXCQvk1+kK5SChAVfQCLba76bmJcm84tC4c2/iA4evzIvRO9SNa7meqPUw1
	YpjXR6K/Rb6VWnqz32dAGnTYeRZ7m+Un2F1X4XivuO8Wxc9RBaZxEKiGqvCYgKStQ/2Kr6Ww8VA
	oAHCM7UY9sP9pgCb28JRiByRP83cK07mD9cxQ3IAORAtChyAT7P+zPCE5hHhnEMp2WQynz1NrSq
	GDCir1D7WcW4aJVz7dP5BX+k4HwtDCDFcdiQMfJGVNxr4VcE+6MLs1o5ZQ742xgCDsLQMIS/4ZI
	ab89rGnMFw=
X-Received: by 2002:a05:6402:e03:b0:6aa:4529:4cba with SMTP id 4fb4d7f45d1cf-6aa545f7e04mr11215471a12.7.1790071654290;
        Tue, 22 Sep 2026 03:07:34 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440dd61sm774693a12.2.2026.09.22.03.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:07:32 -0700 (PDT)
Message-ID: <2f14b623-7490-48e5-a509-d605a04930d1@linuxfoundation.org>
Date: Tue, 22 Sep 2026 04:07:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: add NULL check for calloc in do_standalone_mode
To: longlong yan <yanlonglong@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260817061514.765-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260817061514.765-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 00:15, longlong yan wrote:
> Add a NULL check for the return value of calloc() in
> do_standalone_mode(). If calloc() fails and returns NULL, the
> subsequent access to fds[i].fd would cause a NULL pointer
> dereference.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/src/usbipd.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..dbc2b48363b2 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -544,6 +544,11 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>   	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
>   
>   	fds = calloc(nsockfd, sizeof(struct pollfd));
> +	if (!fds) {
> +		err("calloc for pollfd");
> +		usbip_driver_close(driver);
> +		return -1;
> +	}
>   	for (i = 0; i < nsockfd; i++) {
>   		fds[i].fd = sockfdlist[i];
>   		fds[i].events = POLLIN;

It is theoretically possible for calloc() to fail, however how often
does it fail and were you able to make this allocation to fail?

If not, how did you test this patch? In any case, I am not going to
take this patch and all the other patches you sent adding checks to
calloc() calls in other places in usbip tool.

thanks,
-- Shuah
