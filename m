Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756527;
	b=zgOTAjewr/JnO7cjxNn0qjB3xVn2dgkXNE68rQz34f+tuxrk18+OiXQqdEnca9ktp3IC
	 ljKpkK/CzpWvLG3Eh/PEQZqFudoQr9uoqAqSx5fvU/lA3ghhyPXNr20RWURHGNtq5b615
	 3kScHpPwlqgc92WGFalrZBBu4+fVFUEDPkzsC0ztGzAIwF7neTAr9ffRsZO+AFWhswNkl
	 EI1580aFZFqYyE5rIkAIv3MPiVahzxCER+cppdmsRPvtrzZzA+g5lIu3RDQ9waxmrSIsC
	 /Z4duKfqc52UgEsnPmVAXGY/bWzeBEGItxnHfdRpqs5ua8l4ePhYF2IE1mmDiQ0M5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=j8yx8MHMvq3picZ6FejOsjo0XQHjNiSaAE6rAN+gpXs=;
	b=ZcLcZs4tcCkM6Bm/41wn2rNgdb52WQik6CPigJTZHnEn07tZWsgo5AtFeGaQ47RwOqy3
	 xTTaVq1tzKJ3nXZAZ+ArVxaLfBObdTL+ROwjYuiUwwy8s2GVC0JiP8hnZTzKDaUDcNi96
	 zCUyi4z1va6e87HRq0UfVQxDiP9YJpyVApbp52xMBsJmFq4lzNhj4Yq9zVJ7VMEtzTzFF
	 lwibVTSKrX3n2sazN3G0pq8rZpn7nx7qvazqfVemeK9D8K5Yf5Bhaz5qAlbX31979oQg+
	 SUl0p3wVAsB/e9kn/NFq4Hsz3Hc6LMhaQIbwFM5+TGRNVAonjc/pYYpPhucU9FeL2xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PFHvA544;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232E606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A232E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PFHvA544
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so472985f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1792756525; x=1793361325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8yx8MHMvq3picZ6FejOsjo0XQHjNiSaAE6rAN+gpXs=;
        b=PFHvA544qyvx7w23MQzVC74QWW/SRzZ620CxgtB5Lzfts/kmVLTK9LVu/PbiUqtpmQ
         fR6SuJXzgDBWYoMN7OqDs+CmxiTblqUxWpUQB7tSj1GlX7ylAnRSILjXSkLCdUmsFban
         /T4jZP5o9Tcbq+DZj4jdLX8JGj9YBQ+txlhoGdsx8nByhZNxj9hBy7jdrc5TIdVsaptn
         HQl1EynC6kjNPhBihCrE6XueQBipApHotswqnWp0psjcqm8nYlIak5g6Lp1QgA3vFRl0
         QcHle9PEatWJcP5XNeld+S5KWxy0om2BibO6CQY/aWvEDSShhmPCdGtAchjwYvNlHAvu
         Aucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756525; x=1793361325;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8yx8MHMvq3picZ6FejOsjo0XQHjNiSaAE6rAN+gpXs=;
        b=fIfZy056kht00D2CPpXT6IsMlAEpfO1a4lWe+ZFUHqUzLfxlRTTDbhOok39JRZQIXP
         rKVh2a79VixBQnQWlzQ/4tqgPdd6aeIFZseHBCjSHwL+5bswttkHMVXdrfQtNuEqdqcA
         +zPfrpCS1EOFyI323XTomnEurZemJAKmhzHKKC0Sp0zMcGs9jxkN5juz05bvBzIPEVMV
         bqUK99RsHq5Tzlv7qYvALp/S6emXqB3GY2SXW6wnILsxV36RUp6hX/b7H7cNLksGsEJ6
         olOGgytkfxkrs0+0uM8PkOIDdPe3qd9dD5RWJWA/L+L0MVLJ3EsajZ+iTA+0szC/kf5c
         DEyw==
X-Forwarded-Encrypted: i=1; AKwUvBxtmSIVyslk+IeyepemaQcAy3JX7GBzHtmS3FxXJ6lBz5NUtWVujTEQSsBGHUHZ0ArJ1Uz3zHm2R3Z4VuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKasm2iU3RXdHx8uHRi9NjoavVUQQBG5EwPdXreg6240oHvQXvg
	BQ78Cfft4MU4WJFl/W4UfE+FGJreRbNUE5NVrwHenpFw4aAy25ihHC5YRY1MPBO+pLI=
X-Gm-Gg: AYBFou2I82QMEOA79FfS8MEEL1BWLKVCiAdlxnLyhrjf9LVndnrvaVLfxzKtdd1Ji3/
	ZcDbZWV31qozLFafrZTz1NK40NxuWp3gf9zb6Xiziwcs97ZHJu0su2uMCd63fXGxulNAL1IW3gw
	QLodF/wizE9+iEoXyzEVxiXNWHn1FC8cUrDctQ3Ukvs3pmyu39B1OoP1ZNieeN0jHFiypZhaZay
	Nb0EC2xRr4JB+Fk2OJzo3zKgUzq+nRoQ+FmeMVejEJULyX6gUvAKF22hrW3ew4cZN7cJC4QZRfn
	px2zmhY8R9q0r4Xtd8OM/D5dqNAfN8Q8RuyRni8dm8fDN+3zVoGG4lhUoXeY1yFXI1VbZ5dCy5/
	huC32FJqi1ujt7+I00uAg10k5f/O6pavUBMIoFeqv6dQBZNq7XJTREy+gmiVvDbBN09VpgEtcfb
	eDVkdUPwD/FzzadI/+ZnbOT4PJSdHQ9RHX/eejbj4XOe1WvKbqGv310vXl1nUiL4oSv8pJ79uqP
	Zc96iRD8ho/19Ub/zmS4d+2RVHPSeyP48o7AfB9CDOZ+FmogeTzsndtus8iRmlXDyBP6M+U7hUc
	dnmjuUxyyBmLZPrJkWON7l5a0jgcVuc=
X-Received: by 2002:a05:6000:2407:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-48e38546abdmr3350412f8f.6.1792756524809;
        Fri, 23 Oct 2026 04:55:24 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314aesm4238717f8f.28.2026.10.23.04.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:55:24 -0700 (PDT)
Message-ID: <dac940d7-ac2b-41ea-b362-9c95edb5bcb6@blackwall.org>
Date: Fri, 23 Oct 2026 14:55:23 +0300
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
Subject: Re: [PATCH net] bonding: fix out-of-bounds read of arp_ip_target
Content-Language: en-US, bg
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: stable@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261023104528.232427-1-jiayuan.chen@linux.dev>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261023104528.232427-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 13:45, Jiayuan Chen wrote:
> arp_ip_target is a module parameter array with BOND_MAX_ARP_TARGETS
> entries. In the loop parsing it in bond_check_params(), arp_ip_count is
> the number of accepted targets, while i is the index into
> arp_ip_target. Invalid and duplicate entries are skipped without
> bumping arp_ip_count, so bounding the loop with arp_ip_count lets i run
> past the end of arp_ip_target, e.g. 16 targets with one duplicate:
> 
>    BUG: KASAN: global-out-of-bounds in bond_check_params.constprop.0+0x1148/0x1440
>    Read of size 8 at addr ffffffff96e9ee00 by task swapper/0/1
>    Call Trace:
>     <TASK>
>     dump_stack_lvl+0x91/0xf0
>     print_report+0xd1/0x630
>     kasan_report+0xf3/0x130
>     __asan_report_load8_noabort+0x14/0x30
>     bond_check_params.constprop.0+0x1148/0x1440
>     bonding_init+0x13/0xe0
>     do_one_initcall+0xe7/0x5b0
>     kernel_init_freeable+0xa91/0x1120
>     kernel_init+0x24/0x220
>     ret_from_fork+0x5b3/0x820
>     ret_from_fork_asm+0x1a/0x30
>     </TASK>
> 
>    The buggy address belongs to the variable:
>     arp_ip_target+0x80/0xa0
> 
> Bound the loop with i instead. arp_ip_count never exceeds i, so it
> stays within BOND_MAX_ARP_TARGETS too.
> 
> Fixes: 5a5c5fd48e3b ("bonding: arp_ip_count and arp_targets can be wrong")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>   drivers/net/bonding/bond_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 09aa45d71fab..7019e5d8fdc8 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -6273,7 +6273,7 @@ static int __init bond_check_params(struct bond_params *params)
>   	}
>   
>   	for (arp_ip_count = 0, i = 0;
> -	     (arp_ip_count < BOND_MAX_ARP_TARGETS) && arp_ip_target[i]; i++) {
> +	     (i < BOND_MAX_ARP_TARGETS) && arp_ip_target[i]; i++) {
>   		__be32 ip;
>   
>   		/* not a complete check, but good enough to catch mistakes */

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

