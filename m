Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54402E1F0E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880628; cv=none; b=byynNL29zsiTpVxqpD96oUivygisR1jt1k6oww4tJW8Zw4Xtk0G+B+GQTsDt50wjW+5tXgaJv/wNX9l2ahuh2VXGVT4IoixGby4boVRiCZTpjp2lT3JwBedT83KrZMhKUQhDYPJuMLGGz+pqMxfkyQgoo28515/NdV9TGGUZC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880628; c=relaxed/simple;
	bh=Gba75KXeqLUbjGYL270h4Js30wKOiNMaLBexUx0ZfOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlY2J3xUwumcBL30NLqf9V5svX3favJsNwS353BSW5DaHADog8iQEfKKpTkbPq74PVxM0h/myybBreScBx7pMoSuDhckOgmriivi7O/CvEwX1I9dChuDv4puRnKejGSG2Fw8Q/4qBBB6t9hIM95IVqKezfjCFlRAvB3KgoI3r6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1XUtf9gd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1XUtf9gd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A257A1F000FF;
	Sun, 20 Sep 2026 05:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789880627;
	bh=Xoq0MaJSZPgw7ivBytnq9huv/iIaUVTS7SLDS5BYX9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1XUtf9gdkbnR5aiIik1u0Jx8McSYBYrQsk/nh4ys/VFDoLw82SujancCJBUeBC9EE
	 qOQyVK1RL8eyz+e6C9JUZUuTMEy9yHjzXcqisQDqdCdBu3y0oc0Ma0eNpVUDMnY5PT
	 VETwtVGEMN5uITmBcFdR0JO9l+gHZlsTgLnW+Gq8=
Date: Sun, 20 Sep 2026 06:01:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: arve@android.com, tkjos@android.com, brauner@kernel.org,
	cmllamas@google.com, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: restrict BINDER_NLGRP_REPORT to CAP_NET_ADMIN
 and fix binderfs minor leak
Message-ID: <2026092030-surrender-appointee-2f52@gregkh>
References: <20260919213654.3317464-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213654.3317464-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:54PM +0000, Hui Peng wrote:
> Fix three security and resource-accounting issues in `binder_netlink.c`
> and `binderfs.c`:
> 
> 1. In `drivers/android/binder_netlink.c`,
>    `binder_nl_mcgrps[BINDER_NLGRP_REPORT]` is declared without `.flags =
>    GENL_MCAST_CAP_NET_ADMIN`, allowing any unprivileged local user to
>    subscribe to the `BINDER_NLGRP_REPORT` Generic Netlink multicast
>    group and monitor system-wide binder transaction error reports
>    (including sender/target PIDs and transaction metadata).
> 2. In `drivers/android/binderfs.c`, `binderfs_binder_ctl_create()`
>    allocates an IDA minor via `ida_alloc_max(&binderfs_minors, ...)`,
>    and if `d_alloc_name(root, "binder-control")` fails, jumps to `out:`
>    (which calls `kfree(device)`) without freeing `minor` from
>    `binderfs_minors`.
> 3. When the `binder-control` inode (`device->context.name == NULL`) is
>    evicted in `binderfs_evict_inode()`, `--info->device_count` is
>    decremented even though `binderfs_binder_ctl_create()` never
>    incremented `info->device_count`, underflowing `info->device_count`.
>    Only decrement `info->device_count` when `device->context.name` is
>    non-NULL.

Why isn't this 3 different patches?

thanks,

greg kh
