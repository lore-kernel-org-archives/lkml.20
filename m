Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978015;
	b=YlkFHiI1YXeD1UNUk3NDL/1eWMaOU2otB+3MJNwhIIBm/5n7E7tqrE/U/VhLWxZQhMKH
	 j+F/E6s7nV14mTRXiZiE8xdWVtpXTjgjPALBRdj/QThlQ8DyLPwYMXvnv/PD1sRvOOa48
	 Dv4NnPDw1J0QMT8Bj3iYjDMqvfZHSFNNVhPZGJ4fl5o9w1MxAuOzDzFFX6PypnxXbNVFR
	 3a9M5pFA/d7rT96I8mBsS0pnju+IuVztJxXjR9LqFXOe5s/VAqcXUkCW2zrqiCkfouvkb
	 YPVsf4sUS/nJUhg/O2GugiJ65O/h51PQP4LeTp6F4FiTTdixlHCS61v4m+1aSW2ckqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2Cx0XJsrcVFzqACqroow363I+7pJy41urKfd8Cz0ySs=;
	b=AKJB1GbAPGj59yI7553qseqlrkZpvHnk7DKTO65h4HBqTcnwCwxlAnXd2Y4QjR0srbTG
	 JA6nvhcukTEPc4tCLgSVaQiiiJoonLx1+u13T1WDFu18BtgxIfSh2tcvFoFxzh1zdP2dM
	 RUXkdyyQ2423umatRRwKQh6RNKOEsFvNxfWb6JytWF6niRi7CezA58+dcZfUkxw+mx/U7
	 YaA1c5+xaRLk/1xkS8uWmEnD4vPdbSo/B3NekqB6g3qZbECTailT94zX/l0uMLBu4Q4PU
	 603MoYG97go54+Ujj12UiUW+v0eGzCgFDd6307DmeAuEa5E6sH/MeufOtsLbUXr6iUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hkrGo2Uf;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04DB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hkrGo2Uf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792978014; x=1824514014;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vfjVCU2/1sWeQ6jWe3b4X1c4gTNuIcZ/JMh+RyGfX98=;
  b=hkrGo2Uf+/bXrafRlhRcmk6zIP5M13bWsudEMlOcXaxGX3e/1b4EhywV
   s9jpTUCZe8zOLXc8/Bnd8/WEy23WAOpw/BUymxqReQ/usDKmBLmf00iL7
   pUDmsU/VaBMFed04lTLfdmw8hIsSpqYIpgdjFh7UPvS6BHi8I4n3MR1IY
   kAPhBm21GAON5gToJsHj79Ro+iZPhbTgK8Dd9WQ1iImZaO/019ef49X1P
   TbE7MU9gm/P26z4+ZQ+nDpiBSJr1/tIoFtEJaAKy9lWEkToO7SeUo2P9m
   rq2xQ72tagHz6MvweFIbexeYn3TnLttRknDnXpGr6xWhSCKxJ9oaaJwxG
   Q==;
X-CSE-ConnectionGUID: OA0PLYbxRRy9p9d+qDFxRA==
X-CSE-MsgGUID: 5M5HO5eRQumer0AWhxy3xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1667480"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1667480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:26:54 -0700
X-CSE-ConnectionGUID: pZzCRkJsSSKRd85IJZg0Ig==
X-CSE-MsgGUID: Av7Q4Zo1QUidsSdx7k04NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4077168"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:26:48 -0700
Message-ID: <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
Date: Mon, 26 Oct 2026 09:26:44 +0800
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
Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
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
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
 <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>> This is used to allow TD guest TEE-IO Device Control and Management
>> (TDCM) module to
>> manage the device. The TDCM leaf functions are defined in the following
>> table
>>
>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>> never mentions the TDCM module. A bit more details are required in order
>> to better understand why you've implemented this the way you have.
> "TDCM module" is GHCI terminology. In this series, the guest-side
> implementation is in the TDX TSM driver; it is not an NRX module.

I think the TDX guest TSM driver is just the implementation of the "TDCM module"
called in GHCI, right?
