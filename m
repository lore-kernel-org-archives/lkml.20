Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBF37B023
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452169; cv=none; b=eDYNS4YCJG03Z0WfQ6pcnExm/NgXBuR7OzG6QlyULbfYfl1tNQbqhfO4WlkMhvLho2DtksysCTPqYjli4/dtn503g32vxwlsOXBEoQ8SWGxARe/FTEa+eE0yRlMHI5JKahdmrgCvNxn3VJlr5ZHGiHYZsa/aoaJvrWjb+KTvaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452169; c=relaxed/simple;
	bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5sGTu7/F73UK1CRc/TH+zZ4qNfuLzjGjiwB0Gs3+JkhLsvcFVHhOuVlaYWXdVRISi9eSg2SBJmeovo6QskKEHJsoo8+96dbj9/9j/c8t2rJur1rLCAe1f9fBpUEivFWPGkiSx1fi16E+8eENxnoO702LE3hzltPiil+qZl9n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d/hPTyT1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d/hPTyT1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so10511895e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790452165; x=1791056965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
        b=d/hPTyT1+1vOyCgAJJUGe4lMmZl5bq1zRgOIrjH81Aw87tMs6Q2d/xlMplTucUvA+O
         Ps0dFGOOCSFM36fmwNmF8W5dpimIRQPuCshXz+nDK7/fjOl2OMCbNXQaDpXMlrMpqm4E
         mtq63JMfPeizK0m/LqgxDQed2hveLCXZcMDtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452165; x=1791056965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
        b=XqFwlZuV0yHvj0bYX2whi2pRgnVjUgL1rJhvUYUBeJ6JoMQLVWKvUpSUaHhlAbucaJ
         X5r7E0FRfyLGexcDP6iU6s/H7W6Taj7HHZJcjxB/JrN9y0vpp6M477t74YiiygBDaixO
         //9Wxk64JOOl4gr4tmE3dGjZx9UvQvZyl1EHPtFttMFqp2zlrW3kSG+yjWEttGInJ7a6
         pbsj75bCwk7WVwXHZnow4muVcoXAPemZWYj1KgfLV0YMRzayfmVcIEfuIiCFAYInHSPx
         uMzi0uyp6j7repKLuwjHAT+HWTVfUJHQqVtMBEREcbopwoU064EA1SkW0qCtfyriK7g7
         0QsA==
X-Forwarded-Encrypted: i=1; AKwUvBxinXlrdZAF4FshTjG7Ol7doSUwQSWYjcnzdz1osS69T09EtUL9dkEnJyMnOsTdUTymop5c2BJ78TZfZM8=@vger.kernel.org
X-Gm-Message-State: AFuF++mbU4tyUBedx6ih3cuDgz/43uhF+H6HN50Q5tHdWiuIsV21Pm1d
	fimxLW/vV9GigrJGs8nOWcrfJLB3vUGAWzJmfqR5W2JdYw31Nzps+ZIP/IT5ucN4Xpc=
X-Gm-Gg: AYBFou20jxetdULAisCdxC4bX23M1N42VFfIzLlZ3ctGczmWfDbDBceNXZmVP2nNwdo
	QinlzkGGlwW3CnlqXVHJfyXSTWoyZk2eKz9nlD9Qiuk8dGDB9WaEn2yDzyY53S/lk7sG8PT3V6W
	gUPA8KM8efhHE99dEkkSlLgqNERBJUYz9mGmchEjQhVNv15CUwt5miaLr1x+6lXM6RZkbH9alva
	Z3OGL2ZUCsrAvz48Tch1dKii0TolAtmjIP4XepZ+q1wQBGDOtF0v0t0Km+Kg8pqV8b/IMLrQHhU
	q7zJI74K8Ex+AtSf8z7dfo6SDbSAmq162Kdnq4Wy4Le+iaN6lCaoVRKDfht5FDD2v73bscDicg9
	MVyky251HrqxNgXXEktjdin1HQQ2LnmGMmlKZCc3Crt6J0uvi//gB0kv4X8CxJ2LgaQIJKD5l/M
	4hPZ/QTHnU70SOftT5E6tUn+IKa/+oDK3a2w1Y8OZFkI//fN7lRhk7OZZjU4pJlLIUXQg3QlIjQ
	AYOMGb0H7RL4lxj3MOIwAwxl/hCSfmPgdY/+nTf9I1Bs7X4rjhlF6hjBw==
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr107860355e9.2.1790452165483;
        Sat, 26 Sep 2026 12:49:25 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm17547635f8f.20.2026.09.26.12.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:49:24 -0700 (PDT)
Message-ID: <eeb557fb-7ae5-42f6-8167-83c3828169ef@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:49:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in
 favor of drivers_probe
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org, stable@vger.kernel.org,
 syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
 valentina.manea.m@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
 <20260820101800.14650-1-jeffinphilip14@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260820101800.14650-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 04:18, Jeffin Philip wrote:
> On Tue, 11 Aug 2026 21:35:39 +0530, Jeffin Philip wrote:
>> do_rebind, which sleeps normally gets a mutex lock. However, it does not
>> or should I say, cannot check for null udev between spin lock dropped in
>> rebind_store and entering do_rebind. This is a potential race window
>> already. So, even if we check for null udev under spinlock, we cannot do
>> it outside. Regarding do_rebind, it is called during stub_device_rebind,
>> but that function is called during module exit when all files are removed.
>> So, do_rebind is not designed to work in a concurrent environment in the
>> first place.
>>
>> We have a safer function that can already do what do_rebind does,
>> drivers_probe. So, we use drivers_probe to rebind the device rather than
>> use rebind_store.
>>
>> usbip tool references this function immediately after the device is unbound,
>> which is safe for the tool itself but since we opted for drivers_probe, fix
>> it by using drivers_probe rather than rebind_store after unbinding device
>> which is more safer.
>>
>> Tested and working in both userspace via the tool and manually echoing
>> the busid in the related nodes. rebind node is still left active with a
>> warning to use drivers_probe upon encountering rebind_store.

I want to know your test setup. Can you reproduce this with usbip host and
running bind command from the tool?

Also send me the error messages.

thanks,
-- Shuah
