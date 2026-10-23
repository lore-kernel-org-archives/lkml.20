Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775137;
	b=TtlSh30TuwawyR/B7nP2bNE6xFrPCXBKHA732Pt0EsrGMLetVt28/Yzt3C0XfsW+i03q
	 2ePFQNB64lJqeGtHkxYenopg68tq1iuSp2GcrZ+pmulB4HPsXibQw0BmqdG8AzUItvxeX
	 aMHhs4lj1ucZh94ZV5ahdmwIzdjWyv8AYDwEEz7BUvAVsBZa+entXDAyEEG0ebfelUK0u
	 HpR1f/f2F9WR6IoOyZTIZNidl/u6bi0PK0XGQDn1jfGUKUbtEe0j9rnP6Xeq1xt6+wFWP
	 WFMW2K9kdB51a9sIbF4n3ZB9AbjTDmP0RIYqCJuEYTUxHv1a71UY+bRqf7gAISciOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775137;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=;
	b=2ThWinEjzQB60Zo6NWN4bk7nTi0Y5cPSASSrabYoOCBOkFWEAHoKGS26nXoiy+luyyKR
	 SvZolFlzsOT8ZsIV0eA6KW6xyaxd2nxujcK7cT3L8+ytZgdNbIfFI5f4STPoA3ulw60RV
	 FGM1ofsr6GeAORQxsRNJfw0Ce+IwKdD2FGGrqCrj07QBO9HaYPRpfC8zzXqOOF3X2vQ43
	 AfNbmpZKl3Y2/7FLhvckeE54rBhBVWGUXB/ziJNDETKRQ+sJoBOPkzSAToOrOzb2mrv34
	 Rr5/CQ8TIcTYoSe89E7/kBQQBTMqC691Sph4mxxNWDRaRIgXZ/byF5zpMBLXQrcutfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TONotFIc;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C328606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C328606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TONotFIc
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso477025a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775136; x=1793379936;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=;
        b=RSqe+3QtLMRVp0CWumDpkoHXvqES/TGxruSX7PXySNlmnzTPlrZhY7S+f/Vf7YgEm9
         SBOA8j4jfWotbEXRNGYJIbMegcKh1DDWnAJFVnC2U0lnPBKrLaQp4gc+z1Xn9ZtVsulS
         MxP/YTP9/AQur0H0QyM1sDM8XdXOxkRNlVaDahYzpQ4v0crRNo3Kftou8YMcP4H1+vwC
         XVthLoOPYUysws6g4a8CcI/i79c+QimZzAr06mScQsCZmFYpeeCI+qIYAhYxKoDOIqMt
         f74Q1JsEBbwQ9EHypDM76doZhp2VivUVt1kQRfgdvuB13tOspxmTsX9za/6+Dj91jl3O
         JNPw==
X-Forwarded-Encrypted: i=1; AKwUvBwdV0eTVfzRASBC8RWAQq1SX4KX5oPFEh3W0UKXMhPXWiqEOI2eMdZQaa0qw7rNyN89A9TEH2v1EdMOXPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM4gyoVFbUeBRWFfbB2B6c8rD1O0HDm4CGKJCaOEujPLZkNMSp
	nGFCGxhNOi3Rfz4S8hhZOl8jKo6YIiUVjQkTqfNrhyNHWcIzrTA81evw17B/AR8dgjm+yRUFUY1
	D5obE9vF6+okBpuVH520s3a+VSKVKEZ13TgQ+kUv70VixwqIqL9a/3Ty/e7g6Bol/MnRsSRBa6V
	nPVXYBs1OIon8GznQfxcpbRFDEr3eE/xBhEDSz5i7ZXc6UhmOFRkw3hLFtm+UZFpivaHDP2aPmX
	iVhg31P2y5K0DFV3DPilbWVXmI=
X-Gm-Gg: AYBFou1+TpYSdpBisuYIqHt24yDRD2/4BsFiZTqSRlrr81YVcoaLgOYtZqnre0/eQ3W
	8y5CSXIMxqSCsX61ln75d28QFdY5NOCRtW/kuPAD2cPFbOk+ObgmjFWz8d++2coRNMutzIk35W/
	VB/5MUNyKjuS63mxeQNs8kv0iURQML4L/30IDF24fEMFlqnXMnP4rqX6wM02KM1PpxysA2Bh0e2
	rFNnqogd5aLL3OvcDbiKX0uJQlZV0N73OrgQSIlQ/GEJ3WZ+5kLoTpYJq7axUT1J+zfyJATDH7n
	ReajbQtT0//idO2t760jv132BqtMdKLPdM2hdrutD02LedBvtMp5R1N86WdUUHjH1roGot1DsuZ
	joeRjcCSM+0U9qcB2rxDvBMeLMgRkN2dC3AUWN86TbtqkGC18bwL8txeh7tgT8tJljc+Ghz76UH
	g6w61C7VwXEEKGo4qWOAAIwuxvurf5yb7laQr8Jt0zv8M=
X-Received: by 2002:a17:90b:50c7:b0:3ab:ab5a:ef06 with SMTP id 98e67ed59e1d1-3adcdfdb8cfmr2413079a91.12.1792775135800;
        Fri, 23 Oct 2026 10:05:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adde71a4a6sm465167a91.5.2026.10.23.10.05.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:05:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so873571b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792775134; x=1793379934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=;
        b=TONotFIcEsjwC3NGfPbqU7Ok9em+Wu74s0siedit3WQXY6kk0ZwD51vkgDWiHSY1Kg
         1FN8LDserUAkaZcSiUSoP3kAz8ZyVwANuhdjO5yxOmNK4B1NkX2Tb4aCqWEfg/C4hMpo
         xaUJyvcjXOTfWeWx7dB0z1PmTmPmkPPInqoII=
X-Forwarded-Encrypted: i=1; AKwUvByyPjcY5bE3JYmpS/2AZZ7gLC0yrg9b2Pr72Sf/KCcBVOsrSypSIHhEc4dJDkyQabZ/Y+rXyxSY59xEn5A=@vger.kernel.org
X-Received: by 2002:a05:6a00:2e95:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8a2c6279b96mr2405856b3a.8.1792775133726;
        Fri, 23 Oct 2026 10:05:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e95:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8a2c6279b96mr2405838b3a.8.1792775133310;
        Fri, 23 Oct 2026 10:05:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a3395cedc6sm209312b3a.38.2026.10.23.10.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:05:32 -0700 (PDT)
Message-ID: <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>
Date: Fri, 23 Oct 2026 10:05:30 -0700
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
Subject: Re: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING
 post stop_machine()
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-arm-kernel@lists.infradead.org
References: <20261019130856.49711-1-frederic@kernel.org>
 <20261019130856.49711-50-frederic@kernel.org>
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
In-Reply-To: <20261019130856.49711-50-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/19/26 06:08, Frederic Weisbecker wrote:
> Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
> all the teardown callbacks while stopping all CPUs in the system. This
> doesn't mix-up well with running RT or isolated tasks.
> 
> In order to transition smoothly from global stop_machine to finer
> grained synchronization between teardown callbacks and the other CPUs,
> a new stop machine post function has been introduced to be executed
> after the main one with IRQs still disabled while other CPUs can exit
> stop_machine().
> 
> It *looks ok* to disable the cache readahead globally while the other
> CPUs are running.

Yes I think it is safe given that b15_rac_dying_cpu() will run on the 
dying CPU and any CPU that is left will basically re-enable the RAC 
afterwards if necessary in b15_rac_dead_cpu().

The hardware to test this is quite ancient, but if you give me a test 
case to exercise, I can give it a spin.

Thank you Frederic!
-- 
Florian
