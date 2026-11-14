Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628601;
	b=T7SHulm++NWUNJezXtiMPXCP42i4NyxJgWbxg2VyIuaUeYzElQ6Xv094hYM7+UWAH9Vj
	 Euj+vNrEEyOEN6CyewJSbM/rhclBAOkHbvS5Lygzf/PCd0JWtsIokE2xkuXb+9u06Wy9s
	 K9R6xCRrjTK//VPbDjiJT+b3PgbnafyjOHQAWOwDK52GTB6LhUCyRvSNPKZHXzabC+DYs
	 kEyNJz1M1vi3+tVrteFDcWWcXoDnw+qFLyCzNRVi/h35a4Drceq++VcHrSPOIFsI53h8+
	 tjsfPWkR8ta3J4TiE+E6KAMZAiuzSw101bTDgIlO9Mk7LvoIQ6cD1mOXhpVzRp1026w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628601;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
	b=lJP2TFxCNjQBh55Z2AKRYEz7gO9vSycHEKVxtrcc45nsp1RqJlgYBbix0z/DQeAIMCtY
	 oib//kfkKRGOirWHjoJmSWMLIdv8jzDPJBoDVg3bT/i9EKVuKfQFEXOfbNReRODo6N3To
	 +qyMN/D1vSRNLIC0u4fA2B9aFp6bF2H4fkj+lK6Ezcx4A/bmf9P4VsZYWZIYcaq5iIBDX
	 rCLEgjct5MJ+NEUFvfM4yyxgA03Ph/1XWEWQSimoj2qu9VCYtD9+zMYrJ8KVqFOjfpBRp
	 0/kujaqzu+d/X6AXdpPeZg/Kxk9Y7dJwlrhSr09EabJweTdPxQvERKcla6QxSOj5N0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHLmbNXO;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E8606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7E8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHLmbNXO
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so650065a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628600; x=1795233400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=syofH3PB3p+ORt7uK2VHwS/Skwyht7xl5YiRotzXlpww+mT6+wVfKlsg+mMrim+R7o
         xNRRXZXhLgBi6QwD6qrGEDNQmheV5/fmMYjd3OBHOdwMGG/MQtUBfS/lEIKqFsH7sRS3
         e88vU7attmIdhrGyvTTXb7broJWsly41oLBN0ND1d0AtcMSMcy/797jWI7WBLWy1cHUG
         ih6R9SwIa4PE2USCuC0OM136/5LPN5uexs+ncQoc4eWarSCamAPr86JFkPcKVLB08gVu
         bIU2F12jrkJq+4QtYuinYRqeIQKvs/QGMrTVM6/mwBovoAy8TLIhcV2XPFv+9oot8xRo
         P2Lw==
X-Forwarded-Encrypted: i=1; AL+hErEi+nn69b1OmnRBcWGwEU/eaP+6ETZlWMeVBghr014FwHM+PIt3Wxm/p3knsvY6dgCQUWtSRXchDeN8C70=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ripQFfG4ofmKzyaJe8xlmlO3/rdUj6hyxp4LDkLw48YO2ZDrR
	bMlTqboFZ8ZxnoGuDKyFccdGIp4QE7f+2/nZ/Po1d2tB5S8S5bLt07KgHiFXKpra+ePVFKB5x0I
	eS+fUWjL7tNngNTVjvgst12CjsHmM48+U8c3+LCISJ1Gk5d2P0c7G7qRbWT0QhQVCigBbva2LcR
	kuQLBNl7JBVRlTpp04uFjup1+iLmkXcfth4CICrSm2iGQo2GPe8yVS8Eb9JU/VGIvRJTn0GjgMG
	6nL1/W1RPGdjNMpG7NJoRCk
X-Gm-Gg: AYBFou3n/+EySml3zRvUOdZRZY5h0PopBKyZhTXCMd4AxTshTDNE6JNcEvRKxVhKk0G
	7mAFsxjm6ZznSGtwd7jdapJL7JoAeaA9xAcYhVRIZ2uq6BDyksKYWfeef5XYknxoywBEPQKpVV0
	sACkqraYkEdMh2qTwL8R/kwTk7VQAHqG4Q9WjVmWJY6nz2J9fygBfAg186+X4XEeBN54TArVU/Q
	8eLylbafL4AHD006tu1IfySKT/AOGz0q/n/9aj5tn2F9z/8kU4S7vNSmWru7Zlp1a4DLx5+AtgV
	kZ8j3B6PM3PQE4W75lm1m8A4F2xlcavqnMnPbpvyvS7sFY2z45/EcSnQWA+JrKcfCqlkN/Xl53p
	Yoaqy5RHo9Hpxlm0bMQbRjTROZQU2ly/FzIbM6lzX4IBDj1aNdv5FAD8Nw6KoU/kEE7PudYHCGX
	GWzpVEbyJvSZD03CczOsE79K4bHqbiwAPIEkGjW2n5
X-Received: by 2002:a17:90b:2246:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b1b0a0e792mr4647435a91.17.1794628599998;
        Fri, 13 Nov 2026 19:56:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3fbf607sm2600396a91.4.2026.11.13.19.56.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2093664eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628598; x=1795233398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=HHLmbNXOUVbk5kNYhMCzo/6scaEvDQk77zAHvGSPNrDGQ5lrHPYg0WpXzSqPgn0ViW
         sR/yWZQOg9V/HeozJO4SgWn4ipxTS7R8Un6X6Jd7APwAzI0bBXevJJGoHUZcV2TFQVFa
         z0Y9S/nd7IXMIjGh0BSbxm82gVdFU0hDYiCtM=
X-Forwarded-Encrypted: i=1; AL+hErGQJOTWsbP19A0lFGMCj7pjQKyV7kWKVfyu6J26y2kuHzwLpQXqwRkLuHlLi7T1SOexK7PCk0Hq7D7Y0eg=@vger.kernel.org
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008665eec.28.1794628598215;
        Fri, 13 Nov 2026 19:56:38 -0800 (PST)
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008634eec.28.1794628597487;
        Fri, 13 Nov 2026 19:56:37 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm12194066eec.1.2026.11.13.19.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:36 -0800 (PST)
Message-ID: <785b0ee1-a1e2-4f57-bc4f-3119615f8c63@broadcom.com>
Date: Fri, 13 Nov 2026 19:56:35 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
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
References: <20260907195924.29510-1-rosenp@gmail.com>
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
In-Reply-To: <20260907195924.29510-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/7/2026 12:59 PM, Rosen Penev wrote:
> Add labels to clarify which port is what.
>      
> Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
> having to handle this in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

