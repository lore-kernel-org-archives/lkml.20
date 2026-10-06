Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50949197A7D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256332; cv=none; b=jEaRJ/tqSTP1+DPe8DgUv0PrMo4yp2HDfLLkFjQ29TBTnbnXxFA/D3QIYfwIOYYHYgxcWGQf6Vnn2Bx/soU/pdc1fWnzD0T613WJI25BoLjmOp9ln9rOdnexc0HvbvxK/TNevGwiGL9AMxyCjPqtY3o3KpMkHeY5kWyvrLvi8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256332; c=relaxed/simple;
	bh=liZcKA5xMSphCw/JtZIGkUglVkn1mh/BgOSx/JkJum4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phETGx5TAT5v2z82HZHzf0qBtAh1m+aDy+4kEHIRaNXuy5om/V1GXwOVOZxv0Rg8lBzjBf17ZWf3McZ6R8X3mlQKi7u2BtBo0qcYo7XYRipx/DRBWswsf9e2b6Laqd93/aoQQw2HmwoVvYUNyi5Gj52YlBgGeaJ4rjHKPigt1aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BswY/ewp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CcIbm5rT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BswY/ewp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CcIbm5rT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=;
	b=BswY/ewp3QQ0mo4EGVRlV1vA7OtrOaarA1RTwczJxfJKE3Adyg0tbbtUgQhSEx65zZuPmB
	CB1sjovwhvrE33jH48LLnQcWVLi3DOymQq3DD+hqzcxXN+KZ+c0G5z5XOuk8AYzHf50VD/
	ieeUJ9JMqUsEEsOpp/zgybjCZYMevkc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-y6u20SlQO-64UQBWQ3hlBg-1; Mon, 05 Oct 2026 23:12:08 -0400
X-MC-Unique: y6u20SlQO-64UQBWQ3hlBg-1
X-Mimecast-MFC-AGG-ID: y6u20SlQO-64UQBWQ3hlBg_1791256327
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso3840296a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791256327; x=1791861127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=;
        b=CcIbm5rTRdwWWvvGvLZ1fq8w0QyLC7ksJaVmEcbrvHTV2RC8ChoteWiA3fisAnxkkQ
         +IAnO+huisSvusyTwON/QBba3ww31981pdOFpVXQfPqijKyvOTyMYFLSY/4tQGVqAeiA
         SUzA9SP0d6sF1CNm0mxW7c+9H6LcthJhDr8qPrdVulkl2HORwrd7t9bg3Cf/P1hf0J6k
         R2oP4lZJP4OH+Y8o6IcBStPzfa4eyj6DLSkmFVXRJUv7eAxbqi+Sw4yvXy9a6gYuxixy
         SlJUXzq0kyRdBa7qLEiBblQnW9M8ibH4O5ZHftc5IUipYDFC1yp91pgJXBBlMY385Q7g
         YZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256327; x=1791861127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=;
        b=LkRPlmk2ZnX6lu7BoAucsN00z/g84M3AckuHbZrEF02sDndkW1NNCJI1+0XkRJL9xu
         E3qvL0Ae43d2UDTB1yzRxeQBWLCHZ+9Ow3L+5QvS1R/YvrpkVQF3porfL4F3Bf2XU4NW
         WIr2Xns2jdPwchNIlfcv5jB7bwKQmk79LViX/wro4tPxe1nQ1CUPcJbntJ8kVJyzC1EG
         8xQnIONBf6pu0mwgRtoQS6km1WAnAjVImIEV0AlUN4bcgdp2fitdgXoIukPBogt9dV0O
         IkDya1qS1S0AA1fO/BW0g4bRlIUJfaVLNOyhSn5bBJXqnXPhwJsfLL9p3SeerPQLVvTV
         CLsg==
X-Forwarded-Encrypted: i=1; AKwUvBzLjFGn6Ez6XD8L0NhKvU80xsrcujtGoiWYh1j4C/MRHzQA/9xMlF/R9NQCSdd8HwGUDn72O693tFA87Po=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKZC0rf3HpqemfK2pF9m7XlHCMSOO2f57RYbJfvka16ovywhjk
	IZZ3UlO7EM6knzCXNhXOfgX0XyxyaKdiJ2I4sFCzqhbaEk9ClCAk4ms/fbgCoamziZFt0al1U+X
	tHYZv/HFeGHFfdKeG8C9YA/+BVAFqLqs0imtsxAk1CKtPbNaTbHmwjDXnohDtPrKgnQ==
X-Gm-Gg: AYBFou3DnJTzYlOuyZyXCNXKDPZZdbelYvZNzStuaR2wZcy9+v3aGxF8yod0xKx6VVe
	LrmHoruksgcgidePGinV5kKNUiW/IppbLcYVH01cc8L6wZG3j8Bu7Uwfi0xyvMVf9gyPrCiRUgR
	kiUPhFyjZPI5ghHhVxWInL24wX9IDnzYUabyX1yq5YaSSGc1yo6wCUgHZnwC3LzRpe7X2V1tiqy
	YMkvwkceuRig1ZLNX9y+rePxwW/jCJkcr4zIQbpt5pCVmqDbcWSUV/gTAPzJEjOg9GN+NTtiGI2
	TZT+7jUs/XgnnpTHdOu82lIHBgGsLBfagV67y8baLPFzrozIXotETl9TItVO4PD0h8T7INbBFv1
	gcW7bpvz14g5Pt1KW4Rq7rpBjfIssBtUt0ANpjitOMw==
X-Received: by 2002:a17:90b:2e0b:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a8737a34cdmr26440a91.63.1791256327295;
        Mon, 05 Oct 2026 20:12:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a8737a34cdmr26405a91.63.1791256326616;
        Mon, 05 Oct 2026 20:12:06 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ee97f3sm15210795ad.66.2026.10.05.20.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:12:06 -0700 (PDT)
Message-ID: <6d290cbf-5dee-40ff-9ca9-af544fdee791@redhat.com>
Date: Tue, 6 Oct 2026 13:11:56 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 15/23] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-16-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-16-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   arch/arm64/include/asm/kvm_host.h               | 1 +
>   arch/arm64/kvm/arm.c                            | 5 +++++
>   3 files changed, 9 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

