Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522160;
	b=No1QlHbHXA/WQv20bYRafG6AL/Wl6ybktKZVPxQA8syDWcg5V9VuC8k418ho/Xy/sNTX
	 k4CTEMzha+R9TjtJet1z0rxaydWSa5mAe7kfsu1v0bPt5hjB3iPN8Pug7aPswUc5orlMJ
	 QU5WWzV1zftF5VNqNFcmWQzLKDNbnkbPvmb6lyb3ygC5AdIJHhuJDm2E3UG0EHCnIXkLe
	 g7h4vnc9c4ulTB+v7thYmytt2oVxzHGqpWHnp1F1Qo4PeRooi5hrHaHgmyGM2XDSkpK0/
	 3BeakyPYspGa8Jh767y4RsgA47QCXiafkSrSuUNiz0h07IcI2ZBgW2jM20+Hfw9Cu1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522160;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=+q1vn1hShkCKGydXxe5nU9m/qd7sW0I7os6nazrrI7E=;
	b=VAsH3ZlUwiO86+K1ZTa7XGG/Gg29UvMpZy1y/8asi2TNV0fGJuXHmgwASO76HDj8CD+x
	 4Kp0iqhZ64deCEsMyoqhfu3jUntgj/hBO05hMwwcqrdq826FMpQP3qe83h+IySQkKz8MJ
	 nBn76xm+xgawSlRiXXX0EkZPMt5/DSHcrGqFR3nwmeevVIjp/fOwYLI42ORhO0nYFimi0
	 bnuKeJaOff7t9yiGwOiiMcg/5IJDPOtSskqzXGQaBTOb7G4bKBelfSoN2IWToCSAYxtMv
	 vVj+Ynd21GsSyhwBd84tgfo0uB1gE42X+HsQT2/Zl56BQeC8WXk/TQjHMqcT3KeX7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aqax2RMd;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11355606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11355606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aqax2RMd
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-5365d26ccbdso1407421cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522158; x=1795126958;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+q1vn1hShkCKGydXxe5nU9m/qd7sW0I7os6nazrrI7E=;
        b=hb9VmWZVbWhDK6WxPOsUuP6uT48sYHyKErb2x2eVO3Erc583FafrNfCndGDpeKUPFZ
         qIuw6KcPZiKXA1Q+7lwG8JdiiG5mW7zVO6fLMStBfwbwubvgPK6tnI8imoMvMaDloEg+
         gjLUdSZD9cIInHhmACGTtt6SXJe3rQ+XrVBn2GdgmiiwyBklCyDBCRv+UnEnNTwjhcMV
         ddbfZrbFYABPuQs5WJJI6KDcEeaUCr1UmdKHkbE7gBlfGaRsq61KMNATtrYGh/RpiVs1
         OvmPbWCqOEeshFb5QINBs92ZQ2iUjYjP390NGnrmX1/2g8hdKYIiovM2f4suuX0BDpPx
         kAoQ==
X-Forwarded-Encrypted: i=1; AL+hErGyj2ZvzCgsDUZm9LoXYoy/prULkCqnrMabDn7MbsaS1yMo8Md/hEnW3mX86PbcjQHX1hvQA3DQLZONPh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vr0rBSnWrWS7zQWMutq/LCvjnh3nNO0bWRqNQTSsLloDNHJ7D
	yjD+TT6RUNbS4GHKFhg/9NxS8Zt8GFbTFeTt2ehujp1brIo0rAyWx5zbvmuRfgETNpvdYUpt695
	cc+bNpBhqSyGPTNeG9H6z0gBa+RtmV5VRZMQdsAC/bw88T0YCqsafwm7utMV4dtosLnTh3RGD2d
	+JOViVi5aviKSfbyfj9P94MXsBeFssH14wvja6NlfH+T1nkyFRyIT1PU1w1K8j0/NFTLqII+Iqk
	YdECsNErHPnJiRHaORsx6I/
X-Gm-Gg: AYBFou3pY2Fo5/0kaXXr7WdvxtBy/asIK2/kPKXOsWJxp1e24FMXpOAhhE8LZ2xELqf
	zbYcXmTHJdCVXVheofNXMtn2HR03iW3eTvrALYmGVNYDTW65tOr68uLIsRUf9oZa1ixQML2XQ+3
	GZrv3nwvMEur6buKyotz+ilvwWkgRl760jNFMCtmVEFjIjOq7H9iBJEZUeleU5swQZSXjvieWZK
	sy91nL0uU36D3k8gBv37av8uFOpxReV6EFl5w62EIENSMhqUG73Hg8SCDLoagKhPzUVPP1CmEfg
	i0mvF8hns/WBIFeWFkh6966bzqG/wqmzKaSYaSUMOwTjOOIwJ6ZrJ3JM62veIQVwXk916Beyge8
	69MTzD+mMEp8ezgAxwe9NZi5+3DSGofqudM8ralrfqqsIHcLOjOinJb9cIBEVZFSbmB0DuicWH6
	WhmH1MKJxOdYmA6hiPCzeD+yws3aWQl+e8/psMr8dr
X-Received: by 2002:ac8:59d5:0:b0:536:72b4:b84a with SMTP id d75a77b69052e-55ac7e507f4mr14352851cf.42.1794522157731;
        Thu, 12 Nov 2026 14:22:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91f23d532dasm211516d6.17.2026.11.12.14.22.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:22:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so378993eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794522156; x=1795126956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q1vn1hShkCKGydXxe5nU9m/qd7sW0I7os6nazrrI7E=;
        b=aqax2RMdzVDdPWUbIcapkUmgBGc08arZbBnXRMz2/Xo0P4vK0FNKEfdYu+JcGrh7RC
         Kj3eKwSuyw/IvHY1cG3i3NCQsMyM2ock80T9T8G/tbSojdroPIQaIhOvOsX/Haqpnr3u
         6R+QLIuj2iMNdT6YqCxsEHBvuQVRsETiuM4IE=
X-Forwarded-Encrypted: i=1; AL+hErGVW1adQW1DUOMYyBF4GV5iMRZh/+pH5KfXRGBWmG307jbkm76BcEDmq8awSIQqgwwDubHMEisLaYVXQYk=@vger.kernel.org
X-Received: by 2002:a05:693c:66d3:20b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37966e3afa3mr453945eec.26.1794522156239;
        Thu, 12 Nov 2026 14:22:36 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37966e3afa3mr453922eec.26.1794522155473;
        Thu, 12 Nov 2026 14:22:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm2846867eec.21.2026.11.12.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:22:34 -0800 (PST)
Message-ID: <15a83cef-3549-40a0-a8cb-0bb9234276f1@broadcom.com>
Date: Thu, 12 Nov 2026 14:22:33 -0800
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
Subject: Re: [PATCH net v2 3/6] net: bcm4908_enet: release the TX ring on stop
To: Kordian Chmielewski <kudzo51@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, bcm-kernel-feedback-list@broadcom.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261112195051.597102-1-kudzo51@gmail.com>
 <20261112195051.597102-4-kudzo51@gmail.com>
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
In-Reply-To: <20261112195051.597102-4-kudzo51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 11:50, Kordian Chmielewski wrote:
> bcm4908_enet_stop() disables the TX DMA but leaves the ring as it is:
> the skbs that poll_tx() has not freed yet stay mapped and are never
> freed, and the descriptors the DMA has not sent yet keep
> DMA_CTL_STATUS_OWN. The skbs, the socket memory they hold and their
> mappings leak. The next open starts the indexes from 0 again over
> those descriptors, so the DMA may send stale frames from before the
> stop, and if the first descriptor still has OWN, start_xmit() stops
> the queue before it enables the DMA, with nothing left to wake it.
> 
> Wait for the TX DMA channel to stop, as is already done for RX, then
> unmap and free the skbs between read_idx and write_idx, and clear the
> TX descriptors when the ring is initialised. A descriptor that
> start_xmit() is about to use then never carries OWN, so drop the check
> that stopped the queue on one. The RX helper's timeout warning said
> TX; make it say RX.
> 
> Found by reading the code; I have not seen these on the hardware.
> 
> Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
