Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D123D6472
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900388; cv=none; b=JIX+qIFnE18KTSUIQOB2Qdxg2C4AsQgKPMsDX2mDWXVwtJgYzcHk0d675Kps/f+bOMvcRQiEpLgpVca0KQ6T04JdEcq0K/S3hU/wt0j/TdR0dVMDUNw/n78PC5EGCc4CideOmzEKs34GQJxBrJ0diQct2gkrQqygaOENak9s1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900388; c=relaxed/simple;
	bh=MdT3W271N3Wha9R1D5X427tnwnPEZ5bbdYUbKc1pl+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+wt/5IoeQ5YDOGpht7CRIfaCNOXQwxUlLliFHiqdS5QtmR7PWLQsGix4LiZSKx4CPSHYEzLhqBMfyShXglleYOfwTZkX6kWM7/i0f6AdQLn8VduvkZHawhPBMhTu+169HYxp0bWzahBRiDXW8Kf6UzNh9Z5boC4CUpf2XuUVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vyETShr+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vyETShr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE8E1F000E9;
	Fri, 28 Aug 2026 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787900387;
	bh=hi17zgl84PCeUep1FCq/kezNsaS1vttLaSBVh5BY5G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vyETShr+HVQO11UydbAVGApL1wrSLEfOud3Io89QV8yi44dD/ahAb4SRADrB6w6Ig
	 PmCchWHhEtCFOlHduLp+lWf+gPX/rzQw5ri4eoycqeGKR2deDH4uvdEh+x1zNntyXs
	 RqJgSRbgWXBXOFxRQS5++BAzdbhEoJuo+p3yboUI=
Date: Fri, 28 Aug 2026 08:59:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	falemi@asu.edu, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] greybus: ODEBUG free-active-timer in
 gb_operation_sync_timeout()
Message-ID: <2026082839-corny-reputably-a5ff@gregkh>
References: <CA+0ovChDP9RtBDgTou=xz5Vmsk2hxaRryNCARO5h5JtiMS_OXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovChDP9RtBDgTou=xz5Vmsk2hxaRryNCARO5h5JtiMS_OXQ@mail.gmail.com>

On Thu, Aug 27, 2026 at 10:42:25PM -0700, Farhad Alemi wrote:
> Hello,
> 
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
> 
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/165-warning-odebug-bug-in-gb-operation-sync-timeout/
> 
>   ODEBUG: free active (active state 0) object: ffff888014747a70 object
> type: timer_list hint: gb_operation_timeout+0x0/0x100
> drivers/greybus/operation.c:1265
>   WARNING: lib/debugobjects.c:632 at
> debug_check_no_obj_freed+0x3fd/0x540 lib/debugobjects.c:1156, CPU#1:
> kworker/u8:3/10201
>   Call Trace:
>    kmem_cache_free+0xcb/0x4d0 mm/slub.c:6378
>    gb_operation_sync_timeout+0x1c7/0x270 drivers/greybus/operation.c:1172
>    gb_operation_sync include/linux/greybus/operation.h:203 [inline]
>    gb_svc_dme_peer_get+0x10a/0x250 drivers/greybus/svc.c:428
>    gb_interface_read_and_clear_init_status
> drivers/greybus/interface.c:380 [inline]
>    gb_interface_enable+0x146/0x900 drivers/greybus/interface.c:1075
>    gb_module_register_interface drivers/greybus/module.c:162 [inline]
>    gb_module_add+0x1b3/0x3d0 drivers/greybus/module.c:209
> 
> Our reproducer.c is available upon request.
> 
> Happy to test a patch if that would help.

Again, please send a patch.
