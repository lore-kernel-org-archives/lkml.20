Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E855743F8AC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826418; cv=none; b=FHcqK/hExW4xxhXegbV1bZaHj8HTQVriHZnPMo5o93UKPLLqmM74/Ur/RpP31FS6cJG/KSRVHVNiJXFD2f3o1KlHuZ4+bbf8z7ee4jzrCNNT9GAC4xO4tt1kI8rMeW0nNzDMXjo4I1hIVRowcHmX1wUs5IyuC6+m9iD4SXX5inc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826418; c=relaxed/simple;
	bh=YnYMulZPGu41LR1PNsZBIVg2v4O5Tm82x/NaKiQ8XdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWb5zXZunVi5CP4O95uy3UqoWs0T3DihA4vyxWOKUadEmp8fYflQNdl9tYU15w02wcfEBi1TF9fB/dTP4lOtL5H8Mf5Az84jcWvfOfc4EeMiNTM2kL3yCWrT1qICxNP0ysAri91e9E3IHzIVeOtrsPMZdTMq0BanMOAugrs6y9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Waq1y0lX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Waq1y0lX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1B561688;
	Thu, 27 Aug 2026 03:26:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7709E3F85F;
	Thu, 27 Aug 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787826410; bh=YnYMulZPGu41LR1PNsZBIVg2v4O5Tm82x/NaKiQ8XdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Waq1y0lXQXQliUWthqaocKtWOkHSZ13e9mwpO/K6qwap81T+gguibmGGTQ6ATFvCf
	 bQmYTUJbQelvTi0WplSxnQsGS9igHYRJC9JeB89MbaX+d+j5HKBEVNeQmAB0Yahvx5
	 yDkhFXYW2oCb+GmSxOlApsaw4KoU/pwo8UKCYTNQ=
Date: Thu, 27 Aug 2026 11:26:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <apAQ4gc71DiGmDO2@arm.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809180600.6049-1-kmehltretter@gmail.com>

On Sun, Aug 09, 2026 at 08:06:00PM +0200, Karl Mehltretter wrote:
> This is similar to the arm64 patch [1], with the difference that
> non-relaxed (cmp)xchg is used as in the existing ARM code.

The patch is still valid. It's safe to use the relaxed accessors here if
you want or maybe do it as a separate patch for other atomic ops in this
code. I think at the time we added the ASID allocator, there were no
relaxed accessors in the kernel.

You can send it to Russell's patch system.

-- 
Catalin
