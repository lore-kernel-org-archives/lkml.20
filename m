Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215C3D3334
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077140; cv=none; b=GPTD+5ZWjSWAhnUrD3hguXurBiU9ztBAEBXp53rpauupg2bVRPw6W2v8HoP/prlNu29u3Locf5YDAVxa52kCzxGpDPI9VeVwvlkZfqDvvNi5QSf14pz0xun/depD+As9BmBUbSuzbeQ2SKoR39ylri2YR/DAhF+EWrzDzo3opSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077140; c=relaxed/simple;
	bh=rQ5DoMf8ZnQyBuNcuUdT0zQ4ECEYfTAmcSFNHkaDc7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJsCzwy9QcDMmB0LcON8ExUrdkS1+dCU598U75LovJbQMOolqdDS3zd6WXkfWhHsrEjq6Axb29EetYwrR4l21JH2JKAb2cDD5mBOq+ntHtqk5AGYIjsEkQknixRVXfpHT1Qipx8kGu3/npTgGA68Tp6Nxg/fBgynycXg+D3tepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QhgCQAsT; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QhgCQAsT"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d126f631so13941477b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792077137; x=1792681937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4f47ccrTPzkKKb0Ghz6v3dOkmhYk8321RuCtsSygqc0=;
        b=QhgCQAsT7RVOz38TRpDbWHfkOSjHKnpNOby4P7lc2JBYH8LYDEEZdf0+V2/6cYqaY7
         iYMhppPh1Ydru7IqzpbkuJ6sI1uXCN6kIJuECJTiULLgQxQfZSzNzHY37oBt6umdvmbe
         dKohXThSEVKZ3D7Gca/2x4pj7hwDnXgN0yc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077137; x=1792681937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4f47ccrTPzkKKb0Ghz6v3dOkmhYk8321RuCtsSygqc0=;
        b=bJj1e2ZrGUeHO4e+Al2P7aX87EKvZPvIK/ZbMKa1AsagZ+Z5c6uMTBDI1Ykx7bBTVm
         3lVrZoSE9j44bpP7sz27Pz4oSvh5kGdoSyuqgb0/plOPCILIR0FG/w7RzmScQzqXQEEz
         WlHP/9KbQhQ+PV507n92gqmkFQq24edvaMN0Spr85+jBWfLsvsJL8wwmbIn+4siIKEAu
         UvXx1YpB+YdFPuZK6jPDNJp4pKPF3eSPQv2J2qkukC77QteyffRb95weuOimpz3ySGd0
         EDWeSfuw4Fn1K679aKjKmYnbR8YIOB8Tr44jUpOmE5IabzDD+zHLpuru11DOhXC33WqE
         pERg==
X-Forwarded-Encrypted: i=1; AKwUvBzxMDpYybNxwJvh7hK+bLfcuBzPF2hD6SQxPh7xb6ykXJQZ2NxDSFHfHrGqt3sorOOY/4AqgBCe3tUfZGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuqi20WGJbg2ts111ThvxVdrx5rvO9lBfTTKVTT1ef37o8aF2d
	SDw5VrmyxG1NUDj0LPkPOlCrJfaSTuBqtBhQlB7aRYNYMadbWmQudzKQFA5y5IJkutMgDnZKjNl
	xNacBdDs=
X-Gm-Gg: AYBFou0KWsRulatbyiAgeUTJYeqJnr7JBlIFgu/XGxfxn+QT8ZX2l6Va5wnuxl4tQzX
	S9F0rUK++Uu6CcMTptWnkGPH40P3sK7U9ZEGFB2gDlaxeEBUiPB/ahs1jOTDpFhcD8b6B9PHlmi
	TNhlMzBJOkqXO7cXM7SroaO4Ob/W1SWXAA7OAXc8x9xoI3StykAB3DHEFP3cgVnukenWmUunyvn
	zKSU4FqQUBOmeZ0XVk74/8pCsZp0L88fDKLYriob8f1+bMMVtDILXgt1b1ixqc2tJjt5ZuEuOUZ
	lWRW7C9n+gQ1JWKqap9hh+lcI+BHVENYykciB4iGAoGBJlyVy4I0+sXfpb6Dx7ivoxR6GX0cPet
	CLucJj/KS7q5A0rQIFIrj8/UH6vH0SxVj/iQMVII5VFYZAO7DSD0cbBRcyVwAVQSCvm34zFTDpS
	OgzsdM2j/dOC28UoCE4sQNwN/2czuYRAoUkgNq3Kzs9gf6RLAV9Tba3zSF2GE/PQ9Z5MkfUoBdu
	ega1bVosQ==
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a3a8:5f9c with SMTP id 00721157ae682-8b0a3a87f2dmr46357577b3.40.1792077136707;
        Thu, 15 Oct 2026 08:12:16 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm66643697b3.45.2026.10.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:12:14 -0700 (PDT)
Message-ID: <97e9479a-d64e-4905-b6f3-7f8831bf7f22@linuxfoundation.org>
Date: Thu, 15 Oct 2026 09:12:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Add nice dependency
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jaewon Jung <jaewon8868@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015022416.43534-1-jaewon8868@gmail.com>
 <20261015145557.7AFB41F000C4@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261015145557.7AFB41F000C4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 08:55, Masami Hiramatsu (Google) wrote:
> On Thu, 15 Oct 2026 11:23:39 +0900, Jaewon Jung <jaewon8868@gmail.com> wrote:
>> The tests use nice but do not list it as a requirement.
>> Add nice to the requirements so the tests are unresolved, not failed,
>> when it is not available.
>>
>> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, will you pick this via your selftest branch?
> 

Applied to kselftest next for Linux 7.4-rc1

thanks,
-- Shuah
