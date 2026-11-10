Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286497;
	b=12m06UxQ7UabKEuTd7LmK4oLJ2pUr6RrV3+d9/ANP1FTg6g/vPK06yoZJDn9dx6Etx40
	 2F0AACy3nINn6YwPg3B8FltpjcSQc8BR7JxqRaAPAaAdamkobrLb82ba6b96IdUraKf+S
	 w/xFWped0WP2wK3wBSnrnzhMrIAW4x9GiRvk9QlMSr7EjtFwXQm0yMSY5RBZFcZManfEm
	 JsbFugNrm4ft8HwFF2oz1QYYnPH43qR3oWH+8LCGW1FXGpbB5OREKI7yfHXI18xkBD5Gh
	 PMh0hHX+d4/pehw5OG9zO4t2fLD1mqihEX6YofUCO8L7LOwN99UL7pAlZb6AWyd1QTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
	b=AgYNRjNx2558PV8ohw9bo5UDh6giKhTvBo8LpQ5Uf51fAs5XsFiyS4NXZcExrdqzDktZ
	 XgxatRHqt68bkP2Nd9YSW1Ak/EKwkP6gJ9LqYVKb+Mwdb3Tw0H6UutXmbVyMpx7WvnxFF
	 ssoGt3xa/dwsapmiSTa2s2DDlV+yB6B89M27sYHN/4uqjN9qWIvs3x7eE2BEQWUYtIVSw
	 OwvTjMAQVz8KMC4GkG1rCpVx0oIhz3e4at7Vs+jHhkV7ic7gRBM5egmj2hrxp9nSyp2Mt
	 6nRe6ySb9rHX2RQCa/1We5WoFSPndcggvqpx8LkjT95GFCjmBPC8qUlyT2JHzCg1Rtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxrxQEkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGoSvMuG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxrxQEkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGoSvMuG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5KR679606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=; b=lxrxQEkWbMUEZwv5
	e83HHum9MCFcRA22E0fzc6ODfrNKZOSyIyHqSt84YYC29etob9IhfBNqED+Veuzv
	h+LpXik9ine2R1UdYO+VZnbzGxvLRPDt5btZaK4NO7Srs/K2IP68MNN6uyOPWeEm
	rNvrRD//e0ZBCzvSMYyKWZN35JbCSuVBaD8DJjzP7fRRa8GXc9VbBk2STC/YwhnB
	uPKfcz3K/DkamC2jyNZ5VHDNAKdkicXmvCNL0K/oKkUv5Fo791Upl86GHGqpkuLW
	ggHq24aX2Faw+888s6dPM/MPt5Df0j2WVBf1bVT6Md+94H2a8XBn7OJ+sy3phHmj
	zdlZUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48d1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so313392085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286496; x=1794891296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
        b=hGoSvMuGquEVXeevy7Cn3kNCMhrFymYGcDcLIeWj5XTrkNjkcb/1wNTLwA7M3nxg4f
         ER2PTHiROsFxhncyzgOqQhvNbrPzf0LAXyr/L5lEUtkU+joXgE0ktfQ516D3K7AM/Wgx
         VD+AkbhHKrVZmY6ZlabmEN83zKYluDkA/26oezCJMdbFjw7wirjHl5c1/Xa3H+3CEdYC
         juGCeYODd0kf5sxWYnfU8taqRrJrmHntaBGBwJmXgD3Ltm7+1czLg92ksLcW4pa6Y+Im
         z2Qg9NJLQQOvejvEkr/ITtE53cTPbQ7nvRrGnDjsrpcazRveGR+uGIRlKuJPX+7SopNh
         /05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286496; x=1794891296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
        b=YoOyIb1xlOscvQiD5oqX7rq4uxfhF4X08vBT/4bsY0xoFJCE78YzhpT0mthBYUvWXZ
         2URcQwStSTterxMBbYd+f634OzSQkV8X72rHcxVyyuTTdTOo2RSYTFR3Y0AMsqntQHIt
         LqlYiRDhW5Gd2d+r+J/Evus7Q140GV3oGMW/NQqEF2OndtWsi81YKTVZzK6go1Dwzopj
         8gZvsIM3OyOH9bcTqoaXEO1Jmy930p1aJacWqrUjNlMsUzJ4S4Qp8jFDMen2s0Phht1H
         HxXqVBYcTOJNiI4Pce1fDsnUH9m7mBrsvkroRMpA0Eu99RZd0MGVYyNW9xhmfEFNn93w
         yy5w==
X-Forwarded-Encrypted: i=1; AL+hErFvSWKtmHH5L69dx8s6q8meN9+Pn+2qhdmZIiV6gfD/LcFrOeApQ0DIOXrmTaFXIuNKCKyQjWmXo67EVeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kk5bsFBpkJppysZ4ERgyt/3gXv6Ftd6MJj/Ln/BXtlO7YD6sy
	Lq5NEC1WwqRhd1jDakshC1fRab2Sxp7IwLQntwRnRz+PKESLnS9s4XE3YV9h1g3CRRwAoo7lJN7
	nrbhuw1t/CzpOvSUA9bXS+jhil1bSPfTUm0Sm39MeJhZLUZqbHHyYA+O1Tt4ZwzKJOtI=
X-Gm-Gg: AYBFou1bUOreMzJZ8AJ9zgpc8ZZzqvft7wXPwqvQDwDyc8Y7Cc8VkOQnvkxSVbVv6zP
	XTON61YmGbrnP6ELGZ2OK5B9uXYiQXrfHt0ER8BewuBzn+91l0PdQEuvYONEyoiDPr+HHK23yPU
	qi4osq5klznCBVgG9T40EvH6dh87Ao/qtBQN0gYIiRoM13aqpBNERqYihBoSsQry26vhtrGzAoV
	uCj+Q9Pi8C3sxj8G6i8bRRVC+X2PvM4oIMUbsHjjypgw27Fo7jvYx6SBMaOTWw6gt6qDv1BiH5F
	N1S1p4XERy+zdhxgjPbQkXiYoSWtYcMo53w8936nQWN8Zb7zOlXr2iwCAZZiwQtGeusugxudwSr
	aU8ApjXPeE2JUwrR9H/5DU8Epk6Qvh+j+r1+v6rIi65SOqqpPSUwzbAJbViZeGL1K+Lo2L1N4BO
	9v5YbottIBK+pL9GCxCn+ZRMl/1JYJ3kD2yBjN
X-Received: by 2002:a05:620a:8386:b0:939:2b7c:34d1 with SMTP id af79cd13be357-9479f465011mr241868785a.15.1794286495918;
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:939:2b7c:34d1 with SMTP id af79cd13be357-9479f465011mr241866085a.15.1794286495432;
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:25 +0800
Subject: [PATCH v8 04/29] drm/msm/dp: no need to update tu calculation for
 mst
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
Message-Id: <20261110-msm-dp-mst-v8-4-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=B9iC9f11P3UYhJG6GuGSgLAVw76YLRk1a4MmxuGI4sk=;
 b=psDEnqwU6EoGLJN91XM63kS7wCtg9ipDg0kiJSTV6L2ym7K+3qRBc7chEobbAYpAfiAmTLqH6
 fd/3dHbv3UZBNX/aGuCR+RPmOoRE5isNlIFkDQHGcko/lfMzJU58Qjb
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX2rk78A7zKwIe
 xgVpxeA86e0dlNptw6MxXN0racT9K2JBYMakq3I7BkHkMR2oS9VKEjU5VvvNBaz6ufhRZZvO0o7
 if3biRVa1fmTKWK7RWO8R8fh99xScEw=
X-Proofpoint-ORIG-GUID: yCDhNjJSdBvAsOdWOzPhbqJqXE6uiFY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX44G4PnFBzIKu
 G4RA4ajQYIyD0h5xNTTI/fR+NNxFBf69lFsC3NnCIbrkhRXKxvhm3jPFTwSnw4DtFNrzOQ7rwTE
 pYDtFJVqvw9pzgpcNU6eYbNWV7Po9cq76X4AXqWikqWXglP6Iq6vTGkyjC3clXZy70QOm710aIN
 MvC1bw2NnVxjflPPyoyyyMrKPkOJyDi8/3j+HWdpkz/sX1eTlBhT/XcQYX9i8ApjgSgz88VIaBd
 7RPFoLLyxNh9i/WWHIxPoOg0++HcZsqNbBQQmVECAVJDKlZqzlvbHvGVbzRXHWLfGKZpUfAnPnB
 K2t3zCZEkFwq8knhVsEwXIGp8e/BwKgJ19bwHsek/6EurQajN8HSOZFGAPqMUvZ3LVj2j2FTZ7l
 e0YdXSIt9l8dxQzaBsLfzUfc17klxXZoDGGFK2tIerQat+FKNeHy6fHi18c9mz9CzXQHWd9MCP/
 mgSQBKGsLXU3VTQWVCg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2a3a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yCDhNjJSdBvAsOdWOzPhbqJqXE6uiFY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

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
index b6ff3d8caa2b..a7cd3c87cd7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2712,7 +2712,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_mode)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

