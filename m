Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18073955CA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785642; cv=none; b=PVtuHRPfBToFfmkJZXdeEZcaEERbO+gTr+vufB+bIDMru5pSFcMtzj5OXOAyyfe3YiBzZhXYl98J9r5TjrMC6VmC812bSDgo55jfzl5xM/+jwcw2/D/oaoo+oCK8mGzhUlCmmJmkk1Z+b8hKXuvrYT1gnAvMSP1+G3e/qFSIX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785642; c=relaxed/simple;
	bh=MwjEzSqLh7q5IHjLoAKUjHJweEm0MW6iCRPkIfebgvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeVbSEFqSvyY1ZPPrlj1DvCrOZmNpKsGM+pHnSFXJ917tUfmguHU39IPHqbucnTFh0JRuB50gf6XyM8VrVaTn6NCaeTN7fSnG5KqnptVj+N/VfFDJaPrCX0SM59HWsd0DUYz7vj8e1te65MWW9wcTDtN2q9SBID5L1InOabjWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QYQf0Nnp; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QYQf0Nnp"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1562534a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785640; x=1788390440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w+Ksm9mowr5e76oy9bv/8McEmzTkr4pMHatHJvGkvcI=;
        b=QNGid5mALnkD17yu8sllznbA8kyAiQbDczS0Fnyf8ACKWZzzeR2zINJ7UQT50VsR1i
         qVaAauXBmdkegIPEDqAcfEeQnXyWyGwZgAnHZ1uFKtXNnemCrzhy7Rnsgq+6CbEFsYP3
         qO9NQEobpnvx9IpBHA/1LAoa9LbVyhkLW/O5OZQpmpD8IdKkHdfl91m2PzfbsZURMnjk
         bR9Lqoo0KUYBHxny8FH/X8JbyIKYD3DP4HOH9luHwpoS3oNkZcpgdhQZc/ZBHkr4Fx8v
         TEw65V+Y636WaDjjCXhSCA1GIyi8HO/bx5IinBFMIuEw7skeNIP+knN+UZ8xwb5EF18d
         jPrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+p/5DE9FZpQbnU7wJXYekLBlWv68khnbHLb1Cu2kYmK58V4cOUrshTll0oQ+W7iYyMCSgkoN+UNgtghg=@vger.kernel.org
X-Gm-Message-State: AFuF++nEDQqQES0GJPmdLGIeMg6Blbyk5R44+CZCPHbPq8Ge2QMZXAWD
	OxYqdPqwNOLr+tuHGOOVTUk63N5AfMkLZ5rQp5bMGJGtuhGv9CJGFpkpWX6L2HtT98mJT/b0gR/
	Fdfhmn/P+33KSyf6HwhAV6VXXSQ4GmxAb3KhLgxl8mtdXQx2qcTvKELQ23n3vUShR+Cd4h+bTvr
	Lgv/dcjqICTi+JhfWRdfEiTgqNU555p8pBxNJmxbHX+/kWP6eYQ4IDS5pLEZe2gMvR3Q4dssPhK
	fLVu/Cd0X+zliIIe0apUCBl
X-Gm-Gg: AR+sD11rVSUsW5N+2R1cf3eSs4h2cg/1YVT2ACwntYAfTg9UWTXwP8SWjGPmPBQqAI8
	CqxobQMODaWjLGFzzQbMUZZuCyfBN2672zVXV8ZhSTRBgui5lvQH1ocRyzSWjFaI6+YjlRaXk7+
	+F90Rm5ioQuXUfHvhG5WoBikKEBS7hEceLoeSXHL3Wk70exBjNJBncYMFEe+0qLHbWgobebp/ww
	S9E9/9s29M6tfIb5ikoo6AnF1glcIqiVQ9MuwSvBoy1KRzxN9GxWSo1OVCLPzPkxghMnckZS7Bq
	QM0WmCamfGxhX4ONHe2e98/+usgYCQj3DxzBshVgGUsam4WUL8+ViJyKw8PVAsTZL4h3h59nk6A
	+EPWFG3aapI+C+iFhPK75Xs2gcj5BJwgzhc+MAoCCYjLCf2LlnqUptk4oG49IEtCKWrPbzH1A+E
	jQJj95vV2H//Xh+dGWMChCEWnPW7DvjloKgpZ4UvXIdm8=
X-Received: by 2002:a17:90b:524a:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3966d1ba7bbmr22471561a91.6.1787785639942;
        Wed, 26 Aug 2026 16:07:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39670936531sm524556a91.1.2026.08.26.16.07.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso2836494a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787785638; x=1788390438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+Ksm9mowr5e76oy9bv/8McEmzTkr4pMHatHJvGkvcI=;
        b=QYQf0Nnp5eGKf+gRS5jK9yRXQMVh5KP3nIBm/RwBMR95ycu2+bcr+yQ4hifcK0IN7Y
         s+XQuphPodkqfogInUYh8gY9vcI9zbXVXt54DSv3BwuOwtThwgFr6KLbI/Rw0tFjKUfQ
         qDn1v/BsmHiocTzcoGHl14l6Gnye8EESSmc0c=
X-Forwarded-Encrypted: i=1; AHgh+RqnvhM4GFY8GLv2A5rjFELe1IJeyQv6un3Ydhcr8o1CAN6lFvYndRRmA/3CGmBI0vQnFOo/EK3nhKlZU6U=@vger.kernel.org
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3966d144247mr22371183a91.1.1787785638357;
        Wed, 26 Aug 2026 16:07:18 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3966d144247mr22371084a91.1.1787785637871;
        Wed, 26 Aug 2026 16:07:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d769d81sm12061409eec.13.2026.08.26.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:17 -0700 (PDT)
Message-ID: <3e5ec697-8f8b-426d-ac11-4c851aa5204a@broadcom.com>
Date: Wed, 26 Aug 2026 16:07:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: brcmstb_dpfe: Bounds check DCPU-supplied
 MSG_ARG_COUNT
To: Danesh Petigara <danesh.petigara@broadcom.com>, mmayer@broadcom.com,
 krzk@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-3-danesh.petigara@broadcom.com>
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
In-Reply-To: <20260826201500.3000125-3-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/26/26 13:14, Danesh Petigara wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> A compromised or buggy DCPU coprocessor can make any user who reads
> world-readable /sys/devices/.../dpfe_info|dpfe_dram trigger a kernel
> stack out-of-bounds read of arbitrary extent. This bounds checks
> chksum_idx against MSG_FIELD_MAX after reading the response from DCPU
> message RAM.
> 
> Fixes: 5d06f53d9509 ("memory: brcmstb: dpfe: Compute checksum at __send_command() time")
> Cc: stable@vger.kernel.org
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
