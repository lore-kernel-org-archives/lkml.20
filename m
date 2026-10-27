Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124318;
	b=sHblDdvQa2O2LaTFysCLzaMe8G4Wpy5sLJog+kw50fslFtE7y2bm7Qwat789lQRq+702
	 Kx/iiESxnlD3rrDEGGoBZHvErPB+LD57oCbw8gcXUXq4VACeASvpgT8/iw6nhOoXtOYok
	 yxZXSae0Qnl+aQEkhAfzP5SNqQjd3+/4WBWJ3gLD9Yd/oqTK2UUfHnRBAIE8dqoCr5x++
	 Nj7YSXWC1VE60AAkjyHYP6QgkMvg9PLdHwPodNgpsN6G7uRx3fLaT6uVVlCDLhwSOOzm5
	 7EEoIcZUjMWxB2Bc0t2x4ZiEis1X+8ctE5hBNJqRoHE8FhNSONdRoVtKuSffE/jIP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124318;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=C5UG/od4jnm6GtQPKVHk+hFGTYbFM2nx1L5LhnGODlw=;
	b=M3Xfz2h+OzCmL4n6VLFnGH7t0IX2smn6Q9rOpXk4L50XxQDlv2JYvmTk4AMuXvQ7A6IK
	 Rc90iVme8t+kJZuWyaeIEON+N60bvfQCZYB1ohqdK31syGYkmn4GTqQifl9yFKXfOd7mF
	 7yjpWxsyRBeRA9Q6yO8Ru1kvgQ9P/LElHtmaYUZVIxjitUO+GwZ1MeUu42Nn02ZGsSUcL
	 5cBK+uCnhRjZcM6pcMYR21TxteKx9txeThNDMLWzdzicXAa4U2DideQ/k98Vg55aydYu7
	 AfLTVaP5DU1sUvO9+yUzAP9ufmd/U3IE/hHQKm3ikYmupdS6PXIRH+sHhmt1gPOsorg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e3O9vfjh;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C060A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e3O9vfjh
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so109975a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124317; x=1793729117;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C5UG/od4jnm6GtQPKVHk+hFGTYbFM2nx1L5LhnGODlw=;
        b=ztjTnwpUFnqP5T5G+PZd3JpSwOVPS6eIpiU+bNYakoy15I1KzY6lt5iCSwgsa90IkV
         ywyfrImVVd/JyqxJlZb0+3OfU2+1g0DrXQm0MxJbCby7wGz79VguXOai2wPlPMqsKPhU
         bQAayBaHSE7D6JRMFbcWEJX9+x1EdgGXMHODiEqwR5eajtuqHihlXRxdqUF/MAEhL3H2
         57GPl9h6WJRtzP8fLTvyy5tzVMw9qfTnRd7PMux9cm4/jMm4im+oNsqI6Ok+uQEzPGSx
         fSyJcXymu8xEW9nHNDGTb+yKsHm0XUTfasbnYAlN/bR6Wl3cfWaATkC9kkjOdMt9Qfd7
         JR6w==
X-Forwarded-Encrypted: i=1; AKwUvBweZ9n3nCrCI9T1tC18sdLPeOgtA33uTNP5yH7oW7zn0Vs2zhleitrd3/Czv6lHBI6CI1UYekiKjfZAjOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRY3E+0lkzNJ52EPSvnxkv8hUOLIf2T/za0ThaJuvST4Gd1yw1
	OitgvjhT19PMYfPbPrNNO5PPl6WmcaNAUXSpqKecTAFqlVzCOzzH5MCZIV/wY37ywXhOD6ZNYGi
	umIrzvgs2+Xf6GN57WyibsdcR8U+CsEsX037YoyG7BWEyHaN1vsceRaeoRwJEyaEqj5CklAQdFd
	1c5gc+gaOt9gzTz/6HOILDWUIVreO1W7FJqBOdiQeKUwRj1GineTg/3Sw5XUpBTKDoNPajogGTU
	lRxX0ffsLlyGqQ/G5ZZV0IEb8A=
X-Gm-Gg: AYBFou2bcdXL9j9ZeODcCKHmagDmY0xsNZ4bpws2tvR+qXEzvHWWAC0m52CtjMQqgHe
	MPdgzxMqEkekLU00qiGcxnIi2iB70M9eNMJ9iYzWacn2A9T40TtOq7X1+2Xn04ntkyOY9HCXmaS
	1q0aVwAjzMHp6sZ8kEs4IXkrXj6IdaX9+AeRKFPao4Fufidw1uZ5JFTCOYo98JxnxYNcYZVTv17
	Ed27eVVDYxDUrphyYitSBf93SzWfe18ag5s6ZU9u0ZtCGUrzsjHy0B9HZX+v10/+0+3dkq7LpdZ
	51PRinP2xqamH4ZgQyyreFddDOscB6ESGYmy8cFS3rAvrlB0gPurGKKM4Lvcs68jB8MVMYD6EEg
	1d4E057cA93OixG4wyWI1JvCzv0TBdupohhV8VfuGq1v+svBBemYQBlMnOS32Gq2SVnX36DjNEl
	l74LMhHcHDO65kVWCKXM4nglN44z+30R9CPZB0/UVK
X-Received: by 2002:a17:90b:534b:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3adeae5dcdbmr9229414a91.51.1793124316967;
        Tue, 27 Oct 2026 11:05:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784dfasm2568070a91.3.2026.10.27.11.05.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:05:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-887c99013edso118418b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793124315; x=1793729115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5UG/od4jnm6GtQPKVHk+hFGTYbFM2nx1L5LhnGODlw=;
        b=e3O9vfjh4hSlcMGOOZf9K7Dxco1sxNhXWZnNpUxfZ1v8f+uNhhjut1P9qnELwJgV01
         Fl8e8WyGawZdm9yMNJhVelK5kzbp8MHczqJfJhT2RrkmDUWG5BJAZMfCR5RROCMKgnVr
         /x6o5XY7g3VfvMPaShYC75qI3ILtK0sKe0JHc=
X-Forwarded-Encrypted: i=1; AKwUvBwbYPoTyA4R2JjdeiIADyAfViX8F1lfajXs0qZlKLruT1fkXt2jK3cIE1MmeXYro/eJJgex99CAlEAODDQ=@vger.kernel.org
X-Received: by 2002:a05:6a00:299a:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8a6e8e74924mr22328b3a.46.1793124315214;
        Tue, 27 Oct 2026 11:05:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:299a:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8a6e8e74924mr22313b3a.46.1793124314734;
        Tue, 27 Oct 2026 11:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662d68asm339452b3a.24.2026.10.27.11.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:05:13 -0700 (PDT)
Message-ID: <7e2f2f3e-adfb-47e7-a60f-ec475ab4bef5@broadcom.com>
Date: Tue, 27 Oct 2026 11:05:11 -0700
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
Subject: Re: [PATCH net 3/6 RESEND] net: dsa: b53: constrain SerDes interfaces
 to initialized PCSes
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org
References: <20261022225656.1387306-4-florian.fainelli@broadcom.com>
 <179305843878.3134.5626134378768180663@kernel.org>
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
In-Reply-To: <179305843878.3134.5626134378768180663@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 16:47, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] Ports muxed to SGMII now fail phylink creation when SerDes
>    discovery fails or CONFIG_B53_SERDES=n.
> 
> --
> 
> net: dsa: b53: constrain SerDes interfaces to initialized PCSes
> 
> This patch stores a supported interface bitmap on each b53 PCS that is
> discovered, and uses that bitmap for capability reporting and PCS
> selection. On SRAB ports whose mux selects a SerDes, it clears the
> parallel interfaces inherited from the common code. It also stops
> advertising 2500BASE-X.
> 
>> diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
>> index 9818b3922a377..3fabae80dc1a8 100644
>> --- a/drivers/net/dsa/b53/b53_srab.c
>> +++ b/drivers/net/dsa/b53/b53_srab.c
>> @@ -451,9 +451,11 @@ static void b53_srab_phylink_get_caps(struct b53_device *dev, int port,
>>   
>>   	switch (p->mode) {
>>   	case PHY_INTERFACE_MODE_SGMII:
>> +		/* The mux connects this port to a SerDes, not a parallel bus. */
>> +		phy_interface_zero(config->supported_interfaces);
>>   #if IS_ENABLED(CONFIG_B53_SERDES)
>>   		/* If p->mode indicates SGMII mode, that essentially means we
>> -		 * are using a serdes. As the serdes for the capabilities.
>> +		 * are using a SerDes. Ask it for the supported interfaces.
>>   		 */
>>   		b53_serdes_phylink_get_caps(dev, port, config);
>>   #endif
> 
> [Severity: Medium]
> Could an SGMII-muxed port end up here with an empty supported_interfaces
> mask, so that phylink_create() fails for it?
> 
> b53_srab_mux_init() sets p->mode before it tries discovery. If discovery
> fails, the loop continues with p->mode still set to SGMII and
> pcs[lane].dev still NULL:
> 
>      case MUX_CONFIG_SGMII:
>          p->mode = PHY_INTERFACE_MODE_SGMII;
>          ret = b53_serdes_init(dev, port);
>          if (ret) {
>              dev_err(...);
>              continue;
>          }
> 
> In that state b53_serdes_phylink_get_caps() returns early on
> !dev->pcs[lane].dev, so nothing goes back into the mask.
> 
> With CONFIG_B53_SERDES=n, the b53_serdes_init() stub in b53_serdes.h
> always returns -ENODEV and the refill call is compiled out. Every
> SGMII-muxed port then ends up in this state.
> 
> phylink_create() then rejects the port:
> 
>      if (phy_interface_empty(config->supported_interfaces)) {
>          dev_err(config->dev,
>              "phylink: error: empty supported_interfaces\n");
>          return ERR_PTR(-EINVAL);
>      }
> 
> DSA then sets the user port up as unused. Before this patch, these ports
> kept GMII/MII/REVMII from b53_phylink_get_caps() and registered normally.
> 
> Ports that never select the PCS are hit as well. In
> bcm958625-meraki-alamo.dtsi, SRAB port@4 and port@5 (sw0/sw1) use a
> 1000 Mb/s fixed-link with no phy-mode, so DSA passes
> PHY_INTERFACE_MODE_NA. b53_serdes_phylink_mac_select_pcs() returns NULL
> for that mode both before and after this patch.
> 
> These two ports are the conduits for the cascaded QCA8337 switches
> (ethernet = <&sgmii0> / <&sgmii1>). Wouldn't those switches lose their
> upstream link too?
> 
> The commit message says:
> 
>      A failed discovery must not leave a usable serial interface
>      advertised without its PCS.
> 
> It does not mention that the port then fails to register at all, or that
> fixed-link/NA ports are affected. Is that the intended result?
> 
> Later patches in the series do not change b53_srab_phylink_get_caps() or
> b53_srab_mux_init(), so this still applies at the end of the series.
> 

Agreed, this was an unintended regression. The next revision preserves 
the legacy interface capabilities when SerDes discovery fails or 
CONFIG_B53_SERDES is disabled, allowing fixed links without phy-mode to 
continue registering. Only successful PCS discovery replaces those 
capabilities with the supported serial interfaces. The commit message 
has also been updated.

pw-bot: cr
-- 
Florian
