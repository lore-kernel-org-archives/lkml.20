Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07BA3955CA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785634; cv=none; b=Wqu5PMhuPqWbhwT/9CF/Mnc80QO82uvF90ZD/MXkrx22ZN4cpTkwi8f7LE/Q/PbB3wwEaksKIRw41aVwOZwiR5Y/N4VnOOJOaaGq5HDm8206CWOIXPGQHucSp8dGIqaiKOsb7I+kdaoLXH7rZa31KiO1RQHjsJBR63JcK5knpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785634; c=relaxed/simple;
	bh=Cq8W4DBJfQRK4/SOiJmoUruPGW2kPce5PpiN31IZ8gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnGPEXBdlLUmPGw8TPOmwL6rvkT+Ybno1SYP9STilH8dYLYKj2kRfjwB2WjrBnPvVUxWYEvBRTfUJmrdRyPBjkoTeN32m8tWFnHyNJZniQGHbSH+hNt9reOVbRJMI4oLxrcyibD+6/ikVgWVBzDF26Li1vY+XEK4fctap8e747w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DCLM1dKF; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DCLM1dKF"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-854f8068301so148651b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785631; x=1788390431;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q0gJbLAjrAkHetISJ9E7BaKmcamQMw9Vv0f9TbXVRXo=;
        b=KT3bxUHNVz6RjS4bftEFf1SXXIfZwezbY67kMWatBwyVWskHc6ojGBOYHoLuTCehtT
         Z1XwM6KvkFkm8yEtsfFccAm2PGy8HQxI7enOhZ058MmSDuW2r/WPvp1+hzVoKSoCdgCz
         cR0K/Lu+rnQBak78FgC/8/KJG/QFqbJLVYMuC5BQBg6NmrukkMuh7eAx8ziPaRujNunH
         4cjBl3778FdgpormhcPEazK2tO5evGJJU1+mwu0sKMM+2FQT71HOnId/IN3Nprlxfihk
         mznuO/RsdIvHaDuKmIYaKJ44aWC80jbs2C8joq/zYnoZmPF015K9w+5Ltw0kdUSYOBDB
         zVZA==
X-Forwarded-Encrypted: i=1; AHgh+RrFk9cXmIvjtACWbVOg2M0v5l9kmY5HrnFcGzTCaEUjGrlQ3UhvAfeXYUi2vZb4Vhk4cqDsNvxTIPfTTSA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmN7GU9IGvfMnpQkOTr2SHK1epjLY69ia/EJAD3OaT3uDC98kg
	c8diGdiQMktHKJTtg88DhV1YXInBRByUepsir/0q+euPTAeXUTIzuWquj/AsalyMmc9JXyb4jdz
	fa1EMizUvvVNOW/EhoV3s9rLdVB0t0D4Bv3YVm/vxOKnX5itY1NC8uKNoi1UUnIv0KHEW1lavRq
	IV9DWgC1E3Ca10WNKNfvH+kEMqzpJbkgPLjym58JH8nwma2WiizwkbyH2nIYxfGWoDmQ5k3aHMN
	3NnSQSL6mLGw4Llblabq/1q
X-Gm-Gg: AR+sD10s44kBudts+wfGJsZG3pSNo/apVxa4jwjzalSehBwhtc+f66ocw5G3ItRE3ih
	/tl8gAm3kpxaOfRkfYa0iL+LZRky3ECg5ZrmntVJeSh1CRcQLCUzrBlc0Z7hnvTjVPN/ItyfDPO
	Ori0FVl2Te3ADyDBET+n5muxHzZaOV3pnRPYAN8pLzD1A83RzZIQ+ZpUihNK7SOIcp3655Kt6Ob
	CpO1k1FjLg3gIY5kFG/UFQQaQKKN2TJO1ZX0Edte7q41Fe+JNjW6W3dMoa5NOtDw3DAK4mg/Jry
	ZE/OBMn6TAElG1hvUiD8aAO7H/Al1Ozo0dW7QX7wq/Z4DtUfo7abx9wPsAqS2y3/0NsY1IHzPKv
	dJTunxYtkoHSbOuyEciFi7BlQ5HrBQvykHwYOPt/nqyceE63AtZi5Q0k4M86WpfhlSxo+dzIsA5
	1gP5lmX7n1Zq5d3wc49ERxRM86gpgcNjBW8l3nQrXE
X-Received: by 2002:a05:6a00:4fd1:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-85371baa5a1mr17535901b3a.1.1787785630979;
        Wed, 26 Aug 2026 16:07:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8538cbcf1basm1404830b3a.6.2026.08.26.16.07.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so20862045ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787785629; x=1788390429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0gJbLAjrAkHetISJ9E7BaKmcamQMw9Vv0f9TbXVRXo=;
        b=DCLM1dKF+g5X4iHnhDv/tQbDZgwaiD2yLX42LbMulM2P68bj3kbI0t2PXVOXI0Dyce
         Z32mJl2kxCxpbIsu9zFB6mOdpaEozYEK2o7i/hM5HCdcf5M9NlUspt5btuvabpvrvfbK
         cyMg3PkYQOrEcu0EzcQzsMWZ9kgBgKHSYutEI=
X-Forwarded-Encrypted: i=1; AHgh+RqldVmHLB5RZQWkvwAV/pH4Djx8T+XvgR/8AoSigahEUYSZ+iklQ7+QiYuzX1XYkp/dQTDM5Mu/oj0LwWU=@vger.kernel.org
X-Received: by 2002:a17:902:f689:b0:2d6:dfaa:c26a with SMTP id d9443c01a7336-2d707aca9c0mr173277115ad.8.1787785629075;
        Wed, 26 Aug 2026 16:07:09 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:2d6:dfaa:c26a with SMTP id d9443c01a7336-2d707aca9c0mr173276045ad.8.1787785628341;
        Wed, 26 Aug 2026 16:07:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm11957547eec.14.2026.08.26.16.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:07 -0700 (PDT)
Message-ID: <f4b6ab1a-44f1-4e50-ae43-c55b080ab327@broadcom.com>
Date: Wed, 26 Aug 2026 16:07:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to
 DCPU offset
To: Danesh Petigara <danesh.petigara@broadcom.com>, mmayer@broadcom.com,
 krzk@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-2-danesh.petigara@broadcom.com>
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
In-Reply-To: <20260826201500.3000125-2-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/26/26 13:14, Danesh Petigara wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> On API v1/v2 boards, the DCPU coprocessor can steer kernel readl_relaxed()
> and writel_relaxed() to any address within 256 MB of the ioremapped DPFE
> dmem or regs base. The DCPU firmware provides a 28-bit offset which the
> driver adds to the ioremap base without any bounds checking in
> get_msg_ptr().
> 
> This allows a compromised DCPU firmware to trick the host kernel into
> reading or writing arbitrary memory-mapped I/O registers in vmalloc
> space. When combined with a root-writable sysfs file like dpfe_refresh,
> it provides an arbitrary MMIO write primitive. Similarly, world-readable
> sysfs files can be used to leak other devices' register contents.
> 
> Fix this by recording the resource_size() of the dmem and regs ioremaps
> at probe time, and rejecting any offset that, along with the largest
> field accessed (DRAM_VENDOR_ERROR + sizeof(u32)), exceeds the recorded
> mapping size.
> 
> Fixes: fee5f1ef6cf7 ("memory: brcmstb: dpfe: support new way of passing data from the DCPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
