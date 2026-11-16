Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857996;
	b=zx+EUBF1RWfJyeaAnnZY0WeEsjeRN7TLkaCika4yr1cikxkrw76HRoO4ZRIqkBLOBeX0
	 XG5oySQgCdlJmRCN0E6qBTRsk6v0B7rhBbryY//TRMGwpQAVMYQ9ezQZ4NclXvyyko3Jt
	 8nS2+6EnGz0rUVHmLCSvo6g0Rco559yLEo0kJBvQIB0WRvG5gHmm4Pn9cixc/sJz7EzlJ
	 4gqJWAP5w+pOc9ZN7LExl3kmXoJWChliP8UE3Aa/ycQyr7cQQ46YDBMugeUawKzPUpxcc
	 qsSJT/qSoWRw+mZowwvj1ZQoTZuUQ6QxLaC923lL7bFIZG5CHLBqqGxvnrRQUxawkDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=PBpJOt/Wb3NrNSxSLmzVstbyZN0/wPiMsN2r+CW331Y=;
	b=0HeJ0/w/aKc2y552y8Ubku/ZWQFcrfGrkfhkkEiyblqaWOM/YQPw7wc1xlmhG//lCume
	 qtckD/XOA6FrBVdNuRc/t37N9diEg4/oQYY5dZsU1eXeKM6f+5d0poc2kWS7sBwLY/Vz/
	 aSSsWqSY/u7anZPP65IUw37/vQXoDq07anR2+Q0Pdd7ORGUYSmon6Fs9fbd9jQgmgJFg7
	 Ggk2dtYIFqytX+vv/cZo++3c0s5hMwHmJEtf51BUsRdPMpjVa27f9ZbkYkDXhvEU/MfOB
	 J17mRnWnh220wajUN2IpeI3EPpLAzXUtS0G+RzRuDYcnEECboPVEv2j+Yq+i6Pypvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtK3YaSb;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4D606A322;
	Mon, 16 Nov 2026 19:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D4D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtK3YaSb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794857995; x=1826393995;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1PLnpKuMoWYQEau3eOKXJMVU+JI2pEf7WBr/MtM4RA0=;
  b=YtK3YaSbvQJ0HbKuFiarN5L1TNSv6PXUFA8Wcq9FsPUxZXVf//n/OIEb
   x79FVmbRxex9S276Smj0FYuj3Zm2CePrQmbEsFUscp0XT6yrRUfWzHyMk
   V+yGO9UYBuByWwbS7d4bjfOwZZ+NsL4zYl/afdjmGQB4oGf3r/Kei1KAu
   weFzZPEkAGtyqEXzarK0GhmbhCVFZkj9MeDugLuc7xPA16E175w62ueR8
   tL/jZyXygR0ygbMnPLqyzukxVvYbBTf1fX8ek5s+0x8HC12bjg0j448fD
   BMMIouDqR/8VJgIqiiUmxXozIva1/sl1Yeqs+aC8sUQqcxJvGAYvjIl7+
   A==;
X-CSE-ConnectionGUID: ++ceWGViTgqnWmZUUiaMDw==
X-CSE-MsgGUID: kwXoBMjEStKjw6SdRYupFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3645338"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3645338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 11:39:54 -0800
X-CSE-ConnectionGUID: fGIIHbAMT9ulzaCDbhSRpA==
X-CSE-MsgGUID: chVysjl3TjecjgJ99mgb3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9575031"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 11:39:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 16 Nov 2026 21:39:47 +0200 (EET)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    Chipang Kao <chipang_kao@asus.com>, 
    Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, 
    Mingyou Chen <qby140326@gmail.com>, 
    "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the pm
 tree
In-Reply-To: <avtYzidDS9_4b9QU@sirena.org.uk>
Message-ID: <c8f4f188-0bd8-05a2-2ca1-af6f5759a4ee@linux.intel.com>
References: <avtYzidDS9_4b9QU@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Nov 2026, Mark Brown wrote:

> Hi all,
> 
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   drivers/platform/x86/Kconfig
> 
> between commit:
> 
>   699041135f75b ("platform profile: Extract the core from ACPI")
> 
> from the pm tree and commits:
> 
>   ef696e89f836c ("platform/asus: Move ASUS platform drivers out of drivers/platform/x86")
>   3abfbb21e1c92 ("platform/x86: redmi-wmi: Drop redmi-wmi driver")
> 
> from the drivers-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc kernel/crash_reserve.c
> index 53d76ba6b3c31,80092c86d586a..0000000000000
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@@ -503,11 -483,16 +503,17 @@@ void __init reserve_crashkernel_cma(voi
>   	while (cma_size > reserved_size &&
>   	       crashk_cma_cnt < CRASHKERNEL_CMA_RANGES_MAX) {
>   
> + 		char name[CMA_MAX_NAME];
>   		struct cma *res;
>   
>  +		request_size = min(request_size, cma_size - reserved_size);
> + 		/* CMA area names show up in sysfs and debugfs, keep them unique */
> + 		if (crashk_cma_cnt)
> + 			snprintf(name, sizeof(name), "crashkernel%d", crashk_cma_cnt);
> + 		else
> + 			strscpy(name, "crashkernel");
>   		if (cma_declare_contiguous(0, request_size, 0, 0, 0, false,
> - 				       "crashkernel", &res)) {
> + 				       name, &res)) {
>   			/* reservation failed, try half-sized blocks */
>   			if (request_size <= PAGE_SIZE)
>   				break;
> 

That looks a bit funny resolution to a Kconfig conflict... :-)

-- 
 i.

