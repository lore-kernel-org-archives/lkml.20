Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2B1F1304
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523295; cv=none; b=l9V2XhF1MU0m+BimfV3EcrXlleOR1AReVHubU7b68yjYxyEkimhUfMLSBqQtBjLt+LhyMEpjYrOaUOyI5Wmmo3A3DoadW4YOUXConyDM+iN45YrlDmCE2KYsWQ2SaQNl62DsA/ZIZB0DdOk7an+g7fuHqFu9+n0f6brKsljrup4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523295; c=relaxed/simple;
	bh=Lh+okhDQSphUw9hLLSmdofEeOHaWU6XJOw11HJLwntQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjNHlG+F30tEOzWvAOmLmT/HQ5aKOtz+hfnpEp5e7ZueUdp1uKmNMi57otYyGeU7SlfuD9U1L6OEbGaWaMUxJup1e2UKJr0Kaj04nIX39NBVoV45MAwimAffa2mz67hm6hmNbtXPDjp/15lFzOO4Hh5ibDovbzCCNGvThyHFHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1fwWeN6; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1fwWeN6"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1c75f0049so689684eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523292; x=1789128092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62OHtMMqWnXWwh+ZI/Lum+yuS2herj6Kihe5wKXICGE=;
        b=b1fwWeN6nHnKKVpyVxhpH6T9PDewnmuSSumru2WAdMhREY3n7iojvsVxOWtN6WQfg1
         DuoMga8y3oiU6f9pYPLMyIjlquL9bOHS8gHpluiyq5ldY8rMI99bUIW6S/XGO5uCJI/w
         Ohxx9hTk1HBqvkDh8geMEhwsM6EKrLPdjXaB5p2dcprxN+q3Qd3ZP2muYdmVGbIzKcVv
         zRyPWqZlMN/vAHJuQePYo/4yju+aDUBs7oUhgaQPiEhsGyZRbScEIV/iu6FDH3p0WskC
         rQjghbsNCbxb97V92U7WguUpO56fnwLxF0cW7eBE2bXcsrM27Iwx3ciMYO+kAg7/i5hy
         kPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523292; x=1789128092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=62OHtMMqWnXWwh+ZI/Lum+yuS2herj6Kihe5wKXICGE=;
        b=CxKhmCSZ2QSVUcdaOyk2zIMM/C455me2Kb3RXwz79OZ2EVECmF35Xof5FIbA2wutr/
         nKfE9akowYDmX79GK+s41RLbw27M3Ohm4gxaB/8PBQRNSTpD4ARO7+h1gILBqtDReLBk
         ENvr0/Cu4c3vQpMXyDV8EV0EAwZtTgar/CjDh691x4zjwvq3eRMFLIUL5nRM2f9JdcbU
         Wm2untck6whArPqpp6cqykkpokxRFCEFwnc3gX9ib+Yd0i7OtifsmmHsKti0SIWV/n1f
         Ben6HZnMIL+AdTMCVVyfxcbemxIJ78AfxnjCtZVVYGMQ589X/hDcI/x87LS8OABMfLbQ
         haVA==
X-Gm-Message-State: AFuF++lsR2xGCdUzq6j3uC6+vivc5pi/j3zsk+jIDzGYKDxipf6nFp+B
	uaF+FfMPVrLPdF8DwfF0OlqxPf1al10X9JUsZqazz46m6mnUm3BmiArH
X-Gm-Gg: AYBFou3KveTP4tw8HllaZMadlIARMdbFR2F7HQbDpUJ1P7YdTkcGaKXed4YQ/aDhgLy
	Lem/ZwTYTlmkSEzqdjJDeoHw0FD3FDBMHQVURDhkDgk1PQvMQmmE7keMLX8Lq+oQ9CFYbqRMEFy
	nLCLYP7tEerEODSYH8ZxuAXUxHg3kBxWQrh+hefFl9axPVMZu92lgupenYZ+TletprjMtFueDov
	nPzw+9KH9os+SkX90EZRJZ6n7TXTznRwn0lzLVlNsf4GQ/7mpK/Yv8/XdCXbGZpwPQ98itg9d3j
	mN21WPJUa2OGUQwvImON9yN2jOPduiOIqLRbbCkF5VzHoScG9zbH9nfTWjb4wz7TnOcsFpAIKGw
	ZobpASCDZVgmnDDZFhq/adL5mw8yBR1adH7KBLE6cYGIKAwFo3XwDeWi2nc2W5TEVpq18l6SYPi
	pL6jWkAXzPaNN3E34PeFO6X72ndeZdV/ZgIMBGcvh5eWn7avYqmFXMdg774Lmrhjpvf9CPAfcqb
	wf140UMIHX5AjY=
X-Received: by 2002:a05:6820:1527:b0:6b1:4cb:39ec with SMTP id 006d021491bc7-6b6fb3df3c0mr3696718eaf.12.1788523292127;
        Fri, 04 Sep 2026 05:01:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm10164241c88.4.2026.09.04.05.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:01:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kenneth Feng <kenneth.feng@amd.com>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amd: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:30:08 +0530
Message-ID: <20260904120044.14303-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120044.14303-1-hemanth.selam@gmail.com>
References: <20260904120044.14303-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 2 +-
 .../dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c  | 2 +-
 .../dml21/src/dml2_core/dml2_core_dcn5_calcs_dsc_latency.c      | 2 +-
 .../src/dml2_standalone_libraries/alternate_pstate_shared_lib.c | 2 +-
 .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h | 2 +-
 .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 802d060a03ac..75bb237dd5e5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5702,7 +5702,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			// vs the latency based number
 
 			// prefetch_bw1: VM + 2*R0 + SW
-			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the the worst-case latency based time to fetch the data)
+			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the worst-case latency based time to fetch the data)
 			// here is to make sure equ bw wont be more agressive than the latency-based requirement.
 			// check vm time >= vm_trips
 			// check r0 time >= r0_trips
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c
index fea336d3953d..3b2d8bd85494 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c
@@ -3167,7 +3167,7 @@ bool dcn5_calculate_prefetch_schedule(struct dml2_core_internal_scratch *scratch
 			// vs the latency based number
 
 			// prefetch_bw1: VM + 2*R0 + SW
-			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the the worst-case latency based time to fetch the data)
+			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the worst-case latency based time to fetch the data)
 			// here is to make sure equ bw wont be more agressive than the latency-based requirement.
 			// check vm time >= vm_trips
 			// check r0 time >= r0_trips
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dsc_latency.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dsc_latency.c
index 84eac364222f..e1c13bc40ad7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dsc_latency.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dsc_latency.c
@@ -133,7 +133,7 @@ static void dscc_bcl_compute_delay(latency_t *p, int bpc, float bpp, int slice_w
 	//this step is necessary as each padded pixel added takes up a clock cycle but is not included in the initialXmitDelay and, therefore, adds to the overall delay
 	ixd_plus_padding = initial_xmit_delay + slice_padded_pixels * lines_to_reach_ixd;
 
-	//convert the the padded initial transmit delay from pixels to groups by rounding up to the nearest group as DSC processes in groups of pixels
+	//convert the padded initial transmit delay from pixels to groups by rounding up to the nearest group as DSC processes in groups of pixels
 	ixd_plus_padding_groups = (ixd_plus_padding + 2) / 3;
 
 	//number of groups required for a slice to reach initial transmit delay is the sum of the padded initial transmit delay plus the ssm group priming delay
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c
index 42af0cbf9516..4ed75444d6e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c
@@ -580,7 +580,7 @@ static void calculate_start_index_num_swaths(
  * ***********************************************************************************************************
  * calculate_hubp_start_end_lines: Function that calculates svp parameters given a target p-state line
  *
- * This function calculates the the svp parameters (vp0 and vp1 programming) in terms of swath index and number
+ * This function calculates the svp parameters (vp0 and vp1 programming) in terms of swath index and number
  * of swaths given an otg p-state target. This function should be called per plane. There are 5 steps:
  *
  * 1. Calculate svp0_start_dst_line and svp0_end_dst_line.
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
index d518dee18e1b..6ba06f2196b6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
@@ -487,7 +487,7 @@ typedef struct {
   uint16_t Tvr_socLimit;            // Celcius
   uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
 
-  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
+  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
   uint16_t PpmTemperatureThreshold;
 
   // SECTION: Throttler settings
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
index c5c1943fb6a1..0b4aa66d1883 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
@@ -545,7 +545,7 @@ typedef struct {
   uint16_t TplxLimit;               // Celcius
   uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
 
-  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
+  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
   uint16_t PpmTemperatureThreshold;
   
   // SECTION: Throttler settings
-- 
2.48.1

