Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324293;
	b=Lcb2CivqufIQ+mrdzAX1cKXExVrAPXkDYcwYiGtMAQNnGc1Oi2qs3b7UJODudU2XoM4y
	 2MKwHhcEFxeATE8g0KzcT41benYmOBmp6xbDtwljR3vE2Ee+/xxRknYirBmHAkFPzTc7W
	 xdA+Zyklv8I0/4G9btzZeRLLzEKxhipW7fYhSSElRVC5vuBT4SUdrwLsn5S7QXhqlpuBJ
	 FsBZsXYMNUbeDEmD7C5gURMxsf9omjAWkoXEFkwCBEQxIjAIWrzDxJOkK7jDMg799pUBe
	 F0ItCVNbBtjfWPi4liypK9SVZMKix6oLBgTUR9Vrfdj/W6uUei5+QZ1up4M1/bGk+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=yZ/2fkbURm/euOen6SmjaXi4JzbG61hpQmv47R3Y1cU=;
	b=R+FY0Ahc6evGAwn3YxK4dowROHNqf3jghPvh74u6pFB2K9DqwE4LPURyMu+Qeim2Qsmf
	 vhZa44xv+apdDdIwWDUtD/JGHzkkhDU9a+oxLpX3zFivpbSpILnX5f0O/G6JRIc57KsuB
	 ie1/wbW1297Tpf2ru440du4PSIpx4Fmnt6W4samxw9U+tVURwbOG/lR9CRGNqH82f+m38
	 YkVVcBfrRQSb05AokD6PcT1U3PJQPnE8vbFBXAEF4X6V+DgqzJAqLC088WAFge4oAAfTM
	 B0+NyT8HvMpwYyNj2cHvshOKpYcoM7ZX//zoV2rYPD64mhEnyFHFipTpOmD/pQAMfug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIbquhxE;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08025606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08025606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIbquhxE
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso3857813eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324292; x=1794929092; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yZ/2fkbURm/euOen6SmjaXi4JzbG61hpQmv47R3Y1cU=;
        b=hIbquhxEkjYMPsVz8qelnd9+2n8FrE0VkBWcEuN0bKxl3ckeU6phVqvgQnOss2yQ1L
         iwZ3cuA91Lvd4w725syaiPnMIIpApk9nfoHlMhlDtWUsV5mZMwxn18NlT0E1igWDJ035
         qIGX9b9Mm9e3m5kMX5C9WTBwSkAvm/nQ2r/MJlQCDXtaYZ/TxI9lUTazipx6FewutQ0X
         X5ztl5782mP0xeL6OLKEDfVPgwy+s81H8wrYKOKkK7gdSHjrAgDoj+4+GYaeRJES3XzH
         f5pVZpfoKbkLE0Cefvzd1PxHPKD6k4b1X1e1zjjZyhZ4tf16xPVU0HFwNVHOEGlYsyRU
         7b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324292; x=1794929092;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZ/2fkbURm/euOen6SmjaXi4JzbG61hpQmv47R3Y1cU=;
        b=zqVkje1ftQdV0iGQowaNuNfwM3D9YZFV2lLdZtGYtHWNLzZ8yvhs8SH8z3hBAYFIxO
         SHUmXfPLMQ1/l3vxUP04/iweFd+6Gk9jFdnzo3Bx2/KWs6DuA480WhjE1rKeMJOFNYQd
         P+zlMjvGZs31QKmtySZ6f8vU4ei/zUwA7vc6SsAq4t74BdMdcpxFw0obvngRjiy8W7P0
         tAgBygcsX5YrHFsKLJj5AAj0Kw0vf30u2pFRUy2fy/rQ3218Rvw0o3Wn5b+ndSoGfyt2
         1cB6UK5WViqZsg6xJGlUEdaZVPk3zI9JSrGHmTUMUreu2hhH3/Rc5IJVfqBiMpw7auqe
         cz+w==
X-Forwarded-Encrypted: i=1; AL+hErHzOMil2aFyRM7Aqs5ThFcAqziRVzBjIz8/MFsI04abI+kpQ41M4PyVq7mQHJpCgm0GlCYacTh28iRUY64=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F6iAYhVDG9/dcGMIa6v3J2vODYezl2OsuoJc78dkPIvdcRVNF
	hOgi1jU4XC51i2SMJnQ9tLBDmmPTlElczpHjEMrG33XO7H9sHeaeByDKJWneXJQB
X-Gm-Gg: AYBFou3kPDuo0gKgyuYHJAkut1C7cNYbQPOR0+dV5XdMrculeS1YpPFofVZFNxl8r9b
	T9d4zid3+mo4NJJ5FyglFreT7YFsSoVaP7BVRjzO1//lTE4crSou9uqdXl9sHYGI9r8NoaBkSSR
	I7famuAbrOQVA7++/WsFTwHIoc64VbcvPxUdsBDBUO2hCyl5CI7OHjHYeujIq0WThEaJ+/TQiGo
	ZdBwrl1Fq4aOn5LZMRxljU5W9ZWi0GzG67cICFrde2ZUO/YBdOI3UbwSXx4UPJSof1b4ZsebLcM
	K8YNZ2Mbvih/JF2uCYA5TaXBOcpHeHvxzxRz7fcH50JmQRYixWaI+9crzJmg6DSYhKhzC+VUmQU
	xwTlC1qDiuxhUZtGDx+D21G1wX+v97gsmhgJisGCQZNw5Ikum2FYSE9ix2I0kUE5TfzOQsbmIxz
	1W2mZ67nVjmXx+75J7vZSSrr6Shn+fCJ6XImop36z6w/yuBkjfo5ceZZRqTi/PxL8YFSnOf963x
	6XQwjULfCId9YRdoV98qqBn/CEPtNrzIzjoB91F5S+GZUAhHbBpm/GvFNgZRj/ErP0IQ2LeurgC
	s3q8uBHg3dEKaV3du9ofwhLjHE0M
X-Received: by 2002:a05:7301:430c:b0:36a:2382:7dab with SMTP id 5a478bee46e88-3751eb8b08cmr3765547eec.6.1794324290885;
        Tue, 10 Nov 2026 07:24:50 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm16241137eec.23.2026.11.10.07.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:24:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/smp: Handle missing ibm,thread-groups in parse_thread_groups()
In-Reply-To: <e6b47bd5-425d-4c8e-8c68-5a36d47bd977@linux.ibm.com>
Date: Tue, 10 Nov 2026 20:53:37 +0530
Message-ID: <o6bw90cm.ritesh.list@gmail.com>
References: <39282c731de90f47678952e471236ef22e9d4b15.1794317777.git.ritesh.list@gmail.com> <e6b47bd5-425d-4c8e-8c68-5a36d47bd977@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Hi Ritesh,
>
> +cc nathan, Kees,
>
> On 11/10/26 7:13 PM, Ritesh Harjani (IBM) wrote:
>> Power systems can have ibm,thread-groups properly absent like in one of
>> the PowerNV Power9 boxes where there was a warning splat reported on
>> 7.4-rc2:
>> 
>>    WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x174/0x1a0, CPU#124: swapper/124/1
>>    ...
>>    Call Trace:
>>     __kmalloc_noprof+0x490/0x690
>>     _kzalloc_noprof.constprop.0+0x1c/0x7c
>>     init_thread_group_cache_map+0xd0/0x2d4
>>     smp_prepare_cpus+0x2bc/0x484
>>     kernel_init_freeable+0x168/0x3c4
>>     kernel_init+0x34/0x1ac
>> 
>> This happens because today we don't check for whether the properly is
>> present or not and directly pass the return value of
>> of_property_count_u32_elems(), to the allocator.
>> 
>> This went unnoticed because earlier kcalloc() caught the overflow due to
>> check_mul_overflow() check and returned NULL.
>> But since commit 0af298e62e5c ("treewide: refresh kmalloc_obj()
>> conversions") switched this call to kzalloc_objs(), size_mul() saturates
>> the size to SIZE_MAX instead and we now get a warning at boot.
>> 
>> Bail out early if the property is missing or empty. Follow the return
>> value as documented in kernel doc of parse_thread_groups() function.
>> 
>> Fixes: 790a1662d3a2 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
>> Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/kernel/smp.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index 7a25eaa59e62..9a0f63e43821 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -824,6 +824,10 @@ static int parse_thread_groups(struct device_node *dn,
>>   	int i = 0;
>> 
>>   	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>> +	if (count < 0)
>> +		return count;
>> +	if (!count)
>> +		return -ENODATA;
>
> This zero count check is not necessary.
>

yes, not strictly necessary, but good to have. 

>>   	thread_group_array = kzalloc_objs(u32, count);
>>   	if (!thread_group_array)
>>   		return -ENOMEM;
>> --
>> 2.39.5
>> 
>
> Nathan reported the same issue on QEMU.The same symptoms.
>
> https://lore.kernel.org/all/20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org/

I didn't notice this. Thanks for pointing it out. In that case let's drop
this patch.

-ritesh
