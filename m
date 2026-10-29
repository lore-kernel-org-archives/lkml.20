Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307438;
	b=KgKsaVg/1by1/s5XJxJNqNbP3qeLKVUNU6ZqWEug/O/AdTcv21pJfLwXoxyDvubWm9d8
	 iNRTEffQgiWHVvGhEhnwS417thMFiUooc6F3q04jSBGw0p7F542/mhvlolkNobugVz6nc
	 MpPoh1Vpel83d7m728tfJlBVx21rgwEl7fuNP+nCmuDuR945KGc8ogaeEX0rWhal4YOF1
	 Jv0p69OwvHv5wdUOLEstZlTxOoih3GO6UMAlc1725D//4KMz84tnP0kld9Ky2i3YFxXAX
	 bWTLuHcWlJ1YNs4iGznvGZqrJbsYTahmaDUMYGMJB9no+YfxVhSsOVxZSp2h6k63u6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307438;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=YIugztBl4Gu3DTeeRndzc/rGkdnJi8LYHHzehW4YV8k=;
	b=iadRQpavb3oOuhYEtJG1XP4P9Lwm1KINpORs7Q3r36Px++Y8nLFONE2Re8xpR76KuUDO
	 uzEz4SOlt8SbtTAAEWDc0zT+x7yxBdZ3/VdtEubjrTMc5c4d1tiSS+zJvilyrOwtJYU7n
	 MXg15W/RswzvEaP2VL2f0rFZHFT5x/2PByQ5rDoFpypJgFMdh8b60N/whkwig7FazfnyT
	 0Tpq7W/DaydHn+2c9uxcqcW5omqYrKLvrDWcB0eKR7FVQ0l7q5iI+1XTaPk1FnycownGK
	 0ed9DssFq0yGZDM/Yz0vWAHF7wqG9iXyHBj6m0QrlrWC9tQ0SqKNp2cYq/QmtHVQgWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ab8umSFm;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E01E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ab8umSFm
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so22908a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307438; x=1793912238;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YIugztBl4Gu3DTeeRndzc/rGkdnJi8LYHHzehW4YV8k=;
        b=v97qfsU3dtT3AR+sg41GF7JFlni6uHVU/5BpaWsVWh269iw4KeTSmFvq2DoiOy6WJD
         k2DH3MNdpTmdZ9YGxbvyvnfuQaW+jBpDRnW6wZUKE9NplbMKFn01nq4TBpO5zvXQOA9F
         T1EXp1uaxdUegXAy204tgpsrP7Zed+2hKiGtcAeyf1ZMWvJDxih3YHyY/KQkUoFekvgr
         9Sl25p/aMkfhHm5LrarWJrM5iuAE+WgBibqz6fZjTSWQTvlAYd+m2XEb3M9uwYuLaquP
         6kSk3Rp+IyVPiOptTipgiJxIYxZm6k+e572UVYLMa8TMvdJ3p2Gp2BBGTHcxtPbqsfhO
         m7mw==
X-Forwarded-Encrypted: i=1; AKwUvBww4zgnA62VDtdzt6iY4wHvJvjQn3f0VdCs79+opAWtoTsAvOKHQfIsmVk3wR12i+T8Ak33Ig8zbTkHhhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUA7flZ44tcurhWhlmmIgNa8mOBknyDxzobv/eMTg9dJKefIQg
	qy/sI1A9JRQ9bHjAC5vPJkDvCBlpoz3kswnPT2VnyOcXITZletuda/zpCSuEb4mIQdGTdYG/4xX
	gLPQaQBSeWxEAaL4gHzC3qk7Hw9Qv9j7j+s2eSMaFmr/f4pdIdLKQOUs3hmQAb6p9RB1Ty5heUZ
	Fqx1Zq6r2D4f+LUPHbxqPL/j2nE8u7DJM1XNNK13OCEZS2TFWxVO96ZJnFmwINTZ09GHT73dOat
	TvUn/PZzZyP+cctVXH8bEdza9M=
X-Gm-Gg: AYBFou29Ng4p9ZDinHfqWSOI824W8e8g3/GGjwK+PawlXwPCKO5MefOY4+tfBv5Rn3A
	IruukmBLgTeocvr2bO9V9v1sQ0XfWVYKfK/gUYTCBkwMPfnSRmXNu23GC9c8nKpEY7PKizO+viZ
	TWgVyu9AXFGUWAqJpEZsaFXJXyGlUJaBoYsR5fCOTt5CbB3OFs9VAabfb8eq9vivhorLhWEZZDq
	U1y3wWIsOuyZbUfyarEa4IrMdNHPWo862dhP+CPifKy+jzxOsC3qZV9ojRL/EqMGP8Ue0mmbiwN
	8QcaV1pHAfwObflrJ/Puutj08mBqUJsgYsycqosSKK0td4hfoQzWPiQ+Jar0b19TVh8HgSlFcV8
	zfNfiOtqNwdyuGH/nT/ojzgcHUIMKTAh5ep6kaddbgm5a2D7y30EzsIuWwQ1OAtRxv66IeVOSO3
	TIJtEFtEm8Ou4vRVJQF3EGhq/sIAOt8ISBAhcMNAAG
X-Received: by 2002:a17:90b:528d:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3ae897cca27mr120855a91.18.1793307434732;
        Thu, 29 Oct 2026 13:57:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm2713892a91.3.2026.10.29.13.57.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:57:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so159165eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793307433; x=1793912233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIugztBl4Gu3DTeeRndzc/rGkdnJi8LYHHzehW4YV8k=;
        b=Ab8umSFmUrgDVqNMp5RkQYsO9M4iLCZ2+7z4pSuPzcRVi91hAWSirKOfr6SwAlTGJJ
         Hz7CrLgyynMFU7K3Xzzez0NAwSJBb/QVF4lOWAJGzxuz5aWDnyFgPUFk97IOtiMtC/2v
         j6PqWzXt1Qyt931wjhev6dE7rL/mWyYjjuQKs=
X-Forwarded-Encrypted: i=1; AKwUvBxoCQLFsP985ETD9nNJgHwGaR+OsYObjrJKkz02ITVrM2kL49eXqIXn4Eu3nKnTODsMW518PpvmUR7jge8=@vger.kernel.org
X-Received: by 2002:a05:7022:1508:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1ac56d963demr318697c88.5.1793307432064;
        Thu, 29 Oct 2026 13:57:12 -0700 (PDT)
X-Received: by 2002:a05:7022:1508:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1ac56d963demr318664c88.5.1793307431273;
        Thu, 29 Oct 2026 13:57:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a96172sm935156eec.27.2026.10.29.13.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:57:10 -0700 (PDT)
Message-ID: <8a3d1735-a6f0-45ef-84a6-48170f514c9d@broadcom.com>
Date: Thu, 29 Oct 2026 13:57:09 -0700
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
Subject: Re: [PATCH net v3 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps
 link speed
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org
References: <20261026203742.3198673-2-florian.fainelli@broadcom.com>
 <179330639152.3134.1743045089447832212@kernel.org>
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
In-Reply-To: <179330639152.3134.1743045089447832212@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 13:39, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The steady-state 2.5G override also hits non-Northstar
>    platform AMACs.
> - [Low] On forced-2500 devices, the programmed MAC speed and the reported
>    link speed now disagree.
> 
> --
> 
> net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
> 
> This commit makes bgmac_adjust_link() use SPEED_2500 instead of the fixed
> PHY's reported speed when BGMAC_FEAT_FORCE_SPEED_2500 is set. The goal is
> to keep the AMAC at 2.5 Gbps on Northstar and Northstar Plus. Without it,
> the first link change reprograms the MAC to 1 Gbps.
> 
>> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
>> index b3a92ae95de30..ec879c203bc59 100644
>> --- a/drivers/net/ethernet/broadcom/bgmac.c
>> +++ b/drivers/net/ethernet/broadcom/bgmac.c
>> @@ -1417,11 +1417,15 @@ void bgmac_adjust_link(struct net_device *net_dev)
>>   {
>>   	struct bgmac *bgmac = netdev_priv(net_dev);
>>   	struct phy_device *phy_dev = net_dev->phydev;
>> +	int speed = phy_dev->speed;
>>   	bool update = false;
>>   
>> +	if (bgmac->feature_flags & BGMAC_FEAT_FORCE_SPEED_2500)
>> +		speed = SPEED_2500;
> 
> [Severity: Medium]
> Does this reach more than Northstar and Northstar Plus? bgmac_probe() in
> bgmac-platform.c sets the flag for any platform AMAC that has no
> phy-handle, whatever the SoC family:
> 
> drivers/net/ethernet/broadcom/bgmac-platform.c:bgmac_probe() {
>      ...
> 	} else {
> 		bgmac->phy_connect = bgmac_phy_connect_direct;
> 		bgmac->feature_flags |= BGMAC_FEAT_FORCE_SPEED_2500;
> 	}
>      ...
> }
> 
> Before this patch, the 2.5G setting from bgmac_miiconfig() only lasted
> until the first bgmac_adjust_link(). That call reprogrammed the MAC to the
> fixed PHY's 1000. With this change, 2.5G becomes the permanent MAC speed.
> 
> The in-tree Cygnus board bcm911360_entphn.dts enables eth0 ("brcm,amac"
> in bcm-cygnus.dtsi) without a phy-handle, so it gets the flag. Its switch
> peer is "brcm,bcm11360-srab" (BCM583XX_DEVICE_ID), and CPU port@8 there is
> a fixed-link with speed = <1000>.
> 
> The companion change "net: dsa: b53: restore the NSP IMP port 2 Gbps mode"
> only forces the IMP port to 2000 for is5301x() or BCM58XX_DEVICE_ID:
> 
> drivers/net/dsa/b53/b53_common.c:b53_phylink_mac_link_up() {
>      ...
> 		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
> 		    dsa_is_cpu_port(ds, port)) {
>      ...
> }
> 
> Would that leave the Cygnus AMAC at 2.5G and its IMP port at 1G? That is
> the same mismatch the series describes as the cause of the output queue
> discards.
> 
> Hurricane2 ("brcm,nsp-amac") and Stingray ("brcm,amac") would be treated
> the same way if their DT had no phy-handle. In-tree Stingray boards do set
> phy-handle, and no in-tree HR2 board enables amac0.
> 
> On parts without idm_base, bgmac_miiconfig() skips the 2.5G IOCTL clock
> select. The MAC speed field would still stay at CMD_SPEED_2500:
> 
> drivers/net/ethernet/broadcom/bgmac.c:bgmac_miiconfig() {
> 	if (bgmac->feature_flags & BGMAC_FEAT_FORCE_SPEED_2500) {
> 		if (!(bgmac->feature_flags & BGMAC_FEAT_IDM_MASK)) {
> 			bgmac_idm_write(bgmac, BCMA_IOCTL,
> 					bgmac_idm_read(bgmac, BCMA_IOCTL) |
> 					0x40 | BGMAC_BCMA_IOCTL_SW_CLKEN);
> 		}
>      ...
> }
> 
> Should the override be limited to the SoCs that really run this link at
> 2.5G?
> 
>>   	if (phy_dev->link) {
>> -		if (phy_dev->speed != bgmac->mac_speed) {
>> -			bgmac->mac_speed = phy_dev->speed;
>> +		if (speed != bgmac->mac_speed) {
>> +			bgmac->mac_speed = speed;
>>   			update = true;
>>   		}
> 
> [Severity: Low]
> After this change, can update ever become true on forced 2.5G devices?
> 
> bgmac_chip_reset()->bgmac_miiconfig() caches these values before the PHY
> state machine runs:
> 
> 		bgmac->mac_speed = SPEED_2500;
> 		bgmac->mac_duplex = DUPLEX_FULL;
> 		bgmac_mac_speed(bgmac);
> 
> The fixed PHY reports DUPLEX_FULL, so both comparisons in
> bgmac_adjust_link() come out false and this block is skipped:
> 
> 	if (update) {
> 		bgmac_mac_speed(bgmac);
> 		phy_print_status(phy_dev);
> 	}
> 
> Before the patch, the first link-up saw 1000 != 2500, reprogrammed the MAC
> and printed the "Link is Up" message. That message seems to be gone on
> these boards now.
> 
> Also, phy_dev->speed stays at 1000. bgmac_phy_connect_direct() registers
> the synthetic fixed PHY with .speed = SPEED_1000, the DT fixed-link uses
> speed = <1000>, and swphy can't represent 2500 either way.
> 
> bgmac_ethtool_ops uses phy_ethtool_get_link_ksettings(). Would ethtool and
> /sys/class/net/<if>/speed then report 1000 Mb/s while the MAC is
> programmed for 2.5G?
> 
> Should the commit message mention these user-visible changes?
> 

The scope concern is valid. I will restrict the platform forced-speed 
flag to Northstar Plus; the BCMA path already selects the Northstar 
family explicitly.

I will also decouple link-status printing from MAC reconfiguration. 
Userspace will continue reporting the synthetic fixed PHY’s existing 
1Gbps speed, and I will document that limitation in the changelog.

pw-bot: cr
-- 
Florian
