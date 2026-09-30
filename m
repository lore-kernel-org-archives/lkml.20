Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376D37A843
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736061; cv=none; b=eF4r5almgkOt6omOeYpRrGRIh0G/a7VCVSRoSmBm4Cfc7VMbCp5+lGguoVnXrKGRtcpyFEKn5Cf0DGPUn5YVaH1T8UrLbajS84Gv2dPZD6Dj2uagnpM7R0YnPa30mKLoqJlffOzpqstlpuVqYHARaMOA13ZyYN/uASnud1yxc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736061; c=relaxed/simple;
	bh=rpumM33xCGo2iOKTxGmSwYJt7A4M/e0v6a/QhZC+xPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4taUxnAHMDndIyBZ+sKYqPYQu2QKU0AnstavbFnL6LUs79AsFWwEGvwh0SYJoOkBZx1jq+gZ0eSoOZQzkg9BbPewboRnhE9KTmqzp14DZJDBCGdmzUbzHstFKXy4PoCUUSHbwTy7XjyP07Sytb79RqiXXIBCEdoLoyMNQiYXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=QbCiQV0+; arc=none smtp.client-ip=207.54.90.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="QbCiQV0+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790736058; x=1822272058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpumM33xCGo2iOKTxGmSwYJt7A4M/e0v6a/QhZC+xPw=;
  b=QbCiQV0+6SeSm7ldakxObAQjgv1+FkNNYCJ9jNHU9RM8LuqiW8VqUdYn
   Mx2TR8tyPDOsxw9Ubkvee1fJ/2sBvOHYz9WPcDFFF7/bgz8JeVn5/yvKx
   k/jZdP6REkU1KZpGkFOcIQWGn/ewU8bGn3ccGCZ5UTDpDVp/gmRDjhS8C
   lYw/Vmk7pqDOHi0EvHvc3fNmplDj0odLp5rynvZ3X5CPtadX2ClC9TXxR
   xNwIURPDTClJ5gQl8+x5d68K744vRrH0WqFPNzzOMUcoZbSoSNOsBYvVE
   fZdcBR5Xlm/EsvGQlNz2Gm0F++uVj1uxfx7THzFqjYZTWeWK5HFQ5PSke
   Q==;
X-CSE-ConnectionGUID: 7ozTMKhPSAmEujwSYTxegw==
X-CSE-MsgGUID: qIR/J3mkQiG2EPsnMI7vxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="256606517"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="256606517"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:39:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DF9A5ADAC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:39:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 90EBEC0128E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:39:43 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 643BA1800139;
	Wed, 30 Sep 2026 02:39:39 +0000 (UTC)
Date: Wed, 30 Sep 2026 11:39:36 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
Message-ID: <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>

On 09/29 17:57, Yeoreum Yun wrote:
> From: Sami Mujawar <sami.mujawar@arm.com>
> 
> Add macro definitions for the hash algorithm identifiers, as
> specified in the Realm Management Monitor (RMM) specification.
> 
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> ---
>  include/linux/arm-smccc-rsi.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..a83df2655808 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -144,6 +144,13 @@ struct realm_config {
>  
>  #endif /* __ASSEMBLER__ */
>  
> +/*
> + * The RSI definition of the Hash Algorithm (as specified by the Secure
> + * Hash Standard) returned in the realm_config data structure.
> + */
> +#define RSI_HASH_SHA_256	0
> +#define RSI_HASH_SHA_512	1

Is it intentional to omit RSI_HASH_SHA_384 here? I realize it might not
be implemented in RMM yet, but would it be worth adding the constant now
for future support?

Thanks,
Kohei

> +
>  /*
>   * Read configuration for the current Realm.
>   *
> 
> -- 
> 2.43.0
> 
