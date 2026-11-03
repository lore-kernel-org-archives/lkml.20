Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732195;
	b=QNVl2cRjJ3nRNiKnkXRv1vvKd0GMOa3odbLJIzlUPitK8lwpv3kf1ySOp5OAkjHBnVQj
	 aQZIJPgMTkY9v/NSz9ZO6qVHEeKhKQtKzbz6GPojgyY0eX4m9neW22EzJ/ds6IvV/H6e8
	 UvbrqssD3SFS+YSi5YEC5VKWOuzR6U8ShEaP2DeujKuI7D8cmd6ka6xkwpSH6vi/foC2d
	 8OxpUOL9nnMzLBNyDH6PdIGtJVVeWjgIEJxavp4DHBygXJdmBW/nNDjZVcXl/8Yc53mwb
	 hRVqEpo4+/lkJKdkJW4xSHQCXNsbs8cUcxfydNCiqlEO6Ub8QgsdqYXYtYPZgsLEvuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PLO2xwfCocrBevVIKEHkd2tUmUVJORQjvzNZ7fJWYoM=;
	b=BwM5LLrq6NBaCb8VZ8iPJYKi+YasqODMsbDwI2ekarWHbZxQn6WYYQd8LxNS+Y/LbFG7
	 Mr78AToK+KySQS1dwAF6psSOylNZ/yiY71zfKHmt76RjSeNPiyHnqQwjq/+WPXu/ym2E/
	 VpO5Hq2N7gyBQSAh0zNClTYglhsm9bTuzSQnMtJlv7JxvaBS1PN8c1DWkfpZFqxlrrVKy
	 0wyVqogKdMUAROKVh/RZk0OS/n210ALSKTjsCDCurW03VCCdkUEn0q1J3oEN05ieaiSqF
	 m2866OEbdIyl3fzmk+lUKcKCmqkDPiRSBRhbOxbJhd6fOcpDTRKEt/X9bppdwmNeOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n28IUoCz;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ADA606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46ADA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n28IUoCz
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so38851575e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732193; x=1794336993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLO2xwfCocrBevVIKEHkd2tUmUVJORQjvzNZ7fJWYoM=;
        b=n28IUoCztPkOlL+/CXAG4SBObTW9aBGn/U7mFufsMhv/WPJsvUzl/Y6EqWzrh/yGMW
         dYc1WEPIQTohl016wkl+7KVSesl3V4AGRbXYsfN0tYCwm8bz5o6U/URwCHKOX+FIX4T/
         GWlhtg0Q/00gYJvxUKYUM6E4FtU3NVKe9eu7j0f/NURbl1DXRbxXy9ztlVNXEoCbXUx9
         fOZSJJ8pFblx/PPGxTa2J8wGhNZ9s3lyNWlCo+odAyFRAie9E73Xw2s7OvCrHueVWmkO
         8XSVuuU2/Yef8nXN5srjPUpuxNQJnwF4UKGmSVNBoTiiSk5X8Y5fWD19N1i+grIMF9hm
         rRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732193; x=1794336993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLO2xwfCocrBevVIKEHkd2tUmUVJORQjvzNZ7fJWYoM=;
        b=1PgKX9pJz0nd6k9ndpx1Pg41XSu0T5IKetfUkgHFgziP4kn9/K7ae78wsm7PM6Zo5O
         MRhDK7gcDXPGg70hafN8W2HzFx9lrgYGifQpkSCWhQK9SejrkYyF54u1asZCt6ehYwRV
         xLF38j4JFASND43a/LjLiO66i0XxN2xKPkTCIO8M1GL8B1sWgaJtzD7Ito6qkl/HJrbf
         AdQvKNTkXUPH1tJsmB0WEBCSxPVm61sUdGnPLmvUKCIt3NP3u4ysh7y9/S+XhHkyPWRv
         WybdjwejD5QOl32KVN1mrf7dxYe1nL//rRbml8UWOj4iA3gzbyAxfP0vY0iv8Hj7THEB
         a4vw==
X-Forwarded-Encrypted: i=1; AKwUvBz4rv3Rn3WqC/Mi6liN+yRuhldu20/bOGT4m0xqpMwbI77sKd6Lxx94ejPyhzU7RPe2uuA8CqenlC30uJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/goL9Ev/YufjrDIKEOYQZK5APwv81UHNxDcKPQXdpze9EJ//2T
	ZWGT0xxBGQQcS4cNSZDmuTAjHGe9jmLcsYkD1mrIxdwSuiSVR5mrrGvZ
X-Gm-Gg: AYBFou3FhiKYG1XXD8BGUQQkVy1JYZlnDTq22Rt6bkXyIoFoDXI68Edkg2ddJfU69mB
	rkFV15XmojKq6OvswY9SqPIJQJi/aTRsURNEZUjEoLiYW2RFexJzO/xetRe9xNPvsV/cgYaYFmz
	Ch9evfB/CYNFwhiBpkW7UNlqPyjZIu4jRW6qE0XmtPLY+PCAWkKl0g++Nb4l6Riu8Hp2/yQ5UdJ
	ZJR3otGdf9QawfMhGhiMMS/9/6naETVcf6aQAIWTjy5o60EtPE25E04hW3jfnXhHT6/4XveBaqu
	m6sfugXyj59S0sjiH3vmUUUGeAcLaCFXtoYKCeQSZUkxjvktn+/w4eeeqSTycoMVeoSEdJjuw3H
	FNyeuHA5UZQlxtWrF5/dpTjYW65B35KNoNjjAUBWHNyLW0q/7F0AcUP/2EaCfQjZR61vD9rCxC5
	NUirhQgoejtm3aNpPhkbb/+wfdVfy1rGAV6bgNsgzQtlW5x2hgSRTNPDiTalycIKwTv0DJ4KAar
	NfnC4TaLzlThJqME0FSClS7HZEnpY8xfqmY/3pzh287kJNhwvh/wcGIBp8vDqXjVTLW84z6zC7N
	b2aFZQMt0xEd2qj3BC/Z6DIYM1lgOL/shJMhQCKS/5LqTFg9tthMQ00gj/lM7fSqczitR6yyIE6
	tirjxmctHelPYsHHCC4cw73rH
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4ac17d16a1bmr319846245e9.5.1793732192587;
        Tue, 03 Nov 2026 10:56:32 -0800 (PST)
Received: from ?IPV6:2a12:26c0:4402:6300:8cdc:cc88:9490:1614? ([2a12:26c0:4402:6300:8cdc:cc88:9490:1614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d9fsm76736105e9.15.2026.11.03.10.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:56:31 -0800 (PST)
Message-ID: <f909ccfb-0bad-4ad2-a5d7-d836f4bbc958@gmail.com>
Date: Tue, 3 Nov 2026 18:56:30 +0000
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
Subject: Re: [PATCH nf] netfilter: flowtable: do not clear the offload bit
 twice
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Sven Auhagen <sven.auhagen@voleatech.de>,
 Oz Shlomo <ozsh@nvidia.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103-flowtable-offload-bit-v1-1-20f5952c00a1@gmail.com>
 <aunoySCHzqwI1QIz@chamomile>
Content-Language: en-US, pt-PT
From: =?UTF-8?Q?Jo=C3=A3o_Silva?= <jgc3silva@gmail.com>
In-Reply-To: <aunoySCHzqwI1QIz@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

The fix was LLM generated but I wouldn't say it's just "for correctness".
For some context, this issue was hit while developing hardware-offloaded 
flows for the RTL930x target in openwrt. There was a point in 
development where this was causing flows to pile up and eventually 
exhaust the TCAM of the PIE engine on the switch.

Thanks for considering.

João Silva


On 03/11/26 13:59, Pablo Neira Ayuso wrote:
> On Tue, Nov 03, 2026 at 09:52:56AM +0000, João Silva via B4 Relay wrote:
>> From: João Silva <jgc3silva@gmail.com>
>>
>> An expired hardware flow remains in the flowtable until its asynchronous
>> hardware deletion completes. Teardown clears IPS_OFFLOAD_BIT, so a packet
>> can create a replacement flow referencing the same conntrack entry while
>> the old flow is still waiting for deletion.
>>
>> The next GC pass calls flow_offload_teardown() on the expired old flow
>> again, clearing the replacement's offload bit. More packets can then
>> create additional flows for the same conntrack entry. A pending hardware
>> work item can also delay deletion and expose the same repeated teardown.
>>
>> Commit d2d31ea8cd80 ("netfilter: conntrack: fix erronous removal of
>> offload bit") closed this window for software flows by unlinking them in
>> the same GC pass and made the conntrack state fixup one-shot, but
>> hardware flows stay linked until NF_FLOW_HW_DEAD is set.
>>
>> Make clearing IPS_OFFLOAD_BIT part of the existing one-time teardown
>> transition, alongside the conntrack state fixup. Subsequent teardown calls
>> must not alter the offload state now owned by a replacement flow.
> Let's better target nf-next for this, this looks like LLM triggered
> for correctness.
>
> Thanks.
>
>> Fixes: e5eaac2beb54 ("netfilter: flowtable: fix TCP flow teardown")
>> Signed-off-by: João Silva <jgc3silva@gmail.com>
>> ---
>>   net/netfilter/nf_flow_table_core.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
>> index 0d72dc8ae47a..709b55b74cc7 100644
>> --- a/net/netfilter/nf_flow_table_core.c
>> +++ b/net/netfilter/nf_flow_table_core.c
>> @@ -398,9 +398,11 @@ static void flow_offload_del(struct nf_flowtable *flow_table,
>>   
>>   void flow_offload_teardown(struct flow_offload *flow)
>>   {
>> +	if (test_and_set_bit(NF_FLOW_TEARDOWN, &flow->flags))
>> +		return;
>> +
>>   	clear_bit(IPS_OFFLOAD_BIT, &flow->ct->status);
>> -	if (!test_and_set_bit(NF_FLOW_TEARDOWN, &flow->flags))
>> -		flow_offload_fixup_ct(flow);
>> +	flow_offload_fixup_ct(flow);
>>   }
>>   EXPORT_SYMBOL_GPL(flow_offload_teardown);
>>   
>>
>> ---
>> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
>> change-id: 20261103-flowtable-offload-bit-f15bfd1d38ed
>>
>> Best regards,
>> -- 
>> João Silva <jgc3silva@gmail.com>
>>
>>

