Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73A03793A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337335; cv=none; b=s1I9421qepQBOUaL1zQemvp2K0Tfjw7uBiaVhzYy2L9Wz/NrV6/vFoQJ9lcFsXU8zkWOyI5kydxba61YXqBvPegslqIkgq8DkcLIkQJHfeql934dO9kgB7N5PXMZXwb2xsY9tm+4wAazwLUSIBep2jG+PY1WdbrBbw4IaZOIWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337335; c=relaxed/simple;
	bh=9MiN3QzSmXdgia/8lob+j+XbhRoK1g+B5kT5g2UcUDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYScctdojuCGiwEZz9LwvhwR2rAjnhftt1DR7nBo75rquGn8gx9RW6N/DfBTz5l9ba9IlHKNdeIlGGgIjpNzCRmM7z+FY5ZCbQHo2sqOghnJoMSNYDG5G/fz0y29UPGD/bsgjPo+AxOHGySgU6EXOlVbt/b4jBHQ6Xz+hpP0xdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MY9adDtb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MY9adDtb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC5AD1596;
	Wed,  2 Sep 2026 01:22:07 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 369533F882;
	Wed,  2 Sep 2026 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788337331; bh=9MiN3QzSmXdgia/8lob+j+XbhRoK1g+B5kT5g2UcUDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MY9adDtbW4ftsbCzeffHGw/chFqsRsH/bdfRl5u/oH4RUpqQZ+4hgrm/IiEBBZSrF
	 E5GQBPgqwpE6IuGYWaKOLl8D7bHtA0fdF5kh9Cv84JpdQa83ojInkvE086Dbyszcu5
	 DaI0XHjZ1URfBBPk69G6d0uB+/QYnRaIv5VrbBDQ=
Date: Wed, 2 Sep 2026 09:22:09 +0100
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
Message-ID: <20260902082209.GT8904@e132581.arm.com>
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>

Hi Jie,

On Mon, Aug 17, 2026 at 04:50:15PM +0800, Jie Gan wrote:

[...]

> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>  		/* Assign a trace ID to the path for the first device that wants to do it */
>  		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>  
> -		/* 0 means the device has no ID assignment, so keep searching */
> -		if (trace_id == 0)
> +		/*
> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
> +		 * means the device explicitly declines to assign one (e.g. a
> +		 * pass-through NoC) - in both cases keep searching downstream.
> +		 */
> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>  			continue;

Based on IS_VALID_CS_TRACE_ID(), I see 0 is for no ID assignment,
could you improve a bit tnoc.c instead?

If so, We don't need to add a new error for the same purpose.

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..bf221c1e5c48 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
        u32 val;

-       /* No valid ATID, simply enable the unit */
-       if (drvdata->atid == -EOPNOTSUPP) {
+       /* 0 means no ID assignment, simply enable the unit */
+       if (!drvdata->atid) {
                writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
                return;
        }
@@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
        int atid;

-       if (!dev_is_amba(drvdata->dev)) {
-               drvdata->atid = -EOPNOTSUPP;
+       if (!dev_is_amba(drvdata->dev))
                return 0;
-       }

        atid = coresight_trace_id_get_system_id();
        if (atid < 0)
