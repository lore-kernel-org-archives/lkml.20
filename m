Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD523B42CC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977718; cv=none; b=dMMOHV7CfB+ZdJNfDmoUXj0HeuTxLHlCdJy/x3bOKLrz/WzTapQQwyHhrTW2IGMJhiBGlfy14Q2OGu95P9LYjozXW3rtpkb+ai+I2CeNgT1++EftbMqgGD0R1/ODmTy1CuOjiHDKINapQYqwUxB+KwDT5uQQpIHuBDeh8HQYMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977718; c=relaxed/simple;
	bh=ffgYr5YDmmbHJ/YZbfGMXSYf7rRr6BO8vxNzGNH3a+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewRoOw1l/qoCmirkKTPuw/PMFwJ8Wy7p4rkM0ts7jCbMXQtxYpJ3JthutUDf/O1Tuz88z1duazlkSgtNIqL7rhxci1eqescTYnjomwn1zKhH+DgJgfB7hrEMqbvY5bq+lta3nQpVx4kCBwY+7WvDq7GZ0txedZ7U8rgEV37Agi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=aiBr5sLQ; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="aiBr5sLQ"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hpG0C03SPzHyG;
	Mon, 21 Sep 2026 10:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1789977706;
	bh=ffgYr5YDmmbHJ/YZbfGMXSYf7rRr6BO8vxNzGNH3a+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aiBr5sLQJq6jiVKceXYMPYCUK2bmY0T6ByE2DKDetSNCjUnMUZWZkmWhwHUUDzuB5
	 Hh3kli6XN7IpAXM6LoidZ5zlPLvthkCFzRaN//q6JSiYXjWOhp74pXiF4hgkl6SJQq
	 2NmNpx++yOBoCum0H7qhn3X/BEATyyZRCRtBJajt3fL3be/HhPDex03EJrxSjVRfjl
	 4ysvUsdXFArHZmQ5g2Il4equZToy3O4z5Kbr8U/E2VTnBW9j568YLRY7IiSWtMjReP
	 wI8oBkBI4OqfnMom8FMHYtB7u6R2Ai/A12be/QluL23EZ0VGlRfuaV617vih0fZpuL
	 QOmW2BoWW2EgQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hpG095mmVzhss;
	Mon, 21 Sep 2026 10:01:45 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: Daniel Ramos <capitain_jack@yahoo.com>
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] drm/amd/display: HDMI 1.4 3D output (frame packing, top-and-bottom, side-by-side)
Date: Mon, 21 Sep 2026 10:01:26 +0200
Message-ID: <20260921080126.98936-1-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921034104.1021664-1-capitain_jack@yahoo.com>
References: <20260921034104.1021664-1-capitain_jack@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On Mon, 21 Sep 2026 00:41:04 -0300, Daniel Ramos wrote:
> Independent confirmation of this approach on older DCN hardware and a
> consumer-TV sink, plus a boundary record that matches your patch 3's
> diagnosis.

Thank you, Daniel. A second DCN generation and a TV as the sink is
exactly the coverage the series lacked, and the black frame-packing
picture without the doubled timing is a good independent check of
patch 3. (Adding the maintainers back to Cc.)

> Happy to run anything specific on this APU and television combination
> if it helps the review.

One request, if you have the time: your runs used your own port on
7.0, so a run of v3 itself would make your Tested-by cover the patches
as posted. It applies cleanly to 7.3-rc1. Top-and-bottom is the most
useful check, since patch 2 only affects that layout and your report
covers side-by-side and frame packing.

For the record, as with my later amdgpu patches: the series and this
reply were prepared with AI assistance (Claude Code); I reviewed and
tested the series as described in the cover letter. A respin will
carry the Assisted-by tag.

Harry, Leo: any comments on the series?

Thanks,
Adrian
