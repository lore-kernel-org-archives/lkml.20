Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559789;
	b=4II/0iOYEAuxr29Abcb1dCjdqGQumRH6XvPoGx3jKYvm996WXGiauKyfU+IsHrS/Po51
	 9RsmzM02t+ql9kTIe6xd1LUc+EWApty44SUzdm2soKBC47G/3U3wGdb6Rappa/Lx5W1Jr
	 7sHSH7bRhiySrxaWmHCWHm6j36iZHQM5129N8nUpE0vKxq3qlUqiuXHos3FLjoRRVwx61
	 seTkqyz5EQM0/pQ9IbQSjQ10tXnhecQFg0ppQxdSJf0zpHhRpRzkLP7y3pwtnP24THKKe
	 66XLBgh4g4N+tnUMjPdNQ3houUTZYJUrKVhJZUaWOC8ecPIzzRbhVUNYf9gOHJ2t8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559789;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jwo5sz/tBtLbI2Uv00DIF9t3b00XSGJggTsCmZnslnE=;
	b=R3+/1X2l4Qz0HL2NdEKWiJmNUnGGUvMwNOoV+jZTH6WdF70LdVFOpGo6+FAcvG314b1x
	 +lf1hC4eGhkdmuMDhxU2k1rtXzQinsu76InKxwjiOWKNo2hTYO4ikJ7iPgdttxhllBz1B
	 Du0Mdb5CmxnOJxACSHEJHDueK8z9YsFTUajay9HBBkAbGClAhYR4Eyamr7rDEaaPPu61E
	 Hfkum+BVn7o+exAOfBoQzw/CZrIEMR8+uUv/DRUaKADF+6HdMuG6H8Ev2EKU79ibBtDuP
	 T8uiGgZIU+l+5YqmOQjBjEqGAD3BTtf009BVqvdnrPqZSvsNYFUCwZ0JCGPIsQrCTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BP523HED;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC502606A31D;
	Wed, 21 Oct 2026 05:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC502606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BP523HED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792559787;
	bh=UtaOkbC6oXF9PskgOOgEz+UJHHl5feMuA4mZgvwvzBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BP523HEDNrJsiOVl2bsRi8tXl2BwI1YXjPDFHRr7aRMYeeyjCG3qwDlPR21Eo+ghD
	 B5yevWX+hUpQnGX0kSsyt9uUyEgBdpqSLBQkciS9oZ7EvIgK0aW+yaOPYl4uWPZXSI
	 ZswhaSoV2QYV/P+JRCLZ4CkaZqK5TQNFnTq4JgUdDAmPrvd036tRfuK8rB9brLLBkV
	 Uo0JOyLgnpSQJsoQESQ8K+zGheit6g4m9bJJRafCRUtAZTBbH8IEF1nGrVn0IJfy/i
	 ii6ZAH/B2OJEgfetM1hfHTzV7t8mACrQVF4fMxgz9Y37nQlFTz0OEahi8dkkjBOnsc
	 SdzOxcm6GrYsA==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E97C017E0EBF;
	Wed, 21 Oct 2026 07:16:24 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	valentine.burley@collabora.com,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] drm/ci: update xfails for sc7180 trogdor devices
Date: Wed, 21 Oct 2026 10:46:07 +0530
Message-ID: <20261021051611.3328351-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021051611.3328351-1-vignesh.raman@collabora.com>
References: <20261021051611.3328351-1-vignesh.raman@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some tests were skipped on sc7180-trogdor-kingoftown because
they hung, timed out or broke other tests.

Suspend tests now pass, and the other tests no longer hang or
affect other tests. So drop those skips and update the expected
failures.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - New patch in the series

---
 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt       | 12 ------------
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt   |  2 ++
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
index 154b047787b2..8d1768de90cc 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
@@ -1,6 +1,3 @@
-# Suspend to RAM seems to be broken on this machine
-.*suspend.*
-
 # Skip driver specific tests
 ^amdgpu.*
 nouveau_.*
@@ -19,20 +16,11 @@ kms_dp_link_training.*
 # since core_getversion also fails.
 core_hotunplug.*
 
-# Timeout occurs
-kms_flip@2x-wf_vblank-ts-check
-
-# Hangs the machine
-kms_cursor_crc@cursor-random-max-size
-
 # IGT issue. is_joiner_mode() should return false for non-Intel hardware.
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
 
-# It causes other tests to fail, so skip it.
-kms_invalid_mode@overflow-vrefresh
-
 # sc7180 does not have APRIV, so memptrs is not protected.
 # (Preemption is not supported on devices that do not have
 # APRIV, so this is ok)
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..96743acc399d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -9,10 +9,12 @@ kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
 kms_color@gamma,Fail
 kms_color@legacy-gamma,Fail
+kms_cursor_edge_walk@256x256-right-edge,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
-- 
2.47.3

