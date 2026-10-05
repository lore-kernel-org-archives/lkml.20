Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437784D7D29
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231767; cv=none; b=g5UqZTTLUBv3fulT7+brpHfA8egVyUnt85EBovl+en9lpdD9+NLyuosC44sA4zrw0nr/CWq262kxOT/hTD4ouaBkbWz42C2Igr1tv57iUcGcIoKJnk+MYh3SHoPBZo/glzGaDBq9eYtdrObiVmwkkWYLzyBrUEdP8qqfK2csmhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231767; c=relaxed/simple;
	bh=vVftfbO983dMH30ztaHLyqyoAc68CNw36k+b+VcTM3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrE1bza7mcHpGutLtDQfFj/9skmzNSHo4TMmsG+XsGjIC2QPHLchb61/nmn/3WMFqfy+K2mnY0LUdMFVutx8DLpR+wdY7k9VoO8nxQTpUEXdCboRrOZSc6hPb/Bn/wGQiHXotE9neLf6O9VMqf459Tvly2W+ydY0qipMN/LnN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Od+FmiQD; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Od+FmiQD"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2db80fcdf8bso3554025ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231765; x=1791836565;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZlFJdwc7oi9xmKEkV3kt0BJUfy7wkh5TqERqZflzvAc=;
        b=AdHzxtQXbyO6gDw9EmaXizXXX+1taWSCmkNInpoUAXTW62dtZXi04PIYvdQwf2G4xx
         a7I2fYNhFPjltpM625y+D59qZJug5Q0Dw477veHUTg5o6iUhP2cr9ICMK+qW/K1K0130
         wHuaqhkhBQ1SVfQ1fI7MCrqrVCjgGHwebsAK6YTH+YZFR0SHBgTrn/UcwBNoPfn2w8Xz
         qYVO8iR5a09nD9nlXSd9syp0QVM2MTxNHv5dAo3IPS3iQAk9nxDOJbhQjQqBH+OMY5ZX
         +fgfN/rOTWZ6pP8o59he9sN+D5a7TjsAAGlk+NSjM+h92ybZfTSF+lzDUwWauQduNBDI
         8kpw==
X-Forwarded-Encrypted: i=1; AKwUvBw1hSShKc/oG43lj1KX0Vw8mB938Tk0KRAEhywCrxhieplfaPB5yaPfygVrNzqYW7kMI+j7p1oDD4cMw/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGhBLcwoqbYCLqYuqK3Lr4tSd2sxjYjtDW+xTuuplZ2xVORAaw
	BaTaO1r/rMJj9sJzADoJ40Q6r+h0AhA0TLvBhNwMvKyu7F8U9nBbq1nUIeLZYhqpETT5ILVzC5M
	0hy/9KPuaOvO+tJqC007RrIzzSSyDgz1Swq7MqljXnyd9RkhpiDJm9vnEVaVW8/jmi/FQGejM2A
	PbD5msXn7OgJcIJd5mwMjzNEi4Pyg0SXV3it5Dnu12jIJDyq8hoiKMsvJb8kBjACWB8Wlqj9T5R
	cIJTwvAnP2jzEKXgJWPB5rB
X-Gm-Gg: AYBFou0cWUxDGLXFukpyv46ocdiPhgVmrMf1cOECwyvJAiU0skny/Z6UV3AZwCh59xe
	i41gNHcnKGi07b5RBMryXCnFwGud05QNtPXHfd1jFAVzJFX4x47lNcX+1IqzCq0LjCyYaGDUPjo
	lwW0PKAfKZwlfdVXkduL18UJBKaHfXjbpc4cw7i67RrkMugduHGGTVYEGEfJgQNANZ77WZX8e+Y
	QtgNQ/jKgLh2WIBaV+shO+kBUPCSfzg2+UOCuj05xgni5grocO+nF9HSLMzs3jJEjEVvYKN17a2
	qconyBp/IAF1gqwcpVZuJuJ37NXd2UCwOx1j3wnOExW2V4hdk9I7+gxUn18v9GoWX1M3aho5W42
	Zs8PVCTO+wCOYZrID8V7OPIK30AfXnPxY4it43w6nJeZYaqTyPVnY1ZNI26smhzv3wdRpAT3EdB
	176YnVpn9JT9Ypv/7T8zm87jjZidDkkbCnCkm1ztGBFgc=
X-Received: by 2002:a17:90b:134b:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3a790460472mr3395339a91.4.1791231764947;
        Mon, 05 Oct 2026 13:22:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a853a8c939sm302794a91.4.2026.10.05.13.22.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 13:22:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d4a8623bso18908065ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791231763; x=1791836563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlFJdwc7oi9xmKEkV3kt0BJUfy7wkh5TqERqZflzvAc=;
        b=Od+FmiQDPKaGZ1BH79ZBGT2F3kncRwMpLwxbKnyJSrpnJN8bn1jXkwyLwMUPPSq4Su
         G4iLz8we8fqMrGm8GoMjeVYOHnRHk7Vxz8VekAfz+tc1FkKjSs5rwR/WLZVCDo6a4YQH
         4u+lQOBYrm903OwyuMpDYPENjlWOokPR3LC2M=
X-Forwarded-Encrypted: i=1; AKwUvBxRnCZFz7Dkksy7MjLuGZMCT5w9I49zzaAMQOE51zNZQslfD9sY2I4W0B7gxjlbAZ01+826E8dm7m1A/dc=@vger.kernel.org
X-Received: by 2002:a17:902:ea08:b0:2e5:73eb:a086 with SMTP id d9443c01a7336-2e573ebbac3mr52399895ad.54.1791231763328;
        Mon, 05 Oct 2026 13:22:43 -0700 (PDT)
X-Received: by 2002:a17:902:ea08:b0:2e5:73eb:a086 with SMTP id d9443c01a7336-2e573ebbac3mr52399635ad.54.1791231762830;
        Mon, 05 Oct 2026 13:22:42 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae50fsm12565585ad.25.2026.10.05.13.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 13:22:41 -0700 (PDT)
Message-ID: <3c355cc7-5b21-4356-90f3-14e8cd48037e@broadcom.com>
Date: Mon, 5 Oct 2026 13:22:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/7] net: bcmgenet: let the caller decide whether
 to start the PHY
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>
References: <20261002-nb-genet-mtu-nn-v2-v1-0-96dc6d54cbee@tipi-net.de>
 <20261002-nb-genet-mtu-nn-v2-v1-1-96dc6d54cbee@tipi-net.de>
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
In-Reply-To: <20261002-nb-genet-mtu-nn-v2-v1-1-96dc6d54cbee@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/2/26 08:03, Nicolai Buchwitz wrote:
> bcmgenet_netif_stop() already takes stop_phy, bcmgenet_netif_start() does
> not. The MTU change in a later patch leaves the PHY running while the
> datapath goes down and comes back, and phy_start() expects a stopped PHY.
> 
> Add the same parameter to the start side.
> 
> No functional change.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
