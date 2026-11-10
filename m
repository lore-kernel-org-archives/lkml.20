Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347617;
	b=Qc6LIeujdFsGRkOcO79rL8vhbLMekk5VWujPGbhGzfCVrrdpX948aSJUcYaLcJjdAg7W
	 0ALxbKMzgptsCnKDprDSdjEZ5IPadXXHRRlSUyvbn+FXBUr2jJdNEDbmRQ3Gi670T/b7Y
	 qla8G1wW6ArxqeWE4Hv8pudtBJPHtDDMxC/jifgtEeFEp4Y3vp6PERqvI35DHcTGRza9E
	 pnLzEBKEtqp57DT5eYhZ0v0N3YVeQTAmpaGJn48A2TxMy06ocxWzv1aHhmbENa7TQkoPE
	 Sx21biiRdpQ0Pe5AQKIc/3+BxxySGX0h3Iz9fw8YY2NQdPjlDCRtTLPAsjaUrZURw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
	b=3ZAOiIl48NpdA8PkslSjKsHeLcAEWWyJebH5R4Ie5pNhuJ0vyJ/RbeTOZ0gsvzB7rXR0
	 1KRunklcvhLxif5+ByNZwGkv+EoxQn9tpWAa9ujawn4Jst9mJyx0WY+RTNIqoiU/KSuK7
	 G40qVpcxQ1bR+PCDyQdNepIG+nd232IirHA+IOmJfQ0fhaOV83/8SveeDls5o62672ZtQ
	 G/6TCmtEe8nbeiesDb8M8ipHE1BYVZn6yN1vxwYxMLti6/vIyHs0E1EIdJyb2bdDQdbSY
	 EjD4GXw4aLN2IQqSLZJ3/epEeSrUn2ryloPEnujz8UlQ1LqduG3I5R6phn/j+fQ0Igg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXPodMFS;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB19606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB19606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXPodMFS
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922523d1afso1559970f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347616; x=1794952416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
        b=TXPodMFS1i3D2h31qhMaL3XEYHgEBuGxyPiKfk17tn17nlGx8ewWK4778G8yj9Sb77
         eKJR8g8lGRr5MQAmsTiLybJ6cAwbEbo+VoKneZkM3AtdHKRSximP55BgjCgD2eg93ANi
         dteUo79xHb6YxA5GX7bH91vhxkwsAcd/CGmUHgCnE2sjM0GjQ07nhxhDv2Mmd+eBj7NA
         JAiPFtEDGMZKyEU3Rtle6APQ5C0P58Pw2oiCdVVpmU6Wlxrvekv0d1zPGkuUa4ykZ4Kl
         h5qPuR9zxREIZwltK2Vdpy6t6tk5WkEczxfST3/1w4+NgD1Z8kfvckEsAQyT2gVHo6xf
         gMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347616; x=1794952416;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
        b=GzB6xYDzjy+5BzyRmO+u4Nvph6ct3tUveoA/EvC+sxDyeB7qbhKYMDh6P+bbCVeYDw
         bo0dkOTXmk+TM/Fr1Fauvt4nsMuaDMZwiNeiu72cYS+yOqEf+idMsExRdYgLYBD0dgSO
         tONhRbAUAuP8QLBZacTzOclUgp29j7Pi1Mmmb2EcpYXVlHKoUVI6yNxG2GrgfzX8fKqa
         97NEjqp2rgPFkH3y4JvOJxlogFNSMzB9D0prX9/cri28NwlINXcK4YTOTrkpv7ewIDoi
         +qHI8jKdUdEIlgVQeePekG1UIcGsXc/MtL4e6mpaHH/Y8CVkUGBxyEcgKgAU5ec5bKo6
         Strg==
X-Forwarded-Encrypted: i=1; AL+hErGDmJPhiguC+7caj91GN+beKywzWWiGq99hiiC9s4QspGwSLEfK7uqc2VDLKHC5WEtWkqmhVcobauNQJT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nuWleyS4at9u2BsyQs9JOkWzoKkRzx0LWz+ok9hyJukUjtkmO
	G+VtrrXs2TBh2fgHeWCLMvFIgRPJbcRPN7JulN7DnNHjPHhuoWnY5Ui0
X-Gm-Gg: AYBFou27koqc/w1vaD3tuKJB9IruVwouiG3nu+kIpDj+acM7CfhCuUcMjhW/Po2Wgie
	nlvZ2/vLVhikpFBUYuqkbEX2fJ/CoxA71dXYn458A2upnH4A6yrHj3+wHYMbV3wqJlOiavNNFjy
	weh3wKC31dkPN0XX9jRkQ4zRghNAfXtDTngkM0EjvJCZm3qqHVVX1vsL6/W/cnhgjuVRqF6qEk3
	HOMKUgS7msqi/sKz/FPgAwWX8wZvFKUDrp9RkbfAgf/bVsQ0I5gVK/xNunOzc7VnNymaspFuC/S
	2OjC0+HcrFsE08ZT0JwJXYqgm5+cb9azMVUpkTAjRf69kJyliP3fNEENAstUt16oFrSOropZldq
	FwSUh+VUCR+C7rh4iNu3JuK/FRVZtfba8OJdOElBiTeJjuqaRgQyk7Szyu64rlxXEXPJiLbcWGD
	PQpLTYODoz+rvFvK5XZXdjDI+6LT4KHOXupmrFK8TertfXdb6btrLK6rHLtKJz9zpbm/E0gnQ7L
	6LhrtFyXd11WvG4f+asthXkQkaqvhKhjPTgjUPVdhkIACNqS780fjYEJMjE0iqhM7qUpOKbjh2d
	YdxMi7WgY0aNed6tvyEUnMhR+LI=
X-Received: by 2002:a05:6000:2411:b0:48e:3647:c35d with SMTP id ffacd0b85a97d-499c7a24acfmr395628f8f.21.1794347615587;
        Tue, 10 Nov 2026 13:53:35 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4984e26f8e3sm6377221f8f.1.2026.11.10.13.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:53:35 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dillon Varone <Dillon.Varone@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove extra trailing semicolon from a couple of statements
Date: Tue, 10 Nov 2026 21:53:34 +0000
Message-ID: <20261110215334.947250-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

There are a couple of statements that are terminated with ;; - fix this
by removing the extra redundant semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
index 71d14fb8c830..5dd22003f165 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
@@ -328,7 +328,7 @@ void dcn6_ms_calculate_writeback_bandwidth(
 		}
 	}
 
-	DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cfg->num_planes, DML2_MAX_WRITEBACK);;
+	DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cfg->num_planes, DML2_MAX_WRITEBACK);
 	DML_LOG_FUNC_EXIT();
 }
 
@@ -4255,7 +4255,7 @@ enum dml2_status dml2_core_dcn6_funcs_validate_solution(struct dml2_core_instanc
 	enum dml2_status status = DML2_STATUS_OK;
 	struct dml2_core_calculate_ms_context *calc_ms_ctx = &core->scratch.mode_support_locals.calc_ms_ctx;
 	struct dml2_calculate_mcache_allocation_in_out *calc_mcache_allocation_params =
-			&core->scratch.mode_support_locals.calc_mcache_allocation_params;;
+			&core->scratch.mode_support_locals.calc_mcache_allocation_params;
 	struct dml2_core_internal_display_mode_lib *mode_lib = &core->clean_me_up.mode_lib;
 	unsigned int i;
 
-- 
2.55.0

