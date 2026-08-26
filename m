Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97018423E9D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759483; cv=none; b=p+xdMNKai8g9Sie/g8LoL6SZzDBvjLEw073VP1wDUXVBwD5qb8qtVjNIJr0e9XYmffeYFYmw/xsxm3cf5tCi+YjASqGTpE3DZjEkm435LVIsXHruvJQZid7QCJnfeuiiuXbg7tMvXimmCdg2WqkfD6uGHHcXy0b1/WCoBLXSzTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759483; c=relaxed/simple;
	bh=KssTm3LFacwHpJdazg/gZ1oAwfHEd+OExs8ITeP7ULk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYghrpkFhYpHxjafXLp1UzPivW1rtYVPUCH3b9IiKNvQMUnhxU70yUztFmfQRRpEZM5vY1XHeRgSFy2Re43wrkHmg8aBsbR/WZPDpDA5/Ksac6T3wJIJm4gnPWD8Fva3LVLsBXLlLDjHiiBKJzK7V/KgwHjaNW2MZyigpMn0pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkrcqIYW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZFSzJFgJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkrcqIYW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZFSzJFgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
	b=dkrcqIYWYJX5W/qfiLe9L5guY25x7yUxZLWC801CstOZEpfpZB/utr8v+yKxo6wksBmZKQ
	hs977HBVp3ptBUVTryAQrhmzsX/ciIJdmRHNwtCwZTD31bZ8F1dLERwK4P7t3olvZ0lPu1
	IKPKbHJ/hLh2/0+zMHCOJzcn3lKdH0I=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-700d_1rBMRygQcOIyqamWA-1; Wed, 26 Aug 2026 11:51:12 -0400
X-MC-Unique: 700d_1rBMRygQcOIyqamWA-1
X-Mimecast-MFC-AGG-ID: 700d_1rBMRygQcOIyqamWA_1787759471
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so11110065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787759471; x=1788364271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
        b=ZFSzJFgJ9o4ZGeKEQQyuNUveyyloV3PoB3tolDV0ejGKnvnu3RNTz90KMcCDXDMEzn
         gQ98kSnNY2gAWZ+gFdlXTqPUrKX+SZqjxSyoqy3SjXk8pgoAlMDc5JlikK4re6p1clmp
         b2PXf7u2Iz4HNCrRcfNU+AAQRG4dH62XM3h/vsi1E3kpOqY1xyCCyBGI73m+w5AkRuSU
         HDMTgiw/F6mvyaMLpndv13e7qbCJCQ6Hfgtnt6GckXu9Rzr8FO+bmFBmQVPc+m9zxGTq
         nmP9ke3Ki7riI3+xeorCAHBr1MlSDVPhAr/tRAXxaJu4s+xfWZbhODJsnDuSceFbAA9o
         /MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759471; x=1788364271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
        b=H0Mipxyr2ty8Q/irfNGYKpDOJFEAKOMC3p10R4sMfFN09/OYCeZD+bsTTwcaSksnQP
         tcsMn6r+qB+FmBrOaHNW9s7UxludCwl7qiDF/di8C1o52AvA1WH1JKA44MSMbmZdLPlv
         xlWLpgHeDwP7+eOCDXnBdsoUidV7f5cnGtnT9NTAXmd31+ygCLh4UXoS35vCpbNTb9TZ
         b0dwSlC2Cn8gNU70GE63SHrv4FxLyWGeXvB/4Ir1TDGqwzF0/tdSZE5Q70Tyf8a4lvA+
         i+RfhryfmliNZTv1hIqHpnWKZ047vN0Mnz1USbM1ilJtULlezjTEhd/vS6UI4SBbAoHZ
         ISMw==
X-Forwarded-Encrypted: i=1; AHgh+RpCPj9EJr79ZwcdmnS+HNoh66/k172g/nCM5V+KIUtrxcefLI/x3wejO0S79uzcaKrjwx+m9yxbXymdotE=@vger.kernel.org
X-Gm-Message-State: AFuF++lz4QqOCPcxXPkFy8d8ZfjdALEDhOZzgZae2mYGVrT7DzZOCZaq
	Ca/M98smLkMJOQEltXGW4Uc6jBLNlms8uf76vgy5Ruvu3mMxob3VYq+KcDoTvoqDmwpDghOqCDr
	QMrGr5+WRxeO5HwunftanoSp2cPVrMHvOtCe3SUHPMUfxZtATr1kTRmsClqxURRRb5Q==
X-Gm-Gg: AR+sD103pDrZzsIbwZ7MmzlTd86ETovcCyAYTK72yE3pZU1vjsEt3uJ+Dn8pvdcdokf
	pS9UkDktfSr1m3Qd1yYm3UmjAcgsZZveCUGDaQ1PEkI1jAwWUTAl+yFQ4PsAWN5IrAtrQmOzQYP
	hhXTpco2D1N3VbaggHYiQTOLwA8cZxxYtqQEw859Xzm9PCl3Vxem5OSGEqt9Ws6zLGzKGKgvIJj
	OE+JqpOh8U0wLre9wsh2p6z2Dh0OvBmyX4nnVeoBiT4yp4lLLYhBqJQrwMGKYqn3+qw5UYh0tEG
	tZyP9Y4cQuL130891TO1OcdDzaybx+Au1bY1VUkfLtqLR7LdMdArhU+GwtO/0cJau77mHpsUPJu
	NtuBKnbY1SvPbYXXv
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155457375ad.2.1787759470985;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155456345ad.2.1787759470546;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bf8978sm9118965ad.57.2026.08.26.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:51:09 -0700 (PDT)
Message-ID: <ac453410-67c6-47b4-ae79-fa682780fe49@redhat.com>
Date: Wed, 26 Aug 2026 21:21:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Bradley Morgan <include@grrlz.net>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
 <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
 <ao2xc027TNYTwBA1@willie-the-truck>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <ao2xc027TNYTwBA1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Will,

On 25/08/26 8:44 pm, Will Deacon wrote:
> On Tue, Aug 25, 2026 at 10:43:48AM +0530, Mukesh Pilaniya wrote:
>> On 24/08/26 7:37 pm, Will Deacon wrote:
>>> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
>>>> Several kexec_file_load() image probe functions return -EINVAL when
>>>> they do not recognize the image format.  A probe function that rejects
>>>> an image should return -ENOEXEC to indicate that the image is not a
>>>> recognized executable format.  -EINVAL implies a problem with the
>>>> syscall parameters, not with image recognition.
>>>>
>>>> kexec_image_probe_default() iterates through registered loaders and
>>>> returns the last probe's error code to the caller.  That error
>>>> propagates as the kexec_file_load() return value to userspace.
>>>> Returning -EINVAL from a probe when no loader matches is semantically
>>>> incorrect and misleads userspace about the nature of the failure.
>>>>
>>>> Return -ENOEXEC from all probe functions and their helpers when the
>>>> image format is not recognized.
>>>>
>>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>>>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>>>> ---
>>>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>>>  kernel/kexec_elf.c                | 4 ++--
>>>>  4 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> Hmm, so after this patch, are there actually any implementations of .probe()
>>> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
>>> a quick look.
>>>
>>> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
>> fails inside elf_read_phdrs(). This behavior was previously discussed in
>> the first patch of this series [1].
> 
> Fair enough, but I'd have thought it would be easier to special-case the
> one -ENOMEM path instead of changing all the backends to return
> -ENOEXEC all over the place (and hoping people don't start returning
> -EINVAL again in future).
> 
> Will

Returning -EINVAL from a probe on format mismatch is semantically wrong
on its own — independent of how kexec_image_probe_default() handles
the return value.  x86 bzImage64_probe() and s390 s390_elf_probe()
already return -ENOEXEC correctly; this patch just brings the remaining
backends in line.

Also IMHO, checking for err != -ENOEXEC in kexec_image_probe_default()
is more robust than special-casing err == -ENOMEM.

-- 
Regards,
Mukesh Pilaniya

