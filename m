Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402653F6A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664922; cv=none; b=nyWhUIS5gIWiUMMGawIS1vHQDck3sWmmQU4UM+x7d+wqjGq3BOdvsSRDr2YVJW2oIcyH+9YwHNpcGAB0lXG9gevfhI927jefeebiidscV2Bw04BRmYG+X/nLfbnkL+hl3TVOqD6dDnGedN42pzC8EAm/vAAPF5nvbZKP7r9IYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664922; c=relaxed/simple;
	bh=PNwxqdynuHqgbh1oBopswHECWVn/V9O08XqUZSdJfjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra8QQC3YMIPh9NNGvqi/WfRQcTygoWS5TYJJu0cBArkqtfwc1UYVKGj9PUccFqxWyKx1lvMZGMrCUZse/+36XJKpL+F/NNFVynZqy1K6NVUUwMR0rek0yyeuskCvpBgmIXKcBZeum0DBeywlkzwiIx/vwMlhEaOia/IhNHqD9pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Aj7gc3bN; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Aj7gc3bN"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38e58034d05so158951a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664920; x=1790269720;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JSZebXv4BWY0XMsVIBwkftKe1sIwcAMtAxU1OIXCMMQ=;
        b=wF1q3U4DQb8c/d0R9xLUiuDMdPDYucfIExXHuvsOvrKhGP+Euy7NNQ7XrRY94CZtB0
         G29OM7HlBq/Mo0D8Sb722VvpPOFTFPHQFlIcjXMYHy8Ex5oATw7J9Isfs8c5IP7Yqv14
         rsDbXNoQlxLjtOd9FQV4yU1OQOa3eDlMcOI/J+Iuul9lPdC5ohktegu5xnN2vyOtURU1
         iQuiOaTYU6T+rtXV5BUX5U/zD3yKkYeWf2Esv+72MI7WXFNMiY+1IJ7Pskualt6r0nTS
         clekG60z9/tBzVFB9FZ4tKeN2fuxUORbHGz2afCCqAc3TSUiIHoSz4rL4UT0q9A2+jo9
         JNtw==
X-Forwarded-Encrypted: i=1; AKwUvBy4AkIkqO/gKwvGOuP2E7rCjALXTXc9f4agnxH1ZHnpygmA1+fOQtIVmS1562h66aG5jVfXCk6ULGMWQHY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2fmaeDbltLi1jzrJeckIOuvBm7WmZowY1jWCKi2aqUgVVMFl+
	So7zFb94IrlQqb8joBt6JHprieM+prUtBhbdMAoavPKQXWCaNqgP9RvSup0gsIaNmBBxVF6z2Cl
	z/J2UKdMuphEm6oZee9IbIWIU2r+fvU7HdvEFC/W+lijMK89wie8kYYj0LehrZQ605hH8BH6COu
	uGzjdWH1LITg0+45HgNmZYBCo933LShyrAWJitC0RQS/oOZXer3WTxW56Ykq/S7fDlg3Ge4rPXe
	2y86bnjK8KLWLz9893Dsxr1
X-Gm-Gg: AYBFou1ER4i141tRreI7doaPFQJ2UpwLL4At1vTSxhxcscwa0yetFWFgLnZ5s0kmIU9
	2fiJJLez8EKR8r2NJY+cjywu0RpR98ZR7GOC4M6mW4CTsiFvKPqsCJfZuA5+Sbwe18y9+4Wbk3A
	yweL6MEKgYa9c0gsx+cpwsqJrUc3MJ6coOhAmXkMiabADN+Xdg1y+RTRWPK6TRNh8qD/I5Hj1Ze
	PjwcoyQot1ajM+pDzuEnz+xbsQckl+RuSEJTvRJBuYEX+5nMU9iRpRGKujwdTFP5REEb9tYAF+r
	yWz5pBQlOcKkkxxtgoMXTYAGsV5xHvWsCcowHqTXk3jxVf27iby18cm9K1c3CeAwTKMdAcZ6Lg+
	NFzyUiqm4Y7UWIle9z0YayK98RkmOJntwqrh8jVLc6w8QTmELTBFn1tXuvyib8/OOSM4lw4Wtbk
	tpPqUMzwFwPOfpIpaTD4EnU300mfTB1mxIR3J+oUU6
X-Received: by 2002:a17:90b:2245:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e1e2da776mr21915721a91.7.1789664919993;
        Thu, 17 Sep 2026 10:08:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e45d9d41bsm754383a91.8.2026.09.17.10.08.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:08:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91213a1aa68so15645486d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664919; x=1790269719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZebXv4BWY0XMsVIBwkftKe1sIwcAMtAxU1OIXCMMQ=;
        b=Aj7gc3bN/bA5Gd7HhacK9LhgQiMAFyijO0TDZfdeqZNRNfuAO36W/WrS11dlAZrBku
         YAfC20cKdBKUIB77fqh0Geq4a11Ln6MMpZwwgHRT2FnLb6bywZ51VdQGGvkyEn2/Br+e
         lG8icm9ZkTXWfM0UFhvbe5059SQGTvkyU+b0o=
X-Forwarded-Encrypted: i=1; AKwUvBxHo5pqx9pUwtBmm+RxKY/mKTCBSu7U2LI6UN/4vg1USugiQ09UPY/Xsv/aG8b6X9eiwG6zvyUA8cGPZoc=@vger.kernel.org
X-Received: by 2002:a05:6214:2261:b0:912:517b:856 with SMTP id 6a1803df08f44-912517b0b5dmr22214406d6.58.1789664918562;
        Thu, 17 Sep 2026 10:08:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2261:b0:912:517b:856 with SMTP id 6a1803df08f44-912517b0b5dmr22213186d6.58.1789664917844;
        Thu, 17 Sep 2026 10:08:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cb0b52sm2227776d6.28.2026.09.17.10.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:08:36 -0700 (PDT)
Message-ID: <b8c0c201-ae33-4a0f-a145-0c20836f38a0@broadcom.com>
Date: Thu, 17 Sep 2026 10:08:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR
 window array
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-13-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-13-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> The register names for the inbound BAR registers use order-1 indexing,
> e.g. the first is BAR1.  The code followed this nomenclature by not using
> the 0th element of the inbound array.
> 
> Undo this approach and use order-0 indexing.  Also use a struct pointer
> variable in two functions instead of array indexing.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
