Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164672E266C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156627; cv=none; b=WBj33fUbe4GqQCjXD1axBa77EKDD4aPnqMPQ3hZFiPvbexowTYxdWq+Qq88RubaLxmhN9T27MytOw8HfGpNfWfgqaXa5qJwEn1pEiI/29XlEnTcd1QsHGOQDHSyh/f1Oz8valnPKRkzbiKn/wr1KkUpZIdPQHPSI/2Z2/87w4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156627; c=relaxed/simple;
	bh=ADFLpxJTy6WuqekBYcH8+chW3TrBLyByLSZYI4f+yyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ad9QIqG7QJRjKXN0/rLcsRKBr9zslw7oQtbVx+YsI75yhz1rWN476+tnXypjan/FIwghus8ivQ82zaDvKxaNjCLhO1BakmvXO/R9GZJRwDn6v7SKh1c7E3J+c7G4tFkw9oLkJ+gJ9mkSrl/MOYQxuZOO41ZuDOi2lccw1w8VcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es; spf=pass smtp.mailfrom=hsal.es; dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b=m1mbA0Jy; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b="m1mbA0Jy"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j5lpH1wq9zKmT6;
	Fri, 16 Oct 2026 15:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792156615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADFLpxJTy6WuqekBYcH8+chW3TrBLyByLSZYI4f+yyQ=;
	b=m1mbA0Jyczbb4IFU891R/y3QKmCITbeDLYUk9RwKS0JyYHyNzKR4hsHVnlnOIz4KhxURip
	ZIB1xuqrao8Y+WsFBZcgC+Oaa7tF9crSy9WtM2SO02w7NGXh/SczGlfckyP/zxRdOhLJoj
	33yO9y34MnB47Mx8pjN/p0s7N5yKwjiVbvBtOMXlnDS9rhWrX6yIhNH82IQ5l9XAyd0vDI
	wi/Xo/1FO6qEwUATjXmazi8Gtm82FyvgvntAOsTBuCdacjrTZuOrXyE0cK0/5lcotrZE6r
	FbG6chdTV41+fUXckIQHoVqp6o3/s2ZkBYrK+XNIpDiZGqz8jAOG5r/dJIo+YQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jfalempe@redhat.com,
	javierm@redhat.com
Subject: Re: [PATCH 0/2] drm/client: Keep larger modes in connector->modes on fbdev hotplug
Date: Fri, 16 Oct 2026 14:16:52 +0100
Message-ID: <20261016131652.483525-1-hugo@hsal.es>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atIYd0dd6ynXulwQ@intel.com>
References: <20261015212545.1989962-1-hugo@hsal.es> <atIYd0dd6ynXulwQ@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4j5lpH1wq9zKmT6

On Fri, Oct 16, 2026 at 03:28:39PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 15, 2026 at 10:25:43PM +0100, Hugo Sales wrote:
> > On an ASUS ROG Flow X13 with a 3840x2400 eDP panel, booted with
> > video=eDP-1:1920x1200@60, an HDMI hotplug makes fbdev reprobe every
> > connector with its 1920x1200 framebuffer as the limit. connector->modes
> > loses the panel's 3840x2400 mode, and after suspend/resume amdgpu drives
> > the panel with the 1920x1200 timing. The image ends up squeezed into the
> > top-left corner. Details are in
> > https://gitlab.freedesktop.org/drm/amd/-/issues/5983
>
> Sounds like an amdgpu bug.

Agreed, the resume bug is in amdgpu. It looks up the eDP native mode in
connector->modes, which fbdev's hotplug probe can trim. This series
fixes it there:
https://lore.kernel.org/r/20261014223041.171317-1-hugo@hsal.es

I sent this one for the shared list itself because after a hotplug,
connector->modes depends on fbdev's framebuffer size, while initial
setup, drm_log and GETCONNECTOR probe with the device's limits. Until
something reprobes, the sysfs modes file and any driver that reads the
list see the trimmed version

amdgpu isn't the only driver that reads it. stm/lvds and
shmob_drm_encoder_mode_fixup() take the first entry of connector->modes
as the panel mode, so they may hit the same thing with a video= mode
smaller than the panel. I haven't tested those, because I don't have
the hardware. Fixing it in the core covers them without each driver
keeping its own copy of the native mode

Hugo
