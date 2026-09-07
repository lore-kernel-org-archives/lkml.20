Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B86420E7C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812055; cv=none; b=oez+ZmdU+OR0hZf0+dU7QyLkzco26KDYcLJWPUgEYqlsdZnr/mHn6bYfkl/0ji3mJBVLa0aZl4cLgF5xdJyQpxkyXfLL98bOKk41M0dawsSK/4OsN8RMX4huiz88QqBENRGACm2H5bK9rk4EY5p4s5CKalLfQmWo3qPJXxNyiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812055; c=relaxed/simple;
	bh=JdYM+UJ0B56bSrUUIISGmCCYJRuSXUMR7i0SnqkLauA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5RkwyBCkzAEQNWsgjAHoGn91roYSMLX6l1ipFbsSlQoSMCoR76ApD87Tl3If4cNetJDKEdAh1Lfoy6KeSRF28KTmyfb3/8dpathCbWKG/2ontoWs1++noK3zUem8rg0pUJBG96ik7U5R+KB70Qjric8I9xHaoVmmyLqVVYLqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFPuj26K; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFPuj26K"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2595251a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812053; x=1789416853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhNwMmgT5IoqPKbTajdZzif3txtKsi05HtP3StDpTm4=;
        b=KFPuj26Kse0cFbiDqsg4/h8KgHrxVxgUPfAFkmmBfq0CDc3Nb1yh7O4U++4JkEG1xg
         49GR7lGeJ9nA/1IbAH9VQIJ8gCDup/2wfcIH/tm55Y82i+3UQo28tc5PWpzl1xB8q9VE
         u/3NlHiSQjqIt1IJiHpPuQSHZ/ceHL5IkbqWHI8lJ63QsNTTmp6tsRRfzM89M2y1KdZ1
         lX6JWTg+N2YeYB6bnJrxO1q3ZN/kGS4HwAHZzFmMZYdR+9ZRnTZJpTq5f1IBkRJTl2xE
         tnW1oOOZG5yKXjUtgvJ8E0XoMC2sXk1VE4snmOk53xEh0Y3SbNMn+BaTwBPf7wuV0G63
         fy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812053; x=1789416853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhNwMmgT5IoqPKbTajdZzif3txtKsi05HtP3StDpTm4=;
        b=VYdEl0c47Gepfx0DxwOY6atUw9UFJc8x6UyDfQCdOMQfmm8lXvOg37C+hIlUoex2JX
         attzCccek84CBpPDJeiVU8M1oAILVD1oN+f8zzPmgfc1hDCqHKHa/zWL8K1jOXxiymxF
         8z5utJRZ3MKGQjEJ8gx19Yj8K4ijZC5jXLm4cnLsokhpzVEbOEF3cZtXCixtHwYQ8IWk
         9Cx3+WtlUdzYl0+LyJ+xMDuOFWP70nB4UW8I2ajzh4EhFMTvARgLL3NQWmi5GAxfZ0Or
         QvhaqIUqT4u006lzJrxuRxtImOfotxt0O1Euy9XxvBZa1Q8nWSOLyfvLHgJfMgXK4oU5
         uD1w==
X-Forwarded-Encrypted: i=1; AKwUvByqrxHURq8CqiY97BQY3moNinZbEzjv/aHmdygHVNTz+XHwmwxw/9pYH5lM2kjc/hIQVDVBibEAcMyKO0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mRJef9CiQxYSaOwP3dU4sag3HLBekaBSKYLN8TryTT/fwLKuLN
	/8jhvxd/EemPesikMNKTHK6mCbgyS7Dk+Uq++4rtT1IY9rRm+UzIw/uQi0rUxg==
X-Gm-Gg: AYBFou3wUZf7MDqt/D5jgmw1NIC5/UPLaaMn4jpnTE149i+3bNUill9C2nyfDymggKz
	eih2SUQgbpuWMg0IJRwHKsKTNvfryJ6+vzZtWB/Wt+lxpZn2hOVnxSSAThZsrn5fbtERgiso72h
	suanUSuvZ7vAJzXjoI/3PjPsLVL+tkyYYheWpVlSB8gljT5NOq5aEQNqK1xYQiGFPFRQS8h+YDy
	Y5UxwJnT1raPmrxnufRJGHr3T+c6jBTQJXTDENUH8pUEIqZJTSXQdKKQwW+W5YtPP6K8mE2otu3
	KKCSVzB8P3Ez+uYz5QI6q5x94KojuAw2h/wrw7jzOcBwEo4czO/+h8m5AhK0jnGGppMHWn+T2y7
	4NhHs3Hnx1CoLkdcvpu5cSPDO2AbV+MA54ETdbEF9u8bI2YHf6enm3/zY5eaqpcXNFiVXlDaews
	TNJmBbn8nKzVBMOzE9qPNc+3UE3ZTTZHCnYZ5Sv/1+zGyfEsmBXb9tp0Y+nM8EUyPcznujN99ma
	fwEQ739yDli9T+tKspFuF0zTKoTQI2T+xCfFk9qR4xqdPf4a7u2NNpyp0Rkv0dHqbXSqj4+CLoS
X-Received: by 2002:a05:6a20:c896:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3da39f47dd4mr42511514637.8.1788812052990;
        Mon, 07 Sep 2026 13:14:12 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e5ea:1a30:7c29:cd76? ([2001:df0:0:200c:e5ea:1a30:7c29:cd76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm29604849eec.13.2026.09.07.13.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:14:12 -0700 (PDT)
Message-ID: <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com>
Date: Tue, 8 Sep 2026 08:14:05 +1200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Cc: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260827093948.2825531-1-lilinmao@kylinos.cn>
 <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miro,

On 7/09/26 23:14, Miro Kropáček wrote:
> Hi Linmao, hi Michael,
>
> On Sun, 6 Sept 2026 at 11:49, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Hi Linmao,
>>
>> thanks for your patch!
>>
>> Am 27.08.2026 um 21:39 schrieb Linmao Li:
>>> The SuperBlitter operations derive an integer byte count per pixel.  The
>>> accelerated fill path handles only one-, two- and four-byte pixels.
>>> However, the operations are currently installed for every external
>>> framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
>>> truecolor modes accepted by the external video parser.
>>>
>>> For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
>>> nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
>>> incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
>>> despite advancing addresses by three bytes per pixel.  These cases can
>>> corrupt the framebuffer beyond the requested rectangle.
>> I believe 24 bpp mode can be rescued using something like this (entirely
>> untested):
>>
>> --- a/drivers/video/fbdev/atafb.c
>> +++ b/drivers/video/fbdev/atafb.c
>> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
>>           case 2:
>>                   memset16((u16 *)line, pix, rect->width);
>>                   break;
>> +       case 3:
>> +               memset(line, pix, ((rect->width * bytespp) % 4));
>> +               line += ((rect->width * bytespp) % 4);
>> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);
>> +               break;
>>           default:
>>                   memset32((u32 *)line, pix, rect->width);
>>                   break;
>>
>> Can't test this on hardware, and would need Miro to confirm it works as
>> intended.
> Linmao's patch: I ran it on a Falcon with SuperVidel at
> 1920x1080x32bpp, all good.
>
> Michael's 24bpp fill: I cannot test it because the SuperVidel has no
> 24bpp video mode. It was planned but never implemented. Its mode
> register offers 1/2/4/8-bit bitplane, 8-bit chunky, 16-bit highcolor
> and 32-bit truecolor (24-bit RGB plus an alpha byte), with the
> remaining code reserved - and TOS offers no 24bpp mode to set.
Without a 24 bpp mode, the 24 bpp fill is pointless, so no point trying 
to keep that mode alive.
> Unless I overlooked something, the fill also looks wrong on paper: the
> first line is filled with a repeated byte and then with repeated
> 32-bit words of the same value, which cannot reproduce a 3-byte pixel
> pattern unless all three bytes are equal.

You're correct - we'd need a memset24() to account for that. Without 
hardware support this is an academic exercise that I don't have time for :-)

> On the fbset question: no, the pixel format, depth and geometry of an
> external framebuffer cannot be changed at runtime here. fbset -depth
> 16 and fbset -xres 1024 -yres 768 both return success and change
> nothing, because ext_decode_var() only validates against the values
> from the boot argument, ext_encode_var() re-derives every field from
> the external_* globals and ext_set_par() is empty. Only a reboot with
> a different atafb:external: argument changes the mode.

All good then - do you need my Acked-by for Linmao's patch, Helge?

Cheers,

Michael

