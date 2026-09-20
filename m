Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFE31ED8B;
	Sun, 20 Sep 2026 05:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881386; cv=none; b=pyImWpWqRm8skDGQ0r22uUiu4as/0k4ubhahjwZgSZC7hJ1imeCthCrpZ+K0HXCe6rJuXCysQUqHXW4pgmB6G2e4NvIINHAjBPHFDx3ii9r3/7rFevfwc1DTQM1/eOk3c1PHBS3OMu3bCQfBVNZ4pHZqIudvvMeVRtPldoyK1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881386; c=relaxed/simple;
	bh=W684xrlAR2UK1IDoIlLa4/kouWP2PDcL1gTfun31nKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNHqOGA5gKlAwWFCh5rz0H2GGBSoQReTxqtvuYkgCjbZGkrFRL1YIb19sXM15OmQS+WIRbWp4Tnm+lqmKAwUzkGZ1UKlSsxx9ArOTgE9CGcy425b7vikNe8DsY6kic3Nviux739dSn4ORZKSoJiDSFaDhPnaJrvsiGM4uFe+2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TdJ8E04U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TdJ8E04U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD6B1F000FF;
	Sun, 20 Sep 2026 05:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789881384;
	bh=ykHp/raTGbpuADy64jQR5VrOmrXBslYzW+4RU51K4Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TdJ8E04UZmPjvgC3c5ozMmj7OA2bhjHBN6BQd7QLbIA+MXjYhYNjnardDmQm7C1VB
	 Xt2LMjquhJ5rVO1nIsWJX2UvoiMvxO/14Ea1ZoZ8yY4tIrH5vjRLBR+qCNvM+SpwEw
	 gGEx0ohhWXB9kg2vV8+7jOZQ7pYxv5NbNvgZ/yv0=
Date: Sun, 20 Sep 2026 06:14:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: garmin_gps: fix signed integer underflow
 and OOB read on packet length
Message-ID: <2026092059-hacking-coveting-c629@gregkh>
References: <20260919080849.3005763-1-benquike@gmail.com>
 <20260919112819.3885778-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919112819.3885778-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 11:28:18AM +0000, Hui Peng wrote:
> getDataLength() returns a signed int from __le32_to_cpup((__le32
> *)(garmin_data_p + 8)). When bit 31 is set (e.g. 0x80000004), len is
> negative (-2147483644), bypassing the upper bound check (GSP_INITIAL_OFFSET
> + len > GSP_MAX_BUFSIZ) in gsp_send() and triggering a KASAN slab-out-of-
> bounds read in garmin_write_bulk() when GARMIN_PKTHDR_LENGTH + len wraps
> around to 16.
> 
> Kernel stack trace:
> BUG: KASAN: slab-out-of-bounds in garmin_write_bulk+0x164/0x3b0
> Read of size 16 at addr ffff88800791400c by task poc_verify/188
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x4d/0x70
>  print_report+0xc4/0x610
>  kasan_report+0xb8/0xf0
>  kasan_check_range+0x118/0x190
>  memcpy+0x24/0x60
>  garmin_write_bulk+0x164/0x3b0
>  gsp_send+0x218/0x490
>  garmin_write+0x142/0x2c0
>  tty_write+0x294/0x540
>  vfs_write+0x412/0x640
>  </TASK>
> 
> 
> Note that garmin_write_bulk() and garmin_write_bulk_callback() are
> triggered from local userspace calling write(fd, ...) on /dev/ttyUSB0
> (even with a normal USB device attached) by writing a 12-byte packet
> with a negative 32-bit length field (e.g. 0x80ffffff) at byte offset 4.
> 
> Kernel stack trace (Linux 7.3.0-rc3):
>  ==================================================================
>  BUG: KASAN: slab-out-of-bounds in garmin_write_bulk+0x922/0xbf0
>  Read of size 12 at addr ffff88800f8ef958 by task usb_poc_verify/162
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x70/0xa0
>   print_report+0x153/0x4c6
>   kasan_report+0xf1/0x120
>   kasan_check_range+0x11c/0x200
>   __asan_memcpy+0x29/0x70
>   garmin_write_bulk+0x922/0xbf0
>   garmin_write+0x3e6/0x770
>   serial_write+0x167/0x2b0
>   n_tty_write+0x5f4/0x1020
>   file_tty_write.isra.0+0x411/0x760
>   vfs_write+0x671/0xd20
>   ksys_write+0x1bb/0x210
>   do_syscall_64+0xda/0x4b0
>   </TASK>
>  ==================================================================
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> v3: Add a Fixes: tag and use the conventional subject prefix.
> 
> The length arithmetic in gsp_send() and nat_receive() is unchanged
> since the initial git import - garmin_gps.c is already present in
> 1da177e4c3f4 with the same signed getDataLength() and the same missing
> bound - so that is the tag. The later commits git blame surfaces are
> not introducers: af6d780b5787 ("garmin_gps: Coding style") and
> fb571101af63 ("USB: serial: fix compare_const_fl.cocci warnings") are
> cosmetic, and b4072f46e57f only re-nested an existing condition.
> 
> Greg asked on an earlier posting whether this is an untrusted-device
> issue or something a local user can trigger. To be explicit: hunks 1
> and 2 are reached from userspace. gsp_send() consumes the buffer that
> write() fills via garmin_write(), so a local user with access to
> /dev/ttyUSBn can drive the length arithmetic directly without any
> malicious hardware. Hunk 3 is the device-input side and is plain
> hardening in the sense of
> Documentation/process/threat-model.rst - we trust the device, and I am
> not claiming otherwise.

So as this patch is doing multiple things, please split it into multiple
patches, like our documentation asks your LLM to do :)

thanks,

greg k-h
