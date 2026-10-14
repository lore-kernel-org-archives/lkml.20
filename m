Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570F560AB8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992867; cv=none; b=a9PYz67jpd++0D3n//qTe+PCZlTxOF2en1DcraPadhDvB7xhRmaroJjDq/qf4WSz64TcO7MoVTCyYo6Nw76YcoTF2utfAPdVQTkxTEOsBkCdSOZBeKQA2CXpATFIMSzxm8vGf5ADcPdzIALlKxjOh2M7e/Bt5SkbrM2UGJ6ZMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992867; c=relaxed/simple;
	bh=SkAmdc7sm1QGFa88r7L2o9h1gMKzRqFxqZadMw5RWWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpHHvb38LBz5L2JpmvMiCQbqK87iZvYdrw6NhNvtSZZt49YCJpQlKejBG7DYzi0fXGgZ1k6wP3DEaUFVV10CqjUgy1RAOwE89ZcGHKT2XglR4MjAGp2O8k5s0pGv/3faF684sk/JvgcVUuieyX7I39xoRw/jlzf5drxFqX8a1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YJVvz27t; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YJVvz27t"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8252259f6d2so2542581a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791992857; x=1792597657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5511ufpkaRG+DS2pNSBB2urvZrk4kAcuDxdZDLA2qs=;
        b=YJVvz27tC+x47sjJCos/rtOw8nA1vqoAgxoCp8avlT6s1QnQOTPcmtgPLt4fAakC0a
         b+5qvhoW0hJg2a6lL4LIZoDOiglAZaEooDsoUO/9WTkyppA4psczRZRXk7NhRhRGHpEr
         16qMUyN1Nk21YmsdJR/3SLThCoOcU8euxgHXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992857; x=1792597657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5511ufpkaRG+DS2pNSBB2urvZrk4kAcuDxdZDLA2qs=;
        b=25iAiPxoKsxYZ7qmoerKAdYpTMdIT1pcp446gAqz+VjDTRYsFITYPY9ZBcuf7SdK8k
         svloJQXj6RP+FjkQlSe2rqcFjlx39hzcWOqIoojwzsmBP+hNvtjsUWh/HMjqw9vP4sPi
         MnpIHv+SAD8A+8dOsyh2X56sDuIKfwr5k+pREUwB9gdqK2JJNrXftnvJe1iyLIuj89Ms
         5OqkQEAaBaunQ0SLvhD8hkeBikMoyXIP9ZwieIaZrRiL7iNT+5sB6RHRkZGdARQII1Lj
         flxUjl2Lh3G7R2mNQwqvPZBvSgDIao/Vuu347KunOA2binpETkaGmUneFZIfnvEKGP7/
         gUpg==
X-Forwarded-Encrypted: i=1; AKwUvBwZo6Ibqo34WX8//CqHnt4aFgWgxHFNn155vRAbQMicLM2eqf1mG2eIPHzEEKvMlWP7X99P/PatGInCgFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVdGytJeHDKPdmdUtvcHhCsycwyIQQOXyHayKY7i8kBpEamkHu
	Ig5e1jlHPpa5ljxloCzLkH8UVavPLjegvz6AEwA3scEuD71c43kfiZyKOUGxjiD7VBE=
X-Gm-Gg: AYBFou3UECx+NudzV+XfdB5Vaqij8JKlusRwesBEFAdRw3o7Neob3zg0kJjvDTVAkxJ
	erZFaV6U+x8Ux9okbMwgA5LCOmeKsUBwXdrYWiJCi/ME57HIUGUe4YFpL5h9CPoThnAS8lkaC/h
	Uu+tPnBuxONAvm1WV8Tq0j9JA12G4sZSDuV6u8sd4BULb9RkNM/j7t8qnd/L463PHwTfzCOOlcK
	IM2w0nRh/ZPL6hAmFp6gjMDuhcgR4H48Gs+SM4lho+jgFmOZXMd9AmBT6MVwZErltzBbkmsGsyl
	+/2EMfbTnnldKldbVeTyHyIbcZTWOB5VWE6Wnb328UGtAKbAYLXgDU8bgNUIrQRZM3N/DFybUBr
	JOLxszeMU5+j/fW+cIi9HRkwbr5qgPaf18RjEkej8AR55paqDRkkYGk343Q/L5afIR0btQAlhZt
	oz9YilgiAZLY1amnEIxQu7VH4kfXfrQPsEdNqs2VDH8LpgK9cUQDaYDfy6Q8UVszFR1uBE9/EOr
	Tjx2NP7
X-Received: by 2002:a05:6871:7a1:b0:49d:c9ed:21f2 with SMTP id 586e51a60fabf-4a2a8937f07mr15344175fac.18.1791992857074;
        Wed, 14 Oct 2026 08:47:37 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6df881fbfsm2366117fac.2.2026.10.14.08.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:47:36 -0700 (PDT)
Message-ID: <9534e333-c44f-455a-9704-d8d0f32d0d80@linuxfoundation.org>
Date: Wed, 14 Oct 2026 09:47:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Avoid unlink error on first run
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jaewon Jung <jaewon8868@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014114839.6258-1-jaewon8868@gmail.com>
 <20261014142147.95DB11F000C4@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014142147.95DB11F000C4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 08:21, Masami Hiramatsu (Google) wrote:
> On Wed, 14 Oct 2026 20:48:25 +0900, Jaewon Jung <jaewon8868@gmail.com> wrote:
>> On the first run, ftracetest tries to unlink a symlink that does not
>> exist.
>> Use rm -f to avoid the "No such file or directory" error.
>>
>> Fixes: 7dc1e125f07a ("ftrace/selftests: Add softlink to latest log directory")
>> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, will you pick this?

Done.

thanks,
-- Shuah
