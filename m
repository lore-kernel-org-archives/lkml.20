Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587108;
	b=0UiekVn3Gyey+LGeppeeR1y982d8E1mKyzyC9+eTPlv9WlwnqQJhlO10MqMAm3LNdDPc
	 EpkrOEK7kxZvO0twoo6myUfkl9/Th+rqa/qDySfGQh8oGMQP9Xoq3Je34TdApUEe+b3Nr
	 Kx6JKIOnoXbj6g6jg+FpLw6J1Go4uWRU7c8KF8j0o1j40ppUIKmHLrjBTWR4UK5fxTwRK
	 dep7ICBC8VuYoLm+mKgzq4SPBpSQZdtaTTD+g2oSRDG4RC/SNpNMRd79Dcjd90+qeYhBK
	 gIR172rLPlkDFYIjSjAijqv+BXR/duByXvRv8los1iakSpvzUvsv8zlgYccFv3/L1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
	b=pwcGGW1WnPiOIgd9ezisQt8d7YDYzwjXY4ikdP78tZoVwOAI+aGn8+0od+PH3IEmsfwy
	 6iV6DlUTP+zKHozniibR0KZrnVhTBWE0LeiDVaNk+XCfTjH4oQyThiTnNmCJRMckeEBs3
	 XCKUD8Sz7F5dYDWZWEFzt8vNnDF9mnq8nn5lpxZq0gtVJs4UWvfCeZ2jbG3b35BzGejiF
	 UHS4qdKMZRtrxZfmnXEmmQdNulGoAWQYWQcDGaKF+JIuZJHmwdDF2qPkW4m5FMeblK6gj
	 b4Q6A/Ytzgr5K5NJA8dWWC31jc/FxUCUiEfm6LoHhMiE1BP8at34bHPFQpb6S42/u7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+hWe1Ml;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F62606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F62606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+hWe1Ml
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso5120558eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587107; x=1794191907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
        b=N+hWe1MlafDCYqV3M+XteIeGel/UGWSbeUJHYdVTi0dg7OLyYPKSN6IJnQQaVQJa72
         nNqekO1OTzXO52OBHnwAR5gxI+gkpqfJNUyueSGTvAeNXkOELfxb8TjA0LrH/u9tRpf9
         lenWamWfan9Oz17tyeD8/L80a17f1lf1AX5FqM4p4h5hUrJu1e+XcfhoulXJgWF2995L
         TDnZq0uXu63+voRXoMIm02Gmuhduh8ZnCgywdoPssQ1kghsotFD0AF5RHe15feAsUD6G
         m2qPMcqf95OZ3gvH4msTsE63FkcTn088ArIX8tu2PusT+yh1deveip/R5bL4c+iR0Qut
         SOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587107; x=1794191907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
        b=LkDTaLRXIooax35B+5YmaknUMVR3YWAcsEAMm8JZTeJ7RkVGPYazUASsXz2fCaS7UH
         HsVIxMf1GD6JCwp2FDKzaLLXCGyHOMySP8X7dO/w13D+PLi3rkLgntCKHkxWX9RTB+tW
         1p/mu2lX7s/5lOOgB2mSnvvtIyB+2SslJ+V9Lb/ZepUgQe/h/lO9onP9mLMq3Yi8L6yz
         13Jc1VHPVqFxVGW/nZ0UK/REdVC58l3OR8uuLKQIxOEzlRvrCGXQImcnmufnDVOZ7SHZ
         3VJdp4ruL3iDlmt+KZLCOBWxkR6nL8Dcl8lJDhf5wlo+dGwNMAcTcW+GAqzlPhqiKoI9
         roLA==
X-Forwarded-Encrypted: i=1; AKwUvBzZGN1LpId0c9bdsrBqI6rLLVbp3K83De/wk9PVJ30yi6yY1y71G0+WwbG+8oKYnus/dY1r+ga1HBvWNR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TDlLEBo036FSjh/etTdrRY0vp/i3/TsKvq33+Hxza9I35v5jf
	bjix6gprNSO/WSNFLVArvDSfz9L58YMqHGFgCXJ9n1X1jT7d7f3JmKbq
X-Gm-Gg: AYBFou0RMW3PvbQY7OA7F8ooV7rziVYDp3AbTMb4ZSK+PTp5D3tIPHkI2TWUb1Ya9oJ
	qMOtrnK3GAzC8v5pXW4o4LM8O+6lWsyBPb5Qhh5a8/bG/dYHIV870PP8aNCO1/Dg2PXEG9m+7Cr
	HxhII5O9z5/5xho1Db6iz+p4K+YnFsPdeJZ3HAQjqR5w+E2mn58VdEcFIMvhxmtfTFf9Dktu9mu
	znvyDQOus6yzVjEWtiFRO+K9bnqkUIWkHYXFhSPe/NkTID2r0ErtsACuJoWuaht1DdDXeXn3QOU
	IN9l1d74BwTHGrfbT53R52RXRuQOoTMFR9fGzmDT2v7ed/BbXckLmKE7RhfEOfx4pQb+c6yG8Tu
	HyZkkwQQT73Z/pBxuBvJndPa37thFtu5hX/RyRvXpuOTwSLKCYC68VT19oSec6FV90n7532SzGy
	F66eJ1wXC/2OcQdUBndSDM4PXacA64zB00mPc2PPkpsa5SACR2AkfuX5MJ5cFgOWyWErDUIn4u1
	YTA8Kdm01PF68aXSqm2brcGjnYmvI6kOLfnjQZouxb/vB9Jc4B3q0mruj9aDcyHvMK1rtpk3CXI
	6lzb69E2okULMiae6xTrqURr1eJI3IIole2xofP4KSQKcmr5k6CDjvVYl3We9uiJtPM=
X-Received: by 2002:a05:7301:1602:b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a423af719mr11569733eec.17.1793587106767;
        Sun, 01 Nov 2026 18:38:26 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm37000136eec.11.2026.11.01.18.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:26 -0800 (PST)
Message-ID: <af99559a-d37d-4745-b7b1-69ceac2978ed@gmail.com>
Date: Sun, 1 Nov 2026 18:38:24 -0800
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
Subject: Re: [PATCH 1/4] platform/x86/amd/hsmp: Move per-socket sysfs
 attributes to common code
To: Erwan Velu <erwanaliasr1@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-2-erwanaliasr1@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261007125908.321186-2-erwanaliasr1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 05:59, Erwan Velu wrote:

> From: Erwan Velu <e.velu@criteo.com>
>
> The per-socket telemetry attributes (c0_residency_input, ddr_max_bw,
> pwr_current_active_freq_limit, ...) are implemented in acpi.c, so only
> the ACPI driver can expose them, although they are plain HSMP messages
> the platform driver can send as well.
>
> Move them to a new sysfs.c in hsmp_common and export the attribute
> groups as hsmp_sock_groups, so they can be shared by both drivers. The
> ACPI driver keeps exposing them on its socket devices via dev_groups.
>
> No functional change.
>
> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>   drivers/platform/x86/amd/hsmp/acpi.c   | 321 +----------------------
>   drivers/platform/x86/amd/hsmp/hsmp.h   |   1 +
>   drivers/platform/x86/amd/hsmp/sysfs.c  | 338 +++++++++++++++++++++++++
>   4 files changed, 341 insertions(+), 321 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
>
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index ce8342e71f50..21fc1d185550 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,7 +5,7 @@
>   #
>   
>   obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
> -hsmp_common-y				:= hsmp.o
> +hsmp_common-y				:= hsmp.o sysfs.o
>   hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
>   obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
>   amd_hsmp-y				:= plat.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index ddd7a04ee753..d76979baffa8 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,9 +12,6 @@
>   #include <asm/amd/hsmp.h>
>   
>   #include <linux/acpi.h>
> -#include <linux/array_size.h>
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
>   #include <linux/cleanup.h>
>   #include <linux/device.h>
>   #include <linux/dev_printk.h>
> @@ -27,7 +24,6 @@
>   #include <linux/rwsem.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/sysfs.h>
>   #include <linux/topology.h>
>   #include <linux/uuid.h>
>   
> @@ -55,11 +51,6 @@ static struct hsmp_plat_device *hsmp_pdev;
>    */
>   static struct kref hsmp_acpi_sock_kref;
>   
> -struct hsmp_sys_attr {
> -	struct device_attribute dattr;
> -	u32 msg_id;
> -};
> -
>   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>   			      u32 *value, bool write)
>   {
> @@ -270,252 +261,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   	return 0;
>   }
>   
> -static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> -					 const struct bin_attribute *bin_attr, char *buf,
> -					 loff_t off, size_t count)
> -{
> -	struct device *dev = container_of(kobj, struct device, kobj);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -
> -	/*
> -	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
> -	 * It can therefore only carry the protocol version 6 metric table
> -	 * (struct hsmp_metric_table).  The larger tables defined from protocol
> -	 * version 7 onwards do not fit; userspace on those systems must read
> -	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
> -	 * Surface the unsupported case here as -EOPNOTSUPP rather than
> -	 * silently truncating the snapshot.
> -	 */
> -	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
> -		return -EOPNOTSUPP;
> -
> -	return hsmp_metric_tbl_read(sock, buf, count);
> -}
> -
> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 const struct bin_attribute *battr, int id)
> -{
> -	/*
> -	 * Keep metrics_bin visible on protocol version 7 and later as well,
> -	 * so that userspace which expects the file to exist gets a clear
> -	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
> -	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
> -	 */
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
> -		return battr->attr.mode;
> -
> -	return 0;
> -}
> -
> -static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> -					     struct attribute *attr, int id)
> -{
> -	return attr->mode;
> -}
> -
> -#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
> -
> -static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data);
> -}
> -
> -#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> -#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> -#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> -#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> -#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> -#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> -#define FMAX_MASK		GENMASK(31, 16)
> -#define FMIN_MASK		GENMASK(15, 0)
> -#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> -#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
> -
> -static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> -}
> -
> -static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> -				     char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
> -}
> -
> -static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
> -					  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
> -}
> -
> -static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu.%lu.%lu\n",
> -			  FIELD_GET(FW_VER_MAJOR_MASK, data),
> -			  FIELD_GET(FW_VER_MINOR_MASK, data),
> -			  FIELD_GET(FW_VER_DEBUG_MASK, data));
> -}
> -
> -static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data[2];
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data[0]);
> -}
> -
> -static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data[2];
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data[1]);
> -}
> -
> -static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
> -}
> -
> -static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
> -}
> -
> -static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> -}
> -
> -static const char * const freqlimit_srcnames[] = {
> -	"cHTC-Active",
> -	"PROCHOT",
> -	"TDC limit",
> -	"PPT Limit",
> -	"OPN Max",
> -	"Reliability Limit",
> -	"APML Agent",
> -	"HSMP Agent",
> -};
> -
> -static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> -					   char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	unsigned int index;
> -	int len = 0;
> -	u16 src_ind;
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> -	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> -		if (!src_ind)
> -			break;
> -		if (src_ind & 1)
> -			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> -		src_ind >>= 1;
> -	}
> -	return len;
> -}
> -
>   /*
>    * Bring up one ACPI HSMP socket: parse its ACPI table, run the mailbox
>    * handshake and register its sysfs/hwmon interfaces.
> @@ -572,70 +317,6 @@ static int init_acpi(struct device *dev)
>   	return 0;
>   }
>   
> -static const struct bin_attribute  hsmp_metric_tbl_attr = {
> -	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> -	.read = hsmp_metric_tbl_acpi_read,
> -	.size = sizeof(struct hsmp_metric_table),
> -};
> -
> -static const struct bin_attribute *hsmp_attr_list[] = {
> -	&hsmp_metric_tbl_attr,
> -	NULL
> -};
> -
> -#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> -static struct hsmp_sys_attr hattr_##_name = {		\
> -	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> -	.msg_id = _msg_id,				\
> -}
> -
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> -HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
> -HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
> -HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> -	      hsmp_freq_limit_show, 0444);
> -HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> -	      hsmp_freq_limit_source_show, 0444);
> -
> -static struct attribute *hsmp_dev_attr_list[] = {
> -	&hattr_c0_residency_input.dattr.attr,
> -	&hattr_prochot_status.dattr.attr,
> -	&hattr_smu_fw_version.dattr.attr,
> -	&hattr_protocol_version.dattr.attr,
> -	&hattr_cclk_freq_limit_input.dattr.attr,
> -	&hattr_ddr_max_bw.dattr.attr,
> -	&hattr_ddr_utilised_bw_input.dattr.attr,
> -	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> -	&hattr_fclk_input.dattr.attr,
> -	&hattr_mclk_input.dattr.attr,
> -	&hattr_clk_fmax.dattr.attr,
> -	&hattr_clk_fmin.dattr.attr,
> -	&hattr_pwr_current_active_freq_limit.dattr.attr,
> -	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group hsmp_attr_grp = {
> -	.bin_attrs = hsmp_attr_list,
> -	.attrs = hsmp_dev_attr_list,
> -	.is_bin_visible = hsmp_is_sock_attr_visible,
> -	.is_visible = hsmp_is_sock_dev_attr_visible,
> -};
> -
> -static const struct attribute_group *hsmp_groups[] = {
> -	&hsmp_attr_grp,
> -	NULL
> -};
> -
>   static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>   	{ACPI_HSMP_DEVICE_HID, 0},
>   	{}
> @@ -793,7 +474,7 @@ static struct platform_driver amd_hsmp_driver = {
>   	.driver		= {
>   		.name	= DRIVER_NAME,
>   		.acpi_match_table = amd_hsmp_acpi_ids,
> -		.dev_groups = hsmp_groups,
> +		.dev_groups = hsmp_sock_groups,
>   	},
>   };
>   
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 8dbff16a87b1..692721e2e6d3 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -80,6 +80,7 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>   static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>   #endif
>   int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
> +extern const struct attribute_group *hsmp_sock_groups[];
>   
>   /*
>    * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> new file mode 100644
> index 000000000000..b1db3b4d77b9
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP sysfs support
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides the per-socket sysfs attributes of the HSMP interface.
> + */
> +
> +#include <asm/amd/hsmp.h>
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/sysfs.h>
> +
> +#include "hsmp.h"
> +
> +struct hsmp_sys_attr {
> +	struct device_attribute dattr;
> +	u32 msg_id;
> +};
> +
> +static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> +					 const struct bin_attribute *bin_attr, char *buf,
> +					 loff_t off, size_t count)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +
> +	/*
> +	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
> +	 * It can therefore only carry the protocol version 6 metric table
> +	 * (struct hsmp_metric_table).  The larger tables defined from protocol
> +	 * version 7 onwards do not fit; userspace on those systems must read
> +	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
> +	 * Surface the unsupported case here as -EOPNOTSUPP rather than
> +	 * silently truncating the snapshot.
> +	 */
> +	if (get_hsmp_pdev()->proto_ver != HSMP_PROTO_VER6)
> +		return -EOPNOTSUPP;
> +
> +	return hsmp_metric_tbl_read(sock, buf, count);
> +}
> +
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +					 const struct bin_attribute *battr, int id)
> +{
> +	/*
> +	 * Keep metrics_bin visible on protocol version 7 and later as well,
> +	 * so that userspace which expects the file to exist gets a clear
> +	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
> +	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
> +	 */
> +	if (get_hsmp_pdev()->proto_ver >= HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +
> +	return 0;
> +}
> +
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +					     struct attribute *attr, int id)
> +{
> +	return attr->mode;
> +}
> +
> +#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
> +
> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data);
> +}
> +
> +#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> +#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> +#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> +#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> +#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> +#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> +#define FMAX_MASK		GENMASK(31, 16)
> +#define FMIN_MASK		GENMASK(15, 0)
> +#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> +#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
> +					  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
> +}
> +
> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu.%lu.%lu\n",
> +			  FIELD_GET(FW_VER_MAJOR_MASK, data),
> +			  FIELD_GET(FW_VER_MINOR_MASK, data),
> +			  FIELD_GET(FW_VER_DEBUG_MASK, data));
> +}
> +
> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[0]);
> +}
> +
> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[1]);
> +}
> +
> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
> +}
> +
> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
> +}
> +
> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> +}
> +
> +static const char * const freqlimit_srcnames[] = {
> +	"cHTC-Active",
> +	"PROCHOT",
> +	"TDC limit",
> +	"PPT Limit",
> +	"OPN Max",
> +	"Reliability Limit",
> +	"APML Agent",
> +	"HSMP Agent",
> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	unsigned int index;
> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> +	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> +		if (!src_ind)
> +			break;
> +		if (src_ind & 1)
> +			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> +		src_ind >>= 1;
> +	}
> +	return len;
> +}
> +
> +static const struct bin_attribute  hsmp_metric_tbl_attr = {
> +	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> +	.read = hsmp_metric_tbl_acpi_read,
> +	.size = sizeof(struct hsmp_metric_table),
> +};
> +
> +static const struct bin_attribute *hsmp_attr_list[] = {
> +	&hsmp_metric_tbl_attr,
> +	NULL
> +};
> +
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> +static struct hsmp_sys_attr hattr_##_name = {		\
> +	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> +	.msg_id = _msg_id,				\
> +}
> +
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444);
> +
> +static struct attribute *hsmp_dev_attr_list[] = {
> +	&hattr_c0_residency_input.dattr.attr,
> +	&hattr_prochot_status.dattr.attr,
> +	&hattr_smu_fw_version.dattr.attr,
> +	&hattr_protocol_version.dattr.attr,
> +	&hattr_cclk_freq_limit_input.dattr.attr,
> +	&hattr_ddr_max_bw.dattr.attr,
> +	&hattr_ddr_utilised_bw_input.dattr.attr,
> +	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> +	&hattr_fclk_input.dattr.attr,
> +	&hattr_mclk_input.dattr.attr,
> +	&hattr_clk_fmax.dattr.attr,
> +	&hattr_clk_fmin.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group hsmp_attr_grp = {
> +	.bin_attrs = hsmp_attr_list,
> +	.attrs = hsmp_dev_attr_list,
> +	.is_bin_visible = hsmp_is_sock_attr_visible,
> +	.is_visible = hsmp_is_sock_dev_attr_visible,
> +};
> +
> +/*
> + * Per-socket attribute groups. Every show/read handler expects the drvdata of
> + * the device carrying the group to be the struct hsmp_socket it reports on.
> + */
> +const struct attribute_group *hsmp_sock_groups[] = {
> +	&hsmp_attr_grp,
> +	NULL
> +};
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
