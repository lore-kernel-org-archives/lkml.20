Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525B4503EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776723; cv=none; b=LvNDCGMj48rLhQTyg0vvtTNTBShvzKEaiOE418Z6GhtorsxvgepritHm1YW7iZPTi31qS7QWhJcYCFwC32qIHzxVYQr+Vn8AU0gJ6YjHa8Yn0072E5PLKH+cOIXFoE3AnPvX5fHw9RbZow+pfoQbI66sX/02zvXOvGLuGyHHc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776723; c=relaxed/simple;
	bh=EYaA2+3vzNXwp0/BodU+MNNQ0HZs349vD2R3fgbqOhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uq6EW1e7LyTfUBs+FGB57CyAVp18MeFK8In9IRCe4bcZ5rowXw7BmkUK4xnoKv2mC01IasInyC1Uy4IUpD4gZpp7e42BtCWw+6Zp6nc8oobKqssqz+vi9Q3H55gT49vO9KL00BFN4XK0YH8RccMujWSE6XdzKWVqUxRBoZp1Sv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=cVKDzep1; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="cVKDzep1"
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hdjRC3wlHzqkK;
	Mon,  7 Sep 2026 12:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1788775623;
	bh=dBHS/oDA3Bq/MnKWT+8QzHHpzChtVCq42IiwJ53rpN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVKDzep1CyQTvdc/Ii2VjkiffniujobOY2OpYIPLpohena7oY7zcrBlAtZkozWUqC
	 flu1y0agAqOipngBYSClHrYRKCrxxEYrlnClbCDLfg18qROmxz+oDqEKGeTXndSZE7
	 PC5QRQDMALZpT2GaSWNeDYWZcZEwkm/b+JrTQ7RvhR0L7LgUGD4wbHrbqivdTc6DXm
	 aX6xShermTR1s5Lx16SfFssR8PIu1detKLzOp5y6dzwsSuA3jf8q5JI9wqsb5nO8VP
	 dOvdrkn69gQR9ZbqIjAiSosE30DhPJsZlxCLpt3woG7a2S1YFhdnuOvHRG1e4ryjEt
	 3NlEBy5czrtMw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hdjRB6NnrzYx7;
	Mon,  7 Sep 2026 12:07:02 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/amd/display: send the 3D_Ext_Data byte for top-and-bottom too
Date: Mon,  7 Sep 2026 12:06:25 +0200
Message-ID: <20260907100626.54465-3-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907100626.54465-1-adrian.betschart@cinemaone.ch>
References: <20260907100626.54465-1-adrian.betschart@cinemaone.ch>
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

