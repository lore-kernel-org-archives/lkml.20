Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF638553F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475185; cv=none; b=qAT1kkVsKn+VcpyrFHV6QovP52yVnQtK/rXHIFbDi6j+OBMs/55d3FXKSPFk1ReVA4vKnJIhZoyYwIw/KFcHCHOdh4DRXIh5XA2h3deHv2FUTrZOUKGGDEr7G7JkhB+tJmLuqoQiOS9KODaWxC3F8N6aEz8fG5cShde1TOjekYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475185; c=relaxed/simple;
	bh=RFYRiyl60OoPN94nAl/soupy5dZK1XSdgswd+55mhg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBCqcqhc3aT1m6n45r/XnwYALCzu5o/y0OrOpsItoVbWjIsyO02Q2UZplxZNryCdL8W0GoIO2G+MPDe1BjyyF4djxEgaPjhY0UvMBFjKnidduQooDOUGwaFAdvKcgwq/zFOo20W847Z9uRmZKJ6gNqLB2QAAo4QoPXagh5qzMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A84e1XRI; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A84e1XRI"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-855de2d0d4dso4839807b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788475183; x=1789079983;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ykzYuBAmaz7rW62KAbS5zr6hcHRjqOUQ1zRCJ2bekNw=;
        b=LcLdsJ+xY+HYMp74l1v5OgZlY80t29Xci8xD0QgwUPc/40rxXswmSubQghLvbl07qK
         kuErrR1O5bV6C698ugvspmS6XHg+DWDWdW7TtXLanpOa/zZjm9MCN7AIVZQm90y13vPR
         EwfncPtg83OnqzS5MhjQcy11pKhBObLeFdK/li6ubW8GPa5x78L5r7ijyTmNaxffn52i
         EuBoWxoD2+Y3lMpNMhDUFPhCx5V7BBc7cKzxY/labtBA+1rV8Bfc5VN9fjOQD9REM+kK
         QENKRKHrS4OP3ZcN6x6uNvtbr1yvMv4Rm3vO1X1B/yA1tf14PWpjiqYOX3DqKjgFbCNb
         vQKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVgI5xjDBOlMtfoY03YT2nDavqP9B0iuuc7lOKw9ya7CdSb6bvYj4Fm+oG0LMJVfhzz/W3sGAq6SdfbR8=@vger.kernel.org
X-Gm-Message-State: AFuF++nNtUuBEJWw0pMXKvtPz1xpBop8WKP6iB6UnCI9d0S8eVc+OFyP
	w5JOTrpZoRI2LGFi8emzEPwR8P5PDOtvV6qPVQfPbYc62SVhjuix2QLo6Gxc/YY2GjzORkfz1OB
	03pDVfM1vUzhAzSUjp9YuEhjmb4HYuZJL0hUz90SVmRyzrY6ln6IvYlb73L51vTIV0PidLygImZ
	Ul+GFWXAQ1ybGb2sLLcMYQpWnvH1mSTWF94ZYunE8YLPHkYX8Cx9co7Ezv+2jLreTESBwgOvEy/
	pSFMsymYPVgIhepQER1wjkd
X-Gm-Gg: AYBFou2Hc6Fj0lBpxx/Xar4uB+DmLrLW/M2LXMF58MC+OxL5YgNIaZZYfrbPn9Xu8vB
	FkMk9dYjsjFc/dZV/Rd4BaSJ8kYNTf06ECfgv0g/bannMDsKLvRPl45pZeVXj7THnKf9YMG1nis
	i0KwiYFqgWjKCLnnakDHndcqMHnteKPPkL54TFwrdSZqz9iXnGYGI5cwgrpLm9pt6mmpM0Qi3j3
	C49TyEVuuUTGK9eqZ/JNqN4NRgZjfofa51tmcMOCs2FS/IVyMbSKgkfICcIhZQ2fqSTW99RXZhR
	KCmUZiARBKogvZOaOjgOEL2NMe/SA8kJfVOvEipRSMNqhU+x5dtsucTw/GgaJ/RH2VPazEu71qU
	XnCnI3tGuJ1OgEtGZX0d/e/QmDXoPhO10UUsTnyuFWWBHgL/A1e85pani1bry4LHdbTFtIiXqWB
	De0/7ub5n9G034i2r1sBunQnkmM6cHEQ/gC4eg+o6x
X-Received: by 2002:a05:690c:f03:b0:832:7fbe:7f88 with SMTP id 00721157ae682-8719f08315cmr3238187b3.10.1788475182892;
        Thu, 03 Sep 2026 15:39:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-87148282de8sm170187b3.26.2026.09.03.15.39.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 15:39:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so16962525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788475182; x=1789079982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykzYuBAmaz7rW62KAbS5zr6hcHRjqOUQ1zRCJ2bekNw=;
        b=A84e1XRIpM+Pj+tREfxhE2IT3Qn1CE6V9sV+J2X3RYiaUOIuQ2HAxB44i8yOgZ2dj6
         gzV4ljWAKO7e7SmvXYnWmrEcD/05GXY93cdJoDNaDZWgq9FCx1scu/c1f4ZfCKaRmurR
         rxTKrCOcAE7VzDLNrx5t0w/PE9SPUvgg2rjBM=
X-Forwarded-Encrypted: i=1; AKwUvBzRAlEgLxPYx4QTxr81+4kzXpwnhdzoJ0uUUtDu7amOlxaPHqJOxv4nU4Y9rEVf6pGomdnht2iLXM2cYhI=@vger.kernel.org
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr11332517a91.21.1788475181604;
        Thu, 03 Sep 2026 15:39:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr11332468a91.21.1788475181093;
        Thu, 03 Sep 2026 15:39:41 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm1913696eec.1.2026.09.03.15.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 15:39:40 -0700 (PDT)
Message-ID: <a177c745-722e-4d68-bd39-fa8916525708@broadcom.com>
Date: Thu, 3 Sep 2026 15:39:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: bcmasp: clear txcb->last before writing each
 descriptor
To: Danesh Petigara <danesh.petigara@broadcom.com>, justin.chen@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: horms@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831184235.4133351-1-danesh.petigara@broadcom.com>
 <20260831184235.4133351-2-danesh.petigara@broadcom.com>
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
In-Reply-To: <20260831184235.4133351-2-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/31/26 11:42, Danesh Petigara wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcmasp_xmit() only wrote txcb->last = true for the final fragment
> of an SKB; non-final fragments left the field untouched.  If a
> descriptor slot was reused while it still held a stale true from
> a previous SKB (possible when tx_spb_ring_full() underreported
> fullness), bcmasp_tx_reclaim() would see last == true mid-SKB and
> call dev_consume_skb_any() prematurely, freeing the sk_buff while
> its remaining fragments were still in flight.
> 
> Unconditionally clear txcb->last before the conditional set so every
> descriptor slot starts from a known false state regardless of what a
> prior transmission left behind.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Claude:claude-sonnet-4-6 vscode
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
