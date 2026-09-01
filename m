Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC806248880;
	Tue,  1 Sep 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273500; cv=none; b=kPdaKlQ7N8xARmSqeoAYsH+B2UrONhzIDHamK6yogQHqHVQWKwFeNnFnv8kp8TQyXRnThKq6KQfkYU65lKVUUE1EI/pagJBXDtZ3hD6z3UTh6phcvnkNJ1TMBBzjE1B2//Rbdkt9HdO8+r3OTq8cFhZGgYumiUcGpmlhrT7YsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273500; c=relaxed/simple;
	bh=sLzkEnAsjIIJGrm0ODKZMth7hx3CXmIdHLGBEWnYO8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgYsKal/aR5HZj0JSgO6TUl19xJnldNSUTPvkJMEpqsihxU4lHocTt56r6kgOx7RvrSMeHrSrPbKvrRSaMT/IeAZYpG9P6iTJSltyH1Vbtyy/DFlbxtUYtwlqJU7qVnyE2bAu4XtDbBp0G0VRRt9FZpORFvoZMQQ2DdnbfdkqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFdkqX+x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFdkqX+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788273495; x=1819809495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sLzkEnAsjIIJGrm0ODKZMth7hx3CXmIdHLGBEWnYO8w=;
  b=BFdkqX+xe4YqmY1nTp9bYxdutS6cYEcpvBgbwN8dTqQR+AkRiW3qQYek
   +g58ATimBr2TrxDp/TySaZabkjvv0981Vr6aSQYe1xGl6BpzLzDziX3ZL
   +D3XxyoptqfmM0Y2fuCDbJsfkauFkvrKu3IOOPGQJqgC4AZJQXT25buXi
   vVMEK29K/+Ezr/RkInwtLDssd2nZ9Fl2L7X1RM1q5hkUIgjYVq+2rLzRI
   1Dg0DEVYOkZC0I0762Nmb+BlPVQz+tbRfaRLvuCGQMRxdd4/SDlC5L/0/
   NXojphKqNr7W2q7SJGjR55L8ushKOPa9mmwszHghAHfxqCpnpzTWVBjdq
   g==;
X-CSE-ConnectionGUID: hpBHxjjFR2KRoXaPB/KS9Q==
X-CSE-MsgGUID: nSf8iPmPTiSDKWdk3e7qDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92520139"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="92520139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:38:13 -0700
X-CSE-ConnectionGUID: jsQ12vr8TfiKLo63Ropa4g==
X-CSE-MsgGUID: 6thLB3NUR+6GfPom+nvxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="265877904"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:38:11 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan <ruslan.panasiuk@gmail.com>
Subject: Re: [PATCH] ALSA: seq: midi: wait for output buffer space on non-atomic delivery
Date: Tue,  1 Sep 2026 22:38:03 +0800
Message-ID: <20260901143803.422827-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <871pbddz5k.wl-tiwai@suse.de>
References: <871pbddz5k.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 01 Sep 2026 12:49:43 +0200, Takashi Iwai wrote:
> But, the problem is that you can't take long time in
> dump_midi() which is called from the sequencer event handler, per
> design; the atomic=false there doesn't mean that you are allowed to
> block for a too long time like 30 seconds.

Right, dropping this one.

> For working around this problem, we need a basic design change in ALSA
> sequencer core, I'm afraid.

Would you take an RFC along these lines, or do you have a different
shape in mind?

- event_input gets a way to say "port full": the core parks the event
  on a per-port FIFO instead of dropping it, copying direct/USRPTR
  payloads into the sender's pool cells (snd_seq_event_dup(),
  non-blocking).  While the FIFO is non-empty, further events for
  that port queue behind it.
- The kernel client signals readiness through a new snd_seq_kernel_*
  call and a work item re-offers the parked cells.  seq_midi would
  drive that from rawmidi's transmit ack, mirroring the input-side
  runtime->event hook.
- Backpressure stays at the sender's pool, the only place that sleeps
  today: a blocking writer with parked cells waits for pool space
  before its next direct dispatch, with ioctl_mutex dropped as
  snd_seq_cell_alloc() does; poll() already reports pool room.
  Nothing sleeps inside delivery.
- Client exit purges its parked cells from every port, as
  snd_seq_queue_client_leave() does for queues; port deletion frees
  the FIFO.

Open points: a SysEx bigger than the rawmidi buffer is consumed
partially, so the resume offset has to live in the parked entry or in
the driver; one event larger than the sender's pool cannot be parked
at all (the limit queued events already have); a broadcast is
duplicated per blocked destination.  Drivers that never report "full"
keep the current behaviour.
