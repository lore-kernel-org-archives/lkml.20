Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726173822BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338743; cv=none; b=Lib5CghX1rQaYsgsTZznZk74t8iAJTWFov3PgUJHBzx5g7JF/uBRP07qt0uT5ACxsxCL/tQutC/2Fx8k9R5wXoCyg1lf+qRbsWPbljweRpIYut8YUSLMAENlaAbKhgeA6ITSzRI/LC2ekIWB9Yn9mQUTbHr3NHm6D3V6DjCBDxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338743; c=relaxed/simple;
	bh=XucUdvkzablK28p8Ekz0QJOW6saMEkHDPRLu4xhDzLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXMBpnQ8Nk4hTU038JBKA5wfGHYzCyhAmZ94UrONSvhPbiAY37e1IU2xHdx2n56UQlj9wCAEO71lLkNb7hDU+UohoM1vL2DTv8Qluoa6KZeRLkeujOCQrZ63t5WeJbi96Euk6o4ZZdAF2ePGhjCNLYytiRt4wAY3d3v9J9jFFJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q2oP2/Oy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q2oP2/Oy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F991596;
	Wed,  2 Sep 2026 01:45:36 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F83A3F882;
	Wed,  2 Sep 2026 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788338740; bh=XucUdvkzablK28p8Ekz0QJOW6saMEkHDPRLu4xhDzLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2oP2/Oy5BkQaL0ueJtKDfAO1cuQovtrko/2IhZSgcbPqxMVkPhEL2CmuThOfRamz
	 OmlzENP30MnKlPSZHxQYsfT/xWxdKbfhoJJNSQizr9QKaL2Mf9hqR5KJUgAV09sS8M
	 PlNc5OaGF/e3NiPxdt/eaGg0XVEGfe0m0+iUbyZQ=
Date: Wed, 2 Sep 2026 09:45:38 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
Message-ID: <20260902084538.GU8904@e132581.arm.com>
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
 <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 04:35:11PM +0800, Jie Gan wrote:

[...]

> Hi Leo,
> 
> Thanks for the suggestion.

You're welcome!

> I will fix this in the TNOC driver. I agree that there is no need to use
> additional error codes to report the failure.
> 
> I will post the new fix patch after below patch[1] to be applied to avoid
> conflict.

The patch in the link has no fix tag, but current patch is a simple fix.
I'd suggest to give priority this patch - this is friendly for porting
to stable kernels.

If there have dependency (based on your local test), you could explictly
mention the dependency in cover letter and resend the tnoc probe series.

Thanks,
Leo

> [1] https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/
