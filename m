Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387632;
	b=nyBTP5SuspGpxWSrYapbObVo5hd73F6oCThhd1pj1taU2VospoEkXuwtshTFZWrK7lyb
	 fei5PNcBIC+iaFMV71OcFl6sKrZjbVidcfugh/wmvXOZ5OL7eGVSRykLXoOvB8ZE1urPT
	 pCrycQSIdeR+R7+dBVj1BEb6aX7qHh3lj9WpZ22MsbGQnRbZM/7oBf/mdCWFK00kJi81u
	 Wpoc26y7VN1vR9yuFOCQAS0z/+kAPyAlIl2Tk6sz3QcMhpPnltoZIE6I4cRJrmnmLoPns
	 4xqDbh9csTE+KfkzZF0hqbDqgNsjXNkpwidKeKPaSqALM94Jou4j1mAMy6cV9EBvhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=70DATagAcFApT0s3zQyjtWys2wNdeOvMpYC+Axu9OuQ=;
	b=v4NjD/ZZGWxTywetiLN0BduQvbcG27csB/YbpRZJM84MwuqQH523YiuGG6phZXP90dcB
	 1S+a5qxzsDHCKAYLvNy+AqLZiIzjfBoYFUktfFoaIVKWbma0z2DPM9NYgunzoUQN9JCE2
	 GwtIV33Q78MsBPhdd/p1RWxNafTFNqxSTzJo5svEVKG4X7McpvtU6E01b6YHrTap4rmr6
	 pBdSP0jxFzGW2OKSd8SVmz+8KHl1uR/TQjMnHdKJu6rnyhN2SRLDf8LIt/mXMd9o4T/c1
	 +ttK62waZ3BROi8hF8tMm0y6OiioUy1UprFiZvDlEpjO9y1iaodEbTZwqKx+UZNLbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arphOr3I;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8801E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arphOr3I
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae59682799so888839a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793387632; x=1793992432; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70DATagAcFApT0s3zQyjtWys2wNdeOvMpYC+Axu9OuQ=;
        b=arphOr3Iu94v9DPb2T5Jyx7SwJ+9Ah/ouvicJulRLFjT0J5509tJEFcrsS/Ep7Hg/E
         3+M7soytZ5Gbv+Pjvtu6tOGJ2MLiUdaM3yFTrLS7Hg+M8RFkDBTdm0txV50Q5wlj9mwM
         /2KuiEZmU6j9L/wMb5dcOlGP1VZ51H+qBxeFEZL3KOMIqIZfhFzcdxlLTZNRipCTQTim
         m/zHsHHpuQ4tIRZszLdXIUAEAUogrHGRM2RiACCAqtIX+89gLRuIkieWCOWv/OoCykw8
         6jsLlY2BI0kgdgAUBUrl7ZaAOFi8vyR0nLEL+bJUCpyJMQ5BLNasx7oX55eLP3p5sOj7
         EFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387632; x=1793992432;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70DATagAcFApT0s3zQyjtWys2wNdeOvMpYC+Axu9OuQ=;
        b=Hj303dvPETWe+6H2nTBri3NfPp8eriHTnjLPBfmNHe65ed0KIhowuDBN+9svERE02R
         +6X4xLcxEEcR9JxMj9plIcgwnD7CgN5b6f1wTjbjohGRN5mFasg6q5PCgOqkSSX3UUNu
         T1Qc4ButZqmLuxFga5J+CmzR7RrbfuSTWctfoHyWhxM2ytuDiwr+3IC27kFHveHss+0a
         S/BF01X7YSzupL/0OlwnRWorGQ8VH7cc7aG8EtnEIBEf3U0nz08w7dXNbSCUZS/xGROH
         SMal4oybOBTiukFmRo7IlL+ZmoOx3Z4bPk+mOFb37nMBLbDu8ceBXpaPhxdnxYeS7f0/
         U2eA==
X-Forwarded-Encrypted: i=1; AKwUvBwB49FgBZmycZDXaScEcE420f6IBqAbnuYOu/dJ73Fw3fE1XiVi0xjSJ9HV3cW19FaZZdagarzowy9d+VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs9lcwORHx8uHjLOHrOKHxtpMhI0EXN8uPw2rOx/2uFOavZ3go
	bryfE+c+szJrh6S0kDARAaA2vaM360vRGuHJ2xYLql+MovbSb0pE/VaxHuMRjMTmgC7pZZoD8sK
	E44lTRw==
X-Received: from pjrm17.prod.google.com ([2002:a17:90a:b791:b0:3a8:6a28:2f71])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f84:b0:3ab:e588:c275
 with SMTP id 98e67ed59e1d1-3ae897ccd23mr2422454a91.20.1793387631639; Fri, 30
 Oct 2026 12:13:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:13:50 -0700
In-Reply-To: <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com> <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com> <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
 <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
Message-ID: <auTsbuUnfv-lJ2_U@google.com>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, Borislav Petkov wrote:
> Looks easy enough but needs thorough testing and perhaps some commenting how
> we're using x86_vfm on AMD a bit differently.
> 
> amd-family.h is not really necessary right now but that's immaterial for this
> change - we can always convert to it later if absolutely necessary. And
> I don't think it will be.

Ya, LGTM.
