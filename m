Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269212;
	b=URhleUEbZbfknwDdbdAZqrALt5ScuiWaLoCTWCvQ0Hg7XH44HI5KfYSDuGCgp8PuLue2
	 zcNNlIXYZEAon7i2hvo5y21ey6x5TopsRPE2nM3bKOzg2Z/rZvkjeETVkNmg8k0Lvhhuy
	 i4aUzGXc4JKCO7uWF0/U8H20yt7g6rQSOasb60LA2y5If4qfvCx4F+mEHXyuOlbWfzVrE
	 BIRcvOD4//hP86QLkMLezVzx5Sh3JhuH4ippcUcyS655kEAwpHmivg2Div2nwyuexDzxJ
	 l5YoWZ8iagQoTgPVw3PIETRHC150RcN9FzYvB5wqR97IplVfpxBEXmz5FCz53PHztMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=x0P1H/cl9zHd+ndLPCIFgltm4Djk00Xp5e5TtdI9M8E=;
	b=rOPnssMYmR00sc2bGws9ti5BjixHHtUAtWD23evavVYr1kYa5MCWkdGHm3cJq6DisW4w
	 9aaNo5N9JThjHRyeAmBWPdPITl/Ci7FWEKFozlYeolhD5HzYsKuPP5l5M8dwYq880lYC4
	 /Yl6fLSHJ/ieQi4BRoEKfY9xQez1vI1X6dsn9bwNGGOf9IUONPY9GAMZ7Zz1E3Oc73hjM
	 0y7Ki4vRFBmPGiUKSRaEL0vJwgvVo/OHhKgN7DuxvvPvSMtJla47qBdNqwh1+PmlYZ2Ma
	 1S/mq27NwrwVLnrITgt++rKfJ2HBH+dQil64pyiFEvj2ZwNtlfk9luZQomGxXy73JRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=InpQN7Lo;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=InpQN7Lo
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso935051a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269211; x=1794874011;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x0P1H/cl9zHd+ndLPCIFgltm4Djk00Xp5e5TtdI9M8E=;
        b=EXwRQ09wUCAZCdywn5cnlzKVoqiP9zos6gEELimesPeRw6vSG0Ua1XYGRZIaEU/xIy
         wswRZBNZdF3uOq34qLpeVwcO8IotGnmCvEbywrvyM/VXRtmGZXDTmnI3gNzw5uz4Ub7e
         jmItbjU4jxiGdaGZ3F97obAbtFExE+g+VE4U3jtJxI9akd70YjYgqI5dbrGTM6OEkDAW
         yMKjV67WrmLTYkL9sFnUHJjB/VTu6bu4G73HJmOK9Mpu5aNYQbgWtppFQ8GU7LIlH0fk
         S4OxgAyStV8YnexhxFZU6Uiv5oug4DNE98SEOVe5qao2+D/vUSbMiZ3zU5w3Me+5/B1o
         XUgw==
X-Forwarded-Encrypted: i=1; AL+hErGfXgYqqz4tmtyFeBgiwNXo1NQ25CkTpqehMjQNBFbrjsn0J6DDP21/aCJn1edWUTPVezE5jtzewxKZL3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ks/CUdwSRSAT26VxaakDNBAGcSNMUiqQ6WesaJkSa7s/PReW+
	l4qVLMKZB3+WIudRV3h1Q0WZsxaubodp4lpvdHSN3l/IJEC9sRRw/1UCd9RjNDh+uDupWNgiaoz
	qrNkWjIv6YBoB7MARRSfoVKCTzcJYLSdWZ9tErpK/A1rhaEVf+qF39gy2lNbFpLy7eMY0d/x7sX
	gE+ywzWvduFnG/J91Poe/Nn7+hm7BFfXuaZbnQj+rEoMq775mbjYty/PCec+wBNxghmAwY9r5Ha
	rgVWIBGfXuOO6idHW6PUK8r
X-Gm-Gg: AYBFou0mQHrL6Mt82nVuIDPLhNjI1m04z07ije6s1PUN9stmS1hsxvN7vjLuC9hkL9e
	euzUWEKgsgv6/AD0gCA8J8kFzgn9UW4VbaV9DLbbLMTMscJMs2o0SLhQt64MDIzhRJDibUMg3ih
	lpL0/3q3nWTUU01XuKaD2VsElpB8wG/iUD1h5cPK/nshO4gYTzugW+3tEhfYMi1xwuaF5vqHiAz
	MLtfTTOw/tEj+sjHHh3wXkPP9Krz8lnBXItkZRqxx7p0pT03jWU+91b+2BQ0kSm314stiNScDM7
	NlQjp23yg1vRNMfScWPOYGcwNThswIDjxn3/CTaZi2buuFv9dpFx2B5F6CeVLKia3itqXn+wsqh
	PAx49J1FiITKAfogroscXP8WqpU+r2kr0jvcrwQ9yvwfzFbm6Yb1Dn5QVpKywGrorqxhVNqainR
	G+bjEngs4VyQ83S6Hhzr24qdzK0oW/x2TV6coyOZ5b
X-Received: by 2002:a17:90b:5688:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b167a2c765mr667071a91.39.1794269210702;
        Mon, 09 Nov 2026 16:06:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b167979dccsm634302a91.7.2026.11.09.16.06.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:06:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eaad608a2so29840866d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794269208; x=1794874008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0P1H/cl9zHd+ndLPCIFgltm4Djk00Xp5e5TtdI9M8E=;
        b=InpQN7Lo6FLqojekA7ykEq8lrW6PyBA/8X5XDjiMx5t5E6kcNjQj66R5Fm83gqrW6S
         QLC0TEebtbreGiaTeeAPCEChg/Ayv+a3MP9hDBesvMrBgz2432cKHosWMDu53ZKJ6iL0
         W+JYilBcwN8zTNprZDTZa6oo8AqY+bqPFpvK4=
X-Forwarded-Encrypted: i=1; AL+hErH8AD2VsvMhfLD66knKB41tyjmejMUQ3/IDdlV7BqOVHJX9DpeTwwnzYTV4FPuqc79J5TeagQc2u9kowwA=@vger.kernel.org
X-Received: by 2002:a05:6214:598c:b0:91e:b57e:5426 with SMTP id 6a1803df08f44-91ef03aa40emr17656646d6.12.1794269208120;
        Mon, 09 Nov 2026 16:06:48 -0800 (PST)
X-Received: by 2002:a05:6214:598c:b0:91e:b57e:5426 with SMTP id 6a1803df08f44-91ef03aa40emr17656066d6.12.1794269207538;
        Mon, 09 Nov 2026 16:06:47 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef054f382sm7934206d6.43.2026.11.09.16.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:06:46 -0800 (PST)
Message-ID: <d2fa8027-53da-42e2-a7eb-f666ed6bb4e0@broadcom.com>
Date: Mon, 9 Nov 2026 16:06:44 -0800
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
Subject: Re: [PATCH net v3 7/8] net: dsa: b53: harden mirror register
 programming
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261030211617.288562-8-florian.fainelli@broadcom.com>
 <179348376557.3131.9793537339199409475@kernel.org>
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
In-Reply-To: <179348376557.3131.9793537339199409475@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/31/26 14:56, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] This patch adds an unconditional b53_mirror_init() call to
>    bcm_sf2_sw_setup() (drivers/net/dsa/bcm_sf2.c).
> 
> --
> 
> net: dsa: b53: harden mirror register programming
> 
> This commit clears the mirror capture control register and both
> source-control registers during b53 and bcm_sf2 setup. It checks every
> mirror register access and only increments the source reference count
> once hardware programming has succeeded. It also decides whether the
> destination is occupied from the source masks instead of MIRROR_EN.
> 
>> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
>> index 9e5713015187b..9f54cd414c18f 100644
>> --- a/drivers/net/dsa/bcm_sf2.c
>> +++ b/drivers/net/dsa/bcm_sf2.c
>> @@ -1059,6 +1059,11 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
>>   {
>>   	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
>>   	unsigned int port;
>> +	int ret;
>> +
>> +	ret = b53_mirror_init(ds);
>> +	if (ret)
>> +		return ret;
>>   
>>   	/* Enable all valid ports and disable those unused */
>>   	for (port = 0; port < priv->hw_params.num_ports; port++) {
> 
> [Severity: Medium]
> Can this lose the installed mirror rules across suspend/resume?
> 
> The resume path also calls bcm_sf2_sw_setup():
> 
> drivers/net/dsa/bcm_sf2.c:bcm_sf2_sw_resume() {
>      ...
> 	ret = bcm_sf2_cfp_resume(ds);
>      ...
> 	ds->ops->setup(ds);
> 
> 	return 0;
> }
> 
> So every resume now writes 0 to B53_MIR_CAP_CTL, B53_IG_MIR_CTL and
> B53_EG_MIR_CTL. The tc matchall mirror rules stay installed.
> 
> dev->ports[].mirror_count[] also keeps its value. The only thing that
> clears it is the memset in b53_reset_switch(), and the bcm_sf2 path never
> calls that.
> 
> CFP gets restored by bcm_sf2_cfp_resume(), but nothing reprograms the
> mirror registers after resume.
> 
> After resume, b53_mirror_add() would hit this:
> 
> 	if (*mirror_count) {
> 		(*mirror_count)++;
> 		return 0;
> 	}
> 
> A new rule for a port and direction that already has a reference would
> then return success without programming the hardware.
> 
> The new occupancy check would also read all-zero source masks:
> 
> 	if (((reg | other_reg) & MIRROR_MASK) &&
> 	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
> 
> That would accept a rule with a different destination while software
> still tracks rules for the old one.
> 
> Doesn't this break the rule that mirror_count[] follows the hardware
> source mask bits? The commit message relies on that when it says
> "Reference counting must not record a first source reference until
> hardware programming has succeeded".
> 
> bcm_sf2_sw_rst() may already clear these registers through EN_CHIP_RST.
> If so, the stale count came from the earlier patch in this series, "net:
> dsa: b53: reference count shared mirror source bits", and this patch makes
> the wipe unconditional.
> 
> If the reset does not clear them, which is the case the commit message
> describes, this patch causes the loss on resume.
> 
> The problem is still there at the end of the series. "net: dsa: b53: fix
> mirror port encoding on BCM5325 and BCM5365" only changes the port and
> capture encoding.
> 
> A related question: bcm_sf2_sw_resume() ignores the return value of
> ds->ops->setup(). If b53_mirror_init() fails during resume, the new early
> return skips the port, VLAN and ACB setup below and no error is reported.
> Is that intended?
> 

Agreed. This overlaps with the patch #6 finding. The respin will restore 
the destination and source masks from retained software state during 
setup, preserving reference counts for installed filters. It will also 
propagate setup failures from bcm_sf2_sw_resume().

pw-bot: cr
-- 
Florian
