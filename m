Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32269521218
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911286; cv=none; b=OZzlE4YOqJP1f6tDgNc5M4aB+Fiqb9wN1BVjSE+H+PdxT8kpAbtWzCPS9RrzTWd0m2Lmu7SqQsIrTKfZPwIKB6ydr/EhcoOJ37/C6o/HBxO3pe6maytyv3VMmt3upewe0Znc5+KBe2FPYfSC5vPnBMp7EOwnWSodlShZ7hizLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911286; c=relaxed/simple;
	bh=H+mktQSwSWS/TNQ/7JvvWl1ODGmW6A2QYJ4wZMlQqQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xu9OU/cKqcaMxPjxhTs7u3mLUe/OLcfgpFfROzMvTNxzOfpgrieFh8uGuTS4vm/Q1i4sWJhwG5v6d2baebF/SXmXbGxc6gfFVBXi7GfDw+1AmR37yB6rGivZOiVuMTlY4cESkQOtx8rJWWIyKKqz/0rJORbMQwEhzDNJSJiT8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=pekAajx3; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="pekAajx3"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df0b02fe91so3847498eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791911284; x=1792516084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2ZAjGaDyphTw9+IrUM4dBvnOm/hl3BRvnUqFuOU0Qs=;
        b=pekAajx3lG8Corz1o9rtDrF86Q4hT1G200KFLhZfOnmKmkHdLmDISODeuUoT+w0DHc
         Qdb9RCE8wujgJYbAUifeXUHjWp0MpTEFIKVkDZqHi7pjuSe/uLi9oULtTGKx3iHEv+tw
         KgJqidoD64r+LBzmA3AQ3MBBoZiW+IWpgwqFTvSdrd/I0E4Ya/mX36MuC6gfspcwW2kY
         C5By3zcRtHo4lOzv/GwaQQfiOnombC8BbQWOaq5L3cmmwSgC0g6l+3tWrqTmBYJeDlZY
         MuXp+PDaj21CdzTw2a0ds4qehbkNHiFB+HFzBmW0mDEA+oGybuQG5ewCV3PU1y9GgDb5
         ShDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911284; x=1792516084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2ZAjGaDyphTw9+IrUM4dBvnOm/hl3BRvnUqFuOU0Qs=;
        b=O7XfBb186y9uhO+vsyUB7eNfNMFq3kqPPJ979KarnJL0gStA5k01ZVuGrGlXjXv/u6
         7aRgc5yJt6f//XmT53ObLIH53MEPdAy9rRck6ExVLFxGwaPA8az1kLJ5NgWuGcQMvLsf
         YQH1/VJMf6aSnlMnKfKvu+29M9fdPfpa+banxN3VJ39OHI8CN/KYvTNK9QieE0JO4s/4
         FKoXiCzYEIJFIHko8KwZMnJztbuczlJgMXhHfhKS9vC8Q6KTX/kpECje7prp60Zg3Ctg
         9ErLuAw7UWvkO6pe0HzwHsAPkBdf5m5oLr/cJtJ91HRzcvzD217NKnotNi2GJu0uKbeb
         i/Aw==
X-Gm-Message-State: AFq9FYJrfwbH9EHumeS0/7vl5Wzw4j2gHqj+/y4tGZSF1C+EA+MEMyq2
	+TsHjjk0KUZy6fdacIj7JCHiui9xYvYDrc41oP9VApVH09XXsN+NWnjfAUiC0aVeHdY=
X-Gm-Gg: AYBFou1lGG+Ykx4NCBxriYHSNa2XF+F7SLIXUiUwn+dmLX6iIckg96QzqNZZGfF7YRP
	OOSYT/3QvCnElLY4Q1snQ6hFBqucAUxMew2gtz9LWsDdcIywvdtYlqS4A/NCPgK7OA01zdT/oEx
	vfv1iwoG0TwebLwdCokcsULlUp85OL2hpp9+z7mHX7Plt+8lVrPpMDVgOrSI0/cFAS187PRxfu8
	iO2BIWoXB1YwO5Zm62KrMR1mJS6unFGLoDD19u4nvG5nwg/YehjWPD0gc7DHzVqmYAnIeUKqy5p
	FmIqLC6CHIAfJwngBJDKFAYR9b6uERafI5GS9plBH5/s3Fx412QkHCsHJVZQwRKqOB+Xbf0Hem1
	Nv79DBFEoxUB2AgB410nfKkS9LgQrVtuQlVVuXQZkk0QQjzBCi5yMOphYK+X98FYV6wj0mEmIlI
	6I/Wgv3yf+aBf8RKE4a1/CPk/lLTbV15a7Y6cAp71eqXfmbcmg/M6sWDZmPiIHAEwiOm8y5X6Eo
	s6lDQb6NIaVxRlQUb4QrvE637jrHDRggcxsGXUjXCLwfWxFstrhxjY=
X-Received: by 2002:a05:6820:180a:b0:6d9:bad0:837c with SMTP id 006d021491bc7-6ef0fdaf56emr6801193eaf.40.1791911283515;
        Tue, 13 Oct 2026 10:08:03 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6fba22b94e2sm519970eaf.8.2026.10.13.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:08:02 -0700 (PDT)
Message-ID: <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
Date: Tue, 13 Oct 2026 11:07:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Pavel Begunkov <asml.silence@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <as5jnDJEt1iZZqZk@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <as5jnDJEt1iZZqZk@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 11:00 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build
> (arm64 allnoconfig) failed like this:
> 
> ld: Unexpected GOT/PLT entries detected!
> ld: Unexpected run-time procedure linkages detected!
> ld: io_uring/rsrc.o: in function `io_sqe_buffer_register':
> rsrc.c:(.text+0x1a9c): undefined reference to `io_register_dmabuf'
> 
> Caused by commit
> 
>    4bb7978523289 (io_uring/rsrc: add dmabuf backed registered buffers)
> 
> I have used the tree from next-20261012 instead.

This is already fixed, which sha did you pull?

-- 
Jens Axboe

