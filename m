Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB9502D4C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664984; cv=none; b=rGZylbs5BxqMp0p/W4tRdjv6bfaT+AKG/JqXnR7NnH+vNIXUHeWi5YlWyegI+F1LHo8MO+0HkMhw4KhWAkI7HywRpnbnIoTMVMSD1Zw8CEkuomAxS+OzlQxqPGOPeAB9NlylocZPQy4CuXDzlKEK0SQE9ZXgxCm43LCZiXhXJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664984; c=relaxed/simple;
	bh=iERYCGZnUZkW2UKFoxm1TNZ+omkMIA/wVgi32lNR6UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsxx3NLiAvy/1DxmAgH1BlI8gyYngDe5qWhpcvIDX03bQFlylMtuFsB4nvCAPqyFatsKzLqrd4znvwy28WAlFR5gjRe2mkqyw+qYt83jbLHud/fCsFcbqos/In4GXaK0PACZ2EJd9BaSfJXtecK+ych1mZiGvKUvJ9NnfJaVD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b1tq5QHR; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b1tq5QHR"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7f5a781972fso277972a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664982; x=1790269782;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6ZBcYFlUWh2QD/UxUu1L+haLQxP28ejhx5/K8jLq5F0=;
        b=w0JBVmN0dcXBWZdbQclc/yKM9lIQ1mlBsHAtamRVeZtxBR+TidmtAlL27I5/btbDGF
         KHdRaNYlAQwFYiiG9pZkmU9sQBGkGWKgg43KY5yp/t84kQmAM64Txv9VDetOrw9YUZgx
         Pz8jjynHXgsDLjUZbrTa2W2Qw4xckKVGLzgZk5NdVHiwW+cM4XE5TJTO7Iq33IhgdVS7
         oyxb5CmaWj8ADe3vac2koe6Liiy5mABooM4aijXjIgKJ3qFc8jM4qf/Cnzt04riielct
         lmdlXrgyT3PaRFTP5M3EMeuD98DFxrRcNIlN/KpI5QCGFflBqfGhkSMGjzFIJ8fjQJVf
         CJ8g==
X-Forwarded-Encrypted: i=1; AKwUvBySP2EaYHMrC3DJSPURdb/pmohMg40CtUHEA42IuY29SmGu597wcPgT99Fk+papP21lLwM6GLUwTeogk0w=@vger.kernel.org
X-Gm-Message-State: AFuF++kfsE9MdDZ/qX1MPQ2M3QMQ2wwqNmAjcfnR9ADCdtKdHZ5wzHg2
	lUIDKTHP9/CCBrb7KKB/YZyiG5A0DzR1t5mgFrXDqqvs3ZVEUCWqewhkOrbPipPm3rjCQlZETfK
	7EqEgTmysC+X7jbmOyzO0iyTP++chFWnVjnCW785ClMw4Ab3Iw1wRhfPF4SYzzqSXdqdnlWMuFq
	6g6SX7YDrDHYYlIbWoDx/W9YpG6RCJWroJzoIEBQn0+za0IHSxuenVi1TWlZonmZafxtjM483tV
	Dt5akooCJwhN+PwbM5TKn1Y
X-Gm-Gg: AYBFou3C6hv9coxWEEx2fuzXnbwuKd1v53NqD+oKcp2b/6sQHEgayfbK9lShuS8d7xx
	+rJqePH8l4sJvTk2HqJgRb9Azmdtc9ZaBLMFmQ6xj79NqPfkK+94ovL2lQuezy91sWSGiQgLCTv
	eeOq3phySoAiZe6hj61rSzE3srEgYTYVFrFjj7AukYV1NOHTtdzWQBvJONiZIP0C0NS88pDb7tn
	s/HgBVp6b8a3YNHu9szYVLCI38jxH/M9SBTqYbMcmSAlqFwzQKOA3HcNueCmkPcAyoQELP2bnyg
	imsSxXv9WiGDVGcUUPyAnSFGjcb0y85srQod/iqjgwpFV+WwrizcnnwokCFxNBmYYl5mORp6Fxv
	nUkOaJE6Vrpn8VB/eTQNL0LAod1dqqsbp/CT7JAn7XM/0pC+HEYF6yqGAZYV9A1/dfEdcFDH3s+
	uplMh4rAiEJwf386oiYFT69/Qkx/xtrI/R1+vDRn/F
X-Received: by 2002:a05:6830:2705:b0:80c:d34f:5f63 with SMTP id 46e09a7af769-80cd34f61e7mr2610024a34.28.1789664982085;
        Thu, 17 Sep 2026 10:09:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c43e5d5e1sm1800032a34.1.2026.09.17.10.09.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:09:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso244039685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664981; x=1790269781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZBcYFlUWh2QD/UxUu1L+haLQxP28ejhx5/K8jLq5F0=;
        b=b1tq5QHRuV3j//BzmwBtVIWmsqpeLM/4pI1wVMmxhx4cO8v01oxAxS7IR+ol6mNHDr
         ueQqWdPnbkeSsVhVMLYIfqyCqhrFstpSC4gZ3UndnK5d0GBxp7Vdc+adpdw7JuklCCPz
         tqbTj4lRdVy0FMDWQ0qK+hYelomDzBWVhGqyY=
X-Forwarded-Encrypted: i=1; AKwUvBzX/Iy283zUWjodpcobhzgy6MCTK5OnoGFo5NVI6eKKpuk8ENqD464LzxNE8PJnASqfATPBtPLpq4LbUco=@vger.kernel.org
X-Received: by 2002:a05:620a:a18d:10b0:93b:b849:d11e with SMTP id af79cd13be357-93bb849d318mr1128742985a.49.1789664981304;
        Thu, 17 Sep 2026 10:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:a18d:10b0:93b:b849:d11e with SMTP id af79cd13be357-93bb849d318mr1128738285a.49.1789664980874;
        Thu, 17 Sep 2026 10:09:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc7ce2sm2236776d6.34.2026.09.17.10.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:09:40 -0700 (PDT)
Message-ID: <34743ec6-9f95-4be3-b941-a1873beea3ee@broadcom.com>
Date: Thu, 17 Sep 2026 10:09:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] PCI: brcmstb: Split up complicated function into
 two variants
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
 <20260911233541.1650895-14-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-14-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> The function brcm_pcie_get_inbound_wins() is abstruse.  Most of
> its code is used exclusively by older chips, where the PCIe HW employed a
> baroque internal inbound window mapping scheme which was an artifact for
> when the PCIe would be configured as an endpoint.
> 
> Create two variants of this function, one for the newer chips and one for
> the older chips, and assign them using the config_data structures.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
