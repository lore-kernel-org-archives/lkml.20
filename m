Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD940413791
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790530678; cv=none; b=XsofeXw14kLaw0ia0JCTfLhItOGPcNqY9TZkeuyJzQpmliGVT5pOjM4EnbcdhSsSBIveQFPcwBUN8uQUicaD3UtO6VOcmnyCYs/6JSlsrdlvJcjTBBn9B1q3H6d3JaJgJh2E+Xp2CzYzMtMJXYTPO5qBE3nBgtnVIjcsaYTRu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790530678; c=relaxed/simple;
	bh=3YJRpn+TF61Mt/LuWP9OS3ycCUwZEuhQMMCJvy4rGKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlulPpq5dZf3guxLFrYILVLrwQfUlPM6AmxpwtnofNqv38Yl/Z6fbDOEO3CruxdxCDvcycK1IQP6Mqppn1PXBWSFCUOPKOD3n6zJPnFGLBNpkaAfOgU3QVm4N5pCN220X/bqbAD+cNwWekcqoE8/nLZxAsMc1u2NT5gxX97MpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjV+uLbd; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjV+uLbd"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1258908f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790530675; x=1791135475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+X+36lYCWsGvVjpUJyj7CQ4ulusicBQjGYVS+SYOwQ=;
        b=GjV+uLbdJCqOCbNRnh27HOWvbL4RIK15C3sY7CjZv7+aqyK7PVXV8fvOziruUIqu8v
         XjkJ5xdNiB+7KhYivKgcHsvxPgzehyICWYFvWecHILhrl3LYbZEwT2x3krejwWKSXZQU
         1nBdBY79pR4jPxXQs8nhPuwo1KBHVUAU+rhDxNzmKcrr80ZIc/phK/wncR3llFjQ+P6T
         0X0hHFjLbW6Dm1l8l5uopR5uHfwWaafdS32S4KV2ge8EbvMjMGM+9XVUPJjT2AH6DauX
         W2kZUol1RDsMsV7by/nmHDXPofJIoAnh/ftuZpwBojIVXvr0teoafFz+uZzm4DXLQpWP
         ablA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790530675; x=1791135475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+X+36lYCWsGvVjpUJyj7CQ4ulusicBQjGYVS+SYOwQ=;
        b=WBIqhtKk77r2YSxck4dr7p+eNut1fHkJfNtO6OY3QazmjLLIbpoByFJOkCF1+SglET
         yShiAdwTWbyMtnnqDsan191BjoKWF4ExPa0udFM7LviPo33tMnwuGoZMuDDNqsFqRW9y
         6CDKKJL7M3INgqA7579TWTQXXpb978quf9OjbTtT2S6n3c38PAeF7eVHhkLtarQ5kSCQ
         rzhLj5GliNQ58PH9KsVGTzDss7To97VJa/KP/Al7lBUbfYjuNvReuAFB+tHQjRbV/EXZ
         4S9MyRXQLJtXh3NEg9zqBO55b3M0WHGZndDUCVdcYwyE6JcaEHvlOC1Z+Gn77Ah6ujBv
         IuEw==
X-Forwarded-Encrypted: i=1; AKwUvBzKZb+U1WuOZpR1VjIVImAHvOBxRZMYWyCZSNdHrduPWtT3v7VsAhbAZgFDq714EQdMX8BdsUlLSCLAVdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYInrMORNe2Kc2XJNqaDD+8Bx1/pIPReCDzsfbQfsarD4VuryaT3
	Yg+KxS/oP5Z0u5qImt+eJF5N9Jx6QRcCv6QD63lvx6minbQYfEuqATPq
X-Gm-Gg: AYBFou01V1uFodSAleWeVgrmb3di8VpRla4e4fzqM5jsPfPFC94J9A5CYoUh7NLlGKn
	0qq59Vrcdn8SlhWqZ28dld3lZlYTKaawL2MMn17FrY5P0F1LNXUiqaS4MZhk5fmgEELwVNZ1tEG
	gfa3M8INZp03rqn6i+C9B+URSl8SiWmxjBU00bYr7XqnVL2e/lylN5mpTD1grCEJ3FNs/dxmJs3
	vCN4+nS/6SU4X1/ojE9trufQ3G487m9nJ7+zeL49XUCCeaG2bSzSw4xbrHDYm1EGpkRX6XiyQnw
	lE1rdmUEXwf79lbxOrKzEzma/sd8DjliOwrAn7aqzWKKnHBemQhSRH/FqAo4K6WsK+LlwL3hT/e
	FJEZ+BGJ8IOMcAFHz4XWsWiXZPDTdcsYA2AmuLQuiCxk564Zs+93sJ/RUlrHU2JAx8vpiF9yVNg
	LNmi9qm5pgPKmc8WgCnc16pzaoXnpO64HilCDZ2TdfHr5Bd298cexH5ihQbWQYzOHp7OFMKp3XU
	8RuIg==
X-Received: by 2002:a05:6000:40dd:b0:488:8109:fe01 with SMTP id ffacd0b85a97d-488810a006bmr15018232f8f.46.1790530674966;
        Sun, 27 Sep 2026 10:37:54 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm21034900f8f.21.2026.09.27.10.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 10:37:53 -0700 (PDT)
Message-ID: <62a91a6c-f18f-4f74-a4a8-90a15489ac26@gmail.com>
Date: Sun, 27 Sep 2026 20:37:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] wifi: rtw88: 8723b: add the RTL8723B chip driver
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20260921154347.82317-1-luka.gejak@linux.dev>
 <20260921154347.82317-4-luka.gejak@linux.dev>
 <39da13e5cdd840f5a5ab86ded478d07c@realtek.com>
 <DLN10FU8L1PQ.3NK0M6NVQ3Y53@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <DLN10FU8L1PQ.3NK0M6NVQ3Y53@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 00:50, Luka Gejak wrote:
> On Wed Sep 23, 2026 at 10:30 AM CEST, Ping-Ke Shih wrote:
>> Luka Gejak <luka.gejak@linux.dev> wrote:
>>> Add the Realtek RTL8723B 802.11n chip driver: the chip operations, the
>>> power sequences, the efuse layout, the RF and IQ calibration, and the
>>> chip specific coexistence handling.
>>>
> 
> Thanks for the review. Everything that could be turned into a change is
> in v4, and six of your points are worth an answer as much as a change,
> so here they are.
> 
>>> +#include <linux/unaligned.h>
>>> +#include "main.h"
>>> +#include "coex.h"
>> [...]
>>> +#include "tx.h"
>>
>> In increasing alphabet order.
> 
> The list is already in increasing alphabetical order after main.h, and
> main.h cannot be sorted into place. The other rtw88 headers have no
> includes of their own and are written expecting main.h to be first: it is
> what brings in struct rtw_dev and even BIT() and GENMASK(). With mac.h
> ahead of main.h the build stops after 179 error lines, the first of them
> 
>   'struct rtw_dev' declared inside parameter list will not be visible
>   outside of this definition or declaration
>   implicit declaration of function 'GENMASK'
>   passing argument 1 of 'rtw_set_channel_mac' from incompatible pointer
>   type
> 
> I tried the sort and reverted it. A strict order needs main.h added to
> those headers first. I can send that as a separate patch ahead of this
> series, but I would rather not fold a shared header change into the chip
> driver.
> 
>>> +#define MASK_NETTYPE   0x30000
>>> +#define _NETTYPE(x)    (((x) & 0x3) << 16)
>>> +#define NT_LINK_AP     0x2
>>
>> The PORT_SET_NET_TYPE in rtw_vif_port_config() does similar thing
>> relying on static const struct rtw_vif_port rtw_vif_port[].
>>
>> Is that not suitable for RTL8723B? If so, should the common flow
>> avoid RTL8723B?
> 
> It is suitable, and the common flow does not need to avoid RTL8723B.
> PORT_SET_NET_TYPE writes the same field with the same value:
> rtw_vif_port[0].net_type is address 0x0100 with mask 0x30000, which is
> REG_CR bits 17:16, and rtwvif->net_type is RTW_NET_MGD_LINKED, 2, the
> value NT_LINK_AP carried.
> 
> Only the timing differs, and there the common flow is the better one.
> rtw_ops_add_interface() sets net_type from the interface type,
> RTW_NET_NO_LINK for a station, and the association path moves it to
> RTW_NET_MGD_LINKED, writing REG_CR after both. The chip local call ran
> during mac_init and forced the linked value before there was a link,
> and the core's write replaced it a moment later in any case.
> 
> So v4 drops rtw8723b_init_network_type() with MASK_NETTYPE, _NETTYPE()
> and NT_LINK_AP, and the chip relies on rtw_vif_port[] like the others.
> No other rtw88 chip defines a net type value of its own.
> 
>>> +       /* Override the default rcr filter for 8723B */
>>> +       rtwdev->hal.rcr = WLAN_RCR_CFG;
>>
>> Why? The default value doesn't work to RTL8723B?
> 
> Two things say it does not.
> 
> hal.rcr is not only written at init. fw.c clears and restores
> BIT_CBSSID_BCN in it around the beacon filter, and mac80211.c toggles
> BIT_AM, so whatever is left there has to keep those bits.

I don't understand the conclusion...

> 
> And this is not a private filter. It is the RCR that rtw8723x_mac_init()
> writes for the whole 8723x family, 0x700060ce, with BIT_APP_FCS added.
> The generic default is a different set: it has BIT_PKTCTL_DLEN and lacks
> BIT_CBSSID_DATA, BIT_CBSSID_BCN and BIT_AMF, so it drops exactly the bits
> fw.c manipulates on this chip.

That's fine. The value written by rtw8723x_mac_init() gets overwritten
with the default value from rtw_core_init().

> 
> BIT_APP_FCS has to be set because rtw88 advertises RX_INCLUDES_FCS for
> every chip and the shared 8723x value has bit 31 clear; without it
> mac80211 trims four bytes of real frame data. v4 says this at the
> assignment.
> 
>>> +       rtw8723b_init_adaptive_ctrl(rtwdev);
>>> +       rtw8723b_init_edca(rtwdev);
>>> +       rtw8723b_init_retry_function(rtwdev);
>>
>> So RTL8723B is very different from existing chips?
> 
> No, and the siblings write the same registers with the same values.
> 
> rtw8703b_phy_set_param() writes REG_SPEC_SIFS, REG_MAC_SPEC_SIFS, REG_SIFS
> and REG_SIFS + 2 with the same 0x100a, ACKTO is 0x40 in both, and
> REG_RETRY_LIMIT uses the same 0x3030 in both. Its four EDCA registers are
> the same magnitudes as here:
> 
>   8703b  0x002FA226 VO  0x005EA324 VI  0x005EA42B BE  0x0000A44F BK
>   8723b  0x002FA226 VO  0x005EA324 VI  0x005EA42B BE  0x0000A44F BK
> 
> rtw88xxa.c writes REG_RRSR with the same 0xfffff / 0xffff1 pair used here,
> and REG_RESP_SIFS_CCK and REG_RESP_SIFS_OFDM are the pair that only this
> chip and 8822c write. So I read the three helpers as the family pattern
> rather than as something chip specific. Say the word if you would rather
> have them inlined into rtw8723b_phy_set_param() the way 8703b has them;
> that is a smaller diff.
> 
>>> +static bool rtw8723b_sdio_needs_rx_path_fix(struct rtw_dev *rtwdev)
>>
>> What does it mean?
>>
>> In many places using this function are not RX path.
> 
> Right, the name hid what it is, and it is a test the preparation series
> already provides. The function gates the SDIO only register work: the PAD
> mux restore in post_enable_flow, the path control save and restore around
> IQK, and the trailing re-assert in set_channel. v4 drops the local helper
> and calls rtw_is_8723bs() at those seven places, which is what rx.c, tx.c
> and sdio.c already use.
> 
> One more, where the review asked for a change that was already there.
> The declarations in rtw8723b_reassert_rx_path() that you marked for
> reverse X'mas order are already longest first, three u32 lines followed
> by two u8 lines, and they are the same in the sent v3 and in v4. If you
> had a different order in mind, tell me which and I will apply it.
> 
> I re-ran the hardware validation on this exact tip after these changes.
> The suite and the soak both pass: association, WPA2, DHCP, throughput,
> latency, scans under traffic, 20/20 reload/reassociate, link cycles and
> reconnects, with no error, TX-report, H2C, LPS or lockdep lines in dmesg,
> and no regression against the branch that was validated before.
> 
> Best regards,
> Luka Gejak

