Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506216;
	b=f7fFeWYDxr7fcx1/JO4zks9B67Xvg/2PaQ41xErgAkjak4iMScknZPfsnojDgLjhZbUm
	 10tFT6/Ua1mrWiu6DdvzO7YA7FQnGkGyZlY/28YZn7NXFCs93MS6SSwKf4dIYryECEwJi
	 7nH8a7KA3dl/OyHWpHKNNLIGYszSjk5xRlIis/e4+YYV0fztNLx75kDHk4RSUU/9dVAIu
	 MRxq23j7P2rTpX+oU8g0d30CEY3u1wAYe+8OP2fX4SxH/seSYlco5miPWKeMaTqf/bf5Y
	 2xRCxBmlHpYMEOpCyW2Oo38kZFzz5VBOwXGAU6QWBtBXeTbP1pOwZtWc1GGVfv+pHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506216;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=TNdJWxZvcmjM9l9aikTSiEy3BSklSee3+ERRB8IMxYw=;
	b=IouHeTptWcFFJtSHGQMQyuEdP7a6UoRgLWR7Etlt1h6OuZUDLlBMbp0pZNKXs7zB7h+9
	 pUbkYcVeqWuLNXRYu/fyQj9iOJnNSiOs0v3hIur55PCeyYtVmvHTrhlVZsmV/3svWXlcq
	 reQbBEh78ZHYkA222rRkWJ2oP6MNM49NtsXv1Rb/2vCQwF9fP4fdgKL5lJHpiPzqgTJcd
	 a3wAzaAo663/ZK0m8g0mI9qnnLyF8xKj8d3ruIEFvbOEs3KeXPFYDTqYWzkPO007upALP
	 /zD0HCDvN1wtrZgP5IdKUiitYGowurKVZH8u2QbFMopUmKzq1zu4QgM67AuBgoR0KUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=djOwhY0H;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE08F606A8AE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE08F606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=djOwhY0H
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso42749a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506215; x=1795111015;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TNdJWxZvcmjM9l9aikTSiEy3BSklSee3+ERRB8IMxYw=;
        b=lZwzyoXgyp7aExSfSkhALIQkNTdAfT/5I4favFyoHEgGJQC0IHtVPDZtKGFrY4EjbD
         T6AKk5cTlUI7ijGBFBnI0pt/sIr0mYWgKpg2Xgjp7dzddwGUOvcX6uNI06TjlfNavdgC
         Rvr31KvDhV6gRBuZS0FvIIzvgAigNW6xi2ZCOSerkm41iXyc4GPBY3Vaj29WbB22GQjS
         8Ku/GyUcvTzH1kGztBrClTa+fD+6jbKPfXYXiUASqi9CfpbWsoYyOm+xN0GMeV9nJOYl
         6EhJU1BQZTyXWDrbaAOcL2t2rrKLnlzte8YQiphE8IeLOqPLMxEjs1DQy2JvWABEkicc
         merw==
X-Forwarded-Encrypted: i=1; AL+hErGL5jMxn7Wy24xsO40XmQqZX9QZ5g5fXNc/o2Jn11baU5FYmH/xcI1yRaXF90mLZMq3nImohJBlDccG06o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6ALcmYA0no1ljaunSEWlNWqXjfKt2kRSk9vkusiZICV7JRHv3
	E8dbmZw+SjQxjXB/Qjhheg9RqgA6IcbGThUrfcocy4K7uKJEXnhkcqzD0dhz/CwfSypwTfcuZWN
	oFD6f5/1DiDeJvv4R51SsEBK6G9vaC1wgKrwmtrjIFzPLo60Fnj+Lc08TexkF7//ZVGLVBOD4az
	6NeEPZ+br/lMz14RAl3o5FiC9drWLAguIV/1mVYI4k9FlUvmDWn1a0TK1lz+XRzsbAUWsjd/B0Z
	XGElDWJ5Hvjoxu70GeCCAuh
X-Gm-Gg: AYBFou1xMt6sY66ZpdFHl77TQ1S4J7qwb8CbdvXVywlpjIiTuLGEt32DsovoAtGouWH
	XpbRLBadMsEhyelQIFlVBw0qLkx8YtK5dLdzTSviCFLxYYSx4HhVhzi+bCFYGQdA5Q1cD4gk8do
	bT5mKh6UbTIin1Q1ow19mltuXcRIiyda4vX+3UDOXdOJzZbpZjaP2Cm3yqnCEQbO0BTQmgxzK0G
	WnF75aQeu2cea+rjgzYXZLBWwqnMLCgArU/WGGSPSsePdEaLY25iiJoDhQGWl5ePUZzosOjxcs7
	1Jc5QLRHOXVKbt8zIPnuomGJrbU/Y8vYF7pVeMOJ39+vmtO3q1/X8U25tE5GGkyFasGA0jK+try
	cuF9XOJlG0l8B2YSw5rNgzu21B0KQZ8Ltp8nwxjz6qGZOyJM0faW4X/AEaatkEPwnVI60nkHPve
	P9XLq7/nBdP8ioTVFDRMr1r7/uOln986aRhj+xuzsU
X-Received: by 2002:a17:90a:8c15:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b197bb72aemr1655925a91.0.1794506215061;
        Thu, 12 Nov 2026 09:56:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182e2e06bsm2183039a91.3.2026.11.12.09.56.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:56:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364f562140so2148861cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506213; x=1795111013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNdJWxZvcmjM9l9aikTSiEy3BSklSee3+ERRB8IMxYw=;
        b=djOwhY0HK7p3ZDeZAVDZuHf8OE+fmVwrS6XRyaE7/64eUgM2NJOZZICKgAkIY1FLMq
         4MK2GPLURNXUkVU/vyU3SdX/5I6pPjeZ7PpCUM0Mb+wzqPRSzsvdXdC/63/DOGvkdCVW
         euwZ7HU4JufX/rZbPRIfTp+fs8MAqaTQrCFhM=
X-Forwarded-Encrypted: i=1; AL+hErFf8yWovXjWPj10wf2R3kVMCjlCMirB9KC6kvVv+oGd/0LJ6OV02tDEhy3LcXvEPnCfUV9K/ZYXt4lAzjw=@vger.kernel.org
X-Received: by 2002:a05:622a:1829:b0:536:6013:be8e with SMTP id d75a77b69052e-55ac306bd81mr3226161cf.1.1794506213173;
        Thu, 12 Nov 2026 09:56:53 -0800 (PST)
X-Received: by 2002:a05:622a:1829:b0:536:6013:be8e with SMTP id d75a77b69052e-55ac306bd81mr3225921cf.1.1794506212662;
        Thu, 12 Nov 2026 09:56:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a231dcsm274801cf.13.2026.11.12.09.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:56:52 -0800 (PST)
Message-ID: <05e72a6d-c0d8-4692-ab72-4112e003172a@broadcom.com>
Date: Thu, 12 Nov 2026 09:56:48 -0800
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
Subject: Re: [PATCH net v4 7/8] net: dsa: b53: harden mirror register
 programming
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
 <20261110035018.2169370-8-florian.fainelli@broadcom.com>
 <20261112091927.7773f0a3@kernel.org>
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
In-Reply-To: <20261112091927.7773f0a3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 09:19, Jakub Kicinski wrote:
> On Mon,  9 Nov 2026 19:50:17 -0800 Florian Fainelli wrote:
>> --- a/drivers/net/dsa/b53/b53_priv.h
>> +++ b/drivers/net/dsa/b53/b53_priv.h
>> @@ -548,6 +548,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
>>   int b53_mdb_del(struct dsa_switch *ds, int port,
>>   		const struct switchdev_obj_port_mdb *mdb,
>>   		struct dsa_db db);
>> +int b53_mirror_init(struct dsa_switch *ds);
> 
> this needs to go to patch 6, otherwise there's a transient:
> 
> drivers/net/dsa/b53/b53_common.c:2607:5: warning: no previous prototype for function 'b53_mirror_init' [-Wmissing-prototypes]
>   2607 | int b53_mirror_init(struct dsa_switch *ds)
>        |     ^

Ah my bad, v5 on its way.
-- 
Florian
