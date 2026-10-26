Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995872;
	b=0d3FWLA2nwG8Sw9mpH0l0304IjpfKhatWlPXrk7+jmzDfu2n+67mVyvxOs+zInMWt17k
	 hvkaOqBL91DEgVNvpkmvOiXkdg3oitRgiS62JXbBSZpjxVLAFfOXnx9SE7u5DmGyUqWkX
	 2kiqnAgqcdv9aJHl7pdjGHLWhW2GOKTNEYvctndaMQn+HvJOdEKVgrmBexCV4pYFjjLfO
	 KHhyCsyiKpQtZA/tPCHx7uTO+kOk3mlZ6Clt0D/NFuiPQ9UkcSyhc9xWrr2ICzKN7A4ev
	 dC0pKXeTjc3Ji64D52UTK5m2DUHnVbv2wk2MfnivfaXiJit9w8XKV/yu1Okj/QGJxKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
	b=xBD4No8LLucgnIgtAYOT2Vl/S684NtlyIuGvMa7kPGjXe2r0AawN9amsqFHKWTaQ1cf1
	 vo2l3VmHOccw5m7N0kdH0jLEs1drlaVxpboFYcw0ODtKI6gctZDwmLqyq2478Zbf/B2jz
	 19msaUsyfYZr420gkY7sznoBenKC068vMLPQwZImxyfVnwcGaOsc/eJUXU0kEOECLjOL+
	 a6CLCHveuS8egZtGIfXgou+5yKGuCyiIi0dlk7Coa1XoKreZdljtnNUxiZOWGSGv4SjFl
	 w93Jvf2MEhFPMWmEr/42eWrblcwvOpRy2byWPNdUzBqlTZ3AiSjW675CWIkuQo2pPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B53606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9Kj718219
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=; b=Kl3hjtqHrbNM6nOj
	xuJncX+4ETr1rcO1gtaxpuptG70g6UsCA5K/Ynn7toA8YQqwLAy/rYiM47629XK5
	FrxT9GKcl4jIDO3QYrJjHf0rmW7/TBkxY8LNm27cc/2M+kLf9xUaMPfpZCKaksQ8
	kTGZOmq+fzP3GAf+oxwvMKa3fk4Iz2b83SLTGaxF/IgvbsijG8Pkz3eMB6OdnTfF
	BWFoH18dsmGDfLW6vSgthw1Cqs0lIw2PJ5Dgnr4AokMjLycCaSVw/rBAxdWIF8dt
	pp++/eEl7NDUU9zanBQvzCzqu4fe6xQ59iD9j83N7ZiGe6b9kjdz2eCctfkNST90
	iKJsPw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgss4q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1573769a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995871; x=1793600671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=gMgwdH3ocogguiUrgPPXzqInvr+zk7ye7ZJtSetB+sxMAxm2VtVRKrO+Da3gwo64+N
         PjCjTkIGBmDcmLaGK/FUI14diip+KXo1/mSgeHVhm9qwr1lpzwMgYKqLyTor2ElBBS84
         mMXiGJgz9Rtu0VyoAvnWV4lvE01b/sQEUDp2xL+KDyBJGksIa5LsL7TY2XWMnkyc/dve
         ofwbOcrys0G99P/zB8hQ/Bo6Hn7UD8DFOtSiUPdD/i35Y6XTn0YzRPZO1bGqhR2kZIZJ
         nlilGJDlKC6mF3IWvCpbIb4GM/SEN79fVCJCsCj21pp1msV0/iIvCGpXPtLKebTn4PSD
         znEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995871; x=1793600671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=Bsjf8aJ+Ah5kgUo2vOTylUn5qhOKsnOs78HlcOtTFpE/ubgwoiDbjJHfGgBBMqdDIU
         GxbpZjkOiYB+pUnYq/MGtDP5QRiF5lFZ2EDhARAs5Cb4LVasoanjzqDPqRHkRKU3sJJ2
         s+ToiXUukeEQZtYyBobH687tLg9/y+y9e8gGKbGz6iQL2lbUBr47m4RwEsGGwQgeM86x
         YT3hzmPPlBfcfx6TtuAdvFIYPTj9Sk0CO0yCZNOqoAgeCR/bHWu/7/ZR1MES9XpzpGT6
         41saFiTBdmg8Xts/dY9DzLzYI1jpG/M088AmYe9PpzJnT7yficqhrUmX7xEqemCTYtyz
         T5sA==
X-Forwarded-Encrypted: i=1; AKwUvBz4pEuHh5l4DiL521RC0RymuIaQQdgnUHSkeBBg9/LWgLIsMToqAXj5QWZ0bg1E/Jz8VMx3hEdZ4edgCwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEs1CZDSbRqGyGPZjMxFTRDLAxw5XsB3AQ/Ri9v4CCTTtVLXbr
	dc5YJtJfSkufTRuSnYkKXlLqsHSphTjsKvE1xoB5FRY7Lqg7zG+bB9mTFeq6JU5jEdDwLKqGAG8
	rrrj1fqIjPKbAJACWdcRD5S89pgLHtvVbdUFub12ZYMm43yyRBcXrbIPng3F4LKYy1Js=
X-Gm-Gg: AYBFou0FBg30yF4fczl+9T2wD1DrfRSUQsAz3wVFDfoE11AOCmyHP68KlzzpYlqZeN/
	lRp1G59PVEyXYJcC7RcjIf8/a63yDgGNUeHFqejTBwbxYbXCp8tsou+pH0ZVgwQgJv/dAxUcIcs
	wRIz02FWExd2lVT4umkAJFW+AfDaGh84eMSp/FZRHRB8PXHAUuKt1gc40hcGkFhiZTLtdEN2vTp
	uGNO8y+kBMavJHi7/NIGYW3vweln7PR1lKHVQ52UBQoq3dZIGthurq2cHVawfH/eac4l1Yu14Rc
	IGxc0KpUONuh2FnCgtITcmXxbAMvlijE0d9Dr3HSBur/Ckdf+h8nr7m14Bjc9OrROEB4mULOlc/
	egWwxsLXZ37N3kVad3IOF4Ctuf7tJdluYkQ==
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780235ad.12.1792995870978;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780015ad.12.1792995870524;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:26 +0530
Subject: [PATCH v2 16/23] drm/msm/dcp: Integrate the DSI bridge with KMS
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-jshekhar-dcp-hlos-v2-16-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=4407;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=YkElIL2VP9q3UDs86ECzwDFEF/OyzmGpxHXTXDTkMBY=;
 b=dK6ojiOmJgJpI/PfAGPWySwWrv1PqCpsjGAfv4a+OAjHAZ2np/K6tzX6Lr5Vz7Q11ykgxlBBr
 N1hOZCgwbYoDaTZ7PMa47CbVwaPr/4ZRRrA8jHmArpW87PZxJe5Cdu/
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX5C1BfGlG8Nfh
 fbJIs28deXO24hoMbb+fESRIZcbOCp9EY8dRiB+cI00ZGw38NHimmYdiUOSznx3ds3OHZuVegTX
 tN+mNla/X9cp0CRIUXQG/HklSraxsog=
X-Proofpoint-GUID: Wba_sOF87oheLmUpJ4cPti4bT3nywvY4
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adef21f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vhVORTM7vdiWvPRSmu0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Wba_sOF87oheLmUpJ4cPti4bT3nywvY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXwE5Vd71E0w9Q
 ZZTtXm8QxqBq6iiwI4fg81JuIo4/e8hcQUgqpMdJGWOZfIxMSfzeccfj0EINb12K1JesW4APS7S
 1qDmIc4gpVGtQPzO59ccE62GvHNXMh/+SnTMI5epYhCb2fYLSjPnYAskS6GUB2JzxNQKDTe1rAA
 DVsNPZPq5Ua0jG0R9GkJjVQ5Uw9PORIHIkYgWfnu4PIG/8KcAM5aGVHUEDdt7tnIdxFXDCka/6/
 qARRbs3ri104tDLoZyyQX/iPMIkcJwRoEICZzKofLA9quym2XOnMlEqx/Rmv2k2Uh8DhLuW8XJZ
 mXsynPjveeSPQoZfI/9VX8s3bzy7uZHjB+BCKS40JDM37jM2LxF26Pq7cKXOSvhxz0CSnmYh4jD
 +Y91+jnj+iSqUtTArLWNvpedlOQ6N8b1U+MgRGMW7cBYq278IADUFGFO0oPc2p11+s6Qf7GT0Yx
 SHivigzJ+s/SEiyYbaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Connect the DCP DSI host and panel bridge to the DCP KMS
pipeline. Without bridge integration, DRM cannot create display
sessions, attach connectors, or run the bridge enable and disable
sequence for atomic commits.

Set up and tear down the bridge and CRTC relationship, pass panel
configuration through KMS, and connect bridge-backed display operations
to the DCP HFI commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_crtc.c    | 14 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h |  2 ++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
index ec4f74c2920f..173a07df71c5 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
@@ -147,6 +147,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
+	if (ret) {
+		cstate->hfi_error = ret;
+		return;
+	}
+
 	if (!dcp_crtc_get_session(crtc, &session_id)) {
 		cstate->hfi_error = -ENODEV;
 		return;
@@ -559,6 +565,7 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	const struct drm_plane_state *pstate;
 	u32 max_width, max_height;
 	u32 mixer_count;
+	bool needs_dirtyfb;
 	int num_planes = 0;
 	int ret;
 
@@ -569,6 +576,8 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!crtc_state->enable || !crtc_state->active)
 		return 0;
 
+	needs_dirtyfb = dcp_dpu_kms_needs_dirtyfb(dcp_kms, crtc);
+
 	mixer_count = cstate->topology_mixer_count;
 	if (mixer_count < 1 || mixer_count > DCP_MAX_MIXERS) {
 		drm_err(crtc->dev,
@@ -598,8 +607,13 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 
 	/* Limit visible planes to the firmware blend-stage count. */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+		struct dcp_plane_state *dcp_pstate;
+
 		if (!pstate || !pstate->visible)
 			continue;
+
+		dcp_pstate = to_dcp_plane_state((struct drm_plane_state *)pstate);
+		dcp_pstate->needs_dirtyfb = needs_dirtyfb;
 		num_planes++;
 	}
 
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
index 44b1c2200aee..61a4d8565359 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
@@ -7,6 +7,27 @@
 #include <drm/drm_crtc.h>
 
 #include "dcp_dpu_kms.h"
+#include "dcp_dsi_bridge.h"
+
+int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
+				     struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge)
+			continue;
+		if (dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return dcp_dsi_bridge_prepare_session(bridge,
+						      &crtc->state->adjusted_mode);
+	}
+
+	return -ENODEV;
+}
 
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id)
@@ -19,3 +40,22 @@ struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 
 	return NULL;
 }
+
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge ||
+		    dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return bridge->dsi_device &&
+			!(bridge->dsi_device->mode_flags & MIPI_DSI_MODE_VIDEO);
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
index f8010fc5d32f..333567a78ad7 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
@@ -44,6 +44,8 @@ struct dcp_dpu_kms {
 #define to_dcp_dpu_kms(x) container_of(x, struct dcp_dpu_kms, base)
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id);
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc);
 int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
 				     struct drm_crtc *crtc);
 

-- 
2.43.0

