Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D32F8E98
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781847; cv=none; b=C3jPGWYFUTOmIAO5FUy8A/QLFR/+kW29HAe8JDR5p3UlovUqXgGqfPaYSyvDJDzHktSbJ5XvOwRS8tZnV+8xY572+hhaFPJ8LftsS1Hb2eRTn0Eqyz956b+mTtdx8ZkpE0lB+K3psD1FBdMcon0763Oa4K7VQjT0ZZUl3A4FldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781847; c=relaxed/simple;
	bh=IFPb0ic/DyH6R9oVq533iIXYk6oVXp9P9CoDqHkInqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abx4B/s4wY+NZqfGqVix42rb600eMnZ7bU6tbDIvQ+WMCcAPHOy5JFs6VvGLDqmYvZq3glLHQtEymN0IHW8nKqMh87A8uqQg+EncDxeEvgJDOQciUx8wXHFldfZkhJMRZhrhjncfp9tioCgxc2Ys2VlzFbSgx/QGfyrfHSkiMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y/ONA70C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y/ONA70C"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1819024e9so1374955e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791781843; x=1792386643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ek6Y6WHWyZvWPK4rY8L2n9MgGRmcFjVIrlMTJWJp3A=;
        b=Y/ONA70CS9u8sYGxufa3525HtLg0YkEY/7f6MWI//FoUygOP3fzbpuOHXLPSN5PyNN
         ZOWrHt3BIRRbI7B17eA9/t4Xq3ZW+NU+SbMoDSZs32JcDf7HIwORNWfvT7T5Simjj7D7
         PLuxe9/M/5t6+jSofI2vV41ByHCs77/+cUP2SAWa1uz5CKIZ+iiz7AJ1FiDHeBlZXICc
         715LsMM15FhUArG9ZAuAyW+r6hokC8AZdThuyWk6Md1NQLFt8Pvo7BSew+wRSH7fxIF/
         xjDWnUpvolE6vgPDjd1lyfReZr6TcMPN8PeZrERO7/nTvTTnHzaMfH4SCg7GwcuM5wNh
         dSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781843; x=1792386643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ek6Y6WHWyZvWPK4rY8L2n9MgGRmcFjVIrlMTJWJp3A=;
        b=eduKjlvLEwu509c8uX9Hw1BFCR8BMIRPuTL/yzVJWi2oiLo4Lm6StuiP6gd9Q4oLk9
         wC4FpEY9B48uXKnvoSIdlMSZ7Km2gg+0TVxvdjQ33CFYoXCCjaLc8JG9vRck1H8Esl89
         GfxxBzpLJQyUogJNzEy59tfqQ0Tm1PCm0DPKhzJSvvuivmaKyYA01pxGO63bR4HwxZKp
         Ku8YCPZYRjnCpN6zuUgjsBfsp4rSL7qFMSe09SnZQpI3oAmjzd+URhcRbA1rwh2nHci8
         tbmcY8CyMoY0Oak+7iPgqfpJdvQXxLAqvJYx2dr32qrYGeeUX71lGIG3f8WWHiMqk7Q/
         PE4w==
X-Forwarded-Encrypted: i=1; AKwUvBwNnTCL5Blgm2J5SkHNP4FcTZXz9tTLYeOBmgEM6ZjyELwxaYqVXC+Tb6eN6Je00UyBZeLdxY+ggI/ik94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLdYU+4kXpJoAh9GQ7FtXrKE8UfXDSlko0GpVsDbfyCQ6z87EF
	XMrDULthQuBkf9TK6eZK4GtwEbToYXsrXy3ufm5UdshyXj7utp7DT7fb2zLPCnt/0JictzG6PYu
	7vjo3BHA=
X-Gm-Gg: AYBFou1WAEIL9tvFNXgPn0Bmus2ZJ3nfncIMPjCdszveEZQ8szzzoMOOnb/YqUKE2f/
	7E9mP40TiSdQxNJFqB9Qx9XLumy4YQxfQoOQRG27nc/WEEUbzP3Ia4WQb3CYfXoFgy/iJ5nYma4
	tfAsxRn2GlayaClzWkzWmmyw2iOdYASdsCNQB3SZsVjHAh6DnGIQnBwnkRJJPm2jZscoWMv4u8J
	OIuUXqlFHzvxEu1Rzd0ZBvMUDvXNmDyPF58c5B3j1GCZcHrLcb6rgOBy3n8jIW+nrwqsGtuYnff
	0DfoQ37Zs6GUEKU/WMRo9DdZQIwXgpNEWUby/bkElyrLRCNY36rMpXycjRKWLKfQFidYDDdKLnf
	+4GoGxWmlBPG2VxIIy+Kcp2hSop2KYzLa95oYXKLVPx95twjIgJhigqIfSQfmDP5RLz0mSXOMI3
	1msmOwHvTB0ovSoqMpEmM1U0esxmw1ztKsmj/42oLOvY9NH1aYDDoEwaPZzxQwzj4L0RlfiRw/S
	1Yk
X-Received: by 2002:a05:6000:29c6:b0:488:85c9:120b with SMTP id ffacd0b85a97d-48dbaae251fmr9042329f8f.3.1791781841105;
        Sun, 11 Oct 2026 22:10:41 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm8990476a91.3.2026.10.11.22.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:10:40 -0700 (PDT)
Message-ID: <af295d6f-ed18-406d-adeb-f179ae3d0e74@suse.com>
Date: Mon, 12 Oct 2026 13:10:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: Publish the filecheck owner before adding sysfs
 attributes
To: Cen Zhang <zzzccc427@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 akpm@linux-foundation.org, ghe@suse.com, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
References: <pm-ocfs2-objects-candidate-0086-v2-646731c4254a02823b4d@gmail.com>
 <asnqJTe50D-EuhTb@p15>
 <CAFRLqsVqawLcZK60Wt2GKszXCeeJj6WNEO09zwybxO+mkOUBaw@mail.gmail.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <CAFRLqsVqawLcZK60Wt2GKszXCeeJj6WNEO09zwybxO+mkOUBaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/26 23:40, Cen Zhang wrote:
> Hi Heming,
> 
> Heming Zhao <heming.zhao@suse.com> 于2026年10月10日周六 15:38写道：
>>
>> setting to NULL is unnecessary, it becomes a harmless dangling pointer here.
>> Other code looks good to me.
>>
>> Thanks,
>> Heming
> 
> Thanks for reviewing this.
> 
> I checked the failure path again with the help of LLM, and I think clearing
> fs_fcheck is still needed on this baseline. If kobject_init_and_add()
> fails, the
> function puts the kobject and frees fcheck. Its caller in
> ocfs2_fill_super() then
> jumps to out_dismount, which calls ocfs2_dismount_volume() and, in turn,
> ocfs2_filecheck_remove_sysfs().
> 
> That last function returns early only when fs_fcheck is NULL. Leaving
> the dangling pointer would make it operate on the already-put kobject
> and access the freed fcheck in ocfs2_filecheck_sysfs_free().
> 
> I may still be missing something, but based on this path it seems the NULL
> assignment is still needed. Would you agree, or did I overlook a case where
> it is safe to leave it?
> 
> Thanks again for taking a look.
> 
> Best regards,
> Cen Zhang


Thanks for the info, I will add my reviewed-by tag.

- Heming
