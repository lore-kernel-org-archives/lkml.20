Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B751C076
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753253; cv=none; b=SlZal9AQX4Cf9+XFU5Mew2bFpvY2xtI2mVBQIT1CWpIbAxXa1D5KfZlX5DHeWk4cjP4TrouJQAa3AtNavNP4W+H7vL1XwR+fHSKl2sy7rJo1ale3eWy+pF7Siz/QnmJX4hHzHseVC8JvWX9AMKKUM2L00fv6vyuWfJKvopf727A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753253; c=relaxed/simple;
	bh=DmNUWwz/nsHmjIa42SJBChbIdcVeCse5wNu4dk/5vIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkB54ubDhIWQMMD05Z09hs3kYYBtnT1b9brwJsk30M7S0wHjRE+NmTcjuU3hdrzZRweFvuVKVkYRxWNUrdVffJ9Ku/TucANFY2qBEnF0boMvr0O1rCJF0zBHi04Zl3qhjvuNZkqVtK86nlhUxZq5YIwvgsQ4kfgxfwMx/B7HBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=e6c5HIXS; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="e6c5HIXS"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d6d28aa26cso2171385ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753247; x=1790358047;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XvJ2uzQiITp0BmLWCz/dXZ+391cWZWj8DaoZe0xZarQ=;
        b=CssOOMRzxSI9QBAUxxgprkHEPWb5PM7iQyH6XQ1N+l3OVaJ98twuMQ06lvhq24ry0m
         /QyYBsIhYQNt/SstmjoOGIt9ULHyDLtz9H6/KO5BzgF8cAivp4SnrT7JwYqdn3xQFtNC
         4h1rtWlZ5wM9awYyCZDr1sqLpqKNIJBDKOOVEvkH4HWYHYunTkK88Tjydza/KkOqXNrz
         cFFlyT98kqgNtrj+igq5SngdYcv4sE2oYfmeBOMED0iOYqq/Bp8XuyKewLfQoMoRcOsu
         LZ/B9fH+aEvdi8bvG0b0HsKsobEaRBTIlJXn+l8Nt7RHioFEG937iwpWUkgm/70jynlb
         obqA==
X-Forwarded-Encrypted: i=1; AKwUvBy29uVDBvS8t1izVbx+D0KVxdn0vkgj01BUo/OhtVW6eF9BGoUtwZgibqBFKTU1QtmF4tXTq9V9KSY8fUE=@vger.kernel.org
X-Gm-Message-State: AFuF++nXZ00R8CUys2K0wlxy7wNuFFsxDgz+DT69CwDm7URi9Dt9sz8t
	oZynYSvwELh5R+RVnzwayccaZDZuTBYdmHEV39KHBeL1sluWDRJeEjyh3teIJyCwTUgu0TLkjuv
	f3Sm+Nbsv0DHa9r75Ft9Kr7JcsNbBAcvSpeiFKKva5P/fBdiSqIVVjIk6zPgnr+9qJM10cF/prU
	I6I0cXfy82zqYShmdwIPRzAtfn9PEq7lIkGodHv2KKUaMfIvxaRBAnkkInTb7DbI7/GR47etGm7
	mrSIerZuINO53VmKdemHTYC
X-Gm-Gg: AYBFou1uTlvELG1V8PZJkKlkxrRJrW5gTqFziykf7WLFSJRMbwm/KxchcbXbr/fC1s9
	kKdUjq/glOUMt+QXRqYrRxR04/KtAuzvnyIeozZ/7BzYds6IBXuYo7wwLAIxZlTrNbplldXLT4s
	eEIDVvtUN2C5uBMnc9Ml4LlT5zAzJwkPwoTkF7Mnt1+jM9HcOiHg27USaN5xGY9t76bte7zWjnP
	CQBRsV8C2DfLAYhJmAhgy58UihSj9s4KC8+YlGPStlQyEwClYLUXeMmEYRACa76SE/U0ug7sbSC
	xuAckWTWIFvAn5UKfUOqhgyb4IG7wj/Eweal9aO/x4VUpTzPUq9P9g9svoPMDKsrmlGdmWYAxDe
	8hdAJwDFnkbHdHyETb005SiIGB7HQ39wiYAfJPiykd+Kqsmn1+mYmnVwihBJFBoQ1IeQzn7DIU8
	jxpteXP6OGlDcTrnceD3GkHW2H/8tw0asAn3GL00ji
X-Received: by 2002:a17:903:2290:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2ddb1bae4d6mr69782215ad.28.1789753247189;
        Fri, 18 Sep 2026 10:40:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc5b32ef5e3sm1083211a12.0.2026.09.18.10.40.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:40:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530e12b296bso21171091cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789753246; x=1790358046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvJ2uzQiITp0BmLWCz/dXZ+391cWZWj8DaoZe0xZarQ=;
        b=e6c5HIXSZTXrpO/RFhc6nE4gu77Z2RQYiZSqjAlaCSqjfGnCLYeepF75UcP3Okqwb8
         dcFYZry7vOj0k41zX4FBLKkMxpny6LZcteQYr3I0IdfnoIQi4k2ruyUCG5bvdwqcU8KW
         3Xh8AY2S2NuJy+FXhAYr9e5G2InWZ8H7BAvQs=
X-Forwarded-Encrypted: i=1; AKwUvBxXErCFiZBhJWOQncpNxk/Qn1+4IliNxiIdf87xnkps9GvH55Glvmg8ewIWvKUB/ihU9YCd2IwqDxTklyA=@vger.kernel.org
X-Received: by 2002:a05:622a:109:b0:532:8e31:d281 with SMTP id d75a77b69052e-5329e38ab0bmr52230801cf.17.1789753245744;
        Fri, 18 Sep 2026 10:40:45 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:532:8e31:d281 with SMTP id d75a77b69052e-5329e38ab0bmr52230401cf.17.1789753245174;
        Fri, 18 Sep 2026 10:40:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae618698sm2152411cf.16.2026.09.18.10.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:40:44 -0700 (PDT)
Message-ID: <90c88857-634c-4b2d-8a21-54c8d3ceb436@broadcom.com>
Date: Fri, 18 Sep 2026 10:40:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 5/8] net: bcmgenet: acquire ring lock with BH disabled
 in bcmgenet_dump_tx_queue
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Cursor <cursoragent@cursor.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20260918000732.276506-1-florian.fainelli@broadcom.com>
 <20260918000732.276506-6-florian.fainelli@broadcom.com>
 <f00892b2a993b3cd333f54660c53632c@tipi-net.de>
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
In-Reply-To: <f00892b2a993b3cd333f54660c53632c@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/18/26 03:57, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 18.9.2026 02:07, Florian Fainelli wrote:
>> bcmgenet_dump_tx_queue() is called from bcmgenet_timeout() in process or
>> timer context and acquires ring->lock using spin_lock(). If a softirq
>> such as TX NAPI (bcmgenet_tx_poll()) fires on the same CPU while the lock
>> is held, it will deadlock trying to acquire ring->lock.
> 
> AFAIU bcmgenet_timeout() only runs from dev_watchdog(), so BH is already
> disabled and no deadlock?

Yes indeed, not sure what I was on with that.
-- 
Florian
