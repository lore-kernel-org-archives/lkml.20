Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861523;
	b=m7kzTZU5nrvWO6xmBYpXVEpSko6XdyXymrODWPUpLzx1SZhFN/ZGDWFflY5nZB/9M8u5
	 26yTKT8A1NJqZNkjfSWA21RQDd946suabujk7nzvT51nnXuMC5RrEXwpC64wz2XwavrVW
	 yblZc5YHsXQiJT4EmLObpBRZnqpgLgutReDUoJfaSxau3EBYjZZJ4BLqXvuIXE0TX8l1J
	 F3bFiVBXdlZjpXernSFNAgInHYa445YFC/dnJb9lRmsT4CuFb70xzmADZOrnQmKc9jkdS
	 KHiCpPtmjpXM9F6cu1N66bXGnBrVgTKlmV1iHkf+8+zYzayfiAj0omf4KYA6Kk6WpXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861523;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=s98m7DtRSQXCho+8dKpJWMInzXHI6Nok7u0C7ZYTglk=;
	b=C/1SqHSdkis5ct9dhwsIGWlL8GnuoiTIkf8t3CBGndOEurPWlGN0Fir8QN0LFxFZjDUy
	 2srVZW8+MHTicBO1gzWgn4hsEzthNnpEyKpsPOPfJ/P5oksmLa+HJSKXfQLX/DZBiRFiv
	 JXmZ0+4FSl1f9WcowhEF88AePy5nYYnVGGDUZ8w4weSdcdBIEsvvVdfpY7TJpJCcks+uf
	 0exUU/Aln9Hf/wDp1hC/XJN5PpQkUD0fYxIa7DgpR//k2YXlxhjQW7zu0RcqfGQDqw6u+
	 1mXfkOkph+Qa+A11FcWhTq1xq8XqTixHv41SaCHA+hllPW4lm7VzoJjQeCseZj3neFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YjW6lZV6;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67971606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67971606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YjW6lZV6
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1771853a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861522; x=1795466322;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s98m7DtRSQXCho+8dKpJWMInzXHI6Nok7u0C7ZYTglk=;
        b=0Lrp1FRQUXpTbtkTICMEyfw550BwneZRsUY5lw1XEqITdzqF3Dp2PCy0vOnhmMFBHK
         gZHnCR6Yg9XBFtLskYJaSpzSTTL9DRJ7B7jaQs5Qw52nsD+4siheEIR0XKPl02MQNKdt
         zd8jo3A7LISA9Mf41rfWWzELfgOFj+ZfHiAGSZONMT+WuLe9EDjkbFOUYYDloGV84InK
         u5naK5MCvPv0/3mcUj5nuBu09LC2RhU3zHkkENfwpiBDTkv/aq28JLopDrsURn8OMGEm
         rDu+wSpYyXIU/LsnsmxLXKcAshkr6iyeeIWef0bpTd5TkpBaq/909r0Rf2/bdYi9QYf7
         C3zQ==
X-Forwarded-Encrypted: i=1; AL+hErEHvcJv/9adGAkRu7ro5xPz008BulYcHsUvn0PqiklS1ScYtyizbN8m0X9FFIOtvgd4/IXCkydwmCkbheY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I4C9ikufgrNuUUtLC+JvcwgCp5VmrFbi7bWbgXztgUgnjhAzS
	0F+BC3gfj5ST2ijsYKXgz4uHw6ib1o13jMNQaeTB28FxWghSuoEm69w8gtJ81SVaVkxvVimXf3p
	nagElINSR7whGoX5utLUsNeKyOB4yAZHwFpuxKxdSSmLSz+V6u2FB5tDqMjOgs44p24oM0Cl2gb
	U7mQo8Z7VWPV9/oQd0zL6BjV5jBVbHXMps5gUL7t7eXVVtIiP5ieEebLBYO0ASx0yBDDyfLnsoC
	1tOHo+x+P1DVRs623//yi1C
X-Gm-Gg: AZFdTZfv46yf7ajo/7XMOFelD9xHL3nvR+GKnI3q3VwI5UHbyaH5YpCkjf38CN+uSfS
	ldYQdSGNwZgnO7PZ/b6LWJj9zsEGH7rOb0WzUEgomNrijKPcI9mbQKNfrsAl5nxU/4C7jBRwiqC
	joC/BpO31R61RK4fF+DWaHCxf1DPfNrVDJsvTr8c+1KZzaMwh3DQSbfV8BsbpkZJui9TZB96WT7
	aND7mAYwA0Z6WhMuJh35hFYbYIXxNcdDeTuksmmP0WQOPqnEQkISlr32GoOi6es6Hlgxa/f1gGL
	/eInnQ5hvXzJSYR1Tfldc3vC0Z8dxr6+w86dZNjvdmvU/FOq7NYaHRJK7EydNHCi+WPLhF5y6Pq
	sWEx/aHuPt3J2A+l8FB6j4XbNkzfVOUbaP36l0uUJ5sFh7E/j0MPMlQFvzkdB3DP90jTeXuENL9
	tXM79mlnIg11fgz0h/nctui76nt/ybwX0HAMw5hfNh
X-Received: by 2002:a17:90b:55cf:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b1b0a46728mr10084737a91.40.1794861522390;
        Mon, 16 Nov 2026 12:38:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceecbasm331333a91.3.2026.11.16.12.38.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:38:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso32094961cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861521; x=1795466321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s98m7DtRSQXCho+8dKpJWMInzXHI6Nok7u0C7ZYTglk=;
        b=YjW6lZV6gYat3SHj0S0fhy/ENOXs02MX6JZbo9VJMy6rvNJ5zshpiIJjQvKIIS4UZn
         tKWheF2cpelUDtG64GiiTurFfw0hxLL5cexKO6qZC5Tn26pmseWli5SxVJ4eEEskuRxK
         o41TB5dpy4hlKVepssDDaa9tiSevWd9+SmaDc=
X-Forwarded-Encrypted: i=1; AL+hErESqyJyDAs+HGlwSdJl5rYN/uvGw8/yAA3zjHbrSLx8G+y316yYq6KllBWw0VnIsn5MUAoHTEgUESEXxWc=@vger.kernel.org
X-Received: by 2002:a05:622a:60a:b0:555:50da:f038 with SMTP id d75a77b69052e-55ac4390a09mr182212251cf.1.1794861520876;
        Mon, 16 Nov 2026 12:38:40 -0800 (PST)
X-Received: by 2002:a05:622a:60a:b0:555:50da:f038 with SMTP id d75a77b69052e-55ac4390a09mr182211721cf.1.1794861520290;
        Mon, 16 Nov 2026 12:38:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d702b8sm94152456d6.23.2026.11.16.12.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:38:39 -0800 (PST)
Message-ID: <95351c58-777c-439b-93d5-c07c5d91a760@broadcom.com>
Date: Mon, 16 Nov 2026 12:38:37 -0800
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
Subject: Re: [PATCH net v5 4/8] net: dsa: b53: reject conflicting mirror
 destinations
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-5-florian.fainelli@broadcom.com>
 <179485573878.3136.15805681245029216909@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <179485573878.3136.15805681245029216909@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message describes the b53_mirror_del() capture-port
>    change as a separate bug fix ("This also fixes b53_mirror_del() ... a…
> 
> --
> 
> net: dsa: b53: reject conflicting mirror destinations
> 
> This patch makes b53_mirror_add() read B53_MIR_CAP_CTL before it changes
> any source mask. While mirroring is enabled, it rejects a rule for a
> different capture port and returns an extack message. It also changes
> b53_mirror_del() so that the whole CAP_PORT_MASK field is cleared along
> with MIRROR_EN when the last source is removed.
> 
>> Clear the capture-port field when the final source is removed so a later
>> rule can select a new destination. This also fixes b53_mirror_del(),
>> which tried to clear the destination with ~mirror->to_local_port. That
>> only cleared the bits set in the port number, so a stale capture port
>> could remain after the last source was removed.
> 
> [Severity: Low]
> Is this paragraph accurate? A later rule doesn't seem to need
> b53_mirror_del() to clear CAP_PORT_MASK in order to select a new
> destination.
> 
> In drivers/net/dsa/b53/b53_common.c, the new conflict check in
> b53_mirror_add() only applies while MIRROR_EN is set:
> 
> 	if ((cap_ctl & MIRROR_EN) &&
> 	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
> 
> The add path also always rewrites the field:
> 
> 	cap_ctl &= ~CAP_PORT_MASK;
> 	cap_ctl |= mirror->to_local_port;
> 	cap_ctl |= MIRROR_EN;
> 
> b53_mirror_del() clears MIRROR_EN in the same statement. Once that bit
> is clear, leftover bits in CAP_PORT_MASK affect neither the hardware nor
> the check.
> 
> Before this patch, the old reg &= ~mirror->to_local_port could leave a
> stale value in only one case: after one rule had overwritten another
> rule's destination. This patch now rejects that case. Even then,
> MIRROR_EN was cleared at the same time, and the next add overwrote the
> field.
> 
> A later patch in this series, "net: dsa: b53: harden mirror register
> programming", describes the same change this way: "Clearing the inactive
> capture-port field is cleanup."
> 
> Could the commit message call the b53_mirror_del() change a cleanup
> instead of a separate fix?
> 

Sashiko's point is correct. b53_mirror_del() clears MIRROR_EN in the 
same write, and the add path always rewrites CAP_PORT_MASK. A stale 
capture port therefore has no effect on the hardware or on the conflict 
check. I have reworded the paragraph accordingly.

pw-bot: cr
-- 
Florian
