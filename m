Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51E3644CF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559022; cv=none; b=ZdsN3vZV9zo819vP7Z7xWSu7GnaXYyIR2unx4Clmk1/EWOMWpOACpdHfVndadyb+8K0U14bbTRigzesuXbtul+rdxlO8Y8s5A7UcLbdpfowntsjDroMy+aYhPWxCUazWFrLa/r+Wc1TNfoqH+F0f1CGGC+68oaxz1GVo2M78MXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559022; c=relaxed/simple;
	bh=QlLcDcQByi/cJEHmg77m0F16fpY7R0NnpMdw+vOt8yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxvpA+Gp6VWrV88WzHr/F3OxFHMl4YuUlSqwSgtSjYcqezgx0jQJX/mPZ9MkMnLMOjOTnVQRF4pXoK+0hsxc3zqjK1OYqPcl9Rh30v588eI4ASvcCwn57w+CcbAsZp5JU7drLZBQn9HRfyUIE1ZP9728vZR4WmGIIjKKboQJpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RE9Tvltf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8d68Wpm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RE9Tvltf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8d68Wpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790559020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=;
	b=RE9TvltfcFvYaiYw1TvhEU7mvEh5N1EJoUMOAPUnaIJpLIZSWuisITBw/b6uJVWVGsUUWu
	JvhLIPMKGPsC8goxx/KZYK4s8S9ABLqfSW4qU10cvHMNFP7HRoBC/VUHZCl6xixZA9yL0c
	RvWBd2Py9uO2OzwuXeoAeIawSU/XPPM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-n8O_IjdJMnuIkwMlBrIhTA-1; Sun, 27 Sep 2026 21:30:18 -0400
X-MC-Unique: n8O_IjdJMnuIkwMlBrIhTA-1
X-Mimecast-MFC-AGG-ID: n8O_IjdJMnuIkwMlBrIhTA_1790559018
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so2628501a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790559017; x=1791163817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=;
        b=F8d68WpmqK4EXEfcvz3btUj0XijMjomCK9aHCaRE7KlG/Dur03Mxgyd6Yed2IXDIg8
         vItAy85H0kNMLnzgV/Q9nvv4QRQubU7kcbgcALTO/W/kBy9y7JPogL1eM2V7QrSfcb0+
         Sny58xX5ps1fuceROVX/O+Wmvp/2TNBD96+Hc7VFB3/OAUidkyd8a0ItF4DBtLBpwGmQ
         hnPnRVs2Hzgx7JbtseF62A7wtAGNS94TslODmAVRo6vwPncxV6DibC8FxJTGsyQG/0+L
         n96mrqWwEbajYx7MZ+Y+wxIaNuIhK+NeNa1oYM/UMIXVERSwOwHYMW5U9B0fpwFYNSFw
         M7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559017; x=1791163817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=;
        b=KPGt6LjGg3vZjqrUDSQY9iZVnyt2D+RjNKntzhor07Oxeyewtq+RFWIjDBUmIUXLTo
         rdW4ctZkf2cGxYX0ErGIv3EmK9uI+0j93e0vQVsCCCxffPTfawIs5zg5dk6XKkbTTo0M
         uHq1DCV1SfZyxXRuKyuZIo+EzqY/xe4dUKj38LsjpEuAR2oMG83BQb2XVPG8TbOLb3VY
         Xf1poe9JGiiW62LddyC0oFzOcmH+MVuQBxqzV0nU5+CIOfrOUPqSsx6YD6FvG1ehN2O9
         kLr5uhzsmmD/2hYxkwQ1hjd9KvTpM6kuruz7EnsVpyHb9MN0b4M7L9a3TSo985Gh0Yeq
         5OpA==
X-Forwarded-Encrypted: i=1; AKwUvBwIhJfI0VAnuCRuiW2FKRMPRKCHkQ2YSM/4N4iIlh7PdcpmeCt3l8RqC98a/7IrQzqZqf6GOgQ+NXHxWSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMyziOCJJ0dOK4E/Lf9DNCCe/8kdR9flWEioJg94sEV9T9xIc8
	COnfCxunym2e8UmxhFdaXPSDjojDEYxlfpJzh68X9w/HlL/WAhS7TzNGZTEyZjBQYpqv8S9C5dW
	74zi0IB+mE04rePXzDMEa2tlz9lWA4YKOPCmL0fxJh3tZBqUQBShkMO4u4n+xbRiQWA==
X-Gm-Gg: AYBFou1EZqOwcdwPlWPH3zqJCRtuOrJgOLOl4MZiO1VDmLEyzwVyN9iIOvKVTrXKJFJ
	Buq9SNdfC+H5vppc3ubM3xz0iIucq4kVBMzARDrS7ZqcLuIjQp1WuGlQV9naGhmEY/+bg83SNAu
	icCtUwl6hAduxJAAmTFZjpG86fYr1ertTn00AhrJDH7uq0JqsU/6VLpOjfc9HXYxL4UUz/LvmIC
	5IZd/g3HOWlaU5IxOGSwLr11aBHk7pE8YBVRzPLiIsgy68+20EzO/V7nCFA4eDexdLh2R0/4bHO
	0RrcrUcQlpnxdppjl65PiLxfdeeo2Mi6R0Ir4m/FjFIyHkycHHY7M88PpSH79lEPuzZJAUNPDqb
	qnOZNA6HGMDmE7TNUF+OoN9S0afuJGmQ+/DKDr5XfNA==
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr9007848a91.36.1790559017543;
        Sun, 27 Sep 2026 18:30:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr9007821a91.36.1790559017031;
        Sun, 27 Sep 2026 18:30:17 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm17161191a91.14.2026.09.27.18.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:30:16 -0700 (PDT)
Message-ID: <98356890-80b0-47f8-bddf-75d75ce63272@redhat.com>
Date: Mon, 28 Sep 2026 11:30:09 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 20/20] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-21-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-21-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM restricts the access to the register states that the host can
> read/modify for a given Realm.
> 
> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>        requests.
>        MMIO emulation in the unprotected space.
> 
> Additionally we use the sysreg configuration to advertise/configure the
> following Realm parameters, which are required before the Realm Descriptor
> :w
> is created:
>   - SVE Vector Length
>   - Number of HW Breakpoints/Watchpoints
>   - PMU Counters.
> 
> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
> the configuration of Realm creation parameters. We don't support PMUs for
> the Realm VMs yet, so PMCR is not exposed.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>   - Don't expose PMCR_EL0 to the userspace now, we could do that when we
>     support PMU
>   - Fix check patch warnings
> Changes since v17:
>    - Merge related changes into one single patch for the user set/get registers
>      I have retained the Review tags, as the code hasn't changed, just the patches
>      were merged into a single one with the same tags.
>    - Limit KVM_GET_REG_LIST to the allowed CORE registers.
> ---
>   arch/arm64/kvm/guest.c      | 63 +++++++++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hypercalls.c |  4 +--
>   arch/arm64/kvm/sys_regs.c   | 28 +++++++++++++----
>   3 files changed, 87 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

