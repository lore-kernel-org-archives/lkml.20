Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364834;
	b=Is1GPDHdRLMy2J0UvPFrhTUkYZVa5IG1UEQad202yCNVuY9e4ZlLa9fuvEpPiV0J1xmZ
	 bJU6ePbVK/ZHrhu44OPMppFvLFebc2iDeopsNwa7s3KVd1M2JBpqMPZjv31pd3gR8IfVm
	 ZODwOBc1d0k5svkVH4s33/9UI97v6MoCyGOcyhJ3/+b+9VTRG/XqmSMWlJXimcHfqw0CW
	 H8nEDMFxH4SK3q4HBgBtSGOKbi49yIk69a7N4OdHn/aSpMoTwgj4/5fNo8E2zwYwb74AV
	 00PKZTQcg1cPKTPF+hudsyihwbEO5G6Kk1/wucSBC18+/JIAlSN75M38QfKGoiJ6fMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364834;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7WX1G6+ktrzrYe81d7r8LDzTp8bhfw3CI+SJD6UOSx8=;
	b=zh2f0z2Cid3gLwPpuSOHVy0pm/XNLOD3nI40BEJkyD2UCHP0XBSR3t6mVNMOr3Xs6rBB
	 oH1E+K31RaMg5qeRevNaR2BlwXtZ8YVL66MQWEiDAq3zAiSvVJBT6uYbhS7WCsbnKWN+D
	 I8xRySLB9xrnsy5fRhV/zWj38jXLtNezoaIHJGxXg7tVYkDQBpf8220DJc9XgfO0rf39N
	 QvC8SKoJ87X+NkVBJjYQqaV7/EYriXq0pCXumm66p2G10l5MmiFjix39nt47eiw+TeGEe
	 ix/lnJz0TLXBPKzdn9Ijn9Khp4BONtjJDWEcDSvRofOS3LiScxzAgV6jYC8iQlOg+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbnD2TDo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA692606A321;
	Wed, 11 Nov 2026 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbnD2TDo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592001F0089F;
	Wed, 11 Nov 2026 02:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364834;
	bh=7WX1G6+ktrzrYe81d7r8LDzTp8bhfw3CI+SJD6UOSx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbnD2TDo3nIPlZPLq77gTlkKiW32wuwflv7k/RYG+fX5rpoK5K+UnMOYffoxMCvpB
	 QjoZHUoLm477ErGm8kHNSLV6T5IY+zo6dRFlW0efUpiqBPUqnF6wZDZXp3N28QLtEf
	 cDK2kpvRhtDXwNYQAt3zInpc2q+hHyWieyuTBT2A3wq1zmb+GqVA1saVuKf8MlWjwJ
	 pyFpiOai+0hImMYeE3heFWfIdGDFIsZV5x1CnBPUA9Wl2iBUHhFfXKkA2h5OCJ0yox
	 7qr6Ik3lKV3N/XhnZhaxXrDJkhQhZpitGzlkgxtlFx9B/h6KNAo7y5r0rbUK8Sk7Mf
	 +BoUEqwowTfsA==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Ilya Shidlovskiy <shidlovskiyilya@gmail.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] drm/amd/pm: bring back od_uclk_changed dropped by the amdgpu merge
Date: Tue, 10 Nov 2026 21:40:32 -0500
Message-ID: <20261111024032.760400-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avNxxfHK_Zh2GN2o@sirena.org.uk>
References: <avNxxfHK_Zh2GN2o@sirena.org.uk>
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

The amdgpu tree adds od_uclk_changed to struct smu_table_context in
commit 62d932f72037 ("drm/amd/pm: smu13.0.0: refresh the UCLK DPM table
after an OD_MCLK change"). It sits right next to user_od_feature_mask,
which mainline added too, so amdgpu_smu.h conflicts, and the merge
dropped the new field.

After that, commit c62c2736d82f ("amdgpu: Merge merge merge cherry-pick
cherry-pick cherry-pick") made smu_od_uclk_changed() return false and
removed the code that sets the flag. So DC never re-reads the UCLK
levels after an overdrive change, which is the whole point of
commit b7483797b085 ("drm/amd: let DC re-read UCLK DPM levels after an
OD_MCLK change").

Keep both fields and put the removed code back.

Fixes: af8e519642bd ("Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git")
Link: https://lore.kernel.org/all/avNxxfHK_Zh2GN2o@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this is against next-20261110. Please fold it into the amdgpu merge;
it replaces the smu_od_uclk_changed() part of c62c2736d82f.

With this the three files are the same as in the amdgpu tree.

Found by comparing with our llminus-assisted integration tree. Build tested
only.

 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c            | 9 ++++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h        | 2 ++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index ff51ff875bfed..86e34e814fe6a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -601,6 +601,9 @@ static void smu_restore_dpm_user_profile(struct smu_context *smu)
 			ret = smu->ppt_funcs->restore_user_od_settings(smu);
 			if (ret)
 				dev_err(smu->adev->dev, "Failed to upload customized OD settings\n");
+			else if (smu_od_uclk_changed(smu))
+				/* DC read the stock UCLK levels in its init_hw */
+				amdgpu_dm_update_memclk_states(smu->adev);
 		}
 	}
 
@@ -3701,7 +3704,11 @@ static int smu_baco_set_state(void *handle, int state)
  */
 bool smu_od_uclk_changed(struct smu_context *smu)
 {
-	return false;
+	bool changed = smu->smu_table.od_uclk_changed;
+
+	smu->smu_table.od_uclk_changed = false;
+
+	return changed;
 }
 
 bool smu_mode1_reset_is_support(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 41d665591d62a..2a0cdc6e80596 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -434,6 +434,8 @@ struct smu_table_context {
 	void				*user_overdrive_table;
 
 	uint32_t			user_od_feature_mask;
+	/* Set when an OD commit/restore changed the UCLK levels */
+	bool				od_uclk_changed;
 
 	struct smu_driver_table driver_tables[SMU_DRIVER_TABLE_COUNT];
 };
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 02bd2b15066cc..1a02ba70d3000 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -1306,6 +1306,8 @@ static void smu_v13_0_0_od_refresh_uclk_table(struct smu_context *smu)
 		dev_err(smu->adev->dev, "Failed to refresh UCLK dpm table!\n");
 		return;
 	}
+
+	smu->smu_table.od_uclk_changed = true;
 }
 
 static int smu_v13_0_0_emit_clk_levels(struct smu_context *smu,

base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.53.0

