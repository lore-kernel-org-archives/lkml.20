Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52954B1D7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889340; cv=pass; b=pCFAS0U60mXNRcD+gqHXMSWnFP1Hxov+zzvaRV2aSX8pASjkpo5G2reWjzlsYrQhxf3eH5po/PHIxLrHVbUUILsNMfg7eETQxeHBhKjWhhOhrcySOSGOcKnt+7o7q51mccn5qboxTDzatdMCSabjoGNUTqZiTn4fBlFVObuceL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889340; c=relaxed/simple;
	bh=ZU4SkGLCQl6PTS0EDxlLzNT+Jubeap1l3JebEpwsgdo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cF8uzWfWhG6b6jiAb7XTVieXnsJ+Zw562oDMeFx5f6Ta6FhKVH5anqOeYdNnR22IcGcSVpao0C/LQaPJ8Hitxt80EMJY9ez+xzfxofcrWjRGY9Yg4M+stxJC8NcevmD2KONLuTy/FTZi3Jhjg8mXuFxKUZyLc7IpXls+kBpUh5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qn5yhEXb; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qn5yhEXb"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9103228ef53so55212236d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788889337; cv=none;
        d=google.com; s=arc-20260327;
        b=Yi8MurXlfP1PTfi76wqmBIWq7cUU3V+feGnF5DpXaSFWwlLrRuWM94PE19PfAkuaqP
         bIRfQUHQHGh9zjWoaUq8C+EimjxnyODGYQwakRO49QbZBwQ2dFMXMtCnox/kTPsJS4E7
         v6Jo6VK6oDRVhWRt1r5MHSB5W6KvX4Pb0nvo4yKnEhp74W3daAIWAxtOoY86yMO618vg
         FxZvhnIEmHRDYNolUHxiiRxad3yecwN5qsoncl6yf4Kc+2CqE53PeAXr3N5Fpxgg3dp7
         dMFyTrOsfP/jeuOVdJ9DOzWepjG7P7+i1QznNz7lBETpuMnuNKdcg1oyLEFmTquqwoX9
         4fEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        fh=r2RUw82bLfKCQwpFuVnXwa12eHTsFkvtquymZuUP7lo=;
        b=XTlArq9EnrTiSTZKx6UVxTxYKwYzpF0XSAtEyqcn+1O4T2RvPahhu+eDcxztREJzBB
         omj7QI5RRCCcbqhBrkNiNi8WCWYpc7KYRR/sEBnXkB53A0cGlxVhTZQrtI1tegev1Ha0
         sSI+7jQPThsFQXiNtxPxIi8LMH5sx3DL5m0kTyHOO/MkEl+bO37g7k3PJp46Kj2Y/Sl0
         kH5XmXKRU/HGR9vT1lmJ8qqZXJSZTAXC4qtRurSVTEDvUhwIcTNNH6gNmWRGTAiPirST
         B+Ug6aOiFCsEboITvMh2vfRygVkjofqLmI1ohfvLVUbB3FKIlipNI8SU55TcrUXZGac2
         Ik/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889337; x=1789494137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=Qn5yhEXbLgsXKPNXBLdTx94KGIExW2iJH59qp155SJh599UmNCkqcs3EVoGXjqSJCQ
         lkoI1zuA/uv+e3bX6PDl3tjgbiTUIZA04KJvRYg9HuISsmERZ7geQRsZYRtjbAL6fvVE
         twyc4ELLmwPiUZ1m3I0ZNJOUA1k/3R3GeR125UTIoGDPe66Pl8M8EILsJJ4uf3N91u19
         Ua76u0poSsGkQX8339myWf/xD465Mupbzf1Gxrs+aQFx4YL9iiNtRtbnoWLhZarfM3uW
         lAVS+a+euzX45GpgGMv68Y+Z/4hM/4uOrSdrFfo4PIQdGU9UBh19tlMqKtbrgBi4PLWK
         pkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889337; x=1789494137;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=NOxrNzdAlQiBVP1hNBVHntMGF+f2Kt50cBItDOzfa4y90+ZkZreKUKyN/PNGcOHUJY
         0mdlReIIsCIEmzbKrTjovfcrIkrgUz5omwMQC4BSL3idT9V7UfHn3WSWyoMnNkmde7G+
         FdxpqRRFpz3U+3EAj8VNGoknu4tuqBa0VhfVM84jcYQa4PLF5HLkutu7E7PVESgTWeiI
         U0zx87nd4vbm5jGYghzZ2lShsppgCaCpaLrWAggBP919gLUXvcpbGUSCQSC3NAeYLklJ
         9UAQIrHhQOG4A5aLzf2NIp5D98jY3kZ7vI9y2ci4Y168seJTN65P/Ey6AhaTUYLna8sB
         x+4A==
X-Forwarded-Encrypted: i=1; AKwUvBwUB4AQHm/DpTkuCUVHQWsURUQYoxLRv22Xr4b2t4lgkLfUWiepSIr/9eldpyjQ+Ow4hF5vvZKNWtfiSZU=@vger.kernel.org
X-Gm-Message-State: AFuF++l1aQ3hppjpkREgEGwXu2cuw2/JB4QWA9M38IEa6EtjShLcu1EE
	vbOSkhbF0KbFReo4Qk3gkftJYJQWgpQpJ9QRyCGh+aAjnhINUSegnCldeQiQ+3Ssu0FhdsazgaL
	fPn/lPDnXVU9DmqfbB2hzq+ScmdRaDCJ3HqLdo+Ad
X-Gm-Gg: AYBFou2J5wO54As9dUwJoAz9YdiQikzpHYQHM1/jV8gsPJXUmxPHeZTUP8gJ3KL5OvZ
	RvQDvIG6dUDpyLR6DfrhyGFnlLLObH3YQkCvpap8UooElymykbSUSkLmaEvNMFrUeQcG2J1Dkne
	izObGH5SxnIYZM0fGZCFRcPtIzXzk/yjCoHyCUIyJdXOB6u/1Tb533L2kpCOXIJv/dZ7qagpM1B
	zTFzDAHO+j4JUogvcxmMLgiFrAZyrEfbCjE0BZ4Suvuq7Fs3V8ZGUf+H7ADDonWpDIlNu4h4TOU
	67C4m05NXo7Z6iuKKPAs04zePA5FFJOkmd20jqwSRVmhffi/3z1oYZtSJ8NsOX4EYed6aad37Ay
	yNHwMZH2eiKtohZIAKE88Epplf8cVdF2CVvYLwedN2g==
X-Received: by 2002:a05:6214:5543:b0:90c:e762:1f86 with SMTP id
 6a1803df08f44-9103f0d3e3emr182149366d6.30.1788889335692; Tue, 08 Sep 2026
 10:42:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-2-15ad654a50db@google.com> <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 10:42:14 -0700
X-Gm-Features: AcwNN1WIzdwbZuZ6_C1HEL-Qh1G_nx7IFRuMDHksUPDPxufQ1MQ22MWJYpWBBLQ
Message-ID: <CAEvNRgG0v9DKgjwcswtprEwoRC0Y4w3VTYszDnJkbknWR3rvCg@mail.gmail.com>
Subject: Re: [PATCH v14 02/22] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> Initialize the TDX S-bit and the GPA tag mask in
>> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
>> is initialized for SEV VMs.
>>
>> The TDX S-bit is used to distinguish between shared and private guest
>> physical addresses. Its position is determined by the guest physical
>> address width, which is either 48 or 52 bits for current TDX
>> implementations.
>
> Since S-bit=1 means shared and C-bit=1 means private, we can't have a single
> bit. I'd justify why a second field is needed.

The s_bit field was introduced prior to this patch series, so I think
the patch introducing the s_bit field should have justified the addition
of this second field.

Did you mean that we should add something related to "Since S-bit=1
means shared and C-bit=1 means private, we can't have a single bit." in
the commit message to reiterate/as a refresher?

> For "untagging" GPAs we could
> have a single field, but there are other usages?
>

I think this part in __virt_pg_map() requires separate fields, are you
requesting to only retain one of the c_bit/s_bit vs gpa_tag_mask?

	if (vm_is_gpa_protected(vm, gpa))
		*pte |= PTE_C_BIT_MASK(mmu);
	else
		*pte |= PTE_S_BIT_MASK(mmu);

I think if there's any unification/simplification required among these
fields, perhaps that can be left to another series.

>>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> Co-developed-by: Sagi Shahar <sagis@google.com>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
> Nit: these are not ordered correctly. I think KVM prefers the order in:
> Documentation/process/maintainer-tip.rst
>
> But I think at least the RBs can be grouped together. Also... can't really point
> fingers here, but that is a fair amount of of patch history.

I was also involved in some earlier revision of this series, tracing
this history is not trivial...

For this series, given the long history and many handoffs, shall we help
Lisa out by explicitly requesting to be credited on specific patches?
Emailing either Lisa/Ackerley privately or on-list is fine :)
