Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0978F3A;
	Mon, 19 Oct 2026 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378247; cv=none; b=JOXSehbwbd8VVCbl3kIQHFxaQyko+HkgrfMs9E+KCn9BI2AEmO2OGvjP9eMb1ZPAX0RGM2siqQxHFpDgF36DUDhl9tmoB8Xua70NqbH8I34JJ46LLo0Vkr0xpNXP96NYkbU4EIpyhR1YJU63EVd91dNEVE6s4A1P0xsavDFpzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378247; c=relaxed/simple;
	bh=vV5DEKAJfTzByXdTR/uF4Q8YsdbYRiGqWa73jllZPjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQd/xp8ErFJm8uNlHanxE4v9gi3szQV3oE+EqoVldgBEsJuTD44jqn1VyaQrGbTpXg9l2wGlxm/lPS4sAe5e36R5HKwZQo9z0ER/cezdiOYdLD6fbhYIx4An7IHOgnxqq8ap+m3KMtJuo4GL/8VkSZZ8cOLzHwNblNXgdGY23SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glhqhAj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glhqhAj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715D81F000C4;
	Mon, 19 Oct 2026 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792378246;
	bh=mJVlURAJ8Itn9aOLbLk8JcD/b7z4beNkUp5JTrYX+Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=glhqhAj19YV4m4VdlazwEv1fP+zibvsTVLXEMIMju0CiRJtgUK+h9nvfqlDVtUim2
	 AKFjo4ztxBelXbfFKIqmkuW4IK/bZeHQN03ayaM8STi3U/H1ehnW7Lqh3Sqaap4zba
	 PTWXgeogz/wQ13euk+sLlO4EzsG5KiOfbeaLbJbIkgF5lWdwnn96E0pQZs+2ovUf5P
	 GrenVMF0+EaALVz0q8SRVhltmFKDFb5rYowOz/A4I7Yev6q2IwxG2zU7OBm6rh2O4F
	 4ySzdoE0dXC896HkJEwMY2jxkhV/t2Zt/MZ1bt9QcVinfCmlDEjsV9f0C0Ifc8twKC
	 qEjoSNsFPPIEw==
Date: Mon, 19 Oct 2026 02:50:43 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on
 EC_HOST_EVENT_PANIC
Message-ID: <atWFg7gm_jLBOwxu@google.com>
References: <20261008172208.1139281-1-scollyer@google.com>
 <as8slqeTjJYWOlaa@google.com>
 <CALUcz=3WE+SUx2j8LKFQQK-fMVXdk69rZJ9nKgBMQ_UwnWRPSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALUcz=3WE+SUx2j8LKFQQK-fMVXdk69rZJ9nKgBMQ_UwnWRPSA@mail.gmail.com>

On Wed, Oct 14, 2026 at 01:57:22PM -0700, Scott Collyer wrote:
> Yes, if the EC crashed, the the AP will be reset. There is a slight benefit
> for the EC case in that a controlled shutdown gets triggered. But, the
> primary motivation for this change is to trigger an AP reset if the ISH
> panics. If the ISH panics, there isn't any trigger currently to reboot the
> AP and this leads to the sensor stack being out of sync.

Please don't top-posting [1].

I don't think this is the right approach, given that:
- cros_ec_handle_event() is a generic event dispatcher for all EC
  instances, not a place for device-specific event handling.
- The ISH driver or sensor stack should re-establish the state after an
  ISH panic rather than rebooting the AP.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

> 
> On Wed, Oct 14, 2026 at 12:17 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> 
> > On Thu, Oct 08, 2026 at 10:22:08AM -0700, Scott Collyer wrote:
> > > When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
> > > event, the EC/ISH subsystem has encountered a fatal exception.
> > >
> > > Handle the EC_HOST_EVENT_PANIC event by:
> > > 1. Logging an emergency message (dev_emerg) with the device name.
> > > 2. Calling the panic notifier chain (panic_notifier).
> > > 3. Emitting a uevent (ERROR=PANIC) to userspace.
> > > 4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
> > >    so that panic logs are preserved and collected by crash reporting
> > >    services across reboot.
> >
> > If the EC crashed, wouldn't the AP be reset anyway?
> >
