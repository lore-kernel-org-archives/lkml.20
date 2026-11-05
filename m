Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912939;
	b=oh4gJlCHtPoqscj6ISLhj2KC1AhKjscoOmXEPxJe8AsjMnYU5UD+bulw4HWxZlEWysYS
	 0xPsjlGNc0pS9jId74aHjZwCBOHNuUnd0TkrYACi/KDjbpi2aGMFHqz1RIr58Tj79mBmz
	 NQAHYa+0NM7m9F/+dPA7TMwe0ffrBEnWIx5rjogy5UdQqoN3GquiLntx9atk7+twHGlGz
	 aUeSAhnacv8tkRhDRy6rLItyhMOPdUTyqPgEigZn9U1g4XvgXtzsSp31dP1fpeKBjGx+W
	 EWgrkNACj8LkeaNoT7UMi5tcAgFpfhwn907uAqcSUsrVTJaPWZDcyK5+d9ijHIfxWnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
	b=VlzNcmSk0i5Rx3qGvlYQ/vmXjUpW6XaaAwrSSnaFt63z7GcG0tI77UxrEETk636IJpGe
	 oh7WT4rD/h6kv3fnqLhj0TkuYZ4PW3uP3TQlma+WqElRJZk+qn9B0SLqm1NlmixBK7YXW
	 pvyzoPU28uvlcott+I8Vp2gdUYgT3EuzPzrlqiXnYtTXDsSEMvn/7NxXTltONS4sHSQuL
	 LfWurVvm8Kyhsq/J31TAY7mtLni+j3UfDNhNkBuRf7XgT5J2fGQTUrzvu0RPMnvp+v24T
	 wB1Miu7umx0fwgGH9o+mFqrHc7lbbEEociG0de5G4vnsep+3uQEilCZHwmSa2EXIBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LSrGiK1j;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F96082BCD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786F96082BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LSrGiK1j
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c7b00a75fso24453326d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793912938; x=1794517738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
        b=LSrGiK1jiy6V885V9jN8Bi3b6sNFbX+dZ266bmKi4t+St0LvwHyatzh97rXhiGOqcC
         CaEDvyj+s5LQxu+fJ2TeQJ5ccIZUwni7qUOe6vtSI64pxjTjVU2hXKfVZka0bTeM8jKC
         9fHm6CoZXeXwQ5UVG1VyR21oGr0GSG47dCWP/sHxbVqLkjNtgvMVE1tWreBvI8N9fg0t
         nFi9UELQyynrPUqvfCpwssW21Jam3IDVvy05B/PHNgD3/N3v7u4JgyRmZ7zsrpSBTGQY
         NYZ4EA34HR24ZnF1iwEUqy72umQyV2ZFl8CQQW9WMEqJ1wHDStInDTbhwqROPgfvApI2
         KbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912938; x=1794517738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
        b=Y1Pqk/wTttaPiay6CL2UsJeOIDqjRTKtQLoZG6dpfJXpcNLeWkjFqcVyTJQrBrbZ32
         rUpgIbMnikEpxw64DFTm+BH3voiRM3DBEYnlZ3EUjelYdYqPIr2sVPX1TDhDnzvMeniN
         c2ZJrArRTo7w0Api0n7ioy0IV/3maa0xeM7D3bDj1f0UytsnMlr8Oh11eFC08r+acC2q
         88UJIXbTcVGUfjDCowbbgJCE5jpX/ZM4bWUGAX3uJTilu+UaMYecDH5jQc/klE6anTwT
         BzOQcEgZBT3YCGVcuIiURjK4I/P2D9EEsAE3E2ycieF9/etWvZhr6WLHjPgW8Ye2BkVV
         tE4w==
X-Forwarded-Encrypted: i=1; AKwUvBxN2BTXXm5MiRh0m3xemI++F61iHDa2GD90bvLG+uleNo+kahDtCeLCOYpjNrJnMu+nBEvqSjthYjLIA7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AN/fi23WkJhOd6UQEzAu2IPAgyqQ+vZ9/v3yQLLQCLsAarTb4
	vS5/3hXCx5KyjabAodWZyaX5Smlqi9IreQr2OvbHXKKRSkiq40d+55Ls+fIbl6qCMjyrcLQuBVC
	uttu7wqPQ
X-Gm-Gg: AYBFou3iFsiQyNMva69im+K9axFXVvF2fdfARqAdKd5Sywoc7GH616WwXXcG0tbuj9a
	jsvrZLHzKqGcS5ehxCP/la0/an6G/G58+LDXWP2az6+6dJBJiifRNGEYD8eK0v7nbfQwGyKbHIO
	9NOWyTS/8wUnja5ZOHiNjRStux8ZXKYWsmcx27Wf95XQBkDyfHkGhLwX9WAF3K6EmM35viKm2pG
	t+jWCtFoidg/EFRr6rNtfj4r/CI726MTmL7b2QevVEe75a369ywiMgnIEyts1Zuk3YxPIKJSsUE
	yTdKpfB6fvg5sycBjU+rgzXNHIHuOoIhTzo6GVEKUXubXdPE7w4Wl4QJ/UMPcjqfC8AP4kToUr5
	c8NkFHF6ZL9okd+OpN6HWfC62KV/XZTPM9YYkHe+LMOUYp30vJQJRLRw5iLPBhzz6vCcrujFM/1
	aBz22tSIpBHIFMlSPrs0SSgXK3sokm0wT2t30nsH/0aNR4s5gKl7LmFPYncdhZ8d3oXLF+LdgjN
	INYHLz4152uSUIJewdKgv9qk+lCaClSSy5l8QM4KSAZ14Y8lVFPQcCpBfjhu4Da7z//EXkGD42m
	N1omc2sv3aW3Tb9xHF0Vhi6D8nu3
X-Received: by 2002:ad4:5cc7:0:b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91ea9627890mr3858876d6.14.1793912938154;
        Thu, 05 Nov 2026 13:08:58 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a9a744sm4578596d6.32.2026.11.05.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:08:57 -0800 (PST)
Date: Thu, 5 Nov 2026 16:08:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 02/19] USB: core: signal the end of an sg request last
Message-ID: <c4a8be3d-5b0c-4581-b225-05211a4ae9cc@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:42PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> sg_complete() and usb_sg_cancel() call complete() with io->lock held and
> unlock afterwards. usb_sg_wait() does not take the lock again after
> wait_for_completion(), so it can return while the other CPU has not
> unlocked yet:
> 
>   CPU0 (giveback)                     CPU1 (usb_sg_wait())
>   spin_lock_irqsave(&io->lock)
>   io->count--
>   complete(&io->complete)
>                                       wait_for_completion() returns
>                                       sg_clean(io), return
>                                       the caller reuses the request
>   spin_unlock_irqrestore(&io->lock)

Wouldn't it be simpler just to make usb_sg_wait() take and release the 
spinlock before it calls sg_clean()?  Then the routines calling 
complete() would be guaranteed to have finished using the io structure.

Alan Stern
