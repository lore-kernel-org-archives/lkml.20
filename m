Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510814;
	b=FwvFrqpuboxiNXd5hP+502SgGdkj7ob7IJy9pcpYo3chJqOcJ7FY88ILg5N77240JZz2
	 8S/m4n7dvE2mLGzTQFYsNh9iKjhWfYHfoztgo8BXx2MRrg7HmLLJ93ukCn1AA+mNjboIn
	 63eMDAxi0eBxO84PibKT2LDT8s+JjruCMckuc4PDiUi5cWSLxOmE2xwAV0zkqHDhxp8Xf
	 Pvnyin1vKtDKFdsBIVcgRowAUD7WsjT10pJOgJdNnWdTarYOhgfx0M+qXJSQHS1ymZmxa
	 HgepYa7FgyJiXI2xmTLWtXe5CQQMMh430xUlvhAVhJPFEIjkYTKODqzUQeClhOMruZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510814;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
	b=Crvx99Wv8ufGQDBjykSoFj+WWtvVWZuhhWcwE4n3I5CV0C+p0K+xcyg2zLDr1Z65bFFB
	 iwNaK6LIrRc7+uCHV0qWvJShN1UZP3gkp7d4ouvKt93g7bdaE0Ef7mGR+1vldNyyIZMkW
	 Bxl1Q5/XjGXUDPMZHWNWr98clwGjI5WXHXcT8vz7jdYaZ41bFo6CeiWTuUpaf1/5zpgvR
	 nERtLnjgzf9UTyCr3ZWp3EE9PY9M7HkqobzlNEtO7tICYWCPXOUufWUD8EEPPQ84lxZKg
	 x984AO4qQUz5cR9GgBiVrzPJfMGOJW+Cs3fkfubUSqrHU+QQ7L/EZ3qBRz6B4lnbfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B9606A337
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3B9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93c5b7f5bfaso83691285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510813; x=1793115613;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=d/lTkTI8lVAXW7TH2e3ZfjAuBT5ijrgHHCJ34q+p54UfId2chxzykmq0po/z1pT3mp
         7kVMjM+KZ/4Ixlp/ey20QY8G1VFVhPCUPibHyF1oVTLwqAvAOj5AQfLXqunkRGCjfTXr
         1x+zEeCWLG2k+dxWrMvQrdDjgZWrFX9NrnU6p+KzBTfJNhQ1EzbXvq38SJxV4hIZkLhn
         JyeR8yqnuGMc4aaB51zI1tE1bRIn91wMuaGCWeYo5Qu9BcesI21bc19VoNxzv0A1wBBm
         5TGPtvKfnlHKa6hNJcK1ZOIrd/DU2xE35UVXOZ7whjC4eQjTbxBUEQFA2twcm1Al7MmS
         EJag==
X-Forwarded-Encrypted: i=1; AKwUvBzm6Ubes1s5GcpQ3n9Ee1ouxQzr2MtkXxl0NPVyfgOeh/lHHj2cKrKbzc5oe9Fwh2XVOU9/n43QXxkfd2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQyDM9eYGWOlBQhzHYvPH58P3OIWlVtMmDcS8d7B6yJNjYJjk8
	iuzcIPljxNKLzPNyrX3lIg/+1kFbdnutFPUMGl/lU7Q5AVP1vNPaY706R6qzUOhnW42/6CxY4NP
	eNlVVAiEegP5Pv3DvzMxbFgn3u9K846Sej3MGsQRbJp9GlkMChy9r9tnRD5Z/jdHXCvRLKo715B
	g6BeEDl9W0F1Q3fI9vzWpMRqJ4EUl7oP+TiJI0ruo1MILuTgFM4WNI8OcFYqskgL2uL7G4bFAYN
	UOzsgkxl8RDUq3Mwd9LNbXz
X-Gm-Gg: AYBFou1um0stE/s12mje6oHy31v9QfGrK9hY1mer1mZ5AVf776TuRIimSecztBzrBCo
	t0PFnElStCdcVaZhogQ8rCgb0qVPva2GDqr6h0/0lAADSU2VRAujkzk+ftAxC6rc2TBI83hYsD2
	U/tNnuEMOksaiJj73fRZ1lnL1/1wFBF+5e/8/QdU2IUSEGYOAGzjg/21KqmzdYjf2VZpQjGckBZ
	beRODT2TjRfRybyGCR4N6xbj0vklVjWF6gqjIgulS8Wio3TCDkqIXvZBx5KeCnvCA5Pp92TvgbP
	zMoVyZO2aMbNHFA5zuA3wU8PvjSnxOdRWMLV1HiRYz14n8qmQw+E8KPycCsREFUo4RiNZrDBn/k
	FKmz/fpCGCVi8MpDMncnCuWCuSiVw/NiH3UeNSLC2/Hk/G8IigbrHd54qcXmP85UT4fu/sZx9OV
	32f+pHY2rPqeVj92ZOgqL6xRH4QXKfRMSuEczI8yc9Ajk=
X-Received: by 2002:a05:620a:618a:b0:939:944b:2814 with SMTP id af79cd13be357-93f4c1fc240mr360801785a.19.1792510812832;
        Tue, 20 Oct 2026 08:40:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f56cd3932sm2079785a.1.2026.10.20.08.40.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so16408906d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510810; x=1793115610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=aah81HL6gRqNXvrP5L7v6k5a+60qbmtQH03lk76ig8ZV9PVTj9aAnIIOxAMiAoXX2r
         Cq5Tca3pH1IhRpKTnSZiQSwfGeoRjVwrV30Wc/+8hlGstmMEsS4s1cUqGQiSjd38qH6N
         wFqdTQEXP10z3j1lhSmZVQLldfCr4BJWVXIP8=
X-Forwarded-Encrypted: i=1; AKwUvBwbixxxD34SOURL0gB7SAAy+h3vdjq6AIgilWBvr586r7ddTq2yzZazXY5YsT7l38TQMAOLBJ0d9O2eRjY=@vger.kernel.org
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774661cf.27.1792510810328;
        Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774211cf.27.1792510809945;
        Tue, 20 Oct 2026 08:40:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5364de4d690sm92439221cf.3.2026.10.20.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:08 -0700 (PDT)
Message-ID: <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:05 -0700
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
