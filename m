Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269119;
	b=3U4R3wWjJ7SmTaVghcBbxDSTZQ3f81O5WGkwq1QCAU8el5Ng2tHmXOhQHP+tRAmmV0TQ
	 1HDmP77h2w8nNl1BNUR16lL7ORegRG91k4EOwenVTMkWROy5IvedWCp0qpNXaMS7Xytwo
	 x+9h0r5Em7kBOrljIukrIcW1slF0iHCzjOhZJ4SGYL8bUzjj3mp1qjGDkgPQclZtTil7T
	 nlOav+50YPQk4EZyAVPQTeim6quSNMm2IHlTicTSsfYkN7MyS4bGluGdgFu7SwvwTTeqi
	 /KE2EA72DV9RMrdoNgwjZzAtOg9LdP8k1JYu3/8O2BhZ6+RUWK5GPxiUCpitzYEx4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
	b=I/cjM4vTUHleL2eJKPpChuzk1DFmqv6WPZIKda3wYdXToDiSQTFepbC2DVRmBOpmZPhU
	 ufi5zjqYOOat6tCOfUplumfYS8h8sOTAlTBuU9mVJ5KsxshxSfPgBVW7ucUrUPh306TPp
	 mwbjMmx1oskKlYM8LDRqDpPcUkyfxmi9IeMCpb/R/7BnrRh8KOnrnELmg1r+ULQ+qpgtY
	 LbWiZQut8YLIP7KQE/m/oV7NGf1+5aTpFU0Rt/mbQ9dU+vySOGQjZz5UShArcSJw1S5qO
	 qVai71d/oCQ1ef8nGTQmVU06hByfu29bxcOgNHKuYjCWDV6Iv80aN+AvmgNVT6Kiwjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGvPfA+g;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED3660A2609
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED3660A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGvPfA+g
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so2295629a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269117; x=1793873917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
        b=qGvPfA+gV9jdEuXa/r44oJVmBBLaOYFcZJ/p3lwEzDZP4eHnaf4X2ERMs+3EWJUQ0Y
         D7YANPMINQDduEV32lQw7tDOea6O0lP2THA6zm/BNvyTUg34ydKGU3MPmw73U0V63abg
         P9T1zOAPKw8Shdi1L9Hv5Ig8iubdOijfJZMfvmAXZu1wS9IFWr+kfYrH9TPVJIN7HIOQ
         yxt6r8f53IYpKW9pHNzC83KTgJxguqh2sDxHQppU6tlJnWdBF5QUENBhn8z2664PuJef
         /jrbVmFXAuyGiROD89Yo2brQ/MjfOLu4SMYT9FU09tEg+X46g/aCgnuuz+65xQ9qNz2n
         YW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269117; x=1793873917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
        b=FC6atB/FBoYkGyn2np0c0NjaOh/S+eYNNYvy+XvZ9y0L2uyyOJyWPjAgpwPBo0ECSi
         6nlhmYPm6ivoF2sT77YqBOVKLfcRI/FGSICsNFmerjMTeMjskvAVk0geTMS3X+XPIEk1
         MyDIbiYgI5SQIA8+LxJpmoG67hCOcS3ucMBlG8PdZfM6PK9K/wvk9ffNaIdw126+uhdo
         BlJZPihbJBb3O4Gd+CpiqXax9+T/xQE5Kw+rJZdyanFrJBIrxxy0Mym8T6XqsWJMKwW3
         cSIIxyFVFZjIq3icaoh++HdKphOhD1gVh+EorSqce79e0Gj43CjWaqnpvwC3ZyebT1ov
         EDJg==
X-Forwarded-Encrypted: i=1; AKwUvBytZp7KYhNjgX8aCG4n0ExZBI12z6ZDDKQ51NHOwGMbCKtROoLkkYXgUTS2CPe/W+pwdT+wRm9okgTcC1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaoz+ysi4TtApyAddybQ5zGIiVXQEhQRcRYAQunoST3GX8kLBp
	fwMs72g3TJtUENbtGWBYJKT+tRzlv+Be7PaIjFzTPU+LbjShG258cpb0
X-Gm-Gg: AYBFou3RuxPE3uDFbkZ1mhzhHKlu/+lGHhBvJwk+ZmB0tMTPYCcf+db07qOxwCSUmIf
	YZAZlwBggYFeMuSlgZFtqMH2wC5/2eA80t0jStbAXZd6lTfTwLkIYX8ljFX6RTRydXEPRRhqo3y
	dSY0zFIiI7doqitiX7donrnH8MOLtL63p00ij6HF/L/fa40/s3jJoj5gI614ezr2bsY/f19uPyP
	waaBKIRWSIcwfe6wF+z3/tKlp42vOc3ys3u84/09ELprzdljcYG+voD/kATeRRPRNEy0U6Tghga
	m4HLC9uvbAk47gpRI+pvodIxFStWxn+P4U0OIKAgWRf6dWs2nbP6T4s/Nqzv61wUpt4VUGcQXQv
	JjJXjMoAPW4DddoMAAITMpI5qiGsEYKpdD6EaqGrRvox/MFk+0Bj4e9jsvtKZh2TBx+flMx3JLs
	7quBIkZgLy8IqcLQ92uKbHQWxZ/7Z13uSWoghvrixGOHRzWIVoddSRkjUa5JSAKjJqnzWdbtrp+
	4ltF8v5M0tn8QpMRaoVvA1QhcZpT+9LbYZ6geS75QzrK1y4Y/SJoJsQodTixK8347dt/afjt3GD
	EThUiVoHNC3Ps++9Y1kGppNZgmEWW0z2hHKnPjKcszEYFdnsaqiVokUmzMCDfrB7QUW+7S8ZzYM
	lZQ9uq5en
X-Received: by 2002:a17:907:7251:b0:c46:8c16:a656 with SMTP id a640c23a62f3a-c49bdecf308mr430095466b.18.1793269117120;
        Thu, 29 Oct 2026 03:18:37 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 5/5] drm/nouveau: Use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:26 +0100
Message-ID: <20261029101826.72773-6-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
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

nv50_sor_dp_watermark_sst() checks DP_ENHANCED_FRAME_CAP for the
watermark calculation, but the actual enhanced framing enable is
decided in nvkm, in nvkm_dp_train(), nvkm_uoutp_mthd_dp_sst() and
r535_dp_train_target(), with its own copy of the check. Convert all of
them so they keep agreeing with each other.

dispnv50 uses drm_dp_enhanced_frame_cap(). nvkm does not include the
drm helpers, so add nvkm_dp_enhanced_frame_cap() with the same rule.

Compile tested only, I don't have nvidia hardware.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93..f965d4811 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1607,7 +1607,7 @@ static bool
 nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
 			  struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	bool enhancedFraming = outp->dp.dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
+	bool enhancedFraming = drm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	u64 minRate = outp->dp.link_bw * 1000;
 	unsigned tuSize = 64;
 	unsigned waterMark;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index a109348bd..fbd9935f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -509,7 +509,7 @@ nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 	OUTP_DBG(outp, "training");
 
 	ior->dp.mst = outp->dp.lt.mst;
-	ior->dp.ef = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP;
+	ior->dp.ef = nvkm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	ior->dp.bw = outp->dp.lt.bw;
 	ior->dp.nr = outp->dp.lt.nr;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
index 9a6be4391..e56acc162 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
@@ -23,6 +23,17 @@ void nvkm_dp_enable(struct nvkm_outp *, bool auxpwr);
 #define DPCD_RC10_SUPPORTED_LINK_RATES(i)                               0x00010
 #define DPCD_RC10_SUPPORTED_LINK_RATES__SIZE                                 16
 
+/* Same rule as drm_dp_enhanced_frame_cap() */
+static inline bool
+nvkm_dp_enhanced_frame_cap(const u8 *dpcd)
+{
+	if (dpcd[DPCD_RC00_DPCD_REV] >= 0x12)
+		return true;
+
+	return dpcd[DPCD_RC00_DPCD_REV] >= 0x11 &&
+	       (dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP);
+}
+
 /* DPCD Link Configuration */
 #define DPCD_LC00_LINK_BW_SET                                           0x00100
 #define DPCD_LC01                                                       0x00101
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0ce..b0158fc30 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -87,7 +87,7 @@ nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 		return 0;
 
 	return ior->func->dp->sst(ior, args->v0.head,
-				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+				  nvkm_dp_enhanced_frame_cap(outp->dp.dpcd),
 				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173f..c62900320 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -972,7 +972,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target, bool mst, u8 link_nr, u8
 	if (mst)
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STREAM);
 
-	if (outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP)
+	if (nvkm_dp_enhanced_frame_cap(outp->dp.dpcd))
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE);
 
 	if (target == 0 &&
-- 
2.50.1 (Apple Git-155)

