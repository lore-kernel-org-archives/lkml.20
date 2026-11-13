Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565561;
	b=EYCF0Jcew3kvCLVMvw0EH+bDrG+B5gcHQvmcbiXjqz+ykws6e2l5TU+X29XOZL1s5/aq
	 06qVbH3mjfUHa/3pub/r3DfIzZDQzTvmgeCQLJ5gtI/gd5zcp/hp8lElA9wn6fZpFwkES
	 qWuet1bbf39m0Gl7am3miErbfqiSVpqbBvU58ol30GfoJU0+NRW0DFPgzAMgZ5s4rUdIm
	 se/IwlG3m3nirkoSIE5Rd5SYD8dQaPRKqMf8IOQKnAT4Fby+VS+fooEF1ISYTCEmsdF1O
	 StHxYK4Hm9Jmj7vVWcsasZVz+q9FOWCDFRIsjLnCmddMkCiMh4V1rkNPw4pm8imdFgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565561;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PujtvIjLoeXZpAZ6ifkKMStRo7NhiyUQ5xqJMqtqeRE=;
	b=CQKZ90yl60QHhc1QZVJZbp42P96SBh+9AcIyYgkTaxKSiHss8ADFkK4P6p4c2MQ/GoZY
	 weiN13QPJgZQjwYrVJWIGNTaLK3UGDPAts/2OULW8iLxxkaDEF04mFI9bmlV8dd5bhpav
	 KKHJ8LuHoQ+cS3BC0zlh8fkEwMairq1v+CMCJa1qoSRc6bnT89xdTZ+CH3hKqsBgSpUCK
	 cESv35C3tjBQQL0BG9+maqADILbIJo0Zu3MjLe70CS8r/K4JIllv/qywnX/zBKEGC0Xr8
	 jkQV3LeKzEz4pfO9NwltWV+ORY+4HVK+f8GAtb/kktnBo22Hk8uFpeZmgKp9bjZN39g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CZsPsK21;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FD5606A33A;
	Fri, 13 Nov 2026 10:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FD5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CZsPsK21
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAA101595;
	Fri, 13 Nov 2026 02:25:55 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC423F673;
	Fri, 13 Nov 2026 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794565558; bh=MXaBCEW7pnYGChTYZdIgJBCmAhhgs3Be++fXRUvle/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CZsPsK217kMIzDBOUH8frK2y78qdNaP8TEK8V1qTXBqKdywXLc7wioa7djEL8kiC3
	 bDLR89rSX+/VSGjPNQWj7taS1y6dwOpqL57jT19QvVxCQsTdJyDgGZbofGrQdrR5VY
	 F+enLVQAYImo+YbS2H/ik+QLfWRYSKdYPhAmH/R0=
Message-ID: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Date: Fri, 13 Nov 2026 10:25:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
 linux/coresight.h
Content-Language: en-GB
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 02:49, Songwei Chai wrote:
> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
> generic ARM CoreSight Software Lock Access Register sequence, which
> is also present on non-CoreSight-labelled components that follow the
> same architecture (e.g. the Qualcomm TGU). Keeping them private to
> coresight-priv.h forces such drivers to duplicate the exact same
> definitions instead of reusing them.
> 
> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
> include/linux/coresight.h so they can be shared outside of
> drivers/hwtracing/coresight/ as well.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>   2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index dddac946659f..0d3f6229b282 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>   #define CORESIGHT_ITCTRL	0xf00
>   #define CORESIGHT_CLAIMSET	0xfa0
>   #define CORESIGHT_CLAIMCLR	0xfa4
> -#define CORESIGHT_LAR		0xfb0
>   #define CORESIGHT_LSR		0xfb4
>   #define CORESIGHT_DEVARCH	0xfbc
>   #define CORESIGHT_AUTHSTATUS	0xfb8

Move all of these register defs above to linux/coresight.h. We can keep
them in a central place, in linux/coresight.h and drop patch 3

Suzuki


