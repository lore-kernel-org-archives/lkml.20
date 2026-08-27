Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060540E8D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828113; cv=none; b=DMq2zzDPK7L33wN8opi0dSZJWz66S+Lll5auefe6+969AwDqd3M61BlM8mqao064aDtq/MToVX7WCfqz0GUPxQLgvNygTmTmQjKQBSXzCRUSkXIHIzy2jTKez9I5mN524RjKo7oQCNdcp7oEuP0hCwRHCyIiPklDebiDNpVNGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828113; c=relaxed/simple;
	bh=2vEDbTV5u5xfkJVFpzOKcLm91VAFKFRWxlLRYf2tYEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuWGYIocmVRjb5grrWCkpqmnwDT4rrstYzSKDLFznE0S6or4aXDoIQ522+TjQ8POFkH55RtTh19Lb865O24j8WvcFP2/dT3leGsKTTi1lCcpro2ZZSVmF9w+MaKBqN/IA3qJaCXXoQZMtmIsb+PIK6TVmArEKJc1bUHofiMfZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GKvVEHkC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNyzplPB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GKvVEHkC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNyzplPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787828109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yB9i88j5pk81rn9+4AiT0mA4kRNQA0X0aghVXDq5a7w=;
	b=GKvVEHkC12g52CenK3oFMj5HYQsMGBbxpiMx5oCVxbQ8g4N/05E7zq/zC/xcRJYQWO1wF3
	8/GhMXpLKycPVvIBdSPGhi9nUDs7UzfOL9x/tSfIoyBU0P/zKB6WQU22f4J5GonoaAk9xB
	zpwP0xi74EgYKSsSlk7EAAlh1c2w5tI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-VD6DSkigPPGrtWA8T68vSQ-1; Thu, 27 Aug 2026 06:55:07 -0400
X-MC-Unique: VD6DSkigPPGrtWA8T68vSQ-1
X-Mimecast-MFC-AGG-ID: VD6DSkigPPGrtWA8T68vSQ_1787828107
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482e12bb58aso1159842f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787828106; x=1788432906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB9i88j5pk81rn9+4AiT0mA4kRNQA0X0aghVXDq5a7w=;
        b=SNyzplPBODx3sCWeq+Id02ApDxookm8JZ+k2+M+q1VgFhBoH4gdzde5gpkdzxOIyVj
         0pUdXnXuGwCTwVMuOVJ9EjpzrZYg0B9f5SSkVPBOMW35MqASy6/zebH1fslXHPaWgKCH
         VU2e0aFPozgMMUVYbYbCHtrai5EafoNumxdHP+4xlQgr9pjvJ0cLq/KrZ5DmUNMtUdoP
         cyGCHveUE+rN7A7FUK3uoL6LuxeFkKrPmWgVVCK0PAHOrjdDoRlR+reQnr0ifHZTn2nS
         j2A22MrwCJxPH4nwYSr+UeIucRO/afPeydjZSnD/hdqjLDdTHkVr2AFyv3+Nd5pp+30e
         7bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828106; x=1788432906;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB9i88j5pk81rn9+4AiT0mA4kRNQA0X0aghVXDq5a7w=;
        b=Iq/OEPBgOBYtSVpZl4d8xzK39cyDLMWZQdoZUrKjLyUuunM903ZBZOecCVs19AKVc8
         XlfEMQfRy2qTwPHxedsJXmZGCUGiMtanY8r6r3PAWHqkao+lkD04WphpLTma5Ez2WXAL
         XxqFI5ZsUDNTkfupuzxHctCEofd6WckJEq1w2f7lsVESPYOfXsEw7ZpI3iAjFCgP6/Mt
         DI0SYXR2HdsYvGO9vjvuMfBQpCb6NFYCIQt3bQ+ur0A095z5IDd59TtSIJwlgEEmSHg0
         Ou2Euo9HcVzssw+xuCMOksQLEGuPqE+AfepKSZR9BO/IEyPB8AIu9V6prrWIIQ99qpAM
         aokg==
X-Forwarded-Encrypted: i=1; AHgh+RoVOPM1ChyTh0I4xedQJyeG3f1Pyu//G17EUFwRNMYjlxNYJwxhaP2hw3ARw7B0+FllAw5pmbUg9+UT/yU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBcLFFKYP+tYhEJEdi+5JjHjKX5MuW9yB6WggTZVK0ikXOWfPJ
	FU5HFfv+fNomvUrM9+aFsELolCoacHY6ADMO0EZN/VMlnpP2ATu3J1orH37BzI2iNZtdwjNbRVI
	v0fJTV/hH6WMmHjlaSmX/TmSiLvYbaH9WpZTBOjWdj52DIz5R5f2FwnZ6fZxWd+hWNA==
X-Gm-Gg: AR+sD118odWIUyKTM0ioqOg6kdXDv7yrho/euTjrBm3qanaSVeS9eOuuoNKc0KqhGaI
	r4Hs1wettCb8QCP59t+qjuZqO3aSC82rA43Bt745jo9Kb45IeXT1fys0VwakmBcfoQwxxFDzDX5
	YiIdv0buRHoRRX1K/t1ilcwYXwQhgsAXtKCFNI2oeVVNamc8kRLfy34yVPAqxU2a99oT0FfNpQy
	qcE0aSn/pdcuHIyGq9a2gvhCQ5hjuWZXGm8L2FNhyjOb9T75Vonetw7UIIPT1Wxzue21wBywkaj
	/Re07lXBf0DGSwb4bsPdQw5DT1A8ePW0rCxU0q4zgvd8hY+vPhAG1pcAcMraNkH8YN4/jRLIH1H
	uPE3YiWVN9ckyBnIptpf/1cYh+Cxn/M48JQqbT814qiZIYXLY5fxou2d+/y2vnSHJtrNMVcA=
X-Received: by 2002:a05:6000:25e8:b0:482:f4f8:7a00 with SMTP id ffacd0b85a97d-482f4f87a1cmr2544441f8f.16.1787828106563;
        Thu, 27 Aug 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:6000:25e8:b0:482:f4f8:7a00 with SMTP id ffacd0b85a97d-482f4f87a1cmr2544302f8f.16.1787828105890;
        Thu, 27 Aug 2026 03:55:05 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb1csm8227772f8f.4.2026.08.27.03.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 03:55:05 -0700 (PDT)
Message-ID: <08c53736-eaaa-47b9-a65c-b920d21b2993@redhat.com>
Date: Thu, 27 Aug 2026 12:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] netlink: specs: rt-link: fix ipv6 devconf doc
To: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Felix Maurer <fmaurer@redhat.com>, Danielle Ratson <danieller@nvidia.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260824103816.40040-1-ast@fiberby.net>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260824103816.40040-1-ast@fiberby.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/24/26 12:38 PM, Asbjørn Sloth Tønnesen wrote:
> devconf is even odder than described in the blamed commit, where bpth
> IPv4 and IPv6 are described in an identical way:
> "u32 indexed by ipv?-devconf - 1 on output, on input it's a nest".
> 
> There are two issues with that line for IPv6:
> 
> 1) The subtraction is an IPv4 specific quirk, to avoid having an unused
>    u32 at index 0, thus saving 4 bytes per net device being dumped:
> 
>    - In include/uapi/linux/ip.h the IPV4_DEVCONF_* enum begins with
>      IPV4_DEVCONF_FORWARDING = 1, so the enum starts at 1, which is
>      the reason for the subtraction in the IPv4 variant.
> 
>    - In include/uapi/linux/ipv6.h the DEVCONF_* enum begins with
>      DEVCONF_FORWARDING = 0, so subtraction would underflow.
> 
>    - ipv6_store_devconf() in net/ipv6/addrconf.c also doesn't do the
>      subtraction in the output path.
> 
> 2) Setting IPv6 devconf through Netlink is not yet supported, as
>    IFLA_INET6_CONF is not handled in inet6_set_link_af().
> 
> Fixes: 720447bd0b24 ("netlink: specs: rt-link: remove implicit structs from devconf")
> Cc: stable@vger.kernel.org
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
Nowadays net PRs are already too big due more-or-less security-relevant
changes. I think this is better suited for net-next, with no 'fixes' tag
nor stable cc, WDYT?

/P

