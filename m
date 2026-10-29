Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241875;
	b=kCwqabSdVBz5yFsV5bsPCjS9CQygNkUn7DZTHj0CExjwyFeY2VmPKZWbsEFcW3V8hu2k
	 hdzWeO28fAbjJ9ld3GXw7eAQ013crh2hUfr2RL2GfPQo5/eYktLSc2iftw5/VFHFWT2Ic
	 Oew4P5gQiqhZ7CGHyG7HwAhX6MM/tR6aNzgG3wCgqx65t/QvYGr+31Ok1lHblykhJUJyA
	 5J8Q2B6Ln9BqADS4UPwzv+/HctboybeDhBwUcDERVbVQEgPQ1pxw8/qTC3PJh5RLbFqKZ
	 K06s/efEhKa15cxacnebFCtDcTEviVTEd5YzuMlNBS68Kr1nIrU+FtTHRNBPAGePYLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FSMRV9KL2BHL8hbrTgnI+T4i2BzvOrrEKszvswRJeHk=;
	b=qZmEHJV7UfWusMLeIrdla/pozYt6cEtVFwFHZ0zh9DToAa9ZgYcXTUBJ0LBTkX1WhU1/
	 qAUzEjt03P5G+BgN1Rhaxi1juYtgtC7qLA55qjfJ+SCyIYapMPy6g8gByUVmr0lvPkf1I
	 YhZ+USwMXsrOJTYdOV2te/ln+G4b1pYCYD3nHWpr+eML3pqd/cXqDIN9fl70/m/uO63Yh
	 tQWuY1b9876ULVNsyLKy09qySAL8YQPTb1Or0hfb1lh4axktnJivP97JUT3PO4UxpmODn
	 QuJ5hqmmbtFnIv8aSYz0eAjenO7jIDRChb2i6Zm/vV+othygfMFpaKmgnYYlUy/8TzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mAkXxZsM;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C827B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mAkXxZsM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793241874; x=1824777874;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FSMRV9KL2BHL8hbrTgnI+T4i2BzvOrrEKszvswRJeHk=;
  b=mAkXxZsMphovrEQl09oFa/rKX8JmHsc6J8ELTMS727A2DxmDUZAxEmw9
   ucP6yLwjQVCyUi1y1T5KgjzakEaEDIgqx3APkS5Hjx7ErBRzxCtc1W60Y
   9aDjfN4uPJmI2QCLiAptjHhpUdObHEtdLos1wKdBVhfjCkMC4BTN3tewF
   eMZwAkLJKfQvI3Bfq3DL0w7AUxChsrZbj+cYuwGNq/pQ1fYiSLSXOMXfc
   iPxQ7zDPHz3wtdbuBy/9lRMdu2yTC1mENCf3s72GP4Lh0wvOZcIzoL1Pm
   Cc888mMlGBUR9G4JHEW6UJQ8Eyb5dY73qwUa2zPGgvy7qkG5i5/HquIU0
   g==;
X-CSE-ConnectionGUID: LV72XMo0T7m3WnPslSftig==
X-CSE-MsgGUID: GYmj9vyPQoOXAH1SWTT0GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2008695"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2008695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:44:33 -0700
X-CSE-ConnectionGUID: gzBhFSX0T4OBEZn+faMP+w==
X-CSE-MsgGUID: hGGA5INiQU2JJ6WWeEJ3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4886795"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:44:28 -0700
Message-ID: <12342937-f04b-41a2-8eb7-f22856c7d59a@intel.com>
Date: Thu, 29 Oct 2026 10:44:23 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
 <IA3PR11MB9136EAE3C8C27B34A6A4BC56926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB9136EAE3C8C27B34A6A4BC56926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/2026 11:32 AM, Duan, Zhenzhong wrote:
>> 2. So far tdx_devsec_run() always return -EOPNOTSUPP, and MMIO descriptors
>> are
>> never retained.
> This is intentionally, as we haven't finish all the work in .run() yet.

Then you need to call it out specifically. Otherwise people see the changelog
doesn't match with the implementation.
