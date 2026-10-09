Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8C440622
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551138; cv=none; b=InUY09xnssmb0WWwsFAUNHZyclQO7+Ht+COQ0cxeCsyqdgoRG3pgAle+AadXTNOKhfLxivUrnOVw7DjNqOm/Ca7y1Xt9Gi61iANc/B0RpcGYtei/0BZLI7JDXIAkLEV4PZZa+Us4KefW6a1bE21ZbXOFhit/j6tAxyd5fETBnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551138; c=relaxed/simple;
	bh=7UbrryBYNHn/Bj4zwDTRDtmYXfonFC4fj9wE+WWy73U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA+AHtovoEM/du4eDbEOhydZOuMuLjqrqgm/oX1cRrPtsfWEJ+ox+dXiUv4N13a2DmLhkqBmVqE0Vj1HvCvEt4B+xIt4et2PhXjJ/aswrVWFv+Mg3mSCqr3KOs4iXWbhpkH86G4sPiHB7OHwJ1cPZcPuyeaVt+h/AQSViHBHChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnPyq6hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y++VHuBZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnPyq6hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y++VHuBZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KKrV2369599
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wg75Jo+gkwCQfwjl5rPurUSP
	h3mJQu6nmyAtqh5PaCE=; b=YnPyq6hwv8D3OrxfsSrbyp1CK5qXeVMCPsRyINbe
	NnAj2VXjx7zVH6RxRhpkrxr+PdBsSg/3O49LJIWzuAXKt8/BvylQniamft8Pmky4
	4BKY6o47uodlowYq5VB0IH9pDglPt40uF8oyZpT1INACUuY/9/mQ8ameCSVvl20m
	jAxLqT2tdiWcS9XeW2+JEijfKOtrgJzcvTK+VTVqYEjkhe2tUojdM+OUMMt2jwod
	oes57WKbhxSay7RVoSGGl0o+X0LQTfeeRBPE5tMyF3Yoa806l+s/RKgw/p0Uu4R/
	MJWusHlvtnYEuXtA4KydC/jqbkhCq7fp+l9dfpROrFM8Tw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwbn0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:05:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so533119241.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551131; x=1792155931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg75Jo+gkwCQfwjl5rPurUSPh3mJQu6nmyAtqh5PaCE=;
        b=Y++VHuBZ/rbL/LwXkvC/0kcOOcVvNoXp8+cWYQnVzwrQs8a9HqaIIswDKat1uQUDKP
         PayYlAvzN/nbhRlWvlBiwFWOeW3ze4C3+3MeGGefqpbZ2XqMA3LLr6aJuL/fxpF8IAsH
         l4FyDV71vCKpkCXdWApXCqOVmwBCfREnfwG0m9d9atsaGRKuvqsDrFa6huArzzoLW5g7
         rJCPrqcKadL4ItstPJA+OpYuSBk4XhqWRkizqD+Mtb2GOV4h6Co8rUp3J4m2ugSrW2po
         NPFvnpMh3TSVlyncFDcrGJPlKNRKnH0p7wtp14wWQke0x0njVJNurnMnAHf1IYIY15Oh
         Gn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551131; x=1792155931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg75Jo+gkwCQfwjl5rPurUSPh3mJQu6nmyAtqh5PaCE=;
        b=CDF4ClymzbMVo6RvFwxw8oPU+nN3oflIU3JjKI2qDitdSFgVPXZFQpTw+ZUTfLIS2e
         1DRXdWUf9luXUmuN+hOM13HLnw28fscB5P512nxDnZx7S1ecfUyQzPMoNBHmt0ZbzAaJ
         UyQ989ptVjB+aJst3GOm6es3kiq8zvWKyUIwfmlDfoSNptEkuEyXf/tysHGDnElCMYh6
         qGfuOQyZsJGHX90uSic/CBB2tIwW2wgYdWjugoZIYhSUgqpxU9cLhIO6ZJnWykNHIQUz
         xU1ERVPEVtsVt4k/UYCoYksR4wXDpNU9Uk4TltDK54nTXh6x6yXlRoppW4ABHjf/MgAx
         USGA==
X-Forwarded-Encrypted: i=1; AKwUvByidHAnvxCbMuaYXENPoSPupPMDpYBvpicCgnNrE0I3726fo+Q4yyhSDFI9mVDqYk35iyEpyONhopEcWlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7gKiSjp1iQAc4kXrJg1PMZRjWPRgU5sc6364WTnhvlsYgg2GF
	yHCSTTE1vD+iTmbTYAAsKu+y+u6osu1WbbUKvkSe/RRG+WoigJVP2jFOJhmGb1PtruBAhORx9FW
	w1wBsLa6KyqfdGsnor8m3qvEsf8UXb1XM6titONwsFoE3oIM8mR4FbBTVLuROBKw94Q4=
X-Gm-Gg: AYBFou2TgwpwwE9jnWYBuvca2IlecgaJA/rW1XPF2/SXqkz8A2pd5+V7mS7Ad/FU5v5
	MUmvWOWimvuvV7PXV+ByiX1g2KH4GZml0bintzoiKZBqC2fHVIZr/jNdc6WlRyqLE+dWSZJUmgb
	bDBrhlGHdv+GghhdwDQ9SBNQvK/EYGbv/U1+PuMgc5nWJeEnSfOdOF6iqrAJLRGgWDfJbwPUQ+p
	iVaXny5CdJ4AVGbVdYtbyPn9v0ZNbt53MB1OeHwrL3H9pDjNyr6gKgJvym/HlH6ydEe9azAYA1O
	UquGaYK3bdX5R3S2FWw0pzu97unVqybAcFs8Lrxfem8QXnNt9iDc2wgFEbMQ1cjdHwL1vUFyllN
	xMQE3JSIhjDRYo5M=
X-Received: by 2002:a05:6122:2893:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5e91f548554mr511850e0c.18.1791551130980;
        Fri, 09 Oct 2026 06:05:30 -0700 (PDT)
X-Received: by 2002:a05:6122:2893:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5e91f548554mr511761e0c.18.1791551130189;
        Fri, 09 Oct 2026 06:05:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm105518545e9.9.2026.10.09.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:05:29 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:05:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Jim Wylder <jwylder@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spmi: core: Add generic DebugFS interface for bus
 inspection
Message-ID: <jsfnk6ycdprjmre54wueosvvodbx6m7fadh7pmuem4hqnuuetl@3hpn7xouy5fs>
References: <20260924094458.228732-1-vamshigajjela@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924094458.228732-1-vamshigajjela@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX0Zimp2XKx+ie
 GbjLf3uXogS3n5wdHlO8LQW9kLr4yIbi9dW5EhFwJFm3WtmNxZumQu4jO/5sOttZgdqdgLWsSOd
 DdEb/3PGcZ35ERpyjM2rLheti4ytslvBKHwzbEGnUCV8d8ao3bh3Hr7rKX4iJdRkydEqa8K3aYQ
 e4iLOh1OsC1F71ju0myTuog7fjNzMx+ZB0Ck8yqrZh8XfG8UPHMdkD//5SqG137T9OpRaNHosBe
 gKeMUiqSVOOIKzj788+YCRWNGQ6x/jSlTQDnxqu2bPj554hmIHcV8NBwstaGehnMpggXh2l41Ns
 t5FoGRBxsHCfh2YmzJWENguR/4p7sPucbLV2TXuslTHqz+hNTqhHQ5hdCBAAZJT+mAQUWN6JSbi
 BkfQcLYZdcqn6YMJpQzdJah2aJY0z4zJ17BVL7eQ8imDqCnyWngH8PfwJvD9tuYl7FTsx2cbuRA
 Jd26Uamxcw5GVZ+ssvg==
X-Proofpoint-GUID: GCZLpb5hs-uaQirwA6nDiYzC2zxbtMUP
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8e69c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=zIoPeiblRQsc_uYwYkwA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX8ZGFMttHSL4i
 5FvCNCELmAwUN8NKtFNAu/2seGzF7sLUgADBHrCBDwPNsBNUwIOb+icWnrc4FYZM5qUoiIXVpSk
 krDVUj1MvNDXJrVpa02nMBFGi8jUlWA=
X-Proofpoint-ORIG-GUID: GCZLpb5hs-uaQirwA6nDiYzC2zxbtMUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

On 26-09-24 15:14:58, vamshi gajjela wrote:
> Introduce a generic, controller-agnostic DebugFS interface in the SPMI
> core under /sys/kernel/debug/spmi/spmi-<nr>/:
> - name: Displays the controller parent device name and OF node.
> - detect: Probes the bus for active slave IDs (0x0 to 0xF).
> - xfer: Transactional interface supporting register reads, writes,
>   and directed command opcodes with automatic opcode selection.
> 
> Write and command operations restrict access to root (mode 0600) and
> mark the kernel tainted with TAINT_USER. Runtime PM is managed
> automatically across transactions.
> 
> Detailed interface syntax and parameters are documented in
> Documentation/ABI/testing/debugfs-spmi.
> 
> Co-developed-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: vamshi gajjela <vamshigajjela@google.com>
> ---
>  Documentation/ABI/testing/debugfs-spmi |  75 +++++
>  MAINTAINERS                            |   1 +
>  drivers/spmi/Makefile                  |   1 +
>  drivers/spmi/spmi-debugfs.c            | 371 +++++++++++++++++++++++++
>  drivers/spmi/spmi.c                    |   7 +
>  include/linux/spmi.h                   |  18 ++
>  6 files changed, 473 insertions(+)
>  create mode 100644 Documentation/ABI/testing/debugfs-spmi
>  create mode 100644 drivers/spmi/spmi-debugfs.c
> 
> diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
> new file mode 100644
> index 000000000000..10ad075b8619
> --- /dev/null
> +++ b/Documentation/ABI/testing/debugfs-spmi
> @@ -0,0 +1,75 @@
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/name
> +Date:		September 2026
> +KernelVersion:	7.0
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Displays the SPMI controller parent device name and
> +		associated Device Tree node.
> +Users:		Debugging, hardware diagnostics
> +
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/detect
> +Date:		September 2026
> +KernelVersion:	7.0
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Scans the SPMI bus for all 16 possible MIPI SPMI slave IDs
> +		(0x0 to 0xF) using standard register reads at offset 0x0.
> +		Active slaves are printed in two-digit hexadecimal notation
> +		in an i2cdetect-style grid, while unresponsive slaves are
> +		represented with "--".
> +Users:		Debugging, hardware diagnostics
> +
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
> +Date:		September 2026
> +KernelVersion:	7.0
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Transactional interface for raw SPMI bus operations:
> +
> +		- Register Read:
> +		    echo "r <sid> <addr> [len]" > xfer && cat xfer
> +		  Reads 1 to 16 bytes starting at <addr> from slave <sid>.
> +		  The optional [len] parameter defaults to 1 byte.
> +		  Output is formatted as:
> +		    0x<addr>: <byte0> <byte1> ...
> +		  Reading the file consumes the response; subsequent reads
> +		  return EOF (0 bytes) to prevent reading stale data.
> +
> +		- Register Write:
> +		    echo "w <sid> <addr> <val...>" > xfer
> +		  Writes 1 to 16 bytes starting at <addr> to slave <sid>.
> +		  Values are separated by spaces (e.g. "w 0x4 0x8 0x12 0x34"
> +		  or "w 4 8 12 34").
> +
> +		- Command:
> +		    echo "c <sid> <opcode>" > xfer
> +		  Sends a single SPMI command opcode (e.g. RESET 0x10,
> +		  SLEEP 0x11, SHUTDOWN 0x12, WAKEUP 0x13) to slave <sid>.
> +
> +		Parameter Formatting & Validation:
> +		- <sid>: 4-bit Slave Identifier (0x0 to 0xF, supports both
> +		  decimal "4" and hexadecimal "0x4").
> +		- <addr>: 16-bit register address (0x0000 to 0xFFFF) parsed in
> +		  hexadecimal (supports both "0x12" and "12", as well as
> +		  "08", "09").
> +		- [len]: Number of bytes to read (1 to 16 for 8-bit addresses,
> +		  up to 8 bytes for 16-bit extended addresses; default 1).
> +		- <val...>: 1 to 16 hexadecimal byte values (0x00 to 0xFF,
> +		  up to 8 bytes for 16-bit extended addresses). Values
> +		  exceeding 0xFF or payloads exceeding 16 bytes are rejected
> +		  with -EINVAL.
> +		- <opcode>: 1-byte command opcode parsed in hexadecimal
> +		  (0x00 to 0xFF, e.g. "0x10" or "10").
> +		- Trailing unrecognized arguments return -EINVAL.
> +
> +		The interface automatically selects the optimal SPMI opcode
> +		(Register Read/Write, Extended Register Read/Write, Extended
> +		Register Read/Write Long, Zero Write) based on the address
> +		and burst length.
> +
> +		All write and command operations mark the kernel as tainted
> +		with TAINT_USER. On failure, the write system call returns a
> +		negative errno (e.g. -EIO on bus NACK/timeout, -EINVAL on
> +		syntax/range error, -EOPNOTSUPP if the controller lacks the
> +		capability).
> +Users:		Debugging, hardware bringup, manufacturing test
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 529c7d7ba113..6ba973aa98de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24946,6 +24946,7 @@ M:	Stephen Boyd <sboyd@kernel.org>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
> +F:	Documentation/ABI/testing/debugfs-spmi
>  F:	Documentation/devicetree/bindings/spmi/
>  F:	drivers/spmi/
>  F:	include/dt-bindings/spmi/spmi.h
> diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
> index 38ac635645ba..23cd6036863b 100644
> --- a/drivers/spmi/Makefile
> +++ b/drivers/spmi/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for kernel SPMI framework.
>  #
>  obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
> +obj-$(CONFIG_DEBUG_FS)	+= spmi-debugfs.o

What happens with CONFIG_SPMI=m and CONFIG_DEBUG_FS=y?

>  
>  obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
>  obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
> diff --git a/drivers/spmi/spmi-debugfs.c b/drivers/spmi/spmi-debugfs.c
> new file mode 100644
> index 000000000000..4b216a0f325e
> --- /dev/null
> +++ b/drivers/spmi/spmi-debugfs.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SPMI core DebugFS interface
> + *
> + * Copyright (C) 2026 Google LLC
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +#include <linux/slab.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spmi.h>
> +#include <linux/mutex.h>
> +#include <linux/ctype.h>
> +#include <linux/string.h>
> +#include <linux/of.h>
> +#include <linux/panic.h>
> +
> +struct spmi_ctrl_debugfs {
> +	struct dentry *dentry;
> +	struct mutex lock; /* protects xfer_buf and xfer_len */
> +	char xfer_buf[64];
> +	size_t xfer_len;
> +};
> +
> +/* Top-level SPMI debugfs directory (/sys/kernel/debug/spmi) */
> +static struct dentry *spmi_debugfs_root;
> +
> +static int spmi_calc_read_opcode(u16 addr, size_t len, u8 *opc)
> +{
> +	if (len == 0)
> +		return -EINVAL;
> +
> +	if (addr <= 0x1f && len == 1)
> +		*opc = SPMI_CMD_READ;
> +	else if (addr <= 0xff && len <= 16)
> +		*opc = SPMI_CMD_EXT_READ;
> +	else if (len <= 8)
> +		*opc = SPMI_CMD_EXT_READL;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int spmi_calc_write_opcode(u16 addr, size_t len, u8 *opc)
> +{
> +	if (len == 0)
> +		return -EINVAL;
> +
> +	if (addr == 0 && len == 1)
> +		*opc = SPMI_CMD_ZERO_WRITE;

This register only carries 7 bits of data, but the parser accepts
values up to 0xff.

> +	else if (addr <= 0x1f && len == 1)
> +		*opc = SPMI_CMD_WRITE;
> +	else if (addr <= 0xff && len <= 16)
> +		*opc = SPMI_CMD_EXT_WRITE;
> +	else if (len <= 8)
> +		*opc = SPMI_CMD_EXT_WRITEL;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int spmi_debugfs_name_show(struct seq_file *s, void *data)
> +{
> +	struct spmi_controller *ctrl = s->private;
> +	struct device *parent = ctrl->dev.parent;
> +
> +	if (!parent)
> +		return -ENODEV;
> +
> +	if (dev_of_node(parent))
> +		seq_printf(s, "%s (%pOF)\n", dev_name(parent), dev_of_node(parent));
> +	else
> +		seq_printf(s, "%s\n", dev_name(parent));
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(spmi_debugfs_name);
> +
> +static int spmi_debugfs_detect_show(struct seq_file *s, void *data)
> +{
> +	struct spmi_controller *ctrl = s->private;
> +	struct device *parent = ctrl->dev.parent;
> +	int ret, sid;
> +	u8 dummy;
> +	bool rpm;
> +
> +	if (!ctrl->read_cmd)
> +		return -EOPNOTSUPP;
> +
> +	rpm = parent ? pm_runtime_enabled(parent) : false;
> +	if (rpm) {
> +		ret = pm_runtime_resume_and_get(parent);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/*
> +	 * MIPI SPMI defines a 4-bit Slave Identifier (SID), allowing a maximum
> +	 * of 16 slave devices (0x0 to 0xF) per bus. Format as a single-row grid.
> +	 */
> +	seq_puts(s, "     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f\n00: ");
> +	for (sid = 0; sid < SPMI_MAX_SLAVE_ID; sid++) {
> +		ret = ctrl->read_cmd(ctrl, SPMI_CMD_READ, sid, 0x0, &dummy, 1);
> +		if (ret == 0)
> +			seq_printf(s, "%02x ", sid);
> +		else
> +			seq_puts(s, "-- ");
> +	}
> +	seq_puts(s, "\n");
> +
> +	if (rpm) {
> +		pm_runtime_mark_last_busy(parent);
> +		pm_runtime_put_autosuspend(parent);
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(spmi_debugfs_detect);
> +
> +static ssize_t spmi_debugfs_xfer_read(struct file *file, char __user *user_buf,
> +				      size_t count, loff_t *ppos)
> +{
> +	struct spmi_controller *ctrl = file->private_data;
> +	struct spmi_ctrl_debugfs *dbg = ctrl->debugfs;
> +	ssize_t ret;
> +
> +	if (!dbg)
> +		return -ENODEV;
> +
> +	mutex_lock(&dbg->lock);
> +	ret = simple_read_from_buffer(user_buf, count, ppos, dbg->xfer_buf, dbg->xfer_len);
> +	if (ret > 0 && *ppos >= dbg->xfer_len)
> +		dbg->xfer_len = 0;

What about issuing another read command on the same open file? The file
position is advanced here, but isn't reset when a new response is stored.

> +	mutex_unlock(&dbg->lock);
> +
> +	return ret;
> +}
> +
> +static char *spmi_debugfs_next_tok(char **str)
> +{
> +	char *tok;
> +
> +	*str = skip_spaces(*str);
> +	if (!**str)
> +		return NULL;
> +
> +	tok = *str;
> +	while (**str && !isspace(**str))
> +		(*str)++;
> +
> +	if (**str) {
> +		**str = '\0';
> +		(*str)++;
> +	}
> +
> +	return tok;
> +}
> +
> +static ssize_t spmi_debugfs_xfer_write(struct file *file, const char __user *user_buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	struct spmi_controller *ctrl = file->private_data;
> +	struct spmi_ctrl_debugfs *dbg = ctrl->debugfs;
> +	struct device *parent = ctrl->dev.parent;
> +	unsigned int sid, addr, len;
> +	unsigned int cmd_opc, val;
> +	char *str, *tok;
> +	char kbuf[256];
> +	int ret = 0, i;
> +	u8 data[16];
> +	size_t off;
> +	u8 opcode;
> +	char type;
> +	bool rpm;
> +
> +	if (!dbg)
> +		return -ENODEV;
> +
> +	if (count == 0 || count >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, user_buf, count))
> +		return -EFAULT;
> +	kbuf[count] = '\0';
> +
> +	str = strim(kbuf);
> +	type = tolower(*str);
> +	if (type != 'r' && type != 'w' && type != 'c')
> +		return -EINVAL;
> +	str = skip_spaces(str + 1);
> +
> +	tok = spmi_debugfs_next_tok(&str);
> +	if (!tok || kstrtouint(tok, 0, &sid) || sid >= SPMI_MAX_SLAVE_ID)
> +		return -EINVAL;
> +
> +	rpm = parent ? pm_runtime_enabled(parent) : false;
> +	if (rpm) {
> +		ret = pm_runtime_resume_and_get(parent);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	mutex_lock(&dbg->lock);
> +	dbg->xfer_len = 0;

The response buffer is shared by all users of this controller. A can issue
a read, B can issue another read, and then A gets B's response and consumes
it. The mutex doesn't protect the command/response pair.

> +
> +	if (type == 'r') {
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (!tok || kstrtouint(tok, 16, &addr)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}

Please reject addresses above 0xffff here and in the write path. addr is
an unsigned int, but the opcode helpers and controller callbacks take a
u16, so out-of-range addresses are silently truncated.

> +
> +		len = 1;
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (tok) {
> +			if (kstrtouint(tok, 0, &len) || len == 0 || len > sizeof(data)) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			if (spmi_debugfs_next_tok(&str)) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +		}
> +
> +		if (!ctrl->read_cmd) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		ret = spmi_calc_read_opcode(addr, len, &opcode);
> +		if (ret)
> +			goto out;
> +
> +		ret = ctrl->read_cmd(ctrl, opcode, sid, addr, data, len);

Calling the controller callbacks directly bypasses the SPMI core
tracepoints. Can we reuse the core helpers so these accesses show up in
tracing too? Same for the write and command paths.

> +		if (!ret) {
> +			off = scnprintf(dbg->xfer_buf, sizeof(dbg->xfer_buf),
> +					"0x%04x:", addr);
> +
> +			for (i = 0; i < len; i++)
> +				off += scnprintf(dbg->xfer_buf + off, sizeof(dbg->xfer_buf) - off,
> +						 " %02x", data[i]);
> +			off += scnprintf(dbg->xfer_buf + off, sizeof(dbg->xfer_buf) - off, "\n");
> +			dbg->xfer_len = off;
> +		}
> +	} else if (type == 'w') {
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (!tok || kstrtouint(tok, 16, &addr)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		len = 0;
> +		while ((tok = spmi_debugfs_next_tok(&str)) != NULL) {
> +			if (len >= sizeof(data) || kstrtouint(tok, 16, &val) || val > 0xff) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			data[len++] = val;
> +		}
> +
> +		if (len == 0) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (!ctrl->write_cmd) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		ret = spmi_calc_write_opcode(addr, len, &opcode);
> +		if (ret)
> +			goto out;
> +
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +
> +		ret = ctrl->write_cmd(ctrl, opcode, sid, addr, data, len);
> +	} else if (type == 'c') {
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (!tok || kstrtouint(tok, 16, &cmd_opc) || cmd_opc > 0xff) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (spmi_debugfs_next_tok(&str)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (!ctrl->cmd) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +
> +		ret = ctrl->cmd(ctrl, cmd_opc, sid);
> +	}
> +
> +out:
> +	mutex_unlock(&dbg->lock);
> +
> +	if (rpm) {
> +		pm_runtime_mark_last_busy(parent);
> +		pm_runtime_put_autosuspend(parent);
> +	}
> +
> +	return ret ? ret : count;
> +}
> +
> +static const struct file_operations spmi_debugfs_xfer_fops = {
> +	.open		= simple_open,
> +	.read		= spmi_debugfs_xfer_read,
> +	.write		= spmi_debugfs_xfer_write,
> +	.llseek		= default_llseek,
> +};
> +
> +void spmi_controller_debugfs_init(struct spmi_controller *ctrl)
> +{
> +	struct spmi_ctrl_debugfs *dbg;
> +	char name[32];
> +
> +	if (IS_ERR_OR_NULL(spmi_debugfs_root))
> +		return;
> +
> +	dbg = kzalloc_obj(*dbg, GFP_KERNEL);
> +	if (!dbg)
> +		return;
> +
> +	mutex_init(&dbg->lock);
> +
> +	snprintf(name, sizeof(name), "spmi-%u", ctrl->nr);
> +	dbg->dentry = debugfs_create_dir(name, spmi_debugfs_root);
> +	if (IS_ERR_OR_NULL(dbg->dentry)) {
> +		kfree(dbg);
> +		return;
> +	}
> +
> +	debugfs_create_file("name", 0444, dbg->dentry, ctrl, &spmi_debugfs_name_fops);
> +	debugfs_create_file("detect", 0444, dbg->dentry, ctrl, &spmi_debugfs_detect_fops);
> +	debugfs_create_file("xfer", 0600, dbg->dentry, ctrl, &spmi_debugfs_xfer_fops);
> +
> +	ctrl->debugfs = dbg;
> +}
> +
> +void spmi_controller_debugfs_remove(struct spmi_controller *ctrl)
> +{
> +	if (!ctrl->debugfs)
> +		return;
> +
> +	debugfs_remove(ctrl->debugfs->dentry);
> +	kfree(ctrl->debugfs);
> +	ctrl->debugfs = NULL;
> +}
> +
> +void spmi_debugfs_init(void)
> +{
> +	if (!spmi_debugfs_root)
> +		spmi_debugfs_root = debugfs_create_dir("spmi", NULL);
> +}
> +
> +void spmi_debugfs_exit(void)
> +{
> +	debugfs_remove(spmi_debugfs_root);
> +	spmi_debugfs_root = NULL;
> +}
> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> index e889b129f3ac..7d2e9a762fb8 100644
> --- a/drivers/spmi/spmi.c
> +++ b/drivers/spmi/spmi.c
> @@ -554,6 +554,8 @@ int spmi_controller_add(struct spmi_controller *ctrl)
>  	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
>  		ctrl->nr, &ctrl->dev);
>  
> +	spmi_controller_debugfs_init(ctrl);
> +
>  	return 0;
>  };
>  EXPORT_SYMBOL_GPL(spmi_controller_add);
> @@ -580,6 +582,8 @@ void spmi_controller_remove(struct spmi_controller *ctrl)
>  	if (!ctrl)
>  		return;
>  
> +	spmi_controller_debugfs_remove(ctrl);
> +
>  	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
>  	device_del(&ctrl->dev);
>  }
> @@ -603,6 +607,7 @@ EXPORT_SYMBOL_GPL(__spmi_driver_register);
>  
>  static void __exit spmi_exit(void)
>  {
> +	spmi_debugfs_exit();
>  	bus_unregister(&spmi_bus_type);
>  }
>  module_exit(spmi_exit);
> @@ -615,6 +620,8 @@ static int __init spmi_init(void)
>  	if (ret)
>  		return ret;
>  
> +	spmi_debugfs_init();
> +
>  	is_registered = true;
>  	return 0;
>  }
> diff --git a/include/linux/spmi.h b/include/linux/spmi.h
> index 28e8c8bd3944..fcd8b9fc6cbf 100644
> --- a/include/linux/spmi.h
> +++ b/include/linux/spmi.h
> @@ -76,7 +76,10 @@ void spmi_device_remove(struct spmi_device *sdev);
>   * @cmd:	sends a non-data command sequence on the SPMI bus.
>   * @read_cmd:	sends a register read command sequence on the SPMI bus.
>   * @write_cmd:	sends a register write command sequence on the SPMI bus.
> + * @debugfs:	debugfs private data for this controller.
>   */
> +struct spmi_ctrl_debugfs;

Please move this declaration before the kernel-doc comment. That comment
belongs to struct spmi_controller and should stay immediately above it.

> +
>  struct spmi_controller {
>  	struct device		dev;
>  	unsigned int		nr;
> @@ -85,6 +88,9 @@ struct spmi_controller {
>  			    u8 sid, u16 addr, u8 *buf, size_t len);
>  	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
>  			     u8 sid, u16 addr, const u8 *buf, size_t len);
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct spmi_ctrl_debugfs *debugfs;
> +#endif
>  };
>  
>  static inline struct spmi_controller *to_spmi_controller(struct device *d)
> @@ -186,4 +192,16 @@ int spmi_command_sleep(struct spmi_device *sdev);
>  int spmi_command_wakeup(struct spmi_device *sdev);
>  int spmi_command_shutdown(struct spmi_device *sdev);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +void spmi_debugfs_init(void);
> +void spmi_debugfs_exit(void);
> +void spmi_controller_debugfs_init(struct spmi_controller *ctrl);
> +void spmi_controller_debugfs_remove(struct spmi_controller *ctrl);
> +#else
> +static inline void spmi_debugfs_init(void) {}
> +static inline void spmi_debugfs_exit(void) {}
> +static inline void spmi_controller_debugfs_init(struct spmi_controller *ctrl) {}
> +static inline void spmi_controller_debugfs_remove(struct spmi_controller *ctrl) {}
> +#endif
> +
>  #endif
> -- 
> 2.56.0.rc1.310.g51773c2048-goog
> 
