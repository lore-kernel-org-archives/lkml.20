Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F42DB794
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989602; cv=none; b=Rvpx7DBli8klAjgw75IhZrZi2WhkVv+DXoBjCpxZwm6Q1HypPTiC/6qJlg78dgQrKeXyrPKY7K3aT0vuXDIGv6hm02X2Sh6TiDsFdaM+vybo0i05UBEVypWnia1c7BuZ4GTq6d4KfdA/xOKUj9e6RPKzyYf7vhtYS6w9M+zxJhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989602; c=relaxed/simple;
	bh=Q0G7YNbj2kfMO1cVV8mx/fxMq/j/xlphxp53srsMh3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DZTsOlFxqUDFx53W1gZPer5J1WW3YGR3jd4EzhvTVRuX/I7EdMDQ9WszyCI03iIzvRfGQMs2CmHTyMmkylOSSe9ZmlafngJoR1gIGt2wj8q+OuaONLRpyxcnOHk37yAkJZaDX1e8h4C19g4Ld6mqYZjBkps7IcY/pjFxwFsxy0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdCdpnY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSAY5Bc/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdCdpnY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSAY5Bc/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdv1T3818642
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QaRYYlHdJR0pZuCfEcUByL
	7RAlyPg9Deju/matmfvSg=; b=EdCdpnY38vnM4TygRqLFLbGpL60VuXlxdJk3OW
	hhHtKk/aYMgt39PySPoOMEVqbbaruMxH/w/nfuIK0CgIk3BprjuWnoYFcmzGkawC
	suMuV6E2rcXjK5YZpF7QGjiykEq3bi0EF+F2hWkqkMhv1nbWUS28jwSIgswjFqap
	3xXlkifzqO0/ExMV6RDbUhvnHDQ9LCT477rpYkWWeeimG14ATqFtyxK/hgVJZJm5
	MwkbWEETDhdmzY8QNCj4/yvUMSJjLyVlO2DMOSL2SoLi7go3scZ5kVH+sdWRwX7f
	cJ0T0h5haf4e32onnM5DVdrWXc945xY4DzK7h5os4ZNrWWCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79acct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:20:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso5184025a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789989599; x=1790594399; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QaRYYlHdJR0pZuCfEcUByL7RAlyPg9Deju/matmfvSg=;
        b=cSAY5Bc/4o5RxiUFiAffBKdUr6doNAAuaxNZEvU8m3DJRZK1cgcjOIGdncrru0FGlo
         tCk4Or/UQAjLnt7XUZbfXrTIagnyZxJntBQ4ki2ipHuFCXErHR3/jYaHBkCaqx+16tXc
         7mYTqOdrz9inPp1t8PuROAFHHqilBwp52ejaxCHACCzCSp0hCQTIj32yW8q0VrgjTUgt
         LBuaReshzF90muqz5AiXIUd4dDLXvWlXQ30ShAg5DMcgkHT3mnDUnbgYjAlVHDU9rCOm
         tU5YGmdFSFryhDjej/yM5BKnv4whkcWtuq4WphzOoS6GqOVKJ1/3bAxpPtQ/5TYFN8VR
         cIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989599; x=1790594399;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QaRYYlHdJR0pZuCfEcUByL7RAlyPg9Deju/matmfvSg=;
        b=N880/aVsrUxAUFRr1vufK86r5uCrZB63JsX4do6n32aL6rBnfgDjXAdU9iGe5L0yvw
         CfqYNuvh0UPijiSMOdARtT1yJ694AlI94YKrYuO3L5Xo/KZvyDnnv09A5NRXgfZU44wR
         xBz6wwhmqqgWd8RMw+j7Ch4TjDBpTkRWPM6QRL/AH+vRdBecfPrz43r+in+BR9VZ92jv
         EayhTuevhyYZUq9XoeXWMSdv+FRpH6cD+6g9//OANk30Dne+k+KyWQIQc2E26acYqaFn
         Yx6rVgjLG1GGUGZ3vZmpC3eq0GbWDd0Tk6skjkWYgX3zRbAdI8n6IqAxTs1YKSMFbf7k
         ZitQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn48/eFkaLUJEOAWhgbgD+pub0b8FxUY4krh0dhRnS82AOnJZcMpXcYMTxuQRr5FxfoLeU+hkhBWbkzBY=@vger.kernel.org
X-Gm-Message-State: AFuF++ma6sKSo1cFCJzYEOMagEFa9FxjMtxf61UCC8pNmKDb7cmdzRDA
	SYzjuxFVhPL8uOqOoYFAO6P3KpKnbbEasSJk56YLTJp4foCGasHdXLCJGCVe9MKptBWzWSAiyOe
	SrkzjMr72oCbIZJwrRYRiDoNTDi3wcip04NR1D0j2z48lIyvLJvKcY+UoxS/uWowAez0=
X-Gm-Gg: AYBFou0ALI/zCltF96sJjxw01MhJmZXGxM7qm0lLhZn2dPm1xpmnJVjt60U3AoGAlUt
	zK+JCtbX/3+sQ9K0oxK0H4+LDtCLHh1kHqJPQqN4oFe6KnpwgXOk3I4SyEjLRd3nvWQZOzc/R2P
	KYef+GTjR9ShDfBI9flL+MEOnDYZDjD2ZffGhJH0/LhB+Pnfz9eqF62aTKGXzZnVo+MrKw8+c+3
	gsgL7ZflF/sm4LLsXKk8dqCMECZSuNIvBhFI4+vazaQvuCZECtTf7hmiFLTYW6J+G/OO7G5Jdp9
	t7SVJ/mKI2ooACicVtO/VaoXAipOyYb4/YUYl3re28WUjldhcWN/c2vfZP+lT/rKbXZi4TlLp+a
	N/WNExfGKACsiTUPdLvL3q282TQ==
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr3762020a91.38.1789989599211;
        Mon, 21 Sep 2026 04:19:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr3761984a91.38.1789989598664;
        Mon, 21 Sep 2026 04:19:58 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318c49dsm18841601eec.22.2026.09.21.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:19:58 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:49:52 +0530
Subject: [PATCH v3] drm/atomic-helper: tear down HPD/polling in
 drm_atomic_helper_shutdown()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-dpshutdown-v3-1-e456ff7fbe4c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANcSsWoC/23MTQ6CMBCG4auQri1ph0KjK+9hXNA/aaIUO1A1h
 LtbWGnCZpJ3ku+ZCdroLZJTMZNok0cf+hzVoSC6a/ubpd7kJsCgYZJLagbsptGEV0+ZkEcOTru
 GKZIHQ7TOvzfscs3deRxD/Gx24ut3l0mccqpYAxqcNE7xc0Asn1N71+HxKPMhq5bgR6jYnwBZE
 II7XdeiUtbsCMuyfAF2Vfsb7QAAAA==
X-Change-ID: 20260717-dpshutdown-047912fcf60b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789989593; l=4926;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Q0G7YNbj2kfMO1cVV8mx/fxMq/j/xlphxp53srsMh3I=;
 b=b9aBRD5L+zkU1K8wu9nPTEKi0SNETznDzFKwF8EzrwNJ6bnMOaMco77WyLhIszFEPtV/QZCQ6
 nmQJiG+8FWjB5ojpKLbNR/KnLsTIgCdEtXT8VxQ/bljDQZNa0bdgqJg
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab112e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=olRUzlJ4id4ZNEiLAuQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NCBTYWx0ZWRfX9R0SAe6LeJgH
 LHkBZJ3IoQY7Hjb3m9LtZJZ+vegzdghAK9zFR8AoNYL2kJVgyVbsakEpv+5fb/zrDm2gFvZYDsa
 4dX0azRVkp5xQEdDZJM1S44VREd1xD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NCBTYWx0ZWRfXyEVueOC2fYTE
 TQF8dXHC+XrahM2Z12XQ8iDiUVGJ02VwFkJ4oZ6xc8gh/kcmCrx6rAEAcy1oZ2yTQJPVxPVPfQt
 7Fq6ya5OO/6v0paOfombKuI0yvi1+4PX5nRRBAR8TEc9djLUBRBoY+8jm0rNfFxLfS8AaTPGew3
 dabHjKof4CteCUmtZNKGJGKXCQyIQLClU2c2iEXaybJ9h5Gub7L+KZNQL05h+G/9WNu4B/t+0p2
 sGG5tuKfO3alvmaZb4e9H2C/w3O+FB6nNuAGvvctaPYueacft+Fh9SCjKDhVlnO8ZHtNins4Ujy
 ce7PqlpHenO3FtEUpkAi/w3g7Dq49yf4x8omRaNSZJie8Js0YnHLpXjrPLPd3cnPH8Y1IiMETFo
 WCxhEO8DheCrF+dwuv37sTlzfrt+iuq7m6WSVN24oUPxADuBF71KwI0SNhFJXYaQ8SX9BobvLSX
 iQEXBoUZE6nysHtk4zQ==
X-Proofpoint-ORIG-GUID: x-zPJQhhhEugr4FXSPcxiqEoP4uAAX2G
X-Proofpoint-GUID: x-zPJQhhhEugr4FXSPcxiqEoP4uAAX2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210164

drm_atomic_helper_shutdown() disables all CRTCs but leaves output
polling and IRQ-driven hot-plug detection running. On reboot, a late
DP hot-plug-detect (HPD) IRQ can fire after apps_smmu has already
disabled translation for the display subsystem, causing the HPD
thread to kick off a new modeset that drives DPU/DP hardware and DMA
through a stale IOMMU mapping.

drm_atomic_helper_shutdown() disables all CRTCs first, but a pending
HPD IRQ thread wakes up afterwards, reads the DPCD, and fires an
unsolicited hotplug event that triggers a second atomic commit
turning the display back on -- right as the IOMMU is disabling
translation:

  systemd-shutdown[1]: Rebooting.
  msm_dpu: drm_atomic_commit: committing (shutdown disabling CRTCs)
  arm-smmu 3da0000.iommu: disabling translation
  msm_dpu: drm_dp_read_dpcd_caps (late HPD IRQ thread wakes up)
  msm_dpu: drm_sysfs_connector_hotplug_event: DP-1 hotplug event
  msm_dpu: drm_client_modeset_probe: DP-1 found preferred mode
  msm_dpu: drm_atomic_commit: committing (unsolicited, re-enables display)
  dpu_crtc_commit_kickoff: crtc94 first commit
  arm-smmu 15200000.iommu: disabling translation

Call drm_kms_helper_poll_disable() to tear this down: it stops the
output poll worker and calls each connector's
&drm_connector_helper_funcs.disable_hpd, which for HPD-capable bridges
masks the interrupt in hardware and then waits for an in-flight HPD
handler under bridge->hpd_mutex. Suspend the in-kernel clients as
well, so that a hotplug event which still gets through is recorded in
client->hotplug_pending instead of being probed and committed.

Reported on Qualcomm platforms such as lemans-evk and monaco-evk
during reboot stress testing.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v3:
- Use drm_kms_helper_poll_disable() instead of drm_kms_helper_poll_fini(),
  guarded on mode_config.poll_enabled. (Sashiko AI review)
- Also suspend the in-kernel clients. Masking HPD is not sufficient on its
  own: it only covers connectors notifying through drm_bridge_hpd_notify(),
  and a forced GETCONNECTOR re-arms HPD via
  drm_helper_probe_single_connector_modes() while poll_enabled is still set.
  drm_client_dev_suspend() keeps the resulting event from reaching a commit,
  which is the drm_client_modeset_probe() path. (Sashiko AI review)
- Reworded the kerneldoc; v2 claimed only that polling and HPD were torn down
  via drm_kms_helper_poll_fini().
- Link to v2: https://lore.kernel.org/r/20260730-dpshutdown-v2-1-441fc5543bed@oss.qualcomm.com

Changes in v2:
- Dropped the drm/msm/dp local .shutdown patch (disable_irq()/
  synchronize_irq() in dp_display.c)., fixed this at the DRM core
  level instead so every driver benefits, not just msm_dp.(Dmitry).
- Link to v1: https://lore.kernel.org/r/20260717-dpshutdown-v1-1-b062c2f7dfb1@oss.qualcomm.com
---
 drivers/gpu/drm/drm_atomic_helper.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9d006f98413a..3a23777aa00f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -35,6 +35,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_colorop.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
@@ -42,6 +43,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
@@ -3676,6 +3678,11 @@ EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
  *
  * This is just a convenience wrapper around drm_atomic_helper_disable_all(),
  * and it is the atomic version of drm_helper_force_disable_all().
+ *
+ * Before disabling the CRTCs this stops output polling, masks hot-plug
+ * detection and suspends the in-kernel clients, so that a hotplug event cannot
+ * probe and commit a new mode once the CRTCs are down. Polling is disabled but
+ * not finalized; drivers must still call drm_kms_helper_poll_fini().
  */
 void drm_atomic_helper_shutdown(struct drm_device *dev)
 {
@@ -3685,6 +3692,14 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 	if (dev == NULL)
 		return;
 
+	/*
+	 * Don't disable polling if it was never initialized
+	 */
+	if (dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_disable(dev);
+
+	drm_client_dev_suspend(dev);
+
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	ret = drm_atomic_helper_disable_all(dev, &ctx);

---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260717-dpshutdown-047912fcf60b

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

