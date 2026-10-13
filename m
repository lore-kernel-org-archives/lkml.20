Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91924A069
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900090; cv=none; b=qCv2n0rnJT9bCUB4ClV5ljboQNj15PT9OtY8DPZWYAgOCcpnCkamawy25FsRbOjJ7POzT4FKRag1IRw6o+1YsjOQyuHHudycLtcVTI1OUHEiCMu431lcsJLf6VHi2wsfx/wx7b9PzmJWFb9bXR5iUG0eUBq6iUlhyAfZeiyzUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900090; c=relaxed/simple;
	bh=MO0Jdh/zmpGHoIjLKhjEulBX81dH7d5rxPXrW+Fvqh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCXsSeB40z8uBYjLJmGVZ7c3HXq5F0owjy5+ZcCUuGs4SbjZLog0AxbT/tWoS8QPagqsm1c1RS66JOi8Yl+F2Xnh9k4+F8sVNTbgY/2Eu1pcUejkDJx+Ml1Gz0ddUjYaGxxspWcnx981GuM6C2BHfOrK1XlEulMCf8GyZX+ZM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXACNFlG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXACNFlG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so25945905e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900087; x=1792504887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViTWpehkUTNRhhx96u8NdBVsVZbPiHx1y/c2M4wY64Y=;
        b=PXACNFlGglYCfJM/QLkQm9xe2PCpjcdXkbrXoVOln0rF8AOZdkcxqii7767x1axpjd
         A0oeFctehb6C8nYmii87RhCUUlbDPckRqZC3LQMcwCS5SR6K9SUSMGxm4qxvqAHs+id5
         llBnD4s2jer8Ojc+V3RnKAdGcdQapCgxV0zG83ZxvsGHe8ByP+gfN2Qc3ly25gQVq454
         U1Ze/sM5yiB2m2rYh29O2jPH/EQZMoWFTJYOhiATpTrwhMzioKY2ESIBxyR6/WCZWFg8
         FapoI+sV2Rsv7Lhj/jJcCZNaKxlkb2j8sAMcp6htG7OnuKZEJfG+Fx0HKl2AiPxVGQED
         f4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900087; x=1792504887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViTWpehkUTNRhhx96u8NdBVsVZbPiHx1y/c2M4wY64Y=;
        b=D/1Q+GUerGTugOTi9zsBlTDKPRNEBWHMj1xSPzwn9fSOtm9tR6SrVo4LSTE7w09fDt
         RT4tBUT7IR/86nQySUHSL385Fc9iHtTt+pW/HOMHNt3wWeaDMDdpjDLtWvBeP4sqo4Wd
         nBGLrUxLv0OV7Km+tefrwS5v+kGnLLs12iJxyBYOZjP2Cetktb7lrYL4so1HJGh2Xs+b
         vMHe0pBA/lYMfDiYIvQzWirrWYPKusYS32tOFHKZqiNHxkzriZStqMV2Q/4EZUbNstCj
         0WVOvanGUmUqte7DEkArmWvpg1byP0xCRpg8yHDP49EVVpCic+ZRcgyiptQ7b87eATUM
         mGUw==
X-Forwarded-Encrypted: i=1; AKwUvBxGNF7QmmJXt5/OUz9AlNm5qpRqRI3hV02vZmIAHUuaX+yiM0upKoFn/GRMwHZK8+32MNPxrXYW0AHaRQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+xm3VGIHr1owdEAFx3zLEQkBOm0jR3AynusPH0o+q4dpESTmU
	XCHLRlJU5jmEc/QejCoXASNIyG6oOCzZQfhUibBmPiWSO6ffns3RvD3Z
X-Gm-Gg: AYBFou1SaF5lkCNt5sq2UC4PphjXIAkYyc4myBXSbhTl/RtfhG8/2ys3rK/mPO9SnyY
	UM5z3+OLMwW3w5qu07jUxx1U85+ntbH137dkZPrWxDs9NQQ07BAYfGfghJs72+R4Ki/gbdwPPc2
	mwRNf0tIhfG3hBZ5PJyjg6AhcFz+6SHJR5T9ZwAsZ/sVCoDM05KYl9Hi8D4dpRqCvpXNrWAgTZs
	twnzJZpTp2rCb5cGBJVlv4YgNeaKF05uPYalMYXncxZT/tgYkrHVz0TEGx38zIiD/Qecw9+c/Yl
	RDqCdp1JGlJGfyvEjphHBUyUkYxXcyAToWfhZmJpibQPdLCl+dvm/ohlDuelN+F21YvdqZ0yQkx
	vkwAqGGluocqU4l1r8ufHPqXd8xQtAYVmMJ62wdhVxo4IJTmMvYzCX1yXSVgyvRgrRBUgOIw0kH
	cFR6tWMFMO4+l43vL41Mw0s/dvn69q7qCdTubXbn7bLAmTBLyepBXBJfnpu9oYT9GTcj2CsFAM+
	oHFygbEDjd+x5iZcA==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr257096075e9.20.1791900084826;
        Tue, 13 Oct 2026 07:01:24 -0700 (PDT)
Received: from potato ([31.176.175.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72d2b13sm304691f8f.55.2026.10.13.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:01:19 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] drm/amdgpu: remove unused tracepoint
Date: Tue, 13 Oct 2026 16:01:03 +0200
Message-ID: <20261013140104.32179-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused tracepoint "amdgpu_reset_reg_dumps", flagged by UT=1,
from amdgpu/amdgpu_trace.h

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index fcd4cf2f4cd8..6fecee5be1ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -564,22 +564,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 		      __get_str(ring), __entry->ctx, __entry->seqno)
 );
 
-TRACE_EVENT(amdgpu_reset_reg_dumps,
-	    TP_PROTO(uint32_t address, uint32_t value),
-	    TP_ARGS(address, value),
-	    TP_STRUCT__entry(
-			     __field(uint32_t, address)
-			     __field(uint32_t, value)
-			     ),
-	    TP_fast_assign(
-			   __entry->address = address;
-			   __entry->value = value;
-			   ),
-	    TP_printk("amdgpu register dump 0x%x: 0x%x",
-		      __entry->address,
-		      __entry->value)
-);
-
 DECLARE_EVENT_CLASS(amdgpu_userq_queue,
 	    TP_PROTO(struct amdgpu_usermode_queue *queue),
 	    TP_ARGS(queue),
-- 
2.53.0

