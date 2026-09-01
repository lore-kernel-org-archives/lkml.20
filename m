Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030D92EEE88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228160; cv=none; b=lfaNqtgKcGhWZP0ggoeN/cBgRPDFhhXpN0vKp6bIR10M0m9ARJlA7ISTvUYRtqSd/ZSqEHwXK1iKXJBF4H1jvw5Beb/SdU4vwEuFOR4ycrKFEU6RNIpni2yyx7z1RP8GSqJRbelKBELUUTcwy5XMv37ZJNF819P0/Nl03WF/GBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228160; c=relaxed/simple;
	bh=DKAZQ4HB8RVRyPINtHAlvihaYgNW2N0m1l6ppV9ct0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqeXQcnC0ug+uZu+8bPdaAtMLTd/unLRAl//EFvhnY9CBMOPEbysH3q2F+f6uP97l/m5/JfCCG9Pj2tY9OKvydSQLrXskxTHH6Cvew+BdQDEinkSGxZtUxbs9sYwKqSr6gS8p2dbngQK8usTv239UlDAMiHGfj7Grg2+un7VJ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3ypPjrY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3ypPjrY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485b358552so4274412b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228148; x=1788832948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xndijz6hV8q9in3RSA1ablFs8VlKyT94mnXwH4oGlXE=;
        b=m3ypPjrYii6n/6JqvApbVSBQwf8fPWfJqr5KrTxkCaHfpDrNumXOJkTKe87EZmT5u9
         IFVhRFkYDnKN58EWJ8zfCc+GHPPiNXfFWEinFk3sIYoCK/C1eoKS0FNX8qGIw0Z5bDd5
         ivUOg7CqLSC03SLe53kynnVI8AilnfyBraZBwMkxVCFFUpHLFHyefp9qfRqAG6A/jb2g
         k5Sv0eg5pZsZivr+0WDiBHbZnC304OTSOwa5WHh38xNyRSAFrrPWSzqysoqJ8EEedmRM
         6gEJigwdlumWYiEmU2qGy244xRLLir7TrHpd+BjZ7coUA+BbvZeB4N+GGRDQcbhq6wOK
         1mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228148; x=1788832948;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xndijz6hV8q9in3RSA1ablFs8VlKyT94mnXwH4oGlXE=;
        b=DO1QJOpLl45Sy/WdafC1R1Lflz5gsjG0GmgyYzSJ+ptycVJUcikqhAkAFIQk9Z8Agm
         tWDNqQZFbXGqia0vwhTcn/yvlURTCdGookNKwkZxy0SvIHi2yncu2YQ/Q0SiKAyc77eG
         8X71LLY9LaApgTtKNuUHvmle1iwPBr9R9FvtwpTD6ltDR+ehqYMih+4g6HdiBBl9wGRv
         kWvUCG0/kHW37WMM3YI9KREtyMUw2c+wbKtFmR7SdkGmhq88X6OMb3cxajStb98dsPWP
         dj7ygCPL+RIU5ah9cJMk+U4/gahPy+ErgYc99wZpQ+XRxYm/vAgAgSw51j7aoQCeGrBU
         FJ+w==
X-Forwarded-Encrypted: i=1; AHgh+RoefD7+QI09ZwnEbOoI6uoSjNZ0zDjb2Lq06SiSXXPmr+BfzPyXvPq4Q/1hHm8cuPQLpBrbglfcYqIbRA0=@vger.kernel.org
X-Gm-Message-State: AFuF++mEs2tfL0oDzeBDsslWjlKaTz/uFzvMzy3pjKKFvcHZO7sUu+wp
	2bpzvndoPXCWOrw8TrmBxePI+8JZu1jKkliC0yTx78dLzgxmbceOx4IN3jO7yg==
X-Gm-Gg: AR+sD11n4HW8GWOpQQ3CYH1Iv0lbaSAD2qsGb5pcM5+js/UV3xdCdE2auwf3nRZTa0b
	zGMEarG/eI9p3eeBICUc58TnAQUrWIPN9/Mc70D6hL6ndVNgIyP2vZCOtyZ1y6oqVMuU9TQfxxk
	HnWAXdttCEXeLouBALIiC3IQEfXptE+WmNzDn8Z/b68JycW7YXc93uEpu655vVL6GOFDRyQ3ovE
	VoFlAysu2xnDvTdYNqopCBBDSoYmIKmPwo9l83+F7LfxpZPna7WFMdkjIn9huaxypWYYW1piMfk
	g5C6/ZfYyX0UXNdXwVR5L4Ks/1NZk5P8DNVYJP2ph3MUzQygjnA42u8JkvXJiA/XuBVW7DBh5PD
	oy1BFZbPjtYbczDRT4g6MDlBQJzyDZEbLXN1Xu6a2XdIZmjVler8nBFOeYFqQjEO1KEMgrTv5v2
	164K4Uq0t/c4iOwaXqUcQHg2xxXMrtGniEfTwSGXJ6vWhhCc9RjLjVncQ8+tdtFBLU9ajHhFr9I
	B9i7bUl
X-Received: by 2002:a05:6a20:d502:b0:3d3:aec2:4dc8 with SMTP id adf61e73a8af0-3d7b0548a7cmr8045683637.20.1788228148286;
        Mon, 31 Aug 2026 19:02:28 -0700 (PDT)
Received: from [10.240.116.157] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36e8ee6sm5115496a12.26.2026.08.31.19.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:02:27 -0700 (PDT)
Message-ID: <7b007eef-2f6d-c86a-065b-85eb85b5ee0f@gmail.com>
Date: Tue, 1 Sep 2026 10:02:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2] zram: fix idle age_sec underflow in idle_store()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, minchan@kernel.org,
 axboe@kernel.dk, bgeffon@google.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, stable@vger.kernel.org
References: <20260828083149.45760-1-jiahao.kernel@gmail.com>
 <20260828102446.3eb7f3dc779753b831e33fe6@linux-foundation.org>
 <apT-ocFYDmU6iC-j@google.com>
 <c961850c-09d0-3366-73e0-1932c1dc00e5@gmail.com>
 <apVK4g2ikVJe_Hcg@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <apVK4g2ikVJe_Hcg@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 17:38, Sergey Senozhatsky wrote:
> On (26/08/31 16:37), Hao Jia wrote:
>> On 2026/8/31 12:15, Sergey Senozhatsky wrote:
>>> On (26/08/28 10:24), Andrew Morton wrote:
>>>> On Fri, 28 Aug 2026 16:31:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:
>>> [..]
>>>>
>>>> Thanks.  Sashiko asked a couple of questions about this change:
>>>> 	https://sashiko.dev/#/patchset/20260828083149.45760-1-jiahao.kernel@gmail.com
>>>
>>>
>>>> Does this early return prevent marking valid boot-time pages as idle?
>>>> When a page is accessed during the first second of system boot, its ac_time
>>>> would be 0.
>>>
>>> There is no possibility for zram to hold pages during first second of
>>> system boot, regardless of whether zram was configured as a swap device
>>> or as a block device (mount-ed with real filesystem).
>>>
>>>
>>>> Can the early return above bypass this zram device initialization check?
>>>
>>> We already do that, e.g. when kstrtouint(buf, 0, &age_sec) fails.  Apart
>>> from that, that's not how one checks if device was initialized.  We may
>>> want to consolidate those checks, just for symmetry.
>>
>> Agreed on both points -- the early return is not a new "bypass", and
>> the write() return value was never a way to probe init state.
>>
>> How about moving the init_done() check to the top, so all the early
>> returns sit behind the same device-state check?
> 
> Yeah, I don't know...  Moving it under device lock doesn't buy us
> anything.  We don't need device lock to validate integer rangers,
> etc.  There are validations that we need to do under device lock
> because those require a consistent device state.  But things like
> "is system uptime less than supplied sysfs data" don't logically
> require a device lock.

Thanks for the clarification. The current patch is enough, so no change 
is needed.

Thanks,
Hao
