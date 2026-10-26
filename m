Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992137;
	b=t4p6xd18ai40B6e7S8Cnc7q3z2sIgoa3+UkHcyc+Ri3eNEQKAPeM3jbIRaHuf+r34fYi
	 jefJ7PAGW7Ffn5ppYFtFUweLErw1mooLETs0/S1z+3V64Wscv4D3bFLPM/7mYoXm/4ne9
	 V9sQnCgpFAylIFM2f464OsQ56A4PUZapkAmNLMyw7nPAVDftvGv+wtdQr7XjPLOHiXmNi
	 D6qNwpzm70d0h2m5SkKzuUIdAFFM3w6fJ44fS3xnklcvQJjDPG9pb53DXNvavhbQGpLB0
	 1Xc4I13nHb4wreoChGiQoNMGgcX6OR28yxBnkOMMLbLaCktsX/l/jXuHW65bHfMuorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992137;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=a3+AM3BXphoQvusxdt5kqUDGXb7ONFez74wStDwMrOw=;
	b=rkq9ZqdQUWZ6FbzzRZckQmEELXJyihEACacSQAUuk/CWTaNROUPWAK8P5CoBMMSuYkp2
	 v1x0+NY+17qGoG8HY6dfa+oucYx6UbKp80AIpBxhScv261tTPqLa5ZTLYnNe9nChJF0Is
	 s1/7i9ifJOAKw2DDG03ao2+wQAroZp6Y5rkw5DBX3uBb9INcETD7MlAvGJbiPF7Dsy515
	 9U5sCHYhzDA7mjoLE1lZ3J9fJHHWk3jRN5EthFhZsmeoIR2eS4+56hUEkBlkt4l5RVIii
	 kpMjWOF7bnnsRQDj81G1tMvj7CF915PG2vaS2zbMiXV2pPDuFgN8iURreD+eeZGhUaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hUjpov/n";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUjpov/n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792992137; x=1824528137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J2MJUBRen/oL6+2XDjzStYE8CzYphJtLNZoAlP71i6o=;
  b=hUjpov/n+EIphJCELVsm2xV5rn1JLS/zBu8z2z3JtW93PvZFtxsRGkHp
   oUdkSqWOO2kBwQAxSncTNAEM89KjqYS3ph3AEE9WAtzn5YgNX0CrWPChi
   wVduNFtbsEWh3109sZvOeW6Varkh1G/8voCxW6XoAMu3V993Z5Y9a5fcL
   DmWfzYvQz3U6gIjpRRwptG0Fmwvf2QoFSOr5W8/vgsqDdyw+Gw/0Z51D+
   L4aBiLGjVp2nd4eWGoXNDPkILjrQS6Dnn6uSmHxytbFRamHtKReBrURdZ
   C6/nopM1Esp1sTilVMX4te3jNlqyeHNMMZs+rqnn5/LwcpP4ODkexwtwP
   A==;
X-CSE-ConnectionGUID: fwLzD/55RL2pW7v7TmYmtw==
X-CSE-MsgGUID: +yb6GTtzSU+JkGFNYFdeDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1637937"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1637937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:22:16 -0700
X-CSE-ConnectionGUID: jgRKomq1SZKcugIk4XoyXw==
X-CSE-MsgGUID: VAAsxib6QcC7hZEJvkEhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4569149"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:22:09 -0700
Message-ID: <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Date: Mon, 26 Oct 2026 13:22:07 +0800
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
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-11-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Build private MMIO descriptors from the TDI report using the PCI TSM
> MMIO helpers and accept each private range through TDG.MMIO.ACCEPT.
> 
> Keep the descriptors while the device remains locked and tear them
> down on acceptance failure and during unlock.

1. The changelog talks what it does but not why the patch is needed and what is
the design consideration. E.g.,

 - why choose to setup MMIO in the .run callback instead of .lock?

 - is tdx_tdi_mmio_teardown() safe for MMIO partial acceptance? when current
"run" fails with partial MMIO acceptance, can the second "run" work well?

2. So far tdx_devsec_run() always return -EOPNOTSUPP, and MMIO descriptors are
never retained.

