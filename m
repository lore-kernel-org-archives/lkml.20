Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256983;
	b=nSa4A6bwaeVIgLUCzPiCWdS17kVuT6Fg7+NUfvDtGGE4ncITseanA2RxYgrRwy2xnzAY
	 XC7tw6BMsof+dyS/uOxtdpd4WjWKG8VUJIQcpEiWsjqyJo7Dt9yrKl6RybbHp4fdMC7EV
	 FvjIqlHR+vkoA/m8uK2MYvv9pRPcPSHqL/oVDXKZQ0dDLABXROD0MT2a2+HGrEqgTqvgE
	 1ssm7qS7OZon8wGN0E1+gqw1JNJSmeWWXrBj/xgSkYytn/5bb4A0w2+CuS4OGfzQVUEaP
	 Zo0IAYeQ7Z0buxPhkqQ5h59vhocXZUZGggKpYXqBYwyJN4mrfU8/wEoivtCGJYNsbFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256983;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=l1O+GgRrGRNwKvG//oIuqinClngR0vYDk7qQKXxeB4s=;
	b=fzF6PShDJsmBowdmghi/rMzocKDnfL0pA+YH0QXbrEnYXA2ymImTfOzIvJh9PUGErZcp
	 oFT2eJK1Ws94XUtU5jpFajTriwuIrFZrglW6gPQ2tgdZowPRhQID7upKFdgJ6JpKWoUwF
	 z0i9BtiBbdo42DwbXKBwJ1o1ljQtvlXnUA71WhOHX3ZZxUSFEP3/mpRrfgBxV2EeFJIDl
	 BBJdB47rcs2Mh/Q7PXqNpQ7LEfp/lVP+VYtiJ2Ku7TT10g5Aw0mQBLe+5588tVlvXCoZd
	 b0FOa7E0PR/N3r61Cb9VOCVlGWamV6fPPEiODk/7aNgSpKY/sUwW1yY3kPxi+gWEU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MvxKSLgy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MvxKSLgy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F6B1F031E0;
	Thu, 29 Oct 2026 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793256982;
	bh=l1O+GgRrGRNwKvG//oIuqinClngR0vYDk7qQKXxeB4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MvxKSLgyq7QQRCoUkPZqEsgqfGU0wOcUafiGt0kdUh4KwlwvHYNiaYQIPCl29BOLf
	 7dGVTHAYhyzH5kmzTIT9qODA1mVZS3DPbRoTELQbxgwl+DEiaYhQzqT/6f4ATLzZ0F
	 FxFNXLnUAKQo6PKVTvn6R2ONM3Fl+YSnBd5oXZ6c=
Date: Thu, 29 Oct 2026 07:56:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: bo cao <treebacker@foxmail.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH] char: uv_mmtimer: prevent read-only mapping from
 becoming writable
Message-ID: <2026102935-corridor-surreal-ef51@gregkh>
References: <tencent_A595E3D79A2F77C2BA5A45A9874C46D55508@qq.com>
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
In-Reply-To: <tencent_A595E3D79A2F77C2BA5A45A9874C46D55508@qq.com>

On Thu, Oct 29, 2026 at 11:54:13AM +0800, bo cao wrote:
> uv_mmtimer_mmap() rejects writable mappings but leaves VM_MAYWRITE
> set.  Userspace can map the clock's MMR page read-only and then
> upgrade the mapping to writable with mprotect(), gaining write access
> to the UVH_RTC register that the driver explicitly declares
> read-only.
> 
> Clear VM_MAYWRITE, as fixed in vfio/platform (commit 420bed9131db),
> drm/vc4 (CVE-2026-68445), drm/panthor (CVE-2024-53071) and
> ptp/vmclock (commit a5edadbae57e).
> 
> Note this is defensive hardening on two counts: /dev/uv_mmtimer is
> created with the default 0600 mode (exploitation requires root), and
> the driver only exists on SGI UV systems.
> 
> Fixes: fbd8ae106850 ("drivers/char/uv_mmtimer.c: add memory mapped RTC driver for UV")
> Signed-off-by: bo cao <treebacker@foxmail.com>
> ---
>  drivers/char/uv_mmtimer.c | 3 +++
>  1 file changed, 3 insertions(+)

Your LLM just picked up a patch I sent previously:
	https://lore.kernel.org/r/2026102752-extrovert-undaunted-d6cb@gregkh

thanks,

greg k-h
