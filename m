Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661940;
	b=w3fDuIqdDy47j64sBxNa40MIwI6/hgULz1PJx9vmFxHYKoFT/nYrekA4p49OMJaVD43L
	 dFr9a/gthPMPQzSsyQtvlvmY1bSS6/rAyn1TjYapcPnQHLiBWBIYSuEh9uPbvjKXuGYH/
	 HDBX3jLmDcl35Ox+HNMIjzqDMy3rJbK9N/94Dl/pdkvkeyCloZ8QjbGZ16eZcjdDVIih1
	 alFufcjkrIR4molJRcfnbs+cUx3/EfH6UNxpP0efUszdQFvG362t9vXEVCrCOQBPQlMal
	 FSgwC4HrVJbqxYglZBIQLadk3WaDxdls9jox8Xj9unGHKd313BcNmErBDKPmd+xCfxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661940;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=PIvHcKU8RxSTHCJiY3rrjMN++MkUl2ZsU9B218J4VrM=;
	b=L5XS72VRIfJen3gkzuTwLETJp9e/iw7ZhQEAyAiPlvV5z2roDa7FpWYv0EjN1qTCDMbq
	 Zul6/zsy6PLYnklrzjf8DIQBBwVsfhOLjF7TzA7dlddQNO2g//1r89j7oMxOFWiM1N6Pb
	 sl/7WKcAE6ZRIN6a44S4PD5fMyGklZ9ZxEmT7i5lCuH87GIWnGG6Tyaz3UkI7EqjujcN+
	 TsFOL1N3/5fTMzS1fqERLT77WS9BJKqonQ0YW9Ctqehe6+5Tio8FJwWkTcVfL+2Tf1bpI
	 vy1Dm6zzbC3msHYwBYneuhTF3pvIcg+9oQoOLtwJZPcH/8fBg4C/e/FMxu2N9kxSh4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IPCOhjnC;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B100606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B100606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IPCOhjnC
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91b52ba422cso48486676d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661938; x=1794266738;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PIvHcKU8RxSTHCJiY3rrjMN++MkUl2ZsU9B218J4VrM=;
        b=u8E64btUKifd/oYZ3adiEgEWsU/j+SUNWXWhSPE1XOlrbHNmFc2Ikq0+0bSp+HZx3F
         aLR8JJMDydu345N2Zypo0B057btw+qi8EfnnfmA6dDH4ASkWz9snCjN8b02pgKcyNOOz
         FC2FPc5/E6pdIQx1SBfw1GYm23OqKL/YvBMzuk0C+afM9t2TEueUKB0oVPmS5Ge54n/2
         RKrxEsqT9LMSH7JBH7I+hV0qcsPeGS7RTgEkYrRZTq4p/jBURxUwAUPtDv0Dc9f9a9lW
         Zm5yP66qUZ2GfgbzR3890NOBTeXv+0K+kHNWu2vKlp2ZF6vCrG5uiYy5RuL1rBM7Y2N9
         n5bw==
X-Forwarded-Encrypted: i=1; AKwUvBy91MauF+grBfjNwlJv/J9C7ruZD02XlBEpV5JFB+sG6shcI4WpZFxCwh5l3f9X3yTQ3u/gDMIrIFPj3kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL16e6uE0URj5FR/4DZu7bn0XqEAqdFq2+Lm9zBFO11qxTX1Wnc
	67Ai5jeI4HgT2If5jbtAO2MzvLtt/aC3/V/rr2KRuyWXTbW2sahyHaMitw18LEdfUE8kMaDwM0Z
	mXiHf4HuDYmbfOTNEmWtcnb4oSBzkTD+ddB2zo1A7JGWtlBUSDOs5mwDS+6dGoqTBCYH/55N86h
	QGOufNUr5jJih0p6kHQ4yb8/Zsc629uda7xf+l/Mls9dHCNbBWI0P97ifpD5cF2Egl0TQpQN+0t
	Y+zkgxMoJtB8Mh1vlAXTQAC1qw=
X-Gm-Gg: AYBFou1VfsfS2+W6sNIpBb9MzE529g4Iivn5H1wug7SMRsT81JJPt2G2OO+O/aMWi6l
	DQSxkUG1Uz7ZUdie83v8HTSy8kixXNPeZllJjmZxGehFzoaTa6eu/DogmEeP50m+OQlefdU3wYU
	Y9KOztBfnrLMpjh0boci4+TTFJBcatXMYgGrakVsANUdxBWeO18IZixuLNDrpJkmYBcZjxO6L8A
	ACFDlpgbiuURFC+VBE05c8h+ne2wB5/Gx+oLGm4vJBmrYm0VERJ6DDX9HTEWwq+2n18ppR9GPYq
	0G1t3Y3esuCdy1/QdKDTB8THU/8y3UHoecSWA1zejM/VAZLQK43q8GMJDLRVOigi0C0qwbl01XR
	aY6oUbpOnty7LgUrKCTiXAjsB2c87fedd+WD+cs1sjBF29LjTHAOiyMxEZHrJtzN+HzVg8VUiBu
	wlRnRg2GzoNQzPV85YBHObi7mIcQPPzCaITJPjzylh
X-Received: by 2002:a05:620a:1a1e:b0:93b:fde4:4923 with SMTP id af79cd13be357-944217ce7c4mr1845721885a.63.1793661938460;
        Mon, 02 Nov 2026 15:25:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9442581bc1asm99940885a.14.2026.11.02.15.25.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 15:25:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9441113670dso812158385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793661937; x=1794266737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIvHcKU8RxSTHCJiY3rrjMN++MkUl2ZsU9B218J4VrM=;
        b=IPCOhjnCr9kGzGzCuVsDpAoh8gUEgCqBOZluIA5ZjlLw8xdnTQtUjTC0ehxqBmP8Gl
         YgiHUy9JaXzgcOS0VR4i2psJxgDon5gzWZr5EiKAUthKuF/Y4veEetJv1qWaJk2ZSh+0
         0MBlxelIlcsqxqOYEwKM2r7YPErXxGMMNQYps=
X-Forwarded-Encrypted: i=1; AKwUvBy8RsRpM9q89iDEOkoa+eZD/35MbQmocjbN29RxXo1XD+P0twBBfqDlPsl4MX1nEyOIEFlexGl6e+slLP4=@vger.kernel.org
X-Received: by 2002:a05:620a:3707:b0:93f:5445:c661 with SMTP id af79cd13be357-944217b3b9emr1920511285a.57.1793661936990;
        Mon, 02 Nov 2026 15:25:36 -0800 (PST)
X-Received: by 2002:a05:620a:3707:b0:93f:5445:c661 with SMTP id af79cd13be357-944217b3b9emr1920506185a.57.1793661936353;
        Mon, 02 Nov 2026 15:25:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807d8fasm102470636d6.41.2026.11.02.15.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 15:25:35 -0800 (PST)
Message-ID: <8f49edbd-9916-4fcf-ac9d-5ccc7ac97f4b@broadcom.com>
Date: Mon, 2 Nov 2026 15:25:32 -0800
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
Subject: Re: [PATCH net v4 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps
 mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org
References: <20261029211540.4123250-3-florian.fainelli@broadcom.com>
 <179365621756.3131.9531361745901719210@kernel.org>
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
In-Reply-To: <179365621756.3131.9531361745901719210@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/2/26 13:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new code in b53_phylink_mac_link_up()
>    (drivers/net/dsa/b53/b53_common.c) sets speed = 2000 on every…
> 
> --
> 
> net: dsa: b53: restore the NSP IMP port 2 Gbps mode
> 
> On BCM5301x and NSP, fixed-link CPU ports now get forced flow control and a
> 2 Gbps speed in b53_phylink_mac_link_up(). The goal is to restore the
> proprietary 2 Gbps mode on the IMP port. That mode was lost because the
> fixed-link description reports 1 Gbps.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 0880310c9ce3f..743fc04da0a48 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1663,9 +1663,15 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
>>   	}
>>   
>>   	if (mode == MLO_AN_FIXED) {
>> -		/* Force flow control on BCM5301x's CPU port */
>> -		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
>> -			tx_pause = rx_pause = true;
>> +		/* Force flow control and 2Gbits/sec on BCM5301x and NSP CPU
>> +		 * ports
>> +		 */
>> +		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
>> +		    dsa_is_cpu_port(ds, port)) {
>> +			tx_pause = true;
>> +			rx_pause = true;
>> +			speed = 2000;
>> +		}
> 
> [Severity: Medium]
> Does this set up 2 Gbps correctly when the CPU port is not the IMP port?
> 
> The check is dsa_is_cpu_port() rather than port == dev->imp_port, so a
> fixed-link CPU port on port 5 or 7 also gets speed = 2000. Those ports go
> through the GMII override register in b53_force_port_config():
> 
> drivers/net/dsa/b53/b53_common.c:b53_force_port_config() {
>      ...
> 	} else {
> 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
> 		val = GMII_PO_EN;
> 	}
>      ...
> 	reg &= ~(0x3 << GMII_PO_SPEED_S);
> 	if (is5301x(dev) || is58xx(dev))
> 		reg &= ~PORT_OVERRIDE_SPEED_2000M;
> 
> 	switch (speed) {
> 	case 2000:
> 		reg |= PORT_OVERRIDE_SPEED_2000M;
> 		fallthrough;
>      ...
> }
> 
> The two registers use different bit layouts in b53_regs.h:
> 
> #define   PORT_OVERRIDE_SPEED_2000M	BIT(6)
> #define   PORT_OVERRIDE_EN		BIT(7)
> ...
> #define   GMII_PO_EN			BIT(6)
> #define   GMII_PO_SPEED_2000M		BIT(7)
> 
> So on the GMII register, the 2000 case sets and clears BIT(6), which is
> GMII_PO_EN. GMII_PO_SPEED_2000M (BIT(7)) is never written. The port ends up
> at 1 Gbps, and its 2 Gbps bit keeps whatever value it already had.
> 
> Some upstream 5301x device trees use port 5 as a fixed-link CPU port, for
> example bcm53015-meraki-mr26.dts and bcm53016-meraki-mr32.dts. bgmac-bcma
> sets BGMAC_FEAT_FORCE_SPEED_2500 for these GMACs, so the speed mismatch the
> commit message describes would remain on those links.
> 
> The new comment and the commit message both say 2 Gbps is forced on
> "BCM5301x and NSP CPU ports". Should this either be limited to
> port == dev->imp_port, with the comment updated to match, or should
> b53_force_port_config() use GMII_PO_SPEED_2000M for the GMII override
> register?

Not necessarily, while it is preferable to use the IMP port, 
functionally it still makes sense to be able to prime the non-IMP CPU 
ports to 2Gbits/sec should we desire so.

There is a separate patch set to address the 2Gbits/sec override.
-- 
Florian
