Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA02370AF1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237729; cv=none; b=F0ZULSdYSCRORZTkS1eaPIEAee7Pm4axYxJp+m1BruOvkUrg7rfeAAtBeGHFe7SuxhKwL2JONg3TgViP1xP0QWuK2P8gcKL2UzCO+MJf9Yi7CTmheGlbnZRnAGZ7Px+O/eTbZ64hkiuZqtRO+w1WLpQ3tSCwK1RdgywrQZqhuzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237729; c=relaxed/simple;
	bh=bbPKodBsTD8o9fnFiQlXwV//WWH8PGX15cI1FLSig+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlNRSrd26REdrYy/s/Ybn3SK4WYdnRYA48ckUZGNbVhLoB9D8Hn67f3YpZUduZ0b4WLwVVfEXjvpNyY4Szn1a/oNgn3k2xxUELEfrC/eq7lbrDug66yeg/8VtrgXDi3b5NI07keHnhHwVjl5UvE36zFh07XGQUbWwvOi0E+mdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h4yuxPqw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h4yuxPqw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA0D1516;
	Thu, 24 Sep 2026 01:15:21 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4C883F86C;
	Thu, 24 Sep 2026 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790237725; bh=bbPKodBsTD8o9fnFiQlXwV//WWH8PGX15cI1FLSig+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4yuxPqwR5ArBfTPDWeyWPGcYczjQhB9+FWbSfpiL4/azgDNoHq5ymkM/oDYLYvCj
	 dLvCEqw8EZXqOJcgv1E8fHR9cYvmkWU8HeJVt+G2dUKgKVfsITCOVo4ZaSwKW+wdR/
	 b12uUdFMR5ub2JxqQ96qmzzODBuM29VFewD6MGRs=
Date: Thu, 24 Sep 2026 09:15:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: Check runtime PM resume result
Message-ID: <20260924081522.GK200420@e132581.arm.com>
References: <20260924001906.715322-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924001906.715322-1-oss.patchbox@gmail.com>

On Wed, Sep 23, 2026 at 08:18:56PM -0400, Yuho Choi wrote:

> @@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
>  		goto err_module;
>  
>  	/* Make sure the device is powered on */
> -	pm_runtime_get_sync(parent);
> +	if (pm_runtime_resume_and_get(parent) < 0) {
> +		module_put(drv->owner);
> +		goto err_module;
> +	}
> +

There is already a patch that does something similar and fixes the same
errors across the CoreSight folder. See:

https://lore.kernel.org/linux-arm-kernel/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/
