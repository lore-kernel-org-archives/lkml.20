Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291741;
	b=zynzIiYS+3Ux5v/uKY5Um5ZalZ+db/anQdgojZbGJBk9jau9G7wISUTz2So/q4vChxYT
	 u24JApCTnA7qmHynpScKPcpSczlsFqJ/l/nDCFq50EhRZqMGDoujMbEEWXC/AfAO7s65G
	 ohTlw4q7GdthsAlA/FhXLyv/f7P3Vqa8o8MMtF/NJXSy747gNDSo0tX4BqJZKFfGux8u2
	 qA/TyRhVITEKl/BVPbu3vbGG5NCdc8JlqJ7GQht/oJSgyAuBYeglaLZ9LBtmp6PKSjlJR
	 bwIeN1HKXj5xmoU6WT9yXsmZhq3RRqnI5rvu/y070Ny3LInA+368urtfzqXwrwypI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291741;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
	b=oUruwjQ/VsT0JCfP8bJ1SjigcgFGIDDhge5O6duw58zZLb20rrHJNui9u6RlOsOzFJPG
	 b5umeKp+JVoD4VL2trr8lw6XVg+cSo4CRlQF6iH6GJEON20SlWImPQbZVdow1ZueItdsU
	 Ntu0QP5IBkzw0EEAALFl3N8hTdCQ/i6ExGA0hok2uXh4ZzXwQhDbYMPr8X7RxyDiK1LNq
	 PDEz8jsAZrYLV3RXxwVOmOkz7dSxJdNJnMK6Ic+3I5KC9cnu8VC9geb8CKKNqkyPSK/qd
	 r3xq+YpwbvTrGzM7gv4JsX3OzWUNpkyyvuOZvtLTeT01h0YR8foVKrHk28ofM864l2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EqWHs3Ul;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EqWHs3Ul
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1224678a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291740; x=1793896540;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=wxWqO/XC2IzKICyy+6OOKUIkdhN2vgYGn1BMUoIBcNOLckP2jZfbDOPQl3uU/E8NGO
         FAyLcrQU+6yd71uwfGpvOPu2VWXGmimpLKLUH6um142cHqpoNJ21IgwA0OiAitLz8q89
         mAB93gwWOdnEGqQ2Xvw4LPzY/0r7p+4U6Hj+tDrk2rjlvKcGZF/d79gF4C+n58kxMtCV
         SGR6JKiY+GacSfj+Dwb8rE5JIYP5c3yDbsTWn6a6DpEXHibiJ3gEB0x1EyEOno7inY79
         u5u9qiMSFdEJODlbuWiBE70V+s+NwhETBRecOaoBmCs7ycpfLibSBT0y5YQ1gPKvkf0q
         Kueg==
X-Gm-Message-State: AFq9FYK5fBdUbnbjX9/V8RJn43xMOPvDqWlk9EH8nQmgvSUNlFiqKPzm
	6WTI3ewJK0zz4uQcCA6IGLtuZmgbgCvkG9maBFclPgoaYe7fXPnpEMQnfDNs+l+kGZEKeImPnJo
	B5426O+lr9t2dgKNsSo6X7fUHDPFnPYEHn3sRuKTi5QU59ov7D6sYhZnGLmPiR/KdhE7b4dVqxX
	5eV7hUd3sQOvB6Pkrf4hy6NLvaQv4tT4IIAzuSWePcp32JNG5waqrk7tCOYa/kXnXPqGjsKebS9
	zIDC6kzzNh/M5I9IFpxOCvFZs0=
X-Gm-Gg: AYBFou1em4ZjKhlS7pn1ww2pwzS4BsaIq3VyoVaCw3BOrN7m/vKkQom+Qb21hPasUnq
	RaRXXQTjREDUg124am2wIsx33BNI/TVkCJ6G5LhXDsRm6qScUGrL9Fw8gQaXb7guSB7MZnQH75J
	v4XN3qF0ISi2TEpdAMn90jx6QXJl673ZWH+jMavpJxCy3v+jITpf/y49mfDNyrSZQDvK5Gcb+RT
	qNMoSgr/5FAFiZVZ05sMY4ziubJQpDdk4i1ocbTG9nAMEuHUW+jsQ4bg5N7y3InZITqbjlwxBFx
	v/fJJGR9yp6TMsS5StlPl5XhmL5XcQxu8yH0DaGuJQUwtF33eAA+UfYmSfnhk4SBAf6Uf40DzBm
	VdfsMYcLx4cBUxV+ZFe52ZVeSf/gb67PKo+GiyLqj2OJxO1zYU5Xg92VRkjuAP3ANWC7gun+IGd
	7gVp6VQA58Ld5MvnWQ+DXPAAPjO57iEwdnw9GOY5ZE
X-Received: by 2002:a17:90b:270d:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ae581568d2mr4408334a91.42.1793291740446;
        Thu, 29 Oct 2026 09:35:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae845baad9sm203366a91.5.2026.10.29.09.35.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535131e4c25so57825531cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793291739; x=1793896539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=EqWHs3Ul2xbpUC22cUpMT4gGXmtVcon4vWvkcTu2UUSr5w3AAzNumUeSuBdhNZQfOw
         +OEJAfUNBbGNPTphyv/wOKyCddh5hxp1fEz+/URCAxYMYbkl9RBWcD9X8CDw1+boquXU
         GMFmxDC66++3Xj1vt8s/NePmn8IsBiEIumOBk=
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251831cf.33.1793291739294;
        Thu, 29 Oct 2026 09:35:39 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251311cf.33.1793291738724;
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31b46f3sm272576d6.45.2026.10.29.09.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Message-ID: <cb6c4485-90c4-4ea2-8df8-4e1ccf47dbb1@broadcom.com>
Date: Thu, 29 Oct 2026 09:35:32 -0700
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
Subject: Re: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
 <20261026191618.3178830-3-florian.fainelli@broadcom.com>
 <20261029-versed-automatic-orangutan-43cfde@quoll>
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
In-Reply-To: <20261029-versed-automatic-orangutan-43cfde@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 01:09, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 12:16:14PM -0700, Florian Fainelli wrote:
>> Northstar Plus uses the SATA IDM block to enable the interface clock and
>> deassert the core reset before accessing the controller registers.
> 
> And which compatible in the binding is "Northstar Plus"? I tried to map
> them to arm/bcm/brcm,nsp.yaml but nothing is there, so it looks like you
> are making changes without having actual compatible documented. In that
> case this is not needed. Make changes WITH documenting new compatible.

There is an existing compatible defined: brcm,bcm-nsp-ahci. NSP = North 
Star Plus.
-- 
Florian
