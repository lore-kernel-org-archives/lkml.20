Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356864;
	b=1SUpJ6wbb5lm6/CoLhOl4fiffGFkFDoGleC3HkQxYlpyWQkjdk75PsByOuR5+llOt/4w
	 8625p6CL88rrOh08QOVIT1lTaVJN2YF4R38btTKyi0Uxf1PPXcbvpNK052xLmbPa64Pfl
	 PT7Yav/zUpNiuSkPJh36f0+/c0z1j9Hm+b0fSQBEtTWA2FBTN/m5QMsEMOs5KCAKEEwv+
	 NTuAmXTDOEJQCv2VTpfKzl5SeKIJbvaKzRsFqYSKnEU05b0zb/++zfG1nqx1FR8bIr/32
	 23Ae6LWfIrS6Ztr54W35oT5+iDcDPFVKRLsWiIIbTxP7RhLA9F25S2Bu3/TEixYIrjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356864;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wyEBsu61my2xRcWxxz/2MGS82lQFimJORgTUHt1Bg/U=;
	b=4Wal3/uToL+Uroaiaocj7PIj8PyKc8OI+AhWMP3DpkDimbIKs3xbewu4rBRhQSq/vwVj
	 V2wmNP3G9a+Mq8aDoem6v5bOuhgGw57VxoBKAv+HqLzpNo1JSbBcP/dKsBMT6bxdkdFB5
	 lRHCM40UAt2XAPpGT/bYjNmPfwqoea5xO8YWw95uCc06lRh7Jt/eqjOQST/mpdx0u17A8
	 9tzTrsfxMxCIi0tYKfqKLrgHpklU1M6LZjM4W6qogx6gJztAw6fRmqYCPfhqAZL9Wg8GR
	 GzDq3Z9EorMLSoU0fryQfI9iUDRKmtCyl8uD8JlxVraQrh8mkKTVMiHDM6WSJGleHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mgC9LuFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD768606A31D;
	Fri, 30 Oct 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mgC9LuFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865851F0093A;
	Fri, 30 Oct 2026 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356863;
	bh=wyEBsu61my2xRcWxxz/2MGS82lQFimJORgTUHt1Bg/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mgC9LuFcRUG1bKE5lPmYGQ3TakPnq4qoAC+LcwGSGVPme/Znv+zFAKN2llpi2uYe2
	 U+B2EJH7AmmDDN34aNDqYcJ12FlaNqMuscteVibC+NOWS4dFQGuIWPhys6kWGo/0Tl
	 zXUlwdSmRjgaUeI32wTGKH2QPcAU6le5TrYuRwxJM1T1UDxggL9Pv84qJqfpSiLO7/
	 qQJgfG/kfEkGCCKvecl+Zrybw/OyslZ7CJXmnZtj7r7Ik9bWy8JywMSLai/6R4tVoK
	 BOuxQXKbMH+0oMtWqXOm0JXDg1yK5sFTHUFFINl/veDXpoFsgPgzyQYpTU2CFYh8Sr
	 60Gn1A4WFtDJA==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] drm/amd/pm: fix up the amdgpu merge of the smu 14.0.2 zero fan restore
Date: Fri, 30 Oct 2026 06:41:01 -0400
Message-ID: <20261030104101.3496560-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auNVlhF6DGyFYx10@sirena.org.uk>
References: <auNVlhF6DGyFYx10@sirena.org.uk>
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

After the drm merge, smu_v14_0_2_od_restore_table_single() has two
PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP cases: the drm-next one and the one
from commit a2eae9f4fa1b ("drm/amd/pm: add zero fan stop temperature
support on smu 14.0.2") in mainline. The amdgpu merge resolution drops
the drm-next one and keeps the mainline one, which still sets
PP_OD_FEATURE_ZERO_FAN_BIT in FeatureCtrlMask.

Commit 8d4ce79aff1c ("drm/amd/pm: preserve committed OD features for
SMU 14.0.2") and its drm-next cherry-pick removed that update from both
zero fan restore cases. Remove it again so the file matches the amdgpu
tree.

Fixes: 0575e86c31a9 ("Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git")
Link: https://lore.kernel.org/all/auNVlhF6DGyFYx10@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this applies on top of next-20261029 and is meant to be folded into
the amdgpu merge resolution.

 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 24a3d61d8ea66..62f16d17e22bc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -2606,7 +2606,6 @@ static int smu_v14_0_2_od_restore_table_single(struct smu_context *smu, long inp
 	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
 		od_table->OverDriveTable.FanZeroRpmStopTemp =
 					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
-		od_table->OverDriveTable.FeatureCtrlMask |= BIT(PP_OD_FEATURE_ZERO_FAN_BIT);
 		break;
 	case PP_OD_EDIT_ACOUSTIC_LIMIT:
 		od_table->OverDriveTable.AcousticLimitRpmThreshold =

base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
-- 
2.53.0

