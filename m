Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363246;
	b=iuw/Phv2R0Z0VQLhN/EIKnrf+hO5hoeut4d1uLqfXVT9KgL+qxSrDvsfwIBoJ/BJ+RTx
	 74PlejRsog4rwp+ihIWfqBOLnqEyOp36f8iLallrGEOfl+9k7Md8Kd5b16tCor4FEJbRy
	 Z+CIvgd4fZaFjphl2+frrzQg50x9mc2VPyH5ce/tHISs0oaF3jao5LU4QjP7R+YiiTHj7
	 nakmjjpvFacHuErZmn+1uWxrh1+lwr6O68Ecb9e+cl3CYccTGTz9weaFQViGJYcGEWzcI
	 DpYSsJ1qF6nrLFRoczmtlr3HzyDUBHQ6u+QNlJsUZxtQU+8McjWdCiPDkZEPs888ZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363246;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=XYuSxOcUVq8i8SKrr5UpSLJMcAVLOmYeiklqmRwC/L8=;
	b=5mVt1gXljmgpGA1oUMK8ljRQOxU702Jffqw68ch0emawJKuI7nh9hCghuMkk4pusZFs6
	 8S3DJxKLjrD+1Otijwqmq6NwEMDiNIH8SQdnKp/1Qrdjs1FSPioRa9/Ntah+OcptgUgzI
	 v0148+Xs1YHgcZr9SBcT8+dW7ZGbEPVQMImlrs8a6yvSBOHsi0Z0VVoT2TMhHZzoZwgK0
	 gabEYpl6B/rLBHRnahk8BUhEz1meA7nrsLs1XDI5BM3HB+C9jZf9uda2nNbl5ebMrR5qJ
	 Sx8j/O5jAqjYSwpfNo0a0ky6g6Dxv1+YBnaX3NmVeTSTiFbJQ7vuFEvG9EHwgy/o1Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=SZe0cDU8;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF70606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=SZe0cDU8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J6yTWKvyYdR4sg8KhoLGX7qxgtJ97l4XZ+Y485k12dw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793363243; v=1; x=1793968043;
 b=SZe0cDU8TdN8ioAUOCqUNrp4wvtMxG+HdZ8p6FUAMvmfFmEik2P7n78XAHXELVDqWAYGoQxo
 D3+4Y6sCoEZReXkN0E2YigiK/ihZK4bMbqBPxyGyE9MIBo4Scixs1FYcz+UVE9pm+8PA3Mwve2m
 G4QdylxGC/3q+Blvt6QC+5KHaYTZfooyuVH/GO/3zVr/SfeRzm0BJL3CJDI/kgwKZSSbuaSwKK4
 PdkTyWuAiIdxc7b/7qEoJHENvgk34x7KlEQOndQIUdiS9Z/vZgW6klEl1qgDpOB97sAkRb8zz2o
 1TSapyT8BrafitSW8qwcZ/veoggiW/nelwTCgObCE+RwQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 323cb4c8f6ab2be3;
	Fri, 30 Oct 2026 12:27:23 +0000
X-Mizu-Trace-ID: 323cb4c8f6ab2be3
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 20:27:13 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry VanZyllDeJong <hvanzyll@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Sreeja Golui <sreeja.golui@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Use a plain comment for panel polarity
 declarations
Message-ID: <dfd520477e9987eca7719e537b2865f4abe43043.1793362629.git.wy@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, when running 'make htmldocs', Sphinx complains:

WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:3883 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Panel Polarity Control

But since I am not familiar with your workflow, if this is duplicate,
please feel free to ignore.

Also for this file:

WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:329 struct member 'max_gamut_remap_coeff' not described in 'mpc_color_caps'
WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2225 struct member 'u' not described in 'dc_probe_status'
WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:329 struct member 'max_gamut_remap_coeff' not described in 'mpc_color_caps'
WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2225 struct member 'u' not described in 'dc_probe_status'

Thanks.

-- >8 --
From: Weijie Yuan <wy@wyuan.org>

The Panel Polarity Control heading introduces several declarations
rather than documenting a single function. Its kernel-doc opener
causes a warning because the heading is not a valid kernel-doc block.

Use an ordinary block comment for this section heading.

Fixes: 7dcd85c2241f ("drm/amd/display: eDP panel polarity control and test support")
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45333..03286f6aa651 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -3880,7 +3880,7 @@ unsigned int dc_override_memory_bandwidth_request(
 		struct dc *dc,
 		unsigned int bw_mbps);
 
-/**
+/*
  * Panel Polarity Control
  */
 void dc_link_set_panel_polarity_enable(struct dc_link *link, bool enable);
-- 
2.56.0.438.g30c3f27cb8

