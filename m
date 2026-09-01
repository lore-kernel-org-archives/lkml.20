Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F3C3515DF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280848; cv=none; b=eMnKRBv1DBQA/UPlGB02FsrKXmApZWiI4rSR4f+L6siv95wGrOkD43q08nT/yHRLSwKbrZhQwIx5BLHYe8BxWlVGBFncZx2t7O+zr1t1ODJbo90Qp8c2cMDD/qi+P6NK5S10+NCStwUEqu2n1L/X4CfZaGP3wzFCvk/3Aupy9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280848; c=relaxed/simple;
	bh=phnRUbVE70oVuIQH/cr8MeODjJbWljXef1k1i13/I7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxUjggPJozohxqKJ0+9GAtv5JzdZCu3UwN5wGwKOeI+7hKeGOU/+piNnKIZnFDTliax8CHjQ1LPFYtIC7vSL8LrCcjn4KKtnD0IwgbnTgwmoXh8LDqjKPqgjpwrjm8StIweujo/fl2FxRaffG0y0KAO3DiEGzCpFCZDTn8Jz6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m4dVtvP0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m4dVtvP0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F7A1756;
	Tue,  1 Sep 2026 09:40:42 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6C9F3F85F;
	Tue,  1 Sep 2026 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280846; bh=phnRUbVE70oVuIQH/cr8MeODjJbWljXef1k1i13/I7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4dVtvP0hAN14T/hSk8Qv2GRDF6PBoyWWXfwid9uJ6Xyd4WngOIyXCWV/s38lWX1F
	 P6GZU5fMRAJFISCZI/+y+5g2hvZUx54spko+fOs9iueK4YFGydjvAHXh3u9s6HM7QE
	 9w3re8uMmq3B+pU2MxScx2SKSBO/0ifoK9fbA0Yk=
Date: Tue, 1 Sep 2026 17:40:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] coresight: coresight.h: add '*' to kernel-doc lines
Message-ID: <20260901164043.GR8904@e132581.arm.com>
References: <20260831030912.3399089-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831030912.3399089-1-rdunlap@infradead.org>

On Sun, Aug 30, 2026 at 08:09:12PM -0700, Randy Dunlap wrote:
> kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
> a beginning '*' in them, so fix these lines.
> 
> Also convert struct coresight_trace_id_map to kernel-doc format to
> remove another warning.
> 
> Warning: include/linux/coresight.h:173 bad line:
>   connected to @src_port. NULL until the device is created
> Warning: include/linux/coresight.h:177 bad line:
>   needs to be filtered.
> Warning: include/linux/coresight.h:236 This comment starts with '/**',
>   but isn't a kernel-doc comment.
> 
> Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
> Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>
