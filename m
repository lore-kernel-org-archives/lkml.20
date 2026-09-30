Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916594D797D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803653; cv=none; b=H91tDzCBFpyMlp1UN+aet9EGA/UunyVTFSmDqTviDBFYA1qHYLAFo4eX/9tquUVSEnj6o0ujB5l9TGavr3g0I9bly4fCLzyUxWhVirVwwdaMkvy9X1GHkXfVOYMzmT7aPuQdsiHVI6vR7gBW/qQ2/SfAYOQlfV5qLBr5y3TVuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803653; c=relaxed/simple;
	bh=GL2o4FVLqBPGPIRDnXslh1vUMxGYOsJ4oCsKqxuh3/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNXalvqV3jfQGle/HghtAirdEBhHaDOYIyVo4XwsHummZzXstGjkX2CSdtBQAKIxFSXdoVQiMLF6XzDNwmx8rSW27Av/6LeIy6VpWUisMphBVMXJD1DOs8kAYNVLM546W9WEjTaPha/AXJuhmBeuMjvwJa1NopFkAJ4xxHV/Mak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAUXYcU1; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAUXYcU1"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b017a3be3so997773f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803650; x=1791408450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7KfyD0VkItlqoFBW9ZQYHXnAAPT1pC1HgM3q8QCFUs=;
        b=qAUXYcU1nTV8RMn9Y9gbign8OoxSdZ2JAl+7ru/m43UjeGxoNVikEyYRlrao+F1E3A
         7ZJP7iwI+naJ5ZK6dkmZHkiENaoeQiaCywBUH4QuOqV0dLmTM29r15YPQ1qQSyGhzgfS
         9lzSqKU5PVfDSrNt96eC3ywEcYjMLoNCbUZPf/RdMWAz4RVeM/Yp6dVmHGtU8gKP0EPs
         BPj+jJLZ89PWYhhrgcW1aWzsWfRf6v6y2NKwHi5rW2/1X5WwoMfFSD00r8MgpseY6SBc
         fewFLZ/UFig7p4uZ5NaqozbS9okovz4MnL3j5jIZe/0uugZvo8Rgujbn9RuQvDTij6JJ
         7dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803650; x=1791408450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7KfyD0VkItlqoFBW9ZQYHXnAAPT1pC1HgM3q8QCFUs=;
        b=imSb/heC25i8gj9y5iqiYLPmTk5JUt66R1twl3y2iF1kyB0IfmvdFlQgi+UM1PQWG2
         xWlgjeNynnB31RiwZmPqXUViSMPH5tJM/hO5msZ29U7cwK8JKvVkstEe1Kx/OVsOwfvh
         9ng5rmC9wBMRN4UicD6mv1da6w7k2itQjxvIXDbxxmSCWrYikJ2d+9ASqhe+aMlHkCgc
         fb7r+AiZ+0wUP+3KWkZHXidtI1KmbzaxxyCIGB7USp66sj0D5sk7AUgB26m/YLNUO7sE
         mU0X5fhhAa502Xw+7JSy5NYle0/kZyaAMRDXZnNm2JVfQAZP82SEGN3OsFbT2PyxLyVE
         QHkA==
X-Forwarded-Encrypted: i=1; AKwUvBxBck6eJijCyU72rqXinBdBEy6WGtDy2V3VebwIztq+b8CP64rGxhFOp6rfcxW65XH20jjcYs87Sm/Gtds=@vger.kernel.org
X-Gm-Message-State: AFq9FYL427B9uc6VkqlYWSMx/kRfZhbulNQ0Nv+52IDVzfrqRUNrNMWp
	UOiquo6/nonU0GX+FUQisHxtA58yULTaiIiNZAl1MLnd1mXBkHA0pYVT
X-Gm-Gg: AYBFou3Lqqn95APIwrvqhcPQZ/0Vxbu62pp3ZAcosFstXZ1nS1z9M9VD3pPZWRP6X6R
	r7gs4kzQUrvcg7dCWZ4KoHHDJwLxkhQvSyZN9wximwLcB5VWQOAVGmLrJSL21hYHxljgj1kLg5L
	btiUUb9ceGQSjH+zK4uwUkJHSqxj5MBhCR+jNMKCfWYow2jnZPnGchdRIMwYeR7Ja1YXth9mGSS
	JbQ1Y/bqMcl0fj0svKwUniOwBHue9qBSZdpoFuN5/Rs5pB4/Or4c+43It7nz0tjiAQrIhA2J8wt
	7D+l0j5uxHLlQSUDkBhsC4F9VaPwszZB6ayOrJcHFSa0s9DCUwzj0niivraxHUp8xhPiA70xgwb
	pfpP6uiHU3vDa7/Szny05zHJ8YdRfFcNfb4udhhL8lg1U/yXTofYSrO4S6JNcaoMAO7sluozQZC
	OPFD0vg0uHUsRUJtOKOMtc+6jxpAfjDUH1bdlM/abWfKfonmAChqLZnJtLAAJh90AyfonDfSA+u
	AQKeeY=
X-Received: by 2002:a05:6000:310d:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-48b0250afc2mr4988687f8f.34.1790803649614;
        Wed, 30 Sep 2026 14:27:29 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691cdbesm1606033f8f.24.2026.09.30.14.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 14:27:29 -0700 (PDT)
Message-ID: <a6ea2df9-b2c9-4417-ade4-f3947f36d139@gmail.com>
Date: Thu, 1 Oct 2026 00:27:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 rtw-next 2/7] wifi: rtw88: assign the RCR per chip in
 rtw_core_init
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20260930091604.52891-1-luka.gejak@linux.dev>
 <20260930091604.52891-3-luka.gejak@linux.dev>
 <d398a8dd-a182-4e69-8f5e-12a820594093@gmail.com>
 <3c53130d1d4738a9b3173806264fc1d0b5682072@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <3c53130d1d4738a9b3173806264fc1d0b5682072@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2026 23:36, Luka Gejak wrote:
> September 30, 2026 at 20:03, "Bitterblue Smith" <rtl8821cerfe2@gmail.com mailto:rtl8821cerfe2@gmail.com?to=%22Bitterblue%20Smith%22%20%3Crtl8821cerfe2%40gmail.com%3E > wrote:
> 
> 
>>
>> On 30/09/2026 12:15, Luka Gejak wrote:
>>
>>>
>>> The receive control word is the same for every chip today. The generic
>>>  default is written in rtw_core_init(), so a chip that needs a different
>>>  value has to overwrite it afterwards, in its own init path, far away
>>>  from where the default is decided.
>>>
>> I still don't understand why RTL8723B(S) would need a different value.
>>
> 
> Because 0x700060ce is what the vendor driver leaves in REG_RCR for this
> chip, and it is what rtw8723x_mac_init() already writes for it. I have
> both from tracing this card: a register dump at the end of
> rtl8723bs_hal_init prints RCR=0x700060ce, and the same dump in rtw88
> matched it field for field.
> 
> The default is a different filter. It sets BIT_PKTCTL_DLEN, which the
> 8723B vendor HAL and rtlwifi's rtl8723be never set, and it clears
> BIT_AMF, BIT_CBSSID_DATA and BIT_CBSSID_BCN, which the vendor value
> sets. Four bits in total.
> 

It will work fine...

> That value does not survive rtw_core_start(), which writes REG_RCR from
> hal.rcr after power_on. The field is what keeps it. BIT_APP_FCS is the only
> bit added on top, because rtw88 advertises RX_INCLUDES_FCS.
> 
> Best regards,
> Luka Gejak

