Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E14261B9E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451407; cv=none; b=B4Hhh4iDEDO0/XJyL40t3FGUV6phMEV7wVHUlx48YCt5A7+SyB/uzv3oZ/cLc8iW61ma8SR11w8ZRIXA6K/C7wrdOS63j0OllSf3Jaygrgf4z0W/sys33rr+V3lNaWdP/7qx0oNAT8bCOYpzsizn8TLczclac8xCYCYverEiV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451407; c=relaxed/simple;
	bh=HAyjnKtvi/9tfuObm2zkDHpp1QzzxsFwzp99BfFGLs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1+CfLBIIfM9KyNctzq+xMyvL7u4MtgM94P5bTAiUwtP7FVBwncqaADetUJShB5JzkR75CiE3wPY4akPTq9SNEW3aQq7KpafGDMNAgIwNsohnyMt3SyITJxAYAOIqy8GVfC0i1mhqZCwprYlVk8EivToxF/vN95R8WPB2UuwLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QZHiZdQH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QZHiZdQH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso13354445e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790451403; x=1791056203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuUxqGLkbBPBTQWeWWQI49TvssdiYbq+74DblXsLcuY=;
        b=QZHiZdQHqp3eM07a2ytZIJSJg/2VVRp0HhrX7dC4jD+yBkCrDzDetGYs1GXEau1dUe
         6Nbtn/lYwEhLWHl7WBJIs5YcteDlFu/MDUZlRlLL9GQdqERaKdHZva0TDFF1pI3GWV5I
         s1z1UC5Ta/AZy7L/lp2QcYFifC/iV9tx4L/c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451403; x=1791056203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuUxqGLkbBPBTQWeWWQI49TvssdiYbq+74DblXsLcuY=;
        b=Hdn/17cn/ZjOMhtkM256XQ3glzDaySRXlKkTWcwGl+T3W62yQp03lQuDK5dX5JQ1ho
         yGvxRsFujllJb3e56e8FApe+K/FsPhIaSu1qfe679DK4h8X7w5tlM4c9M9CjqqFccq65
         qWrQYqHvgBdKvQYv8Uh36d7C0hUHyaQtwlwuYsKxwSSRgd5ROjviVbunObnebVdmf6qd
         xfIeMPnq0J/ZrF4WKh1Z7G8sTIF/aBj0iMpMSEFlwSn0Voy9fwowm8jeZJsvdsW8FSco
         zZmixEsMI6D5xbmGBrHseKltpIHVGqWZz9nfmF68B9jBPKwK4FLRAHzMKkOXT7BJyKfy
         DCkA==
X-Forwarded-Encrypted: i=1; AKwUvByN5ivAKIOUO+ybOEiQjK75DwGlu+6pzKavcCrjF8xkTDI2qKfUIOvjbYGlDpJk9v1ga4m41ysw48fIbRE=@vger.kernel.org
X-Gm-Message-State: AFuF++k43KMqWb3ra2faoElrOiTOZBJoJS8YOpWDTCAYxjLqIXdNRVe9
	foefXJpvs1Xwef4omyOzzywMQHj/pBlCgbrmBWiucK3dMvTw/k3tZTfqpoc/MrhmpWHrseIWVrW
	x/oroKgNTGQ==
X-Gm-Gg: AYBFou3E89guP5CmdyZ0nzAWjDgHhAWnVQzygFIDsFo4+WSkfoVjoevOt62v1q1erGq
	qDtQ3+ohRdPsw734OllM7pW6bTNdPBgEcaG3Yl4omX6Mcfl9zeMMxbs4saZnlMUPzEMLGU4HJMx
	9pzmfWZBsG9C9tPU3led3B7RWDanI3qDGwlDJ33/wfsWyJxYJqB1YKRy+rAq8Rf2WFRyjXVMIDt
	Cbkt3HuQkyM/O043QhKTrRw5RUdYHtseHx1puJBOYp/dcyTUkV25lZsq2qAJKkM5sUXvjaJ9LXJ
	6neq9WGr3vnP1mgc87zAXddkNcvfBTkp6JR0rmjkNjEQ807uqLMVeM0v2hNgaHKpTFNJxfa+6YY
	GlBvdgeKGWOme0YPuZdGQIOmVxRXoUE/4amXGa3TgKvO0nxqfhD90mJh5Uw44WVMmduDJjFdnb7
	kY5IpZTQKP+8v2hAn9Jtq9PVcabBgAaI9w5Qmfs5LG8Fp1Eo+19k1sfEbVrT1GBWKTU3SBhoVcU
	1QgsjB+GrIyk3j/NRdbIFWOm14Afu4hrxlhakROwbnaA+Ts54ZmlGv+RQ==
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49fe66f4fc6mr149848925e9.25.1790451402874;
        Sat, 26 Sep 2026 12:36:42 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdd11sm155186155e9.9.2026.09.26.12.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:36:41 -0700 (PDT)
Message-ID: <c6427104-c510-41d0-8144-174c002d1dc9@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:36:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: skip gcov symbols when picking a
 function to probe
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260925133558.3636030-1-eva.kurchatova@virtuozzo.com>
 <20260926213112.9f92e7958c2d12c946799a0f@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260926213112.9f92e7958c2d12c946799a0f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 06:31, Masami Hiramatsu (Google) wrote:
> On Fri, 25 Sep 2026 16:35:41 +0300
> Eva Kurchatova <eva.kurchatova@virtuozzo.com> wrote:
> 
>> kprobe_eventname.tc takes the last kallsyms entry whose name ends in
>> vfs_read and puts a probe on it. On a kernel built with
>> CONFIG_GCOV_PROFILE_ALL=y the counter symbol gcc emits for the function
>> sorts after it:
>>
>>    ffffffff819bd1e0 T vfs_read
>>    ffffffff845013e0 t __gcov_.vfs_read
>>
>> so the test picks __gcov_.vfs_read, which is not a function entry, and
>> the write fails:
>>
>>    kprobe_eventname.tc: line 10: echo: write error: Invalid argument
>>
>> Leave those symbols out of the choice. The test then picks vfs_read and
>> passes; without a coverage build nothing changes, as no such symbol
>> exists there.
>>
>> This is the same class of problem as commit 23a4b108accc
>> ("tracing/selftests: Fix kprobe event name test for .isra. functions"),
>> where a compiler-generated symbol was picked instead of a real function.
>>
> 
> Oops, good catch! This looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this fix via your selftest tree? I think this is a
> kind of selftest fix/improvement.
> 
> Thanks,
> 
>> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

Applied to linux-kselftest next branch for the next merge window.

thanks,
-- Shuah
