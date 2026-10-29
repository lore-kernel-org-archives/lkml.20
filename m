Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309433;
	b=YlLn/GAfaC01CKHXTvSvWFO1AVffF0Co7J5XBTb7V1DyeRvZKBAJpHS/2QZ99nBRLkMT
	 LmxQBhRkWHMWV0wVfqN9SIGCLzlFHyKK3banAHt5kiCYop+qOg2AIemeHN7YH2D9U4oHh
	 nUkG9P7TCYe5YZilvsewK4+vtd5h2GNMT522WbhLfBzQyYFpcaNjLvqajb7ctse4CiVzs
	 foFu0n1NF+nZS8USoKGr7gp2iAD9ptkkiukW1Thq+cQM1GoEhK2xQ9DF0DSrfZyFUbuqw
	 JpYLypRbknYxFrELFPBn+anF7MGqSHNYv1NXp5xWWlLlK/9YWweIAoFxYuMJv3aMmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309433;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=;
	b=tSVSb6Wahil2i1vl3+D2iLabMWxbcPpYqt8EojH0K5SD91MRAVeBzfPxHslcvJzBNSqb
	 WDevByjEqPRPLhxDCusUzuCeWpiarDEJ01CAjw89KwOCuu/u8uCo5NApFYfjuXjk2SLay
	 OziS2hbUegYl8DJPXABXD5KtLUhJR9TuSsqBwbRamsz7J3F+97+EcsT+s1WoU5Ct9fr2S
	 nm59RHYsN7wmTEFFpPl7orGRNCAIaCOiepSkvt4EyRiH55jOFBWFURugwWVyqTmKrsnUA
	 wKqO/28rf6V4bYPspc1ScYaU4Pp+k3JxhFaAhdvf7V6ROaWIaAglym9XSju7NTZoZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MFuyOLLM;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D222606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D222606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MFuyOLLM
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so30848a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309432; x=1793914232;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=;
        b=qAvVM9zv90fqbbTdg79hNTPfsmE2HcW8xg7UVSoxBAm9UMKgJW71Bh2DmnP9ae2rtD
         kX6yjVNF5PAjoCNU5jJMiwY9EtFCBEea880//CiEVZBIlckrie5/bs77XWK7Ke9P49gy
         NtNVvywN/KSEofvVlwDpGEqVeGq29pr97/h4QJhG9MKaKtDVMx0ThKfHado4/D4yzha6
         NyDY0zBXI0cbch1sXiSigWoy72Un9TlmEtTxkjYFgHy+RZNaAM4ECebCdPy5RvUEwHp1
         6fpmRxA4ttcK4Ch4e7UXsVREgigH/KsJEj3FpJdBNJnw7KHDkXApfES8vpnQLTaP633Q
         OEdg==
X-Forwarded-Encrypted: i=1; AKwUvBzl3fie9SyEe5d28O3M2E/YWrXJRLYPceg+46JScbXRlJY5KdX3qg/26mPgOIkZ6aMft1Ga4HBuI+7QV4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJECAPQXO0w3LLKMIkJne1Heoo6CJyrIzp9gZWVTE0kLR18tgnk
	qwj0ulA+IX05xfdRt1bP7apqdRwmmCMTCGjA4tJ8Z7ipC82cYsw1iuFCa4yq5pDEsZQLt3HD+sK
	DpTwK0hUo9473A+GgnPxts5lTF6wV+e/ah8keKAW9MdbQPA0JdmGBsAbcW3G7RMmwCcUq+fLx85
	6cKDmvkwVKeE1Yo6zwjP+xdOAhq8Ufli7aCGwG1xqkpLn5w0ce4ekDvJyJxmdRnvajyXb5gwbuP
	q7oOVxc0UpuOuBF3UUSGuIV
X-Gm-Gg: AYBFou3+IrWiHRu8zEFu9ewaPlHJda3yBH9+Xe+fh+GKGkTARAM5qgAGhBtAxX8oo6q
	HobrA0BTnWy9IPS9ncnHSbFkYf086ZgfH9nWurOY6GFdRx6zsRMltwEOKZSAQbCIaRoPlVDWuHN
	fsZgtTyr2cSIN0JFd8CmEAdWSp1Nzpybkd1EDjRWkLJKjXtN7igzXg7Yl5SVM3bl2E0F0GSRyqI
	c3leHBP9qsjysi50KK/uagtrr3ToRXo0vkQ6efXmG/x4Q4mdKLOOaI/49lny+7wbkRi8EsmHKbT
	wADwyC8mc554DgNOx0ZuZVn8Uey6cG/5gvqKSUhAAxWKNH4n/P2/yuI01frBjCBngTA1gjS5etR
	g+hkCQGRHEvoId6Y9Rk+P/rtlpcILtmbHvuyo7LlNViZ2dkT9JmvQ7vG23QZiLc4lYBOIuaCQxK
	w+z61CdpLSOoha+B52GRqMXxN5rzV1nRr7CudXutCU
X-Received: by 2002:a17:90b:528d:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3ae897cca27mr177789a91.18.1793309431809;
        Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm2758470a91.3.2026.10.29.14.30.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso236100485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309431; x=1793914231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=;
        b=MFuyOLLM5SusVpE2u3jHtsYFE3m5WEmd7nis/oGKhpairQ6BYWxwLQFReEAXhWsfpF
         5EpTwEPoQ0cj+gGPRuRYATyaHugy7oadjqS16/Ab/w+8VILlPmFMMS27sAZxjl8GVU5a
         3/KtnhxEJTOYYzbog4eYxgQfrfAgCtlZm1VMw=
X-Forwarded-Encrypted: i=1; AKwUvBxinSf2w1Q+7d4ut6h6vtwA5oZyRu19FY8FbO7x4esru08XqCZCU3dAvMO20vrRdApgTPckHDZFgWUNjyE=@vger.kernel.org
X-Received: by 2002:a05:620a:2805:b0:93f:31f0:6a88 with SMTP id af79cd13be357-944217e9062mr80859485a.65.1793309430677;
        Thu, 29 Oct 2026 14:30:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2805:b0:93f:31f0:6a88 with SMTP id af79cd13be357-944217e9062mr80854485a.65.1793309430072;
        Thu, 29 Oct 2026 14:30:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944210e6a20sm47317085a.4.2026.10.29.14.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:30:29 -0700 (PDT)
Message-ID: <441fb026-c377-4327-9478-b5ff6b16ea15@broadcom.com>
Date: Thu, 29 Oct 2026 14:30:26 -0700
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
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
To: Eugen Hristev <ehristev@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
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
In-Reply-To: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/16/26 05:18, 'Eugen Hristev' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Limit each iProc MSI parent IRQ to 16 event-queue entries.
> 
> A continuously fed queue could otherwise keep the chained handler running
> and starve other work. The budget still drains pending events and lets the
> next parent interrupt continue processing, improving fairness and bounding
> interrupt-handler latency.
> 
> Without this starvation avoidance, one CPU can stall indefinitely
> in the loop and not serve other interrupts, timers, etc.
> 
> While testing it with an Ethernet NIC,  when too many MSI interrupts
> come in, CPU might get starved:
> 
> Connecting to host 192.168.30.1, port 5201
> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
> 
> With this bounded approach, IRQ handler will complete and continue
> to serve MSI events on the next handler invocation.
> 
> Assisted-by: Github Copilot
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
