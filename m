Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913729;
	b=VcXlcbekjaKXfjvtWWMiMeOGGTXCGpb2ZEBi4G6nIxUv2xbA8B+CH6iQe6rDOws7j6Jx
	 X0tiEwG/aPGbHqXnI303rAhE/aEi0y77yV23W9iCF1jC8wxJwK9wWJe8c+RpSnJ0xVmYt
	 6ygu+b05qs5Du7Zk8Zji/SntizA9ch+7in1L7D12aVm+lZV+bQ894aUYcY6xH2PgDmnnl
	 j9q0FGbFf12j+JOpbvTM4sRS50rbqDRLDFYyDLFLV8I31SEum5/dgI3+mAX9jYk7NbpNR
	 LJa3GZ2ebaqD59F6FCkJGFYFUYRn9KEYkSSogwau0G6LP8gDe05nXDdWwLDIeZPMLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
	b=z0ot0KqUF8DThjB6z6tnqD/65CLLtvvKp0sn2LN5HFZcI4stGfd0w1hkPit+YByHxUq0
	 Y4hTo4fZsIAV684Ngn3Ssm2LDylTCxQWqaGPQyxjw/BzXddVpuC55j6eo1fPI6pGLZUT5
	 jut5seirz1XkNTzdAhA6ccrfgdZFYNKLVsZ/Oho2lgMXAIPYmrjkuyGHuFTHqLLwB5y3B
	 wMmIe4Mfo7YPOgd/qWvWB3FykDbLVFxvmECxiKDdW0DojhPPwd2a/j0aFpyYZb8fYk/bX
	 vzlYAEVp/6bN4XqiTMXRAS160rEBPLvT/WRRjEFELSmDmwv3YR/0t0Zf+XNkrgp94bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=M1zRf0uf;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB21606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB21606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=M1zRf0uf
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-82109f51565so8353a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793913726; x=1794518526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
        b=M1zRf0uf4eSX65ttB1CQosJZYv4SX0ATNjnBtizp7BgNgAmlUv4HoVyZ/BSNmEQ3DS
         +wArByDyEFOgk6/XKSsQd+s17ECPk9EKKQFsTNZw2Hm693x7uNHNKUldZ2lIAWD0bpmq
         VlYvM6A88fLa2vtc8V6TXqtLb0WlLFYbP4euI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913726; x=1794518526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
        b=JWzx438ZV2IQFoZXUAshBlKPmgQ3Be3DgRXTwAmhs481Yr/VGcGJoICZ5uQSxOtBzW
         TfdTw9xQnPCJNLV9z03mwFn0az8yALG4un64HyaaI7fYKGLcryad99yVzD6BSzlFq+qT
         rv9QypaMoyERWio0zxCbpJcjhltNiRXRIhyRfBHOXQ7Kw4/kXs3OHCG3Ag64mscWvnUB
         f20DorfIeIl5jbCoaO2EquhOPHlYiWperNjsnZTeL+zy9+6QMWhD2boHOxzW6lQURbeh
         Vg6efT3sOg65/BTQkYIiSGNHHfRHCVKfDi2zkyd4N+AXI+f5TXqvs/PUBqNSrepqM7UR
         smGA==
X-Gm-Message-State: APuU4Z9X+MILJZRSNjxS+s8XtSvwOtP+VFTcpavKdPC1REctLHbps5Nx
	xNNwdM5Dy+NHbb1Q7cJbIQ3wtPgzdQZy27yB7GyY4IzsV4Gr7OtJh6HZuED7WMKY0VElkNI+62C
	RlULh/SA=
X-Gm-Gg: AYBFou337TAaZI/jgJ8lGsuZx9wouXutQoNb0VjEHFElBwTalEb6LkQpRsVW1fL1Bpz
	KHk4zrxEjmuGuwRahYomNDbMpv7l0EmUcZNmA5wKy8YJVG3ThWoSEokvXkMC44PMY+LcIF0lqCw
	Nyxo1bTuJmzDs6CFkTZ2/UKlxhGLFwv8kxocGhpKXlL1UBnB1j2vapSCkLWFdo97KRLRwoRELUR
	1125ByEueUc4JrTPEiTgDqHB5hBF3Ou8pRiMbFY+xx9ya9vhhH93s45gjj8+C4sn0hCjpWi/591
	9BCtRSSCdDVCpBG4MwzwWm0jJe5t2G0O7FlxvEJQ06hj7HwQC9rrz9eibqyKl4RL4Ig/6c0Y2aL
	wwLuA+3pRS28iBHeDhr2xT5oJLyabKKQSBVLjdw72BO3ewtxhmGnYmxkMxB/W35krjNd8LEUx+/
	FGpOPWUefQmeQYNecZIktGqD6v/BNLviEac7e79q6toabWumYeSkiQVQFHkdQwzeChjbdYQym9E
	iFkqF0UGL4c/+jnw64k6ZFpPWnEMEID4YSd1iBVihEu4F9eegAc+AEyfEDvjfOzhRvAOP9Nf8fD
	oakSGkxGzUi4dNC4AGc5twB3VrVTHAK8+eQ2b2GNffK6yXAYORGfQ6o7ZU7uTQ==
X-Received: by 2002:a05:6830:438f:b0:821:94d2:83cd with SMTP id 46e09a7af769-85f1cee4f2cmr703548a34.9.1793913725956;
        Thu, 05 Nov 2026 13:22:05 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbf375dsm338315a34.13.2026.11.05.13.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:22:05 -0800 (PST)
Message-ID: <7de6d2c9-0f2d-4f7e-a2a5-30eca1b42bfd@linuxfoundation.org>
Date: Thu, 5 Nov 2026 14:22:03 -0700
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
Subject: Re: [PATCH] tracing/selftests: Fix false bashism in
 kprobe_non_uniq_symbol.tc
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261029211218.3749963a@fedora>
 <undine-1793665155348284042-31145736d231a8b5@undined.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <undine-1793665155348284042-31145736d231a8b5@undined.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 17:19, Masami Hiramatsu (Google) wrote:
> On Thu, 29 Oct 2026 21:12:18 -0400, Steven Rostedt <rostedt@goodmis.org> wrote:
>> From: Steven Rostedt <rostedt@goodmis.org>
>>
>> The checkbashism is giving a false positive to the kprobe test of:
>>
>>    ($"foo" should be eval_gettext "foo"):
>>    if [ "$(grep -c -E "[[:alnum:]]+ t ${SYMBOL}$" /proc/kallsyms)" -le '1' ]; then
>>
>> This is because it sees the $" at the end of the grep as a bash symbol.
>> Instead, escape the '$' with a backslash as it is within quotes and that
>> '$' is for grep to process an end of line character and not a bash
>> variable.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d22c3e0088e85 ("selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc")
>> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> 
> Oops, good catch!
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this?
> 

Applied to kselftest fixes branch for next rc

thanks,
-- Shuah
