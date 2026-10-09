Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C3239A079
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561630; cv=none; b=LiAM3/P6WvUXRr4EdE9aiRZOPeoNEPQmoB/Pmkx3cvshJHqUFVUq2cLQmIc8AvEhNKSoODMFMZYaGElNXj9gPGmo5c3jNN7z1r3CfQBIb/HCj6lEYpNHoSaLtRyWZSsPEdkGrJTxHGDqaLI6ZI6XI6EZmLkh/9PELt3jlFNM/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561630; c=relaxed/simple;
	bh=mCvqn+45/nJ5qgb2Jt/wzfxjbB7pAwP4uEqUPkzcJ4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrCY80k2P9wIpKLbEA9YNAL1v7s4spdyzogzz8eKKxathTBnm50NCcHGxtWg6GaQSOdIl2m7OeXaJr4VzhXgusRniIGzY5J7+H+JDFubDX7zjnyOUWiWiZQy2gzwym30BpLOSgwG3H190UQ7GOcIfXQW3rJKoA9GXfzZMrXl+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=df8rMgSu; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="df8rMgSu"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd3310348d2so696928a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791561628; x=1792166428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BoAcjmTGDMQ7W4hCyrQKpaXZFHre/1+/rFWZj/Zjma0=;
        b=NA0cFgYljJYAeFRbmUlceBcyh1CS9i9Myk9vsSJGxMbvKqSZgEmv9u3l9qzLkMXuxz
         cwJKlb0gAZOxA8+iPy7qPfm4OYu4Aa2IeVhHHVAeKjaAeXwyEc0B/eviGyOz4pigedVq
         6is+tWXrI//sup6RBgGP7ZXZ4Xych+K1xkJ57J3+rJFUGHqC1PaA9KPouVoPTtVL/mIS
         T3GYFUAOjCIakACVpXoXFwxafq6909WQKk4RDLQAnP+1ctx0GVin7grm/s/lEeZ9w/fy
         I0NLuBorwLKtWPZDgDHrbxUjwL/Vm/d/YXmJ7vWMF/7EF2vOL2kbUAq5Cnjfx0wcwOkZ
         qGxw==
X-Forwarded-Encrypted: i=1; AKwUvBxrTUvSIEpzftPnbJzbU+1Eu/nagDb0M92cCCTO67lRbBut/C42IwBU/C315o1j4CSIbKhZNZzHza5ItLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGGCt94xCzSepexiDaFIw7dU98SOTO9ck/+1Jp9ic29MKJqe3H
	SwEM6kI0eDiYsXkkDBnzBI6utjh69EXjt5acj8FPvNQnt9w/QbsyHv1/mDSu5AMwnVfEEGRzNwH
	G6QTk6PmehFffdgPxIo4ak29hx3IVwWMPMf1vJ/q/Vmr3WPpwlYerZ8kgWS0HSSva8UjkwroYhP
	8kMidHonEwUyUb8QsLuNWC7L+9kuuFS88X7f+D9jsAypOoRg0hnaETM64VBT7eFzIHdTupUIKYc
	+hfwmi75nSsI9qUBjnwXJeA
X-Gm-Gg: AYBFou3dseITkgvi/lTokFX4RX77KjkxUvr+3qu7JXH6Mr4FSI1vbMHICbqe6Iv2ES2
	s1/Vf7xi8TyAgljg9wE7ZQ+boT1tBH/dsyLVYPttdi78s+DfjuKbQT09iwoqfWUOvNv7qQiyI9k
	J9X1WtSjPNFpUNlHqAaqFpuKjNMSMdz7FNcDl3CbWRGz/6xPMSLNavxuKRWtTkoRSuOuelmUS/R
	eeBUoy6JyRiS+RXjXlWg7xvoziTqZCBPzFYhLI5ojn+H6GIh2HxtFyasCandtf09+weRm61iNK6
	TsYIt+Gu8CNtcmF4v/BZd7M6wSB+EIUssl7xxcocn0myRy26TxomlHmSiNu01ZS59jrLFEFJ1no
	O1fXOXV9YMJx0N4fM9r56r3nnqw1/70gRp3oC1puWR5rObdVNwywIrqyWENFknkdZ7IqB4TFfZi
	KJ2qaPi4OKo0WtzrOjUxbkQbvBptLuXTIS608c4RKP
X-Received: by 2002:a17:90a:5185:b0:3a0:bf71:eccf with SMTP id 98e67ed59e1d1-3ab3a9533ecmr943013a91.14.1791561628109;
        Fri, 09 Oct 2026 09:00:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab36def2dasm1381155a91.6.2026.10.09.09.00.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:00:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so2552755a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791561626; x=1792166426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoAcjmTGDMQ7W4hCyrQKpaXZFHre/1+/rFWZj/Zjma0=;
        b=df8rMgSuBirEHv5B7zamZOUrGtC91VS1OaGuN1NwrhehxMOv4nRYA8lRNw/XXdQGX8
         7/kVlk6+AJRShB0G5gVEF0EhQoWtkIvi5/UcsrR4ewMM+N45Aw/hfmqc4sSg1S8oj21j
         yVKDo7WebTiV1vUZmTW+qZUysO5FZUuQxwkb4=
X-Forwarded-Encrypted: i=1; AKwUvBwWmFCEsq9fZ+hYOv0a83DD1a2EACaXGa0TRbRcr8uOFRGE2dJ8e70qseuc3FkwkqOqKxf2K80OCi8f2FM=@vger.kernel.org
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr1568080a91.0.1791561625678;
        Fri, 09 Oct 2026 09:00:25 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr1568053a91.0.1791561624978;
        Fri, 09 Oct 2026 09:00:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm2008141a91.0.2026.10.09.09.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:00:24 -0700 (PDT)
Message-ID: <688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com>
Date: Fri, 9 Oct 2026 09:00:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove {sbranden,rjui}@broadcom.com
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>
References: <20261009060035.544789-1-jirislaby@kernel.org>
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
In-Reply-To: <20261009060035.544789-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/8/26 23:00, Jiri Slaby (SUSE) wrote:
> Both are bouncing:
>    Final-Recipient: rfc822; rjui@broadcom.com
>    Action: failed
>    Status: 5.1.3
>    Diagnostic-Code: smtp; The email account that you tried to reach does
>      not exist. Please try double-checking the recipient's email address
>      for typos or unnecessary spaces.
> 
> Anyone knows if they care about the entries/what's their new e-mail
> address?

It's first.lastname@broadcom.com, can you resubmit with that fixed? Thanks!
-- 
Florian
