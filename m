Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69004288D0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815208; cv=none; b=biJ+1OL7pTnykFKt63jlwZ/BoJDgYANQcMaUVDLY5rfPxTArnev7Jr2IehFdfMAP8ZbcgDsqqTnqGPhXnq24S/2rOMqwQ6eNcGUA5JE070WO47ETDQ7mJVDVxRLKL7aNcHe3qLzMN7QKCS1eoMKCN5RtcF+SqfxaGtgKhOHzuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815208; c=relaxed/simple;
	bh=sRGU7AaQzEvMvtU/o6Fzq/lzwxUVeprDtN7OxmlMIGA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z8ai7yieBpXzIMVQ2XlpQEY1CKOTLI5geTxb9TWynIzC6agkGN+kjW33fLxFVliCQ+f1w1EhhOHE1ttewQT5FMNcPzhGdk6K6AWwpB+m2YlNzWjcwBlITEP/dPOJ0g+xQCuVU9JX9yz9V2ZvFhX9EDav3n0K+I/qikFhcOReUwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cj+zEZGp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cj+zEZGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787815204;
	bh=sRGU7AaQzEvMvtU/o6Fzq/lzwxUVeprDtN7OxmlMIGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cj+zEZGp/GxsoCKw2kj6q1zoqhJNQNhtkx52vTWCothBtwy7DWwjc9ZKm7RlnFwM+
	 7ejOSH9ETOSi/ZreQItktRA8HBfqT7DrjTODbwqAWVOaTMeHv5IjfYfcz/UfgSQdKU
	 g820xdWEnEJiL9UdB04nkDClWwa1umnS/7KkMFRwfkB+ubEaO2iLudJz9Dn5B6gYzu
	 /5AyuQZ9iwDCbyhZjUopdGXCpX73OpYH2ZWWiybzkcbj+r9Upo8APNJPRR4Vw6kJIF
	 jrloAO4EYrDdkHontNN8Zbdr20QlPREgqaniSjL7XPUcMcsnYcDSw66epfIOpt9axI
	 rIMo/iuFrAXrA==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E313917E01B3;
	Thu, 27 Aug 2026 09:20:03 +0200 (CEST)
Date: Thu, 27 Aug 2026 09:19:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/9] drm/panthor: Reduce dma_fence signalling latency
Message-ID: <20260827091959.6faf45bc@fedora-21.home>
In-Reply-To: <20260825-panthor-signal-from-irq-v7-0-ebb5b4c891a4@collabora.com>
References: <20260825-panthor-signal-from-irq-v7-0-ebb5b4c891a4@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 10:01:21 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Right now, panthor is one of the rare drivers to signal fences
> from work items (not even from the threaded IRQ handler). We
> tried moving the job_completion check to hardirq handlers like
> other drivers do, but the duration of this handler gets
> slightly over the few usec (20+ usecs) we usually expect from
> hardird handlers, and we're not sure we want to hold off the
> processing of other interrupts for that long. So this series
> just gets rid of the threaded-handler -> work_item indirection
> and checks for job completion (and thus, fence signalling)
> directly in the threaded handler.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-next.

> ---
> Changes in v7:
> - Adjust scg_slots comment to reflect the fact the priority field needs
>   to be accessed with panthor_scheduler::lock held
> - Don't disable IRQs when acquiring the fdinfo lock
> - Link to v6: https://patch.msgid.link/20260811-panthor-signal-from-irq-v6-0-12f2ab53d735@collabora.com
> 
> Changes in v6:
> - Rebase on drm-misc-next
> - Link to v5: https://lore.kernel.org/r/20260625-panthor-signal-from-irq-v5-0-8836a74e0ef9@collabora.com
> 
> Changes in v5:
> - Add a fix for a theoretical IOMEM access in suspended state (patch 1)
> - Make sure we don't delay a pending immediate tick in
>   sched_resume_tick() (patch 2)
> - Make sure we initialize panthor_irq::state properly in the irq_request
>   helper
> - Link to v4: https://lore.kernel.org/r/20260625-panthor-signal-from-irq-v4-0-3d2908912afa@collabora.com
> 
> Changes in v4:
> - Add a bunch of fixes for bugs reported by shashiko
> - Link to v3: https://lore.kernel.org/r/20260623-panthor-signal-from-irq-v3-0-2ece396f8ee0@collabora.com
> 
> Changes in v3:
> - Save/restore the irq state in the raw handler.
> - Rename panthor_irq::mask_lock into panthor_irq::lock
> - Use the __always_inline specifier on
>   panthor_irq_default_threaded_handler()
> - Use devm_request_threaded_irq() even when the threaded handler is
>   NULL
> - Drop the patch that dynamically enables request-related interrupts
>   (FW-side race) after the polling period has expired
> - Don't process FW events from the hardirq handler (too heavy for an
>   hardirq handler according to our testing)
> - Link to v2: https://lore.kernel.org/r/20260512-panthor-signal-from-irq-v2-0-95c614a739cb@collabora.com
> 
> Changes in v2:
> - Fix commit message in patch 4
> - Move devm_kasprintf() before panthor_irq_resume() in patch 3
> - Fix erroneous lockdep_assert_held() in patch 6
> - Make sure events_lock is held when calling
>   csg_slot_sync_update_locked() in patch 6
> - Restore a csg_slot_sync_update_locked() call in patch 7
> - Fix a potential deadlock in patch 9
> - Drop the IRQ coalescing patch (formerly patch 10)
> - Change panthor_irq_request() so we don't have to define a dummy
>   threaded handler, and we can let RT kernels move the hard handler
>   to a thread
> - Add patches to transition GPU event processing to the hard IRQ handler
> - Link to v1: https://lore.kernel.org/r/20260429-panthor-signal-from-irq-v1-0-4b92ae4142d2@collabora.com
> 
> ---
> Boris Brezillon (9):
>       drm/panthor: Make panthor_irq::state a non-atomic field
>       drm/panthor: Move the register accessors before the IRQ helpers
>       drm/panthor: Replace the panthor_irq macro machinery by inline helpers
>       drm/panthor: Don't update might_have_idle_groups in process_idle_event_locked()
>       drm/panthor: Get rid of panthor_group::fatal_lock
>       drm/panthor: Protect events processing with a separate spinlock
>       drm/panthor: Don't defer job completion checks
>       drm/panthor: Don't defer FW event processing
>       drm/panthor: Automate CSG IRQ processing at group unbind time
> 
>  drivers/gpu/drm/panthor/panthor_device.h | 286 ++++++++---------
>  drivers/gpu/drm/panthor/panthor_fw.c     |  22 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  28 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  39 +--
>  drivers/gpu/drm/panthor/panthor_pwr.c    |  24 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  | 518 +++++++++++++++----------------
>  6 files changed, 452 insertions(+), 465 deletions(-)
> ---
> base-commit: b961eb36d7b04147104cff2fd8bc0e94f4713324
> change-id: 20260429-panthor-signal-from-irq-d33684f4d292
> 
> Best regards,
> --  
> Boris Brezillon <boris.brezillon@collabora.com>
> 

