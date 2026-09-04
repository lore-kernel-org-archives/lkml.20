Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12538E8BB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536210; cv=none; b=EY47KPb+7yi67eGb1DVUhznLzPQiyGIyZ81vUGCgXsYqdx1ttdLn3VREhcGSMNGhVu3PTDY90NzsuBXuSg+l04F8KRL5LlEeDMhL5aFimQAATCr/4tVFxvTplc6wUnZdaYSSoXGxrGM+XuOvTTTdDiL2onWU2Bq26ykbQySXoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536210; c=relaxed/simple;
	bh=aaZIP2ylDVjQUtzurgdQ9wq0pNSQxBzXiVQVyeKHPJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv3SLzogo9UozGOnVMYNDN7VDHIH1l15a8rVO+PX+U3AefvQd8ocgLn5vqp/UuUv9ztL1UUH5Ia8jV4GRksNpA2J+NmNTUEYWAfd0naN5eAKziOM48b7g0MvuaKFxNPXQnocR51lmyiwl0FbvZvRdd7vQVpwwH1PVaEJgrMmMCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CqyFV6Xe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CqyFV6Xe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843f205a5bso768409f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788536206; x=1789141006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsB/pfsHs0wy5wl2WAyEdIegLrat6VbBoQVukEgDfgo=;
        b=CqyFV6XeE2iPSCzk6+O/m23NWilPd2Smy+mM2MKJ5ZJWNCGy54GcaJto9wt+h9Mg8n
         zYoTDai2HA42UhptJ+knw9JM5TZXUkRdv8eyad9XFN9zBdYjEsMmrdO51edXk+UKSVUx
         hMDtEu2ArAwarUPEH3Ve3+hXGXb6XB1vZsb6/cveP6PAMaybbCtMVLK3FZSkbhiEoTVw
         dlnOhQ7asxq3bNB7o2Z6PmCdS7iHz38dHteLsP0sXlph/NvJq18khoP6ATmpl6NuvSNG
         +M1GPP1///TqT5k1boTtZGpiXmg3t7iZaagIQ+EmYH8le0CiFCwetKAAfg+o7CKA65x1
         keug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536206; x=1789141006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsB/pfsHs0wy5wl2WAyEdIegLrat6VbBoQVukEgDfgo=;
        b=q0xQfs5z9DecE+u5RDzdxyTPOGpripDl4LeQ793AomOt3pb9rLte4/hxAdM5a0NHex
         ucE/wfoZpunlgMM91tQKPGPH5pkZvIIIiVCRLeiHeCTDrafDgC0uMP3kabMalq4IKE0E
         ErXXsjX5ts9S1B+JsrNN9G/ByHPXac/0wncDnsCXF9IjJk3mrBQ2tRLYmR4/7FYrgyF1
         ltdh/uK/1WDT1GjTL0FLxSyBjIupMC4hxSVnd2x3CEZbNB8pCBRMtPZWWNTeySPnymJe
         EFLuOw3iZmHUM5119gPYI6M/8VnITukFXwWqeIrcBxytOJkqt67K2ORuliOQzDK2LGW1
         P4+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZqjO9oDKaAPjPNODflXALPbMRCRCExPQ6cmWc7Hqka1D9sC3lPP7Sy1oGWjfPbVHXS07ttBPXRsF7V7U=@vger.kernel.org
X-Gm-Message-State: AFuF++m5AYF9Q92NQHyNYFlZ4oY6oyPq9hGwOKCOien7wGDRhNGOwS7U
	YrPE9aTQhB1ONGCY8tTXIkq6dRNdiXIzRGRJTLw186qnMghiDJa7qIJRhSA8WVkf6Fg=
X-Gm-Gg: AYBFou3LV+RR1eLlsAwf/cXb34SL+B4ZUzb3PZZ6R+AZiLgtfSR0V0ZZASWmTtwM19/
	itQNC433uOG5cvhxTaMyXma/QjQFFvUtkRmCXm0nzz9Du+cHdf126aXE07ZpdIgHaebwd5Aso/h
	CDRAmA54+rvqlcP8Ks4/lDbnVj+UOeKBUNS3dc8GHa3aJxm8YYmnNNqipZm6kY/tMLcjmFMtUtO
	w9nFqkHhEsm7k84jLn8FIvf9CXJcWI2inQw8jf/pQIFBRsJ2I+bP51aLvdkzj0luOHgGqBpLrAl
	C4/QaRN31WyIvLjd+/yR+LJsq6QOLUyU7UrBHHAceBr1AUGk7qEPDSPmlfmFLnaAnl1ZSRDxts+
	lJOu1DXMWKmyzq8E3LS4vEX+05f4VUOI17cJ1u/0ZbP3F1rhuI/0lgZ9RksanEuuvSy2owfo3SO
	1SpOVUTKGiu+GH0eZ4hZkDX4/kogPTYFJW3+ddSuJZV1tVRLt8F8P9jlOV3DWurAeBbPLZufwNV
	nLFIfcexgSdYkty1Wb+8Rhi49CbHGatqa9Bwg==
X-Received: by 2002:a05:6000:1863:b0:482:e6b5:61c with SMTP id ffacd0b85a97d-48587098310mr9747937f8f.8.1788536206395;
        Fri, 04 Sep 2026 08:36:46 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm7833177f8f.25.2026.09.04.08.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:36:46 -0700 (PDT)
Message-ID: <33487133-b587-42f8-9716-b0bbe2f1511b@suse.com>
Date: Fri, 4 Sep 2026 17:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] module: pull out add_taint_module() to be public
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20260904-bind_taint-v3-0-30025465f38a@linuxfoundation.org>
 <20260904-bind_taint-v3-1-30025465f38a@linuxfoundation.org>
 <a79a6a06-cc48-4036-882d-95e9b4cc01cf@suse.com>
 <2026090432-outlying-glitch-9295@gregkh>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2026090432-outlying-glitch-9295@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 2:19 PM, Greg Kroah-Hartman wrote:
> On Fri, Sep 04, 2026 at 11:25:01AM +0200, Petr Pavlu wrote:
>> On 9/4/26 7:10 AM, Greg Kroah-Hartman wrote:
>>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>>> index d0e1e0bd2ad0..444d990c9983 100644
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -191,11 +191,21 @@ static inline int strong_try_module_get(struct module *mod)
>>>  		return -ENOENT;
>>>  }
>>>  
>>> -static inline void add_taint_module(struct module *mod, unsigned flag,
>>> -				    enum lockdep_ok lockdep_ok)
>>> +/**
>>> + * add_taint_module: add a taint flag if not already set for a specific module
>>> + * @mod: pointer to the module that caused the problem
>>> + * @flag: one of the TAINT_* constants.
>>> + * @lockdep_ok: whether lock debugging is still OK.
>>> + *
>>> + * If something bad has gone wrong, you'll want @lockdebug_ok = false, but for
>>> + * some noteworthy-but-not-corrupting cases, it can be set to true.
>>
>> Nit: The final paragraph is mostly copied from the description of
>> add_taint() but I don't think it is quite right. The parameter name
>> should be lockdep_ok, not lockdebug_ok and the values are
>> LOCKDEP_STILL_OK / LOCKDEP_NOW_UNRELIABLE, not true / false.
>>
>> I suggest updating this part for both add_taint() and add_taint_module()
>> to something like:
>>
>>  * Use @lockdep_ok = LOCKDEP_NOW_UNRELIABLE if something serious has gone wrong.
>>  * For noteworthy but non-corrupting cases, use LOCKDEP_STILL_OK instead.
> 
> How about I add another patch to the series that fixes up the
> documentation for both functions?  They both should be fixed up and I
> might as well get them in sync properly.

Makes sense to me.

-- 
Thanks,
Petr
