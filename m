Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1849A3DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585735; cv=none; b=BSKfS8QIBlTtQ2tIkxI2voJBkheq4EMAVQBpYYy2c8sgBnnupWSVMxQUggbHNxcEiYJGUjaotUsry/Mdk6hiYKtNSgxNlslbira6psCqkmw2x8AiYtzT/wWOjfIp+1FTEqlkWNl8jfqEfK+yO4uaIsn37aiHRfnC5fFt3e3rZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585735; c=relaxed/simple;
	bh=gNws4//pkit056CH/pmnk3brOGzFU7NWxq1oWQwPxSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ja5YGW617XEHg1aEppu5LLISL8aT3OAKtFk8d8JRzFaV1W9EtRe9Ulw4e+nd08RrCtDatPqC/AdPtwsSjyoQRr9ptHRxB/X6XWMwJe6DnJYm2OUx84MzvAtynUK2Tt/oWdMjDc2Zo7bBlW9pJFaU4Z/jmF/LJEa2a7fZzIsum/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rcNQd8+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rcNQd8+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED161F00893;
	Wed, 16 Sep 2026 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789585694;
	bh=cSaMXvfw2pfPtnbjT8ZKjN0KAUWEKNO2U0NRL0CHX+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rcNQd8+DpmNWLsIQUluGinp+e/jDdn2zkxiuRzLxtJvy58ctRwboM/Bq6pi8khna4
	 Rg2vHUYnPdJWENZWQG3QzmRNQdj54yDAq5epHYzmTHu0mJSQvLobS4PY5usz4gxD+m
	 ZOm9H9TvYZphB1BgjwCy9/8gXl8xQFtopQxroGew=
Date: Wed, 16 Sep 2026 20:06:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cmllamas@google.com
Cc: tkjos@android.com, aliceryhl@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: Fix up Kconfig dependancy due to removal of .c
 code
Message-ID: <2026091653-resistant-consent-6720@gregkh>
References: <2026091653-dividend-outing-857d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091653-dividend-outing-857d@gregkh>

On Wed, Sep 16, 2026 at 08:03:54PM +0100, Greg Kroah-Hartman wrote:
> When the .c binder code was removed, building the kernel if the rust
> binder code was enabled, will cause the binder to not be built at all as
> the option changed from .c to .rs which is probably not what the
> original build wanted.
> 
> Fix this up by renaming the option back to the _RUST version.  If in the
> future, that suffix wants to be dropped, we can do so and then it will
> be prompted for a choice again, but for this release cycle, it should
> stay as-is.
> 
> Fixes: binder: rm -f binder.c
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/android/Kconfig                                      | 4 ++--
>  drivers/android/Makefile                                     | 2 +-
>  drivers/android/binder/Makefile                              | 2 +-
>  tools/testing/selftests/filesystems/binderfs/binderfs_test.c | 2 +-
>  tools/testing/selftests/filesystems/binderfs/config          | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 403e5f3eab5a..c920d52c0221 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menu "Android"
>  
> -config ANDROID_BINDER_IPC
> +config ANDROID_BINDER_IPC_RUST
>  	bool "Android Binder IPC Driver"
>  	depends on MMU
>  	depends on NET
> @@ -17,7 +17,7 @@ config ANDROID_BINDER_IPC
>  
>  config ANDROID_BINDER_DEVICES
>  	string "Android Binder devices"
> -	depends on ANDROID_BINDER_IPC
> +	depends on ANDROID_BINDER_IPC_RUST
>  	default "binder,hwbinder,vndbinder"
>  	help
>  	  Default value for the binder.devices parameter.
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index dc19d21037af..5bc644cf5e0c 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  ccflags-y += -I$(src)			# needed for trace events
>  
> -obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder/
> +obj-$(CONFIG_ANDROID_BINDER_IPC_RUST_RUST)	+= binder/
> diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
> index 661f5cca8918..fe474628a94e 100644
> --- a/drivers/android/binder/Makefile
> +++ b/drivers/android/binder/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  ccflags-y += -I$(src)	# needed for trace events
>  
> -obj-$(CONFIG_ANDROID_BINDER_IPC) += binder.o
> +obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += binder.o
>  binder-y := \
>  	rust_binder_main.o	\
>  	rust_binderfs.o		\
> diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> index 7310622098ff..cd82c89f558f 100644
> --- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> +++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> @@ -414,7 +414,7 @@ TEST(binderfs_stress)
>  
>  		ret = mount(NULL, binderfs_mntpt, "binder", 0, 0);
>  		ASSERT_EQ(ret, 0) {
> -			TH_LOG("%s - Failed to mount binderfs, check if CONFIG_ANDROID_BINDER_IPC is enabled in the running kernel",
> +			TH_LOG("%s - Failed to mount binderfs, check if CONFIG_ANDROID_BINDER_IPC_RUST is enabled in the running kernel",
>  				strerror(errno));
>  		}
>  
> diff --git a/tools/testing/selftests/filesystems/binderfs/config b/tools/testing/selftests/filesystems/binderfs/config
> index e0c1958a3675..80e4221c2d82 100644
> --- a/tools/testing/selftests/filesystems/binderfs/config
> +++ b/tools/testing/selftests/filesystems/binderfs/config
> @@ -1 +1 @@
> -CONFIG_ANDROID_BINDER_IPC=y
> +CONFIG_ANDROID_BINDER_IPC_RUST=y
> -- 
> 2.55.0
> 

This fixes up my build issues, can you test it out before/after applying
the removal patch and see if it keeps building the rust binder properly?

thanks,

greg k-h
