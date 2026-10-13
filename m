Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66652F274
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906403; cv=none; b=Gg61YCeRI1U2yedtBcROGXbQCa56qDIGah9nR/29TcmhJFTO5iiR06G94zCCObJwcZYk8Vj2HiAcF+jpAycOtFEiE2wT+b0XEW3bAutz/hO9VX1dwQ/4wufqDcY2B7ytqBmxwuz4nQs+SWoH6D/R/HYaUDr7a0nHWxM/lUhinYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906403; c=relaxed/simple;
	bh=qxAhtH0Qz1tc4sXD3RSk0GitMJeJ1buUR5W2lDaw1ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZGUZwGDiKqK0uv+dM75NKMdxUB68elbHgoF5Q1NVEZGSLQwHgnuW6h3SjHDbtgn5Gap1n8MD6qnEYPZ9bOLRr0q56lyI/SajCvO/ViuEEg9GmkqxXd9GxX4NNkMPofcuVErOLrvweKbGA9bDLk1WhBe174a4UFlTbhvUSJ5cow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TQIoCC//; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TQIoCC//"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8252259f6d2so1908151a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791906400; x=1792511200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ockmvioh5kYqi16yQi6YbVdMgoCKQuguDfyJFS26lwc=;
        b=TQIoCC//k98OgE1kA0UESU5QWF0tYtO1x3YlqjBVwEgVRPe/0mMjxc5Em9ZIWj2B24
         ZKcsS5js6wM1HI2qV1Jx8WDGVrrN5gneeScRDVwRPJlwVFYcRbZLympoFayXs9HDEKez
         sZ5fL0xte9t7LI+Tc7q2isLhrsO0EVqODHlXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906400; x=1792511200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ockmvioh5kYqi16yQi6YbVdMgoCKQuguDfyJFS26lwc=;
        b=vc163ZTLAKAik6P7/vdMS7AxpUd7X5j1Nzozt/NH6y33NuMN03ZN7r7/DjNvUmnlQ7
         Tts1WBx5AE96oppSfbgY9mFnMYe+/eS8mftyF68i/hon5r7TU3XfIPg+mMEcY5l1Zl+i
         jkzwNuEkIIdKPyk/EHVPf7w2GIfug6xBfpNwNXHKo0HwfBT+knOkGCRw6WtASNrfrlts
         NckQFA55/62Rsr5tSQg8i7KbHf9rglCv3LxFO9hssrgtoEraSxj0YtJNkka5+6FDCA3e
         7+tKgVjcw3wqiMOGqOhswE/F2BEyq08HXin+XjN5dsqU7YMINaT/C2P5zvwn2dQdXbN9
         u65w==
X-Forwarded-Encrypted: i=1; AKwUvBz6nhuI817vn++ou7CRPBRP9bOognAVCrZv/QJ3o3ks9mZa63yH+k0CQXjJHaEEBL9Y4MSb9m64VDhGL00=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxZQlQr/qpcpxRpoYdVNSRpKT0MBYYGZMpm1/mMrrYTVu65Z2Z
	mLvTRlx6RcjYgzzJT0wX3beLmZd7oM+5+z8eMdWw7xTNevURjOColU7iTU4qAdp2BCM=
X-Gm-Gg: AYBFou0b9XxifJ5CalxKG8cnYyGxAAh2NtTX4nsNfbq5XBQ+26uibuE8GmiQ80BERzd
	B0IIb5SWVul06PrxMKwgdc34Q6Hxfi9PgoHRJb9k2utwQQuckdycQHtD9YaDTu5EN53h4agug6G
	SdABg3jROuB8/xvD/ukhTPM6OXruOypf2vW9rsn6h9MMoqZjbcxcclsmx8NdXsdhP7x+S1NsKMy
	aEKMxgA7VdYB8kW+vpJdUHrD7l3cpWHLbClYUeMyB/5Bc6LTWVIsvIup9oGB5cqZBSwkbALfZ16
	eVKOJGyQCXEcXrBFQLJdPymA/0+GxzUMJdZM9y0+4L6nq7TycGO2mVAphjU2ZYTI7aNmEhlA0qx
	DGuNuNrgX7pabmkXQxS/mPdjISX8viU1eHwinahLMCcWYVvGjnYtrRIyxajRNJWYPuOGIg7O2W5
	QLl3Ia8KSGLkzFLwHlRL1/lCacLwjfuGqp0NBYy8gJKGUG/Ol+66NKmeyw7SZkQPF7ALgi8prPv
	5D9cyvM
X-Received: by 2002:a05:6830:6411:b0:812:3a52:16f with SMTP id 46e09a7af769-83090b2e4aamr13920151a34.3.1791906399829;
        Tue, 13 Oct 2026 08:46:39 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8367ada5b6fsm6362797a34.21.2026.10.13.08.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:46:38 -0700 (PDT)
Message-ID: <d1eba191-d4c3-4727-95c7-bd5736ebf8f9@linuxfoundation.org>
Date: Tue, 13 Oct 2026 09:46:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/selftests: Fix incorrect invocation of exit_fail
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, woradorn.laon@gmail.com
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, inux-trace-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, shuah@kernel.org,
 me@brighamcampbell.com, jkoolstra@xs4all.nl,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260918061913.28069-1-woradorn.laon@gmail.com>
 <20261012153601.6DDF11F0089B@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261012153601.6DDF11F0089B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 09:35, Masami Hiramatsu (Google) wrote:
> On Fri, 18 Sep 2026 13:19:13 +0700, Woradorn Laodhanadhaworn <woradorn.laon@gmail.com> wrote:
>> Replace all `exit fail` and `exit_fail;` with exit_fail to keep the
>> usage of exit_fail consistent across the ftrace selftests. This also
>> reduces warning messsege such as 'exit: Illegal number: fail'
>> in test logs.
>>
>> Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
> 
> Looks good to me.
> 
> Fixes: 2f84b39f4847 ("tracing: Update subbuffer with kilobytes not page order")
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this fix via your branch?
> 

Thank you. Will apply this patch for 7.4-rc1

thanks,
-- Shuah
