Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CCE3F7869
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342753; cv=none; b=rIAfaogV6VWCQFLX1Da2tf9V1hLHIGtVdiumqvDgA36gxTpzRe/nO0BlC4Eo8cEWYbndzRnXc2PzeRfj3ko9sm/zeYZS/PWfrTLOyQrV9Ze2UnTbgJnm5U2xaZ70D2Jc1kTQioXnOxtioA6fSgQo/xtRNayzxwri3HiTJDnSv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342753; c=relaxed/simple;
	bh=vj1d2Hjcr0LTR9YKWkQUvHNJIp5hxBB7jPIEGGLJ+IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKlPsRZvg2/CQTDNH64siwkSN9rDMR4rJl4lZ+F6wCZnkkeOuDhO94ZHEIu0EfEgW4uTaJOgFjfz3iSX4WY4UPWQrllCJbSJIrFRczAIeRhrcUQ2DmzENsd70QL4ej9mnB9X0PyXWLbuMeBxDLCrW2rAW6eETIYqk3QgnOkAUCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AISmhtUO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AISmhtUO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E73B165C;
	Wed,  2 Sep 2026 02:52:27 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C12B3F85F;
	Wed,  2 Sep 2026 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788342751; bh=vj1d2Hjcr0LTR9YKWkQUvHNJIp5hxBB7jPIEGGLJ+IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AISmhtUOoPLVaPnw4xik8vp0nRlAZ6FnZ8yIu8D5dNxky4l3GNuToxt6+kyh451sp
	 B53F0ch3P9VhuqeQsXctnzEjN3PYED58wlaaBdbDRZYxm2PKtMk2pKz5qe9oeUldOL
	 J9BC71uzBuw53LkAszGnAB2DmtADvJLq8jVjALqI=
Date: Wed, 2 Sep 2026 10:52:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
Message-ID: <20260902095228.GV8904@e132581.arm.com>
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 05:41:43PM +0800, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> Use 0, the same sentinel coresight_path_assign_trace_id() already
> recognizes as "not allocated", instead of -EOPNOTSUPP.
> 
> Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>
