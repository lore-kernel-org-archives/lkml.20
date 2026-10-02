Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0494374A12
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935997; cv=none; b=aJwY5OIZxPwFx897O6tJ2TDBGlW3NcDifPrWp+Qs3ZQGxxzZp+gC6yJ+rKnCavIx6nvh4um7IIQ4vZ+oYpZR4fNsKOdst4CN2JVdRZk+doqvoVKs6i9tLy91frH931C9HZc5wHYoe4blbYO6OZFnp2Sab5hfMuT8Yrcd39Upypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935997; c=relaxed/simple;
	bh=0TziyYKDj7lsy4oxuwEcSQRZvnxYwSWjNt9MaK2xNjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUx90PfC54/Om1XBjGVtMYNM+421BVl1I7uswc0NSU1jCxnHjPCkRXSECpbp0tEKh87Nlt0H/dAGCi2LdUZOrCFiEtp7SrvudP/6vJlcDWy43F2vZ8afWnRSfl4yuCGlrwPZKv/QH+7ZC3LNycedjzOZMXEv05X05UQJpM30/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrsBYU7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrsBYU7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A3B1F000FF;
	Fri,  2 Oct 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935996;
	bh=lI9xWGDFFQUiE5UlLBkEcybxf/qxmdHiV+cxfzBaT/4=;
	h=From:To:Cc:Subject:Date;
	b=YrsBYU7IKdnTMM7YivCTipqyGD/2I35egzjkUl5oSVPyqjLrGm2lFVgXJP9t4AKGt
	 li1Un5woKIwktVROjI7CC1PnYpHnJZIs/FA8b64c4GDpNcbQZ3zRl5++oHOMM9J0pI
	 YZ4Dg+kM+KXB/+JtQ91bMH1u9NazDOP5qFurm/gQu9pa+KPUouAFN2vTMscV4iEpnq
	 kFPm/oswjULyE2dOp2x3PQVh2kGJf1xp56RSSZIoC6UaZbL/ebpxdhAThnlJBGBy8h
	 TO656jJzpRxkOpk5w1J4199YWEP1ilZDK+ljIdYO1bd+vlYYN4tOnnQlhp0cCI/uwd
	 spLRrlnUfvSMw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/2] misc: fastrpc: patches for 7.4
Date: Fri,  2 Oct 2026 11:13:00 +0100
Message-ID: <20261002101302.1084243-1-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few fastrpc patches for 7.4, Could you please queue
these for 7.4.

Patches include
	- downgrade expected DSP info, reserved-memory and session
	  messages to dev_dbg/ratelimited to reduce console noise
	- switch to devm_of_reserved_mem_device_init() for proper
	  release on device removal

Thanks,
Srini

Jianping Li (1):
  misc: fastrpc: Reduce console noise from expected DSP info, reserved
    memory and session messages

Mukesh Ojha (1):
  misc: fastrpc: Use devm_of_reserved_mem_device_init()

 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0

