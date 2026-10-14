Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC64F4CF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977039; cv=none; b=SCf7OwICX/0NXiYj2Ydk7PlDjvDoyiRG9lD8UzKmVWBOG3hXaL6TVwtDK/cbeaVgytgNkfyN8uNr4GfnaJ87j8SAJTqWF1sgH4kWxz+9QBiIDPW1dBoilwSXMiiM0wX12dRHJSEVb2A0aNX+4Scd6xCv56q2Zs9NM55ioZ69YJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977039; c=relaxed/simple;
	bh=EjzXw1a50bN67/RH3VHXFqJf/Yb3/NdukgSq2B2JWBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URDHaGH3F2ocPRGwxnSs/2IgdQaDzFkqBnaenSvEOWK4oOrlAG8XLnqbw1sfTYoZxKput4tbRjTawYBvJfQRzheaHFnGHfeXKk7W67oVsDlTC+THkrVavMhmGOnyfFTCbOOQ94SvTHjNomRcT98tvD5ep5rQOKGZfBTYxSlgAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzUJ+hfN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzUJ+hfN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so38776655e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977036; x=1792581836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPTBnYqf+Q9UVZ9B536ghf308gFzDaQ3D8a7r/DdR5Y=;
        b=BzUJ+hfNLVD3McYZruWKfwqiO3J1LPC7pmLwvnyhCfog0vVWaGc5VJE81nckOTfUOP
         Bk1uUimUzEpybZakfT3RgpbUm9xsETBBaQfiFgUAVuM/sN0hwj1XdjCB5hJ56W/BZ6vO
         HQo2pBx7WkmbD5P0kcxSFD4KVSiHSt84IFwhfXHfca4VDMTRgY3EkdGzWfCPZYarTuEL
         LIFl4P/cIX4PQqTEko0+j2t3jLqw0pIDPNobYl0W9RTEoVFYp7mmJwHmH5OfdN9q2UUl
         +dYzrQEcugR/dxOe2xKKYz9TdABwdeq+LC1EGF4f4br2GnkTRtetZYLPee2knlQ28nvV
         Txpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977036; x=1792581836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RPTBnYqf+Q9UVZ9B536ghf308gFzDaQ3D8a7r/DdR5Y=;
        b=itMy8ZzwG/uRLLvo/wszNn2UtdDc7jUNF+bNWMiAXVmAO92EeeWRRGr2g1qzgtoB7T
         eBPl0PvRtFRT0lW/hEp0d+9c5ZT8LexzCST47D9XyrRRPBgSSR5aX9F19sYlUpUH7usK
         8JdeBdOVQ3nyiadWDcrYbhsoo2+0r2cT3cOJzpskE9M2uMZZijdrVNE5r00FeEDQBjDd
         lKm9QZZkN1UyUU0J0Ls69+v6fE8iEv0PxwFtI7gMTKArQ+N3XRj6O+ekwKWCcj+HZyVb
         lFgbb0BWBn1ZilgxHwD0zLwd0HcaSgHO24WK5J88PRa0yBabEbebqTZUReu4FfecrXJq
         XtiA==
X-Forwarded-Encrypted: i=1; AKwUvBzcb85s1yOWGGlHz5+UpQJB5cxQqICl31o6PDhXMk3/7WmYLF5NnevQGOUq8S4Wd3hDz92WhM9ToGKgr0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYV2xlyMR3tJwWXbezgox6AXq/anluJu4KcEjWfkTCkV3cWRjq
	esz0nUrLkDPjD8SchPPdpgA95GmC1sdzZf2MEfX9aj8GbDvs3kBxLm/3
X-Gm-Gg: AYBFou0VX8iQM/ZvLhQVi63HfBdcb2NOAdzJEiVF7mBVe8O5YFbHSfAVBBK4fmjmlhk
	IsYZRyauAVSbBZiH6r2zb8SOjDnlHHTMcVjwsmankvjI9tgfmzg/q10wRSud5pbZun3U9OHYbXV
	0A8r+Njoy6uV/yYecbEbU/hRSULKpxtMwbYyfmAxHPPejsVPmnLhayI/0SLTFaEqRRqWc01Qktt
	7rMMPC9qAvCem8AbF2wkH7CFslzraz0ozZGCkFlO0gB2eXoqyX0irCstP9RTQ8XUz5Fj//vdZ1J
	vzquf3ZfxSoDCNdA5H2JEir08KsOB9aAQWLKpuzaTQdm3Dw5+iQ/iDTfsJe7njqzjLQWph3WPFc
	+4cPpOqDjuBYuGJZg+MCYd1QoEyjERlSIfV2/RLXNa3+CZAQSlc8cWc6ZZiiYB+kfWS7tn9TbN5
	/AhlJjygS7nSyoNKy9eHMytN6nvRSWCClv8Et5AWHcjvK8Xq8STxB5jyKcniSMYoocQcpi1WT1J
	1CXR12ZYuBRlplbuj2HLcZNrYgdhL7y6Dkudo9IU7IGnKo9ggBjFZmqGKcgFw9nQw==
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a18e4a54f2mr322936085e9.24.1791977035979;
        Wed, 14 Oct 2026 04:23:55 -0700 (PDT)
Received: from [192.168.1.28] (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm424801595e9.14.2026.10.14.04.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:23:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7eafa839-ef4e-4856-be6d-d8e0a9ab3030@gmail.com>
Date: Wed, 14 Oct 2026 12:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/Kconfig: limit the PPC_85xx DATA_SHIFT range to
 STRICT_KERNEL_RWX
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20261011113108.539470-1-julianbraha@gmail.com>
 <af5559f0-89f8-42d7-a43b-068bbd183161@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <af5559f0-89f8-42d7-a43b-068bbd183161@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/26 11:28, Christophe Leroy (CS GROUP) wrote:
> Le 11/10/2026 à 13:31, Julian Braha a écrit :
>> On PPC_85xx, enabling DEBUG_PAGEALLOC without STRICT_KERNEL_RWX activates
>> the DATA_SHIFT range of 20..24, but since the PAGE_SHIFT default is
>> outside the range (12), kconfig adjusts it to 20, causing 1mb alignment
>> instead of 4kb. However, the larger alignment is only needed for the
>> separate kernel permissions provided by STRICT_KERNEL_RWX.
>>
>> Since PPC_85xx uses page poisoning for DEBUG_PAGEALLOC and does not
>> support KFENCE, let's restrict this range to STRICT_KERNEL_RWX.
>>
>> This out-of-range default was detected by kconfirm, a static analysis
>> tool
>> for Kconfig.
> 
> Looks like with this change I'm now able to set DATA_SHIFT to any value
> when STRICT_KERNEL_RWX is not set and DEBUG_PAGEALLOC is set.
> 
> The range used to protect against that. 

Sorry, yeah kconfig can be tricky...

> +    range 20 24 if STRICT_KERNEL_RWX && PPC_85xx
I think if we keep this ^ and then add another range:

    range PAGE_SHIFT 24 if !STRICT_KERNEL_RWX && PPC_85xx

this would cover your STRICT_KERNEL_RWX=n and DEBUG_PAGEALLOC=y
configuration while resolving the 12 -> 20

- Julian Braha
