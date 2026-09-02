Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A4D47FAE7;
	Wed,  2 Sep 2026 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352441; cv=none; b=GYQlwS+xJgH62gd2e79teIVoyeH8hw8UI0+WDcGX4zPr9HQvE4ui1lnr4BHCuVhZ/GcHTbQtWeltATB6pGxMJTBqy3QgXekBT2v/6sYW5zkiVNbnUpGypiwoel+tRrVju7bogEqJmmXBtUAsRC9YGISR/k+UBXG5m3VFn+e60ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352441; c=relaxed/simple;
	bh=dP2reKxwesfFmrZQztpbXgXSp7Bp1X24NDBrpd79YvM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eTi/51ui2nToNOYtGoT+dFLmQPoAUr6LzqYuQDrnznMD0RiMIy4ab3Nw95uGQtpRroJQemUu1oEdoR3Th9pJQIwXZ9PE1GY+/MWT7lJonsvmXF+1u61q6gxvjVlliWsvO1zSTZs+0f9q7evM9gO3ZblIfXmwLNQhgeYWM/UajnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works; spf=pass smtp.mailfrom=empyreal.works; dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b=XxcnO3rE; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b="XxcnO3rE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1788352431; x=1788611631;
	bh=WbkLXvzuC8EnMAussIB7h1FklxJSI83VIhKM65a5XCA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XxcnO3rEij5qhKk+K91lK/zwlhdkOWTKcOGtaG0C+UEbNx6vsrOTapNYHewJgNtEY
	 jBG4rj5KIiwNuAfWWiqzsr3OC8It2babNpTW5B7DNx9jUqZ4N9N6opO0oe6vEfHpoY
	 +jy2rK8eyKQDfHxGcTlZvHtRjl53OA4zAFB6beAx+wB1XtsZc9UWefa4II/KTVQyk2
	 EDxT0yn+zzqrGSS6ooRhzfEzXRk66hvKMAm/+4cVhBH7EQvWbLfAPaSCeg4eK49Yet
	 z4+gUpf8aWXFjJFf2CDVS6X2fTZiqhS46q7ZiD6nY+/2UOiSwAkmCXc5CA9F0Q7HRR
	 xg2/4Ey5uSqzg==
Date: Wed, 02 Sep 2026 12:33:46 +0000
To: linux-usb@vger.kernel.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, Sanath.S@amd.com, Basavaraj.Natikar@amd.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] thunderbolt: suppress reset-induced ring interrupt warning
Message-ID: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: c94c7c14a45f296f13eeb5f113711010f6875152
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The AMD DMA-teardown quirk resets the host interface before USB4NET
stops its service rings. The reset clears the ring interrupt bits while
the rings remain logically active. Their later interrupt-disable write
is therefore a no-op and emits a warning, even though hardware reset is
the cause.

Reordering teardown is unsafe because stopping the ring first clears its
descriptor base and unmaps frame buffers before pending path traffic has
drained.

Patch 1 tracks the host-interface reset generation and excuses only a
redundant disable by a ring that crossed an eligible reset. Genuine
software-state drift retains the warning. Patch 2 covers duplicate
enable, duplicate disable, post-reset suppression, and real register
changes.

The exact series passed all 49 Thunderbolt UML KUnit cases and three
production configuration builds with warnings fatal. The resulting
Thunderbolt module booted on two AMD USB4 systems. The affected peer-host
XDomain teardown could not be reproduced because the available attached
device is a hub rather than a peer host.

Andrei Rusu de Castro (2):
  thunderbolt: Do not warn when a reset clears ring interrupts
  thunderbolt: Test ring interrupt warning after host reset

 drivers/thunderbolt/nhi.c   | 56 ++++++++++++++++++++++++-
 drivers/thunderbolt/nhi.h   |  4 ++
 drivers/thunderbolt/test.c  | 82 +++++++++++++++++++++++++++++++++++++
 include/linux/thunderbolt.h |  9 ++++
 4 files changed, 149 insertions(+), 2 deletions(-)


