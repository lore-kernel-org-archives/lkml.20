Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED7149C7B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294622; cv=none; b=cj2ApT9VJ/Mdn68tiw0QGk7c54C0G0MRsNwUcgGG66PBY5ikWoGu+1NfaamDmov56zfZlHOtmyCKjNi+SlWIu0KFYK6rEb8eYhZOvsVQmI1AAaEyFF0mQ9oB/URCkkMRsOoFhIW9EzDJ4PCY814zXQKZajCvnrvVpna791JmuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294622; c=relaxed/simple;
	bh=58hYY3yihzi3KN5FnXcSkwBcSphKQIyF6se4Nsd8i3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4N5T9rHUMg1CM09tUORPDBa6MfrsZCqiAjbMvwM/wrpddAMx026I83AAyVLNtJw2cLEDkW+ILC8pVODzaAOQgPn8bwYrsGLKyEiiaZJKnsOJ7i+q4A+ZO7Qlu6+N1JRvJO8ld5QMn5ceryfoIOlWWm3wh2u3rRl+mx+745oECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzsl40gz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f9yr06I2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzsl40gz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f9yr06I2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
	b=fzsl40gzpR4agNfy2jv1I51KxzJB/tobeZo71jseE0i9X1skp1n6VGxlDpBUsJNEK6m/HS
	/MgZJ6DR9+rlQPc5/R7z0+q7yfTfb10GINk/rQTVvjeBP+KJzVdXEGAo93L3Vo7lBWOxjO
	0Rk79IvOmhZCKOKRltufwHi+Il+te6s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-sSj6896UNZGHggd_wKVJpw-1; Thu, 24 Sep 2026 20:03:38 -0400
X-MC-Unique: sSj6896UNZGHggd_wKVJpw-1
X-Mimecast-MFC-AGG-ID: sSj6896UNZGHggd_wKVJpw_1790294617
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0b6ef90fdso275399a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790294617; x=1790899417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
        b=f9yr06I2IHjERK5HPk5Cf3TWBSrwTME9fdUohkt9hdwAmG1kAhNGy/20unqUpOit9j
         Pkuud4pS4l7Z0lvCgmdN9LwEhTqzExKA/joh2fOskauMPhyte+MesAOwRqa6mr7X4uKc
         q/borjY8oaq1OeUaGh6Y1KTBsGG6emZ2+oUcCMKZx7OMWwYB3aw9YChobG+dxiJ2pvOu
         Ah/5EFdeF3ZvDusAhtPX5u2C3Zd5RZ8w2P5W3ouVVHgWhQG/kk5DREYB/155yp0eT+1b
         O0XzpcEMVTv+lHMgbc5FvxVAK4oLTWhV6ChhhXclBwdsb4M6EdCelwgZVtmzrJkrkWjb
         6h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294617; x=1790899417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
        b=m/SOtUBpO+islkOPvzqxh7Ijl7GhpNAl9GJbO5aQdiC+PRdZVIolYzT5VgBhpkp0NW
         rjNGzpo1Ghb4VeVVl9ZP+oy3eQKgNhE/mJHGcoy0j3/f8RDhTQLPqrGEQng5FRjboLAS
         3hX813q22hff5qWha/vRjithKT/fbGvMQpNnuYlD+QtVHnB3+p/xptzNyzTDvCwa35kj
         1T1W5PpaM8SPnvIJV0bRg+VxvDZADajlplCpu12RWnueoMhQy467aL1dP3tdecLNoSl+
         WU2CDyH5vgqCWilHGYfrdagYb/+tAqhbN0XCVN//TdeH7ecfvsVF3GwLtW3fHj4mB6Oo
         85og==
X-Forwarded-Encrypted: i=1; AKwUvBzQu7+nh9Qz9aUVHmH5GTae3jkQy4PiJ24yoF+5H375jIKOM0XK4CXue2uT9WMrK2SaSsf3SKtzNVlXX3w=@vger.kernel.org
X-Gm-Message-State: AFuF++l06Zklh3dAhfeJao59ssvLrOkk8WlF3Z8Ej3YnhsLWZCM4gESo
	Hwzn0oha42CeNzSiLJbbdy+l9XLBeB9aCTmWltnof5B7ICu18LpaITqcjYYXy+iUSiqnVDjfaXQ
	g6V4zrkzbrajwcPhiXUUqg2UWDOhaHz0JaQ74lQxJ50X3NosxIvDXa418u5wCfaYeSw==
X-Gm-Gg: AYBFou1Q89EvPbaRu1Xou/CyIpS+MMO2qBaqve14BICmSEew2MkAJRubxCf1Dk1IsNO
	OPz0MNWCyq0HRjpcPQcS3goV0lh8JrTKLeSymY67cRDD9qKWwzrpePkVyGMMIE5JrUQHQ86Jgym
	Pr03c/PAs1IIXmBOcAa3WE22lv/nOozbXXHmaJodxDC7RcxqopZxpLh4KnapvMOMhlEi34K86NB
	M++wKBxIayjP0OeUGReflk3sJVNxNGYdBRQCHiptfG/WIM8IfqlxTx3OrSAA7Xbwezm6nhTAWrb
	poTuSl4luQIukkHBCHKU1AZQ8uYHudS0WsFjTfMFAjb9nDgdwCMRx0sjOU75Ite30JuMQ/+mi5B
	IzfOxNdcRlDeT9kgvF6mQO97StPCW/C99qIKFG+rc5w==
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225059a91.66.1790294616815;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225029a91.66.1790294616280;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm7318263a91.12.2026.09.24.17.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:03:34 -0700 (PDT)
Message-ID: <cd2d60d7-fd6a-4f61-ac94-2190d364229b@redhat.com>
Date: Fri, 25 Sep 2026 10:03:26 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
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
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v18:
>    * Move the rmi_config_set closer to rmi_configure, drop the comment
>    * Use __free() magic for rmm_config object
>   Changes since v17:
>    * Move rmi_config_set() out of the header file.
>    * Print the error message for rmi_config_set if it fails
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

