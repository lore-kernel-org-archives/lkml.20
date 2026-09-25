Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D24A386D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359392; cv=none; b=NdxUBJGsilZK4Arz9gW+JWTGdoAZO2AthlLX2PzJlKJ8ZbqwRGSWPya7nHQ58m/vQJQqmKpc8f857bNYkApYxz+qfECvns1ThW9PIEehaZb4XR1ip2lEwf9C+jwyh1ivjKwdXkmecwsRLKzdXCP7I5i5rWVIDmIqzPBS4nFbH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359392; c=relaxed/simple;
	bh=Ju7zhvTIV+QCh40+nZMxiWd5uKzk+g1KU9BhArseauI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP7rZPNIvkHJbxGEVPbt81c+jSvtGY4IoSJML1E7P/+Lk9m/ss0UI+cpwxGj7yDcGPCg277g2OBpS5D/QRo+BaVpocIktxvnJV4Lqb1SfrBlNoxGgQ5UNZjqWyFr6VytF0Juo3DTiazeo0TbaHi/78FIr02dj67vQGNIRC6Yk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw2hW6Kk; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw2hW6Kk"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-486e1a044c5so956593f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359388; x=1790964188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=Pw2hW6KkB6Wc459qoJzEC6z4sjiqgfdrCUXqVEOoPvkyww3+uz6v0Xz/PmmdMiMK8O
         9ezq3WYhyK5yBW+aAi7r0rLWJF1RIJoOgAnFWmwxxOIme4l3lo0awQBo0TNOq58DYuFU
         2uaM/lwDBVvcVBE+nB1mAGCZa716exkOF5jx2ljsfqmOhDrA6zKwtxCb6SgISRvckIy5
         GjzC0BAxOT8GKZIOCvWo3LcrN+0zNuYBe/QQVwxzpNFx6dVe38Uah53kmGl0ZcIT/DUL
         ML9U4kwiVj37G/xkoNdkAyKNjFyLtyKJXwl8a4MOqfunNXSOI+Wi/UPoR6l/qSeEjxqp
         /g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359388; x=1790964188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=ekfTeZu66KV6NkSUeuEn+mnpWhgELOUyItZxqKqXqL6oNFKGvsOs7mnY9cpu4bwojT
         BSdvtrUj2wipOwWaLhDfIdQH10iRYyN4Wv+BdvL+pR4KvItJslwO1iXslt8ZXGk4adAg
         0QHtyTp/rOw2QI7OjJDXMGrehgbgjv0GYiTqfRIkEKzQ08J/1xbPnN5txs9QY43rta8R
         N+PFrkI6/3W/o2kPlGyKsT4a4inAhjQ8kOVDZmFFvSjL4jFlWdB6+P5bjxP1hSNDD1z9
         LXlBdO1naFOXpdQ5Dwgjwb6l14Z+dhQG2K/97E9rR6o8nld0yzCP7qVsd68tYUwA/Vk+
         nE0A==
X-Forwarded-Encrypted: i=1; AKwUvBxCHUL2NsTqq6n9pv/Tc3DQlCTkxNgwZsQKMowkkT0+P6zU2Koo1v3SwmXAL6Qu8y2OCChuPbBAya5wAbA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1wAUClGGuryzIF4+lHHvDiZK0T7/N7nMtRn4WzP+SM0PKSJGp
	r6f7RNKyyvETgavoIiDS2bLqHjIDeJZeXZJQ7w11A3gw1mNoy0Sv2Fzm
X-Gm-Gg: AYBFou3ZebCmY1PGPNOE5P3HCHF2VrDRAdPSXdG14hqwam55VxmFDOsopLz70eATdkR
	sD4bH4Ulrz3zQRuIhzo9sfacuNuNzswWvTOIgv43mYDqqNKeiFeleIHxhoGesqE4bKC1nI6xLiZ
	L/w5Vghdi6W0bQXz4RHoxJqLmXeExVtAC4WMmLPMDE5KqOvXHTkaqxYkQwSx+HOUIo9xClhwOcL
	lC6LECjmHlHZIC0QHxP6Rjzpv36HIvum9Ho7Q5pUDtPH16LW9Sud9UL0PSZTXxaZvW/AixOoSMP
	dq9v0ZZ7RPQ9M8OYkLqYV0RsG6rXC/NJznlHiRYCcXRy8PMfUPTqklJ5Dfm8Q7KckfEmICkwuO5
	kUqcV7ZVCHnS/ywZIbw90XitlvoZlgEWaxDdcvzgzo57j2McLZrI+3iaakfWlNHUqi001Z4uLnJ
	7qxphHWxBA6D4lX2/NDO2qiY+9SjIol44OKpjgtEwpq3U9e4Ca9xrPRvQs8KjI7SIrtMo1smZAh
	6dwVNi1FIsEVMX7goAW18sWEjSgB01AHsGwBP3g+gxzskPwt/ttF4zmEDgfYsHlsQeHDS1mx+mE
	W+mNuKE8pwgoVA==
X-Received: by 2002:a05:6000:41d9:b0:488:834a:cbb with SMTP id ffacd0b85a97d-488834a1dd1mr3121424f8f.2.1790359387972;
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm7929304f8f.25.2026.09.25.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAAGI-00000000LZj-2fxl;
	Fri, 25 Sep 2026 20:03:06 +0200
Message-ID: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
Date: Fri, 25 Sep 2026 20:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: Ridham Khurana <khurana.ridham222@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/24/26 10:53 PM, Ridham Khurana wrote:
> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
> 
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
> 
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").

For the TMP125 yes:

Reviewed-by: Christian Lamparter <chunkeey@gmail.com>


> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> ----
I wrote a little test program by hand (see below) and ran it on x64.
No idea if different archs behave differently or if
a clever unsafe math optimizing compiler flag will
convert the  "/ 32" to a " >> 5" but I doubt that...

---
tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500

(the positive values all look good.)

--- SNIP test.c program

#just name the file test.c and run make test (in a directory without any other makefile)
#include <stdio.h>
#include <asm-generic/int-l64.h>

static __s32 sign_extend32(__u32 value, int index)
{
         __u8 shift = 31 - index;
         return (__s32)(value << shift) >> shift;
}

static int tmp125_now(__s16 raw)
{
         return (sign_extend32(raw, 14) / 32) * 250;

}

static int tmp125_proposed(__s16 raw)
{
         return (sign_extend32(raw, 14) >> 5) * 250;

}

int main(int argc, char **args)
{
         for (__s16 raw = -320; raw <= 320; raw+=32) {
                 __s16 tmp=raw & 0x7fe0 | ((raw & 32) >> 1) | ((raw & 32) >> 2) | ((raw & 32) >> 3) | ((raw & 32) >> 4) | ((raw & 32) >> 5);
                 printf("tmp125: raw:%4x tmp125_proposed:%6d tmp125_now:%6d\n", tmp, tmp125_proposed(tmp), tmp125_now(tmp));
         }

         return 0;
}

--- SNAP

FYI: TMP125 datasheet says:
"The  Temperature  Register  of  the  TMP125  is  a  16-bit, read-only register that stores
the output of the most recentconversion. However, temperature is represented by only10-bits,
which are in signed two’s complement format. Thefirst bit of the Temperature Register, D15,
is a leading zero. Bits D14 and [sic] D5 are used to indicate temperature. Bits D4 to D0
are the same as D5 (see Table 1)."

(They probably meant Bits D14 >>to<< D5 are used to indicate temperature).
