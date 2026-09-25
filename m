Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED246C4D1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327840; cv=none; b=AaManAJb3C+gzX0e20GToOEr6RPjMJzAzAaSkpLlXOWHDGHrc/P7p1FPlKFFZpYYS4q1JVFC4YLsuClmffDwKzev6kTKYwmYpKvoCbSfqsZGcClD3XrOQBHI0xc/t4yMsEasMG36bll9EjU8dT3OlhRj/8BdriZOn/QDTyp9Irs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327840; c=relaxed/simple;
	bh=APreP2O6tYmZ0sgnofROIYS7faftnQh6nQ7b0OujIjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsXzj0kKRYbP5acjxC7VJUYycSO1JjhwuLZKnSqBXQAxegHEqecMfwB0oBRZqRz8sMsmAuDTqLh7g4wrwup14iQ5Sgp+oEArzkOnFfzxdHEit/f2bUSw7IzFi3FrsdJwhajjjAhRtO0FEXleXRofrGq0iXlJrh7jG8VCk+1xl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K8bx1wRg; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K8bx1wRg"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso229418f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790327837; x=1790932637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nnmbgx42B2WKMVnWZdimnYHvUD+KfWZiyEk99BwL/To=;
        b=K8bx1wRgFrG9JKkNzfaJDBH+IzlCkE/ysxF3AaKBrzK+U5qFmqB12KamMjuou/W81k
         Iq/th3bAa2fdxJSyP4iS17GbO0wXaSwOY0cfZ5SyXpPykzfa1OnKNSu8Gg3vdwat3fhe
         /XC7rClw084h2P74mKMnCoAl7uKIQ8nsoNp4fyAVB8nz9HUEY617baBLc8m+/vV9ckct
         Z9TgkDMJf39kQTeY9lR9WDjAxTcEqtdeF+ZaVZjmmqYDvzG0UXfUZ9a4NOlXU9v5FCGx
         D5+ncYJ8RWkQGwvEJiMhiQWNbw7exbTSfa/i5LDdr0D0A20Pmt8HCzsQQUZ9doVuU0G/
         QJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327837; x=1790932637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nnmbgx42B2WKMVnWZdimnYHvUD+KfWZiyEk99BwL/To=;
        b=BMELRhmzxpbnq0Szzrghj8lksI71noHSLte240BcEw/01KYFZUa1dEDz6+8Ek3J5VJ
         XU6/StPxI9ML58HSwY3HJVUS9KWcv93+F6RCzgILDDQtWC0Y6xa6L5pYJCm8HxYJ89n0
         uzS2AK6329HRybLfKHbDaI84mtnWZruVMGjlG2QJ+WcMRTq5yxhBJysWNUPE44YwlJDr
         unBpnQqhXLsQRM3U4IgBQ70LDaZOuCeFGZ2SnaXIrIOYYoEp8fzH8m444wzp+7Tfg9vz
         IubCawzmVD0kXHKA4f23lMOWGqpzh9rseZNGOxjWElvDyHoFaOeZfX3+sOGLUmKT+TyF
         V/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwtbN9EymJUHTnAbRjlaQdyZNniBlrrTF55632y3lHluqZZ53ElQeXcoh5+EaM68wmjQVX3mYBDwzA8MSY=@vger.kernel.org
X-Gm-Message-State: AFuF++mgPh3AjnbKp2XxERASKfOTUktnl/qGv3DL8INnyXmtpTVaOkkw
	XcM422xveSiS7oL0xppgdQ4geN67xt4vMUlvhHiEal47CNxcpn7S4QZ5/xfuiBqdsQQ=
X-Gm-Gg: AYBFou2LLOJhsvy241IaUB8QeAs09VpAgJ285DeT1IQxgnweX2sq08YId/QDx8Ru1En
	6pW5iJIlZltUJ3mc179WC72JzNOIhR2Z/gSRsEKKjsI55e4WsiGiOBYSQ9NtAlMg/Wx2lRPNGsc
	v/9ndMW8a+naKUz/TLvxqInLhdlSN6rKV1vkKwB+uSgr91HZH1yrGu/+PYq7ZlzwhmfodnCn7z6
	LrJ/mtHVGsbsnjngSooRsp+yYBT4ror/aStd8LoWYIX8fSqyMpGMAfbWDmVL87KsT8ZzKdO2NOB
	AcAhdV0eOjaVDpvfBtunFWwVlKnHPgBo5V62BWdN9AnZtjapoYnsEldkkuy5z4onr5hCkcS+++V
	voYELSOPwCVoilUlrTqs9J90HwmHx1iYWUmIekepRLO9U7/Im0T3mFnIrjSEdb0914AQ7Tci3N6
	+LDqLZdoV9IvddDz2lg8m1brQ+VOV1z5UAaKExYf2kn8rvWepOLWzpehwLus6NchKt36pW9BJ7M
	M5V541Wn/brsEW/j5qKX3PkR9Eb5Ty6rrM=
X-Received: by 2002:a5d:5d88:0:b0:487:c43:e577 with SMTP id ffacd0b85a97d-4887db0b3acmr2954651f8f.24.1790327837078;
        Fri, 25 Sep 2026 02:17:17 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5496772f8f.32.2026.09.25.02.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:17:16 -0700 (PDT)
Message-ID: <2452a9dc-4622-4de5-b58a-ea9e0a911387@suse.com>
Date: Fri, 25 Sep 2026 11:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Add stubs.c for CONFIG_MODULES=n
 module_put_and_kthread_exit()
To: bot+bpf-ci@kernel.org
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 ast@kernel.org, daniel@iogearbox.net, atomlin@atomlin.com,
 john.fastabend@gmail.com, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, andrii@kernel.org,
 martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
 mason@kernel.org, ihor.solodrai@linux.dev
References: <20260922-module-stubs-v1-1-abe465a24879@suse.com>
 <ee510141f44725527b6a2f60cae4323f26ecde36d3a592ba997648de45c80134@mail.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <ee510141f44725527b6a2f60cae4323f26ecde36d3a592ba997648de45c80134@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 4:16 PM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/module/stubs.c b/kernel/module/stubs.c
>> new file mode 100644
>> index 0000000000000..81e66c02260c8
>> --- /dev/null
>> +++ b/kernel/module/stubs.c
>> @@ -0,0 +1,11 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +#include <linux/kthread.h>
>> +#include <linux/module.h>
>> +#include "internal.h"
> 
> This isn't a bug, but does stubs.c need "internal.h" here, or would
> <linux/kthread.h> plus <linux/module.h> be enough?
> 
> kthread_exit() comes from <linux/kthread.h>, and struct module,
> __noreturn, and EXPORT_SYMBOL come from <linux/module.h>. The file
> doesn't appear to use anything that internal.h provides.
> 
> This makes stubs.c the only consumer of that header outside
> CONFIG_MODULES=y, which future internal.h changes would have to keep
> working.

Ack.

> 
>> +
>> +void __noreturn __module_put_and_kthread_exit(struct module *mod, long code)
>> +{
>> +	kthread_exit(code);
>> +}
>> +EXPORT_SYMBOL(__module_put_and_kthread_exit);
> 
> This isn't a bug, but since stubs.o only exists for CONFIG_MODULES=n, is
> the EXPORT_SYMBOL() reachable by any module, or can it be dropped?
> 
> No loadable module can resolve this export when CONFIG_MODULES=n. The
> macro still expands (producing an .export_symbol entry that
> COMMON_DISCARDS drops at link, plus __ADDRESSABLE()), so it's harmless
> but has no consumer.
> 
> kernel/time/posix-stubs.c, cited in the commit message as the model,
> exports nothing.

Ack.

I'll incorporate these two suggested cleanups in v2.

-- Petr
