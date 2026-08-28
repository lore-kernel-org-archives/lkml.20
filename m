Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBBB38BF70
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953870; cv=pass; b=W5vYckRfrEH6U1ZlTArfeDhs2VyrXznbFw0PGPrhZv+57RcoEpngGk2SaA8dFlFTs3Sqlb0p8ZJywauCyVvpnVT0cU5BzU8LfnyM6OS4Nky6ItSbJmoTxlTvOGMoeN4IkYAWHj4Jh2Uy8sPifT14u8dETi4fN8ZZi3EwBNCnIko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953870; c=relaxed/simple;
	bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZg+dZzGNr3NE2nxpYoSeyyNtzB59abjJ/I5CUKMDFJxvJVijpiKRcF+ss2ROy1jA8totWcnud1ohItqqa0YZtTjPDXtDRuED9omQuma6mH4VUcVZEyw+zVPsSeBTpGNA32ld7piVlpUkVUyfDJ431ioS2aSk0/M07X9Dg7ZfSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nhKOVPVl; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nhKOVPVl"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52faa58bff5so69641cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953868; cv=none;
        d=google.com; s=arc-20260327;
        b=Mj1LdiyxwPk/8o65M37IXP1XzL9QlFuERNNKIhmqmr0l5Dm3n33v+JRydlSSbgIM7t
         Rg7fV9JGTGq6dmmlIkpdJqriFsWDXl5oOiWQvAEXGfUycpil/N1AMuUO6dWjf+GruFh9
         aa/+8xTQSZv/gshXFMMJvQtTcWCHd7MAGjRxdHLE+/THlsBcvLb5XSlhLzEaVe/pokkT
         JzhTzgfxIIHNzPonEfnbpk1gGc/7gHrHXc9e3K63hXKLnPokCqpc87bTwXBBFiNGCTUm
         /ELA82xxYnDK1TUpR5ZcJ/l6IyVHcP21wSTmx1GcoV8jR90YpZ/q+K33OnPzGrMb5Zio
         NzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        fh=vb/XfKRyLEMs6RDPZBBc9H860RFfDxBxHAeakIDEBC8=;
        b=qxLu+Z6jQIS+YgLb1PeACm5CctRZJ6/1hGThceIZXw3yuf+I6u21sOX6Bxoh3TvnAo
         siD4RMacUNQJ0/g/KTVmPNxoy4l6wKUoSECF8XaFLOHQ86fft3xaQFdn04LHBCr0vkM6
         yq4d9gU6jTTQWMivU3c8ZsThYQ44F1FBZvAQ2RdpCuE3P11wfM/3Jj336XoGroyw1nKE
         OeaRTQgtlQXxZ4+37NM+K7By4IQxWE1L0hUiutOBB0mbV6dHnBthCkgl1ysN5kuiMWnk
         mBvEoe3I28ZOdfOy8T414xWY8EX8+WJPa8TkTBtk7u2LrNvEAs/fULLUu+Bj6CI5+lF3
         MOhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953868; x=1788558668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=nhKOVPVlHx3BL3zTJSE38tj1HxbGb9p/Dd/ezT5gohNcrlV4+MewHI4HjyFjtULxTK
         KUd073gbcfGu3nX/a2NSojjM7jK1fxrta3py/ebC0mVuP6oaNc17uAgIHGvwvePPq87D
         SShO8vGriWlJ9ZFo2W0PTLSKTWeDEha9jLkbvHIpWyYsGBXU9XBFPwaBAiPZbrTOGdJl
         YGpVRcrUVg/iAsL7HmF0RL/ONdS7y+5X2OxHbuB97TTqQTFCmKpEYStDmLVm2yjZqEvn
         UBwLIAAt+hIhj9YMl6J/e4f91bdeGqdHJV0VBzYP1LEHiFzJCrxlVNa7diWHw3aQCywb
         tEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953868; x=1788558668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=GlNxS5M+YAxW09dNfhOSHBXIBqV8v5zK5h7SiyyGzX2LXwemdyAqKjZVLnevgj2B9o
         KLEAuR6MYAF0wGh/YQmmqlNVWX13fYP/wwhUFT2mjCOPSop0xhqUDiDsXVHktNrFszNr
         XPC90Dhlu3VLd6JfGmGQQYluKrO3SFRRlmh3ygvo8nBjKSKsjeZTQPL5FQz9Feg+2psI
         s/5Uru0dlLZ+1YqLUGIiPAzZn4dPfUKkfXC35miTr/FnKMmrklRbZqGWP+gppI9rzJJq
         BX9KeRKIDXiRdTqZxOuWSTocOzP4q2XTDg5ojWU9Xb13xtcE7NMUfk6JOra7fAFpCUD3
         DKeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnL16+pp+GJZizn9qp0RqMd2prfogEclGXsHOEPHuFwYBpPIRlAoaABcGjRmRkTZVObYLAo2jniZa1pIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lFrrBbAuGXN+bUBxJkzYmCU7rELCJT/9rvGc/VIlLOciKHm9Ly
	buppmaz1dyn9dZt/NHNWonmdsBwxeeG2rUwXbe083zDtTgc7YkdKbyTyeuJdO41eb4PAMZpU4P4
	z2exjHTg7tBfVrYIZuVlwleQwEWxbIHO4zzMMfNfj
X-Gm-Gg: AR+sD13w8HTMyYExzR1KHJYs1Kq/DUAs5iYEaiH84UcBrJSGjcH+raIN6B7kGzqJ6wG
	Mf0nf9Fh4IeUGuCipqhfKYEbevdthwuMw+C7ytepZmPjRKtrwaV2lDKPmSTf8TPqSBHAIxrXbGD
	MmqzhIPYFKCXCpXoadds7pVZvXF09e3VScvawxeDfTihCGUYXjrhcnbknQtUDL7RnQywEHv15iX
	xZz7iiHI+dJZVenaJ7BW8RBxhllFdsKyGfTDjJX0UJll2kKipjU0huSoSGLT2Dso/A+EobC0Yxu
	uWS1sX9XcXd9SdfMfW5/5IRHGtqOgtHWzyOZa1pxeCD1mJwTayyUW0mIjhyg9BIYhFzU4V+MJuE
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr4613111cf.11.1787953867807; Fri, 28 Aug 2026
 14:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:50:56 -0700
X-Gm-Features: AcwNN1WH8NGHkZoUiv8RzQRpWDdLlBSrkCbScz0MXSyRTt5NyzGO5osqGDfsOxU
Message-ID: <CAGtprH_6-KDfDbtZCq+F+2_Qzu7+Wkc_2ukJRniWTgVkNvyVqA@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Use control page helpers for allocating and freeing TD control structures=
,
> such that these operations can work for Dynamic PAMT.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installe=
d
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
>
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
>
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around the=
se
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
>
> No functional change intended when Dynamic PAMT is not in use.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
