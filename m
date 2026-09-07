Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5A31F9BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757241; cv=none; b=Rxue3UQXyyYJgFfUhK8qw5aFRdQDcpNah9SC0Q7vSuGP4//FHdago1DGZphC/lyhQRJubsBdOyHrek5I17CcownOvEHK0IzupBg7cuTJ/UTua0JePEaEiUn8kA3AHnpFFZ3oAgU5q9y7fiTPRV3eTghQHbZ4o5PANYXNbAYG4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757241; c=relaxed/simple;
	bh=m13jlM0aP6j5oj0lANfhDui+uOQDFRS9ehEgA/kE9SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzSjGt/PtF+uoS4XtysBCLCJR2OpCWox84OOpT8XWf8DFMkOLWFAdY5D3uT2o1DG317WZlACe9clsWTs0RegAiAkqUqkcA105sCZvh6UZREK9teQGsT/AIODVJMemPDyTpkZuRjdRemoaCZeDyT0bz5ZdLmXn4n13Zr+j8HKqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NrHWrNGX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NrHWrNGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788757239;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BI/jzANrOARGDIXcKheERMiLJwfLYURx+CbsUCp04Qg=;
	b=NrHWrNGXkcSAKC9SIw5P7eitlIJxoAPuGwuFISkX8mgyr6aZWmQxf81A0k9/BDGGRlz3an
	kysh30a5DGgxdi0025/ulP6V+npzZojIun3wEyo810DHBigD7GHmEedIdq/jXVXMJ4Nvpn
	L2V6hz4gs7P03MT9+1/jCfZX5s9dfz8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-4tJPaoGhNEm_VYboRLDN1g-1; Mon, 07 Sep 2026 01:00:32 -0400
X-MC-Unique: 4tJPaoGhNEm_VYboRLDN1g-1
X-Mimecast-MFC-AGG-ID: 4tJPaoGhNEm_VYboRLDN1g_1788757232
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f4bff865cso1604190f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757231; x=1789362031;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BI/jzANrOARGDIXcKheERMiLJwfLYURx+CbsUCp04Qg=;
        b=gqn1M8WSGfdv/A7NJ9Q/N4NldV0BJGSAmTzajgsk0JxmQra3xPfIy1wRWAoNMaaTrT
         X+2yzQxStSP8PcN8+4MsM7ww7yEnxEaIGgjWWW8R9JD3Epth4CxA1YfSYXrYZKDj4bwk
         MIcYgJnZWv7RzrAEAJuS8UPK9dZr/aHd6n9pmzGPOf4qGgyC2RJykSi50cqzbpFwSujf
         0w9pDN99xiW8ZmyujIIKeDgTa57tXHNem6rNwCTuS5gr5Q1hn7MyNgzhFQ3enxxlfiYR
         c/LeVJbzLv+Ik8vI0njHtsJHpcGU+JrSqylUcaBCTiPIpiBo7jJn6IsI5eQTKv2Fk9yf
         PCrw==
X-Forwarded-Encrypted: i=1; AKwUvBwgp5CoOT8QtO7oYr9Z11Ah0FMthgi5v7rOxzzQDp/QvXkptpUTEyjTdLHjfuTlSNyWexQWOjni+sweodM=@vger.kernel.org
X-Gm-Message-State: AFuF++mFlMnoAzYV8scFHypjCFjelsibSTmckWJLDgEq0W8OKO/Jk+Y/
	Cq9I9IDtIH4UQIEZ7yegBdhnS/jW2kVAfZN8aFekSFElEkMy8zJNZyX/tsAIKuy4NAF4JFSTFEi
	9v6TUmHpcbhXLhxugtJ9FYk6EgKP6I95+vKZqqxKcWa0euoarL3HalWLAZrzCRSBt9w==
X-Gm-Gg: AYBFou3NiDV/IdVpU34QTDlF1DHnfLy0giyru+0tw2NnDoNxQWA4qQjgmWObapdDWf8
	NmzI7XtmjKzkFH71aRuV7LFw7wcZLcK1HxxJ8MJbVfNIymT0+cJDeqKnu30Wyz2AX3SFfo0R1eh
	DMgRzvIHyOm/RMrz6BkpGCjRyoU/TmgztDkdt14f9QU+GAtQH9c58WTOk2z4ejtLZZ4U6OhpmOU
	ksZ2FINT03/Ec25KCpeGyAVhBVGV2PVDrHBGq8eMg7z0u7te9N1tYsgbjGc2qS1BmxoO/qtkBtP
	xhyRXgnOk8Vp31M71DlsTuxerrCCPGcAKatZpfjxaoVGPveVCMUcA3ia7Ua//7F4tlBN8N4ZQz3
	Pi8C+e/4bpfvYJCeEUBwh9Jw8Y6LPODxKllUoXuRGdBEKjSa9
X-Received: by 2002:a5d:64c2:0:b0:482:e968:86f9 with SMTP id ffacd0b85a97d-4858708cae2mr45418238f8f.14.1788757231714;
        Sun, 06 Sep 2026 22:00:31 -0700 (PDT)
X-Received: by 2002:a5d:64c2:0:b0:482:e968:86f9 with SMTP id ffacd0b85a97d-4858708cae2mr45418161f8f.14.1788757231410;
        Sun, 06 Sep 2026 22:00:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm20432872f8f.9.2026.09.06.22.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:00:30 -0700 (PDT)
Message-ID: <3a1256fe-3ea1-495e-8f61-3628613c43ae@redhat.com>
Date: Mon, 7 Sep 2026 07:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] vfio/platform: keep logical vm_pgoff in MMIO region mmap
Content-Language: en-US
To: Abdifatah Suruur <suruurism@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903092927.502-1-suruurism@gmail.com>
 <882503c8-6993-452a-98e5-2eb72faff58b@redhat.com>
 <6a9d5da2.c9eda3e9.76660.4544@mx.google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6a9d5da2.c9eda3e9.76660.4544@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/6/26 2:33 PM, Abdifatah Suruur wrote:
> On 9/4/26 16:52, Eric Auger wrote:
>> While at it, don't you want to fix the same pattern in cdx/main.c,
>> fsl-mc/vfio_fsl_mc.c?
> Yes - sent as separate patches for both drivers:
>
> - [PATCH] vfio/fsl-mc: keep logical vm_pgoff in MMIO region mmap
>   <20260903092922.470-1-suruurism@gmail.com>
> - [PATCH] vfio/cdx: keep logical vm_pgoff in MMIO region mmap
>   <20260903092932.526-1-suruurism@gmail.com>
>
> And a follow-up for the cdx mmap path: MAP_PRIVATE mappings go through
> the COW special case in get_remap_pgoff(), which overwrites vm_pgoff
> with the raw PFN regardless of the mmap_mmio change, so vfio_cdx_mmap()
> needs the VM_SHARED guard the other drivers already have:
>
> - [PATCH] vfio/cdx: reject non-shared MMIO mmaps
>   <20260906123245.10884-1-suruurism@gmail.com>

OK thanks!

Eric
>
> Thanks for the reviews.
>
> Abdifatah
>

