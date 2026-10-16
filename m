Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC7D379C40
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161623; cv=none; b=SbeR+YELELn0+ghjI4FZKDYDvb1wCPzXOtBD6OAk5Bd9zn6Iv33T7Yw4y9MelEn6ULJrdJbn5VEdU1uW4X+C2EzRLoRR9aA9kJqaGM2bynTBQbQ6H5sPm1G1PiFAuUtt+gMjEtgFqvS+Rher8QdUgXnL2RgfDjHb/4Yjd2RQqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161623; c=relaxed/simple;
	bh=dS/+QYyFt7bepYEquW4f2tzbCjSDt1FaV0bMvIj5qK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qh1YGeVN04OTaC/rdhQl2sy+8MoPYr0ZmFqOIKi/GI+tkFrdMA6BgCFO98nLPi8tLTZyYRXGfDun68unfaaIduBLnb3rpEQUx4/vQZopTfeMqzUcDqJwd/f7BJhEx2SUplt/DCXGUEHPwf2Xle0MtrvebXrPCrFopfwe55PH+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es; spf=pass smtp.mailfrom=hsal.es; dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b=Qbg0Zs4o; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b="Qbg0Zs4o"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j5nfS5D9TzMlRZ;
	Fri, 16 Oct 2026 16:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792161616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dS/+QYyFt7bepYEquW4f2tzbCjSDt1FaV0bMvIj5qK0=;
	b=Qbg0Zs4oWE9kiZywd6BJ3nSkcp+q5c7TCLGc2dKtb4JJiCZPXT0kcQQqpjp4iv4+C5h0oe
	uLtE0miAawW0bDeWe2W5mJ5dbxweBTM1wKDFHTjLiWmXy6ME0TGQB7VZLFRlgGNH3Yrhdy
	rqLR25bxXojfn+Ys5yiWfT0E8j0JWuPpTeWqvKgVQppMVjLQGU3Uzg1+NOuazCG1jXDydp
	Qa2A395Bh2A0CjXbAhNOYoe6I8G9o1MJMiAMtYL0kLMSUVR3bBZU9IZ3AjCZtCx4Gc2R99
	pH4jDaNP5CzKgk2RAsRrsj5HdCXMcMzHXxd2SP2Fg9DeT0lIYjYZRayk9JcyCw==
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
Date: Fri, 16 Oct 2026 15:40:13 +0100
Message-ID: <20261016144013.1014546-1-hugo@hsal.es>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atItSgRj26x60ACf@intel.com>
References: <20261015212545.1989962-1-hugo@hsal.es> <atIYd0dd6ynXulwQ@intel.com> <20261016131652.483525-1-hugo@hsal.es> <atItSgRj26x60ACf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4j5nfS5D9TzMlRZ

On Fri, Oct 16, 2026 at 04:57:30PM +0300, Ville Syrjälä wrote:
> Connectors aren't probed before something actually probes them.
> Typically that would be fbdev.

I think I may have misspoken before. fbdev's first probe already uses
the device's limits: __drm_fb_helper_initial_config_and_unlock() passes
max_width and max_height. Only drm_fb_helper_hotplug_event() passes the
framebuffer size, so the list starts with every mode and loses the
larger ones on the first hotplug. This series makes the hotplug probe
match the first one

Are you suggesting a different approach?

Hugo
