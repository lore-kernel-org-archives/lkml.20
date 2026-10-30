Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368631;
	b=xGabxSJvP3RFHWPv7jR4y6eyP59WeyPp4kYA3f4Jo6RbFjweujOKN/KlbryaY8jdw2Bt
	 /gBPRIZIT/qbNc/KV+Eg9XwDrRrRzAVMe6cFb3Y9wCSCF6kLx1ltxkeld8ZWcNoB8u1V5
	 AQAXxhKoNuHJbYYDNDq2oKNLLXPAnBrBO1zutAIxchC47TlR/bZSWtWyiQARXow2RSgFa
	 QelaZCGURzh27DjjJilym5Mswxyknc4lHZKX1kCnGxESKYOc3PwNu903GXk69ovDILdcM
	 KWWYz348iu1SBncskK/mgnayVzHT7WZn7/gus8I1AjazqRxS7Bd8SlfBx64lbuZV03A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=GNIOi3l2fXouiVMkzU5S0Fr0utCMy6QmwVq2E0otj7I=;
	b=BAs4pruSurutvpfeDRBbmz/N4oFsARggkPeEJL8N9vG4knhsWks0SlQ0xkn/cezNyhIc
	 FpQxUwXBo1h7QdygWVe0LYejj0khJjssbjkyHTcVxkX6jXtLi77cL4n6QaJ+CiBUp1d28
	 V29nsvfinwf1jYzKjuzJQj6Y0DJlKT0twb9sVgVSrCCahHJGG37zcWlU28H65vQ0ZeP9/
	 efLcnh0vk7nmNvBU1Gyz1iJZHeS8UY5EbFdC1U1tQfjd46aTh90IAiXRR6rewKQ9XXvKj
	 2NUyq+107XSsQCW6tATHnnNQHYUYeZeibQFQDYU/kx84KXDnxsrSOJB0dxyf7nm5DyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouxQTXuG;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65139606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65139606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouxQTXuG
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea7987517aso5512925ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368631; x=1793973431; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GNIOi3l2fXouiVMkzU5S0Fr0utCMy6QmwVq2E0otj7I=;
        b=ouxQTXuGY0sUIyzArMYPWSLzsXzGVK8/GwzTMGcquJB53F0z+mtYa0vwvFzX0mKKJs
         i9ovdt2l6t/blE1Ru8wzBGANzZ9/sLcVu0/ows9x2wlcFiq57bgyp+WTw6E6AJX2EBZi
         YCzj2GjuC2xsnthiGOJO7aWt3jhVWeHUuQx2Kou2E77dkaam0d1Qse/rrRr/gk8ua1yW
         5gPjLDAhsCaT7BEhY/MT8ntk1Xlr8z4Kirg0mu9p5A9qICrUq1oyAS5N3o27acU3s1v0
         tsrN1vzsNR+PMGud1ia+XH3+rfzbwzkJdTgI3oOVOubg8Mizsn7qYpFgAEdU0F7VsvJR
         74ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368631; x=1793973431;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNIOi3l2fXouiVMkzU5S0Fr0utCMy6QmwVq2E0otj7I=;
        b=ChAho78rnnc8h0SitCH2lu13pflAmHgFhja1T2loMyk+RCz2hzkZCW4OTlOmu53GZK
         KNTR5hhM9qcJT+kandCe5RYcuFEPzDnKjBK5c2dcDGle8M5fpVlv0XxgMh1RNd9J4Blo
         f47F6LsQCkBTKalIWgsKUwK/MuNkpH3yMWyfsHEnAYuoIMVtNvOhLKNsyoVLNGfvc6rk
         dVinsfAT5ji/B31HYBYC3pAFDGrN8UG5LQm/lL5eyQBFOerErDSYGys5dwxtqPfnPCsm
         zEB13rdE689wBmpuD+huEJaX+dUL9U0uL7hNDhwJDGvUSBEenUdfzpjS6DOdw50jalyX
         ehEA==
X-Forwarded-Encrypted: i=1; AKwUvBwEkaWRhDENzRe14GzG7vEIG/8n3E4anCdYrKq19WV2jrD2HOC6n1fuPQRNfrRIhqluYRzFM6mnMtAC5GE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6s7JDUQqXuoAEB9Z+8ix2VmAmOSOSLuxhYKcCKVp2okpdeG7y
	CNlv6aWAkHQwq6uVD80xXkIMCT+n0CMn7NUORGeQwiRgtR1Y4VNBFSrO
X-Gm-Gg: AYBFou2Ro79U9plhCoF0tLj7czut77GEAE7cj4cCYLXApFSPtZq1WQERwTZeI4zQESH
	y2gdWEs2zMlmXj79FxeJpuDOhN741x5dqXzyUUV7Egg+Iww0doye13qXhB9051MWhSkqfcbpWvP
	Lqx/tyJ7D/8yqj5N6yO8InAY0ATbfLAyosYaRF7+sa94/j9PGeWHgVLyvHZ4jiSprUW0osHPAto
	HYEedgIxay/ce1yp5ZAS+U1CHYlweNxGQMqz1Tb6llr9ekuWpH9xnD0W+LdEpnlh3oquJ2k7zte
	LoO7ffYyrOOqjKBgZyQfwAp5U4ThhcTdZKy845giocniE6QB9lsOZPpWwpRthfOR8i2H6lqtKAu
	UVpC2UaOHGk7yIY6nd5hLqOwrC7Mjdy3cpEOC8rp3bD4xL3mDNmjCI7iPMnrGAUNbRezd2bXhg8
	5MP0GMrAxqRdbLV+xLiV1RsWpBKsAight0ffrIL7WanQv9QJi8azzcYQBWtfyg9bxFYl/Gfyave
	ek0d/l4iSXCMgBs0W4jT6F9GSjSOKa82gUPPpQM6htZWw5WS9kJzyhVtLtAX9t0Wwmbxir2q78u
	Pc5VNZwnLbNSKt40piMs+PT7Ex4=
X-Received: by 2002:a17:902:c94d:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb365363f7mr26307325ad.59.1793368630732;
        Fri, 30 Oct 2026 06:57:10 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c858sm7688305ad.35.2026.10.30.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:57:10 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, amachhiw@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] KVM: PPC: Book3S HV: XICS: Avoid NULL ptr deref in kvmppc_xive_cleanup_vcpu()
In-Reply-To: <20261012082922.218799-4-gautam@linux.ibm.com>
Date: Fri, 30 Oct 2026 19:26:01 +0530
Message-ID: <8q3fwavi.ritesh.list@gmail.com>
References: <20261012082922.218799-1-gautam@linux.ibm.com> <20261012082922.218799-4-gautam@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> In kvmppc_xive_connect_vcpu() if there is a failure before
> xc->vp_ipi_data is setup, it can result in a NULL pointer dereference in
> kvmppc_xive_cleanup_vcpu() when accessing the MMIO page in
> xive_vm_esb_load(). Fix this by adding a check before masking
> the VP IPI before accessing the MMIO pages.
>
> Fixes: 5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt controller")
> Cc: stable@vger.kernel.org # 4.12+
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v3:
> 1. Add some more info to the patch description.
>
> v2:
> 1. New patch - Introduced to fix the scenario where NULL ptr deref is
> possible. (Sashiko)
>

Make sense. However, the order of patch-2 and patch-3 should be
reversed. Otherwise LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
