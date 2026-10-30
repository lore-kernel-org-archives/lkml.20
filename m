Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385519;
	b=TThF3exlXGndFt5K2E4epjcFVbDzjAabEsCK4sttc6i50f0CEgi9w5SzKSWnClT2U8s2
	 HiFgX4vFKXMDf9JejkGmaIJb2WXIAwgtT+l6PpcqtP1sMn65AQwzzGjKC8qnJqhlptP+S
	 WYAVW+kmZrjaJyH89uEmN1+n+h9552bLEcAkR2u8HOVlyD4jOCF7l8nO4s3G2as5a/QF1
	 hXCzyS9FqZaGjMnThhOetN+9z1P9h5BX9WyAuxSKRltvjo5wjRLI5UfLOdJKK2TKn2qfq
	 PPYXuUNyxGwZDZAfaG3dsKtNIECQHFlAo08T7cMHd2TAII3gOVc0vBA4Ir2ndQaST6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385519;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=enl1EseFXkx+U72ZVPGkzqGa2JIB15t8eF9UI8R7/0Y=;
	b=iD2BLE3O78XtVHBWWk9+BbeHiF+sm3hIRRwa0sZfd9OFJambe9poy3qWfmLTS4DqmQvL
	 tRdFa0trvcELr0GBfURi4S7rtyPF/HQqX8C9y3Hs0QkiEQBWVeaEvxTgF0USBpZDc7X4U
	 C3MBDUSBDlIWJUtT/okiBP2vlRpLv6La/WxBtU2ifQKhc/j/UaJRFI2YKryR3lISnBalT
	 qAfHa0RhjwjM4GFNQ3RWji51qzuxM8njwEbJ+dmJ37vjPXtNwBsXVYsvcnDm9rtAmnf2t
	 4aU2/WYMXEjyGf4uF+WDIejExysWQvg7At8XpWJWqFMjF83GMZQ2TOVvDOUgUuPYMew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="O3w1kDJ/";
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AA7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O3w1kDJ/
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a070781f63so511963b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385518; x=1793990318;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=enl1EseFXkx+U72ZVPGkzqGa2JIB15t8eF9UI8R7/0Y=;
        b=tcFmlUfvOk+5gU1QXfsl2rhbQb9y07lq42FXd0Wx2YkBavb1JIwBuef9vg8LlHe5Ky
         T13SgsP1NsRuwT7gwO8yaMUz5ZlbuJzP4N2+EO04sOWyJlZVxXX8xNiTz2VUP7Nw+2MA
         QX2UsSag5t9KJDaD5dBFht/oWEJf3e9q4rSBf+jdvk71r2mmqGqaHtSY/HP7T3x5+xrG
         VOm8Ey0s6z2f+o9Ns/Aarf637fWrWoaSbeO/za411HtMEMZUZqcBhdxUPXSEdEWHPUDS
         BCnhv5cS1kxJEYPe2K9jxoAbuqvrx5w/yGCvDiK7ldfaobWBMxBSqcHcuxhbiWehfGic
         pgAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP0Lqmtqw0ZQo+Qd+S0gP+imGbZXEw+B0X3bgyR362NpFzLThU0WfATVIydE8HuH23HRnmBdSqS4XYtVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLVNBxxnmlcImIG07Ed3usmkQuOKhaQPOJaE1/3SLU/Rek1zIJ
	Ki5aGpOOb2LuANqLxwjpjdA59x4434O7jfgDs8QQZqikr+7Gm9qXBzjWejDiz2HM5Jn9kbsj+0q
	DHjKmWZXOWdlzlPMxC92ufNzRySQRCYEY4aWT1vqaxm3tAVYxlShXmlmsTqXl3nZYKvQt5Q/ern
	5u0DFL2ISrjtYH6AbvFrtOHS3yEQk8LOi8/1eTYB3bN2AwiYQUMrLW7C71+67d4tiUCWaTKOf7j
	yLziFY8dNek2gQ1fVtHfV5dSC8=
X-Gm-Gg: AYBFou14NDd8z9/Z3iEhpZmb460DbEOl+uI9E7sz+uC0AvG/eJGpWdXDG9rrrcklMwE
	6e9DinEuco5ZmTiaHrZvkf7lrZ1sRYCIsTPDZI9BSg3mF78GT5KtUhjQiam/bu/b0JNf2uKOBD9
	OD5CRx+UDY4zwUFOqgWF2cO9uN89E52DDXgtRM0xZ+OLwOujE1FoVzHPHZXLoThOFW4fNJ1SST2
	FvcgUAoZhQRjPVdLvB5hcSwf3ESLLqxNLX6zQQMsiLET8V/34rygORDPTT2dAwsrx8+gABRXsm1
	PnUUTd9XJRua5GepeXZ+8IDbO0hEIrTq72ApW9khSX/XW4+hB7YqkOOOv5BXFqx0amyFs8JYdtP
	z2HQisJJ87UxJNTjUZb07tBOyYx3EVgkFQv+gFqXMvZFBI0i3MNLa7Bjm2xxAeCcpVnbSMAaQ/M
	/22ZeTYyHMBJJXM44frWAAp47ugEKdc0QqxG3DUYWd
X-Received: by 2002:a05:6a00:10c5:b0:881:fffd:26ab with SMTP id d2e1a72fcca58-8a9be1a5667mr2678318b3a.24.1793385517820;
        Fri, 30 Oct 2026 11:38:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8aadac9f0b4sm12917b3a.18.2026.10.30.11.38.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:38:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso161364285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793385516; x=1793990316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enl1EseFXkx+U72ZVPGkzqGa2JIB15t8eF9UI8R7/0Y=;
        b=O3w1kDJ/d1pBpglxpfX2T+WkgeqA0ruNqnILjUgBq551+kdLBtByLgT9WdBrvl6A4f
         uQafciPYYqH6qElxkbVuGJTukKvawi+2jhqDOxINa+4Yk2DEaBw0G2kc38Ym9kyk1n4T
         QWxRybdzl9zuMsbzieSrvAHrPI49ioE5fX8PA=
X-Forwarded-Encrypted: i=1; AKwUvBxWzPjJgQr9SNLI8flzx7UL6BZJGeLSIhXiAxj5QGElSDlsumhe2/oKH+niy56sqcT+nINJC1+ARoDkC40=@vger.kernel.org
X-Received: by 2002:a05:620a:2b47:b0:93e:c06a:7313 with SMTP id af79cd13be357-9442171a09dmr534077985a.13.1793385516092;
        Fri, 30 Oct 2026 11:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93e:c06a:7313 with SMTP id af79cd13be357-9442171a09dmr534075285a.13.1793385515719;
        Fri, 30 Oct 2026 11:38:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944252e581fsm205824185a.3.2026.10.30.11.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:38:34 -0700 (PDT)
Message-ID: <23f8cad1-d1a6-477f-bb3b-f3471ec50d21@broadcom.com>
Date: Fri, 30 Oct 2026 11:38:31 -0700
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
Subject: Re: [PATCH net v2 2/5] net: dsa: b53: fix the SRAB grant timeout
 check
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 open list <linux-kernel@vger.kernel.org>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
 <20261028212310.3847553-3-florian.fainelli@broadcom.com>
 <20261030113422.xg2sinp5hdiyfh4p@DEN-DL-M70577>
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
In-Reply-To: <20261030113422.xg2sinp5hdiyfh4p@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/30/26 04:34, Daniel Machon wrote:
>> b53_srab_request_grant() polls for a grant up to 20 times, but checks for
>> an iteration count of five to detect a timeout. This rejects a grant
>> received on the sixth poll and reports success when all 20 polls finish
>> without a grant. The latter allows a register access to proceed without
>> ownership of the switch resources.
>>
>> Check for exhaustion of all 20 iterations instead.
>>
>> Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
>> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/net/dsa/b53/b53_srab.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
>> index 83a03fca142a..f4689078ccd5 100644
>> --- a/drivers/net/dsa/b53/b53_srab.c
>> +++ b/drivers/net/dsa/b53/b53_srab.c
>> @@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
>>   			break;
>>   		usleep_range(10, 100);
>>   	}
>> -	if (WARN_ON(i == 5))
>> +	if (WARN_ON(i == 20))
> 
> I wondered why the initial check was i == 5. Seems like b53_srab_op(), just
> below this one, has more or less the same loop, but with 5 iterations. Probably a
> copy paste error.

Yes, that seems like it. I will be addressing the late Sashiko feedback 
received on v1 / patch #4 and re-submit a v3.

pw-bot: cr
-- 
Florian
