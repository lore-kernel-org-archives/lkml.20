Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AC31FF7C8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790743535; cv=none; b=XiObj6W+ZlS1oCG73ry2PT7pLl3bGUY3m9YDyXraMLV2RyzlO0b4b6x1M0AHNF5z/RwRP2QIz5xPGwH45r0Fx/6Um4K3SESS2sK7/5FRm15v5PEN2yKaJK7Ui3CkZ6pF+KQkodpKu/HmLHqqY3Er5PcsQw68QNTu1L7GMNFLB34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790743535; c=relaxed/simple;
	bh=SWeE7D4W3MzPjtObIHYua9ooSLdeWUT6t+wlvGiWv2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reHnl4f4oGW730R7g98xqv87ZVPYRe/62j1wS9BwfmdE7VGIjnF2eByZHdG2B07rP+DzbFDDkdcNlsnhaQ2NaNQ+3R1QUdkDhnny+rBRayqOzPIm2htTk/fs3xjmem94qjamYqWorjxTFaIhtHJpHpbv1vCSTvNEtYGBXUvSjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=dW/Mi6NY; arc=none smtp.client-ip=139.138.61.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="dW/Mi6NY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790743533; x=1822279533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SWeE7D4W3MzPjtObIHYua9ooSLdeWUT6t+wlvGiWv2U=;
  b=dW/Mi6NY7VXan6WyFU2Xuo/g9njLQyYdxBj8TZKskpQzy2FQ0ssYcIVm
   ox8WZW38ON3pSHhHfU0BDJ7g4ml7/xNs40+/WPew4RuCxuufXvDhg+CB3
   K7ODjawA86CnrB4C8CcFPvrOp0+biBmyHXJ6R8lCgiYnMbxcQEaau7gFj
   TMzywY049YtZkSVCyCjcXzAijKU2lOq7/r3KgOa+RfNO245it5+vBUUP2
   G7fLvveaD+H4RFnQ/Qzo66cSPbNV7SL7PVxIoXVbFuX72WXvqm+onCUB7
   fgQtrcpSIQaRwYP4sxINEsSe9DTEb8Z8KVRgOgUutKIPWwxHHVyecouXh
   A==;
X-CSE-ConnectionGUID: 6PY0L1G1QUSp3tb45qtu1A==
X-CSE-MsgGUID: yXqzu45/TuSWkEAekyoXvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="235520869"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="235520869"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 13:45:31 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 41D117A42
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:45:31 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E651BC00D48
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:45:30 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 95C041000370;
	Wed, 30 Sep 2026 04:45:26 +0000 (UTC)
Date: Wed, 30 Sep 2026 13:45:24 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, 
	Suzuki Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <arySUmMBSQxCCjM8@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>

Hi Yeoreum, Suzuki

On 09/30 12:24, Kohei Enju wrote:
> Hi Yeoreum, Sami,
> 
> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add support for Arm CCA measurement registers (MRs), enabling attestation
> > and runtime integrity tracking from guest Realms.
> > 
> > This implementation registers a measurement configuration with the TSM
> > framework and exposes measurement register values via sysfs using a
> > misc device. The supported registers include the Realm Initial
> > Measurement (RIM) and four Runtime Extensible Measurement Registers
> > (REM0–REM3), each using SHA-256 or SHA-512 depending on Realm
> 
> Is SHA-384 intentionally out of scope for this series?
> 
> Although TF-RMM does not support it yet, the RMM specification defines
> RSI_HASH_SHA_384. A platform using a custom RMM implementation could
> therefore launch a Realm configured to use SHA-384. I think the Realm
> guest driver should support it rather than fail initialization.

Separately from this driver implementation, I noticed that "B5.4.9.3
Success conditions" in the RMM specification 2.0-bet3 lacks a success
condition for sha_384.

Could you please report this to the specification team, or let me know
the appropriate contact for reporting specification issues?

Thanks,
Kohei
