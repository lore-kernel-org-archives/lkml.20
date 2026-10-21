Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593603;
	b=ImZpaBRjl9+Tv7jl6oMapW4/1aXiXT8rqVABmD+PMjCA9ycndfMEU6GCxc1FTYW1Ak1f
	 BuqVLU41pfEqr9yWJ9Lr0RADqwXSgerPI5s2niAjsAq0cdgub8qgGoxGjSea1HSt1htIP
	 jzkRif4KZdsufbiQ2OMDWn8EVuR4dnCb2XypRVqjALm4M5xffl2hMe+T4PhC4NHfeU7/G
	 lCMlseYo4JzmPI/ecgGESTsKc50DUbQ6qp3Yv6QVs+7zWHuFG6Xd2k/9epSrTFL3ocMNO
	 /XTuK/j27HefNNAAZDO3apPsXQxoQ1z5ZsAVt7C+X73eX3fy2ik1yrKcr+YLw2ohXRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593603;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1m78tWGGeDJIH1O9K2lE2ESdNUNdQQcLVxQs2dYVHn4=;
	b=1LS5xvOk3yO/7b6DBq2le1EJsyadse4W5Z3bXubD9GljXlOYO+/W0pB5eNgnT1AEkn33
	 OWXmCSuWG9j+Doxn3HexwCSOBS4uEBSmvlw+IfLJr2VvavGkx5LD4/r/bXOU9ZogbvWwp
	 +Zf4THlLw3Qm7eDoywh66BVq5kZHZ5eFUyy/CZS8HQGpxODv3srUPgsDduyt4jxYFhLvi
	 FbGJlWvndqZm854A4RPRuf7dRrGWLtFKUkGGxzMu7s2OFccD9fcvy5670QlUudUeCA12f
	 mmtnBvcDuiCGYQ+aro8dlSfalH41bFaMx7Sa/wkQW/4/y9R+5p/FKqAKuc8s1HyhkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjQkMejx;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7020606A31A;
	Wed, 21 Oct 2026 14:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjQkMejx
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D3B2880;
	Wed, 21 Oct 2026 07:39:57 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01FF3F7D8;
	Wed, 21 Oct 2026 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792593601; bh=QRNpGsebJ+fw8gymcaKJxQJyRKlhooI9CG4j2vpkYXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjQkMejxD6ErdyhS8yadWEEQeMWR2Tjn9W52QMOWm+Ng9DG6zxtgT5xsnwpiaMU+f
	 3pnKhlIsV15kzsr17226O0yToPuV0g6AvFm+R/UCoWlVjKY3sXLMtD4nkEJ02/VDLP
	 vF9VO3y/nOTKObHpp+Wn30wEtpCELCWIvd2sO42I=
Date: Wed, 21 Oct 2026 15:39:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities
 separately from device class
Message-ID: <20261021143958.GH26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-3-aaupov@fb.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012230527.750567-3-aaupov@fb.com>

On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -30,6 +30,12 @@
>  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */

It is good to introduce a marco:

  #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)

> +/*
> + * flags defining device capabilities a feature can require. A feature loads on
> + * a device that matches one of its classes and has all of its capabilities.
> + */
> +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00

To make the mask explicitly 32-bit unsigned:

  #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)

> +
>  /* flags defining device instance matching - used in config match desc data. */
>  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */

Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
unused and could be removed in a separate cleanup patch.

> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a816c22c87bc8..1545d64afec01 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
>  }
>  
>  /* load one feature into one coresight device */
> +/*
> + * A feature matches a device that shares one of its class flags and has all of
> + * the capability flags it requires.
> + */
> +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
> +{
> +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
> +
> +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
> +	       (csdev_flags & caps) == caps;

For clearer comparison conditions:

       /* Class type must be matches */
       if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
           (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
           return false;

       /* No required capabilities miss from the device */
       if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
           return false;

       return true;

Thanks,
Leo
