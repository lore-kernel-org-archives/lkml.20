Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22554707E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791245016; cv=none; b=QyIces9xBfrTYRUl7MDbryfT0m2I1bWvi+Lt03SvnTc0EtMG12/YHoSldqsbgi+3sbWods62VYy8rEjmtn0vKoqGZVGYyCWt8x+xMCi1K7oNQ6ofMae0MsW+y5CGcSTjO8i0HcvxixYkkB6urxQNlg+LAdbN9jK5UJg1PWgqTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791245016; c=relaxed/simple;
	bh=r/xyKW/+NyCSyYJfFfr1Na2zRDCsUAkIxdQRW3XIkgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtfI+RMuaorunU7B9JPJiK9n34fow7boCD29dEKNEdHN1RoTuo885H2JbWNFUge1uF61lGz7fe844t19Pv9fCLdOS2eJ+SQRVu43Kjaqw3JXUGQ6VUONOVCetA9lddSE36gorAU5BHNQgj2rvzpWhQYzFnf2M7sfuHVJKws4VAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BNmfQfm+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+tIk5pr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BNmfQfm+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+tIk5pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791245011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
	b=BNmfQfm+OGz/YrDAVeDAwKWkogiP6zMZsMfxl6VN0ZxpBNhjlm16HCxLhABLWILu7548D8
	Wz+Faguj9+5BB5/KmWBH5H/75qtUw9tPF3ViNb0HEoOxm8qp65xiVrpN3gjNoARkO8SZhO
	P1ewFhqiw6My4TeWi5s3hnRlMOVTepk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-1gUGw-MmN6GAqiR2TNS_uA-1; Mon, 05 Oct 2026 20:03:26 -0400
X-MC-Unique: 1gUGw-MmN6GAqiR2TNS_uA-1
X-Mimecast-MFC-AGG-ID: 1gUGw-MmN6GAqiR2TNS_uA_1791245003
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2485324a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791245003; x=1791849803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
        b=V+tIk5prA8Rr1SVLSxe8icbMarGm50FUzoouWSNqf7DyOEG5SSRV9F3ygwNXd2JhD3
         rXZEWpjWNcsOawcJu52ACfslMx732SBeofMdRhLR04vUMuSTHA8uCPCEvzq5+DOFMvxW
         +l9lF13cOXULEciEgop6jcI7dwgW4+Z4Yj+5nysSGqRlAdDF+y4zadKyHylhomBHGk5k
         ZaiYRDu2wxCViDsddd0LWX68LFU6roCBDOljNQdTydpPnjPGIcqmp1ZBVsXkYZ+SoicW
         E3Q2lmT8nxNPhQ5Tzqh+6Xci49p9xwQdLTZYNB0PfF7P+bTrTCd6pdHZzIl5WKVwNn/W
         vssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791245003; x=1791849803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
        b=iS2beIbCs1knoh/3OKbEnz5wO1ZSGvPB4AF+vMQmMOrfJiXrsYYkYFY1TR7HSGLLCu
         /yuF0ZipuUoOvVBBkCpqtt8tnVzFUdeSF9yDzsE5fCrG6AJJgSjjm+VqtplxQEvo2sV7
         UBB9Ggql4Bw1DCD+c/HGKJx2C3ZFFy5emy2xlqYTKUgNhndoqJGnxRsNojMkdrcnX+WW
         7+o36sa7Q/qZE8kKdj3if5inGsAD2DaqiK1J91+B4GOkyA7gC9yLcveOcaopgbjOvnl7
         SD34y7cqgd4QWVzLkSc5IJ6jwZfdS0xb7YX3ybJtOUQDKacyNfRF086rqerptMTXuO3X
         I6TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxGpEUkhC99mroLgHuW853Z18oIyBLUlbT+G2+wSQRwPdEK/JWDzH34nYoZ9BS1/EeEolrLca8/djYMnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPe3I8ZWzrgLXzJi3VpUxL9yi1fCKe7dVrh0AGUdtfdh2miZu2
	ZNaY1Rsk/KkPBHa2MCbpQO3zs4d+RUsl2Z3mOZmRG50q/Pf97h7ezKYfLNTadpVNZaAXFxfyorq
	+McBWPgDzLgvQqrmH/cQ1qnF/i9ZpIeSrN2PfetoQpRDMwHuOEdwXb21Z93dVoJ4iFg==
X-Gm-Gg: AYBFou3+sS8DbGdEeJde2/CRfMYmtcTl/DfiEVQPrv488OOqbY7PLZeH0NMmJt//Xgk
	D3fkLtrczIJequVYMf0Hx5XzonL1+t0qhJ2MIbrucALMlWPc5kthDReoGRTYW+WHyPcCgQBiYO+
	cX+vEAUNMR6UteynFLlB0IPFlcuhtbNGH/Y+G//FRGqWzIfTuUdg5crjJK3neGSyDS/6i0wY/ZI
	gXJTKdYK+ID8Ga8rQdzzzfQQcM/LdA+ilPYo4MbCEIHqJV9ETvp7xVzc6kR9nvZA2J23JWS7OwG
	z1GiksGPDu8v2O64mRL6IodVRD8TsUq9tvufIUSAvf8uFsd/P9+wvFwDaxAgLnV/oH/T2Sx0lFk
	jkK1UQWlY5kcu/NPtI1dW08RS6TcpfET1GeF0mJuUYA==
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199403a91.49.1791245002636;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199369a91.49.1791245002098;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm8611158a91.0.2026.10.05.17.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:03:21 -0700 (PDT)
Message-ID: <7b196a7f-d31a-4acd-9f3f-a24c0e78db43@redhat.com>
Date: Tue, 6 Oct 2026 10:03:11 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/23] KVM: arm64: Disable Steal time accounting for
 protected guests
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
 <20261005090754.2140522-3-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-3-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/kvm/arm.c              |  2 +-
>   arch/arm64/kvm/pvtime.c           | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

