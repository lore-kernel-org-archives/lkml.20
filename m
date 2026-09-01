Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6E33BBAF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266290; cv=none; b=biZgxp7nA9fy+d1W0k6MfGI9g+5wRvJhNeNLMfVToeulFYizTXE6uPUNp4q8S6SHW5n1MDrmF1rl48zvXmRof1cJu4j8XsHm86uX5Ft20e0qKa6S4ZiNDQvF63d4k4WhofCNGmuV7tK8gVGq5XniRMD8OAN3ADGnKCgJZEfSh1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266290; c=relaxed/simple;
	bh=t6gp/ZegTeXdNL/BzhBDyU250Dh0osTv3SphAvKOI50=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxWtAC7WeauSoEPAbuC1HDl4tgHKwpiKSBDxakyQim9jTN6NddQnFmJ+OY6S7o7Ztihyz8DM28fv/9mBitEyea+RmQM4tsll9EdBNlCXAZK2qY0n47iQFAAD0VoidThZcXCKRZqfuHboV6nOjrw0bMcZB69MFq5MaejHo9uK044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NtnnX+AQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NtnnX+AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788266287;
	bh=t6gp/ZegTeXdNL/BzhBDyU250Dh0osTv3SphAvKOI50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NtnnX+AQ2v169vtHTrrq10rkPda4iynNjVGe6M1N0u2ndUOaXtrcBhSiLXNfDbWz1
	 n0Qh/fT7bYuan0Y2TXJ2jqZnVkut8eiSnn1woUBawm9JhZqZyD6DgIC9SdGHksXGzW
	 fyUMcSXcLX7fOpLliFQTSLD/ndudSF3CVP/I2nTXasCjJFMxGvQ//fZY1sSuiD8FY5
	 WXg8995Etv4P3VIX1FEmzZoIg209o8azdfXMtpH6/tFgiEaMNMxEdliKJaf/c10stv
	 ayaSNOv8bmloGyjj8AVL3MiWHQkqMckxHl1qQAtun1mxUL0TmIKar/WQWHot64Xdrs
	 gafYQkhxL4Hwg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1E8217E0934;
	Tue, 01 Sep 2026 14:38:06 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:38:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, "Marty E. Plummer"
 <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt
 <eric@anholt.net>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 06/17] drm/panfrost: Consolidate device clock
 management and reset
Message-ID: <20260901143803.22ae33c4@fedora-21.home>
In-Reply-To: <20260828-claude-fixes-v7-6-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-6-72a13b2c125d@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Aug 2026 21:56:46 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Gather all clock enables and disables into a single function to avoid
> repetition. Also, as part of the same function, handle reset control
> (de)assertions, since that was already the case in the PM runtime
> functions.

I think I'd prefer to not mix clks and reset-lines. So basically, a
set of helpers that deals with clks (panfrost_clks_{enable,disable}()),
and manual calls for the reset line.

>=20
> Also do clk (un)prepares and dis/enables at the same time, since the
> clk_prepare_* family of functions can simply increase the refcnt of
> an already prepared clock.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
