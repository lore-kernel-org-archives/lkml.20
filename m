Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A43EEAD7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656038; cv=none; b=nV9PQmngtfkEwfS5T6SJZ5P1r9tapxB192ePem2Gqb07T3FCao6vOkDVP43vRikNBwTxRBfysWDw4j1hJxQcsgFXCNaWgr0kpb/ve65ML5bHOeIz1fs93ALEFE000fGkfn+S084D8H2P1cPp8yYz7ZtA7rcD0zJFvTl3cyFJlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656038; c=relaxed/simple;
	bh=ep+LQunqvDuFKkYJshXFJLSFrgdqylN6OzBHcFg+RUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPrO3ugPhY/VtgkHuIp736ncDfLHVSZcGnDfoSs3BS7XhjZnHQ33R6OYb+s29Yi7l1Xh6QRPpKFqvx4ZRYXrJbp+gqdhOAJgAjW5Mp7+2BM7OGbLo6brVuhhAGbRhb5qqwae0jFoa0V8yodoFQYm7aX/jZtr7n3yf8ttqhQUUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8nIrBaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJeTXLSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8nIrBaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJeTXLSk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47e6D4052902
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=; b=S8nIrBaqZAT6zR0/
	ij379S8x35yUoJJr9fP+l+WLN72Vej9XCAZaYNjzjGI0ufr1YUKyV8LgGz33RTqV
	qapHgkCteKLLQM5ChCF9pJkQgqjaS3M049xn//ME/wfmZXURtD5SDrp44JR8XJsX
	oKPxSgxmNqa+0Y+2M7Ta3KUwVSRf4dsRlmSYgpa4YVB2dJn7KoSzqmnGJIX0fv/3
	bxYv3KzB48MIFxstr9DjWiuNxOWIYSEWgXvMExe/GUXu9Y3OOMgt3NHf+/Hnef0P
	qTxU2HGQjdV67wmhU8oUp/Nxvlq58n54u9lo4+H9ovACvMAeHiSsKQDB7BGqKlkY
	s0ws9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxg2bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9143d796129so64809616d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656036; x=1791260836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=kJeTXLSkIceP2WPANr0rLC7gHjPuHAJyIsNLjv/zDTMPqbsd7pos49nWQhC3vkJj+m
         ayXnJkfr9jqMktB83GCPl8DjXoAiFV0zMRLW9nD54d/9wMQx53/TDTqGn7xGEHK9Eu7a
         CFQYPXHKvoJ+BPrW3N0mgVkxS5XoPsDcuc+zRms/zJ7B6Cpxt+7MBg1tSHSw8YG5twre
         gQy5kdmsjaIcA0P2TIBnSjLtit0A7o2XhAK7/cdYsj+P+D6eNgAYP6MoVTV1wPuCa5xi
         YX0FDDC+xAGKywZURETVq4hqWfKdTurBInQH1q2JK6mMHRexTK2pAoQOM2jUQjJBAxjF
         7RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656036; x=1791260836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=xskTM0AhmzwyJ9PlI35MLvqfMlVLksc3ntSWipQqSlmyHhtJ61L2kDOXloEMv1SmAk
         /qaH/z/zwXYmiRSUOCQavUdn3TBkaXe5Et7dE0yRUkgT78O+lvP69aEKVVKRHbqQFuPv
         TUwupavG7bHxE7GShaT0WRscJZtUHqrBbHn0MeC/HKlzhANau6tB+X34EWxi5GLNuvK0
         dWYLvwQ5Ld89XU/coy4fgzI152a97bJFtr5Bc7h6ZTr8VL5md8u7iUFqX+Ue9sdROPWT
         aymv5SPpmXpypm8t+WJ6jqPSKtkAZJh/arZWFT+tG9YjZYYTb2Hg3aoiGLGjtueWIGcl
         RFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvDwfmvJp6ai4PWIrCEALMwoXU88mdXRD28wjwxbydJg0h/Nk0X/9+aiT070UlxJsd4XV2OY+xRvjg92Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX9zDxcp2oCQInqlwcafKvRCOSIvM5xjgEGfALD9eXHl8G4bYU
	duoR1EGht8APGcqngDPZ5vXaM7Qs/YI9tm+r6kUFQKr4k/IDxvad0TVxOa0IXqQ4vWak3pWqxas
	pNnJ91/8o4kgBFRrytzvy4zR1ZF7FrH7S4Azt21rk5aWOLnMaKiXB+NM5c0aP6RNosZ4=
X-Gm-Gg: AYBFou1YkDGwvvZA6uoixXiy+0Ze5e+stoAbMzBcUpUV20MoVZ5IXUSRE8DEnaHr4dI
	gZugVyvp59TV0LcphLgSCLxbpayyDLx95EFUIPkUZpAgyPSc70Y3Mt9jH8RCIXXFUXEICddKcYQ
	LbDqjMUyDapZ4H6Sio3eXRndgcPZbgdO5PRbx3MFC2Ja1dwHJxc1PgHM2cekprC0avfE6+kU+Vu
	N8A/FWP3JW3zsNbSEp+UXzfWfeaqXBAvdstfA9zX0ncRLhvH4vxvnExznLW22LdgvYg9bqNbUIV
	iAKIzaDHrYph3i2dkP3lx5Jvoem7SyufBGvQQmLq4jg6ZvDeahjVghhZeqdk6V+1SCZL1aBTJHb
	8zhMr/IaYYIExe981YMTzJz+Ec5j3h7BF2Z1wqTTk5uV+3TT0cYPu30VYWi8+dIY=
X-Received: by 2002:a05:6214:31a0:b0:912:517b:40f8 with SMTP id 6a1803df08f44-914324b441dmr236159436d6.42.1790656035670;
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
X-Received: by 2002:a05:6214:31a0:b0:912:517b:40f8 with SMTP id 6a1803df08f44-914324b441dmr236159186d6.42.1790656035287;
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:34 +0800
Subject: [PATCH v7 10/35] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-10-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5ZzC8/kHjYiASM/nz9B0eCAoNtT2xRTSonPMA7SeVao=;
 b=3Kl91+chLdEIrP0RlrnuzXJaUuqTMx/dlvGg9HJoRZVD7BSv/O/EbvOkCnmi/WM+yjZbuDzYD
 Jr+qQA9M02CDbvjUoPiMjGicRy6AhGzrUTQTprW7GTrqxzd2Coqxt14
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXxiEoz22JX62A
 TUGqhAEN6SXGtWDTf+gUYd7UYMOnZndbfGyxPxVn4NHxvRQWIAJ+0cuTXlUzAqbbkJRTaSFNXpd
 FoUonIpbdP5KZ7jqZiePp5hHBeaSlX8=
X-Proofpoint-GUID: 9GNE6y3AM9L8N6YC77LEIfKTa412mzEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/BvlcFKua6Cj
 Wr151D6hF4ilf0meWCtSnyrlL6dvbYgqgBFOE+9HhMR84AvsqcuZfoGs0pDqJJHk5qmQlfU1HjA
 4NuauvkYSX0gQvTJls3U9itRI4ibPVvokj1KyOqjYZ/eg7Rqkst3GXAg9qifzq7jQ3e2KZLabTu
 I7osGe6wcu+a2R49F/s2xSBAZTwkLzPRvPkXbqwztUze9cqUk0sKhTmgP8GpmCLeEsYJm2WAUDD
 lNwZDvE84UWvaMMkosyuD6/AAWOYp33ZdAZYCdxL1yBDrb5NK7GG9bxePKYSXmrmPAZ6q6JdiUR
 qTL+zvl+7AlQcbbTNTf/qsubUVoVXDqqrH9bg3o5aLbtcOwquU2Ohr9zDd6ad51UEd4MSA4w2pt
 srrNc2gNRdw3YrAdExwL7GminR+26vx+PIRncX/qLaOXgjqpQwNxjKPlt2yIOhLSPL4gMr8lDH4
 aAGLXc6GCq6+0e3oMmA==
X-Proofpoint-ORIG-GUID: 9GNE6y3AM9L8N6YC77LEIfKTa412mzEm
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb3e24 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cd6ae0d5372c..77506e840883 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2703,7 +2703,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

