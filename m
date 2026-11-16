Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832035;
	b=tTnDMBro5D68H4C47E0sN+taehwWh2A9HUQK2SlMjpysjV9BZ51i2TVV+0vpZ9j+Z6+E
	 OujZLSd6SWZfGOZOKc8J7k6SHyLzLPbPmvug6z9bQ5W4QK44ZUjxOFdaIlMUrx4KEVaKN
	 h4WYEDQshf7zn/9xVOeyt35gKUPz4pVYgMTNl01VG4TgvPygEOIUaF5rOEAA2tlJajfr9
	 GXuhLSbnjDjPYhaewAe/Y0o79xnyuQrHI93bYORAYTX43WMkejneBSrP0ZdziJqW9vcXA
	 w2ecTnVvGaOt91HD+2gOgRrwlYK70YEqXadPuAE4znQ0LBRtNlZpGis6aQ5+aPT8lXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832035;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M/OF7APoumABD9WbwERDFCvwADBJ4fBfCeOD/oHIzwM=;
	b=rviLzCjFHj85w9DxvoJz4laOD0XNxEweNvJlpif0hDze3M2CQ82HQNeO+xKSf67H/gx4
	 UX1LOroECViLW8FDo0zjMvmo5+NRWxMuJIvQ9izy0ahsHTyEBpQ7DW8bN02/ro+XN1rya
	 hLrW2gN5Z4R6IiDJ0u6+CUxpH64MYGQ6gGdlrF3UZ+rGaIVPON6CFTNFo1pOAHG89nHE4
	 gUACEbEK4K/IOfQz8zKStvHaqhaYcsxPfATzsQnumW/POHApjbqpqk1OEvahAnGSDzBkS
	 +knwOpF6kjTVHMNSUI8V9sRzQEzB0g9kg9M1LjExWzCZ7jssSigTS9hq8Un/vQ/ejUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M72DO2Kc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lwuO5k9f;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3466E606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3466E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M72DO2Kc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lwuO5k9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794832034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M/OF7APoumABD9WbwERDFCvwADBJ4fBfCeOD/oHIzwM=;
	b=M72DO2KcGxCq3SQ8gc204fLLtSijoDaKmAF5HtLH+MAettGLhzCpPxrQs0ZsB2eRxblaBo
	q9MdXGpXbqn3vSmgcH80P+oNYtjeC2Mo5ervsn17kircXQhIfMsQbCZxfAgL10mSC8vb+5
	5cTAg6eF0hLVIOH5POhWTvDphpecFDs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-82KGjIOeOw-XHnuyusR2nw-1; Mon, 16 Nov 2026 07:27:12 -0500
X-MC-Unique: 82KGjIOeOw-XHnuyusR2nw-1
X-Mimecast-MFC-AGG-ID: 82KGjIOeOw-XHnuyusR2nw_1794832031
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49166c8a60dso2394142f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794832031; x=1795436831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/OF7APoumABD9WbwERDFCvwADBJ4fBfCeOD/oHIzwM=;
        b=lwuO5k9fM/ydScCvwDLtibkASZf0EkRlxDoA6TkgxUF/ZAP0dJxGUVp5B4oEWFAlqP
         Jr+EDNAFqLX2FT7Ot/MhqMfVwIBjmeF5wTH/PONwnrNJmLlRFBkmyndmtEbQ6yL9nsjD
         UC//i0jn0bLIkTkcP3fBHpeqGZ+uuQw1w6i6ui5NVB07ZCxLlKmYva+ydwFNvM3G7sGG
         ItbdSnW3/pXrM6iTevL2YMYvnZvn13XvlI6C9EdCNQFDECmYk+HIZBX4IvYeEbuQ/DJO
         l48QAyU8o+uN3Alo8/yLLxxs5V4wPhQKhpznYTQe5fzEB/fw6a+/2ZQs3qy5JMZxAvCl
         A8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832031; x=1795436831;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/OF7APoumABD9WbwERDFCvwADBJ4fBfCeOD/oHIzwM=;
        b=IAc0KchxQHusZDHxwHwUvyTrsGsI9OrrZvzInyH1COOf/kDgOLJVdzSH9dsSPPFenH
         dUVxMjbWfJcfcSTATkVIZKFIYCCBCzF916qBgj2216HNpNknryELgnANoVxuTor0OzMz
         AryCoO0MXsaB7SCixdu8Dq4z63wWzq22BD1TwWsArlc2TF+mE1PwLFZN6+ZBuguQxaC5
         4FgmOoAb/2ppKZeZzugc51yYSFRFugHU/TfYQaxeCqcm88aTONSiN8k3N4YfCGAJpWyJ
         Bqnhyq7wGxAfe2smX+wdoEwJH1iWITFPwfrJjtN0GXQS7/mFk/9NWc1jMEzQCvgaoCAF
         NwQw==
X-Forwarded-Encrypted: i=1; AL+hErHqyu/xQS18EnL9sV8eerNjbYS/GRCdQXgKcXTzyVHcRBzHpXoU1i6MHUefzUsFGrNEHW01KX6sv05iA14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Is+pRgNHlIvsozdlgAbypG59SLHn3Gg11zh39h7yWYrDAe0VP
	HNlPW9PmV6tdHZeq8IM2tpZgdej2Fk3fZ6+o085sRrbQ+L4YQhJPhOWNm46mini3hsT4qzWD462
	DiABqyG5k4e4d5sk8P3VvDP32adZuwdy2qpWL+MxMHU5e22flcsIkFlbGJs+n9hk4xg==
X-Gm-Gg: AYBFou2Frn9nCKFLb4iB1m+gumJcHqunqHlH8gDzox1MDwzQq+Ho3Hvg3IlgHQ6XNEv
	nZgjVAFuNt8wQzfptug+DBC0l5bUO6/qPwobfm4M+rxm8xYs+bxtAkFdzmREl2MBlpF2/zby5xe
	YL/YWv25GVi58gm38xBH9E7zzZ3O+e0SibBMUzLvoERTeA1WuLdwd13Hmoo9Z93zDXuFj+bIaTr
	zCsCQzmtXkBsYhp3o6o3mtIb6l9yW/SmfRK13sUGaLBqp3oic3Z49uAOyZ3ktamOsSBDbMaxqOK
	aryN1OhIQ7ayCzOFHIlyfpeuNduRw2UEknNda1WWn2T92CqbwVc8kAclacS1+T82KytP0QtbQL/
	R297murr0n/Hk+zJoxexlIhhUS0F5bgGvHFpC91Pszdz+
X-Received: by 2002:a05:600c:3496:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb6de43047mr75923865e9.20.1794832031444;
        Mon, 16 Nov 2026 04:27:11 -0800 (PST)
X-Received: by 2002:a05:600c:3496:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb6de43047mr75923195e9.20.1794832030971;
        Mon, 16 Nov 2026 04:27:10 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm169923545e9.10.2026.11.16.04.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:27:10 -0800 (PST)
Message-ID: <562b9015-6967-4858-8f17-a49978b30f2a@redhat.com>
Date: Mon, 16 Nov 2026 13:27:08 +0100
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
Subject: Re: [PATCH] selftests/powerpc: Fix set-but-not-used errors with GCC
 v16.2
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Shuah Khan <shuah@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20261116103710.674746-1-thuth@redhat.com>
 <b2abcfcd-2d89-44a3-ac03-7354c3be2436@kernel.org>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <b2abcfcd-2d89-44a3-ac03-7354c3be2436@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.11.26 um 12:07 schrieb Christophe Leroy (CS GROUP):
> 
> 
> Le 16/11/2026 à 11:37, Thomas Huth a écrit :
>> When compiling the powerpc selftests with GCC v16.2, the compilation
>> fails with:
>>
>>   ../pmu/lib.c: In function ‘eat_cpu_child’:
>>   ../pmu/lib.c:86:22: error: variable ‘i’ set but not used [- 
>> Werror=unused-but-set-variable=]
>>      86 |         volatile int i = 0;
>>         |                      ^
>>
>> and:
>>
>>   ebb.c: In function ‘ebb_child’:
>>   ebb.c:352:18: error: variable ‘val’ set but not used [-Werror=unused- 
>> but-set-variable=]
>>     352 |         uint64_t val;
>>         |                  ^~~
>>   cc1: all warnings being treated as errors
>>
>> Add some "asm volatile" statements here to make to mark the variables
>> as used and to avoid that the compiler might optimize the code away.
> 
> This looks really uggly, a cleaner way is likely possible, see below
> 
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tools/testing/selftests/powerpc/pmu/ebb/ebb.c | 1 +
>>   tools/testing/selftests/powerpc/pmu/lib.c     | 5 ++++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/ 
>> testing/selftests/powerpc/pmu/ebb/ebb.c
>> index 21537d6eb6b7d..f4ef92bacd9ab 100644
>> --- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
>> +++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
>> @@ -391,6 +391,7 @@ int ebb_child(union pipe read_pipe, union pipe 
>> write_pipe)
>>           val  = mfspr(SPRN_MMCRA);
>>           val |= mfspr(SPRN_MMCR2);
>>           val |= mfspr(SPRN_MMCR0);
>> +        asm volatile("" :: "r"(val) : "memory");
> 
> If val is not used, why not just do:
> 
>          mfspr(SPRN_MMCRA);
>          mfspr(SPRN_MMCR2);
>          mfspr(SPRN_MMCR0);
> 
> mfspr() is already an 'asm volatile' so it will be executed even if the 
> result is not used.

Ok, agreed, that makes sense.

>>       }
>>       ebb_global_disable();
>> diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/ 
>> selftests/powerpc/pmu/lib.c
>> index 3213579874084..32cafd40d2c56 100644
>> --- a/tools/testing/selftests/powerpc/pmu/lib.c
>> +++ b/tools/testing/selftests/powerpc/pmu/lib.c
>> @@ -95,7 +95,10 @@ static int eat_cpu_child(union pipe read_pipe, union 
>> pipe write_pipe)
>>       wait_for_parent(read_pipe);
>>       /* Soak up cpu forever */
>> -    while (1) i++;
>> +    while (1) {
>> +        i++;
>> +        asm volatile("" :: "r"(i) : "memory");
>> +    }
> 
> If 'i' is not used, why keep it ?
> 
> Just do
> 
>      while (1)
>          ;
I assume the original intention was to make the CPU do something beside a 
"branch to self" instruction ... ? Not sure whether it makes a difference 
for these pmu tests, though?

  Thomas

