Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844B366052
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869514; cv=none; b=CsAhVWa/KfPxNZBY80OhbP5KiBx4KgsN6pjnDzO+ms1onx0wWORyFzng3POOtF3Xzf4lYFTPgAwCjCMLigyUXaga5WesT413ck0vLtsFaX1KQplNdGwCuUFdCOLaaRqOq+YAr0DDQvm5cJhFpBLpQKNttf6rk2lAmhX2NonbcL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869514; c=relaxed/simple;
	bh=Ghe6fEUCCenF+Ta7gb+uXMeiwYxD1Md/lBsKHp67rtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuQLEcxiBlZhZRsD6V3MqaRxwWECReyPp1Wd7/XupdV5K/v3iVPtY9ynLQNC/ZI5IIFTV6Y6Vi7dYbcIFqjj0cQ5GbpgAqigNrQDOkYCIEodG64t1rC0LOQl5PEyJNn2X6InAbI/cNtE0s+jZ7aJXp8WfAgUQlL6qkB9QvT+e2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkA37NWD; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkA37NWD"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-333c363917bso2672164eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869511; x=1791474311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGU1hp8RKvrBj9z5Cp9aU6FTf9xO9MFvbkhy3G4ASLY=;
        b=fkA37NWDPfUD5GEiUtT+sZgDaW+wQ/D/EiInZydG4XrE9zxF6OgyY49P++MpqRSZiL
         xilk3bM3PZdSYOGc2j7qZWsYYEGEO0tgxP5Koc2/WBcKHZYUbwp8/SFOelqWcaS2WnJ+
         0v8VVURXWhUDOeT53ICkaXGk3D5A7DEX4Z/cnj87BG3rypEiZ799oCiWVoQDaetwUpNe
         IesQ3pbX1yz8l834Y3rUP9/n0+UjxigALZzhonbhDSNzxnDIb6/8iYwhg3CXT7zPQISe
         eOzDhnzaDEpEV+cXSSxnHLsSiXQglErKRq4IsGFiQfnghxidbbHIw+dckqRfWOOpoybm
         yLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869511; x=1791474311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGU1hp8RKvrBj9z5Cp9aU6FTf9xO9MFvbkhy3G4ASLY=;
        b=1sx702sLqNPxF0mPQiLc1ICSt6IBrwFuUgysy3Ye9FwK0U35ibKVg4ktWDSuq5qUX/
         fOEPvyjMiXnU4uobqPoseWXWNpnp8ofgNckGA4LmHcpkmaTCF2qi68tBq31NwedSVF72
         lEF1Tt7qHUih1pL2Y6UQotMD++MRNW0oEL0mTlBq5AiwrZLvBAtxvzEXOJUaE5z/shqQ
         Rqgpf9smGxBPCSi1Qfkfaw1O+T14B4OyJsPSawfer/JKUgdBFM2fyLaH4Hlhc7ko3DJg
         +pQDXmSuGApMSb/95xJ/45LbqwlLeoZvM3Hvb9JE9OPL0V9bsYsRJksCrdQP+KZwXmdy
         tD3w==
X-Forwarded-Encrypted: i=1; AKwUvBzD++yLjy4NlqR9bVFM2zY4nGzlw/krZOx8qD+yFyBdJZ8xLYg8ypQm4mBKJH/25AGyfC5CUD6aQdPrHIE=@vger.kernel.org
X-Gm-Message-State: AFuF++laiFm/VhLmUatKN6iOJYgIjCZYTR2H4LsIPVWbpAQBfvuvniYM
	xm2CjyUQG6/R7CWtcAxIRmJUr2DPGqNXvozs7gfA8CXCZH3iJUBmMfs2
X-Gm-Gg: AYBFou3dKGtEEJop7CWG0UAV9Ozz4RUX/Alzg4gGK/ECojVCt5UGLS/ZL6JR6dEFiAD
	cLhC1ElZY/tEOMiYDddTPrdg0l9aTHwhho81/6dwPBTqqAgBJRtXjo52K+G5qDOffQxeB++iO5k
	ffgutSNq8z9ziCIE7DzCnNE7VdqcIFxVdrgo1n+nViXu+jWPnOPoTpPMiSI75tQH01N5z3Q8EFk
	S9JDwTrDkKPwFZ54h7iHz7QGh2qcGjIORwK1L+IFyEkWIWubIGKPAClXIbZW41pgQR0bslwdk/+
	yfmwME1aMx1+tNEMok1toZWTyrnQvJdOH/BVqr1pO3xC2n6KJjfm7rbCEkvwezgywS/PVPbVJhS
	3tkKT8PSeaoqdGqJB1+0TBWPtfDMoaGXZSzKCzjDwgOU/tN6r0VJoq4unqmkHIwHXHjIbEsy2Yr
	QIbP+LkqajkRIhmSMJF/dhVBxyM/nf9EFx8KCQBNZicdtPvsL6VSzGacICs9RqUZf5Z70bvbWp8
	22I1080fqSZot9nxi7E08J2Sc0=
X-Received: by 2002:a05:693c:6392:10b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-34cdc0d3cd5mr5212034eec.18.1790869495059;
        Thu, 01 Oct 2026 08:44:55 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34edab4beb8sm1869648eec.14.2026.10.01.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:44:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v8] media: qcom: iris: release OPP constraints on VPU power-on failure
Date: Thu,  1 Oct 2026 15:44:36 +0000
Message-ID: <20261001154436.20798-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power-domain helpers update the OPP for core->dev while enabling
or disabling individual functional domains. The zero-rate request
used during cleanup selects the minimum OPP rather than disabling
the OPP constraints, so a failed VPU power-on can leave required-OPP
performance-state requests installed. Supplier reference cleanup
after a failed runtime resume does not itself request supplier
suspension.

Move the maximum OPP request to iris_vpu_power_on(), leaving the
power-domain helpers responsible for runtime PM operations.

When controller or hardware power-on fails after the OPP request
succeeds, run the existing resource cleanup, then disable the OPP
constraints with dev_pm_opp_set_opp(dev, NULL).

Report an OPP-disable failure without replacing the original error,
and continue ICC cleanup. Keep failures of the maximum OPP request on
the ICC-only cleanup path. Recovery from partial failures in the OPP
transition itself and the existing normal-power-off behavior are
outside this change.

Fixes: f6940b79fcb6 ("media: iris: Fix opp scaling of power domains")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v8:
- Rebase onto media-committers.git next.
- Adapt the OPP ownership change to the Media tree's separate
  power-domain helpers, preserving their runtime-PM return values.
- Update the commit message to describe the Media helper layout.

Changes in v7:
- Rebase the fix onto the updated power-domain and clock helpers.
- Remove OPP handling from the per-block power-domain and clock helpers.
- Keep the maximum OPP request in iris_vpu_power_on().
- Use the NULL-OPP disable path for failures after a successful maximum
  OPP request.
- Keep a separate ICC-only cleanup path when the maximum OPP request
  itself fails.
- Preserve the original power-on error if OPP disable fails.
- Update the Fixes tag to the commit that enabled required-OPP scaling
  for the supplier domains.

Changes in v6:
- Move OPP handling from the power-domain helpers to
  iris_vpu_power_on().
- Request the maximum OPP before powering on the controller and
  hardware.
- Add a zero-rate OPP request to the VPU power-on error path.
- Keep the power-domain helpers limited to runtime PM operations.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- Rename the patch to reflect the new approach.

Changes in v5:
- Return pm_runtime_resume_and_get() directly.
- Handle pm_runtime_put_sync() failures while preserving an earlier
  OPP-update error.
- Add a blank line before the rollback return.

Changes in v4:
- Convert the OPP rollback to a goto-based cleanup path.

 .../media/platform/qcom/iris/iris_resources.c   | 17 +----------------
 .../media/platform/qcom/iris/iris_vpu_common.c  | 12 ++++++++++--
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e75291..752b1e81b110 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -74,27 +74,12 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 
 int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
-	int ret;
-
-	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
-	if (ret)
-		return ret;
-
 	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
-	int ret;
-	int pm_ret;
-
-	ret = iris_opp_set_rate(core->dev, 0);
-
-	pm_ret = pm_runtime_put_sync(pd_dev);
-	if (!ret)
-		ret = pm_ret;
-
-	return ret;
+	return pm_runtime_put_sync(pd_dev);
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..f277120e80ab 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -498,16 +498,20 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 int iris_vpu_power_on(struct iris_core *core)
 {
 	u32 freq;
-	int ret;
+	int ret, opp_ret;
 
 	ret = iris_set_icc_bw(core, INT_MAX);
 	if (ret)
 		goto err;
 
-	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		goto err_unvote_icc;
 
+	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	if (ret)
+		goto err_opp;
+
 	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
 	if (ret)
 		goto err_power_off_ctrl;
@@ -527,6 +531,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 err_power_off_ctrl:
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
+err_opp:
+	opp_ret = dev_pm_opp_set_opp(core->dev, NULL);
+	if (opp_ret)
+		dev_warn(core->dev, "failed to disable OPP: %d\n", opp_ret);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:

base-commit: c6fb304dc0253584cfcb93b6b97970c36850910a
-- 
2.43.0

