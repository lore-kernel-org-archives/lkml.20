Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46148820A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529972; cv=none; b=nsRdHgPI3HONDzqHxNNPhEKRkUVqwg9DfkckLKrdvNmi3eXU00DzLWis37xYT2HmHFbvV7JBywSqfMBy6w8ia6h5fjDPLxSYPvBssPvNOSktDy8MTmxDuOUDyIBO97pqM5j5EXe0rRu47iVEhnRiSbRj6PCzPWMPIwyKNtl5HOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529972; c=relaxed/simple;
	bh=cbJnf8w+Y5JNyp0zuHB0ouQjulCvUDh/QzcYV4fgdew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnAFd8D6sxfv/e8GST+4Hxcpjf1xipZo2D6eQReh4kQYxJZaboV9Aq8sv1DC/4gVaRkhAZBPBszpG3ZZG9af/7m91gvY+3gtUwfjgpnRcxVEWu2fawwpPlljbrn0RKPsgB9mNXmLGOgg1MJcsYPPqVCWretV9eF61XBjyF50Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcKOjYvH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcKOjYvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788529970;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PO2JPImVYoYhZX0bdNIxqdW6FWQOlugQ0UKBvGT+L9Q=;
	b=RcKOjYvHzj+Q0YGnKJHuET7ulkhjOxHdtihgQvUiGnN7I1AiKVeLrqN+DnisQlqEYKcduO
	wGpTch83PN22bsxqLMq8go4o6ppree8OL9pdfm7YDekUpiITaQLtwO6BHuYHKGeogCK3ca
	azHtE674odhkVoF3WmhRQ30u8uviQz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-AJTDqWH0OIiDq-UOiU9cAA-1; Fri, 04 Sep 2026 09:52:48 -0400
X-MC-Unique: AJTDqWH0OIiDq-UOiU9cAA-1
X-Mimecast-MFC-AGG-ID: AJTDqWH0OIiDq-UOiU9cAA_1788529967
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so18189045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529967; x=1789134767;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO2JPImVYoYhZX0bdNIxqdW6FWQOlugQ0UKBvGT+L9Q=;
        b=rdvfknb82DRS2GLcQpk8nGFVIiW/hk53eDSfBveGWEZkuYdfxvPQcgMVcoPsBAw/lH
         IMtMkXetYvO/9dlJlqW2lnASJBzqNzpM2ej6NkR9JqxbxFXzpCF1Ze19wATKtKsffRwz
         TSkRoSyxTS3da1I67w2FRPNYg846n6rsUgRNybBxSVpm9sJ9bGa2Lwe8eTw14E7xPRQX
         VAKXWbOligjhvfyzZFOvReDA4rysDgpDzSD2lF9K/kj7ILIh86hqWKtgeIhngWITaKNQ
         jm9Dp0hux+b3psHuQjDb3O4hLcFfUkUs+wez2ew/2EuSrv0hnjctZNy4oZc+MpDEU1Kd
         0BpA==
X-Forwarded-Encrypted: i=1; AKwUvByOAJ7aE0evwYIlqQUXkU60wlQ538KKmkVET22N8GOmElBrK/rYrJW2ORhTmlOlA26g3cMlZIcz7L5RIWM=@vger.kernel.org
X-Gm-Message-State: AFuF++meep+Lmkyq30lh9q3pfUG2Lejureio2NdPxglU3+wf1eIu5iOO
	aePCWw8Dn5frl97znXJ0pSb4cnInC5TDTjxweitY+Dg0f4mCzAyS5ZwRberc/86OddyWgZD+Duy
	s14SFrSYr9Lw+XqSxiBNiYVkB4wNC2Qf20QCGybT/+jFt1i8Rj/Mpn3IlaktO2glYfQ==
X-Gm-Gg: AYBFou3olnuMfqmYDS5PvA/FFGK3EITeMtvq14w/BfQrPKSXcmrv3KJVdcWB7V4zl2G
	rLJI8N1ncDXXGGqOmooKgtwy3T8kO2qGWScJ6MKMPLR+fCo0jTlHPww+OcRa+2YygNvlD8LvwB9
	q/6A4UhjJbIj8UYZdruuldvex/UCJoTzMXCHc1yDdTNiYZHuZ2fJiArJTNODY377QOSC/y+yJsM
	GR0JpcqDx1Gxh+RhKWiILw21hvMmGG4KuK9qPvcbhUxhjq6kMBbSF55CB8qVkpNhaMqOXjO+pNK
	BPLtLZ0F40AmXPvD7aSddJY6G/V+//c1WcOCDoMLnsOVDo6559GkasJKy/5w5MK2+mulA2GqKl2
	+ddGAXkObuXZogRZTk/fe5XUfwUGmHgaQZ8uPSZYOsQK2belh
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr68105965e9.6.1788529967407;
        Fri, 04 Sep 2026 06:52:47 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr68105315e9.6.1788529966874;
        Fri, 04 Sep 2026 06:52:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm199544355e9.1.2026.09.04.06.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:52:45 -0700 (PDT)
Message-ID: <c048e397-a06e-4e58-89b9-f6feadb632f2@redhat.com>
Date: Fri, 4 Sep 2026 15:52:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3] vfio/platform: prevent read-only region mappings from
 becoming writable
Content-Language: en-US
To: Abdifatah Suruur <suruurism@gmail.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mostafa Saleh <smostafa@google.com>,
 Pranjal Shrivastava <praan@google.com>, Alex Williamson <alex@shazbot.org>
References: <20260903092907.419-1-suruurism@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260903092907.419-1-suruurism@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/26 11:29 AM, Abdifatah Suruur wrote:
> vfio_platform_mmap() rejects writable mappings of regions without the
> WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
> read-only and then upgrade the mapping to writable with mprotect().
>
> Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
> its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
> drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
> prevent read-only mappings from becoming writable").
>
> Note this is defensive hardening: no in-tree platform driver currently
> publishes a region without the WRITE flag.  The guard costs nothing and
> keeps the mmap() interface honest if a read-only region ever appears.
>
> Fixes: fad4d5b1f042 ("vfio/platform: support MMAP of MMIO regions")
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v2: commit log now states plainly that the read-only path is
> unreachable in practice, per Alex's review; dropped Cc: stable as
> there is no reachable issue to backport.
> v3: use 'commit <sha> ("<title>")' style for the vmclock reference
> and point Fixes at the MMAP support commit, per Mostafa's review.
>
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -594,7 +594,11 @@
>  	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
>  			&& (vma->vm_flags & VM_WRITE))
>  		return -EINVAL;
>
> +	/* Prevent read-only region mappings from being upgraded with mprotect() */
> +	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
> +		vm_flags_clear(vma, VM_MAYWRITE);
> +
>  	vma->vm_private_data = vdev;
>
>  	if (vdev->regions[index].type & VFIO_PLATFORM_REGION_TYPE_MMIO)
>  		return vfio_platform_mmap_mmio(vdev->regions[index], vma);
>

