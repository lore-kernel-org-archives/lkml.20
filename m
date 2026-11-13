Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606107;
	b=YueQFIhLXe4BYgk07vHcOTYjxi2JPKMPaZFUg8HPVNj+K4rK8FUGA7zZ6zTNbrP37/jm
	 pH0aql3qiL2SmpGEGu8pAiMjks0XD6WcIhLWPKVUXVv6ptTyogHvQStTt6AJuzRIeMvg8
	 fzNwLdzz5nxY8sSr23WlSIYhJvlSY9znd0S7VFN+5Y20sQhwPFvk7pho0irLOh1H5QM7h
	 n7DawKjULPvioehWeZHahk6cFFzPzFAK5ZRGfSlQn3H4D0BmCkQwfs5OJUHo5qPPZXS6W
	 NqqV4GNQnL1EoFgzcB3/nqhNidKViyV29OIA5StIFNZecLgADefV+ZlAkfufid8rvjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
	b=BQoRYBX7ZwAUxPKNTqyYedKV43v2N0tqiKIoqxl/GAKPisOrhEjTZesrYA3XwrdJWzWf
	 +VeTWNNjyRLNdVXLXRyN4CTBuy7WCQQtWwTIgVXtqeMKapCJ/JvHMjCCKJ7kYUowQHK6O
	 4YzKzmuJGNRreX2nORDKjzmC24Y1pZn7ou8UimyTFpYLYGixlLqpVel4cSHOdDPMchakZ
	 hatxvEYQIk4u5iTJbGVEv1Q3JOp03xkwd45JVQn++9OtZe1rjz1UMB5hdPOPBuBzpCtrB
	 56DViGJBVwtuqBNMJ0gvHLmt2aC2Kjm8+M5Cf+Jlb7uko/O2kdiY8dc43vYpazaY9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=FOUZSFM5;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C7606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1C7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=FOUZSFM5
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a451915d8aso2019199b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794606105; x=1795210905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
        b=FOUZSFM5S5d1miA7Lxx0Lf6OhSwlwNfuHZ5Jqx01yrOE9LvH+Q8m8252JavLipl0XJ
         uTYk6TJLoTtCBo/+0JEVJWlsti+MY7MO5wFKSWClF2sxYLyaHMZ7P0K40cQ0l1G6QM1R
         SgcPi/Z+Sty77r1hVG6EXHzJoQll7d47WKbik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606105; x=1795210905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
        b=RXPDSKkIQ4jViHyHdD8l8nxbyIqCXUB2lENBgpZ+Iz1BcoPdGB1ojFYTRhwdAKXGQz
         V/1NC5f8tW8O/3NJpuMm7ORhEuRp9dUZr+LLYuEH+sd7p4BwBl8JFPjV0bwVzcR483Qq
         pIJ8SUoTMpQ+vwKds6oTJMgCE6kL8NKbLCiyTwJifkWhYMuplcGKrU7R1nMbHORQJuAs
         VG1wep2W4O5AKgk1TbbKy6hAAE/9NepCgLpwGa/0FGF8zLlCPmLTt9UCx4DJcRIaDXd2
         7XSRRGRS9yhelAKstNzTUs+iQ9XeoE5P2YEj2/lgJEaqGzWIdGVNZh0MyHz3WtsLmNF2
         j8Zw==
X-Forwarded-Encrypted: i=1; AL+hErHzfX6dD7pduN0u0qNz5rThHwAitV6mkW8kpEPp5sIAgpu3jun8o1Va23VXzlg8mdETcaMLKXk5SZk1fjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iTIqfWrzDZ5o6IfS50SAnuIzCj6c41eMEBDtCA8SYwlC+EtHU
	w/VkfNBeICCydh6jvptKT2Pk9Yyec75UTh+PcWGUv0s7rOMpnVvnQt7DPMa6x5MKJg8=
X-Gm-Gg: AYBFou0ytrFbh6ahtEtgcgEvku/DVtIT950CBQfL63XMMIeHCD2cMrxQL5HJo9iZpMd
	B9y9L0lU3SvJDJu+Iq6U4Yo3LAPdgqUT7W1eyOY4l6g7hAXIZlw1oWWmJEa9a58vsftQRldqusr
	UnboPWwtF96yxLSO7q4wBQ0ypj6X0J//oY4mBTVBKdLtMQKguPJgZqseMcp48QPp/Evoh5iteaw
	NvR6i1UXUg2YJ/QJnGX1xkhPFgo9bGWrfK+3Q4IqxhtCg3Qt7mbD6kVhvt95HBRyrj/uSqpa0fL
	CAsG4Vu0eEmutnBsqnrQjWmfrVU690Is99vcR+E4AMjFvrdCUG6dxd4MDFpy4Vzk3mMqgSPTNyh
	8o2tyS0jdEAiiHV/cX0Za9Mqz6vfWXyuieOtjk125ilj4XPmwiKXF4hQ2vkRs6dlYxJ4R3161HK
	UYeDbKGGm8G+b1iTRHP0sXd+i8fZoav1RaJvhO3tv+napA94dlwcJKY0JOM9fGwb0tk38PD/tNb
	JKdXMeYe5Obe+uVTxl81iPgRqvWVZyFeWTNUKrRYYiyb9piW5gQvrgIWGvYl6SZdMRGStj6lKQn
	pY7bCO6TB/tFJODXWIoCZhnHUCqhmxJijVF683s=
X-Received: by 2002:a05:6808:3010:b0:568:1e54:3d74 with SMTP id 5614622812f47-56e64df14ffmr3388527b6e.39.1794606105620;
        Fri, 13 Nov 2026 13:41:45 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm3131199b6e.12.2026.11.13.13.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:41:44 -0800 (PST)
Message-ID: <573f682d-47ee-4e39-80ed-0ddf0da96cdb@linuxfoundation.org>
Date: Fri, 13 Nov 2026 14:41:43 -0700
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
Subject: Re: [PATCH] usbip: Close all listening sockets in request workers
To: raoxu <raoxu@uniontech.com>
Cc: brgl@kernel.org, gregkh@linuxfoundation.org, i@zenithal.me,
 ihadzic@research.bell-labs.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, luiz.von.dentz@intel.com, pengpeng@iscas.ac.cn,
 pmenzel@molgen.mpg.de, shuah@kernel.org, stable@vger.kernel.org,
 valentina.manea.m@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
 <351AC939AD9B6359+20261113023710.1746483-1-raoxu@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <351AC939AD9B6359+20261113023710.1746483-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 19:37, raoxu wrote:
> Hi Shuah,
> 
> Thanks for the review.
> 
> I found this while reviewing the listening socket handling across fork() in
> usbipd.c, and then reproduced the issue with the unmodified usbipd binary on
> two UOS test machines.
> 
> Both machines have usbip 2.0+6.5.10-2 installed, with usbipd located at
> /usr/sbin/usbipd. This package contains the original listener handling.
> 
> I used separate test ports to avoid interfering with the default USB/IP
> service.
> 
> On 10.20.12.188, the reproduction steps were:
> 
> 1. Start usbipd as root with both IPv4 and IPv6 listeners:
> 
>         sudo /usr/sbin/usbipd -d -4 -6 -t 43241
> 
> 2. From a client machine, establish an IPv4 TCP connection and keep it open
>     without sending a USB/IP request:
> 
>         python3 -c 'import socket,time; s=socket.create_connection(("10.20.12.188",43241)); time.sleep(300)'
> 
> 3. Terminate only the main usbipd process with SIGTERM, leaving the worker
>     running.

You removed all the context from the thread :(

In the following path in process_request(), child exits after
handling the pdu - all open fds get closed.

        childpid = fork();
         if (childpid == 0) {
                 close(listenfd);
                 recv_pdu(connfd);
                 exit(0);
         }

How does the problem you are describing happen in the normal
use-case when a child exits after handling the request. If
it doesn't there is no need for this change you are proposing.

thanks,
-- Shuah
