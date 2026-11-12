Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499928;
	b=nt5XOEsAiafa3pyaVGq2wF81J0IUzzhOPseer3VrKgNqQc3LtDU8kwZ157XEHEXVcPAC
	 aPo0tsEDn4kWviNTydBk0YVWW9qWoMySDDZKHaiRO3EMxQrVGh1OgUzy79ghPyoioGkQg
	 nxzSVWDy6IgqHIeJBNComt3AY1MobaoOm0s5uvjYf65qkqdfHQIZt/PowfYeMlFNGjZba
	 r4OvQWcjhafS3cfbgqIB/zedIHW2OTXUU/7aoYqOINy5sViGuJpeSLB+DelabIsaSpnUe
	 L5VPSgPrCdQewG3FhQ2nLKA/Ga24/5lLvbC45m7n41oV/Z3hCjUQHNRwbDYD0qHzKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
	b=ykKz2YyfNMaAX7emuCBVDYAP9bXiWnI6Tm0HVwJqfFwAxxsZOAfFn9777mOC+9TZNe9g
	 1F5BXkhp6nZdfdkUB7F+LxzHgFEi1bkJPT86AhYEn8uoAWntLvzSafuzaat/9w4Brwii2
	 DpRtvAuU7oeMPQ0esse7WyuN/xZg6iuZg35tO2Euexk7n7t3ifmU2MG/LTAa2Mgo+VUig
	 8BBct4oLz+5/P6WtEQnXoXPr7doBB9osh73MHUJXvtO57twYe2wFyb+qK9r8MLVjQc+fA
	 7enwkfSt/s7p/GtERw6UF/BmwMUS38wa1lF9N1xyDGduRDHlYbzN1rLaX2Ymq0r7jVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hcLBh0np;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4CD606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hcLBh0np
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df5e315bd1so3536816eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794499926; x=1795104726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
        b=hcLBh0npSAywjr1PPuz57wOFXYve8m2WOyXnzZUgbNEb7c9QtrzqFPE4/Ji9/kuS9m
         T35iYn9QrePsyCHJni4apXz0my9u0PxqvY3xczQeqTT67q7rHT9/QSDSwMUdDjE74HDs
         0wbvtRY25iiLFwuM4FQPjau3Iquv+Tce5tUrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499926; x=1795104726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
        b=VCphNtL+Jvorwy/CoTPmRLEXzP5CRJYil/ecXO9UhppgQveYAQzUMkpQf2J3PSUfUL
         6jSezt275oJafTWJLNUhg57sHM96ZtGLt79e/08IKchI4EN8rcdDr8F50PWWmCZcI23u
         7iskMs/SXMnfXxVBcUsdLGTT/r42KIp91l9N2xAdXy6t61/ohKq9ZXY9q1UK03JxMdF9
         dkXcJGs7uSdPuRCDFgEIl7ogoLf4WwaO1Th8r+qU9LviYrqVLwjMW42DJ2VZeCuUkWY/
         APRYAfOY1G5bCP9AU9NbIHquec9QwVuE1XLoWz+Nxd+UxjXoYLOCbDDDd1QQ9mfqCsVT
         ITlA==
X-Forwarded-Encrypted: i=1; AL+hErGxD975uXkebNQgv/O9vcJs86dB4Fs7v+3JKnD7wdfLrgHZMHn5YYoIp8RlV3qElTo4EBvtjpD3z6eC16Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NK6MjFHdqxlbUh3Z1tSo7Ocm7et/Z2WBCQAuq1u5u9kabSogV
	H5ypd1gTbP3tASBL9YTSqUOQtrWG5xxkWeDvjs8IZS4XwWEgqFukVVHLLYmcqjFEOPc=
X-Gm-Gg: AYBFou3pJTOIwZD90Rh1WSrha6r+Hp29dWoe+o4zDQQo8Kou7xod0sJp4YWVEXlbmsx
	awPFp/nJuUT0+CPwYKCwAi+vFatSS6PojHYns49Qt0kixkCfsq+g4iDLpKfaNQglrKeO21iYJig
	6ZLLmjbwATdmJo9nFatk0hL/+/T8PCsaOvr3mqHCUstLf0Ex0beTWqz7ZsrThZxQ1U5CkjAnRnx
	YePoL9tM74C0bwMofwgIPrFVwsgkPbGKve3tgsLXqtmFQcPEbFWiD1JabxhYen7PGhUCSfvBqGs
	uXYG00tStQtYMbtCqV64eSNEscG1iIv5VC03eIGlWkP8ZhSqlv342QdSKAT6LDdbS4/B8VuVcPf
	oU+sWD+SLoTljepzHA7GEAQpisyw4rbKZgyfR/+PnJFQ8kPxef04fHi8ZgpcBiTiZaj20rx5Dez
	HCYqZ6OfjurmX+aaJhNJynEVbc7anENw5nMsO37uaGFF/J/NnTCySkhFWBRxgHZppFb6vXXN8T1
	BfbgFEByaz+ImFM/unsbW5BO5ExQKdCNkmOqH0RDE2oai5biMUKj8c0uXoXeDWnBhRD2B2jLeHX
	GPiQWdPAU2lCdoZ6Xwq1uVJJICSSpQ3O7fVwWeA=
X-Received: by 2002:a05:6820:806:b0:716:f44b:2dd8 with SMTP id 006d021491bc7-7191785b304mr4102008eaf.31.1794499925700;
        Thu, 12 Nov 2026 08:12:05 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e257sm84600a34.1.2026.11.12.08.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:12:04 -0800 (PST)
Message-ID: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:12:01 -0700
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
To: raoxu <raoxu@uniontech.com>, valentina.manea.m@gmail.com
Cc: shuah@kernel.org, i@zenithal.me, luiz.von.dentz@intel.com,
 pengpeng@iscas.ac.cn, brgl@kernel.org, pmenzel@molgen.mpg.de,
 gregkh@linuxfoundation.org, ihadzic@research.bell-labs.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 05:16, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> process_request() forks a worker after accepting a connection, but the
> child only closes the listener used for that connection. All other
> listening sockets are inherited and remain open until the worker exits.
> This occurs when usbipd listens on multiple addresses, including the
> default IPv4 and IPv6 setup.
> 
> A worker waiting for a client request can therefore keep an unrelated
> listener alive after the main daemon exits. Restarting usbipd then fails
> to bind that address with EADDRINUSE, or starts with only the addresses
> that are still available. A single-listener configuration is unaffected.
> 
> Pass the complete listening socket array and its count to
> process_request(), and close every listener in the child before handling
> the request. The accepted connection remains open, and the parent's
> descriptors are unaffected. Make process_request() static as its only
> caller is in the same file.

Looks reasonable to me. How did you find the problem? Can you share
how to reproduce this problem?

> 
> Fixes: 328f7f8a0a1c ("staging: usbip: userspace: eliminate glib dependency")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   tools/usb/usbip/src/usbipd.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..5ff5b46674a2 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -339,17 +339,20 @@ static int do_accept(int listenfd)
>   	return connfd;
>   }
> 
> -int process_request(int listenfd)
> +static int process_request(int listenfd, const int *listenfds, int nlistenfds)
>   {
>   	pid_t childpid;
>   	int connfd;
> +	int i;
> 
>   	connfd = do_accept(listenfd);
>   	if (connfd < 0)
>   		return -1;
>   	childpid = fork();
>   	if (childpid == 0) {
> -		close(listenfd);
> +		/* Do not keep unrelated listening sockets alive in workers. */
> +		for (i = 0; i < nlistenfds; i++)
> +			close(listenfds[i]);
>   		recv_pdu(connfd);
>   		exit(0);
>   	}
> @@ -568,7 +571,8 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>   				if (fds[i].revents & POLLIN) {
>   					dbg("read event on fd[%d]=%d",
>   					    i, sockfdlist[i]);
> -					process_request(sockfdlist[i]);
> +					process_request(sockfdlist[i], sockfdlist,
> +							nsockfd);
>   				}
>   			}
>   		} else {
> --
> 2.50.1
> 

thanks,
-- Shuah
