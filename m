Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2949748F836
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527403; cv=none; b=Sg0J3iF7+zHbBF/hDmvm9FMC/wIyCH81+hIyd+Tb2QzRNf6xrQJrEQE6d6WrKD1c3lvLxyzCeWuu4JvxYSah3uYfyDMu9he6DZ+kI7l2+xZjaqF1gkCk74+hSY4EbBc7UZwuXyqg7H/0srk/LCK/Cqtw8ddJ47ifRex+u5bN6Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527403; c=relaxed/simple;
	bh=Buk1pSC3h+5PIkfGT8hNX+9x2qy/QYsGPcAeihFCLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKbxskD2Nh4S3KpO274wYUvTDNJ3Y0V/Dy+XwtORp6Jfeap0vFWvobhmafVAhAWNueFD0vnqBDUS/Pgnw/hbjLRHqJTBrol0x8wU8NeS/fP5XRVhsPQj+oSRcqDBldF1W4vWJ/B9fagn3St5klcyGxeIQX1EfxzpzpBoqJqgMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ml3oAUnY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ml3oAUnY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BA49153B;
	Fri,  4 Sep 2026 06:09:56 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F2D3F7D8;
	Fri,  4 Sep 2026 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788527400; bh=Buk1pSC3h+5PIkfGT8hNX+9x2qy/QYsGPcAeihFCLYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml3oAUnYoKr6Q2yLnXICRSO6D6Z0iysd96ibV7vkftWobxajbP3Ikm9mjWsQXvabx
	 O4ryFaVeOHgutQCw+YJLDgXcXBsTStJxMRq47XLj2ojqe3C25BhVa3vVGFsl0IOq0y
	 v/mcPUUwTAtphBi4YvB34FNfJc76CQGiwuSaKtIU=
Date: Fri, 4 Sep 2026 14:09:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: fix typos in comments
Message-ID: <20260904130957.GY8904@e132581.arm.com>
References: <20260904111054.22485-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904111054.22485-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:40:51PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>
