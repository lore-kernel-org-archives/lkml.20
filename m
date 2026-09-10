Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1947254B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039537; cv=none; b=S3q9Yw1A099WSXAb8eQGAsH19xx+1rcUefGdZosrTs1pg2+6YuFoNcVKcwMAfQNXyShc1+07/iUBEI11f768WR8PR2XGKjCvjfB+op8nZ7hqL0tbYu0DzWV3E+q5Z8zTOcOGkuhEOTZekMol43gdu4u1ilpz4UWBb/9OjUzQ2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039537; c=relaxed/simple;
	bh=ILhGSUejk/Y4nvVR24zvebnkW/PDZEdcYpseEDu6kDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS4R06rzlx3KXDJbMeF/j5XE3PUBSu6dAvpazDa+6u5BDuayuO+PccJKpAwQA3x9jeJMIym4VBNlLl9Mx3gw9c0m9bpcF7gcVLoESiUnRcbql7vEhAfakvfyhQQCoU3SrGN1I8wWU+axwjzyyqw+1nzMgBI6dgytuW/VNTjYs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa81zODM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa81zODM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso9215585e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039534; x=1789644334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpU/A1KL3cFEe1xLZy5hIfTjvoDOGfu4pjwD6ajzN3s=;
        b=Fa81zODMjFWmNH97l5eGF0TaDlKGcrox9KNZ9W7aT44tWi4zN65HPrzHVm6uMT0IxL
         hWQvPOS9KE2xHHfHGkWB8EkN5FsoZ1YrIJ0NE+TaXFvdCF6zOEl8xpCCRLPulXcCuUqo
         Vnuzip6sL0cSIHZxnmp3liX9dRy78A0LPSl181d7dgtYyH4RFp2TSXB2+cWQgCMAqmkI
         JxTmbEf0uwRhKdghKR7QW/MD+1PdN9BUBpMi4jZ7qmFn+FtqYVN14QHoN8f+nFx9rZ0l
         m49Wy+2LrXkFizlirLyKNTh6q8ndc+aTlqSLe+vki6xkXZG5LvBNmg95qOXdPczaQvpF
         BcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039534; x=1789644334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JpU/A1KL3cFEe1xLZy5hIfTjvoDOGfu4pjwD6ajzN3s=;
        b=PKu03hTTrnjPgvfc/RNyEXaZQsFHORpLMk94dRnJEI3Qf/9/Ce3WTP6yOyykEzpOZE
         9XEukgPwGBhNRI99+f86/OIKJZqwEeh3GuGRkwzNoVZUp5jK0dEoxivGYo9dB7iGg5VR
         bAtkofEtWGJBRuZK0JSMWds/qodkbY0LhcOLkcxGb0ggdeu3eQzAF8D+kWQaxeMeWHz+
         3Zu2iHH2JPd86uLKEumJiW8/ynu/a/6YvwzQu/zY3lvVizHVTJoxDodbQScVI7ApYwt+
         as+aS589HHSgVoPjYH5KVGkHGCr54uX1r3Yw9+mauOwMuiixUGJaPhWvYYW/RrbnLc5n
         /ptw==
X-Forwarded-Encrypted: i=1; AKwUvBxETg8mfiQlbrjHVl8hbcLp2eD6iQljmBd+C/JujVMHQ4uZC14KU5jg9iucYf6I6ZI+Cr6IK2FWXtXM5nk=@vger.kernel.org
X-Gm-Message-State: AFuF++n3byjbFDv9rgEvQ69uQq+2Aw7dRbUw/v4dfzramADuXGEm/h/2
	O15smpJXXC2BLmb3btyXUhzOLbtquQ+E1eVg3yTkZeC6FAfp5GQ89I38MRMkcvZB
X-Gm-Gg: AYBFou0kusLdhaiz6DoUdXflNiGyyBiNxugSznOMvQT9WRreIinAvyNR6Ilcs0ccy9Y
	nGm7ETnacB7dnZQDqPjJj4RSpgEWUo9055L77VbkBDxL2KVLyNsltuG/1P84/h/b3fL6ocS9wLF
	ML3mKcn3h1kJfnJJPyxG+PucbWlVTs6ZMcoD0C1MsHSlskzXHzYNotrKDtWYIYuja+fje/yqP1B
	q13pca/wNKI86Uxp5jKQIg+Dgk9U8Df4EDFCT17l9pS4fk9HkB+YcT0amCcgaKVlr+ywUI0Z7ui
	5tKYy0Ug5tq0mqedmn4aYjoyYZ0wydhwQWefqJb3s7NL4c5f3I5+vItV4KVKd8KQjiGcWgpGjTf
	cqEx7n8SLx6+jty4XaTHtW8aY+F5PlEmpcXN0xJycSEwJzutp/vYdjQx5tWmKcKEUqKCgzroXN8
	LDKBzDORuJzvxgy0KFpbuxQ2iQjGUNNCewoJp3e3Cp3bnvjku6vEOsyCEk9afJPRL36kxT8gpSg
	FNfUcwGZ7ZYD5vHIVjqrysd2f3uZfuG9LcIPRl/kkimhqm4SM/JldKKUkeUX2iFKCo=
X-Received: by 2002:a05:600c:a315:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49d258cefc8mr110707615e9.3.1789039534000;
        Thu, 10 Sep 2026 04:25:34 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdb789sm78149765e9.1.2026.09.10.04.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 04:25:33 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <71d40a5d-21a7-47ae-aa18-34f640a08779@gmail.com>
Date: Thu, 10 Sep 2026 12:25:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jacmet@uclibc.org,
 yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a6171a9b-de34-45c2-90a3-4e5bc185e700@gmail.com>
 <20260910091322.4-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260910091322.4-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 10:13, Dmitrii Tulnov wrote:
> Hi Julian,
> 
> Thanks for the review. I've addressed your comments locally for v3.
> Before sending it, I'd like to clarify how the new warning should
> interact with KCONFIG_WERROR.
> 
> With KCONFIG_PROBABILITY=50% and KCONFIG_WERROR=1, v2 and my current
> v3 still exit successfully and write .config. The warning is printed
> directly and does not go through the existing warning/error handling.
> 
> Would you prefer it to become an error when KCONFIG_WERROR is set,
> while remaining a warning otherwise, or to stay non-fatal even in
> that mode during the compatibility period? I'd lean toward honoring
> the explicit strict mode.

Yes, better to support it. Thanks!
> 
> For the compatibility tests, I propose comparing the generated
> configurations for 50% versus 50:0:0 and -0 versus 0 with the same
> seed, and checking that the malformed input produces exactly one
> warning. That would put checks for the preserved interpretation in
> the submitted tests, in addition to the local comparisons I've run.
> Does that sound appropriate for this patch?
> 

Yeah that's fine.


> Best regards,
> Dmitrii

