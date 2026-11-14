Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651780;
	b=QJpj4XXERvJvHPy2acyLFeO+PL6zXrXP6Sm7IPkQ6qvyLalXYlkUlmrlH6UPrnIwRUWU
	 A53niudKcqdP90H78AgoFC0qLNctJ+ppQiqAnyTEsK/Zjk03//LyyuSqgq2jBYbKQ3L6b
	 nSp7tnp/7vh8+Bjtin/PmU8g/8yISDw8zORP8/++LMIa07jNIndpNP2pv6s9V4tIDhRQq
	 5QtH1FkELCTN6rWBEVlrUqAM6sXBfq9MmSZBG4G9G9ppv6Ti6x3sZdcNL/E/NLITFbANu
	 tv2IhNhHwpk1Dfk+nP4QPuoQ/GEU7GntWMeeU8Of5z1oFOJIZ4e/e/unHDkYdtPQtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651780;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h+vA9r9n4WkcSpsjfAj26/xWi1Iy6en+RLiUeVeS0jI=;
	b=OVC68jHVt5VmVgs2cBIL+twBHqZal1zrevd78oC4q8FNygLylXtp3sUdBElh17C2KKKy
	 QjoFDHrZ52Mzx380FxwV731eG/vVbfWtFLuISzCSWVLvAkF8Pgc571+9ZLWuIeLzF3VWI
	 R6D5056dgel7xEIoCx3NeEKoAtYcS++vUZkVnbN0JaukIaNOamDkkVYE6UE4K4xcYddK+
	 TznifJdgbTmQ47BlnQhPjQqnSaNTzd3jAN7SQQ8E/hh+xWgJteAREHBtPZR/K6kh3OR46
	 w94JZyOhjBYhF+PDDVR9MiLNV4PocIKmFG8YgG25bBsuMSBRQ6a3sQr+CrQwyR5Ijwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF64606A330;
	Sat, 14 Nov 2026 10:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF64606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuK-000000003aj-37ZX;
	Sat, 14 Nov 2026 10:22:52 +0000
Date: Sat, 14 Nov 2026 10:22:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] media: rkvdec: vdpu383: complete refused HEVC requests
Message-ID: <1c2a7d695a34ff9a1603d981da53fbeb564f6dfe.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
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
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>

rkvdec_hevc_run() returns -EINVAL when the RPS controls are missing,
after rkvdec_hevc_run_preamble() applied the request's controls but
without completing them. rkvdec_device_run() then returns the buffers
with VB2_BUF_STATE_ERROR, which unbinds the source buffer from the
request, while the request's control handler object stays incomplete.
The request never reaches MEDIA_REQUEST_STATE_COMPLETE: poll() on its
file descriptor never reports it, and MEDIA_REQUEST_IOC_REINIT fails
with -EBUSY.

Complete the request's controls before returning the error, as
rkvdec_vp9_run() does.

Fixes: e3b5b77e3689 ("media: rkvdec: Add HEVC support for the VDPU383 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d4cf0..e9d8b590f0d58 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -553,6 +553,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
 	}
 
-- 
2.56.0
