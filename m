Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054519;
	b=dEyo0rQbvK/PwCgxWSVh5H9nuF/4mR5N3ktGBdV1RQuUAdQjIyg40QUkmHCWSJ6+YuD2
	 9pKL659ZtmN7V2RHevn2vYwml8+ix4ibt6UXZK7Wb6hlIni6e1gxUNPL78t5G8PlAF9AM
	 ifrZwQgWIZaFlr+Az9ce1lRIG96YDRNu8FRqmYT5GUSuifbl2xMPkSfjVtYiLBNqpyoJ7
	 iRmutnjhFql57e+TJ34vVpdZx3DKvNALUvTk+iA5X2AqFr3Qvssewxe8K61uNV/lEke11
	 OKrgc6TSh4oCN7DfQVd7YdJ8WI/DtORZLt90UkBqd1MorhGogpRJVdWKWlBitZ1JWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9TJ2uWGQA28B7/IVLdQOUeh7B2n+/HiF9b/pWpbRQp8=;
	b=0CAXVpkJ4OKjORCGEvZQzOQBRFrDFxqL6yktWb4kmf7jp78a/aOIlOOZKIFhXgjZ4Zcr
	 0wF8fQF4WrT7LgQhWlhbpmCsQDWkUFsmTQctrFs1YLRUJGMizOWhsHq2rbSPn+Om03V5F
	 GcPFMcQEKd8ksmnVyY5O/i5QvN8TDpCYUxclK8+NiSdNShuKZxXT41EQ4PaBBdpxJChAk
	 4AHfAuQVeialgJHaCzBpqPgOGZF907WXpO14d0z5o2Bfj5f75z9Ju+fqTCyboxHQxnxnu
	 ZhTarHn+ka5YrKcFHTYSRMRQc60RYYUaZPDcZw/9VwLScO+F7jkSUFfN7qTKaiMF/zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sTR+N0rG;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C748606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C748606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sTR+N0rG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22731455e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054517; x=1793659317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TJ2uWGQA28B7/IVLdQOUeh7B2n+/HiF9b/pWpbRQp8=;
        b=sTR+N0rG1eZuvFqHfBbcpGz3dtTjerA5lXe1bEMttgS8nsv33ERnGeZnDqeMZfzc9d
         tlbLJUgj2VgJ7Sk7V5qzTyGTFywijunoRW6dxp2pekNeJuohvkWkMkqZFvLlfVRWHRn2
         YwCSMBl6E1CJsaBedBHyfbkKfvX6molQ5dK8Jd23ohTYLxQVhmIGc+7SaBzM9pjJTjzV
         PctpyRgTvTIv7NIYQYiklT1HTHeE789laPiMiOf54QF66H0e1VFNmZXKSDeWW7MfvKD6
         1uCsAXegaBbTd72u70LFKABs2/C3Hn2JYGBq8zcglgUUmRWKdNNYLxaKwCGehtRzvbr9
         tJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054517; x=1793659317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TJ2uWGQA28B7/IVLdQOUeh7B2n+/HiF9b/pWpbRQp8=;
        b=Gx9cT0gzfsXXSShFOsLJKzEfsLcFACsV/EF4kYh+q1GoAM7rt+dYreEjJH5S+i7UjZ
         YjP8kEbZ9ePIK5nfoV+S0CzFS1q6CtyfoE8XQcfTKkrdKmwgeZZ7vK4tIncdiz/9fHAt
         YMud2PAbv7rmvO89esM0D8V+38b86lxO+ANOgPgwH9HTNlcNxrKihNN8l5ZvdTAXfk8P
         j60Kri3MB8nTh1PypkVv9w9fuqWC4Kw8edsXzyf7hSmHekWsb4eXW+8r/P5pvUfyxEOo
         qQ5auR2EO6uwUu+Kp5uTV2VLs4GODiwVRmCsGxsERFoRyLZZeIrq1ZAHFA1El2N/kZHo
         dzUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1v6usLjXwrUg9aUUhF+YRSeJmAnAXZV96iKcGduHfik8CtRzo9GsIve1ixHUxkArJmifnjgmGa5FPjI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRwd0hymO1Sg5hjVx8NpXbo5MpJgGzsuQwiYFZUyoDWkkSI/D8
	K1DVT+nV2a3FANCIS5VMKqwjwG9kih9iAbl15xsV8DySGEGjv79wCAVlt3JJzg==
X-Gm-Gg: AYBFou1/tNOh+cT6awnv7kSKUgdygnyUPySQ3S1xgZsBPhsjhEc8P80HkF+B8RsCGdK
	GGy0Jpm2hVPbSovgSIHcdJ2Nr1437l7VpY6YOJ8QRyYIZYzgEVpnNM8rXbde2ZZqPANdR+fIKlt
	N0/M1b7cYj52o6/jAX+i0tvV0YWJAp/0NZ9yUyj4XeCVicSLWFKqiCGvxVofLMIoa/SeoSrKXYG
	HQcvevZzEHRiQpp3aS2EtZr9wUajNnas8HT2X4AgtcjzdRQMrTNk8RuJ70yBA4USRW/lfDFGIMy
	qx7bCbdtwxmv/VnnQHJIM1yrx/XJXkM0f+6Q2duM/8O1S/pAn1wHKLccqBKiMwXEW1+J+vNEBTy
	JR6JJtk4LyxbY/MDf2V55XBsX5Jsbg1mPGOW2R2qRl/9IrfQdSc86Epu5SeAXQDTaX+La4zn/Qm
	9RQ1N6T7plabBRA8IqdjODpsxl+KY2MYvazHJjRmFThllhI/p8/KUGU2DWzGhtDlTRHbnK/nlZU
	WLMGUZTXt2sqZBWO/6jvilrmhQw/rc2CrbKtXgA4ISFtgDBpWrQcicPgwHcxm+/8ad5te1EzXWY
	ckr+65BoRsCgM1ECWxVccFQqpjwByEyFe2+md4Gojlm6R1JztukrLLWNEuCL5PQ8Wx4XmNvJBSM
	K8Ywk4w==
X-Received: by 2002:a05:600c:4e87:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4a35acaa046mr152446335e9.17.1793054516772;
        Mon, 26 Oct 2026 15:41:56 -0700 (PDT)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm228800335e9.4.2026.10.26.15.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:41:54 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xLTO3-00000000SgX-3CYi;
	Mon, 26 Oct 2026 23:41:54 +0100
Message-ID: <7a52a44b-d674-4469-bc77-35a5a648472d@gmail.com>
Date: Mon, 26 Oct 2026 23:41:53 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless 3/3] wifi: p54: fix IE parsing loop bounds check
To: Johannes Berg <johannes@sipsolutions.net>,
 Tristan Madani <tristmd@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>
References: <20261026112151.2515228-1-tristmd@gmail.com>
 <20261026112151.2515228-3-tristmd@gmail.com>
 <9658b549be7c1c0f1637699b8b61960d2101dfca.camel@sipsolutions.net>
Content-Language: de-DE, en-US
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <9658b549be7c1c0f1637699b8b61960d2101dfca.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 12:45 PM, Johannes Berg wrote:
> On Mon, 2026-10-26 at 11:21 +0000, Tristan Madani wrote:
>> From: Tristan Madani <tristan@talencesecurity.com>
>>
>> p54_find_ie() iterates over information elements using a loop condition
>> of while (pos < end). When only one byte remains (pos == end - 1),
>> the loop body accesses pos[1] which reads one byte beyond the validated
>> buffer boundary. The read happens in the bounds check expression
>> pos + 2 + pos[1] > end before the result of that check can prevent
>> the access.
>>
>> Fix by tightening the loop condition to while (pos + 2 <= end),
>> which ensures that at least the IE id (pos[0]) and length (pos[1])
>> bytes are within bounds before any access.
>>
>> Fixes: 0ac0d6cedf611 ("p54: Move mac80211 glue code")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
>> ---
>>   drivers/net/wireless/intersil/p54/main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/intersil/p54/main.c b/drivers/net/wireless/intersil/p54/main.c
>> index 57a62108cbc35..16614f65dfa5f 100644
>> --- a/drivers/net/wireless/intersil/p54/main.c
>> +++ b/drivers/net/wireless/intersil/p54/main.c
>> @@ -81,7 +81,7 @@ u8 *p54_find_ie(struct sk_buff *skb, u8 ie)
> 
> We'd probably be better off just replacing that whole function with one
> of the real search functions or iteration macros?
> yeah, I think carl9170 probably can just straight up use cfg80211_find_ie.

But p54 needs to edit the beacon and the memmove the (found) TIM element
to the end of the beacon and modify it a bit of tim in p54_beacon_format_ie_tim.
The problem here is that the helpers are all casting to const. So this will
look "funny" via to "uncast" const. Unless you meant something else?

As for what to expect if something read past the end? Well, p54 works on skbs. So past the
"end" in p54_beacon_format_ie_tim() would either be extra tailroom then padding or the start
of skb_shared_info (u8 flags) I think? In case of p54_pspoll_workaround(), after the "end",
there will be the FCS (32-bit checksum) - at least on real hardware) and then padding or
the start of skb_shared_info.

For rt2xx: not sure. But the existing use cfg80211_find_ie in rtw89_core_cancel_6ghz_probe_tx()
and rtw89_core_cancel_6ghz_probe_tx() looks suspecious.
Because from what I gleamed, both just pass "skb->len" as then len parameter. But shouldn't
that be subtracted by the offsetof mgmt->u.beacon.variable? Because cfg80211_find_ie thinks
len starts from the "ies"? I can't tell right now as I'm sick and need to go back to bed.
This all could either be a fever dream an be true/half-true or completely wrong. So I have to
ask in advance: Please don't take this all too seriously.

Cheers,
Christian

PS: Is there also a patch for rtl_find_ie (isn't that pretty much the same as all the others?)
