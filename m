Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B724A2601
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050971; cv=none; b=WD7ziBZrp+U66BlhUT5KMIrvmHiKDQQH9ycoj7PtDl67YOPfKaUlHlPC+cLCNKNlZhUJbJKE5eNGagJhrbAe07zz4vSCFb/JKQDiN91ITernIh9tC0aBVhUvYWqVpLqliys4Hz/6Q9E3KSEJt3dTg42Grw+gjFk/HvRsWlyJYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050971; c=relaxed/simple;
	bh=C519sVSPJfsNUw48D24+ejPOXQ7FspwzLtOYq5ZLgBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLrPXW8v7zo43xUFJYPUqeuRV2YZyZ4YyA1lU95fw0RmzxtiufZwCdzl2J4gzXwjxlmxCTeI7595Ah6VEn8ICPKqat1ijDwtcBkvBuZoStrMoTPx4GLT/j7SKD1Eyd2ZIDUWGQ/n6oBnHQmsBmKLiwCp60ww0wfOOWlfU8vcXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzyHE5Qz; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzyHE5Qz"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1b3d7f10eso5093153eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050968; x=1789655768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sZUs35JrSr8EiZKEgDZvUwYD31+8yR5UTcOb/ueQ2Do=;
        b=IzyHE5Qz5IEAsYGgSVggZNmoEf/+IZab8VLhYZuMnHVLAgNb5N2AXjqgeaKQvbOLcY
         YVJBrCMuT+JlVgn0KcpOawjAIiKphOYMjDrzvZshKt5UgB5ZtguaE/ff524IaWT9I3/k
         6psKB6G9sAsF7f0qr52TupgnSONPBCN2EpRieHRRlQsDmjE4XEhW06AsqjBOBVM3469F
         PBc80+Q6YswayDD8j22nVztgSa1iftjOu+MiCzDSHEmNS8j2ZbM/uQEWy2jgQQ1FAlsN
         XnFGWCOYlZK9StFuUsQrrxyyNiKSjTd9w7tBuVWqR6vyyqnc5uMpsHBKnzqMDFBjavk9
         Ufbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050968; x=1789655768;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZUs35JrSr8EiZKEgDZvUwYD31+8yR5UTcOb/ueQ2Do=;
        b=l70fqeV8Zij7G/0I9oS253MvWzXMGgkKhsPRvrptdc6cexyXXRG34blBKNH8PWcY6p
         0qv408/0pDudWjLTQRdtm9INbUwk/k4zWwaHWY082kja4XX9pCOCsrymZZU/x1rzUkNV
         SFj49fORRopRmgkiY08HFrbwk5jTSj8xrs3UtR79XN+WnGh87XWstk6AidX58wI1jQXA
         ahnBOYIaZp7biC5Fol3F712VGyF2G2qJhg1yXoisbFLeY34vrR6h1XF5T+iqSQXMqjjp
         Cfqyncx/FHgSerwndvnm2FOGfDIwYh87mXhVWi/jDQAEAikI4J6bOAVXxpBp0TRtefxp
         VzrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ72V/QknRv8JVa+tJNqhldWHUQPdsh9i+ETvOlJMzw10uG75P/y6qQRBplYEx/EiTzpP4rDHSOcNcby4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/fU+KkPClJE62mHn5Q6MBf4Tb6MbyLK4xrml1qC9uqjkxnJcX
	wrXeOz/prqm6oByzHZl4wfUMATxVoxmHRYAJyyQa/29E/zKPX64CXW7J
X-Gm-Gg: AYBFou1LPz8QKWaqO3lYoM2LuExfCIw+qbONuiAw+66I2PS0fb0gQ7rZVBXyYwOiVHQ
	qk75NCyz+7LycXXCMAyFD8xHy2oki7bpWnrslS3394qYMrgOqQ0A60N1PEYqAkvOHx/t1aaeM8d
	+34Bj5IllcfLUEodLMudzBcv6Mz4OkL2WZKSYmgFwU3kZlLyQxpIW5SFMLAV2Fn/qzcGlt6raBl
	tW2gjEyctZHt8PnsEMuanIjbkgOlTMTQZFkejRS13FG4zI8jM1GEI0mhA7eGnk8JWO2vguEmzrf
	PZz6V74P0SqESxxlavUPSQMlarA9W6ufzCi9u99Kypg01BrgBxt7C4MGMZlXfGB4N1Nfe8EnYI7
	8r2XkNtT3K5ZKJIpTCMwPR1TxBCvo0nE/yJgrB1M5rZyruroRcLS/Gfv/Zoe36hD0v5LC+V+0GB
	pzTCIe10OEou8yj2jGzVP19iYJ7WzdrsxYiPzILE0rK3CKBlYCJLHwnE4d7l4dzR/Hmp0gu819J
	kZx7My5OuSsPsJhs80=
X-Received: by 2002:a05:6820:2212:b0:6b7:8415:d77f with SMTP id 006d021491bc7-6b78415d8a4mr23181127eaf.42.1789050967825;
        Thu, 10 Sep 2026 07:36:07 -0700 (PDT)
Received: from [10.255.206.241] ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6d93df1easm18058555eaf.1.2026.09.10.07.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:36:07 -0700 (PDT)
Message-ID: <95f672f6-21fc-4bfe-b629-fc4b88b145b5@gmail.com>
Date: Thu, 10 Sep 2026 22:35:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogWz8/Pz9dIFJlOiBbUEFUQ0hdIEtWTTogaXJxY2hp?=
 =?UTF-8?Q?p=3A_allocate_routing_entries_in_chunks?=
To: "Li,Rongqing" <lirongqing@baidu.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yanfei Xu <yanfei.xu@bytedance.com>
References: <20260908120133.2381-1-lirongqing@baidu.com>
 <aqH6YcHWk_GmJlqF@google.com> <7d6d2449013a4435b71148177820e26d@baidu.com>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <7d6d2449013a4435b71148177820e26d@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/10 11:26, Li,Rongqing wrote:
> 
> 
>> Please look at Yanfei's series and help come to an agreement on how best to fix
>> this.  I am trying to get to Yanfei's series, and normally would take a close look
>> at both, but I am extremely short on cycles at the moment.
>>
>> https://lore.kernel.org/all/20260525035242.107264-1-yanfei.xu@bytedance.
>> com
>>
> Hi Sean,
> 
> Thanks for pointing me to Yanfei's series. I agree that both approaches
> aim to reduce the allocation overhead in KVM_SET_GSI_ROUTING().
> 
> One main concern with using kvalloc() for the entire routing entry array is
> that, under severe memory fragmentation, it may fall back to vmalloc().
> The vmalloc() path can have relatively high and less predictable overhead,
> especially when routing tables are updated frequently when guest OS is
> running irqbalance.
Hi Rongqing,

You are right, fallbacking to vmalloc is not friendly to frequently
updating senarios. I assume Sean also noticed that and suggested to
introduce the patch2 at v2. It could avoid to allocate memory when
the rounded size of total entries is same with previous cached
allocation. I think irqblance could benefit from patch2.

Regards,
Yanfei

> 
> Thanks
> [Li,Rongqing]

