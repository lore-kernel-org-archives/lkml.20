Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124502;
	b=IC665NX8PnzjG6uDuTvP0rQzi+YXQfahY6p2yB5eRn1hOHcoi9Zz/rTzMdwNfONZuFwQ
	 jPWels7tYQmJsHUqKJI073QQ3DvjbFYGfeZfTCHcvesVzkm7IFAO4FSThikLz7pgiPR2o
	 lYg1Cw/XfL9ktUtS+/AI2/7p7mKbMB3jeVp+FNZiPaCRMktpRv3NcB3Xs832n298I0jpE
	 D2ZiouVKE3neiDb5CY2NxxEPOhL3LP7kE0N9lS1kqKLH7Gpo4kr/o0Ja7DRVq2lm5Gyt0
	 FLI6oYRYQwXgzCfy873XIirLtTM90ZGXQa1TRWPLBE/7WNuxjMghVpExCl2Ctvfo0Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qLGKRwhouRQrKfeH7Krfw01ipnf1xQ3/sROcXsN3FBg=;
	b=lV7XTDyH5xWaJL3g+EhWJnk/IhmfMBkBY52IMH9Cy+VibRAkyekl/E+4S0BG5da//UYO
	 dnpeipDKP6/AWah1hbKfMI6QjMbxRZZLvONChVdCnVznsZTLto92wpmcAKzepUNoj0eLH
	 ZIBKsiomxr7OLIdjcUaflmyccQw/nw5pq8Vlj6iX/4Uuk+fFwjZ9CYi6tHO7OZCuFd6OX
	 bibC0vA4HgZSfZap/iv7K8oUphu46TXSCS2cZHCDMuQh4v2LFKkNF8jZJFHzxVn/EtLp4
	 xI6n1FM/0TIOOHo9QZp7JQQw5vqvMCVes0PGkbna1OZYENlZVuB0LJSe85CJFjWRPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=My+56XNf;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=My+56XNf
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so135822a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124501; x=1793729301;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qLGKRwhouRQrKfeH7Krfw01ipnf1xQ3/sROcXsN3FBg=;
        b=x8q12ZsKSqo8Kf+9BjwGVLYSdZHjcTwJulkLvAhqErBaintxcHKW9qGN9UlLz/dV3R
         1XhXJa5outLg0gKbC0bTqlCYXIEbF2nu2ZEGcGtN+FuZbspaL7WpYPyqCZf+bVW3J4qk
         6HqOoXob7OqVyyNYotoG5q2gZLlaAEDapN3NU3cXIIaCgtYaAs52prXYtDCOCeVmSKII
         eBO4VM7m1JUmkV9GI5zzF/khln+Se+ONTOu4USvo05QjmtxKB31pa6GuecdY/jck7k0k
         c+iy1ACfOhw0Y/p9/vqUYoBZnZlU7QHhPP+HVREobcD4NaKhRf/GCSa+fsBkaq4/Ll/4
         DTHw==
X-Forwarded-Encrypted: i=1; AKwUvBxr/jemXiOeysPRvRBv7aP7tos2sceGy2IYuzTh3yVqEnLiqsucb17ho+9fAWvZYVG7LEaXYIDC4qqG3N8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLypg9Xuptp1xpT+CIWPmmJ4+VDzxqVs/Ar/kSogQFSvVUGvipN
	9mHuoWjfa6soS/oH/yqthGisoB+UJ79qx4irUQ+JrnR9Yu99hqaETTkaa/Q3RZDCUkj0E7eySTA
	wTgFaq1rsJEEsHk6UTXhokS0go37/xAcaw4gwp8Uhq/NiaSi7xPgDtdAcdyH3oqRsfp8OOg6UEY
	qSjnJqQvbA213Zxr8+g9+3sxcQKy6qBdsca3AU7hNDiZG0wD8h3o0Shj/SqJHRs97nlbqVgzbW0
	uoGSJRmZ+C/Hg03gQJ46kHg
X-Gm-Gg: AYBFou2vPFt0L1+p+r7YblsSGg89AvdWGTh3khBGu+ts3wVYtraODJULkt7pvMkOf4D
	9nMwdnv2e6J9FnOAJ3cW/iUZvXR4GJcfzyKyVZtTn5XDqnoypoF4HHr9DdZFIdsgfde40uaGN+m
	1uE3bGwPRb5YOgbQ4DmzsWL36YQErCdhrKXCIEexomBMpYpdz+UbAbvvKUJOICNY/EIaUKfMDTs
	N+UQQC2+SROXvHO1CvtwoWvUI7z1ASpasD3DUwn3tTUrzbvLqz68KD6hf8DiV0Ul+mFulZojZze
	ORfRUsqHFaWoa7WFAy5bg6beNrWsfI4ezvlTEHoc3TELe645UahpXoUP46zosfr4l20ukNkN9Yn
	ouwEFUEYTC4BCvq2stwM1CUsG1vErcRS/AS5//k6aLdh5kj87nlFDBMYJeqP720JtXQ7FL5gipt
	eHRw8FB621bo5DvdPbLrRLz+nxPaLmJm1WjSYMMs4k
X-Received: by 2002:a17:90b:2f90:b0:3ad:50ef:f5ff with SMTP id 98e67ed59e1d1-3adeafa0efcmr8387722a91.37.1793124500929;
        Tue, 27 Oct 2026 11:08:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784dfasm2572732a91.3.2026.10.27.11.08.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:08:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso144425a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793124499; x=1793729299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLGKRwhouRQrKfeH7Krfw01ipnf1xQ3/sROcXsN3FBg=;
        b=My+56XNfDdgoUqKp5NJZxnZKOq9QHhzbjiCeWwYGVwUiXbiaRzwXGy6a1BZOIXD1gv
         eh9Stw2t/aq8D2OMBX3ZeRKSYqGPIwflSApPjXJ1eOOj4VNekYBBvOxmzTByohvTAmuo
         aEeGWLhjMsuZI0Udxi6AqqF1S7UUknE/khcc4=
X-Forwarded-Encrypted: i=1; AKwUvByvynlzj0fV5z1FsGLH2iy/pAoLMctuSipHF6D6p9Goc9krBGDhreEggwfLf3yGGm0THXHdfo1pAnhlfHo=@vger.kernel.org
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr8264643a91.50.1793124499055;
        Tue, 27 Oct 2026 11:08:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr8264620a91.50.1793124498523;
        Tue, 27 Oct 2026 11:08:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm4747230a91.11.2026.10.27.11.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:08:17 -0700 (PDT)
Message-ID: <fb183eec-1aa7-4cea-a383-e272536245e5@broadcom.com>
Date: Tue, 27 Oct 2026 11:08:15 -0700
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
Subject: Re: [PATCH net 6/6 RESEND] net: dsa: b53: apply resolved link
 settings to serial port MACs
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org
References: <20261022225656.1387306-7-florian.fainelli@broadcom.com>
 <179305844256.3134.18146519874106302835@kernel.org>
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
In-Reply-To: <179305844256.3134.18146519874106302835@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 16:47, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 (2) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] b53_force_port_config() uses the IMP-register bit layout when
>    it writes the per-port GMII override register.
> - [Medium] net: dsa: b53: b53_force_port_config() clears GMII_PO_EN on
>    non-IMP ports
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but
>    b53_srab_request_grant() in drivers/net/dsa/b53/b53_srab.c checks the…
> - [Medium] This problem wasn't introduced by this patch, but
>    b53_force_link() and b53_force_port_config() ignore the return value…
> 
> --
> 
> net: dsa: b53: apply resolved link settings to serial port MACs
> 
> With this commit, the b53 phylink link_up/link_down callbacks use the MAC
> override registers for SGMII and 1000BASE-X ports in every negotiation
> mode, not only for fixed-link. At link-up the MAC gets the speed, duplex
> and pause that phylink resolved, and at link-down the MAC link is forced
> down.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index b04f9d5f05256..172ada124cbf1 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1600,6 +1600,17 @@ static void b53_phylink_mac_config(struct phylink_config *config,
>>   	}
>>   }
>>   
>> +static bool b53_phylink_mac_needs_override(struct b53_device *dev, int port,
>> +					   unsigned int mode,
>> +					   phy_interface_t interface)
>> +{
>> +	return mode == MLO_AN_FIXED ||
>> +	       interface == PHY_INTERFACE_MODE_SGMII ||
>> +	       interface == PHY_INTERFACE_MODE_1000BASEX ||
>> +	       (mode == MLO_AN_PHY && is63xx(dev) &&
>> +		in_range(port, B53_63XX_RGMII0, 4));
>> +}
>> +
> 
> [ ... ]
> 
>> @@ -1633,29 +1636,22 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
> 
> [ ... ]
> 
>> +	/* Force flow control on BCM5301x's CPU port */
>> +	if (mode == MLO_AN_FIXED && is5301x(dev) && dsa_is_cpu_port(ds, port)) {
>> +		tx_pause = true;
>> +		rx_pause = true;
>>   	}
>> +
>> +	/* PCS negotiation supplies state; the MAC applies phylink's policy. */
>> +	b53_force_port_config(dev, port, speed, duplex, tx_pause, rx_pause);
>> +	b53_force_link(dev, port, true);
> 
> [Severity: Medium]
> b53_phylink_mac_needs_override() now returns true for SGMII and
> 1000BASE-X in every mode. That means the BCM58xx SerDes ports (ports 4
> and 5, see b53_srab_serdes_map_lane()) reach b53_force_port_config()
> on every link-up. Those ports are never dev->imp_port, so the helper
> programs B53_GMII_PORT_OVERRIDE_CTRL(port) with val = GMII_PO_EN.
> 
> Does the 2G handling in b53_force_port_config() use the right bit for
> that register? In b53_regs.h, bits 6 and 7 are swapped between the IMP
> override register and the GMII override register:
> 
> 	PORT_OVERRIDE_SPEED_2000M	BIT(6)
> 	PORT_OVERRIDE_EN		BIT(7)
> 
> 	GMII_PO_EN			BIT(6)
> 	GMII_PO_SPEED_2000M		BIT(7)
> 
> After reg |= GMII_PO_EN, the is5301x(dev) || is58xx(dev) branch does
> reg &= ~PORT_OVERRIDE_SPEED_2000M. That clears BIT(6), which is the
> override enable bit that was just set. GMII_PO_SPEED_2000M is never
> cleared, and the case 2000 path sets BIT(6) rather than BIT(7).
> 
> As a result, the b53_write8() at the end of b53_force_port_config()
> goes out with GMII_PO_EN clear. The MAC briefly returns to autonomous
> hardware control until b53_force_link() sets the enable bit again in a
> second write. If the bootloader left BIT(7) set, the MAC also stays
> forced to 2G even though phylink resolved 1000. That contradicts the
> commit message's claim that the settings passed by phylink are applied
> at link-up.
> 
> The mask itself predates this patch and already affected non-IMP
> fixed-link ports on 5301x/58xx. However, this patch is what routes the
> SerDes ports through it in in-band and PHY modes, and it relies on the
> helper to apply phylink's resolved state. Should the non-IMP path use
> GMII_PO_SPEED_2000M here, for example by picking the 2G bit alongside
> off and val?
> 
> [Severity: Medium]
> b53_phylink_mac_needs_override() now returns true for SGMII and 1000BASE-X
> in any mode. That means the BCM58xx SerDes ports (ports 5 and 4, mapped to
> lanes 0 and 1 by b53_srab_serdes_map_lane()) now reach
> b53_force_port_config() in in-band and PHY modes too.
> 
> These ports are not dev->imp_port, so they use the GMII override register.
> Does b53_force_port_config() use the right bit layout for that register?
> 
> drivers/net/dsa/b53/b53_common.c:b53_force_port_config() {
>      ...
> 	} else {
> 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
> 		val = GMII_PO_EN;
> 	}
> 
> 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
> 	reg |= val;
>      ...
> 	reg &= ~(0x3 << GMII_PO_SPEED_S);
> 	if (is5301x(dev) || is58xx(dev))
> 		reg &= ~PORT_OVERRIDE_SPEED_2000M;
>      ...
> }
> 
> In b53_regs.h the two registers have the enable bit and the 2G bit in
> swapped positions:
> 
> #define   PORT_OVERRIDE_SPEED_2000M	BIT(6)
> #define   PORT_OVERRIDE_EN		BIT(7)
> ...
> #define   GMII_PO_EN			BIT(6)
> #define   GMII_PO_SPEED_2000M		BIT(7)
> 
> So on the GMII register, clearing PORT_OVERRIDE_SPEED_2000M also clears
> the GMII_PO_EN bit that was just set. GMII_PO_SPEED_2000M is never
> cleared.
> 
> This seems to have three effects:
> 
> First, the write from b53_force_port_config() goes out with the override
> disabled. The MAC briefly goes back to autonomous control until
> b53_force_link() sets GMII_PO_EN again.
> 
> Second, if firmware or the bootloader left BIT(7) set, the MAC stays forced
> to 2G while phylink resolved 1000. The driver never clears that bit, and
> its case 2000 sets BIT(6) on this register. Would that contradict the
> commit message's "Apply the settings passed by phylink at link-up"?
> 
> Third, for an unknown speed, b53_force_port_config() calls dev_err() and
> returns without writing anything. b53_phylink_mac_link_up() still calls
> b53_force_link(dev, port, true), which forces the link up with the old
> speed, duplex and pause bits. For SGMII and 1000BASE-X this may not be
> reachable in practice.
> 
> The wrong mask in b53_force_port_config() is older code and already
> affected non-IMP fixed-link ports on 5301x/58xx. This patch is what sends
> the SerDes ports through it and relies on it to apply phylink's settings.
> 
> [Severity: Medium]
> This isn't a bug introduced by this patch, but b53_force_port_config() and
> b53_force_link() both ignore the return value of b53_read8() before they
> modify reg and write it back:
> 
> 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
> 	reg |= val;
> 
> b53_srab_read8() returns without setting *val when
> b53_srab_request_grant() or b53_srab_op() fails.
> 
> Can reg then hold uninitialized stack data that gets written to
> B53_GMII_PORT_OVERRIDE_CTRL(port) with the enable and link bits set?
> 
> Neither helper reports a failure. If the write in b53_force_port_config()
> fails but the next b53_force_link(dev, port, true) succeeds, the MAC is
> forced up with its previous settings. Likewise, a failed write at link-down
> can leave the MAC forced up.
> 
> This patch adds the SerDes ports in in-band and PHY modes to the users of
> these helpers.
> 
> [Severity: Medium]
> This is a pre-existing issue and was not introduced by this patch. On SRAB
> switches these override accesses go through b53_srab_read8() and
> b53_srab_write8(), and both call b53_srab_request_grant() first. Is the
> timeout check in that function using the right limit?
> 
> drivers/net/dsa/b53/b53_srab.c:b53_srab_request_grant() {
>      ...
> 	for (i = 0; i < 20; i++) {
> 		ctrls = readl(regs + B53_SRAB_CTRLS);
> 		if (ctrls & B53_SRAB_CTRLS_RCAGNT)
> 			break;
> 		usleep_range(10, 100);
> 	}
> 	if (WARN_ON(i == 5))
> 		return -EIO;
>      ...
> }
> 
> If the grant never arrives, the loop exits with i == 20 and the function
> returns 0. The register access then goes ahead without the grant.
> 
> If the grant arrives on the sixth poll, i == 5. A WARN fires and -EIO is
> returned even though the grant is held, so the access is skipped.
> 
> Should this check be against 20 instead?

Agreed. The two override-bit findings describe the same underlying bug. 
Separate prerequisite fixes now select the correct speed bit for each 
register, check override register-access errors, and prevent forcing 
link up after failed configuration or an unsupported speed.

The pre-existing SRAB timeout check is also fixed separately.

pw-bot: cr
-- 
Florian
