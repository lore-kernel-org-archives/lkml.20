Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2735C6B2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185387; cv=none; b=YOqTkwMQMwKTt3diEYm4cWVK0OaFVAI+O0KlREMgvuOxluo2r9LB4XXKH2swNQh2NXlfoEZKzgPMqSLIJJiOqXMm1P7PbgWJSgUid7y7CjQ30X1xzHv/ZEBXjNB1t5tvas4csf6Kl+zXW8YnZlaPaPaAZqKHBB14PlpA+BKen70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185387; c=relaxed/simple;
	bh=7/bNxtRll67btWwDxcWS4IqKYbzxFfp3PoRRMN/9Iqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCiLNn9OEojbQhnuSIqXQAXEVmX6v8eyujxKJtXCB8X3Kvq9RrPqp/tQjOXqDRvF4T9pNDzzgyHnZtthTqra9xt4jJXyHzE9XcnTUbAuPK4Gac4MBp5EC2kn2JNZVJsgCm0gMMSgO2PbyJWDRtCRTsA6c0FRGDNzozttE6Ov/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McnByjtK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McnByjtK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f9de49fcso2002981cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792185384; x=1792790184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lo7z+unZo9FeRj233bs5npQNwPD9yfSMG4t6HAWiNzA=;
        b=McnByjtKXhJrHA6Yuk/PyALMVVOmwCkKetAsro0/KWtwVo8fc1QKeO3b5EoIsfsoPh
         erLmWlT0xgqI/auIHnsQv0Ko+ha2tEwPV6vBuBCuHbl+PRxtDOz/aNkGWgrtent98Sla
         Ju03+pVckLzd2OoMlxGN0N9sYBFW6eIk6dR1gA8G5k+IXp+12yN/5vDD8Ic0mTxKugdZ
         2CYtaZrq+fdoKNW//wGniMOlhVppWxSqRhs24wb0EpISXfRzTVlSQI88ZhNSlqHcFd2z
         6L8pWefT/Cd06BxqGx4IzIWAW0svktJ847aFmNeFwfKh6rNdKA1XTGprULwoMxOs0i/k
         u0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185384; x=1792790184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo7z+unZo9FeRj233bs5npQNwPD9yfSMG4t6HAWiNzA=;
        b=W4nBF9U3gyZie5i5mF3BCTgwVxrbLCbHHmDDRXN+EHzv5Du5DRBHQMMgr20DSu+Hft
         RfLAwzpeKxuLEZZb5k2Yx/zHPtfnJHrG6Ac97benO0eYDiPKHUV0WhhufGuxr3zSvIkJ
         eXWobZySnVCYFXCMUmU3zAAVW8XrH3UGmGI3x5gNdiOPwzD759qrasG0JE165NJdVHOx
         sdh/Qf/M4bGNJLxkOdTlsjdMzqZ7vns1lWh6uLdodfxFIJFEmBxfXOgmbBgcoNT88WPB
         lFdUH6lM6/YbVsCsAzrpujtYRFGWvtFa0EkSkX4aDHSiRb3uq9qNq1CAK8/+NmSQ15Dc
         XzlA==
X-Forwarded-Encrypted: i=1; AKwUvBy0rAmT2wNqUKBJFOfJ3Qi/mGVZrRGJi8NMbS9bliNQEuc0Xb+AHrjBowYdZdYMlLbLF0yEvTU5XJDbsFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq31NIjTBM9313gJe8GlE53B6U3nwUliGPYQtYGRZBVxJXunZH
	rfYAy8qT0OAFlaP62q7hfGzJNgjcDYCZNOs+Lh5CxwMUp4zJy61+zgEG
X-Gm-Gg: AYBFou1XNCWS2ohyAeLKKh4ihYUpYhNpr6kO+qimxiprcfI8oWTmTaRN73Cw5iofkyD
	MbnIrhWk4Uc6sVB8yF8e5OE4E/q6FP960UVmtW7bS18zluhdITEDXt6fgDawlfndRHmRsyK0tvE
	ERRPD+mqjNhkzhlv9wNoOLajzzA3DK+LyVjz17y5hxBv74NNQsmTgc2gJ0rharQqaIGOX/Y1++b
	d7X1HhzBQ4UIf6jlV18Iuu2PraFz5eEpBSqjjtyDZCx/OG5RdqP9t6rVVakKdjpHcnkddhKEVHx
	D8m5d9xag+GEN/Iic4PLc9OpgnTI1/8lJtGh3UeOoOnwi7efh+QTZcWDwSLN3d2s1s1WXV82IJf
	yhkEGDH+VzVaE5Tt6CcOGUbNBJMgRH+xKiYNdmjO5Tybpzctwuq5rhZPmguNdKbqE5hXSazpRN6
	oTqmDkfze+I7mC7GCPb6hifXDiHAnXRnqBgZTKGfGp70ISaCxcvvfeHObVKDI4dqQ+1e6f37fpw
	feTVBzgunIwS4284kEvUiWu
X-Received: by 2002:a05:620a:6410:b0:93f:8dc:a710 with SMTP id af79cd13be357-93f29df845dmr166724685a.80.1792185384429;
        Fri, 16 Oct 2026 14:16:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf9a0sm306303185a.2.2026.10.16.14.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 14:16:23 -0700 (PDT)
Message-ID: <fbce6f14-10a0-4d4b-99c3-be8e7168c952@gmail.com>
Date: Fri, 16 Oct 2026 14:16:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Alchemy: Save the Ethernet address before reusing
 PROM memory
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mips@vger.kernel.org, manuel.lauss@gmail.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261016173157.2083454-1-f.fainelli@gmail.com>
 <atJ-8ttrdqhiRCp2@casper.infradead.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <atJ-8ttrdqhiRCp2@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 12:45, Matthew Wilcox wrote:
> On Fri, Oct 16, 2026 at 10:31:55AM -0700, Florian Fainelli wrote:
>> Alchemy keeps pointers into the firmware environment and looks up ethaddr
>> when initializing the Ethernet devices. By that point, memory allocation
>> can have overwritten the environment, causing prom_getenv() to pass an
>> invalid pointer to strchr() and panic during boot.
>>
>> On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
>> page from 40 to 32 bytes and exposes this unreserved firmware memory.
>> Bisection and boot tests confirmed that the parent boots while the change
>> reproduces the panic.
>>
>> Parse the Ethernet address during prom_init(), before registering RAM
>> with memblock, and keep the six bytes in kernel-owned init data. Return
>> the saved address during device initialization, preserving the existing
>> YAMON formats and command-line fallback without reserving a fixed
>> low-memory region.
>>
>> Fixes: 9ddb3c14afba ("mm: fix struct page layout on 32-bit systems")
> 
> This is an inappropriate Fixes line.  That may have exposed the problem
> (... 5 years ago; how often is this being tested?) but it's merely
> restoring the layout to that which existed two years before that.
> The correct Fixes line wuld be something related to this driver.

Fair enough, because this landed as a the first bad commit, I used it as 
is, but you have a good point about this being a pre-existing issue that 
just became apparent with 9ddb3c14afba.

As for how often the platform was tested, not very often clearly, but 
that's about to change since I have it restored in my test rack.

Thanks
-- 
Florian
