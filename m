Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7736B905
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414566; cv=none; b=DbtS/ZA+RnKoR7UEJd+XZ1v+87TbkYZLVnH75OmNapvTzoV2q7F7Iv+aqoj6oja6OzNehMfkRqbeQY8k1cZc00agzoMsAJU03DHojC9nR0L+jifWn6Tla3UPGg9pIhD/p5FU1uJXfIkXa0+bI/SQHtj4oiPYnrb5IYSTymj8GOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414566; c=relaxed/simple;
	bh=GtaZyzdhln69h6A+uvKrkaqN0V1hWvpxkiSvYDKzWGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq0gVaLkm7pz1BNnBqp8l6rk+pbEjF7IoY5RBVU0Q48MWoL+69CVg2Y+goN88N2BMO2QdLqbv3MCQljtX51z5F+Zs58U9v16oIwGT9cSH5hsUg+KOiKfYWNVQMI/cyj4ndS7sWx/fRO87jeggh6FUuFSv7/dbIzoWsZqmxi3il4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOb3ByNi; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOb3ByNi"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so485274f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790414562; x=1791019362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9TrmrMnb+MXVfFJfRp27XAGJDT0tpc1zF4/Ua/Sl38=;
        b=XOb3ByNiqBGKtdgnYqtaqvHxAEll/bebtWBs1XcrGcbmKfPthxbS5GgOnh9/pwXto6
         jpZI6KZH2LvcLHufAmtZNAP6unODQT8sOABoFS1MMG3QbKrY9cRcE+ni0K+6ZTDqiqhS
         oOUe6QR0HexUGyDRBwDEfJujCaJpYFVWEZuV6WRtntxXrYjx1M+JXzc2FZ0DUtWkqSfk
         V5TNCRUfqzXsMBK+G0c15QCbX8oQAwR0TWb+iXv3hKnttJELjpmsR96IyGrag5KKNhC1
         4AIwuCC+T5C6I86siMqGR8/f3qj8fqlu1GI/j9zdSI0ZZgQOEFGzpDXK+8tdO3EdgRTX
         BCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414562; x=1791019362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9TrmrMnb+MXVfFJfRp27XAGJDT0tpc1zF4/Ua/Sl38=;
        b=P9IbwUsgRY2ebznLLQHDPdz1SFH8+sTyzN0cfX+m0Z2Hz2zfz8Wjyz77JKF+a7hrv/
         7DJy+TENGXLt0wIH+IFqS/qxWj35oPTQQSNHZ43GVp1AHN7pXYbeptIReol0tmIz+aJe
         LUo825yqPzPABdASZQAtHgjhbcpZROBGRMoLvByB90Od5ynsVcf2qwzBgqOf09ybTwbR
         adUUq+s5G/rhKxhLOL5gJRzYWABzAgElqAwbOPrcNqY9YhKLfyAMh8njOOdRF6F0hYpG
         +EqvYUhEDYfgFWrChdurPVHuZaBlW0QW58E4s+krO8HC4NSaMgR11yYiUxAc8k3x87dx
         0dLA==
X-Forwarded-Encrypted: i=1; AKwUvBxwS7uUyeOV5GdeYonCEZH/lE/ToM0ErEgrQ3N4EOzDcwG6gY4+9o0aRTiJCcdN5dJQcv3fDh1OCQWIQvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIU8n7ipUE3142cQXHf8MHTHHWcsqyiH4JueALOP+MJOOkhXng
	xr6gguFj04RIIK4gkY5lnaEuFwFFN4RdLnu72R7nXqJZMMjJOTaXLJY6
X-Gm-Gg: AYBFou3Vp2J92sN3z+ImXG5BeiM0rIViETolzXMdofEpzQ8Y6pVahK0VoLNpIypdoV3
	Bg32pxet+mCnMjTS2iyr1a2l9H4NLWDACAonKh3UgRMCeMe1Zdhbas9pyFX0qL8L2Z9cRks4hea
	5g4g2BNrTIRvMC9AdQ/b4rLUoEZQ5PjAprWoSZZs7fBVmL3CA4Si/cyjDpLpLPVruUtxODpFyUp
	Sd0UIAW8GqkAD6UyxwRNKej3Zlfo+A6E2z/OBRMSHzg2yV/gMimXE0MWjBaSK3Ix0/YYEnr9/U4
	mhKZKrLNGcXbzHESuttCsKJWwqQMX2GvxZnX2yWs/QTNaiT9Fi9iIg3AlxVWEQekYiaxW5CtS0Z
	R2IY/U4QW2zuqF5en/lIY3IrTV94q1cyFhVPgBhi/t9L48JSkMzsVNt9K3HCMHuMYQ1YDeazM25
	M93ilcGle3zOg3pNc8V5TvNM7UNUXM2jMK0rhq344KugHs8MMipWzXiKPv/urnH+CXVWFa1l6Zv
	jTYJIk3VRse1jgsZIynNbEcYWoWYuXhxYot+2Y1ut3fL7ITEN6cHiZYpewiNVgzDA0R
X-Received: by 2002:a05:6000:2302:b0:487:27f9:835 with SMTP id ffacd0b85a97d-4887170d4f6mr15558058f8f.42.1790414561982;
        Sat, 26 Sep 2026 02:22:41 -0700 (PDT)
Received: from shift (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a640df9sm12495506f8f.24.2026.09.26.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:22:41 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAOaQ-0000000042U-0kW6;
	Sat, 26 Sep 2026 11:22:39 +0200
Message-ID: <eb76f982-d29a-41b4-a5ae-61ce486f4839@gmail.com>
Date: Sat, 26 Sep 2026 11:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
 <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
Content-Language: en-US
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/25/26 11:19 PM, Guenter Roeck wrote:
> On Fri, Sep 25, 2026 at 08:03:06PM +0200, Christian Lamparter wrote:
>> On 9/24/26 10:53 PM, Ridham Khurana wrote:
>>> temp1_input_show() drops the low bits of the temperature register by
>>> dividing the raw value (raw / 32 on the LM70). These bits are not part
>>> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
>>> return some of them as 1, and the TMP125 fills them with copies of the
>>> temperature LSB. Division rounds toward zero, so a negative temperature
>>> with any of these bits set is reported one LSB too high.
>>>
>>> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
>>> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
>>> the driver reports as -24750.
>>>
>>> Use an arithmetic right shift instead, which drops the low bits and
>>> rounds down. tmp421 had a similar problem with negative values, fixed
>>> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
>>> values").
>>
>> For the TMP125 yes:
>>
>> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
>>
>>
>>> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
>>> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
>>> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
>>> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
>>> ----
>> I wrote a little test program by hand (see below) and ran it on x64.
>> No idea if different archs behave differently or if
>> a clever unsafe math optimizing compiler flag will
>> convert the  "/ 32" to a " >> 5" but I doubt that...
>>
>> ---
>> tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
>> tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
>> tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
>> tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
>> tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
>> tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
>> tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
>> tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
>> tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
>> tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
>> tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
>> tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
>> tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
>> tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
>> tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
>> tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
>> tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
>> tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
>> tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
>> tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
>> tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500
>>
> 
> Sorry, you lost me with the above. Are you suggesting that the patch is
> correct, that it is only correct for TMP125, or something else ?
> 
> Guenter

Ok, I guess the same thing happend to me now too?

Is there something specific you want to hear? My reasoning is that I wrote that
cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")

I definitely wasn't aware that / 32 screws the with the rouding result for negative
integers and >> 5 wasn't. For unsigned compilers actually replace the divison when
the divisor is a 2^x constant on their own. You can find so many threads/topics about
that explaining why (basically pick your favourite).

https://softwareengineering.stackexchange.com/questions/209678/why-does-division-and-multiplication-by-2-use-the-shift-operator-rather-than-div
https://stackoverflow.com/a/27052650
...

It's been too long to remember what went through my head back then, but I knew that
replacing / 32 with >> 5 is a common optimization because the bitshift operation is
faster than spooling up the hardware dividers. But it would have looked funny when
all the other conversion codes (especially the LM70s. Because it's almost identical...
except the LM70 has the sign-bit at D15 and hence the raw value can be directly cast
to a s16 type). So definitly that >> 5 was on my mind.

Now, I was surprised to hear that / 32 and >> 5 differ for negative numbers and I wanted
to find out and the experiment tells me: yes, it's true.

Do you get the same result? What if you replace the function with the other
LM/TMP implementation?

But I have the suspicion, this doesn't answer your question, or does it?

Cheers,
Christian
