Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793939441;
	b=uBNpehzNF+2udZxAXmUDPN1slBElKYWOPKm0EGHDLfsTj6JZo8BqWDxUH4DYYxeF68u/
	 Ze/c4V2V5LjRLZCppfQURO5eOsKWUVdWaOZ4zJ6+MUjS1jaHErLJBpxUvfbaId+5V2nnH
	 c/G8ZMzyC3Er8ddD2fLkvaEyUw9GZ21ALGP5UgSC8jyeWYO+7kKxVa5argQpe20HVANy6
	 uH0NOyeWCoX9xATUVdAgU/WDYE9dsS+iNnQOh5z4Oec1dGLZcbr3bvCE+qBhoZlVVb7Ta
	 iI5H33KpRXvreqQSa3VAXZ1NBWH3QInGXcea3ZCT5UTaDyklErl1Hym1WQHYZ6H70pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bZ4yl/FmN9vHR0lstk/51fTiXqlhJ6EnDHaciWBTDCU=;
	b=oIgh4pggY88NI74qGzPxLItE1pknPz5VIK+Oc9gBefiEii/sZtp7l2sEcibm/5Hp8ZiP
	 LM2dZYgfO7BxZkqWRjQwiXnGjZ6TRSL6+5nHobfbTwFcJJAnhMc20SNKAZLtn39drYTuP
	 UYSbJSe1vIHgBIRWeXStMFJEFi6phvw+6coxVEsUz/I44gEy4cU9Wru6V/QdcPe7dhX9O
	 5Z0efkaruptbijNZwSkAnEFUpXAQu52fsDPyUlZ7cJahiFsfsH+4Gwdhiv2BrlkZwsYKh
	 Bh1E2zJxGYeXBahPqv3DniCmkNhpEZKEK1OUKHMS0DS4P/8sWiMdFkwwmpYQ/IkuVeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwroHejt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D68606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D68606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwroHejt
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso2171861fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793939439; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlwxDWRBlqDTlPuVQPNX/urjOxqjf4uVvuEESz7W7nojghlSrf9o50nnW44O10PWeO
         amS/y3ISg7/3vIB2QIbkPmLBIGuWbsrkek7DzQUUH42KFtOc668BPcLqhR/38hBJ7lfk
         NJDRVB1Q2KawJrr4Bn90tzM/Brx1vSd/lLyiZbOrlHqTCrqdndqAju3HnEZl0WaMaiXU
         rnPt6PzdkDq9mVqzgehHrsIfj2lc4Q2aTo2L4oYGkYWFuf0eS/WU+RUwqPpgCpaFi2ww
         H0CWgIBw0SpP/1FmdOf1bJnUCWCSvmkgvQF9csJHa9h1YUrYNhJirJFdV/Cdkv/9U4wK
         VSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bZ4yl/FmN9vHR0lstk/51fTiXqlhJ6EnDHaciWBTDCU=;
        fh=AVGGERaLoz0Bk1UwTfeACI7YM9VcIqlq9Obce6gjLM0=;
        b=Yj7cwVFkWdA8qPC1n1KodQ5Nw1+OJLtvLrqBvIIMdCw3EVW8wqVRfLSa0ObM9DN++P
         wYX8jCn6ofnNMBkqrttrvIHI0VGNv6gfIWryj3G4e0ATwbey2fAj21JFz2x2cES+5yQo
         rlL08xnSBAFtvS6KyYBCNyBe/KK/RvE3+YHwviyFrhTumSHWwAgrIHOXbFeY+h7j8G60
         vTlpVr0hE7Pknh1TyrXTRMwVy8YvM0AQZO2r1kjkv2hRvNxRXI7rq7bF7RXe2aL330NY
         mUbp95/BFBYOTey0lAdgyXoYotwxkHZVz+uRsX/WVjP+W4BFOrPUjSyGrWN3G06Z7sOT
         ouJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939439; x=1794544239; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ4yl/FmN9vHR0lstk/51fTiXqlhJ6EnDHaciWBTDCU=;
        b=vwroHejtaRXXec+i7A3jImrpEWozUOejUJpcxfRdor24V+mQf57EigrtcBaiIfNppV
         +/US5NV7M3OwxEp/VHGhiPfbhMkgMW3m9g0l0coy2RzXGkTkNGanhmK/wlQQtd+wkqSB
         csjePKm4h0d2qIw/JPA9SjduR3mu+7JiMPofkmFUmRMGfmKtwEgszq3cscLyz8fOMtQs
         m5yBNVvWU+hmk64aD9M4no/oGsf1qRpl8Wd2BtkSq9//E6rco1C1guWo8Affq0NmxHpa
         ytsEMjz4TnCn+JPb5ji5GqbP9LPF095tU2O+obQht25ZiMuL76GQsNdEClYS494gkKdH
         aC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939439; x=1794544239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZ4yl/FmN9vHR0lstk/51fTiXqlhJ6EnDHaciWBTDCU=;
        b=d0AjluNs6Cc27g5lynOIIk08/L5/ly7xTn4S+dWIjGwyOHgSiJhSGoANyl7RJpoHfh
         mq99uV+698vmteof5o+3qLcG8D0fJbydDmrZ4d9Dr8wgblbSR3Ccy+zIGsedHTiHcPW9
         TMEvxfu8Tr7Ua1NJbcd84vV09co/G9deoAxsmHVy6Ze57r3ozRik4HenPKjODsGiaT75
         edIPc/8nx2u11aWtlxnHBmfKRXQ8vDqOItH1OtQUBmUImK/ew5MK1VL37fLm73abH5xa
         icN7ibfhZ0ksZj9CILDTjGuCTpliamAezo/Ib/Bor1oQ9A0S0yfyAZ7UXDJFtdxNJm+E
         6yAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzDPPcy7ddR1Ta/iWnO4a10QYP06y74xcQX9O+QkBwl2KkHjstDb/8Rdf8GIdD+31L9eRW9Z96wvEEHN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hIfap7a9GhZaplkycSzV2FwIDL1CfDKF3dOOeGJT082AyypHs
	oQa1MxaoIzbfWl1NZr55H7Yjv4dL9yxnGfx+mYD1l0CWd5KCSZaC8ynLBIDXWlYvy09vYqNv2BX
	SP1Mspmhnm+HM4KebE4NUNaKblFP27T0=
X-Gm-Gg: AYBFou2Ch99pbGi5OxqO/xYUGl2Q1qMAgfEsfakDV6OzeXd6P3Nj6MvppygyvGJx0Vv
	lCsCdF4EUqxS+C0zIuMs+hPbEVDrhhD8gVBi5QXq4CVMMz8kLC512wY5sw/CC/y9YQK3BazV45L
	1+QfX3fkIJR7+/9ZkDMCdOv+2PHyIWIQNw+q1xo+IVc+bqlT7YT1GDXIj7mj6yjgsErq+jLi9xR
	tQFUkHLdhJgY655qfBG3f/ef+v1IONthOy6U28VuqmfxB3khrp0xyOGjdM3Rky9JI/WyGOtsXS5
	rkQ5PD/JVw5FFvvdYmzhTKclhv2ahRR1ggLqa3YHcRkycGOQ6j+Q0YwNNbRzybdbGwlRgAte+rT
	9QLeKprIuV2Jt2GjZZutldhx/Aqs0I1GZ0B/O
X-Received: by 2002:a05:651c:1466:b0:3aa:fd7d:6164 with SMTP id
 38308e7fff4ca-3acf3d327c7mr2354821fa.25.1793939438713; Thu, 05 Nov 2026
 20:30:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105192738.70664-2-oss.patchbox@gmail.com> <20261105141427.00005946@linux.microsoft.com>
In-Reply-To: <20261105141427.00005946@linux.microsoft.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Thu, 5 Nov 2026 23:30:27 -0500
X-Gm-Features: AclHuK_mkkVdBlDxyx_u6RLLv2wIIoQ5_PS9z8DWzBm3NCMPC1YbiMhFv5f354E
Message-ID: <CAGG=RgBRojswF0P_YNFaZET7b8W0MnDAEN=cH9J4xLn0vUkxzQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/hyperv: Don't free a paging domain the
 hypervisor did not delete
To: Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Dexuan Cui <decui@microsoft.com>, Yu Zhang <zhangyu1@linux.microsoft.com>, 
	Michael Kelley <mhklinux@outlook.com>, iommu@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 05, 2026 at 02:27:08PM -0500, Yuho Choi wrote:
> > hv_iommu_paging_domain_free() frees all page-table pages with
> > pt_iommu_deinit() and only then asks the hypervisor to delete the
> > device domain that points at them. If HVCALL_DELETE_DEVICE_DOMAIN
> > fails, hv_delete_device_domain() only logs the error, returns the
> > domain ID to the IDA, and the domain is freed anyway.
>
> Isn't there a WARN_ON on this path? I recall asking for one ..

There isn't one yet. hv_delete_device_domain() only prints the error
with hv_status_err(). The driver does WARN when a flush fails or when
attaching to the blocking domain fails, but not when a delete fails.

I'll add a WARN for the delete failure in v2.

> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for the review!

> Looks good but I think it is incomplete.
>
> if both hv_configure_device_domain and hv_delete_device_domain both
> fails in hv_create_configure_device_domain, then unwind code will do
> pt_iommu_deinit thus have the same UAF problem.

You're right, thanks for catching this. If the delete also fails
there, hv_iommu_domain_alloc_paging() still frees the page tables.

In v2, I'll make hv_iommu_domain_alloc_paging() call
hv_create_device_domain() and hv_configure_device_domain() itself, so
it can leak the page tables and the domain when the delete fails, the
same way hv_iommu_paging_domain_free() does.
