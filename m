Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8CA30FF1D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895205; cv=none; b=IZFruGpfSa9SZlZUsc7gBzGybC1H+6BQ6D30igpZxArwgUIwqTzrO86arj2OJbihvJI3NGoIvDSu8uHXaFWVwzZCwW+2CrTRvrK9pj/9QdMYL0/HSbE4kE3+rf727tiQ6fijeSBuVXKiPkLLOqBOXen5Z6ZEmo5LKAFiMNaK48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895205; c=relaxed/simple;
	bh=XFnpb4vyrUIGVWUMRq9dAFJwKAqBq9ybie8JRsynlMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbEdzR2U294uK8muSTYNl0Ytokn7rD7RwX7Jb09iHyryavmzeovRDEBVvD5uwwTmdWME/alGh3V+bY9aJvQfEbFjQtfeRpp1Nb/AhAzeaCYLNlpwKZHyt5t5P72k2b/TTOViJqbkKe9Ss+tCjNSlfdqY4/3i1uu0eJMbgRpNOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J4Ju3OeH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J4Ju3OeH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5BE1F000E9;
	Fri, 28 Aug 2026 05:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787895203;
	bh=Nmg8bD8f+GSG7coSmqUYDPT7r8p1j2QajUMBNK9NM9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4Ju3OeH0XbgHmKWRfUWf6sBsg6DBLHiwG+ZRIzciKN5KipxuxOnVfhYHOwfvA7Nr
	 B09gtI8Yp6S+Qd0rkwKLHb0a1fFUSOK6LNV3s6FA5u2TjhQ4SRZ9Mp+i3qiU65VdMF
	 dsGwL6l6z0git6igktmTFWP6uoxwoVdFPnnosHeg=
Date: Fri, 28 Aug 2026 07:33:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, falemi@asu.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] free_irq -- mei_me_probe error path frees an IRQ it never
 acquired
Message-ID: <2026082854-blasphemy-freeload-5fb8@gregkh>
References: <CA+0ovCiBsLEjFZ7-=MGtMQix8HMgsp5WQJbVqb70dPqyHSZiTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCiBsLEjFZ7-=MGtMQix8HMgsp5WQJbVqb70dPqyHSZiTQ@mail.gmail.com>

On Thu, Aug 27, 2026 at 08:20:16PM -0700, Farhad Alemi wrote:
> Hello,
> 
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
> 
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/130-mei_me-free_irq-never-acquired/
> 
>   genirq: Flags mismatch irq 0. 00000080 (mei_me) vs. 00215a00 (timer)
>   mei_me 0000:00:01.0: request_threaded_irq failure. irq = 0
>   Trying to free already-free IRQ 0
>   WARNING: kernel/irq/manage.c:1879 at __free_irq
> kernel/irq/manage.c:1879 [inline], CPU#1: kworker/u10:0/27
>   WARNING: kernel/irq/manage.c:1879 at free_irq+0x292/0x8b0
> kernel/irq/manage.c:2018, CPU#1: kworker/u10:0/27
>   Workqueue: async async_run_entry_fn
>   Call Trace:
>    free_irq+0x292/0x8b0 kernel/irq/manage.c:2018
>    mei_me_probe+0x672/0x820 drivers/misc/mei/pci-me.c:295
>    pci_device_probe+0x461/0xa50 drivers/pci/pci-driver.c:489
>    really_probe+0x267/0xaf0 drivers/base/dd.c:709
>    driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
>    __driver_attach_async_helper+0x128/0x290 drivers/base/dd.c:1227
> 
> Our reproducer.c is available upon request.
> 
> Happy to test a patch if that would help.

Please send a patch to fix this, as you have a reproducer, and your tool
can generate it quite easily.

thanks,

greg k-h
