Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354671;
	b=QeFKQ6xEUxqmykX+PbrinT58i9kXhb/X7Mu2Mt/Lxr1BSqh0uswsxkBoFGsPTcdgjl3D
	 30THB2gR5Ic0iLe3GLKZGnd5jMygyrMFbjKR7Y+h0NOCzaPOQK2sjRDf3O5rr64WXDFhh
	 MniSdB5ECcUuzry3MoazcCiHWPZZU5x1n/3K5YoB1a10zJFBnb4++7imj0zvg9vmyaULC
	 g87ZVhOZwAyKsgnYt+sF7hxviTVzYqG/mBUK2OYPfoyNeZ71ux32mVqbY8Bcf71K5hMp/
	 Zf62DxJ2q0AD+oLQzWPmo8zh+OS1RWCrO7aarlMCVjm4GXLzOlf9eqs73rlgZbM6StQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354671;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3BQbPBjnxmYsXRsWItc1yrkU2yPlu0N/qA44TC5mJA8=;
	b=TrzCXw/qL/GihWP56I2aQFeIJc1nhgUctoHzGzGHxZrV5aQ7iCJ+gDbzIc3uDDOQF4yQ
	 O5lq+bh2UTJxgVWAEORmulynH3XIIY5hmEejiMEHdTAnrYuLOIGJs/jxDwMsyYiI+zq5X
	 Wj1Wa2f4u6OduQYd8Cn/aaaCLlHQGRlYp/3htuHvanURP7410ys9LSgJpKHwxZIInl0RC
	 JTWKrRBP0NAld4q37/6NPj2J7S6L6oQs0dtGC6kBXp9spy4a+8VgcvovDnMfAn8s12A1I
	 s5D3ap111EAoXDhlzZzHzUFg4ubI48+TD0I6dBm1uev5LVzwNQEbV8I4zLqOltKuCNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9rGDgA0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C007606A31A;
	Fri, 30 Oct 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9rGDgA0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE6D1F0093A;
	Fri, 30 Oct 2026 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354671;
	bh=3BQbPBjnxmYsXRsWItc1yrkU2yPlu0N/qA44TC5mJA8=;
	h=From:Subject:Date:To:Cc;
	b=U9rGDgA0qmrS87bosvpSaLGBGa91Lf36b7BxcN0Rl8lNWfoCK4ab36umgEWpAOl5Q
	 9d1cepfSKxjmjnBURTvS6KawtldBxRNB0Iumcky0R2+fWOUtPBZklOuTTIKpL1Hr8Z
	 fzepBnzPB7LU75fBuKq4pXU+zRGhyVVYlrNFs5oFvg/brCmS93jmt/dlJc9SlK28YG
	 kvPjd6jok/juKb6pR+/cUYNX0Ceqp/0uNDcOPkii/701evpJ5zLTYOPFq6SPluc8fU
	 2sSXsfcRgCPb5/Mi3DuSvFIqdmKdvjzPMEgtMRaSyYdtLIYot8xEr18W3sYUFD60H5
	 aW0W2wmM/BIIQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/8] IFPC support for A6xx
Date: Fri, 30 Oct 2026 11:03:56 +0100
Message-Id: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUp9ROuIiLVDsaCpi1pIu6uW
 H6L9y5waAkdtMkFFk9ytG8RWZqAWuQ2IyMdDTnPq4wLzvxuSDFZhTDQZBQrRSN0XWCpZQOxMhY
 nCt+x63+7Y1xR+XcD9/0Ajj2BI3MAAAA=
X-Change-ID: 20261030-topic-a6xx_ifpc-5393d74e5da9
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793354666; l=1785;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=KvuRJ+6dTYV2h9bLdPaAtcG6oyVfNxQCJpgcwD/Os34=;
 b=FRfncf9Th7KT0Ihe++7DIKqdnVXzGKhlU5DyyCRmvuqL0T8//3iNHwsk841Fu56OUBhQyPP7U
 Fps0+WNAPD5CnnuIeKZp8xOzwfphMjszhc8bOJgxvXC+L0qR4gk83br
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series wires up IFPC on all A6xx GPUs (except 623/635/690 for
which I had no good reference settings) that support it. I was able to
validate it via a limited smoke test (kmscube not faulting + watching
the newly added ifpc counter go up; I only have remote access to some
of these) on SDM845 and SM8150.

Please give this a test on your boards - expected behavior is no change
except lower power consumption.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (8):
      drm/msm/a6xx: Polish up the IFPC counter enable
      drm/msm/adreno: Register GPU debugfs only on the primary minor
      drm/msm/a6xx: Expose GMU IFPC entry count in debugfs
      drm/msm/a6xx: Add A6xx IFPC support
      drm/msm/a6xx: Add IFPC tables for Adreno 630
      drm/msm/a6xx: Add IFPC tables for Adreno 640/680
      [RFT] drm/msm/a6xx: Add IFPC tables for Adreno 650 family
      [RFT] drm/msm/a6xx: Wire up IFPC on A615-family GPUs

 drivers/gpu/drm/msm/Makefile                      |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         | 276 +++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_debugfs.c         |  23 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 133 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |  10 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  11 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             |   9 +
 drivers/gpu/drm/msm/adreno/adreno_device.c        |   4 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |   2 +
 9 files changed, 441 insertions(+), 28 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261030-topic-a6xx_ifpc-5393d74e5da9

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

