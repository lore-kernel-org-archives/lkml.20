Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124436;
	b=OHEM/Xst3IsCE7+mVYnvz3P0aigh5+N0AN/wQsUdvV2xWFpb3zpgTTGW/QAyyRWVSQuP
	 xPTDW5OFAbigPivtmn8S4OKtnVrb9JSYWHKL3SyNZo1FidiLuEqE5inpl0fkgpEuaU4lJ
	 feB2CRRuCzebQ3gJgHWbRXU0L+EgWi7lZmQ1QytYSxyi6quMRI1Mav3L4yl1xpQgCNaRo
	 M4QgN5W1dIhqYjmprFJUUCZAPMPvUxqq5TOgUaLNzilrkupBRVuR7lh9kc0oy8srn6jDc
	 BzV6EnoeypI2Da8eThBs2WOXZEL4KG8MgunrTv2aqOCQyy3TnVxLepwk8c5FDHw0vUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124436;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=txKnAOMpecG2Pi48xVkZvqz90pTRH6AnJzRnr4eHRQ4=;
	b=mM4vrVDceLRic0cQa3+6GKG0FKNPEP2bXsPDhjdZmEYmRNHsBbJPmpDY8lIhQc+vQ/cc
	 TGFZqA7aO/84HSGgL7gOd+/KMaEBtQ/uzgp8c8aphc6Rp3ldfMdCeRqRPrWV9BBcPwBEL
	 HdzPtzXLVSCll7PfTxq7Y8w/8o/6qP+GpbzryS+/iT0VEiZB07aWht62K0vvqAGxQDZbM
	 EJT4Vumb8vjvj8HhhOHrf/96FNJNrv6VpoNhw3Wc1Wy8w0tAZ+AsYHHAu4VBf0Nq6bweH
	 9FXGd9VrzVvV5qCLXrFP2DOQRo9LDp/k8E+iw6INUUKkXCFJe2YlBeCH58sKLw2f/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IRLsrdGP;
	arc=none smtp.remote-ip=209.85.128.226
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0240B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IRLsrdGP
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8ab3d3c5761so962137b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124435; x=1793729235;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=txKnAOMpecG2Pi48xVkZvqz90pTRH6AnJzRnr4eHRQ4=;
        b=E6Y5qfO4zCXtLntrJnQFymfIRQcSWlkQNqj2D0ZbbYFwWcNmDudZU8W6NRD5IabGZI
         xR5vTzQzxuViDwkueTVLhJGNHmrQAHqo5xwXPOS7zr78y+T7BO6AaLQr5wF0G3N386ye
         UBC5u2z7wDiz1rgCZ9JxuNO/BVlzLGhbQgN+2WNAmUVCg9cTXwaGNtBLIumsAz6Ioaq+
         lyQ0qJ8TuQg4gdSw51w3I7aaI4jKzlfHZ2AoHTgIqOlEEtRsobKXTVUpmb7dIccTsRQ0
         j7l9PGeB6yfqDJfuQ/jpN7iHaA5TpVLzOZi/H8vlM9Cacp4dzIHtWbSQXWXxTE4isMGf
         3OAg==
X-Forwarded-Encrypted: i=1; AKwUvBwRvMutjwV/JXCOJyn5BWEqJ7lE7TEFhjaFo0YDID+CENHxUMdhHMxdIcDqWH5DpE1RDWgh8HYDvmEbSN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIJ4aMmRGAwxkOHcz3vqak5OKVLF/YRBeRsxZBLc4m86FNbBrj
	201/XX3oTv5QFvUPLQc78jh3w9uu+cTyquZM3ZHXQG8wFu1pjpXC1YJFS5xd3wbo2BkaPF+tJ3A
	Kd3YPSKSkIJt0vlmXfktl9lPJuvmkUuIbeGf7e7UiJpetlrdYyOnsHuYIiztAxIQ9heBfFodAxs
	JEgE1RfGDNiFdrlG5USr6PC4qLnwEtxo+mTO//Ynmhvdd8dds8iJwkVBfL8vQiZizjmpnO7OQq8
	nhwaKLWSNbg5YCU9PJG25Ms3bY=
X-Gm-Gg: AYBFou320+aaOEisLHGpMJs68N0l7eRZA2VMuSyhgMvu74PkuKwr3KWDQvYOSIshtn0
	xe+19HbIrLYQYFXN8y2hJH2Zm/5xuYItUiI+046EgbcIdMIJUmkIqeRekPWxaMCoVrObiu4zLF9
	1V9j87yFD7fGYtA5puue1ob1Shc/6ungDAD/kvzQzbq9WGhkxx4ceEIjX3TG/AyvWVAliZ7Hpiw
	61ddnnxjlmE9fTJG2r+L7jozee6JaIiX5sXWoZmQQVSYVPUBxPKGVRcCfHdW/1q+/yZAkiKcwuP
	mAsH5t86XkwlE2gErzMc/D/4/72tTMiQekyLrx1d+Rij2pV3bhM4f20LhgyDat/xnghoGO4lubH
	6yjLolLftZ0jWTTbmFcBQQuUrvU5UEjLvLVgURr7p+CVg89w9Py3FHFEEjk2j4IKY9myYj+0DgG
	FJ88zCUAV2KmegkqC8XKmReEztr+HADK/HNhkBuwME
X-Received: by 2002:a05:690c:660a:b0:8af:1843:a9e5 with SMTP id 00721157ae682-8b166bfe4bemr86586997b3.23.1793124434851;
        Tue, 27 Oct 2026 11:07:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b19e672072sm457357b3.42.2026.10.27.11.07.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:07:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so186410eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793124433; x=1793729233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txKnAOMpecG2Pi48xVkZvqz90pTRH6AnJzRnr4eHRQ4=;
        b=IRLsrdGP0qRbvR0DvBGWZGZZxHMJgXeDypmI5rhWOwcD/xMwQJ/8NhVtgo8Uk7wqnk
         4vKsKcQbJM5w/NVS8gpkaNFG7PCDvBVkgKnI+EeKhCMWgHmIL5YLBMgJJ6T2EsUj4wim
         mntsL3fPqz08CRp8UytuaJ0RqrxyByTBmkdmg=
X-Forwarded-Encrypted: i=1; AKwUvBxlLqG8Ur94674XlGp8ujBXMFXZ4hb82n0/gh3zLzcq+0k2koG/c9vNVWAf6EDhxueNINjXqCopex6ei+I=@vger.kernel.org
X-Received: by 2002:a05:693c:880d:10b0:36a:1cbc:108e with SMTP id 5a478bee46e88-36a203df9e4mr239319eec.31.1793124433492;
        Tue, 27 Oct 2026 11:07:13 -0700 (PDT)
X-Received: by 2002:a05:693c:880d:10b0:36a:1cbc:108e with SMTP id 5a478bee46e88-36a203df9e4mr239261eec.31.1793124432695;
        Tue, 27 Oct 2026 11:07:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm44876022eec.28.2026.10.27.11.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:07:10 -0700 (PDT)
Message-ID: <000c8ac5-3d34-4c11-8b58-4ef9cd9726ab@broadcom.com>
Date: Tue, 27 Oct 2026 11:07:08 -0700
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
Subject: Re: [PATCH net 5/6 RESEND] net: dsa: b53: report link state through
 the PCS
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org
References: <20261022225656.1387306-6-florian.fainelli@broadcom.com>
 <179305844139.3134.6974876926759672110@kernel.org>
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
In-Reply-To: <179305844139.3134.6974876926759672110@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 16:47, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] b53_srab_port_thread()
>    (drivers/net/dsa/b53/b53_srab.c:371-380) now calls…
> - [Low] In b53_serdes_link_change()
>    (drivers/net/dsa/b53/b53_serdes.c:317-330), if the…
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but
>    b53_srab_request_grant() (drivers/net/dsa/b53/b53_srab.c:91-112) has a…
> 
> --
> 
> net: dsa: b53: report link state through the PCS
> 
> This commit changes b53_serdes_get_state() to decode the Clause 22 BMSR
> and LPA registers with phylink_mii_c22_pcs_decode_state(). The SRAB
> port interrupt now notifies phylink through phylink_pcs_change(), using
> the SerDes digital status LINK_STATUS bit instead of the MAC link status.
> The patch also removes b53_port_event() and turns on PCS polling.
> 
>> diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
>> index fc20e211e67e1..c7f3e131f2def 100644
>> --- a/drivers/net/dsa/b53/b53_serdes.c
>> +++ b/drivers/net/dsa/b53/b53_serdes.c
>> @@ -291,50 +291,44 @@ static void b53_serdes_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>>   static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
>>   				 struct phylink_link_state *state)
>>   {
> 
> [ ... ]
> 
>>   	bmsr = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMSR),
>>   			       SERDES_MII_BLK);
>> -	if (bmsr < 0) {
>> -		state->link = false;
>> -		b53_serdes_error(dev, lane, bmsr);
>> -		return;
>> -	}
>> +	if (bmsr < 0)
>> +		goto error;
> 
> [Severity: Medium]
> This is a pre-existing issue and was not introduced by this patch.
> The SRAB accessors behind b53_serdes_read() have a mismatched timeout
> check in b53_srab_request_grant() in drivers/net/dsa/b53/b53_srab.c:
> 
> 	for (i = 0; i < 20; i++) {
> 		ctrls = readl(regs + B53_SRAB_CTRLS);
> 		if (ctrls & B53_SRAB_CTRLS_RCAGNT)
> 			break;
> 		usleep_range(10, 100);
> 	}
> 	if (WARN_ON(i == 5))
> 		return -EIO;
> 
> If the grant never arrives, the loop exits with i == 20 and the function
> returns 0. The register access then goes ahead without the RCA grant.
> 
> If the grant arrives on the sixth poll (i == 5), the function warns and
> returns -EIO for an access that should have succeeded.
> b53_serdes_get_state() then reports that error as link down.
> 
> Should this check be i == 20?
> 
> [ ... ]
> 
>> +void b53_serdes_link_change(struct b53_device *dev, int port)
>> +{
>> +	u8 lane = b53_serdes_map_lane(dev, port);
>> +	int dig;
>>   
> 
> [ ... ]
> 
>> +	if (lane >= B53_N_PCS || !dev->pcs[lane].dev)
>> +		return;
>> +
>> +	/* Use the live PCS status, not latched BMSR or MAC override status. */
>> +	dig = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_STATUS,
>> +			      SERDES_DIGITAL_BLK);
>> +	b53_serdes_error(dev, lane, dig);
>> +	phylink_pcs_change(&dev->pcs[lane].pcs, dig >= 0 && (dig & LINK_STATUS));
> 
> [Severity: Medium]
> Can this force a fixed-link SerDes port down?
> 
> b53_srab_port_thread() calls b53_serdes_link_change() for every port
> whose mux mode is SGMII. Nothing on this path checks the phylink AN
> mode. b53_serdes_phylink_mac_select_pcs() returns the PCS for SGMII and
> 1000BASE-X in every mode, so pcs->phylink is also set for fixed-link
> ports.
> 
> When the SerDes has no sync, for example because the peer is not up
> yet, this is the call chain:
> 
> b53_srab_port_thread()
>    b53_serdes_link_change()
>      phylink_pcs_change(pcs, false)
>        phylink_link_changed()
>          pl->link_failed = true;
> 
> phylink_resolve() checks link_failed before the fixed-link branch:
> 
> 	} else if (pl->link_failed) {
> 		link_state = pl->link_config;
> 		link_state.link = false;
> 		retrigger = true;
> 	} else if (pl->act_link_an_mode == MLO_AN_FIXED) {
> 
> As a result, b53_phylink_mac_link_down() calls
> b53_force_link(dev, port, false). The retriggered resolve then takes
> the MLO_AN_FIXED path, and b53_phylink_mac_link_up() calls
> b53_force_link(dev, port, true).
> 
> Before this patch, b53_port_event() read B53_LINK_STAT. That register
> follows the forced override, so a fixed link always reported up=true
> and this interrupt never took it down.
> 
> The commit message says MAC link status "can be overridden by
> mac_link_up/down()". Does the link_state_pN interrupt also fire when
> those override bits change? If so, each forced toggle would raise
> another interrupt that reports SerDes down again. The forced MAC link
> and the carrier would then keep flapping until the SerDes gets sync. I
> can't confirm that hardware behaviour from the code.
> 
> Would it make sense to call phylink_pcs_change() only when the PCS
> provides the link state (in-band), or to keep the previous MAC-status
> notification for the other modes? The commit message also doesn't
> mention this change in fixed-link behaviour.
> 
> [Severity: Low]
> What happens here when the B53_SERDES_DIGITAL_STATUS read fails?
> 
> b53_serdes_read() can return a negative errno, for example -EIO from
> b53_srab_request_grant() or a b53_srab_op() timeout. In that case the
> expression evaluates to false and phylink_pcs_change(pcs, false) is
> called. phylink_link_changed() then sets pl->link_failed. As a result,
> phylink_resolve() forces a link down/up cycle while the real link state
> is unknown.
> 
> The phylink_pcs_change() kernel-doc says:
> 
>    If in doubt about the link state at interrupt time, then pass true if
>    pcs_get_state() returns the latched link-down state, otherwise pass
>    false.
> 
> b53_serdes_get_state() now reads MII_BMSR, which latches link-down.
> Should the error case pass true, so that a transient access failure in
> the IRQ thread doesn't cause a link flap?

Agreed on both findings. The next revision restricts PCS notifications 
to in-band links. On an IRQ status-read failure, it requests resolution 
without forcing link down, since pcs_get_state() reads the latched BMSR.

The pre-existing SRAB grant timeout check is also corrected in a 
separate patch.

pw-bot: cr
-- 
Florian
