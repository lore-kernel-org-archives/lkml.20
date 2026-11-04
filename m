Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780857;
	b=AjXkOH5tHSraiDHHbNFZMnTAPe4tzTkE6HiDTi1oAMtTTyX3XiO8Tt5WrODiXTa3AIzY
	 mL0w1LWQD7C5/HSoxBGUQ0zJpjpWLF0mzMkr54zS4sXClv74IxxLqSA034c+T0WBS9JuQ
	 Vs6wAOjTWuJuazDE/rJsIIEtyxa2eN315frtW54a0woe8X30rSnky2Nki3dPdXshyb3Td
	 t0uU8c6lVrH6CTu55HFYKKXhizpD0GyJRAd+K2++lJ4M01CuJIkS5oeUUgHCXpHr1qa4i
	 3qVEn6ecll5o7huMhWiin6RYPoJeWTv7LNINrw4e2QDByw5oRW9k84Bh5dCyPXuv9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780857;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6QO0MituHBPbXZ9pO3H/RBCq81PhFbDCWjFQyhVgxiw=;
	b=rVoiI0QuQ0n1M+Hz17GH7G7mJ573d93PLVU46MpA3iaUqGQZueZGjqIhT2SnlOto4uG4
	 lWbD7LNwg5syZTA/sR8/U45lpnk/UDf4wh1jK3VKirsoQP+tUXgV/C3ho8mx684Np8DRp
	 yw+Y6JPQvmUvScKMSIeDh+UwfkCrpGU2egJRQyfHY9n/YW8foJMy1ZG/Jd754pTenT02Q
	 lHCNDxfSyz7PfoMb8zKL4pN1kFxiG/ZT8Ab0MIDWB8WafctkKp4oaqozj7RN889/6hnWZ
	 Y6niHYEDyccLU5RrAM0+4q24C52fRG3WENDr7T8llvs1S0r7mqOyxnZyOWN0U92fo4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3lpcHtK;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B19606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B19606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3lpcHtK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793780857; x=1825316857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xz5jXzGFoSmHj7ZdNV+IO9uKEVmCFFdjnZkPW73yiM=;
  b=I3lpcHtKDjmfGnFVYQO7/3VcLZJCGB1P6xNXkU2P10QZamla1ZIheBNf
   jh6dAHFuiD3jiiDW3Tbog295GzaSA0KD9S1f3phcCEXxeRMY67TekWUok
   CcR8NuPGE3nUMjr2kO2cV29mS47V8PtcDkNJkY90MWZj4zJM9xZ7I+mop
   L8SGeWYDJE085xgYAivL0hbjcICR3eMLq2hBGQJyuYRJtZa/G9WgcOjrv
   yoPaEQ0iV+QC4ZAM5qaDLhIHSbqVgWo7yfzzbAenk7oD5zY9MNUYm+nL3
   EhKaCCUJ76rql7hTZsImFrt+VumB2+sAHx4pGOT+x+BxPNJTLFse1/BeJ
   g==;
X-CSE-ConnectionGUID: T5JfcORbQJqqXzPXXdDNcw==
X-CSE-MsgGUID: yRDuSkafRKeSDBKGUFLQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2423295"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2423295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:27:36 -0800
X-CSE-ConnectionGUID: F8aw6Ns1R9yHdFJCOwsoZw==
X-CSE-MsgGUID: 4TxsQrZHSaWIH2Tro7cJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6796737"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2026 00:27:31 -0800
Date: Wed, 4 Nov 2026 16:20:33 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Gao, Chao" <chao.gao@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <aurq0V5ySfS5pSxx@yilunxu-OptiPlex-7050>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
 <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <2b73666e-d923-4042-b719-b9bdeca783c8@suse.com>
 <IA3PR11MB91365402E40953E928008DA6929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB91365402E40953E928008DA6929D2@IA3PR11MB9136.namprd11.prod.outlook.com>

> >>>> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) =
> >>> tdx_tdi_bind_dev(tdevsec);
> >>>> +	if (IS_ERR(tdevsec_bind))
> >>>> +		return ERR_CAST(tdevsec_bind);
> >>>> +
> >>>> +	ret = tdx_tdi_read_state(tdevsec, &state);
> >>>> +	if (ret)
> >>>> +		return ERR_PTR(ret);
> >>>> +
> >>>> +	if (state != TDI_STATE_CONFIG_LOCKED)
> >>>> +		return ERR_PTR(-EIO);
> >>>
> >>> While this does seem correct, it's not really following the spec or I'm being too
> >>> rigid, namely:
> >>>
> >>> Since TDI can change the state any time, TD can't fully rely on the Known RUN
> >>> state in any scenario. However, TD can rely on the Known
> >>> RUN state after TDG.TDI.START as a confirmation of the Interface Start.
> >>
> >> About TDI changing state any time, do you mean host changes TDI state,
> >> e.g., through TDH.TDI.STOP? Or you mean TDI device goes into TDISP error state
> >> due to hw error? Can't they happen even after TDG.TDI.START?
> >
> >I've taken this verbatim from the latest TDX connect spec, I'd assume
> >what it refers to is the TDI/device getting into error state because the
> >DSM deemed so because of whatever reason. I believe there is an inherent
> >TOCTOU race here, because you can at best get a momentary snapshot of
> >the state but the DSM, which is inherently an independent entry could
> >for whatever reason decide to enter in error state (highly unlikely, but
> >still possible!)
> 
> Agreed, it's a best effort check, error state can happen at any time.

I think we don't need this best effort check. The guest would eventually
verify the states before RUN with the help of TDX module. So to me,
TDI state read is just a debug interface. For simplicity, drop it.
