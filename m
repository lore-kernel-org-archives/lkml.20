Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249F319601
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095146; cv=none; b=hM94gqwo+E5Dg3BNemj17eUXb+pdJMdG/f4vXsa8StbLjX+FmxsDzjLC+hmAGHPLoLOaDxrDNmxmjCXvyiYD4QJB/byJLO+qw3PxG0eZ4l/6/A0keJIX9wjXEZx4FTOVp32jOiGePninsNiKTbKXTwl4UedK7RbaCQtHiPByQjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095146; c=relaxed/simple;
	bh=+I3ASJQdjtmmNviuUNFsYsGEUGPHXHdQPoIqIEAZhM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp9uKPlKoAtGvvo+IoQgwBj/JZXzZ7ZJvLnbiwSbWLRsbpPBt7Zj3mfnpTl/0cimkYhBuUuJrX0+OAwxtIWsqDRAamgN7JRhgqoopFn5IgKbhhpW62szti5SxSc1XIhnYGds/3p7Pbc7VEl8TJWTFYkkPE8u3fACwiGk/AwNiP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w6Y4C8ok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w6Y4C8ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D4E1F000FF;
	Sun,  4 Oct 2026 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791095145;
	bh=5mDr3s09JpMeJ7V7/RbBATajmYTlT1rDipomgrPQOlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=w6Y4C8ok42Dtr1LxseM4q9XaMNyRGx3ado0Qj0Lao1i9maxyVG+n3uPB3PsrYjrP+
	 oDgNl+EjaBobcfisql7EnTPRKp6ELOZUfxDns+l6SnavpnYziToih4v6Je/DhWDZQA
	 +uZskFgM5P1r6qhRHfaTOnV+uuZrFOC5TBQowuxQ=
Date: Sun, 4 Oct 2026 08:25:42 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Amir Ali Tadayyon <a.tadayyon12@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: (Subject) [PATCH] misc: add simple hello world driver
Message-ID: <2026100411-splotchy-dividers-039f@gregkh>
References: <CAPWuoRHO13=CQh7D_+AircPfj=CnmrRiX89Nh_TCUEH=yFkx1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPWuoRHO13=CQh7D_+AircPfj=CnmrRiX89Nh_TCUEH=yFkx1A@mail.gmail.com>

On Sat, Oct 03, 2026 at 09:11:49PM +0330, Amir Ali Tadayyon wrote:
> Add a minimal misc driver that prints a message to the kernel log
> on load and unload. This serves as a starting point for new
> contributors to understand the module init/exit flow.
> 
> Signed-off-by: Amir Ali <a.tadayyon12@gmail.com>
> ---
>  drivers/misc/Kconfig        |  7 +++++++
>  drivers/misc/Makefile       |  1 +
>  drivers/misc/hello_driver.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 drivers/misc/hello_driver.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 1234567..89abcde 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -1,3 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config HELLO_DRIVER
> + tristate "Hello world driver"
> + help
> +   A simple hello world driver that prints a message
> +   on load and unload.
> +
> +   If unsure, say N.
> +
>  config IBM_ASM
>   tristate "IBM ASM device"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 1234567..89abcde 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_HELLO_DRIVER) += hello_driver.o
>  obj-$(CONFIG_IBM_ASM) += ibmasm/
>  obj-$(CONFIG_AD525X_DPOT) += ad525x_dpot.o
> diff --git a/drivers/misc/hello_driver.c b/drivers/misc/hello_driver.c
> new file mode 100644
> index 0000000..1234567
> --- /dev/null
> +++ b/drivers/misc/hello_driver.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * hello_driver.c - A simple hello world driver
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Amir Ali <a.tadayyon12@gmail.com>");
> +MODULE_DESCRIPTION("A simple hello world driver");
> +
> +static int __init hello_init(void)
> +{
> + pr_info("Hello, Linux kernel!\n");
> + return 0;
> +}
> +
> +static void __exit hello_exit(void)
> +{
> + pr_info("Goodbye, Linux kernel!\n");
> +}
> +
> +module_init(hello_init);
> +module_exit(hello_exit);

Did you really mean to send this?

Also, the patch is corrupted and can't be applied :(
