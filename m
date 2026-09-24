Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1764DF4DC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284464; cv=none; b=GG0v0pXpacVwpCy/SfJyD8o83imt7syEvtwi6htyNkc8qaz5vwf0itCqE7mP25v0PRAq2Flhlk2jwiot+zgqXQ0IX94XyypF70NtW0rgbyVtWfq2OHv3+cG/kQtaUDMYfqXKjYYqLGcqyK4m3cJK2DXm0sf9A70d0cVLSvvcRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284464; c=relaxed/simple;
	bh=ZHwGCo66wCcvWADVnNKyzxFoIh6vn1U/QHlf/zcUkVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXHzSTTzTNZwJWsCidKarGIx1laAeAqFufQsgoSV2Ynms167N5QUZonmlxALmAyUmLkmvgUhTzzORY2T6erU21lUmMk4BSDkix6wFadNx3exbx4HCJ6xhyISdwPHC9hPDDi55S1W8UxIYnESO06qGuzXD16yNEpXCyRZhHbY7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oMeteJlj; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oMeteJlj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=NtjY+4aX5C4glNstCxfiKZ3GHTCRx0sxpgWksTA34So=; b=
	oMeteJljK7faq8cq2k2mxxnXSjmTeKgdzO7IXvlVkSn0ERavLvEeDdfMNCBt8HPMwRXOoqy3FdKpp
	Bh4dO3mkU0XX217v5zq3Muv40bug6XUhsz2/9IVNgdY00AraN8FDV1rQ3Q1vbL5wkBHdUuD/eiy2C
	UU/8z8BHT5UKHGj0Bq4fI6cYHJD9bywcjhZCUuavBd9fj77fLEcCDB5QbBzZ86Ry22Bpk3MzWSmbT
	AOVhOnQ/b1w+dKKcAPh1jZZbqP3FM2qid5RlTvzrXbcGJf4s/AgFVfytL0+5eVdHQF6mUX/zWs43w
	6IWZQBkkas3PkIHajKR/9wPajJBBUCh4qg==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlf-006qf4-Tu; Thu, 24 Sep 2026 23:14:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	aurabindo.pillai@amd.com,
	Aurabindo.Pillai@amd.com,
	christian.koenig@amd.com,
	David.Francis@amd.com,
	harry.wentland@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	Harry.Wentland@amd.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] drm/amd/display: DM trace event cleanups
Date: Thu, 24 Sep 2026 23:10:03 +0200
Message-ID: <20260924211410.867686-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey,

I was tracing some amdgpu_dm events and noticed small issues and found
areas for minor improvements. So this series is just a collection of
those small cleanups.

Melissa

Melissa Wen (8):
  drm/amd/display: assign missing trace entry in amdgpu_dm_dc_clocks_state
  drm/amd/display: remove duplicated prev_p_state_change_support assignment
  drm/amd/display: fix vready offset assignment in dcn_optc_lock_unlock_state
  drm/amd/display: declare amdgpu_dm_atomic_state_template as an event class
  drm/amd/display: use right type for amdgpu_dc_performance event entries
  drm/amd/display: remove redundant cast on amdgpu_dc_reg_template printk
  drm/amd/display: copy function name into dcn_fpu trace event
  drm/amd/display: copy function name into dcn_optc_lock_unlock_state trace event

 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 99 +++++++++----------
 1 file changed, 45 insertions(+), 54 deletions(-)

-- 
2.53.0

