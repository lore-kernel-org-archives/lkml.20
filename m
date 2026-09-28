Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00060179A3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557856; cv=none; b=mpT2CarN1dgTQqK1WYpimWrBaKjjl20yqiJJJofFXmvm7YG6oF65Ihk9f5tCUSQQa87Ya3/zRWEzBJrSDnJmNqfGB+PZvw4WCHhW2T9SNa3anICn4AULmSK5w2poZjgmdNo+XJjQ5QDE9Gfi+aZVKqxosB5SCjQEqE+WCDhjVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557856; c=relaxed/simple;
	bh=6yMk76KzWzu+iefeI1Jyf4+Me3XfVQPopFewLbvBPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRJFXxw/Djk44BU6S4/0HQlqK6SjZXrpT3esqJCb1HAPzKZdVFIthFe3QDP+oyzhr4twYma9voCCfj5dxSH9z4Y43Prf/8RVOx/Wtv9gUpDpSIV/wLt1GYfZXcXWxzgfDgz4pvhOtgoqR9Zu8K+v6uv+GjG7W04KVUoSMDtVllc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhptWLXh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TNI4WBtK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhptWLXh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TNI4WBtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790557854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
	b=hhptWLXhnJ5Lw4Wh5/k3VlbMSWQE+/6vz91PX7av8rbENPC8kee+toZjpUI9+MxUXwt7wC
	4MpXs1nf3DQUdPGmzqkDs8SiZ10kAN/ZvqHwYXunXExx6rADy6SQKRcgBz6nc4i33WTVN2
	gJc7tlvRP2R7Vh1zCCBB30TI7pfVJ/s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-zq_-0KkPPiKNT4x_5tlMLA-1; Sun, 27 Sep 2026 21:10:52 -0400
X-MC-Unique: zq_-0KkPPiKNT4x_5tlMLA-1
X-Mimecast-MFC-AGG-ID: zq_-0KkPPiKNT4x_5tlMLA_1790557852
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so25184195ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790557851; x=1791162651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
        b=TNI4WBtKgtgkfW2UiYzMym0nIr+J2m2eMkVDfOhPHLVdaW5C83f707xxJFMr39LsH0
         LzHG4yKA3o1ckSdw1xgwRntLJfVsSnuBRZS645omUYgstFOKRTgsswpSQDJcO6zR50Cr
         ZtYsjw0Mda8tCWlcGO0tQvW5ObJ1UhwxYwCaoNH5WSevu9wzA82vHa6euXil7d6ExT73
         sBDual6J4by6xt6/vTSwx/Inze45ePcAf7jrOjqCuTg4rR9dzPtt8asaukxDjHeB1dJ5
         JBpngTO1FP1Xu68ZjV/7t2rF05udBuTGpDO63nlaiFwNNVgEr/qyVtdk9bl9D9UkXTkN
         OJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557851; x=1791162651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
        b=s0uyI41xnj/6XRFFx4Fr0FZiHpBbPfuGmGyCMMULK4yzrbJexqCEjVhWfn50ra8rxL
         9hInxZYUx+k0z61gnKCBAZhnM6EiQG5IwEl13mBoA/2kbVi/M8rnDkaJhOhvQ0kBDDAK
         6J68rb0F1H2QdhNoFNpSDFZ7JejMDRYgZzT8Doy+g91JqTqZYdJuI90e5f5qsPoHKJmA
         XEnYoE7o4TwyLpFfSWpY9GU3JbWYfdnGLe/3Y/BvuNb1Lg1u+Uiu2bjR2Wyc/5bxqO2o
         mf7ciWyXFQY7maEs8kLEuiNC5EbDewWT22dqF4o4taKkPpphV0IysTyh3vrTjcGJXtR1
         aprw==
X-Forwarded-Encrypted: i=1; AKwUvBxtUWt4o47b3uTCtbmNglptwq1UCsS9g1qwD4XJIxXmRxQzghA5P2TJHtDMLrYz5kVZ9ecpoIT24Nrn53c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWGnYu9VUqtfQeq5d2gL/dunl6bkhnGCsfyYDIzHyDEUJNmFEL
	y/88o4v8lPzSBpNDxzJUScC8UthQcPiQuEuBg1BbyGCVRNxZEvjv6DvXvgmhfqr3sGqoc2Vm6lO
	QPwH5sBK+6LRnoEjoA4QB4p2/gGLPnVKCHjllWHw/R4hr4DtWOpjKrfzKXETvRQCc5w==
X-Gm-Gg: AYBFou1Yy4KfO3EZuvhAFWmvVlA2/OhrtYQQpOthKF92D4U6g2aXMaVfSBO3GuH7q+Y
	GKIPAm8yx+2Enieto8FeWYBIbYZFoMuRTPz6KEj7wXa+MmociNu51btbucD/Om6UM2KHGy/DIAi
	/R9+oRsaBXDKH9+TJhJnnsAgS8/UOIvW7QTq8fD3I+PBKAyGxeaQADKmtOlAcqXyjYqmjQSe7EZ
	eBjX8wsqa1muwLeKhSds+1Z5fZzD5KaCFILnvyWz5ZfLShzwppDVU1C6fXXO4XGgXAis9s/J1ce
	Jy7XMm2SA11b16lU3cHNNKd3kLFg7wS9vGd8wpFv1M4ekKzxtz54cXUnGjoRyFzZBZV42kazQy/
	W17Y8BDnD/LopuW1GktYIoW6XatnTV5aT4b5+NzF1bw==
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473495ad.56.1790557851544;
        Sun, 27 Sep 2026 18:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473175ad.56.1790557850985;
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm32933225ad.83.2026.09.27.18.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Message-ID: <a4961d90-42ef-4954-beb5-c07fa1d92fd4@redhat.com>
Date: Mon, 28 Sep 2026 11:10:43 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs running
 on hyp that don't trust the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-12-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs
> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>   - Cover pKVM guests for VGIC v3 mandate.
>   - Merge the VGIC mandate check in here.
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 6 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

