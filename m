Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235BE5616C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884302; cv=none; b=dCZLd+0or+bWQGbzMQkvuwbHesa3epfj7RqxAZZE2yrEx7C95zgSiNXm9iwqenpoCS7mpuB8BSy3mWrhBpu6kZHNZPNc5iWIwhSXsIcqzVK8ofaA5j51id2rs7GgdXVeTpd4jDgLvh81nrWhnYPZwEpsS+k4l2x7X93uwFfclaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884302; c=relaxed/simple;
	bh=5KmsMGRjTRCkCrZBj1mOXRRUXRJYE8pnrPLj4tCEBhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHcs0Rs9yABz0gNSG62HmEKYNPUCK5T07X6du3eGAKSXzRpDdI47nwVfJOu52LU+u4QpBNShc6jO8w16k6NuCOivqZJpIuW/s9vEpeukRyK152zzj1Mm5buPME7MGwHHOGyuK72mx77Ww39biAek2DngEiXoIHNuPodPnfj0ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n/1bBiPR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n/1bBiPR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFB2E1476;
	Tue,  8 Sep 2026 09:18:16 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08DFD3F7B4;
	Tue,  8 Sep 2026 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884300; bh=5KmsMGRjTRCkCrZBj1mOXRRUXRJYE8pnrPLj4tCEBhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/1bBiPRjZbw6wj8WAAIzJpzYC+lfB+d+VxzHZSrlPYbbLiX+ZQuXSX6pQOIL6xC5
	 zN4ITrTuVWbB4lm/xWH8AZIoXKu7M6OVC9gbRtXWbgCeGCmkcIgl/YXOvDXhMFSbIo
	 jrWv7W8PnSa+j5qd9kw8jqMp5X8rMXyE4RAnzorc=
Date: Tue, 8 Sep 2026 17:18:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>, jinlong.mao@oss.qualcomm.com,
	qinyungao@kylinsec.com.cn, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpdm: initialize spinlock before exposing
 sysfs
Message-ID: <20260908161817.GB200420@e132581.arm.com>
References: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>

On Tue, Aug 25, 2026 at 10:06:47AM +0800, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> 
> tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
> the sysfs attributes registered by coresight_register() use the spinlock.
> This exposes a window where a concurrent sysfs write can lock an
> uninitialized spinlock.
> 
> Initialize the spinlock before coresight_register().
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>

Reviewed-by: Leo Yan <leo.yan@arm.com>
