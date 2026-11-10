Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332960;
	b=pg8xnI93udQYztJR2gZMhgdPYyQPKDYB/Sw5/r8f7FjDStRfqY98eE2L0V+IuqRbQi8I
	 QiibuMPybzL879KKrQEdDM0XMWaLZsYqn+pLaQVZziOEip1uQ8ly4eWHZKzgtVqXzmLeb
	 /R677s+1gd+jW9Dlb+oxxMgs1Yr/C4h37ScLn//5j1iEEwjnHqLv1W1U9ZytTy0KztiNx
	 ySB7+bLMQLCYtsCeUfZLNFz+bsPSkvbe7zX7CXp9kHNXvhVISLpStjjxgranTyA5gfQC2
	 2YvPvwmhDVa6w/Iv/5xekEWwcLcvYocOnILc90uZmIozhjvOcOPm0TVhuYALoCfB5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332960;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
	b=Qjec+FO0eNoim/RUZgK0DxA4pziVMpRLQ23TWAOxMgSS2J2aPcYeJ4FEGDBZcsDmA61i
	 IFUT0YWBSGODDV1m6/Z+ucK3IGIZaglXRVepk+euwChHVz35psA9SBMZfHRHiDTlFhSMC
	 Weinms74G9Rc2hS0JzaYQ7YHMX3La4Wqo3CCqVxfcVeWI1ZT9ERzzouH+TCpaEQ6v9xI/
	 daX3BR0jG9odpbuEiXMB4t/QqfBAau6AlaN2yGGvD7ML16ciOwuCCf5Wuc56MTmLQ2TMJ
	 VmRPqQhfmxv9bMHdFi+lveklLhzS73JZxmNXh7AM7DPM3hHEO2jNymBqc2l5kheCjMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GVNhda7C;
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97809606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97809606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GVNhda7C
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8b904d10882so1051331b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332959; x=1794937759;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=j9JUaPcOkMAhsiohwqDokNX/Vp1ZgAvBNZXgtuspbYuR3Ka4Kmkm/ztj0qCTaidXR+
         2bg3kemQ9yrlkie0j69sUuRqLlZibGvpllxyFD0XY8ahTi/N7A3M3Ab2bVBZNVdw6mP0
         Qkap6rBGdY43cTCM037E74M0EGBwBiO9O5pM4yVGbibEtUP4BV1IU5x982lMNKGgm/nv
         eHClNmO9V5giyktqYerhLwAhTU77CkcWVXCpG26fgasiDOULAcJRVKYgo2vxPtJ4Ynfn
         oOaYklLkHV5mKy16p/Z51zld0lSwlHf0OF51jfMxkB/Rt3r9xaG1//eQ23XFTAJqqFaH
         rmbA==
X-Forwarded-Encrypted: i=1; AL+hErGPbohe+atsakg2prZJK6pvoyIijpjFeajNJYGy+70mKU+bcg+4rc/o10evX4JbO766CfaPFf8z1tboSN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dX3hNyeEVq5iYEU6DgJOrCw1jRZQp5gETXQiAfqPqHQDleR6I
	OFdu/8Nqs5LHcTVQDaD4kWuLN+s5rUoGJTC23kHaWvcgDOeVxmdhJrkGPsn0SgendgC1Egyu4AF
	CyAw0zWQndzuibm4aJyRk4o16kv4qHXg/tGVzvTitGy/Yluxz6Aunj29zfIfvzBt/rC+gPNUypz
	xi2SPMUBOVZ76rSBLmniIdt/VsraE3cNsI5JqeFsi2ckr+kPtlFVZlvluq6/Y81CgRcwCi+Teu7
	3IcWiv3I0s5RUs4tnl9QA18
X-Gm-Gg: AYBFou0Gy2MknyP+C0Jzg5pcZlL72FSdzxKXR7dMJOLREM/7KgHwjYnyD9UEkTXbqNk
	JoN5AFFH3s8x1jQ7U4uwlugHaCfLRxeP8iyV6gMxnbD9dDvY3HMddVlSuGdwvUP6Nmz1DgyNv9e
	bRzDTVwwWl3fP/uDgfpVqS6ywOGvLhCl+wKvlHIxqDp2zfC4MiwFxvGZ25PaqKFIrOCRYu8yCi+
	/XFad62cUcvsb2uHymQWnVW/S/w/Xh+g0sQ2vLWCGJeoEjMBt0/SdiN5NV8tm24jIiFE5ZdYvYc
	yKp/a8BK6cHxyo+Q9mbj9+8LAHMiolD3B79de4zhrKgu5BXoDPHbTNtiJXZBaTerFx8szqgeMly
	ay+iIZUm7VlO+bEweD6Kc3/1l4PZ+7p5cvk5VR/M3yj8mdhwxb1IdPo9ltyRITW4ukmAWDl2ZNl
	/7v5TEhKRnu5PL0R5Y4eGhgeBX4vYJppQs4HsmdKIQ
X-Received: by 2002:a05:6a20:918f:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3f18c10ea44mr3280850637.2.1794332958643;
        Tue, 10 Nov 2026 09:49:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdd8d7dc4edsm49386a12.22.2026.11.10.09.49.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:49:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so428961885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332957; x=1794937757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=GVNhda7CAiMwAv00BBMzzxnblKgzcPGvIMQtYcaZ0phzuKSk1RX0XGbsAWMs7vmqfN
         1FOhvyrNZF6LR8s0l4OAjgwaZgNMLl1Mor66GMn5nACANlUKPdEZahMVmU7D9SdGz2AW
         pATmGLgaapznmy6Qm6fbj4E4JufWGXO5A/UkQ=
X-Forwarded-Encrypted: i=1; AL+hErEuOV2M309vgaoQBA+b/qGABwyBuwZn5dBZH2DEuWlwSdljngnFbe2WCVczciFbzDlZoP/ZpCWRv3dVSQw=@vger.kernel.org
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537591085a.47.1794332957020;
        Tue, 10 Nov 2026 09:49:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537587785a.47.1794332956564;
        Tue, 10 Nov 2026 09:49:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm277453885a.37.2026.11.10.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:49:15 -0800 (PST)
Message-ID: <d18fe81c-8762-4886-b3d8-d2b7d9898ed0@broadcom.com>
Date: Tue, 10 Nov 2026 09:49:13 -0800
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
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Bell <jonathan@raspberrypi.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/5/26 23:06, Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Similar thing to patch #2, this should have:

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
