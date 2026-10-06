Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085027262E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791252942; cv=none; b=J+WvaCBuv+ffMDwmDulXsAvgtpxBVxMlQhwxOetluhWd4jCQreeunQNolk4iRmLsDvTE95VHRAjd+92gxkWlyMmfDx7nUoDuBRVJPTsRcITPb28exDigalKo601SqYvXOCT7KZRsVhgZ9D7Gk2teMdnEraRUMkeLg4iLUEFMWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791252942; c=relaxed/simple;
	bh=Sx7g8hsp4aXStbrt4GpenXWJBZXKZdDVSxLF4rORla8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NF/+DM+NQ+zPrADZHfg61+/DmyD7yDgWN55s/rSlMaHr0yD+KB/CUxY+XFoZy6Pt2cMzLAMhGm0nyFocoO/s5julI/qvIcR2BJfY96GW97jpM0ePFFTrDObACwk7Mir7pqlwtXn0SIZ41pL6UDgBBX0LBTz3Mq3UxM2Dt2DE7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5WafGFc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hf7riFjl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5WafGFc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hf7riFjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791252940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
	b=G5WafGFc4YOxYm28QAizVYszBFEn4sv1QLo7oCrIfdQc7/sRXo8JjaUU4dgWnF107SWaU6
	ycxNDdQ8msS8B0V+EJAgtMtWjtxqrBFeln8AYefp+0QSRBVgykGY744yeZQMuJyh8F4ivE
	lTmCNwD682IJ5DIsrMMuMqsujLf3Uks=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-GUrP_ZJENDuqC7PjUTPlCw-1; Mon, 05 Oct 2026 22:15:38 -0400
X-MC-Unique: GUrP_ZJENDuqC7PjUTPlCw-1
X-Mimecast-MFC-AGG-ID: GUrP_ZJENDuqC7PjUTPlCw_1791252938
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so2321440a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791252938; x=1791857738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
        b=hf7riFjl1KLANNHYnHChtBXrqI7R4BKi+K2nm7uP5WVkL7+MPc2hSDo9Jagd90fq0M
         VOF8FP2RfQ1KAqovQoBFQji4W/iGYHBZBUImINMJ5r5xUQYgEgGMkASbnplUzFQIZE7i
         /Ls/L5weeKlZAxvPMZfVeeuAQwt3MVZfgugeSQWYCJ+NMjGP0tT0OOIh31eq7VX5CJ3n
         YqoQEyLblqzhfW+3CLZq8TwT3PBCf+T0PcNTf0iCfmot0EAg3pcDcNlgHn+MRgElUBFC
         J5CB8FthgUori/G93T+eRwNRkwZPEANxcC1SY/6FDATuAqYhlYkCj6UYisVWM5ykaMAZ
         fr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791252938; x=1791857738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
        b=qHpSx1WRwFsfBmPmn+JQ5iUbCiJeSHJCYRyGnKzMJucB+rTM2c4Sutsz4DkOXGrtuG
         2vMeuIvEr/73sWIuNI3C0XhPNg+ntQy+HNMFQVTTPbWLjfyAjRGBRIHXy9uWcdK9D7GR
         BB4vxZhLYqD8xJeLg0oJO/bFj8qsyOcDyBWy7v4XBI5cNGsA9PJ3jbRh/gt0l9TH31I0
         ovrEihjnNilrYO6sY1HsY6/Btu0zvluEFBvMkscEl05f9QG+xMmbgxt7Md5rgLFs5hcd
         d1cCpk5K2qPm+bDVx8Iy0jQTE2OB/T7qUyAGjY9rjwJWgv0K84TjShf+BJtPpDpVldtk
         /ZzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZdB70C+ibBBiENS6D+enNEKId0mSpw97rJMJs36Ns8vEOfSeMmAKSYevlBhfAUflYpGwVNKDVdRS2CQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuPPSla3e7031UyQAsz7mqa/+ZRtfuSBmOraW9bA0X4+V+QJVJ
	4zlt9MCwZXzBcP3TygeUeb0EAUZ1Pb4QrzZv6CSOmrFWQDmq91tWxDFUscM46hCYb73kwVvmL2m
	d3gBRL/eQhn+LmuUSbbW9+FOmafY7rdugaOSqQlc9uEpGWAi3WbXJ3WU4g1j3Swft2A==
X-Gm-Gg: AYBFou2m/y+OuGsK4jlrXeOSFZ5MqmJhZtMOp+VvxPBJVSPdZwGeqM0liIs1VkmshGr
	sQKmuM3Uc2ysNtRaBoOoU++2E4+5zJJVJC4KAXhpB6qzEUZ7slWv4tlrAdtwoypDOB2+9OpNrRo
	A4CqsjRH/XSHC04GUrzKj0os2fFyMNH9GqGprVoug0259CkOGz1HYvOPAruybUzKp/tfMrlUWSw
	SIK636wE/Zffbiu3fWoeH9Mofu0Ebuys+PNa4Ew1FbC2EqK1DDWvrrODRTA3HGB6sIKWny+FgS9
	NK4LtZ6pPjCbvSm+LDxsckvaBC9R0yj1XbNjtFwQ79//h65id3T/97evrbpSHT/RI8ntf+TCPdl
	qkzpox0eVcgnKTD2Uxk7P56pW8uzzOKaYs8bvtE2yBw==
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922652a91.37.1791252937702;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922621a91.37.1791252937271;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm5404856a91.1.2026.10.05.19.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:15:36 -0700 (PDT)
Message-ID: <0f463e25-1536-473e-809e-6a358f27275f@redhat.com>
Date: Tue, 6 Oct 2026 12:15:27 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/23] KVM: arm64: Add vcpu load/put call backs for
 flavors
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
 <20261005090754.2140522-9-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-9-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Add '&' into the KVM_VCPU_OPS() macro
> ---
>   arch/arm64/include/asm/kvm_host.h |   6 ++
>   arch/arm64/kvm/arm.c              | 138 +++++++++++++++++++++++-------
>   2 files changed, 114 insertions(+), 30 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

