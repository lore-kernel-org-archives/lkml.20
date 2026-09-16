Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638A84E80C1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554658; cv=none; b=M4zqMPImRalVhVm7ntAEpHGhCkBD6ue7DiUH1nlqq1vue1Ds7wGB6CMIfvubmWGSebWklMJ6+ojQyT8P1YcX9lQFcCgK9FqxndPp8LG+KikIDXOq7Mq2cV3AtFeAXNC2C/JL9lVxEmWTwLVdgG3gsUUgGEE2XHBn+do4/7ltWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554658; c=relaxed/simple;
	bh=zn63cm/mRTcrEP1XbNHHeSVGm3J5bUYZLy6K+aCa8t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/ctp+BZzDS5qlFLT0vqArtiJnf1cE9sFbPFoVydS9eMw700jf+xRVl81e/8xv2pPTgrHSMitiEM2vBzoxd0aqRI0jTYQKSO3TXFbjps9OlOW+jLLCIIs2rHEM9vZXSc8UxfjWW9zGSMZOah/Gh06uSLgn0b1rTSFiawVA8reFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y/cNdbP3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y/cNdbP3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115FD152B;
	Wed, 16 Sep 2026 03:30:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2073F882;
	Wed, 16 Sep 2026 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789554644; bh=zn63cm/mRTcrEP1XbNHHeSVGm3J5bUYZLy6K+aCa8t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/cNdbP3zllaWYF53BXFM/UbYsHBifjobDxKZbicVgR4+d3X/zvvao5hrk6LDfPjJ
	 ywtt3Is2/VDNoihyEoLO+4Py2hp1bcBD8fS+gENV1YRFDg4jrMj2VfAv87fA9/WnnH
	 X5MCrHsjV6B6nLaQ2LVHGCYi/LDX4jOef4I7PSck=
Date: Wed, 16 Sep 2026 11:30:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
Message-ID: <20260916103042.GH200420@e132581.arm.com>
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>

On Fri, Sep 11, 2026 at 03:28:52AM -0700, Yuanfang Zhang wrote:

[...]

> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.

The change makes sense to me.

> In coresight_get_ref(), unwind the module and device references.

Sashiko reported a pre-existing issue where the callers don't handle
errors returned by coresight_get_ref() [1]. In this case, we need to
remove nodes from path->path_list and release them. However, this
should be done in a separate patch.

[1] https://sashiko.dev/#/patchset/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11%40qti.qualcomm.com

> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Thanks for the fix! Feel free to add:

Reviewed-by: Leo Yan <leo.yan@arm.com>
