Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036195;
	b=PXzYRkxCF7r6S9YjSb8ZvLlKFp4MCLpH5qWTmVzPRFe3iJ2pYkSR3ldC0HRakXnm1USd
	 kgAWfVm5NfD6Ew0qKQlBmht40hGmbIGb2WHThHti2AvB/eo/c44t50M0mX+8d/Pf/yMtT
	 sazyoOLDAL1+7sczP4Mv+mZHOgXyLFtnPIFbeGz6lam89LaOshUstynm2XrH8qv1r7eA2
	 q6VJfSBkxdhyyUZ3Ij3z0074/ysgD1CEKRyy/adTJ78N63fddsQ6UfgRPigVPQS4OnRTn
	 xSwJ4btaiLLMsFhR8nK5ER8rkpYhPGL2xnA9dBStp9EviuIqdjZufIVyfrwSk0nA9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036195;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
	b=OnbJwQ7GDfmYGI0W6N7R2p8LzWZWrHOxV78+4PRV0UNkKA+Gl2vKAsc95Z9cBYKyfekU
	 LT9peiXBQCgd6LSQ32Quh3W4zJgyWyroj0ngP2fbYTN1tpDkFiqWM8uqOlFSwWcKnDXi5
	 57fvIVdT6Nf/SxKcYbM14zxASZjzRub6ImCTxh9EVT1u4TV7O9WA/z6UTWkoYE61wP1wV
	 4f50x4ERq5zkx+QFmvWddu8BM+SkhHD0MV/jm3FkRTu3parko624WKJhk6uDacGRD/Yix
	 Ac4q4OxS70sgq4E+LSjA8Ko8/m9E9e/CSrItFNEtqMjKFqy2n/m8gH+WJnGfisxkZzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YLjIX0aC;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63588606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63588606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YLjIX0aC
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso4994485ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036195; x=1794640995;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=kVZb5BNElYpp6weTUWrVjcs3CdoCIgjT89B+bMxoDgk1CPFb4hz4XD4yUZzuoFWVrP
         MIJ9hjT7TM/Iqi525NhJu/F8fK02piuc0CwSmiAYYN6BcD+CaIpDY4SBr20HIFxmHwld
         Vda8SUMr3iU558P6gjy0ALHtZncJSd1h1Jy1ZhY7fTMk+T9gzdgrg0wXkY3xtXtFv1Oo
         3WROz8CoMJGTDFiG7SgryH9VNgxii+OxHPVxcnNcwbhzlGmqDJMpWQ8UTf1+DpuYHRam
         P5siI/lnYM34FYtG3xHA0MAqpiPMwg9H3R9ku8CZsNygxP3Q3C0oeHDTQIcUKkA8BH4D
         91Ig==
X-Forwarded-Encrypted: i=1; AL+hErHN4/tNiZsS9nPdV5uqh0rJRt49vLffH+r+Oikii94Wo3SVmJExIKv0i1BsiR9353Z/Eq9ddpK0WOqrTt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z88tPlNVaGorYvTlQXNaJ5OWtQ85obHAfnKn8/PHBphEUthSLGR
	V66qQnmXu8cJdOCuIp8xtaNNSYedjnLGl2dlbxXHJroZ1duwc73qtJYm3hd1sCoBBzpqtowRYZC
	daxsYVn96Z9HMO/EuRuGBQN/8lmi1qJopEdNFOdV/E7/xZ+d8Q6NBguyJCTxSJvBvvNl2ra/xp4
	h3KXxRp+qVQvAUVOxPHvBQ23xBXM8m1/wkkDTrogxY37Rn7dQoXKj3QX+3JBXSP8TwbKzvyIHEo
	JI/+KoWxgDCRhuPtimsJXey7g==
X-Gm-Gg: AYBFou0VuTczfFILXHesUfum8uIvfRaWvSMg9Tv3nWCH9GepFphg4FdkGWKVr/9c5cH
	VNBGtV2Qz+YCloAJOxT81bbbypETsMtEav9g/6I2aiM3UUzwsu9aAlifYUpBfOt+UAOoa1OtRxO
	GUpgBwtRkOXMRid+Ki4WSJjTqcGhHNv4hF1lMDKLQ9vylo9g9Anbq0lLGkEDLqBZ/Ho0q8W8qX/
	LopEwciUmsR7fUfDDNYQJ+IIhWv0An5vtD6p2EpUk3CxACapy+QXE3LCkgsHECPfXbE/AJ/cDEu
	0dik3aWMfUYKytH8xW70ROKpzQFZmgO+jthySvqznN2w6kozo6pA1gaYNONO9mhN4MXX4nNBJ2a
	m/E3d/OA034uJogGQpeQgKF/YEpFSOFPUHaKpsTDYpC2H4UElFHuytfnaBvTg7m319uV7Vnuv0M
	h6TwEKKU1NzI36EuvjnWxZf8aRQz6mjHIqix1LyRc=
X-Received: by 2002:a17:90b:4b89:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b0db5edb65mr4863828a91.2.1794036194581;
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1057fdb64sm1145533a91.5.2026.11.06.23.23.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c40285df2a0so89981566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794036192; x=1794640992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=YLjIX0aC0YSfdvL08sHAFJJzPQGQIH7i9jcl7NArFCo/ELtfUIpKD7hM+wOC8yQBL7
         27WdolF1GOC3yl5WS6neaQA7pa8YyVENMAezfg8WUUWVr/Nyppc+O1AwPT5HRwe1NFTX
         GQFsZppRPBMhlgeTH+agaDbZGfFevvSq5YjM0=
X-Forwarded-Encrypted: i=1; AL+hErFfoQmP7MqY9Ln67iT8ugH/1EfboOqEmsB5GP5MXGQ1+T891dt61Ynyr7jxc3lz7pOVQ0GVqxnXaoKpYd8=@vger.kernel.org
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369013566b.43.1794036192727;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369012066b.43.1794036192265;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569fa54sm134100066b.58.2026.11.06.23.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Sat, 07 Nov 2026 08:23:10 +0100
Message-ID: <1a1b4e3cb30.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106191826.4ddb997a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
 <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <20261106191826.4ddb997a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 6 november 2026 19:18:32 schreef André Eikmeyer <dev@deq.rocks>:

> On Fri, 06 Nov 2026 18:36:52 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>
>> Sorry, you lost me there. What is the relation between the patch in
>> this subject and D3 ack.
>
> Hi Arend,
>
> D3_INFORM and D3_ACK are mailbox messages, and 05 changes how they are
> exchanged. Without 05 brcmfmac writes D3_INFORM to the TCM mailbox
> and our cursed Apple 4377 firmware on the 9,1 doesn't read it.
>
> That is why I mentioned the D3 ACK timeout handling patch. I
> submitted that because I was sure the firmware wouldn't send it.
> But actually the transport was broken.
>
> https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/
>
> which was superseded by Sebastian's patch here:
>
> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/
>
> So probably for addressing Sebastian's issue this needs to stay
> anyways. My memory served me wrong. I just read that his device is not
> an Apple product, but his patch incidentally worked around the same
> problem. Sorry if i was causing unneccessary noise.

No problem. Thanks for helping me unclutter my head.

Regards,
Arend
>


