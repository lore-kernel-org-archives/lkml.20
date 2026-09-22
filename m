Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87F3AB47A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093161; cv=none; b=TXroat3au0NSN87RSfdBLviMkt8DXurQYkXRYXVwhYc94N1p3k1Y70hOeVzqBw6q4159dW8FpxmavdStUJESviZXuAHoywtWucSd9k8fqT6QzXPAkWyNpHzpccmFiJYQxADNfVO9e8XTK4rH2Fbtrss6PnfrXXjSTyfZz/92EM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093161; c=relaxed/simple;
	bh=cBEc7uDHaj0F3xOA20DtzQQ/3s8Na+5oIiUZ7+r/aMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE6Rlsp2679w3UDjUT24H3gvgdC+7jmEbAt/pEHMgpiPUZxaOfEwlunIGspvQTSFg4wU4dDbXTqQaRK5oFyFr9GNrybumSzahFSqoYTTl8MpUqkpxPQMbEXhPOMVMPUuvG9fM1garD4JjdrEoCLgvfY26rLlvBDMciHnTdpuET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iQurr0gN; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iQurr0gN"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so9786a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093159; x=1790697959;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V0YyTnBog96V9Zb3wGwIvmL06QL89nmCL7iyIr76ijI=;
        b=2X0gfXBeTpwR98CJiB6xm9iw2/37ExaYmNwhn3poBdNbcsQuiSxdtY7MQm/2ZFTqNZ
         3LibuGEM58dSX2ER7e1Hu6xZgXVv1/A565AhXpfgoG44dyGmJ8QuhPbeirKMrVyoPwXu
         Jej3MI4mhugkB+LdgB1KL1qbPWs7HCbYp16n3XqmdlBq/StauEAYoWcRsXF4yMOND9Z6
         XjPN/8vPwVJhHy3nrr6fa/UZ6K7/7f9mFQ5LpUMfkkxS1arQYWoqcdAqilJuXCc0AfQE
         dIZ9e38zf8cYrCaVNgqsCEmGyvqhpEyPOHrL7klSVw8xAMi5tlZ91beSt7QAhkFCpOX0
         7/LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCdHp0YXdakbOjd08g9bl1Vz1t8LleeYm3A0vTLXSd7XMmI3pTYYIrGHMp65dZXnLRyrJYPxVF4d4BD0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kvXyedFFDsjoVoeVSsHgExY9CnTJWlADg5uHN9JpgDZSkHULMu
	qsCwv14t/9lbK88lzBF14TxqdupChvOEJrhjKkF2iPLP/7s2zzEHa/ZZxwXZeuk4+HVWZWYHicF
	ptnfFjRAQGUI2ZLg9rI+IKEU2R2zTCcwKpQ+GoPymeIwdLlNUOg/rWKIbq4OTbEuuRVqi/l5lvK
	Xpsigw3l79BKEnlZ3H8rcqUH8H22BQ/YsLvIR3ZqM/lWUQc55kZASNs2SkQKtXjkz91ZuxTOwxB
	RO1eOLvzAsSBWbt2B5uMbfI
X-Gm-Gg: AYBFou2yHLsAKDDpxcvAtkoVnVnR9o09dvIfpCNq5tM5BV0i7f1ubOt2DvUMJJWEy18
	Wpj+C8XNGsTPcpiRxAe4nipUhoLmS+rISqC3Z7hZty4FpSKX4p9AmylTUEX4YU92X6wKMCQfOXJ
	lTPQcLYAQiVXyTTbO99LTWn8cmPpHXAasLot1ypp1fSPG48YwEJxJlVjg2B1LcUN7dTKB5NvSsQ
	DG83lU82S0UBpbV3/xicrEA6qmpYPcJ0tuxJbTd17+oNHTgO2SKWzLjntREi3FDkOc1wBDOThjN
	P+IRxM4P1bkEvovFmeVzZ45JYQVFvsvuXzcZilxHUx1WLwoiSIlVQixSvqinJ0dBYukCej4cUhs
	6SRaa5KhmkYx9/FD+JPhMfl3IHPGe+5x9O+aGOHwLG5Pu/9eJyOMXqIqwV07kbWAh8wXPorWiyE
	iu0Ehr6PhMCtFJLHVcwLpB/yNNBM4Kh+clRiUweBFySDE=
X-Received: by 2002:a05:6a21:3b92:b0:3dd:a196:53a1 with SMTP id adf61e73a8af0-3ddec86db00mr2488723637.67.1790093159233;
        Tue, 22 Sep 2026 09:05:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc756a179b8sm940306a12.4.2026.09.22.09.05.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:05:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532e0dd7d9bso1556821cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790093158; x=1790697958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0YyTnBog96V9Zb3wGwIvmL06QL89nmCL7iyIr76ijI=;
        b=iQurr0gNBLdYSeTU7SZjD5/BU1k+oQF3YLM6oWjK0JxRiJdlizXhpGJXXz6gBY889a
         k0CVcPtN1Er353LwBX5uT0tYXC9z+J2ZoLV+oH8fHE2ps6rZDEdlztNUyBLC0D9I4Lfv
         3xOCWot60njwXmMWgFxDN3hHkLyU0llz/oDZk=
X-Forwarded-Encrypted: i=1; AKwUvByGo/6YMUTLbUvC7ZyPX7n4J2qKqfZONu99EqFVHrdd7W0mHpKE5Bj/4QQF2FfuqQm6HfM26slAWLSW8C8=@vger.kernel.org
X-Received: by 2002:a05:622a:14cf:b0:530:cf10:8a9e with SMTP id d75a77b69052e-532eadce263mr614931cf.39.1790093158025;
        Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
X-Received: by 2002:a05:622a:14cf:b0:530:cf10:8a9e with SMTP id d75a77b69052e-532eadce263mr613981cf.39.1790093157020;
        Tue, 22 Sep 2026 09:05:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18c5ee4sm16133671cf.11.2026.09.22.09.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:05:56 -0700 (PDT)
Message-ID: <faea1c6e-1317-4771-9096-75254877a810@broadcom.com>
Date: Tue, 22 Sep 2026 09:05:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] MAINTAINERS: add Nicolai Buchwitz as GENET
 maintainer
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>, Justin Chen <justin.chen@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org
References: <20260922073140.1471858-1-nb@tipi-net.de>
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
In-Reply-To: <20260922073140.1471858-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/22/26 00:31, Nicolai Buchwitz wrote:
> I have been contributing to and reviewing the GENET driver for a while
> now. Florian asked if I would like to formalize this commitment, so add
> myself as a maintainer.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks for accepting Nicolai, welcome!
-- 
Florian
