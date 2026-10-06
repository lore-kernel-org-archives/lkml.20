Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392A31578E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255736; cv=none; b=t86xA0zooZ8ctfLLIleaF4XF2t9bVMllPFWF+/MbCyJp8x9EcEvaP9wxR4OVu9B5sLkAqVH3abCSUpZu7DmRdMpvWuhC8UKRfshfZYzZ/LWtJmwEzI5H4KYQJ41ILtAtKR97H74AQlvvINZ5xSJbk9dHIEfpJC6IOWQiU8Bd0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255736; c=relaxed/simple;
	bh=GCdY9Mytk6VjiaMyjYFYbwfdFDoSlwGK8OpG5whr+QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIBSLXJ1R+5f+4Dthln/HoR/8XtAabzjsrX42pd6S09OuKyAOteqmD8DzEZtHwHR/VVGc8q25mL/cmhXjFg1qdbKKakdNikUK8h2cuM/OlOv+4aWoU5TaQCZSzN/JvlwiWHpaXYNKFTYdO0XpllyO5NcyaJGmZhxstUQxNFC5FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i94iBIAd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=krFzOlGX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i94iBIAd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="krFzOlGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791255734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=;
	b=i94iBIAdIBNYVuEJbFWbCmtJ7Ig9rtyVJaZiyETW5Pe/cDjEJY7TiVYabIPsFkvM47+lVL
	gNVz+eQxmdW8SUbaMV7uRciALvVxHxeKxp2cmRcjH5btk+KRopoyTwV5lsLB0aR5ODK798
	TvaBZDVHVlFFn9VWk4kjAiXNC4k+D1s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-gu5Ox3t7P_ybd6iJtMf2xg-1; Mon, 05 Oct 2026 23:02:13 -0400
X-MC-Unique: gu5Ox3t7P_ybd6iJtMf2xg-1
X-Mimecast-MFC-AGG-ID: gu5Ox3t7P_ybd6iJtMf2xg_1791255731
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so2535034a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791255731; x=1791860531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=;
        b=krFzOlGX5NzoR/hquDslfIFfzveQFEvoln7djnwpQRk+PpEMJjUD/KDMw+hwbnsnEZ
         RrnJB7nUNpzo5dyAyiwQw9jfGvTgEl0s/oVJIR4oYU9sTPL81edOnkyc8cJ32gMTK+NY
         HODUsAVLYhHHG+gzFkQWwrSTcryD+VmmSTTXtl1QK6thNMzHSie/XG4LN9ukcLDLIhTx
         Vr2wfIX38RLYsWDEEcKQISfnj5s3bvV9Ka59Y49JTqgQyvBKroDgAKocN7iJfGxGteuS
         QzAmyBk4ji6YttzYqegyEPMsgctn3lBcHY27HCKapNOnoXYSF/HpaJszpwR3sVUVM9wO
         a8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791255731; x=1791860531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=;
        b=okl4iUQF4rege4CXD6Y+ClvC7fVDkxD7CrSE36kzQKcpNlKYatQrE/sCnr3VSHIbuT
         +GqjVZ0jAFkxWrrG+HUEiJmRKkMGnbO2wLrbrWF62sbB90kDALV07uO9j55HdZnBbCcF
         mRShZj9kllYIeYtLLYTXe6FXaXQ7bTHlYrewN8YtJNWPKIdvY/7QPgcraocjAc+1bTO1
         osYRwKfgDGZtgb7TGxHXXsQhkgQHgwTIFuVYXQZFWwIXe+e5xQBxCCjFswi00LFXizGo
         KR2ouIAnTgPJAYplq5mKZiwjznZQqXxFWX1b0X1k0i1xKpzsdl7UyRcfnwbYaAYBzWCi
         +Yrg==
X-Forwarded-Encrypted: i=1; AKwUvBxwIcQWjiqqi4GkszzIPaXUxkEzE4o3ORNZolXwrPFUG2NEZHPJQbOZEw3s8oU+iMA6+2j/bWbuMDCcyHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzGT8wdlrmCQSdMOoljohFVoT0ml+5y45ZFh2jnW2xJQUl83Wm
	MQ8GZGAQM4XsoioZwV2smYE4jzrpnrtUXzD4WR+X6VU+LbSD7K858sj4r2TW2RiIks8zobaeEZe
	VTPu2CNeMtm6xj6dvZF4vg5Uwg9yS6MrKCZM/RF1luidIbWiwehgO+aAJqrLcSeHRyQ==
X-Gm-Gg: AYBFou2Z4tZTu+rT7XN7sX5b2/vNEnvthSmkY5iwg+120QPlBbG+XWMAMb0WPF+JXxw
	wpekcT8rDlEOICqfgG13heWj0GGjAdWTaeSGejKOpLGMor8hr5Tfgt3230S1fO6+o3TZHZsER3q
	tVd3qZISiPhUmrQ7mvbn9Ww296cb0LST4BpGsmKZYXU4oT2sUDnZmh9hN1oEa4lQcsEauu8oxVa
	gSF3Fq6vX4+VhNyyTfyNmJ7n9AsjIjgLflwnhbJKqVpy7EafSI6pc3fjUmYTvrjcr1jcqvgpOJt
	rgCIkNKWv1jGti/yZOuu8I2kS6l1B0Lxy2MF2Uo7DEyPiiIugEIb1Dvgx7i1HJp6g0X8n66ME+h
	IkXB0+fNtKzZHzN3NcWhh2VGyYkFZROSkNI/xDuVuGQ==
X-Received: by 2002:a17:90b:5483:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3a873515234mr14410a91.23.1791255731404;
        Mon, 05 Oct 2026 20:02:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5483:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3a873515234mr14387a91.23.1791255730940;
        Mon, 05 Oct 2026 20:02:10 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm2440345a91.0.2026.10.05.20.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:02:10 -0700 (PDT)
Message-ID: <7a9f554c-f39a-4423-a84e-a4766c7223ff@redhat.com>
Date: Tue, 6 Oct 2026 13:02:00 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 12/23] KVM: arm64: Use a local kvm pointer in
 kvm_handle_guest_abort()
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-13-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-13-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.
> 
> Introduce a local kvm pointer and use it throughout the function. While
> touching the code, fix the missing whitespace in the
> kvm_is_nested_s2_mmu() call.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

