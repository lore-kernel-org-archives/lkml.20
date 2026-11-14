Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626905;
	b=LJfQ/G+xPVPwnBdUr/Q8jfkjLvz0BTuWxbUnUbXODGh+Rs+Ui3AHqMKQj0YQjqAhyVay
	 N/d872Oc1R5UmgO49z2CMjicfxoHbWVKH9PdBIGyPO9FOaomnK6Ka12AdiSP82OJbATKZ
	 Kr9eU6vL048IX7gBKXrTm14fnRrYMKk/P6BSKSWhfmU5OUIEvlWI1a0I3lfjnPTa/6V8Y
	 upVLY88fGKC7oY8r0LerAUWCYxZNiGqT4fAPQvoUKfB4xfQdHfKBjp817oQSp7A9kR3lw
	 Fu84CW6hYKq1kSvvpnIaajiO+Mlg2NMUSWTjqslmKjXbP3x1hGwb9aBJY801Y9FCxmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
	b=nyTK7UooBJDty3lMVAzs0UTkovCPVNX0W3umdgWlchVm4+44L8Xxa1V+bDHexfHoOT49
	 2eGZZiznxbzPuFN3Kwgbw/7slAvL9fY7+q5NuPoaNrBQHVSCdpdOZscNzjuYXhrN9vTjQ
	 X+TmlkL4DXo02R0sSObSktWCq2k1G8InEZ1/TnyUc36TB6NaXHy9oUu7r9IZiJu6tJJg/
	 NoXod8Z1fiK3zl3Ylw0T7JR/7zGcsyxs7Yxsraq6Y/pt4vnFeHbPHQaorA14XWkFAhnBA
	 H6j6MXZh5Y7q9Vasn2Bpvs6+ugPJ/RmH/tu6EYFMNq2pv8pNxW88oxqKex6YBjSVoOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="A/uA7fzl";
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D52606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D52606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A/uA7fzl
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a60f90a924so690988b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626904; x=1795231704;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=NWxpJuEgZ3APQXqcyuDlUwWx3Zjl5f4aY0o4JIF/+zx9Cncls8qNgqXGuAVKEtqRAI
         BrWxRxkpdGbzoMrQuB/fTjI1rmGaor7z72FxZKvlXQ3QuhLfURWK8s1hMWQchedr0CYx
         +aJV93K+OhSDiYiNmM8VjjquTHRPxjIwJ6vmuUlEof8jBpq7xdEkJ2InPss8hwsJfBar
         WKDBE4PWRPo4wCV205e+4vGulg9HQmBHXgGAGlrmLX4+i2nNcsf6tRhytNWJEiaqUhOH
         ER+mt6JLHmhxtYxKzJU3qEDL2p2iZPS+oQ75JzbSPWDvlWChtGLErMKltZbtr9TmxJZK
         5RdQ==
X-Forwarded-Encrypted: i=1; AL+hErEGCBmmAMUmFFfsDaUV+mPFtMkJqQI35WY6ARPs1SNuz1knTFBVBb3XwqMbRCS7g6lpwJvTsDC2oY9tlzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EkBw28rqvJScuZZ7DZDkyf3etr+3GUqD5lC6nqTpqCa/9V3Ek
	oi8LEA36DFYWi7P+KxNkzC44nfgpTD6gsdprpjl0ogKKaBoN9H5qlwGYdMKJaFt0rBc7LwMfT1E
	s58X1I7/kXbA34QLAuMtQIufE+NYxlTHp3oNTo65SpTaZTLGhh+rNrqdfE1jc0DFt9L3fa443Q4
	Udt1cHikLhFptXT861JXuLTe3IhNB8dOv6pY5c9CfJYUrK+WTqsnKawaU+ReJGxMLq4+NjLBHpH
	/w/TFs3PEmrFf/+vmDP2nu4
X-Gm-Gg: AYBFou3DI8RS+Ys8clHDWrTqGJcLZDcGywWBrpu+8ejbiwedatvvN/EqXga5sY9i19D
	RCEeXrL8XCZCtXH9wcQWUj9E+eFWqOtHyuuQTU1rwXfpjKiRhDAlE6y92GFmvBM6NZj9FO5SVio
	etQnhpHmQUGgsaKSE6EZR2bRzfKNvR0Bsi/xFj/HSMsZvwBaV+mlFd2jsGU/h4OcDNXvhaetK6p
	2aPsZPktlesWC84BYxPS8uNCVoG1TYuWR9VMPrbZ4inRY5s4WYL4u0XtfE6AfZX9xa0y+wiwmgg
	GWfCCQazyry9aS2gbABuayXZ4zDtBjPVWL8uLT37IJQ5kZKxN+CKz4gsi2CPP0GhLlaW/pGiux4
	j4ixAB9dF7x0qnrT7/GObxvGkuuWXaqX6uZYvinrIi6imrq/LkpdoiaOBFXrNzaBXMZBC/cNDBO
	CAOei9z9H4UXO4cIhINBzABtPK61FmbIzYrBBjQlg1fK0=
X-Received: by 2002:a17:90b:440b:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3b1b07ef8bbmr4176722a91.5.1794626903657;
        Fri, 13 Nov 2026 19:28:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm6348423a91.4.2026.11.13.19.28.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so2071371eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626901; x=1795231701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=A/uA7fzlk/A4Had23/sq+ol+TDZ5Q3hbe1ufB3nBWTSuNZdFFDZeySdsmUvRhexV9f
         7kT7toh6w4Ux1WGrsfiB2ArNMYvleGcV2rko/pEPQpfxHsMxQ6xB/Wic89nGsjLwE8De
         193HFQ6drxr6a3FOyhICv0F5sabpkevk8wfZU=
X-Forwarded-Encrypted: i=1; AL+hErHeAbn+GywrRjPKhkG/Rqvwukx7S7lbNPtMhhAAUWN0i3ejijbwJkR25ke8XK7AaHzFI1K7QPsLUgymFnw=@vger.kernel.org
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392583eec.26.1794626900940;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392538eec.26.1794626900216;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11415865eec.12.2026.11.13.19.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:19 -0800 (PST)
Message-ID: <fbf90cda-d622-4cb6-b576-9576800534fa@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:16 -0800
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
Subject: Re: [PATCH v5 01/11] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
Content-Language: en-US
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:17 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Should we go through the timeout failure case with port_disable
> not returning all buffers for whatever reason, the
> buffers_with_vpu counter gets left at a non-zero value, which
> will cause reference counting issues should the instance be
> reused.
> 
> Reset the count when the port is enabled again, but before
> any buffers have been sent to the VPU.
> 
> Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

