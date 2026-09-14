Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1C39EF14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365803; cv=none; b=Vcl48XQFIsnMLec0M078mzOGVOseu69+J8dIbMuVvCkWBLeSVdENUGYZ7ptlJGV6xGX3VcBhYyS59yhlPRVN7eS5a1vX2K4LaHvFxD1YlnNQ9AAo2Z8gTGPYVFXcANrLu6XNHnOuI9cnhagCzfxeXv2+1HcHnrrAw/Nlbl7Ds8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365803; c=relaxed/simple;
	bh=njoVli9hHhenuHq3sa6QXSMoKZCUPsuuYgMlcPNINFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovPoJPUXsSjmYIGeLqgAThtQ4uBm+NG9msLQBDhjMIkca7u9K/LEALER02astnXbIHkZRvqpWr9FjU8bGS3M5FZuC4BjrqqAMIsTqohIW77TY68oBNYY9i9RGGLuUV/rPJPZgfhrWZBO2t5w0ZCDDThJbAfZiEsO+mGcm2Vo2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iUw30D0C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RteeeLf6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iUw30D0C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RteeeLf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
	b=iUw30D0CUljkwo+ETF6XZ9DVWtuxidPIUrtX703gP1IO3I7zvlQWJWOREp+M8/+8PZv54l
	PuxIkSbkzerKqXnsjU1EfSa+9qECXglyD20fqdlyBlMp8QsUjZ5b3hPkc3hzQM1wElMER6
	IbXh8GS9aLMgtQ8RbLYg4o8zHKf1/f8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-mjzcEu9IPDSjQxpgoEInew-1; Mon, 14 Sep 2026 02:03:18 -0400
X-MC-Unique: mjzcEu9IPDSjQxpgoEInew-1
X-Mimecast-MFC-AGG-ID: mjzcEu9IPDSjQxpgoEInew_1789365798
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso4756759b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789365798; x=1789970598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
        b=RteeeLf65qfUjL4BjsnWcdDfeJg1LUfD1Ub2pRyuI+zMCFg16aer1vXAHSzDlSyKCc
         CShZ67Fy0CDZep8SMnhgBkb7Cr6hKykSjiOAtpztCJmTb2Iz0RMuP+PPMBcQU7ounyAJ
         wMiJJl0Ce7N0mZaYCyJQ3unjS8PZCJE8P7VietIbDFIhnusWsic7FR0oIrjdaz6+ALy5
         XZy3PHDooOqcVZMducBUexwWfw/Zl8a4kg376i3+EXxPvbPba2Odkb3ECMOM4ca43gPz
         /M9K/bV3JIwRy6Ipe+hAWb6ltSvn4gCo1ByVejQUQ6zco7ir9e8x1s9cdmY5AuXhR1Yw
         s4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365798; x=1789970598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
        b=Ee7PgG3Dz/9w3GJJaA1rJYPwC83ej7BjDidrxJoZtZ6TFLVH5fdGTOXWt1VXVW6stP
         G4GKEEXkjStI0Kg/cT9BQTz90/RluPtpK1gWYi4aXQ04zMHi+jL9fjKOTp9rOUT4g4HV
         D89iGy7rZs6ITu8h3gNACoQcI6qRFZjsjsafNjyRW53GCVAKMpfuCj/GFerc1Yk+nREi
         KDgpZ6JAys+S6rt15R5l1BIv1Kc1A8+DvkS4byb22ghqpMYSkZKOEfuFoiDDY0jEXib1
         E9lsWGMSQNAsJdXmkim1UvyDdFHNtRvLIt9EGU+9NcF10iFjUlgl4Fct8C9mCgwTQL60
         Q6aA==
X-Forwarded-Encrypted: i=1; AKwUvBx2Ae6s4YutlVkHKRzdJhz+dEeJ9CHziTD6Thd3q00zPEeYylleHOlm9VXsbzwvbfkk5MCCOi/74t/bURY=@vger.kernel.org
X-Gm-Message-State: AFuF++lu0/ORnkR5z4PL/rgBqhmEKmLTzxRVRMHMz0yGSbEMU5WBwRyP
	7LQHDtoFDvbb/bb6ylhRML2whvc/Vgm44LD+H2ZOd+EwgOG6usef0aZXIaE0haUdK1RiqlQgLKj
	JU9E4NCKLeB3+Ef/+P3uVnsP/nSZ5LmrdHe14xZmwgp96lUX7wtk6rM9uKAR+Lo7+AjxJnrBktA
	==
X-Gm-Gg: AYBFou0Nx3gmVEXHFciSPlYVWFiH8099Tmf0qWHyoDfeHQAEzZuJZcKd5mbM2VtYcqP
	g4L5LMmk2o30DG8RIyVRI+NvIqIm3PjxbIJrwQM/snn37ueTmDZ/1U1JWfcofQ+aremNuHRL3R5
	jzZX5N9JO8/WDKMxJ+hePIdXoXy7gRv3Jnmrh57mdNJRCu85nKHJZnx4/YrqIIkroq2JIVRn3FB
	NFfxJmHD1QP8pTEHwK09RxCoW50+mL0LzK+nhKc5f+DeCel/JwHhliNveOzT3xec7zSvcWYu/Ax
	KlhHpYQiGXTN49weX0Tg/pV5szpFw4cXhHdAZELd2yF0b99GpNSvTtvS0nsprIrLx96rFe5vIKH
	V/T0kxQT9Ggtz132IIwJCwlUyHURLd7TWWwWRnpFS/g==
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512994b6e.29.1789365797660;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512943b6e.29.1789365797101;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm23715686eec.14.2026.09.13.23.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:03:16 -0700 (PDT)
Message-ID: <647592d0-d488-4fae-9deb-ceca00ffe52b@redhat.com>
Date: Mon, 14 Sep 2026 16:03:07 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-4-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 2:36 AM, Ben Horgan wrote:
> From: Dave Martin <dave.martin@arm.com>
> 
> The control value parser for the MB resource currently coerces the memory
> bandwidth percentage value from userspace to be an exact multiple of the
> rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case rounding, since
> the bandwidth granularity advertised to resctrl by the MPAM driver is in general
> only an approximation to the actual hardware granularity on these systems, and
> the hardware bandwidth allocation control value is not natively a percentage --
> necessitating a further conversion in the resctrl_arch_update_domains() path,
> regardless of the conversion done at parse time.
> 
> For MPAM and x86 use their custom pre-prepared parse-time conversion,
> resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
> the value twice on MPAM systems. For x86 systems there is no functional change.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core code,
> for now.
> 
> [ BH: Split out x86 specific changes ]
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since v3:
> Parameter order swap (Reinette)
> Reflow commit message to use 80 characters (Reinette)
> Adjust comment line length (Reinette)
> Add Reinette's R-b
> 
> Changes since v4:
> Make Dave the author as he wrote the patch
> 
> Changes since v5:
> Document that the rounding can be up or down
> ---
>   Documentation/filesystems/resctrl.rst | 17 +++++++++--------
>   fs/resctrl/ctrlmondata.c              |  6 +++---
>   2 files changed, 12 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

