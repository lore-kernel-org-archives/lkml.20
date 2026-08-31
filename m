Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7C3D8911
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164368; cv=none; b=MXYz57B4iAhKnaqomTilPSazor6GId8bGckMoF56Z1soOopKuWsBmpbYJ9yrAp7SbEemb69y/aEsLLW5AVC3EBGJi5nrH2hxby+D/DnkJxSVVoWDmUSSMgyHWjcUm9qKa2dQZpDUwRBgZ6cn3U4ISyBdOR5zxGvOkXYF54CKWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164368; c=relaxed/simple;
	bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fo5X2G8McLRVynmZKieTTnP1av/8q5lWIwe7+LZmbncNw+y1keZqYpTGl77gJzaRl70TypHg01bDCR7CHBLvQdzmtBK2Uij7fiZqbcYv8NGmmHNvoZuLbSjSfpyq4qGZXmoSbyEcGLyaW1Dy9ocIhjAGfV3tzQ45D7VmPTKVb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUAgg3rZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdpzY3dF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUAgg3rZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdpzY3dF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xg5G2924471
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=; b=EUAgg3rZBgh67bMt
	n4V6hNOyPmFmvSHgoruagyasxqNkOHEyg1/72ubm32C0Z2jorDXBjJZ5Mkk92gas
	hv0clGJk+bXqMwbt1ifNqAnghIVvxqvq23dztsmCYi6tGQArxHe6VUhteGp+8JDc
	/b9f+8QEyDCLwXe0Apzu5Tfcru48AF+qXJkMabNNPCFadgSwr+rxwIOofQcQCVlJ
	IV8515sAWuQipEtj8W6a5ZKzArdOp111gwqCTsAU3JCFInopTWzi97ZP3C3WOLJy
	yfxVGoaUPcZdgtLDpL8f74IkLZSWVnGZi+NK65eCzKEpHcI4GHf+GNwIzB88pbyj
	PzJKPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9nrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so544934685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164365; x=1788769165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=YdpzY3dFRtEr6rI+tcAnoBQbEDxiHkKymL8R8OOSzKqHwDzTWyl65v2SVE5fmMhKVU
         o/CS5JxaUMfgo7eHO4yC2DSnZPzDZVr3np17rub5K4UC9RsD8DWUT1x6070C21U/mnfX
         FRhHydWHVwWYl5xVzxO7/PvLduHV6/7WrIEYnyqCrA5F+qA1XvGHhy01EWMW4tV/9hyp
         VICCYsH5f6p9tiqn08QlXqpEWIwikjLBW6Bzciwnjf0zSVDkvtBKr3mGLc8dPf9wbcKR
         POE2gu6oPuFO3Jih0iLx52U1PtHJfOl76CP8TpK7tQyZqZhyjdfuJ+p2hQfp+Hze0mxg
         /3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164365; x=1788769165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=arqEmzd3gp033ro7JPJbvJkRZjVdAD65bThzL62NQmqc9jiwP0BP18PLdWbQN+0YaT
         J/asrCATc9QbCqnpb6IzT4gzmij+grYuDlv/iwS2U95Q2pQ21fl6PUuX/44Ie5xilvcJ
         Ii9+oGiMa/cVQvm7us12vhm3FXQHKLSurTJKGJwMp+lX8N+AsyOl4C67jHJouVWU21sy
         KDU7y7Lvb57gvW2YfkybQPrT0YjulM7FE0pSJYwS6yy4gpz8TEy2+xt5n3gx1kHyzpTh
         IemSj06CjnQUAzpQngjnDKWMFwul48P3yTSkGBIytnbZ6MQXcZQ/72rbB5H18MlgRPbE
         dwOA==
X-Forwarded-Encrypted: i=1; AHgh+RrpNue4/p7Vc0bHLCpA4GE7yAtMmVk2s0K90Oa9y433/+XSdRLeqTNxGPuEVVSJ7Cc5fYJGe/kvWJWooIk=@vger.kernel.org
X-Gm-Message-State: AFuF++nfGQ8NeADNjeuQQ2OKp6FGXassLmFc8XUo0IQmyJzf44NJqzdF
	xHV1GbooEAx/9QdTXRhzV+H1MRlPHdScNRObFyKOYSX/R4vVt7/Ij0JTw1VrDDdGGHgK8z8D8xd
	hDiFSUHqSh/FlB/i/vpuf4IVQxajU1/zKqsTKAbcz3Lrg51bMIx6naOzjgbZyY3hgxaw=
X-Gm-Gg: AR+sD10u16HmoH6mRf+WQ6d4TN0dzU8eNTSbltEvVreahKqFK3HLzBuSeWVWB5szjti
	c+wahRt2OJrXJ7zw3mcBTDK/eeSsSxgDf8BH44zbLp5CYwei4PYGrHK6LMSvzSl/26zq98Y6rlC
	W3c8LqBqB7MZnoUfPuFyU+C80031JCZErF2pPfxwC3momWeibDgJ48fgxDvQe7Ak5ucgWe/NhHv
	vqIvmVDqlMCNtA/X97HiCPzSP/Xj+4r3nafrHuJ5SmS1GkOY4pdaIuJUvSYl6wLDX6e7I7kpzUp
	hMxk3BdOzNtbI6bGHtTHUuw3eWuwZ4//RvG8YLHRHaUgjEei9cS1ccjGN1Lmd+bYAhSOQgs/uz5
	+jga1/QE2Zzb7PVa4e2pyA5W6NQGkA0Ya50Ix+jkDQdkyIsjxdrY8sjV6R+81IEY=
X-Received: by 2002:a05:620a:700f:b0:92e:5444:9274 with SMTP id af79cd13be357-939139477c5mr2842288185a.30.1788164365485;
        Mon, 31 Aug 2026 01:19:25 -0700 (PDT)
X-Received: by 2002:a05:620a:700f:b0:92e:5444:9274 with SMTP id af79cd13be357-939139477c5mr2842284685a.30.1788164365052;
        Mon, 31 Aug 2026 01:19:25 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:37 +0800
Subject: [PATCH v6 20/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-20-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
 b=GFCIg6TuUI4SMExx+M4fD8R46ivwwCdbuUkowW6DnjurVcB4pw1J1jwhP/VbhXftm601RKrUb
 /yHJSMRhzA9DD99W0+J4kq2dcH8QtATr5oKzfwXkpBlprMKrVjLJ28n
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a95390e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXy+L6svAyL0Kh
 w3sPpkGrEzwHTpTfDC8lLUzMk6agg8VMOXTgaYsX6JLgVVT6dKlkHQU5jyna2plmDtZxhwEBbwt
 o5Sg94idXZJazsjFsulgBvSEDOK/jjY=
X-Proofpoint-ORIG-GUID: twYlL6C8yJjcQCNcQ1hXbX1TXI58Tlcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4TzjXJv0oypG
 zptAedr5lqqogNEsp8jkdU+lXZpeeqIzl5DJKZTXra8/t6WAkiPDlKhjCTf68mos4cEPhQFx/uT
 tjwnCFFzgqiVXQBaNiEu5WTh53ehMx797wRk3rMmNBbtyuy17QDPEbRSn6pEPWUYnEPmidinwsU
 cs1aEQCwTIL1kOLZYoCtZC26zmzoJ1DfqawyqZTpB41daUG41itBeKsoMkqQzLGsqrM3oESaWAo
 G3OWmtwxKYC2rObLxg9P1gByCv+ok6/Bs8rElGgPt+mZVJSGpNA55g4pCRV8eThKhNH8AvkFcqI
 lqds6WvoAyjxm4tLaOCjWwN6dXE+kBSXyV4VJqtM6QZ3dwBLMulb9PRoZ+Bj9cbuC2J8SyhCPu5
 cnSuQB8G+jLRLF+n8jfDR8OzLh72eH0IkphzHerfAkz+xlzPAONTKyhZqj1r8xVJIZDQI9Hruzl
 AVL7oi6+8aJnV07CPzg==
X-Proofpoint-GUID: twYlL6C8yJjcQCNcQ1hXbX1TXI58Tlcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..91cbb0ca521b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,15 +1437,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2674,8 +2675,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

