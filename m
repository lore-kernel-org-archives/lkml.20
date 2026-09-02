Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B0446821
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351517; cv=none; b=AVEXXa2Fj010z0coDLXhFESQX+tPloEgtLN3QDZbkcv7KFkJzAg1amCCBTV1AlD41KN4bbmvh3AmRL4zVXZUJGUteXxU9vPOxleFmmD/VfiWt7hh48Lio6iLzKAb+sDtxMWF0jlPyUyzi7Z8dmvr7S+m+P1f8U4JygM3Wpsn2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351517; c=relaxed/simple;
	bh=MIdqeD8JILpdEwmvGfU75gRhwMHwZyLYXZfsymDJyDQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lKD/U82rJKMXiKZ21eec4cKvnSkho07YFerAPL53echI8AF/tp1fCFcEiSM3LrAv70J+IOxbXphb4t5/loGBrc1WHW63nM3Dxo5eiCwnwHAxQEicgex8tL9cYzxVqsWqeznePIJr4vmGLTd5+TVk7n1jsi+BO64f46qaD4mEMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG6cOBWw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG6cOBWw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1676732a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351514; x=1788956314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QtiE+aWQhCi0qgo7uDytm4r7bztUPnkWzlnbTvXGvo=;
        b=mG6cOBWwABuTWvwpnCX7BRUMrQ18pOI45ss2JlTltFYEjTjzsRxYLxP5h52SJ8aFRF
         rBWNNLrWtU7I90xkQMDe1S7OmCNgkUuW4DVp12zs5lErK5Z9kom70ZjtDVNTgcLeAaIt
         y/pSpczXlthCly+mQxhoExiCg1Waj5MiWZMbz52IvIv4Gvw+I4YHoDDJVLFCL/slU2OC
         lzRkSYF8yL0UKDiB7/CHoXxp8sFFrLzBqw09dvz1oCIP3qO5Y/AVu9fRI3DcYqMTYt1n
         tFHQVT7O7rVu8XRNMLdPZW2kLMIp9TIoNFuGUxUj6/q38uMqW244FxjuXB+3K9jn2PLA
         5LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351514; x=1788956314;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3QtiE+aWQhCi0qgo7uDytm4r7bztUPnkWzlnbTvXGvo=;
        b=pCl22/r4CQbYHX5+ECrSszdw/SgNqbUeeoesOFvV3Fz81E/4QMu6HkxYyRRamjotaR
         rxqW2WrMxRUqlpI4oc+TnTyURi7mrSHOjqqMe7BuWOoTZb1wfiMagF6qZi+xbvPbUO5R
         wWq4T7ROIngRMp+qP8ZKX1AegYUYb6AkzTLAEB1HCirhWDpl1wEgLcQ//6lM5IrA4olc
         X4xu7zAxMfxKZD7s0oi1f0I86tc9Bg5quUk2sTzCPzhv7ceQDK/DCjiu7LzgolLL5PGx
         8GsbWzu6hjJL1duHaWNNXkkwDO8zTUjRQbXBxhdo7f0z5ocOnb82REpJdJiEEaGEnJuh
         6evw==
X-Forwarded-Encrypted: i=1; AKwUvBxk8XIT/10c1/7Jc1+UBsyGZYSqFkI6eF6AyAz7umdBii/ibvh+vxEuOAGW+GN1SAehfVVuaDX6UqNDzrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kLSPJMEN+u/Ob8NkZBmDcQYYYsOBD6M+yBAXMxkyUJSDWjzYWU
	Z6YlfdnOVgf3ZUjXRp/fQnE2LRA2DLoNl8xgQPb28Re45wCpzijN9u21
X-Gm-Gg: AYBFou39CNoIa4DZkrB5N7soZARqjwhlXnb49CgAL13rqb5Ymz4tD3u31NQEFABM1qm
	mHTHx9K2/ebmFGNPutPCUpojbqYQajE4ch71S1HkNRsfDAy7wvJ/Y92oU3KRu32nXNMip5Xsyci
	TGCmEQI60BwR56y+msNhB0kB3EmriYdGFvkfgIOTWaiGj5om5FXySY/xPmlMo0k2qPjL1eLiloz
	SPeX1kknp4ivWjABvkJBnaEeZ55JDnoudZh47IKh/+5PXXWUEVd60vzrMjAapG61EUvcq3x2RbP
	JDZ8HAKVrG9TudIoIGPO6ZhjuP6zVtorHVjQyfPiiE5xkX1X8b+OW1s5LLWzjAEr6m3N2Txbbvf
	WGv1i9gX7g1vN431kTsg9ZyxI6BwzIDhzffBMvA4FyhPNSzxPTFPJQz6l7OHGYmv0x3B3RUWhT4
	SJ8UaXkE1iHWenZPpVBRXqo2soKfMOtrNHx7lO3/d2bYYHiiP60wNsiSRkhDwAwHeB
X-Received: by 2002:a05:6402:500f:b0:6a6:32fa:54f3 with SMTP id 4fb4d7f45d1cf-6a6832e70e7mr3225504a12.18.1788351513631;
        Wed, 02 Sep 2026 05:18:33 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942840sm959977a12.23.2026.09.02.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:18:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3590c47d-302a-4a24-9953-828eb9b38c38@xen.org>
Date: Wed, 2 Sep 2026 13:18:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] KVM: x86/xen: Rename 'longmode' to 'is_64bit' in
 hypercall handling
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-2-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Rename the local 'longmode' variable and function parameter to
> 'is_64bit' throughout the Xen hypercall handling code. This
> distinguishes it from the VM-wide kvm->arch.xen.long_mode which
> represents the Xen shared_info layout mode.
> 
> The 'is_64bit' parameter indicates whether the vCPU was in 64-bit
> mode when it made the hypercall, which determines how to parse the
> hypercall arguments. The UAPI field name (vcpu->run->xen.u.hcall.longmode)
> is unchanged.
> 

Given that 'longmode' is the term used in the UAPI I'm not sure I really 
see the point in this change (particularly since there is not even a 
name clash with 'long_mode').

> Assisted-by: Kiro:claude-opus-4.6-1m
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
