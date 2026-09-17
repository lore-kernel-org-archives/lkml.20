Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD623D7DF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603321; cv=none; b=rrGbcaxMp5PP2ntjLSgcp8jhQmPiqez4UtMLtv75OvdHOJpBk8jIzsWrI3tMoVHcLtXadZwXZ1fGJQqygCb08wLENQ7ks4zY2DDT2wtVxWumGP1ypYPclNG4ymPNnlzHLGCwNOD0SzTBhBxxekp+lqdRxfLWG0T42WmSmGajI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603321; c=relaxed/simple;
	bh=PaYeIeJNkwqQArq4jZQh28blkZiGmBp2NdxGhuzFrwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcOQTbGNLHtzuVgdnU3jSh8q59ETduGjVSI++TXtGQ1NOF5Jlqjl+2sIzsQuPa+kZt0kYrHv82P84u9koFS62Przi1rWIta72Vpd55pK7thE6NqNRhvkZ+alb01md3GL1ijvra/kYBAG8b4rO7qCx9TZm60E4+N/bC/DQg1rjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PjrBlq1E; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PjrBlq1E"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so100496e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603311; x=1790208111;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QRPSaO5+XQixGFbnKMRKXwxYFIVhldNMoYMkzm/WB5M=;
        b=UxlcRGIRLE4L9oXGdg5iZ+rQZWFIBUHNo9q22yCe1bgje5St4YM2vIHfv7ObZcJbw7
         L99enahocUEZ8HwUJU/EaHW+zqAINY/v8OaHK+qc1xDhgbxXXhg8PtFQYoBFAt5tz0U9
         eVDP/kKE34ss6ZwFc5G8mJzQgTAPkji0sqzXWPMPKe29S5u5AmdsrGmDpvXYj3U0KuPX
         BjKxwDO/ZpLOMmwxXYe22+vm714vJz1FyIX6VzZw9VXRr0p4CbVJm0Wifqb/lV9vIGKn
         OZQz8i8rNhInS4DNxiBV/AcnGPLLK8ZBQWdjLrDlSYE0PuiFFrza189YCkxFW1AIQhwm
         POfg==
X-Forwarded-Encrypted: i=1; AKwUvBxQD1Hj3hghnX7v8eh8f4Q8h7D+sumMg4V9EYTKvsBHDR9jxWiUqcPiC4IV45z1CsDlw+j16FfTIwMzbxA=@vger.kernel.org
X-Gm-Message-State: AFuF++kidKNLce8YX8D9eKhYnZp8BKnjT88nOfRHoRY5P1ACFiFMXskw
	ZQoFOKNNUsi79yw8nRKVBwNNzVt0PFPJ9W2FxLGElbI7QW9KoRYuOL3TQ3Oor3f4FZpDU0XmGJ0
	5HLkA/7c3MOJeF0m0n2kbSu/btWyYafcW2gMhN0KGoh451Nhvj/rCZXZce8rfjizt0loFKH8NNG
	Mb8LTfpAOrhpzKMrsWekavuTqmatc5azdYFbOw3K8uIDUaTij6WHRH9PUFHbI6EVZILg7Otc7I/
	nIdRiUCZCodfI5BsW1SVbkz
X-Gm-Gg: AYBFou3Ayo2pnKKHnosOkJjKt7bn7woxKvRJmcDnk+xjFIk23ezViW/SIFL01A4KGeY
	gmuDuNJNNLsBYdeNuUt1thvvaK7QHY2v4FzPlOnVPwih10JrMAICqiuwg7Q0beVKQxyszWsOE8t
	tG+TAKioScdkjx2yhLGvuZNps/YurmbbYf0wahL0KMOxWOQ2ET/uXwpMAGHdQeEVyA8vDbfhXt3
	aPK+325wkf3XdyiMrj05bK9zKF+ZKz25yVsIGUOAOulV7Ci7uycvw3SK7amKDzM3pmvEVjgOtsf
	anOXjgj3L7sZkfbD9puwiBeucG9EkozX0ENcPxqZnTi7ub448o+s6ZSxc53RZ+ReR/o1JecFvGb
	B+2re16oj+rX+29euVGXj7p6jGXGAGet/X1kEuxfkYQLH/06vf4EkXVhBI5A0tyC+Z+Um9HDWHV
	p9QxLV+N2CItAtgUasFAutAP8c35EhTLF/l+KW+r7u
X-Received: by 2002:a05:6122:130b:b0:5c7:ebed:1018 with SMTP id 71dfb90a1353d-5c9a62d7672mr463986e0c.8.1789603307336;
        Wed, 16 Sep 2026 17:01:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-983235378e2sm384700241.8.2026.09.16.17.01.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e5de5a23cso524786b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603306; x=1790208106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRPSaO5+XQixGFbnKMRKXwxYFIVhldNMoYMkzm/WB5M=;
        b=PjrBlq1EHVnKqUyQR/uypr9P5EtG3u5U84nGlJjzIn8uZnA1DJX9UVLAF1CCnGGhE3
         u9l9tTV6iV+rV4BoMpnuIBoE/QHgmr1OSsZo7/xf2Ol3c6MEgRUUFLRCE3a8LH2LEPhb
         o2UC3NEJrmJ8vKOt67xZvZu3IwxUTqBwnVw5w=
X-Forwarded-Encrypted: i=1; AKwUvByBfIAlDEfclCDWAsagRkrgyOwoQEnYgTsM12Jk9R5BYvIQkkzKEPi13fR6fD3tT+GWcEQuPEWMMwZpvs0=@vger.kernel.org
X-Received: by 2002:a05:6820:1c86:b0:6b3:b9d1:f629 with SMTP id 006d021491bc7-6c7d46e699amr6935914eaf.31.1789603306456;
        Wed, 16 Sep 2026 17:01:46 -0700 (PDT)
X-Received: by 2002:a05:6820:1c86:b0:6b3:b9d1:f629 with SMTP id 006d021491bc7-6c7d46e699amr6935845eaf.31.1789603305914;
        Wed, 16 Sep 2026 17:01:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21269531eec.23.2026.09.16.17.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:45 -0700 (PDT)
Message-ID: <5c9e48d7-7f6e-44d3-bf0d-e23df1329621@broadcom.com>
Date: Wed, 16 Sep 2026 17:01:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] PCI: brcmstb: Declare and assign quirk
 OB_WIN_MAXSZ_128MB
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
 <20260911233541.1650895-6-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-6-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Even though only BMIPs chips have this quirk, it is more uniform and
> readable to define this specific quirk where each outbound window is must
> be <= SZ_128M.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
