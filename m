Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCFC3DEADB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164373; cv=none; b=lGSE0Vhaxx0qxGRHmgctj1LKXq5uJmSuzd4NSQ6ay9io1LdEvzBronQjTRXua6sDDS/iz62BLqjMe0/G2Dtbp8umw4BZvnDRYL+Jk5qb3ndUHksjewaSDU6qclHc5RMizYbMvAP1pqadsikeXt83lzfzQNiUG6+gQK7DNHB6i7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164373; c=relaxed/simple;
	bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKlOUxuYqdccNpFOJKlayS+MAEGLcrJn3Qtjb8WcUf7JHd10J8nTekorLRPh34v+60yS87+7aBtHW7Hmqf22sRR6eaUyzKcuqEjz5Fi6JoZxYfH0EIbFawKx+FgAfblUKNVUxE/ulGbnnZHTSpozLfkRn/cECQ6z/RlMVyA91hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfZgbNJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cyk3ZXW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfZgbNJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cyk3ZXW7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xjYq2419574
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=; b=bfZgbNJ9atQBSs8b
	vUJaW7rVhSGCT1yWBJdtlr+S9K9SryPFTi5rB/v+5cEfN2oJPHvbMhTpe9UJ/p5y
	3QFRMScVXC/phEtZjD+T59zlJFh6JLQSXFGr0eCeVqsMQkL/EanBertWonmzycog
	y3pDIb7+jTIK6bm8KH9pAJgVvS6z0cd/zlx24Fe6wWUzrQBthlBcRUpOxjrcmLsC
	00IcNdYWClwJBAmiMYP/1OK4vvXfZEliLlduIBeHrswN+9Dbid63RUzg7UwT0QkP
	qK7fm//7YFczwxXgogkTzfUndOmJwMTSpat43XgEyNpJ9pM9nCUOcqjeguvdf3fg
	ilm/Iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nc66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso69477385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164370; x=1788769170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=Cyk3ZXW7PoHsoZJuGm8XQCKagyGJOEKCp+m0tjFyFlZXBrbHJu32e2IImUNCAIOFPD
         HR5LURXNsb638aGVCS20KjGmFcxGMN8dxOvUURSNWsVVyo4W8jQa/MgJZaGeVB6pbZdz
         OOBeb0XW8Kab/iVPiNsZwXd6z+uHl+kMR+SL+vcX+n8b43xM0EM55BWr4OWcPSJUVcIQ
         T0rw7sbKqOuz+Khn8QcYVDk8rc+5UBSlGncFyFMN2mF4ysMlPXWdEuaHDGbwQlcOxHvk
         34AdC9EN3oU7nYkOiVBhFWn+KzuFLnDo741GF4cA43+d03RVoZ6ulhgsg4KmHgb+9/l7
         JocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164370; x=1788769170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=Cnph4Id8z1otRhvM4Q2Rs8389x1nWkvIGiawUJa2UkwpF6Jn8811Zs/Xdi+ngQipIG
         ZVKmpurAbALgxG8agw357tWMphgV0xPSJq3hgHKZqDKGizYoOOSToRf3e50Y8KJ0UTGR
         J+gBL+0UcStovezdiGuQcGakc9bebQ2+kNerRBxFHG8Fo0NBb7jcx71VsI3zGU8Cmoc4
         095pUWhfCRo9PYjxjF2ODYawcJcvfKgoHhQFOTdmU4B5LXMEBFFeGS8sejMksFq/czBd
         Y+/hBr36YK3WRjHUdsJkHawRwwvT3tDYfQo0bQnrOZKkbyXJURlWBB+yONtrhkUrCaJL
         HY5g==
X-Forwarded-Encrypted: i=1; AHgh+RqThUYD6BNPr6VFtEzhJYyLpMmQmg+G6hx6mWOV2C9SJcu1E1NgVWZg7+gmTQNI799ZABqqyYXdGGG44l8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvnnMftnPwRC1FLTav2ApfxnWwiZottD8M/BszT8l8QWchnO6Y
	JcWtWp67btruxs2uvB15yd0RY8ujXPZbD7Zf5t3GdGx3iCdAlSeJD3qqghfD46UsuJeNgzfNKDb
	h8gPY27+mbFOpLPeJ4XIfupt0xpZYEQ2vY6y7YfRtDhB1gL19UFyP9XR/I99BBaAF9tI=
X-Gm-Gg: AR+sD13XFAENSub1Soh+aEPaSn+T3FdtaPtn2FXJrSSEmkp9i95+yYr2UK1BbVKPh3j
	yZ715LXFBiEe4pi+79dpaRdCUM6jeRuwtGGMww5zmXrgH3TLEWlR5Ge+toNtLa/kLDRSsQ4xZvF
	CusiekQKOWHYL9SbzHroq8x1g1SkDpdYbYSBPPjh5faYzdP2iVhwkJ6fCnzOH+Au8BsNLcih46/
	U2lII2tNtGbBnbjabzatywhmCMm/8kQnoJMSxcfb9iuJBT7XM39qCintZICsioZne8OdYA1jaIC
	ykmwsbOvpPbd+nj8exFcDbsuaI6jz2agmKxgRhl8gmJUUrEc7k30W9h+VVyMrAehabqq7aNVygm
	Isop3o7KSSnP2LmUbPJWvVa43c3Rtg8iuRFFEFEOmn4x25vQj1sx5RzwVTR131tQ=
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr2854264485a.30.1788164370276;
        Mon, 31 Aug 2026 01:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr2854260985a.30.1788164369773;
        Mon, 31 Aug 2026 01:19:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:38 +0800
Subject: [PATCH v6 21/29] drm/msm/dpu: use stream_id to select MST
 interfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-21-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2465;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
 b=x/s94i0DeCe3YCVrBsDph3VVcytKBs9B4N168dh61yZiWSQYSPFF6vUmEMwi5j2EF6ftde2ue
 /EtHpwp9m+RA/NZc5TUdReuV4pTaY1MbGQv3Omr6axIuDc6CT8fMyr7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 5GMd_GMh75nblk1LVWIoDw890aBgg1Mi
X-Proofpoint-GUID: 5GMd_GMh75nblk1LVWIoDw890aBgg1Mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX9Qi2h1ndQzl5
 IEScssbxwmgmH6xa8F5Hp2/leHX5Mt8mr5iLAERKsLMMf4vD6IwirEPrqS0MnIzkvALA3yxXpEC
 nIiywezlNZvLCn5SJyCZBZ1rQ4rtHFs9TmzZKbz7ibLNK58ePa/oFvOhFNkuv6W4LBpnRXhl68e
 THilxrC23+c7qdGe4Wmco9ZDZfVQ232aLFH6w5w0E5J5YMQcRUdwt0FpRBf4NR9QACQjLOk3mYn
 DQLoV5sLQl/uwCNQjyZpcBEClAXyeCBPVJmYBQrZgl7d9nqnA0M8c21zlbs4nl3kTkk81JUOCvE
 qesa9NyVjEoX0wnJl3rbctPzyfJ4bKj2blDRYJIUnmb88Kjec/SXalLV9Tnsyx6PCh/cJTB7Zhk
 ZkR/yN8O9IezT30yoJe9jHO+ukUEudhjO//XLfOgsSSvd7d2MSRVnTP/f1ycqXPudUj9T6Z+CrV
 C3vPe/XIEqtmg/xkBZw==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a953912 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXz+lU9HUZjud7
 wRQh9Nkf30HTl6mWsdN6H/Illb96VKhSWDgJoXqmnaDNnaRHxwW9KzwFGjpoTPkSA0QT9IHJWG4
 wR6H7zhu8ttnTbgs5Lm0r2O5qcjUaHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

For MST, multiple streams can share the same DP controller, making
(controller_id, intf_type) insufficient to uniquely identify a DPU
interface.

Add stream_id to msm_display_info and use it to select the matching
interface for a stream.

For DSI, eDP and SST configurations, stream_id remains zero and
behavior is unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 91cbb0ca521b..004d5fc460a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1439,17 +1439,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 		struct dpu_rm *dpu_rm,
 		struct msm_display_info *disp_info, int index)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
 	u32 controller_id = disp_info->h_tile_instance[index];
+	int stream_id = disp_info->stream_id;
 
 	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == disp_info->intf_type
-		    && catalog->intf[i].controller_id == controller_id) {
+		    && catalog->intf[i].controller_id == controller_id
+		    && cnt++ == stream_id)
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e7613..9972e209bd58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 

-- 
2.43.0

