Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241494;
	b=McAAbsi5LdUCaUHKLx6c/C81G3SqyFmEbm382ap2em7uOrYPYMjVtPI1jBshfKZZEbId
	 WiLrAmNTbvJ52HkXbp//YtGs0h/I9k9JEwEvvchP/YEH+1ZGpjgAk0wCLOaGf9mNBme4W
	 gpvQ2C3zx4AGiHSma0I0QvoaX/K04TwNtv9iLtrUBpzj89WVQf0AiNgb3pT+p6SBjy3p4
	 lsEeHbGqEbKGQvnxj0Pm0d7RgZQ9LzwOxWR22sse8YIGMJZTMwc/oCXoOpYgg2+httxGe
	 KibV8lszLMVM9fs439TjYUWBijHE9gWwZfc4ES9W2mVKPiMEg3gczZp8AS7p9G5/PdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sKbpCZWH6g6IaTibxtmwwi5B1GQbJ9UPUlXjomKvtYQ=;
	b=Rra4rJ9IdPt9vF8w+i/g3sM6esC+fFo27mGb1dLN9aof2917XD96Ux0kAsSs8nwBg2xW
	 zJAgqMEXh8HuERbinykX+MllPYr1xRDFqiQuLin/oY1jU4BbOSprTzXg2Fyo/TEMLkSHs
	 wZ6CgwA+JDdCWdXX2GjcTCNaQYcwUmbrtt6b9KnET8H6bxSgucFAxoshxxZgSAMnLOFbI
	 ETOkx+5FcnWJcJMHw3D1OrkIt9MTrMNziQ4yccaiilxYT65FbyVKrDoj/qnN0kL0JmzF4
	 pNXt4s1kf4PhyjzcdXAk3YkUu5r0RJng5SMXZf8DcVGhWyyh0ChYs1TJUGTrTPS4MpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcqBhXXN;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C158606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C158606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcqBhXXN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793241492; x=1824777492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sKbpCZWH6g6IaTibxtmwwi5B1GQbJ9UPUlXjomKvtYQ=;
  b=UcqBhXXNc2DoS48Oc56Me8I6QGPECfo6yvoGkdDxhwHpcTsjGuG66q4V
   sU5TrpF4XUVPbNgz9TZ3xwzPYPifzSIp4KCY1l4PcDD73T5Z6P+hyBZyy
   Yv5b7oC4Pv/3fgtXa++HNA3eaRSOVuhj/AOUQXb3Dal6M1jIH2HcFTJTq
   +/iVzCvM08NombkSO2MHcsp9aSobpCpjUEG2lCXGkuKqp4aFLmtVdYa5l
   mSHP3HgZd7BtMT8agVcVcPRxGpwEgt8HVzJSO1yhanhS5oWVDPgEukTJ/
   kGZ968SZkMp/Bu3x8zg7LNzAsYsQoD4X4RFhniJhk50QjFZYXGwhWhret
   A==;
X-CSE-ConnectionGUID: XqaDaX+CRmubglmJcieU1Q==
X-CSE-MsgGUID: 8UZV9irVRSyhzoeJ+QFCug==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1966535"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1966535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:38:12 -0700
X-CSE-ConnectionGUID: q7j3GMsXSvikVqXW3yv/vw==
X-CSE-MsgGUID: mbBVOtNwTcGiqtv1eGvM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5394664"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:38:07 -0700
Message-ID: <45327d29-e9fc-4b47-9145-9ae8e63042e0@intel.com>
Date: Thu, 29 Oct 2026 10:38:04 +0800
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
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/2026 4:58 PM, Duan, Zhenzhong wrote:
>> Btw, for TDX specific tdx_devsec_unlock(), the WARN_ON() is not proper
>> IMHO.
>> the failure can happen for various reasons, and the WARN can be treated as
>> fatal
>> when panic_on_warn is true. I think pr_warn_ratelimit() would suffice?
> OK, but unlock() isn't a loop operation, I prefer to use pr_warn().

I think guest userspace can invoke unlock() in a writing sysfs loop?

If a device is not locked before, the unlock() will surely fail? If so, I think
we can drop the warn/WARN.
