Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822003A0EB8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851467; cv=none; b=JNpCcIDlWZKa4Mqm4t99O2n14amonQj8c/EAFjFB7kBCN909NDC18dJuTZFqq9EHnzhCZS2jCo8AqOkeDw5ClJm3+xC107svlDO/xIyOwPIf+rSu+iD20hYpAnqHX3HqpdCMFF+WsHMnkQZy+/LK+RESlC5rugcbhc43jkH0/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851467; c=relaxed/simple;
	bh=NIsM6HvCeVJ35nWFFLJNWwCPf0RLm8el3fb5T4Hse0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzQVSr67GyedmFSHW1qiNrTfYAJ8p0fCCDvIOjOJ5+K6neZYkybFCZ8Sa+WahmAXDbWjnxThwFwns9QnOMvtI7qCU5gQRCB1B9GX65/1FOIBtA8TDPrEi6+/yRAS9IgWIUA2Oa5YteJgNl60qiEBA67cuax4x79TMecgkwz5+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8Xz7Zdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h46C9GOJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8Xz7Zdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h46C9GOJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M0xH2172912
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=; b=A8Xz7ZdyAkeaAwLJ
	6UJTfNONpzJAFMrh8KS8KVLccPftP/jj9BYeLN6w3C5lLW+yU05kyDq2M+Q2x7HA
	wffZqzsPYWTHg6fBicjTyFwQh8ptakbow0VCAy/m8ElHElu/jX1xtOrqY9Ql2lHn
	DELf51Il/pj2k2HTv9VCHUnK0tpHJ97HLJj36obqum6KySg/QhMyM2S4Vg0isEY3
	whyaf5Q71MJN44Z6U0Hm9LVRk0PLMaGo9oDs0fxiP1v6tsth7TF/jS1jHjkYMNzi
	amB6BKRO5jkeFlr56FacfVCHu4kabvoklPzO0X8HOmICs3iFkmMuiIQkWFjupB0+
	pSFm/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj69a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:11:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so795143585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851463; x=1789456263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=;
        b=h46C9GOJKkGWjaSd8SU2dUE70+ltaQAm5IjTPG+F1Zcc1AljTnO9Nl1aVCBWmOdKJ8
         cCn2LUxWECYMu89Auej1iTLXibJzXHVK3hCvwvhIvwga9E614x7Q1uX2B2k7PdxfmzPL
         DfyYyRKeeDhpky6BIoGqzI5Rlmpy8U0ASm1jwk2VIvobJ22pBrvp+SVSiPTZPRrrEJAb
         93Ua9rfk+ajLI/Was9U587M4kvN6nTYxTwUamM8pUzzSFZE0FDBsaIaz05VijVLYxgpN
         InEG7RktySbWtxpjJpCYQye2/Eqiywp1ewwWt/9ZPO1nB7jG6R2wir3k2Qi/mVRzQHps
         l3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851463; x=1789456263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=;
        b=eTmDsc23v+V7PpBU49JYb9U9b+jwr1UKRQTmfjIu55kH1nFKO3OP2uQmqDK1Tupw6x
         4XzeOB3iVQEBfIj/idqi78x0ye9Y5Vt8HzdDp9A1fJB0hxRezE9HLyop4LKld8AJnfpj
         LhqdjQv0h1dvHO+GckuoOqqYFVq/sxPNXZjxgbWaaqh9bJC5N7USw291lTpB1m90bqBQ
         Q0FjehX+D3dGHc/cabxsjPXicDmcef4Ogmp8eYTnrTC5lLVZKiRaGDplP0/npdLJXyWk
         q8zsJtye7AX3uzhf/t8n84C0Iyo/hXGp///0JhEhD+uKp1qnsqJY+AdxRFxjIfVZUZW1
         98NA==
X-Forwarded-Encrypted: i=1; AKwUvByvSws2iSBYSgnpPnCLcFvLLMgBqllBb8fBQaoD+mnAVVxHBJ+s/6NPWf/7qqIyATfNzPjG2Jbsj/b7WTE=@vger.kernel.org
X-Gm-Message-State: AFuF++lGCaX0su4ICXTbvwfZE4zLTFPS9SKOTksHQgVTl7K0fW4NGXqU
	fDJcfK9nHT7wauVTxnUHQ37t4pZHh/kLmAVd8KFu+hLydYikm9WqfK2IZDNXLQRC9kggAH5Sx3M
	Ocuf5rIS6jbndU7JVZbz9YjUjp1wFQbZrBPjdXY+UklTCdpLlFMqaEtObiRcHchx/0Ns=
X-Gm-Gg: AYBFou2Dt9FHyfy9bN3pGsAjKymUAOK0FiucjDa0R+1+7oLTPw+99nszg73FZF3JjOs
	6DqIav8SvQTMtclz9mzcqdKcSBSauh9Yz8HAt7yu/3w8gtPqLCkJOwQFb4LfsfJ820r+oBgWBgP
	NDtSvy88rKNDwvLSIFbf9AQiT4ch0xnOiPqcjm4tgnZZSOX1nO30K+o62mAQvLSZ1AoLAUs6Dif
	NRZxnwaceGwXHQv0fs/TB0Sseaaw4vNRc5MEIN83LF/ddJaV6cKLTgMMd63ul1EzaSfYjTv6HSY
	yvWR0s96+PXloK+p55jfQcGgYBEmKjKeQbckdFsNpVYZRtYUILzsRBfk750O6EJHlfVC1QSanUN
	uVgaPzOx599m8twL31+j9cDc=
X-Received: by 2002:a05:620a:3941:b0:939:c0b3:6d8e with SMTP id af79cd13be357-939c0b37c88mr163058085a.30.1788851463464;
        Tue, 08 Sep 2026 00:11:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3941:b0:939:c0b3:6d8e with SMTP id af79cd13be357-939c0b37c88mr163053785a.30.1788851463045;
        Tue, 08 Sep 2026 00:11:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:43 +0200
Subject: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio cleanup
 order in post_disable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NIsM6HvCeVJ35nWFFLJNWwCPf0RLm8el3fb5T4Hse0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T5bK0YomfryI+UZIU9Qa8Ma7aQK72X//AJY
 Ac8FAPhtiCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+QAKCRDBN2bmhouD
 11jbD/oC1+H811NF0TnKCwrr0Pqpxtgsk21hz36/GUYUtCUHvz7fDXG8dmh7218pz2qYSqvoC88
 Fs0i81yoVdKcsd0TNM6v5wPYMk7ec2+scAC7KgIrxiupAFdnOpTHSLaGrg4HdnkHEZSKAkk8uoI
 XptY651pioNBvNz4rmjACNZU2Np44zer8aWXSlGtz5vde/AuYtqDAkHL//3d5Ql3NVjfzWm1rUH
 YIVqzbexMaV/wvamlkAtxr7J+2/el42mgj4PTMLMObB4peGbMpecUXzOtXtadDO8Y/AXMiwiSVX
 Y8nIO/GTvvtkIwc0MJseXE46JbLdt8gQngmADmIABFpJ4JRoa8zZJm+G/1gRVXxauruqgfmyTZh
 gj50iQGe+1Fvl+2vQ6KZ6L9fzJLmoCnrxRu9wAgDAcxeZWrjcW8FiUczqNBffcDrvymBAcjmSe7
 cMXARBgZdeiu36dNcnfIOXDRftZ41cDfZtsgl/UTGDhq7KHPIKytwwthb4GCepicVpY8Dfne6n+
 NoCD9oQCo02I2YO6Cqo6YEdIZIjhhC57rOmqcyuthO41K73DK7R0Oyk66aXdRuRLqSt89i45NUj
 2b9t/EAon0M/ik/1j4fqZBCedG1Y8BVikzqZCjMBLmzrXdGS6V+QegloQXByLPIDHn+P8CIAnxD
 4eAOjPmEhxoWy4g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfXwYX8qwBgnotk
 6t69YNvnknqyDcEk2+IdhpQC+2/h8smIfhyRPfULLIuI7shP684uAZMpYyV7Xz0FL4HrITFr9Bx
 SpDQVX2uCrLgMNs9JK7d5b+zBxM70hg=
X-Proofpoint-GUID: HiIuSmzlwEc8sPN9YcW5Mtx4cuNGp_TA
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb508 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=agfB2vzvzBSRJA4gfngA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX3A2SK061Vrwa
 RQR08izRq0WVqaAvxtB/9sgLloupgveJDnf2ADuZ+v5NfZW9niKPaRL/IZUdsVzY7+OsHV4kBiq
 PM76kV+AJ9zOnKdc6LrxdpptZnv7gaq1nSYFtBcgwOmMiDKO/DmYHkPhFxCAkGDOy4Qg9OdJyn2
 pgTOxM+tCgf73L51GbCMCF4BC00bIY8N+TZDuY7z2TXoMWDZiiiyQxrWf3iQssyJd4BTmjHu+nW
 NT4TFkiSpLi4ACsZz2QnvMl0foMS29QMj/j0lYeFy+epGFLrLyrUyREIrEIG8myb6PyMFr7dVa8
 TkJaWNxJof06WGNfm/50+rVRW1Hq25RdmV8bo9oq/zI9PR9YRdrJ1wIZQDIdioZ0BB78SG3X5Tb
 4hNrr/IQAq8M/q//i+1JgVJtY/3mKWkbkreLyslWi9swGUJdeMoJVddbqwzhSua9UaTfeNLvDKP
 FA92vclMaVHcKpZ4OsQ==
X-Proofpoint-ORIG-GUID: HiIuSmzlwEc8sPN9YcW5Mtx4cuNGp_TA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
follow reverse order of powering up, not only because it is logical, but
also because msm_hdmi_audio_update() accesses registers thus block
should still be powered on.

Depending on specific timing, existing code could have accesses to MMIO
of powered off block.

Cc: <stable@vger.kernel.org>
Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index db85400e574e..1860605850c9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -339,10 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	msm_hdmi_phy_powerdown(phy);
 
 	if (hdmi->power_on) {
-		power_off(bridge);
 		hdmi->power_on = false;
 		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
+		power_off(bridge);
 		msm_hdmi_phy_resource_disable(phy);
 	}
 	mutex_unlock(&hdmi->state_mutex);

-- 
2.53.0

