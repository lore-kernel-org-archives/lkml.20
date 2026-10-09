Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15A52B1D0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571016; cv=none; b=I9hzk7lExPC3A6v8wGpv5eN2mR04yPRaVPXuqLSbXgdKUNDDe2ANYrb+W4wbedd9pAiEWXnlfJDM09AXpygWjX6b3sCkGvgJRy7yAJus48R5lR6gSTIldJgF5cA2Q15ArDBJkQfWxNK0kswxy8HitxK8gNqi6d0K5bx+VW135/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571016; c=relaxed/simple;
	bh=V4bv6VzWlmaKy6cyUN9BAsnusU4OQwKEzHekDwMpncQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeSxQKoOyeU83GGCQQvZvsQVrjQX/j0nH5si2lqry3rnqGGJgcvlH7a+4eTTPWo6mWJBcyU51ULu1LJw1mNzZU8s1PrzUhNFxqYhwToYOQY4KsAJDkCsv7BUg5a3UImekzDEU9VcuGT4tFkttQXKAKjHvkoYWr3oQ5ubwzij9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cov0H26e; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cov0H26e"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1822a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571014; x=1792175814;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2T5yHfGH1NCV6TzhOONYKnxefA3nlftBZshKhCEnR0I=;
        b=CUXSJfDBm0sRWry/Ozup8osoL0aGznbYgr2A7NsKlpAS53idOJxlRVp/6SpzNX10GO
         dCGUV2Ni+uokr3MZJ5R9Ml6eGqqaNaTD0Z3D0exlBXwSaFM+kdkX/A6H7MqDpeI8eqKS
         8AmWA2UYeWbRE6vItPgeN3ZL0sOMsl14Lg8T6qIBBR6Ntyn6o+39mU6Q60vH/FCUmOa6
         i4NidZ2MgM2fvN4MYwdHJF5vcBfDqcjzKVLKR+6f1ZRKbnb0ZeRdawNToMslWBa9qBZA
         SkUmDmZYTe4oCiY80QLuQ2ZfE4R3NHLBjLklLF4OxfbOumes7pBuMi1t+56xZzwTkWCF
         X1tA==
X-Forwarded-Encrypted: i=1; AKwUvBwFNtDunZa/bG286QvsZpjhEkr/pRPzs7G4xX6Aax144Gckn/eEdDSc1gpgP1iFT1i++/10DQE2I/v+c1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQqiLlHSOD+tl+cFGN8RjHCc4b9ce9Ks4OKi6eY1UuswxqGH9z
	O8LPMty265w8VuqoEvs1e7U8L/3U4VxAOI+TaYvXgA6X7Id3TgqmHnF26E4M3YUj7TYqGEHhh69
	M7j0j3pjEhl0G0jtjF71INY+L/s74YleyRUS0tBkEnvv0ysBm5CwMYTigmhxr+a9ImcDGgUcTMg
	7Cgut3/i0ril2LHo/e+TDjqhn5TQs/m/lULEqKOdcIUiDn3iPmVOcyfkZASABMPCzWPLCbTp3QE
	ch52agPwcBcGo1Fcw==
X-Gm-Gg: AYBFou2QeVGetl5YngSQTscPHe1f2zfhoYE0bWhHDOfoIYlyuqwRpx7ngKb7B/8sZdU
	G+74CXGME4POne41HtZCxqiF+kIeUee/9yKZyxKDWpbyJq+hSkJeoNflsxxkUKmGt5L7GviOvMo
	gMPRIE/5yLGphjSWWrEDiIKJYbQfdRxwp8Vf+Gt8X5Dm5GlO3z/5l/PeRXYDcErdobjSvHtVrKW
	CZT7FLNzIpOjOXfg41L2hUg7UrxrXhbUFrdubKUCsfCV7yAWuJkYrx26ruJnivCC/UZUGfyTfWd
	yg9B/FEvhtcbtzMIcaRIj4H07npW73WGlUJx0n/TQ8YQQnlV0VLuQ61uti6va5W/Dv6cXeEmxyG
	zN2fEmVJ5oHovdx7QLpmhSm7ckav7SFTTvlYdRuTdYIy7Ho1V2fftfH8Dr8eULSJIbKbtWjHF8h
	A2aspi1OR7hp9t3jmkTwas9aOmoOgmsknU4S5P
X-Received: by 2002:a17:90b:1dd1:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3ab3aceba09mr1835478a91.41.1791571013623;
        Fri, 09 Oct 2026 11:36:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab32d54b0fsm657154a91.0.2026.10.09.11.36.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1964765a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791571012; x=1792175812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5yHfGH1NCV6TzhOONYKnxefA3nlftBZshKhCEnR0I=;
        b=cov0H26eXslU2Zvsy02Tb15OC/9W9yhX9Hqfqlt29Fiw8saAhjTkTU1BhfcBuy1Cfh
         k9HNsXywb6oLtvte3yfebUZ8qZKAGaou4afuc2YuKfgE25wi/KPzGcWwiXfK20iVuzau
         J4IIZZS4+RpQq/zU0y6cJ1FMNM8aB7gLx68mg=
X-Forwarded-Encrypted: i=1; AKwUvBx9FdGGfVp+dT8ig/mVTlQg6qo2YMf5AVkpwX1zSoyMOcLzCOVladsSu6X5/lbeG0BwiMptRiqGqWAy8wc=@vger.kernel.org
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr1513160a91.43.1791571011700;
        Fri, 09 Oct 2026 11:36:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr1513140a91.43.1791571011238;
        Fri, 09 Oct 2026 11:36:51 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm4653252a91.8.2026.10.09.11.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:50 -0700 (PDT)
Message-ID: <a5782d0a-901d-4965-a5de-5826fda0d9c0@broadcom.com>
Date: Fri, 9 Oct 2026 11:36:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 5/6] net: bcmasp: account for offload header in TX
 short packet padding
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Nicolai Buchwitz <nb@tipi-net.de>
References: <20261008210621.1374785-1-florian.fainelli@broadcom.com>
 <20261008210621.1374785-6-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-6-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> When hardware checksum offload is enabled for an skb,
> bcmasp_csum_offload() prepends a struct bcmasp_pkt_offload header
> (20 bytes) to the skb via skb_push(). This increases skb->len and
> skb_headlen(skb) by sizeof(struct bcmasp_pkt_offload).
> 
> Because the hardware descriptor processor strips this offload header
> before transmitting the packet on the wire, the wire packet length is
> smaller by sizeof(struct bcmasp_pkt_offload). The padding calculation
> must account for this extra header; otherwise, short frames are sent on
> the wire smaller than the minimum Ethernet frame size (ETH_ZLEN +
> ETH_FCS_LEN).
> 
> Furthermore, small frames with payload in page fragments (such as small
> TCP segments with CHECKSUM_PARTIAL) have nr_frags > 0 and were skipping
> padding entirely because the padding check was restricted to
> nr_frags == 0.
> 
> Perform the padding check on skb->len before the descriptor loop using
> skb_put_padto(), adding sizeof(struct bcmasp_pkt_offload) to min_size
> when checksum offload is enabled, and re-read nr_frags after padding in
> case the skb was linearized.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Assisted-by: LLM
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
