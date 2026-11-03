Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668495;
	b=xCdZsjkIwHTJVsrP3KLiURU2BVLPhMUAyfspn4R8V3DhJGRZJpHraFXMvqV4rKdu4lt5
	 Z9uxDdNJQcvpv8NzNFcXNTwUWg6DZ7Yvzp1bRvrA3UwI2FiF6N9Wb05oh7K63YyutsTh4
	 9ZMnR02k9EsJHatTXMmEWFGmJH6DHQ/C+7r1S7NT+uBP4bUjwpkznYVFupmvs5slgLzlE
	 Holhjl5FBXReQ3JLM9ajO7WjSfXrCDA2LIj89Y1Cj0Id1PybTO0j8Gafp9dDWYcnuRocO
	 +t3paNE7smKeimniiYAOEO1F586h6oPzCw2fe/BR1HMWoijr+0Xvf9/+gEbl1fG2aoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668495;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vhZebFMAV/37Q8Ul4WznVh0sZy8Fsyqjx3AjF36kyDs=;
	b=KPF/6dx2eXLA73ZQ3y6BUyFFCJRb7XrvE9yzj+P73XYK6w1s+yoHT1zYzdXcmXPf1wzg
	 F+wrrwCUXoBQtF1kus/eSProGX0ZM2+5uVVosj8wHjvw36Xg/eyq+Swmt5AAjT7gMrDDA
	 MdxwIDBi1GYpwK47UJr+BErx1jRV1r+6MV4ebw+TcqOUucdUw1fxTqULR7+DWwEo++Lgq
	 zOxV8vJHmm1icjKCQ0aL9GF5RTnj8897rymuALurd7Ttmq6NHAREtOJIYE0Cv4bhfJ8HL
	 IuBHiZyrFpF3hV+LUINN1doOFky64/5wbS9ekV2uvH9oCCeDnHWq5PWi3ocOzEq/hCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=MC4f5n9s;
	arc=none smtp.remote-ip=95.215.58.192
Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00A606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD00A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=MC4f5n9s
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PyNL8gjp2rq2sflEJRFFy9EFUqOqYvXNTkbF/sF6yYo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668493; v=1; x=1794273293;
 b=MC4f5n9sJZ6mm6oZD+v/UCG/sSCrKLL6V+5YnIUYPvaU+YORHCpptHP1ktcWwKwm5aMHfk6x
 6VrCnF/bUiMJ1UqEO4j9hiHmpBxvaVyCan4Q01+wRvMObAd7JkCgAutCn/lzxaZcsayH54XUyBP
 MDcj3H0cbiolN+bG/QuzG8moLObRtgsaiShoNJlLxFx+rzwmRZ7YTVwY28Pw2kLjF+Ktoe+kUxh
 4TjQ33iPfScT9lsjwGL5LUJYIuWs1aRRoQf5ZxpB9ntys/xCyiburCj4WTZGBOMTF4JEIjDoV2Z
 fC2FwKuy2id8WHIVDOAMnEiAKEzN2FU0bl9EJ8aQeBZLg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8699ddd40b28f71;
	Tue, 03 Nov 2026 01:14:52 +0000
X-Mizu-Trace-ID: b8699ddd40b28f71
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
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/msm/a6xx: Add GMU_SP_RF_CONTROL registers
Date: Mon,  2 Nov 2026 22:13:52 -0300
Message-ID: <20261103011358.65398-4-val@packett.cool>
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

These registers are used in the a680 hwcg init sequence downstream.
Add them to the XML register list in preparation for importing said
sequence.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 786fd7d2f674..11d57cb52ede 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -42,6 +42,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 	<reg32 offset="0x1a880" name="GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL"/>
 	<reg32 offset="0x1a881" name="GMU_GX_SPTPRAC_POWER_CONTROL"/>
+	<reg32 offset="0x1a883" name="GMU_GX_GMU_SP_RF_CONTROL_0"/>
+	<reg32 offset="0x1a884" name="GMU_GX_GMU_SP_RF_CONTROL_1"/>
 	<reg32 offset="0x1b400" name="GMU_CM3_ITCM_START"/>
 	<reg32 offset="0x1c400" name="GMU_CM3_DTCM_START"/>
 	<reg32 offset="0x1cbf0" name="GMU_NMI_CONTROL_STATUS"/>
-- 
2.56.0

