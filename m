Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668480;
	b=KIKHKUIrI/9OBU5QeNICgEG1iD0ueyU4seoEbXrG48rvGV4ZNv/oc9Ov00I5ZJx1e9a9
	 yEGE8yUodI4HoMq73TLW2qcLrZlZnhRfhA2mOJXPWM5oeqVAMY7YL+gWvi8xxXSMy09mQ
	 DKytY71BWfATakMOSnlSaQY8rqcURyIpos6zsfsF8CS5UgNJ0HbdidycqQWO7Ramq+k9k
	 ng2MB4HI1HXe7qekrfLY6y6wyuh1IopcwoNHWgp++7UajgNw0diPZJWqp0WlSp0roADUu
	 mVtNv28a2GfYRY2vjPQUzz5FnqKKkVfVdpaDBnZNu7EDzvftbFtvF8UgxFgckkB8JEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668480;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FDbV8o4JlaTKYOI5WW+V2TORhEyLD4PGRa8uy3gNXRs=;
	b=a4Jna2xwRANYIA7jLZvcyYPPSzPOfdhO+Jz3p32xcvFT6/TCKIa8hF64586bKk+M1lVu
	 SHzaGe7AtYB5ZipZZ5ckl22wYQlzT/SUhHDwyCDG0xHWjBMIVFmkDumNAW5/v5345Z4Sm
	 LSy2lNUibIHemdpcXHJTgUx0ZerYBiXlxayEvMcbS6AEGvkz/TO8vFSzeEot/vKvNCLzT
	 ACp0vEO6Wwu4Ds5YPO3H7lw9FOprUleNGs0lC59iTDH83WtqPwzkT58L6R8tckhTkJ54o
	 UEXf7Qx80a8M+GrFcjOMHEb7x6PDMGmi/3TxXKIqF9BBWpPAvyR+lkT3Q4Dqoq4035g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hUHuFU5R;
	arc=none smtp.remote-ip=91.218.175.196
Received: from mta0.migadu.com (out-196.mta0.migadu.com [91.218.175.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709ED606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709ED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hUHuFU5R
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/G7wmxsTL23u9bAYd6YQYYYXjzFS/q8bqKEQoNriAAg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668477; v=1; x=1794273277;
 b=hUHuFU5RlcnDhKHgGREFIsXDCtO8AnpM/znRVTTc98utRqLH3OFHLnbI2a/R49Nztwqjn1C0
 HDj5hNoQ2xznG3VYVPzFx2Qs2OnVkXMwliOWmo1o/Z5v8RquvRrHn2APWz8ecWK77zcHH47e9S7
 7z/FhK1gFCZ4pCR1D7LwXdBFTpbk58WWXto8rb5CkXeF0qTKgMuOapL5Q0oN1joynV96Aa2baUj
 zXmJQNcRP9UUM5tdyAZNHQGuLbjEvZZ/xqh4FoXVZTlYTsjEuJ9PvK6/lVshfP6BZpr5xQeAVdj
 HvdHq5TrW5288d7oH+qx2QCMSJn21F0rTMpci/Jvxosiw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2c0fa72fdcaf99d;
	Tue, 03 Nov 2026 01:14:37 +0000
X-Mizu-Trace-ID: c2c0fa72fdcaf99d
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH 1/4] drm/msm/a6xx: Restore GBIF CX config for A640 family
Date: Mon,  2 Nov 2026 22:13:50 -0300
Message-ID: <20261103011358.65398-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103011358.65398-1-val@packett.cool>
References: <20261103011358.65398-1-val@packett.cool>
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

From: Maximilian Luz <luzmaximilian@gmail.com>

Commit 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU
start") moved the GBIF_QSB_SIDE{0..3} configuration from hw_init() to
the per-GPU catalog entries. Previously, it was applied to all GPUs of
the A610, A640, and A650 families as well as A7xx. However, the A640
family entries (A640 and A680) were not updated with the new gbif_cx
list, so the configuration is no longer applied on these GPUs.

On the Surface Pro X (SC8180X, A680), this results in GMU HFI timeouts
(e.g. for HFI_H2F_MSG_GX_BW_PERF_VOTE) and GPU lockups shortly after
starting a desktop session.

Add the missing gbif_cx entries to restore the previous behavior.

Fixes: 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU start")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7ad2..6c154792cb07 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1041,6 +1041,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
@@ -1164,6 +1165,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
-- 
2.56.0

