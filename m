Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0138414406
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824057; cv=none; b=f3nJ84zPSQRunCiLcErn3POKxw1fGJnCenCezNjl+cuuQiLNM0pxqRp1prbe9lvYSJ/yUuiTc8f1iS135NzWb/RU7QWFhrIPQoauHRf1GWB8GguFs1KpiQwe+Xinue3+5mZD2Ok5z7TnaaiYL/C2e7CM1R0T5ESEfOlCBB/a9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824057; c=relaxed/simple;
	bh=A56OfPZZVFGIDpDQ9XCz9cgezTjnSLv3WNc7P02MjjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fboWuip5uXyDI4UX+5rLBJnbjacctop1D8nKFJaMY9CkwtAapt4JqSzTDpHQDsrgqrxZtwbm5TgqVol20rT15XSRUwpqbaKg/t1UEXfmOUZWpeYG+YK/U7KzO5KCM+TKGFGBLLUDSB/DpXdrlx57JYIbtO2+raC8JaX5WZ0YeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUlJiwTo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUlJiwTo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8623790f8so82765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791824054; x=1792428854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=jUlJiwToZneaFf/XGv1R2b7NkTk1TgB+tXTehhHw307Qv2oKSmrHNZet9etW+rUfny
         I2CMVT85kM5moXip9hbDWl3gXnWNZatvQqcbpcvXksr1k8QhPIXdzO0K7+YsHS6+Y0H3
         DnkcoK5jzq6ZOVXv6tHPEzo4ictXebQXXxNtRXcoBYkMt4ontokiL6JSZw5Fp2rZ9dws
         tDcLd05pSJFRxH0/kKxcQZXOeVJ1kGtRlSd9tuREy0KmoslOoccfWJ4GTYHesX6N3H5P
         jrQIThL6I4gWvyjwwq1oYyLS2oHF2MfUxabg4rPS5x6tTxJqb/rfLH9mzayGn4ZH/3g1
         jdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824054; x=1792428854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=FDNWuojNR+JOQFpIOMPxK/IYHNGl37H/4u3as3z05uifcdASYpAE/GI/duQmSU4SoP
         7IklnbFRh+n859aBEiuOytzUAkoLTYTa+93G27Y9eSo7XpeQ4U4ObLyLkhDB67VjMqYv
         lIdMiRUkg3sx21MZfuwMPNvpXv04WKxDpIZLS6WmTJyI6Xy/2ihWrfHRqmQ9ThnaTzAN
         Y3GZWpO0HC4h/xYfpRwSWaAuNaiDdx3wkkJqFXnLcdAT+g7/cecRop1KDrSZil9VaKRt
         qGZJY0MzqUQLbYOKOdW/dYsPpE64YgXWkJ8VQCDnyZud9na9E61N9eniOfE2Z/UnINQe
         1ehA==
X-Forwarded-Encrypted: i=1; AKwUvBxBgQHnOoxkcrFgqbScPKdhEgMzubbS2HzrD8jsxqkVRGAKmPK7uiPtpA9hEqMELAuNdNHUUIXzrCK2b+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmFXSm5QjLp+5jXlki7tXjUYp8D8/6Xq/17q6KyOJhSxNczykK
	NpAHoV8QgtEp5eY9miLd4oMxvtWsSEm4runPbjnWNlv5bbq6ouwCkuSC1o6/DSRlGw==
X-Gm-Gg: AYBFou18AGkM7nt7jE+JeHQ6WzkFeiDqwapESuBGjiSl/9ikHZoO0M0V19oenPfaZks
	unH2AXL8kduAMnN0gmIFwekGa3N2Vv21N06NLY6WTfE/8dsptulnaBecMweYDZ0QGPkNGDvcIyg
	KQLZZUzBzPesB1Ks8mfteklhIhZqFK70zTLvy/O2qEgXqw+MXQX8wzIS3LkUSapgDEUpmL3IQBE
	fwH16Edf3NnQCE4tXLm9l4xmj1QSUHVs6/N21fv9kyscuTGbHCjUfoKmfWqS+tcqvEkQ/12znRz
	lON5t/oejZRnXqRiJPS91J2W/6k7kbJXlQSdzqJ8d8qCS/m5dSh3m1hbd643gttw8535oRGsXEJ
	uWxQ+8epL0ENTkoeF36Go4PvkEdPAFPT+wRZIxLt/sR57ZXhXYQQstFSXtB/kXK5Z/eHJxS+IGV
	SvJCoRypcgRnamIHj5pLA8CRScKAbswyse0VvI6eTPVoYHp2FL9U+vmMxvb2Uyos1leTgb654FE
	fGBKru9dallztBrPY+VONxmxyoYJt2a
X-Received: by 2002:a17:903:390b:b0:2e6:1917:fa with SMTP id d9443c01a7336-2e87e2f872bmr6833435ad.7.1791824053720;
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Received: from google.com (75.57.168.34.bc.googleusercontent.com. [34.168.57.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm10301280a91.3.2026.10.12.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:09 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v15 11/23] KVM: selftests: Set shared attributes for
 ucall guest_memfd pages
Message-ID: <as0QsZtRAEEq5Tpw@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-11-7c62a5d8a992@google.com>
 <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>

On Fri, Oct 09, 2026 at 11:44:55PM +0800, Xiaoyao Li wrote:
> On 10/2/2026 3:37 AM, Lisa Wang wrote:
> > The default attributes for guest_memfd pages without in-place conversion
> > is private. 
> 
> This is wrong. The default memory attribute is of a @gfn is shared without
> in-place conversion, i.e., with per-vm memory attribute.
> 
> We don't need this patch actually. And I have tested with reverting this patch,
> with both out of place conversion and in-place conversion. Both worked.
>

oh yes, I misunderstood the default memory attribute without in-place
conversion. I will drop this patch in the next series. Thanks!

Lisa
