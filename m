Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0084B53F2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785434; cv=none; b=chQsQ2PrsYdzuoJX7U9B/TzqmIdGPWD5CoTv1dFw7ItMG7fT7n+2dQq12ra0dFX0D+i7SK7IlpeqtbwDpax8/hFm6mry5JXiHAVhEKsMoUYK5bYUcW+7MBjs7UwkfZdkgMGCUlkEKEZ3+w3DKc0Vfx6VTtspyl77yiF3gcXTKYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785434; c=relaxed/simple;
	bh=EYaA2+3vzNXwp0/BodU+MNNQ0HZs349vD2R3fgbqOhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c06ZTD/ueilWF1rnhlwrZ4aKcN+DbITeXB3QeBzv1EbyNaEylGSQqDkqgrOwUK8rQ0weYpaCfFizX8143L8seesVtekNY+T9qW/teq3TvcfquLftRApHV8Cs/ym8H+QYMszzRcaRUvxIxSJXVp2BhmShJfaKac7etSq9YIhu4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=qKRGoMoQ; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="qKRGoMoQ"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hdn3p1w2Szd3c;
	Mon,  7 Sep 2026 14:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1788785430;
	bh=dBHS/oDA3Bq/MnKWT+8QzHHpzChtVCq42IiwJ53rpN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qKRGoMoQ6YJ2D7xTmKkpOY6iuI+sPk98lN1TXv8AE7zlHPwl5XA+ikbpA8/eGO6LZ
	 qRZtOW2Fbs0kE7nhYYWf5I7odVa9E2yXhs8P+LqYOAu80uJWbPpKSk4vHJbI1ONjiL
	 urjFxr4gRgEqI8JQlGQ7fJiiLG2nC4roQ/kaqCNB6T2QqBPYS2bqVWMUialnT85Evb
	 5Xg9I5Vezg3rBPeTvaYARD5mzWSzBXMUzdgSNUyL1fUytZ8jyd1+t2gwflqX8lawWb
	 B7A/UYc5LEyd9xRZHWijXaJzcg5AZXPUkd4YJEe9iK0bLXYpPbaoDAfpQJEiBeY/g1
	 XhmgRoudrjczQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hdn3n4HsdzpKf;
	Mon,  7 Sep 2026 14:50:29 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/amd/display: send the 3D_Ext_Data byte for top-and-bottom too
Date: Mon,  7 Sep 2026 14:50:14 +0200
Message-ID: <20260907125015.69811-3-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907125015.69811-1-adrian.betschart@cinemaone.ch>
References: <20260907125015.69811-1-adrian.betschart@cinemaone.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

HDMI 1.4b only requires the 3D_Ext_Data byte for the side-by-side
(half) structure, and the vendor infoframe for top-and-bottom is
built with a 5-byte payload accordingly. At least one sink family
ignores a top-and-bottom VSIF without the sixth byte: a JVC DLA-RS4100
(D-ILA, "ILAFPJ--X214A") stays in 2D on the 5-byte frame and engages
its 3D mode the moment the byte is present. Amlogic sources send the
6-byte form for top-and-bottom, which is why the same projector works
with them.

Send the extra byte, zero, for top-and-bottom as well. Sinks that do
not need it ignore a zero 3D_Ext_Data field.

Signed-off-by: Adrian Betschart <adrian.betschart@cinemaone.ch>
---
 drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 13478b8bd..3e41b33ea 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -574,6 +574,7 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 			case TIMING_3D_FORMAT_TOP_AND_BOTTOM:
 			case TIMING_3D_FORMAT_TB_SW_PACKED:
 				info_packet->sb[5] = (0x6 << 4);
+				length = 6;
 				break;
 
 			default:
-- 
2.43.0

