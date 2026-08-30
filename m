Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D9D2BEC34
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061947; cv=none; b=ZoQlLuP+dx4D+8EgqXq1XqZbRlRy6mz18jj8NUjSBIzQye1o5D0OZQ+A8MY5guIz/XEgmXjHOKWXvtrkPRiB/5Pls7snWAvpJnEuF9vFSqtuo+3OWUHls04F3aR9UmuINg9d7FkVuMRyeQlbinsf1eh0dnVRPVCY/eV5thpFYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061947; c=relaxed/simple;
	bh=Z6ToNGq2/V6g07e6vdvuPs3tY5c2LB9Yk47syczf/sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6q4GCxCWUujD3bUMT7CGI1+ntKQYCY49kuqgmzTzhUvOSL8/h8yKXltlRvETycyBJR5REgIbdDVsxrltFgrIDltBQABmXqJcNCLjUewqX/X9cuQ99eHQ6wwlgFNBl/b3H+AOmUVHYY+lIZ76rWvcdQunxDkSyBCsoPyUbt/xXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=O6tCfBFl; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O6tCfBFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=obbnz4ftq5eldfwuuhgntm2hh4.protonmail; t=1788061937; x=1788321137;
	bh=Z6ToNGq2/V6g07e6vdvuPs3tY5c2LB9Yk47syczf/sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O6tCfBFldD4d+KHBSlPUNzzaMbKmEYe9Eo6bZKuAVRWYeGyCgg+GnhMWCS/nPe5H/
	 pbusTXRkHQm+2U1R4QJ/qJJ6fo4KAqfjCQuh4Z2OED9vYgHieZTHJrgXKGfFKG+app
	 m50JXJgjIZtIH2Dlzqb4vHLadUbflIss+wl57XwAyPdehc00faG+LYaPx2tSbcQ1Bx
	 mRG/GtOvT9cITBkROhRKw16fSdpd5VnKd8G+zuhKHlq0N2sKQrdi8PIMQrRTT5dVe9
	 7SjhFXdbiS4AKP9AQnHUBNRmFGs+3w9eV5o2D+0udqDrynYTkR35bQQwHd/ylowB9u
	 uQB+omFI1rJxA==
Date: Sun, 30 Aug 2026 03:52:13 +0000
To: amd-gfx@lists.freedesktop.org
From: Satyajit Roy <edu042sjroy@proton.me>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, jerry.zuo@amd.com, wayne.lin@amd.com, yan.li@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Satyajit Roy <sroy14@alum.utk.edu>
Subject: [PATCH 3/3] drm/amd/display: Rebuild InfoFrames on output color space changes
Message-ID: <20260830035120.937992-4-edu042sjroy@proton.me>
In-Reply-To: <20260830035120.937992-1-edu042sjroy@proton.me>
References: <20260830035120.937992-1-edu042sjroy@proton.me>
Feedback-ID: 147615787:user:proton
X-Pm-Message-ID: d40d737c9fe66aa2ef7b3bf277b0b11bc72a8117
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Satyajit Roy <sroy14@alum.utk.edu>

resource_build_info_frame() derives colorimetry and RGB quantization from
stream->output_color_space. A Broadcast RGB-only atomic commit updates
that field and reprograms the output CSC, but none of the InfoFrame update
predicates include output_color_space. The sink can therefore retain the
previous AVI InfoFrame range while the source starts transmitting a
different pixel range.

Treat an output color space change as an InfoFrame change in update
classification and in both stream programming paths.

Hardware testing on an HDMI 2.1 television confirmed that its automatic
black-level selection follows Full to Limited and Limited to Full
transitions in SDR, HDR, and HDR with VRR active, without a modeset or
visible link blank.

Fixes: 6eb4c13a3845 ("drm/amd/display: Support "Broadcast RGB" drm property=
")
Signed-off-by: Satyajit Roy <sroy14@alum.utk.edu>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd=
/display/dc/core/dc.c
index 1b9bcc3f0d2..8844dbc0415 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3201,6 +3201,7 @@ static struct dc_update_descriptor check_update_surfa=
ces_for_stream(
 =09=09}
=20
 =09=09if ((stream_update->hdr_static_metadata && !stream_update->stream->u=
se_dynamic_meta) ||
+=09=09=09=09stream_update->output_color_space ||
 =09=09=09=09stream_update->vrr_infopacket ||
 =09=09=09=09stream_update->vsc_infopacket ||
 =09=09=09=09stream_update->vsp_infopacket ||
@@ -4195,6 +4196,7 @@ static void commit_planes_do_stream_update_sequence(s=
truct dc *dc,
 =09=09=09=09hwss_add_setup_periodic_interrupt(&seq_state, dc, pipe_ctx);
=20
 =09=09=09if ((stream_update->hdr_static_metadata && !stream->use_dynamic_m=
eta) ||
+=09=09=09=09=09stream_update->output_color_space ||
 =09=09=09=09=09stream_update->vrr_infopacket ||
 =09=09=09=09=09stream_update->vsc_infopacket ||
 =09=09=09=09=09stream_update->vsp_infopacket ||
@@ -4377,6 +4379,7 @@ static void commit_planes_do_stream_update(struct dc =
*dc,
 =09=09=09=09hwss_setup_periodic_interrupt(dc, pipe_ctx);
=20
 =09=09=09if ((stream_update->hdr_static_metadata && !stream->use_dynamic_m=
eta) ||
+=09=09=09=09=09stream_update->output_color_space ||
 =09=09=09=09=09stream_update->vrr_infopacket ||
 =09=09=09=09=09stream_update->vsc_infopacket ||
 =09=09=09=09=09stream_update->vsp_infopacket ||
--=20
2.51.1


