Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A61443E2F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241921; cv=none; b=URkHBNIFWDNrtV9HEULZq7NGHDAriikL1HSCK9HloHu1hFZLTSAF6L3N6kSU2NLU8gJstldztJ6xK6SLLCVdDXy22vJIii4xEQgENecnG8eOnTfmOhX4ahvwj3peQ8UESaOJOAMMp0thny0l/FCBnA1A+0IV7sWMyjal8f6bsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241921; c=relaxed/simple;
	bh=NClSQG2nR5RIo/DxjpVhsRM+ggSNw5Mni8L1nmeSRhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uijl6tL5Des5coa17YlhET5ZqNepamlvygVjyxn7p84k14SsniUQfimfa+dBSKRiSvPnNEXc9nXAX7P2BmGO9BZmqz83jjVi6RwJsAlsFfVhZR/Pi60H3dcCm/Njs2hHaxBwsnNGLqccyfn8RCns8Q/woCBCeq6xDC4/5jzEq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P6fFjsAD; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P6fFjsAD"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-98c7353395fso5407241.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241919; x=1791846719;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=94iLiTY8vyM8AFBst9Xq87yk06idrSO1lJMkk9ngQeo=;
        b=FFt1aIX3ffZduk3LtgXcvDlMwh1ubpNjaM+ghrolo2t840PDUUOY7lz1G+3WVjZyqs
         DDrTKfNbxQ7CSPTwto2jzAq84xKec58nsphJp+J4HW26TAtdhkhIGIATUHtqA8oRauQq
         nWBzMYP5jNbdpuOPbBCEt3QFJMSNbt4aZhtyLEd5CX8Kw1pzK1Qhw+FPwEQRGzIWcPRJ
         Zg1xLPOjHQn3TOCQXQ/BUlYMrHisyctMo9MGhqSfwCyaaI8CqX/X+uq4OsMjxOoMnzM6
         Zq+6YiWN84sCAMvWIw2qTnfK8g9OBJOHTf8LyRAU6iCIgLAUYxpD8FQLZWrc8bDV5z3t
         pLkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKtvv+iWvX9tmjpDfPnvCPaDlSCebcrLqtcWmV2mAavc5SqD6qZRL0VcglEyFsIOVWVqNNODJuqVxd7Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++la09kwhsOB/EnYMQq5QHGh6LS6jXj2mxisz0kWd83TtyO+oQKW
	f32ABdgmot/JFB+Vx+R96w+DSu8dX6ynqp886X7B+b8eebC0B5gnLBPdSUbcxy5ITlX8D/XgucV
	GuOHwx92ZJtxvc+ZbuJP9AQVFNVmdwsP/gtnG1RfpBHxaLdAwmjxlWo9hhX182PtF/EIE++grnI
	8LiJ2vZBJlOMJLF+yVG/Szc3Hrc3TAmuDN/2f6xAC5dTDksXMRPNkSbCnyAMi9HDBpWs/kDr5SY
	sVIokLjxsZXRnZxW6xT8LXk
X-Gm-Gg: AYBFou0MOfVAeIHrWqRW52TUs0e3zRUiKKz0N3C9QDFXQYg4GJODoPOO5ajg15+UAVs
	CnK90lINg5+ijYJH+fj0w2rM8fEbD0KBpe434pkPt1CuXW9CeGciq1E72U9RB8GVEyGJltcNkCY
	DimlStYFGlaa6xc5VWcb6whN1ka9Sib80cvJ+E8nxa0FRwPNoIKxYVzsQhrOcwZiajD4mk7LhhO
	Ukuzj48TPBwAK+fR4voVBPEePIpjSFiT/LRL5BNgmURHwT+Gswsz7j50/XXUralQmAdzwKBzqUt
	NQeCT9Q14kjwI2sao6Ctx/+DIuTPwXidtZpItaFrV0EH/DUp7F45GsFi4sNMaOqw5DzHAfHMPuc
	GtjNF11fh/Xuz0EaBJtsbMLo+kwu/4/tbFD4JZjJNikH3Y3gPBBAnWY2tHFrAEK9SQfRjYdvjd7
	kv27MX3X9KZnH161/1jeN4vudU4BNGd3G4Ki88Ugn1
X-Received: by 2002:a05:6122:3c4b:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5df682a68b3mr2244297e0c.4.1791241918446;
        Mon, 05 Oct 2026 16:11:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5e54c79fbd0sm48272e0c.1.2026.10.05.16.11.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:11:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so6628872eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791241917; x=1791846717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94iLiTY8vyM8AFBst9Xq87yk06idrSO1lJMkk9ngQeo=;
        b=P6fFjsADraItraC0EA4lDRjeeT2d2tB+I8X00TZ9LxIcdpEA3wtpjT2Ks4OlELfnKl
         UMgI+raZcYxngOYBM1f96zELTm/+QPXOJmlu9A/AGSaQmJoXN29tLZdwa6PCjqQTd7Km
         ypabUFuqViFZq21Uf7E6UcZSCR1aPEh95vdNU=
X-Forwarded-Encrypted: i=1; AKwUvBzmdqcSHPcZUbK4t3qH25YtbHju6p77mHC51/7BNSLcoljlmdRY+v61A3eqlAVLb3leOjjwF6cK2eBjcSo=@vger.kernel.org
X-Received: by 2002:a05:7301:dd88:b0:34b:efa3:ea63 with SMTP id 5a478bee46e88-34f179f68e6mr15021944eec.28.1791241917034;
        Mon, 05 Oct 2026 16:11:57 -0700 (PDT)
X-Received: by 2002:a05:7301:dd88:b0:34b:efa3:ea63 with SMTP id 5a478bee46e88-34f179f68e6mr15021910eec.28.1791241916349;
        Mon, 05 Oct 2026 16:11:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b16846sm2868121eec.28.2026.10.05.16.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:11:55 -0700 (PDT)
Message-ID: <ac05e2aa-df42-47ea-8142-f1e1fc9f5164@broadcom.com>
Date: Mon, 5 Oct 2026 16:11:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/7] net: bcmgenet: derive the receive buffer
 length from the MTU
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
References: <20261006-nb-genet-mtu-nn-v2-v2-0-c4be21151912@tipi-net.de>
 <20261006-nb-genet-mtu-nn-v2-v2-4-c4be21151912@tipi-net.de>
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
In-Reply-To: <20261006-nb-genet-mtu-nn-v2-v2-4-c4be21151912@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/5/26 15:24, Nicolai Buchwitz wrote:
> The receive buffer length is a fixed 2048 bytes. The packet ready
> thresholds keep whatever value the reset left. Neither follows the MTU.
> 
> Compute the receive threshold from the MTU and program it into RBUF. The
> buffer length follows from it, with the status block on top. The MTU is
> still fixed at ETH_DATA_LEN, so the threshold comes out at the reset
> default and the buffer only grows by the status block the hardware already
> wrote.
> 
> Program the transmit threshold at its maximum as well. It sets how much of
> a frame the MAC holds before it starts sending, and holding less buys
> nothing. A later patch lowers it for the few MTUs that need the room.
> 
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
