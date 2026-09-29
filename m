Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E133914E8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710962; cv=none; b=fAJ7YjCv2ORchDkcrmih5GXYXZtfoLY1qifMm6UsdQeRRoiWRGYmFZnxA08hQgK393Afqijn/53s3KAggKV77+N98rkw3gGS1qdTzORaSDb07QtAgT9SXn0s7mN/GzonXC8J0uGzKGMSyPREFycqJaXbpqr6ZJI+pATBVy97OIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710962; c=relaxed/simple;
	bh=ESSzXC3ElNzYM9W3zJWJEtqXMttntxbSA8BNS/JPV1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R98kwiUpzDIyR8XIMh7a47ODKPfJukPN1D7E6vyfeAlGHPigiQpa9oopSILzRranV002kun9zeafdrvA3GuLpN+eHwOVeNbzH/V4WLeIr9fcHA695Qz48qy7Lmv//vt3/L5YRUba5yoUpsyfNO7B0QHt5CYe0zEoiesrRyHVVho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OW6eCzzi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OW6eCzzi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF91143D;
	Tue, 29 Sep 2026 12:42:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1CB3F763;
	Tue, 29 Sep 2026 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790710960; bh=ESSzXC3ElNzYM9W3zJWJEtqXMttntxbSA8BNS/JPV1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OW6eCzziJsXe5B/0ftjUDaCx3pFCKpJogr2XrGrjGlj1HY+KgAsmzP7q4kQK7ZnN4
	 PL7WBZj8nkyQhI73V4GkNOAeaa7sRHwBarJjE7iZp9Nks4KCR6HMvkmyAYOulajdvO
	 bL2B8Zq5Y+dWNg6ATfPqUeVF5ny7R9B49G0hqokQ=
Date: Tue, 29 Sep 2026 20:42:36 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <arwUrOYn0NVySdzm@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929192051.GN163130@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929192051.GN163130@ziepe.ca>

On Tue, Sep 29, 2026 at 04:20:51PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> > This series adds support for Arm Confidential Compute Architecture (CCA)
> > measurement registers in the Linux kernel, enabling guest Realms to
> > access, extend, and expose measurement values for attestation and runtime
> > integrity tracking.
> 
> I'd prefer not to add any more tsm_measurements users until we bottom
> out on the attestation subsystem.. Mainly because it establishes uAPI
> that doesn't really do everything people need from this stuff..

Tend to agree. However, I think this seems like an integration with
the attestation subsystem.
IOW, although the functionality and interface are currently scattered,
the functionality of the TSM MR doesn't change —
showing the current measurement register status and generating
a token with a challenge. Therefore, even if the subsystem is refactored,
I don't think this would be a burden for it, and personally,
I'd like to see this patch series emancipated from almost six months of waiting ;)

> 
> The actual code seemed reasonble from a quick glance.

Thanks!

-- 
Sincerely,
Yeoreum Yun
