Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618588;
	b=GhNU8dZSgkYNfxl68mfjiylsyaRJvteh7RZrTNjM0pS1YmYmfUBOaGFQpI3wCWozyWkn
	 lRGv52JCMX7fcnEZNgbTftURG+SlAORpdc2IzRnaaXMKcM4P0IMqIWN87tJc8wSh6WBRO
	 XVVGp9xbjlOlvlS9KJq14PnCb5MxVlNOFZ5lbztsObDtne5vKflZghavE/gbrHfiQ7buP
	 M8X9cd9TaLItpr1bn7/bTu0nC7RN+7//UP1tPK9zAVERWMtQ8+gC8SE6zNXz9tH88CSEM
	 bM8wfLxiSstR3xeeki1PlFYBef/FjW+Z5HlBzOjKL99HvvIoFHUjLmRe7/vkb+SCnvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MLwsV9NgSX1cUZ+sDk8sdbw+D/bmCKl1tXgdytSXAeg=;
	b=DMe7evsX1zdn/g37RpmIGB9psRmV7xP738iOmD+6lFIwdhC4/CeOLHJ5CM1ZMmK0NTdI
	 F/nw5IZaPp6ZtOBE8fc05ULwXthME/tAyXdAgu4Q9KKZMkAIjM64PCkZIdrJEaL1/9+zI
	 fzbEKkvQ/tcMPzusEGT7DesWbpHSUGt7ovnFu/haJ/ohdF1hjfL39om/ild6kiSDiotDC
	 ygDKEK3jwe1hzN8rDDUQoTVkACzKSqa1uLuCWT7Oe2B1NRxbtWG40CEzw+kXLppPXGnX2
	 jpw7ye9RO7C2OuxHbj3oVzE1EOEtFr9fSzOAPjjerlAI7FLmhnxWsbezIBAd24DITAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVbzE52v;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E276606B3A0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E276606B3A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVbzE52v
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c46bd7a7345so580896866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618586; x=1794223386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLwsV9NgSX1cUZ+sDk8sdbw+D/bmCKl1tXgdytSXAeg=;
        b=gVbzE52vZSXVkg90qyn9/dRBZgyInVdeABnqiccT1tk6JfbWd1QC1WlKCA/UO2f0b2
         6ABREc8Zq1m8inodhEwUy4DvIyYstmWcoD/zFQRI/kqfm2f3AszLqUvRXJ2Re0+p8AqO
         M+5VKV8gz6FJnAkW29WMUwaQiK4gJ1ptzSSVZjQQtAjoPRB/9haKuAx5Pggm7M7PSAiR
         4paE5e74uVAyuWlzdN1Ihz95StexUF+kWMEW411MdjeiX23qDu+Ghx4aCxaa80YUZgfC
         erLtXqVnk5TNRVOmkn8PMsO9TqmnSnvyuXDcIG+U83mkgSM+RxHvdXX2M1IXl9PT+2QO
         T17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618586; x=1794223386;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLwsV9NgSX1cUZ+sDk8sdbw+D/bmCKl1tXgdytSXAeg=;
        b=qxcSKljcI65ELKU2jgo3a7EeksiMrmMCvhKhbDMBjELtSXYiGJWaj2sVhkQ8Nfd0/E
         AcI7DeqVCT/D/dGk4tBtPY7o4nQa5zoQzTzi348Nr02/zlM8r/yVKcDWs8BecaTMWk+6
         zccN9Oj4Os32nU3j5rdQpvLCCDlfTTAJDc2iKpaWm503Ntt7E3OhTGDXSlcVRSZpiaxw
         JIKmPQuYTZ6HjiuiJiue3eelUm8SVJL1rE6Oqz4Vr9IMmOw04XSwLPcbVqB0/qUGdfSd
         m7PQ+4Ic0I1DVVyZR0wxcMUx14cninvHKns7ef1c4Qk73GBvaxgmaXdC3HKCscWFFTfz
         E7uQ==
X-Forwarded-Encrypted: i=1; AKwUvByMmGbrQvckRaXMWQI4ckjf/70eZRM91yIT8h9dsdJ9NKk7Y23r13TkSTEHPRDbNshfpyQYxuUGeg3coTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/o0UJMhYvWzIQNz+xjVSyewkEG6k/ymalg4oHpO06+Pm9RmJx
	R9fyjb4ULzvpaacGLPvOqySZUAUXF6gtbmjtYqc0Y+5u5f81gzhYq4XBcgooqg==
X-Gm-Gg: AYBFou3V8J68Xy0KSK+UHim/EyTH5+ey4ocZEfskE9lWzYu6gUHQIZ7/jmvBoEYava8
	uJnFTWYra7PDKz16uGiXfQRKJYeLec7vTNTAkzhpse+Pb2wLaoLq9/zXiw/hIDjHd3bNDLRRonu
	2e5rplm0NgEZkC2Z+fVUze+b5P7oNWEb/o90HBKKPKSn4ORvglJQgnKm/lGKH9ToBgDV6Fz5W4N
	YMxLI2tpcJodzG3wdMlRt3CnRMiUmBUHddB07jwZkT5SZvTYke/k6hk+HxkgsPzgVxPZKxGygpO
	LDbwEj0e3aNTuvw21rMDD2Xe2VOVTorYSOXZZmbyTjKliJwsW4JEp5cFNBgmV4EKfICXN67gJ03
	/rYGbudajB8XmhgElTLflSCiZ2Rtd8wuEVMGXStlmVdn3RPurcLM2oshTc1DmSiG7YEHQGNKqiW
	qpV/qWG58bjdF9d+IzUxhKmjfMdz4buchS03c2zFCyCWtSDaICZ+ZseLYlnVlG7W9kXb2lRIbjP
	PsieO9W5E+H85167w+I+xfL4FzOORO9JCCLPw5QjWmbMXQAcVDN1msW6mXf7cFwYxlZys5RN/3i
	uSK8e/zQSqlCq9+qNLyNs58bvJq8a00xxQOhR6P8ZHcwRVI6h7gSLJ9XAqkvvQ==
X-Received: by 2002:a17:907:9410:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c4ca7a6aa13mr804002966b.11.1793618585792;
        Mon, 02 Nov 2026 03:23:05 -0800 (PST)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a5f5sm377975966b.50.2026.11.02.03.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:23:05 -0800 (PST)
Message-ID: <24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com>
Date: Mon, 2 Nov 2026 12:23:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH] char: xillybus: use stream_open for stream semantics
To: mdshahid03@gmail.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20261031083610.87160-1-mdshahid03@gmail.com>
Content-Language: en-US
In-Reply-To: <20261031083610.87160-1-mdshahid03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Mohammad,

On 31/10/2026 9:36, mdshahid03@gmail.com wrote:
> Use stream_open() to mark these channels as streams and
> disable unnecessary file position handling,

The difference between stream_open() and nonseekable_open() is that the 
former sets FMODE_STREAM and clears FMODE_ATOMIC_POS. I made a quick 
test run, and FMODE_ATOMIC_POS isn't set in either case. As 
FMODE_ATOMIC_POS is clear, no lock is taken while updating fpos either way.

So in effect, the only difference is that FMODE_STREAM is set. Frankly 
speaking, I'm not sure in what way this matters, if at all.

> allowing read
> and write operations to run concurrently.

I checked that with hardware. There's no problem running read() and 
write() concurrently even before this patch. And I don't see why there 
would be a problem.

It seems like FMODE_STREAM was supposed to replace FMODE_ATOMIC_POS 
somewhere back in 2019 with Linus' commit 0be0ee71816b ("vfs: properly 
and reliably lock f_pos in fdget_pos()"). That is where he urged the 
move towards stream_open(). But then he reverted it with commit 
2be7d348fe92 soon afterwards.

All in all, I don't know what to say about this. Calling stream_open() 
does sound more correct, and nothing broke with this patch. But I'm 
generally unhappy fiddling with code unless it fixes something.

Regards,
    Eli
