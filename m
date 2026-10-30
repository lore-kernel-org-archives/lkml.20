Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337133;
	b=YHcCrpHqtcolPUMtJxPmc0HVB+zb6kAfBxe1NkBbK9ZezrWnW/Ey6JlY8SHbaLLs3wye
	 R9itfG7xq7Ypy3seka2m4djZ40/+JtLdhO/QQu6IJja7T3Fom70dvWmqegrcolthjL6vn
	 jyh2uJHqtdqKj3O8OCCqWalNjO+6Ant8HB64xElo05+ne5Gpo/kgbB6hkUpnSzNUBUtrW
	 vcO6+5z2cDUiKrdBFXKMyj/OypPiZAHQNaYdDziCo9+7JGA472VgeVucOR6ah3s0i9Nzy
	 O0mG+eyEEmvrUBzzZ6bVdoV/z3hrgfSiZwF0I2qs10Lxkt0qZvyF5KYso4xrIzR6auA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337133;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
	b=eUpeuBQjb5Y3efk2sWI2GNYrusIFgzVBCbcIgXUe7TkQpjcfv6sY/h87nLoboI3XIwz8
	 3CYPAjX+0Y+uvvQvd4uWsAAnO+/8ShiITgD/CbjecgCgjclhyQgKHrmYdP9cko34mh6+h
	 9li2cJ5LHYLOoyRgr55JtX3/YjG9IZbPf3COFTtTYwjiO+jod/FwcDnlNTiibwAgDAYLG
	 i5ByAPStAJ4wWXZ/4EJrDhL322s22Svd7v0//G+seTbV5etwkiyewS2jVo4aNmRY2t/tE
	 a5DZY3ALJ0SoAc+noLUN00kMuH6DMTX/eo3GyXazGxFQwNqDG2HkTIcdCSYyTi7Za4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EYENxIrv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qNimenrX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EYENxIrv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qNimenrX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793337132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
	b=EYENxIrvUI4S6hyv9as/EZzS/jKxKeFUii2m8veYRZLBAdKf3lnuldZtE/l7QU0t9MW8or
	1JYQgKs/bOcRtI9vMCQJRjiA31zFkHgHQd+u23guqhxaSEbElTs28zuuoywLOHSOm3hiAG
	Mu2OwQKcCsft6Q9om0ChJUYaXHNXhew=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-mHyJUFQ9O3O44QBAwYvSZA-1; Fri, 30 Oct 2026 01:12:09 -0400
X-MC-Unique: mHyJUFQ9O3O44QBAwYvSZA-1
X-Mimecast-MFC-AGG-ID: mHyJUFQ9O3O44QBAwYvSZA_1793337129
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso697554a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793337129; x=1793941929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
        b=qNimenrXq4oZBeyt8UAlrQLwY9PU3JS9TH7QK55yX02eaQx7YlT1io2TDAJw2HmcTI
         n0yS5cKtrcH6RyaAR3M0oQgwoUD+t1G53xhXrjest1hI4zaoXrlNRsOrXGFs1jeCh3rY
         yNc6+xsreD1AlfT2GtP13LtNjdQNyKTh/3ZEx4F5/9O6bJyg6BgEUDxKufvaVG5Wg1oP
         RjOjm6/WkRDmaaN9ZPNk0IMf6Wpdjus6numOc6BL6eSDcTnGygnVv6jgej7Nr97k7O0K
         R/RGYOG1f9UDJwVOHLTrgiLC22bKAV3AgurtwXii/gKUHIZ/pIexMoM7zHxja1mRzJrU
         nvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337129; x=1793941929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
        b=hKGXtweNvHyHiwXGXHxseGF/azLeXxUkJ92jGTrnKEI5CvUFORpPbD6r5h+pemPojj
         +QsphS/ISVI8kaDVPecmGRhlHaaOBXWD5W5rR1t2iWXTQCONGLs+1p+NZAonB0VMX3aN
         0WLMTu514kNvvQLt6pRJb60z6jqRkOJdlRm6W7WZLpAU4ToXjBnCBctQwVQ+k+fr2oDK
         CTT923DGEbIemSeJ0AgrRNYIl9H8TMiNO3sIKJnlzbXoMUcY2Um5s8MTjBQcknFPQyNK
         7wgkwowI4q67yr45u3m/mqE4UfzUWvy12d2rktSyrJqjc2OAA8jAyVgzEsZrZ9P+TvuD
         M/Iw==
X-Forwarded-Encrypted: i=1; AKwUvBz9S1KpUyIk0dcjx16kkdREoswzAkdK9KymsrkMntg56BzSZc1ycTMDwuFgmp4fK5jhquXXaDAcoWmQhKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgCG89vhF2NqdfoNWuzxl204nGJku/c1QnBASmsnw6t+/spVun
	kaCbfGk29y7hrZyN7jKyBGVPSo/vBa3SwiNOe3BqTVj0Wh63rNUUFGgD3gq/AGc64cddL5o3x6d
	V4kZPn1YpvrjHezBEpUSQ0R+C2HDi3uULoYWO/E4sMBprGzmp+e9l0CaJR2eNGZxiO++mMCsRXg
	==
X-Gm-Gg: AYBFou06URiuvxcxKS0v+b6ztw6LkYxoC1mG+qGJH8ZcT24VNoR3XrjGymwTXco+s1t
	GBCuTYs3ljgIMM6M6oakfhdTHYe/anSKez+Koyw/ajzblQj4MRYs7C7LdwsHyltbpvVuw6BaChT
	eD3K7osV9IqNb7xUQI3EfUDB6/JWtB4pvFcMPPwgseCudDfTYjPkifk98FS6z5sE4d1OPZLOqXr
	k87lOc4wvVR9Zw+FRJhXlHwTEPq9wOYbjZwggQwKWniOOeavaIqXcesCOUG/HlIbud4Nl+Zfi+5
	6cZHH03BiBluGJaKjIivRUgD2QtljRIh56CWTtKibW8yyeA+KT6vIhXT0t2CRb0Qpn59felq8DZ
	vZ8KXwz7+agrRifA0uyu5ZfdqcIQLOSCKm8YG9xmgicVRjWQ6AL9QvghJeFeb37GJemqnsiRsdv
	jDObHnJUv3CV1aDYs=
X-Received: by 2002:a17:90b:2f87:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae897f6d60mr921889a91.59.1793337128738;
        Thu, 29 Oct 2026 22:12:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae897f6d60mr921866a91.59.1793337128336;
        Thu, 29 Oct 2026 22:12:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84542a13sm2349712a91.5.2026.10.29.22.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:12:07 -0700 (PDT)
Message-ID: <d9eed4b5-e9e4-4699-ab5d-197141a995d3@redhat.com>
Date: Fri, 30 Oct 2026 15:12:01 +1000
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
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA
 alignment
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Leonardo Bras <leo.bras@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
 <20261029175238.3214788-3-weilin.chang@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:52 AM, Wei-Lin Chang wrote:
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
> 
> Remove the stale part of the comment.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

