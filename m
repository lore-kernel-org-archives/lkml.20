Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEDB38F250
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095927; cv=none; b=LMEv5UjtYFnqXfFa/ZlGuxxb/gPjqPzVYtxccBI7Rb08Vbz0PEKYWhlWxAxuzD2JrXZbn+SVdky/bMviWC73FYlOx2f/mU710XrWuN/uzUmTXvGWO+7JSaFSUwOnZ4v2nKB5FhFVem2E0hlTqcaMo0OKKVPJXtmJj2IdGZ7y/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095927; c=relaxed/simple;
	bh=qBHIwDeiQEIBYyURVISfTNgqJO6g4s4gfNsWGb45fPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pytOQoDk9AaNHAahzzLOQlzIrMOHyZcYEKP7yR7rkVjkVLEl+M+PDdyGtHY+9AMM2AbzLuFHM7le7oh3q1sCHJBChna90ZaxIUF4gU5ScBT9LQW5ms++i329/Mhxqig3XvPkkWOAvaILvo+SJW7VLn3+oTOFofQydDvlij+AePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrQhkbnS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrQhkbnS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4957eefd361so20418675e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788095924; x=1788700724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/Kmja44MrCin3uu01MUT+M7SclhFHnUPiS6/jA9PRg=;
        b=hrQhkbnStEDSPB1IM3OmtIRlcj+8vXDmXiGs94wnqftgtiSRKY7y/q+wgClm2lmAPB
         yOCTzSNn8Y+V7NKOcRQ6r9wJETn/toB5cg2kIfTFAdtpijf9weBZ7Q0tBTsiuYmcDQQl
         JKiuu1rrgosfYPasL9SpoAJLpIFsD+GnXAAieJp/6RSalmPaQaGUA6rrnDkFJqG0S3vU
         i1UEIAneIL0468phAEOrKUix5yZ5aFg2s10Q/NVzoB6YTbiMMBpPWxwjdIg/rHkhrHJv
         DBrHD/UWVk+KxXTDksm923GsZfHHMHxAUUyJItQZ8tO7ePyH3xJZA4ke+iCDPDU977kn
         OK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095924; x=1788700724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/Kmja44MrCin3uu01MUT+M7SclhFHnUPiS6/jA9PRg=;
        b=A4LA0LEDThyDJSbGQXGK39+GcKNimU9gFBHCTST/WTLUsf2JowVvnR5z8Qs/VxkNiG
         5VcELxnRh1t94DUT5An9a89j2jbi+ALBwz+/gAc8OyM7B+61tgwFgRYrz5/bfxwmZM/n
         vwO3skrX2UkiI4KN5hxJQYV2FgEqUA17ZA2A8MhgHddSyvb+eDcFQmN5pUgbwbI6ug8M
         sJp7N6WT+sGqJgMkAkjCP3qn/R0wEDk4TCxIk0MQ7hZ7OxMUsSGAWw5QZHGwh+ml73Q5
         j6C3KilMLsFIqftx1bZs8FffjQBXH9g0aOMxwphPTz60434YvftaivlkKqa6vhgsJIHh
         o2ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR4+lxyneGhGnn+JTKujguVnkvtNGSsPK2CyQy6BxEDJ+Y7s6Zknuz6xwNiGQYjc5Dapv03BeuncaPEvM=@vger.kernel.org
X-Gm-Message-State: AFuF++nXE180E7sW8HGzdY9T/WXH6Gf+037mE8kgOKRhvqC5rv6aaVQ9
	gMXfFuHvDn5njCue2GyNyL8d/SzRvtZ2axEViwh86+l9WGcxJVHu1C6B
X-Gm-Gg: AR+sD13Du11WSwTFpdMQAqrGXF3W60vvzy9Yx0CNvR86or+nHeneqldbOFrJrivW5tY
	Nw9meIOvxZZZhcukimDyg2USYJwhJATd2zcCGTZ8WvkQNv/YM/Ajl8ACJ0Ona4jzJTLZdLmx3II
	zKPeSC5BYZ+bVfK3zLI4QtjKPSHEkz+TfHznu9q9sUFQYb8XuzYfxGhpW5G2n3M5K7IcBFf2Pwr
	LrTLF9jrsxCY6tzMKBQdJrn3cC1hDletP5HBFD7IOJsEb1hvk0BkE8fvm0+Wh1TFlwP0J3LtkFV
	Tww8vjxWHqV2zWRraZa1k0rtRjUWj4+4466wvUR8hmojAo8V4ncuyphUpGjgMoTmaMGfZmsY46M
	a+JbYg87EmqlrgI5i8BjdNqTOSboxhiBGN6+nqYvRUYhN/vJ13L2TbMkv7lFAsUwl5N4FiOy7+c
	zF4lQj1WzcKY6xYcksSZshcyZ5LlzoLjf8MBjDd6iE6zysTu3g9LywnLUI8Qs9RgGQ+MhqRahte
	4aDKNtWDRh5GVR0S0QA4eQUSaAwhbjuUyOnaC9j4AJEeuE8vl4NH/WhwtT6TlyAUZ0=
X-Received: by 2002:a05:600c:1549:b0:49c:d294:41e5 with SMTP id 5b1f17b1804b1-49cd294439fmr70006155e9.8.1788095924236;
        Sun, 30 Aug 2026 06:18:44 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm15828052f8f.17.2026.08.30.06.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 06:18:43 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100)
	(envelope-from <chunkeey@gmail.com>)
	id 1x0fPs-00000001Jux-0dBu;
	Sun, 30 Aug 2026 15:18:43 +0200
Message-ID: <c94fe1ab-fd2e-465c-b307-012ce15c6d5b@gmail.com>
Date: Sun, 30 Aug 2026 15:18:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: p54: require a full exp_if record in
 PDR_INTERFACE_LIST
To: Shengzhuo Wei <me@cherr.cc>, "John W. Linville" <linville@tuxdriver.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260827-p54-pda-validation-v1-0-bdc2b0675056@cherr.cc>
 <20260827-p54-pda-validation-v1-2-bdc2b0675056@cherr.cc>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260827-p54-pda-validation-v1-2-bdc2b0675056@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
On 8/26/26 7:07 PM, Shengzhuo Wei wrote:
> The PDR_INTERFACE_LIST loop only checks that the record start is within
> the entry before reading an entire struct exp_if from it. A truncated
> trailing record makes the if_id/variant reads cross the entry boundary
> into the heap beyond the EEPROM buffer (verified with a KASAN
> reproducer of the loop). The variant also feeds the synth front-end
> selection, so this is not only a leak.
> 
> Advance only while a full record still fits in the entry.
> 
> Fixes: eff1a59c48e3 ("[P54]: add mac80211-based driver for prism54 softmac hardware")
> Cc: stable@vger.kernel.org
> Assisted-by: GLM:5.3
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Hmm, sure.

Acked-by: Christian Lamparter <chunkeey@gmail.com>

> ---
>   drivers/net/wireless/intersil/p54/eeprom.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
> index 968ce9a411358e0e6b83117b1a077becc3207090..472edecf55772893afdf8be3020e6baaf80097a5 100644
> --- a/drivers/net/wireless/intersil/p54/eeprom.c
> +++ b/drivers/net/wireless/intersil/p54/eeprom.c
> @@ -817,7 +817,8 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>   			break;
>   		case PDR_INTERFACE_LIST:
>   			tmp = entry->data;
> -			while ((u8 *)tmp < entry->data + data_len) {
> +			while ((u8 *)tmp + sizeof(struct exp_if) <=
> +			       entry->data + data_len) {
>   				struct exp_if *exp_if = tmp;
>   				if (exp_if->if_id == cpu_to_le16(IF_ID_ISL39000))
>   					synth = le16_to_cpu(exp_if->variant);
> 

