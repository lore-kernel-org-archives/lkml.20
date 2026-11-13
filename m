Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566098;
	b=ulduk/gU7E2NdZobhN0kVUsVYYClfwxVOpqFlUuGXqFB/Fdbr3bvxJzSWhI0jUMnIBw2
	 Xr3w1MD4U1YrvNTNFrnICqZzkZipcPi1ke+QH8wrXLz+qra8Hs+U2HOWO654RVV6IwO0n
	 T154tBkQ+Xv3i52Mkeqxwq2PIOjDr1++gN6p21Ol/d/2k/YwaBG2VC2AoT2ifVBvK+FlT
	 8gvClyWrtvXkiEs0Hwilu5QGDcyxlnSpzcz9mxQdq5W3TvxOfpGJX3eNkYNn/4gY7zfsI
	 ZT5S8kbT9bl4DaKX95GCDkVGDDug/xgGE4QDhMXgbm00O84CkoJf1QZGGn+QEaMmpXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566098;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UpzUl6Ub7qj0VCNsKpvsnstUGxXQkrlCAFOk2MgdIm0=;
	b=UajlcLaDBdNj7De8+rz5Up3J3xM5QUeCbpy4iSgcDP/OO7n3i3/R0t0FJvea0acIY233
	 kOkbViKn6NUiAt9QKKdQK2j4qEUJAJQM8WW/zkjSLTjCV6vqf+eYMoD6LSBPImjstugdF
	 S0bHScH/SZuS3cUIgTyA2SfElPo8PiwIjNoUuZU/+kjyIpa71jmYHOzm4MWM6Tm4jAL7i
	 UHkmz0TQmiFvq47r+MG2AvlT1Euctq5WwarmXSZDEDxjuZxd4ptlt5gpd1JS5tOAX9QJS
	 Sx4WZDTI9e/R9j5MN8LI0J2cviprYOcfQ4DuUvbUrWJMPb4/aF58BaAxNdg3oaYbV2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CfPYA20M;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AD4606A339;
	Fri, 13 Nov 2026 10:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AD4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CfPYA20M
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 377331595;
	Fri, 13 Nov 2026 02:34:54 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20A463F673;
	Fri, 13 Nov 2026 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794566097; bh=V47alnlPPG/CS5dBHeIwkAec8FR4ukqqWs4Hqwo3pbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CfPYA20MM+A5raPXZDz/mUuGGSSceVaPtpGRqFXjqpmrwk7iSsXl4K88biuBYGQ0Y
	 /6UK9BK/uaXymBQaGK8AU3xFZCiHtbgdQ6welb17yYdietgRP0fE7p0ECzsj8ZuGD2
	 1vYoQOxgNIDxJJEZPsUX5oMzBH5TJhmZfYj6u80g=
Message-ID: <a627e328-93b8-4550-a521-1fa78e326aeb@arm.com>
Date: Fri, 13 Nov 2026 10:34:53 +0000
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
Subject: Re: [PATCH v17 03/10] qcom-tgu: Add TGU driver
Content-Language: en-GB
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-4-songwei.chai@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113024935.3173715-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 02:49, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   MAINTAINERS                                   |  11 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  31 +++
>   8 files changed, 270 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..66b12ffc2892
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe23913b1e43..faf8706b6584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23264,6 +23264,17 @@ S:	Maintained
>   F:	Documentation/tee/qtee.rst
>   F:	drivers/tee/qcomtee/
>   
> +QUALCOMM HARDWARETRACING DRIVER

nit: HARDWARE TRACING DRIVER

> +M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
> +M:	Jie Gan <jie.gan@oss.qualcomm.com>
> +M:	Suzuki K Poulose <suzuki.poulose@arm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
> +F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> +F:	drivers/hwtracing/qcom/
> +
>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>   M:	Bartosz Golaszewski <brgl@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0841ea851847..f37edcf34e0d 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_USB4)		+= thunderbolt/
>   obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>   obj-y				+= hwtracing/intel_th/
> +obj-$(CONFIG_QCOM_TGU)		+= hwtracing/qcom/
>   obj-$(CONFIG_STM)		+= hwtracing/stm/
>   obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>   obj-y				+= android/
> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
> index 911ee977103c..8a640218eed8 100644
> --- a/drivers/hwtracing/Kconfig
> +++ b/drivers/hwtracing/Kconfig
> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>   
>   source "drivers/hwtracing/ptt/Kconfig"
>   
> +source "drivers/hwtracing/qcom/Kconfig"
> +
>   endmenu
> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
> new file mode 100644
> index 000000000000..5c94c75ffa39
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on ARM_AMBA
> +	help
> +	  This driver provides support for Trigger Generation Unit that is
> +	  used to detect patterns or sequences on a given set of signals.
> +	  TGU is used to monitor a particular bus within a given region to
> +	  detect illegal transaction sequences or slave responses. It is also
> +	  used to monitor a data stream to detect protocol violations and to
> +	  provide a trigger point for centering data around a specific event
> +	  within the trace data buffer.
> +
> +endmenu
> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
> new file mode 100644
> index 000000000000..5a0a868c1ea0
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_QCOM_TGU) += tgu.o
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 000000000000..ac1ae8bb0ec4
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tgu.h"

...

> +static ssize_t enable_tgu_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{

...

> +}
> +
> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit (TGU). */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{

...

> +}
> +static DEVICE_ATTR_RW(enable_tgu);

minor nit: Do we need "enable_tgu" in the name under /sys/.../tgu0/ ?
Couldn' this be "enable" ? Also, the function names could be named
as "tgu_enable_store/show"

Suzuki
