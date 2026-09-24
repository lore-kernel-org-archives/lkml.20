Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBE53939C1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261743; cv=none; b=abpMZbFKSgCMrg/zkb43piHETO5Iboy1omyl67afQ0zo5C0exQWF4PrlK+HUH2k51sY0S55kNL8pwixI2fpknTZ9o0ceOXnuW8Y7SMLwYehzVqh0o7iuBBsAk0Jv1wg96kZgJfByVbWLMZZhD4CtLl4/UFnWXmtjB2oQMuZ9aNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261743; c=relaxed/simple;
	bh=dGigSJ9bfvrCJTJezA64ql8bioG3tCAfNENgeTrxU1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efP1/QiOSCdRJab7vZ5Bhc3udB7npnB0fiIEPUM6GxtwFcKJXqfqnooyDHl3j2ejENLdYkMzZ+BUIWQqB7pt0Fo+UJgnou9Ro6u6HJjNEnt+cURwPUckRPCOvRpbB6+f68FOhkiTGzMqV9OW8yjxxPxefrAZ06CU+Ei3qIsJAWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=E8wY485n; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E8wY485n"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A645143D;
	Thu, 24 Sep 2026 07:55:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901AE3F86C;
	Thu, 24 Sep 2026 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790261739; bh=dGigSJ9bfvrCJTJezA64ql8bioG3tCAfNENgeTrxU1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8wY485nFSqGU6S68M3V7c2yBFx/I6meN/gefaMYakGsj8ECSU4oXwejSsWS8ZLOM
	 5/tTS/L8YHroe8ZcG3B/Gtd5eGBLKQQYt6H8oyPmZpXEp7RK5DcIaNo3mhhL9SBYqM
	 EDD/mT6Qjdv6uCpo4PxSSlWvXQYf89EJsF7zglcQ=
Date: Thu, 24 Sep 2026 15:55:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	suzuki.poulose@arm.com, James.Morse@arm.com, xuewen.yan94@gmail.com,
	seanwang1@lenovo.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
Message-ID: <arU55PEnc7Gjy830@arm.com>
References: <20260908104800.3744507-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908104800.3744507-1-beata.michalska@arm.com>

Hi Beata,

On Tue, Sep 08, 2026 at 12:47:08PM +0200, Beata Michalska wrote:
> diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> index b9eaf4ad70850..93f33ee078638 100644
> --- a/arch/arm64/include/asm/topology.h
> +++ b/arch/arm64/include/asm/topology.h
> @@ -17,6 +17,12 @@ int pcibus_to_node(struct pci_bus *bus);
>  
>  #include <linux/arch_topology.h>
>  
> +static inline bool this_cpu_has_broken_amu_constcnt(void)
> +{
> +	return this_cpu_has_cap(ARM64_WORKAROUND_2457168) ||
> +	       this_cpu_has_cap(ARM64_WORKAROUND_3821522);
> +}

Instead of this, please add ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT and set
it in the .capability field of a multi-cap entry. We do the same with
ARM64_WORKAROUND_REPEAT_TLBI_SYNC.

-- 
Catalin
