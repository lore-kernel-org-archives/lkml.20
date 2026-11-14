Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628698;
	b=FtQYCCmES58DGOOz+HiAbUped/9tOXU3BN0UsDX+taIDyLQmYHTUdq4t5nWwHbOr+ZHx
	 6bzGEwsLzqhq0sbm8kpqxutEixTzBFnkAK08ZLDBYGklNFuUzTE6AwFO3hQOCPCB6s51M
	 HaNXt+cPeqMyq9GIoLra/UPRY6dwi/nTnrwBZQad0plS90POA/lbkkbupJ/fR5wk2juFj
	 2r4cWxjwfLxfPDinkr12vAdnY9fBuvvJ8je2KIi9sHlGlsLO8CPYXCckzPKMSQZi7Exnp
	 dJtQsFIFLezpLlIqjWh5ZUN7ozbVnCanc1Nkag75BPy8539KGKvDWKfaL/mqvF/Bp5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628698;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
	b=vSS+ikkrpJe+xGprq/IFRf1UFu5IhkWbKZPyTBQsS0u9YzoiRcVVtO0K5UJCofYlCcPI
	 O0jzwOStXXNgWa0MuvgrqcY/+wU2xgKSvZew/XYgYXY6+QNZsU1jb30qhH3nRUOjcThTR
	 bSU6PHk1KfQVx81O7fUl7yJmQKk7a+LI2NYxCRrwkfTwPFt4j2T3kFZqRzTPyE3DLVNay
	 EwGa68QeiaHyEp6rOZWAXDZgzPfCKd2N8lFBMWhJAKz8SFQgb0z73aVUwv2N7JbR2bb9m
	 BBiOhPhnUxDorx/RYRAo8MTiB3KKDCftZFttVMoGTQTMEhsm5SnSwO0hL7hC6H71JEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EUgX5FSq;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46926606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46926606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EUgX5FSq
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso823617a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628698; x=1795233498;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=F7wAeT2L6HL6jipjNXHaPT7eSY85aAp/RUGn/tPpNGueAD9FS9T4+F6E2pI6Sb6jly
         bTOn0H12WgxfBTsI8AJ4WbY8p+pyz3+DgtNkvtM/H8IZ17n4+Sd4m6uCUBkIrY1gvccX
         1p0rPrfhYxMtJOPEacmAI6n+158ilnV90KSUGrrCtVYNOiD2ApUNIZU+ocDxGmaLW2yD
         zYTlO4iX35lygLIVPTu3FP9++WM78r4CVCNIztDSxtwupuP7G2YYeueGcqqAVqwcoIlh
         AH7uQ1xZ96CrNjl3uSYqmP5+9dNFHmpNtBGEO/vgTTTFFhm4ZAI4sU71iXPVLKesLPYo
         3TRA==
X-Forwarded-Encrypted: i=1; AL+hErGDbFr4tAf//yNW1UCX8Ked0thZU8pZW5kswLpHCWp6en/dNqn3JG5HBHcyQpqEVupj6g/DkmeBuL1cvJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PczEXeV7DsiwWr4n/KMV7bFJb2xDNzRpBbEM9H63FAMNC3ax/
	WNZjunRkRTiN93jzH/liEek0+rYpdv+qaroTw6iQVIn9fie0otOUHJL234PMdY2P1nMX6RDGsw7
	iL8w/4wEKn8Ib1wcTnu8X/GTBcQ8iaD7gYGGX33fTXP69SSiujqCvqM4PG7beKws1NWuM29pY3t
	f1WtnBsfqkArKUTB1Atb0zRy4oybGUTu9YqPiElQ3B5Zrf9iA0bWGdK7Z01KStbkmVwdS6ZZO7Y
	EUyKz4UlVORISlnsIAyO1+l
X-Gm-Gg: AYBFou0Jy5eHK3Vctk/0xAmmnoBFWym9uvlU7IhV/zNpM4g1phpFFrtHajZgIEdgYdN
	MMEa/TmCzLR33iLL/elu0HY79VWEDPXzYosPe8xwqSBZvujsGKDkSoN+T0qcGDE3Qcb2va9+vIh
	tYZ8VhOSuGCjiXP0JI/oGA+yB1wn5HvX3aUCOaIQ3w91BjwzQBxROfkBLNCHo9PbtREKhbJ+tla
	uYt00xUBCWDs5ePASCxLoE4kDRgpTFlgXNjMazM3xueLBN8TOiqHJXlDUpdEjVSCb1D4Oo7cYFo
	Qgcx+EntSAz5dYVr4pknE3TpY74oHayQUsZMicVJzR6+EH9BDtxKeA94wPQ47fFFUpKqGtD7WnS
	VKJyflmQXL9U/xxQJQtCxwBiVh2jwkeNnhJYuPep01utTluBudl0yLyTEFnb0wnNhBcDLhGIGqq
	GV4d27vDzXns+IRAMNYKgXJwf9Bstvhy7o4o0Jf2E3
X-Received: by 2002:a17:90b:3809:b0:3b0:da22:db62 with SMTP id 98e67ed59e1d1-3b1b0cc8701mr4258471a91.61.1794628697730;
        Fri, 13 Nov 2026 19:58:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f054sm6650854a91.3.2026.11.13.19.58.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so1417123c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628695; x=1795233495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=EUgX5FSqjuAssA8DsBuQRosSTicJV4r/3yNPVh11xcaq3h7k8WJzUbsTSJmUpv8Ket
         +vtenoh7othWqBjim505hd1rZEMeVXTg3Xqb151VDaEuclRt9V4AspUdZIccE6IkOKzw
         yiACaSCr2fX7tvtMN5tjEv3xlXgchn7fpeSOY=
X-Forwarded-Encrypted: i=1; AL+hErGpwdGewVm7OxLWk2ZhK7eCngpzlolWMwHs4I80XJHr/YMO3nyqJn87kCW5WuV8ekUMCM1JcR7Qe7KOUgk=@vger.kernel.org
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262705c88.14.1794628694737;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262678c88.14.1794628694018;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm13785460c88.5.2026.11.13.19.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:13 -0800 (PST)
Message-ID: <26f5268a-5a82-4bd1-9ea4-50cdd83e6e8a@broadcom.com>
Date: Fri, 13 Nov 2026 19:58:12 -0800
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911203324.104422-1-rosenp@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20260911203324.104422-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 1:33 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

