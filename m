Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234092;
	b=LJ6pXrPJ9RDSBTmudnDPpQ+ip9AZ97Dr+skj48xBxF3Ck4Br8bXrz0cW9FkL3Nbjuk25
	 r+Qhc1cPtFrONjCiP0tHeFXDqoW45G1ZZCy3jG3PU5AMbNqe0sEE67tZwwBanuQ9yJp5G
	 +woNXyriFod0l/H55Yxd5SSixH+aSG8wv4baQzx2vWqDcjmhyYeNdEIe58yUdqDg1hpZz
	 Bgjq+sjA05GRqSggp7U2UUDKWttGmG9bBT1rCIHZ7SQmd5FdqmGteB8AZRmYqRFLc7RX9
	 JvAFbJ5BonwS2c8YMCaLf+FvZfXx2gmHkp/xUPTWhk+QQPp6r6gnuWw2L7nFH4+6a4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
	b=QbbcD3BQWQa5GXUZm4ms572ml+RSLyRbR3sK2VhcIOm+kn2GCu+5akxY4jSvKj+d0vJO
	 CKs4ND9gFft8NNe+UExc4zZMY5hdWs3XRmU7Sbqwe9Pw0Fgyu2vEL0qTlO5W2G9NN8iLt
	 yJJznWfbL2Ss6zHQn9l8rjaxVd2xIEWnBAPuAyxWJbjLoKmCHqgkW/mjmB4oI+lfn79Uk
	 vIqFUQLJRf7iyIRNd3FM5Wqxs2efq+GSpRQxsI0wfE9l9CkuHl5JPCKuu+6/c9lp/jVrk
	 P8Pm+bzPXOa+NB2TnhThQuDFaf3aTKsz0yXyBU1M2+45k1D80PJ7ErATi7ecwT+Hp3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBUkhJbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e7/EF25G";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBUkhJbp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7/EF25G
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEr0W336353
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kova2M5LKwq
	QTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=; b=kBUkhJbpDw7lULstxLc6Cii4yRX
	xaZEBbleAs51pSqn8KgZN/4xJoVLyZNtPc0Ke6Qpv8drEf5xBkDe4JdDSlFPvhQb
	9QSyQiyiNTftSmg3f6JYMIA2P11S/snjDXkeE1ZqYsnmyX0cFMqcqzpCPToUBzTF
	aAps+CyFGLKoxtUSZfbHg7eUVlBPfAYIE0BfaQZm7nOOeRS4u1g0NDrQxn98ExCw
	GgB1FKHfUO6S2tcmvtdnF8WGO/GQj7XBJUfXLWJCJQNCenmqvPRNmShRp31XB1G4
	HWwkDWEgbV0o67ac4DIdSlxqlxp/wlpe6bvaEECsMaENawJlnioD4HjjuBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rp2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso803014a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234091; x=1794838891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=e7/EF25GWhU28NiU+NGHRr1ULQ4+wpek9LNQRsWlckGH/mE7KYjIyFX61aDFfwzCmc
         uETmZXEz8DMiBxsEMlKyK0KqNdBVOTYb0r1gVbuaF9iLLagY0aTBiJNU/sKfdr0qRHT9
         ugvrzg6m5leEO0VS/joMZDjSQYcPk3bdtckCtxAxSRzLajD+vzq7+kmrWSuLMDCZ6dp3
         xWEOHUrVeg+6rTt9lXAlOSLGdo25fepr6QrgvxBH2VOOz8rkG/EkfIdf0jXNGT2MWN0E
         ya4GDR3VfvcQbjzU7Zu+1lHtY34lcVSdnvHcO0kttrqQDaUo8OLk9cXgn5j1R6vzZvAS
         HYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234091; x=1794838891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=VHJhqxOFGZw0bb5jh//JhF9BjZsP5w+86gzYIoglYZSbkLWWXs4iHBPj/M0hCFtnUa
         Qpqp4hVJx6FxaXoXDpV9FwH6gWsxqrSGwcB0StuMe/0FA+WQHP3QExcOy7xZtSSbQady
         Uo8aTPLRO4pSJILYZ73Y92m5gDbNBMPYAraayYyoaxmKZV5lvRzHSFgA4XbQOBdz3BUG
         ehzHqNSD0MMbfHJD365e3Dac27hQx5VR59u+s7CnstrHy/P6g4WdOTB+t6dxXERboxa+
         GEszrD9btOAOhm/EaKTrGLHKi/ixnRx2kodDKpgbkMfwOgF4iPd5iabOnWHdvWmh6d6Z
         9Uig==
X-Forwarded-Encrypted: i=1; AL+hErEQ+9NVfx93CP1ZaQpVVDM826goj56oTzHFaoGM7xBiugbAMeDUM1cw/d2eTPcgnwJznLQe9kcLfuFJTU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3lguMLV9w50MBa6ZjA+qeyI8cmWKD6B5NtKMNHCKeBaVKRJaD
	Lk9gBtf6hhiyhp1Vg6lkcVMYKqzHZcQVKt2luBIi3R0urqVT1h/JigdRyL4eCcuwj7v20EFQ3Ma
	2Mgq6DBa6Fd9SQ2wx+C47nWXXhIPMB+qRh6pcXVmpru0iykrv/xIsf0L0V7pnEs5mKII=
X-Gm-Gg: AYBFou0MzFWGdPWqBJVBDiGyHfLi0/Aeb1bRoXtUs7GFI0OLA24fdhyvqHa/kd3h9VP
	pkoyDCKm4UCbdEt0hxeex1v8/6ExkSpQxjwgFc/2JFL+rPAVl+fSHcm7PnNTH0ng29EnmHUMTiG
	1aUC+8NrC0+1x9c5hrTf0xI9L6XiD+nH39GmP19MJ4gmYesz+2EQTXvL677apCaNbhufKI5IAqM
	UkExmC/OtgUOMDXsQuJwtZ4vq+dnZaLWD17FdZ/oR4q5YDyl4OyHnIsIiApmuNQRhM4+aJknUyq
	r7F/MIzXVCNiR1pzSPQTwHUDHAcScS1Mv2CVHT4k/0iphmcB8jkJE9hzFQ4cJ9nOOPTis4S1Fr/
	n9eoHd/eJouSiSjNc3u87IIIVXLNuvJLp0yAPSAVGbsKvbJu9xw6idR+cQUuGHUcwdz1eGmlZKD
	wZjuTCpKuW/sp6fcUS94oFS0SC1le83WJ+EfK3NTZwaRxzIdkXVV7ZXscWUj0izw==
X-Received: by 2002:a17:90b:564f:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b12d496560mr3864983a91.26.1794234090676;
        Mon, 09 Nov 2026 06:21:30 -0800 (PST)
X-Received: by 2002:a17:90b:564f:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b12d496560mr3864950a91.26.1794234090151;
        Mon, 09 Nov 2026 06:21:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm7261337a91.1.2026.11.09.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:29 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Mon,  9 Nov 2026 06:19:54 -0800
Message-ID: <20261109142111.256630-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1rLG662fQQOF
 vJm/EiwhN8VF21rnRHyNE+jWSADvNoUBiiFL1FQMNXh2C6dHRHBzGqSpd9AZ9zQxBKXf0+noLeE
 Zg6PWD3pJq49ssV7W1VKbwIj0zSwfII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX0miIDQc1tqFG
 8ug9JKHhdlEcCaZBWu5ds4ODFJWo6P5nhRcO4crMyS1QuZy5pRnn7iZXUapeuNHkXa+Gw/cuFCG
 735qUSEPeevmnZFcOZeSQR8RZVob37MnadxW5piAdvIErM+p/J4U0pDv/jLGFTH6/Lu96FLlACv
 cJoEtnIa9Huo9p4W6FFNoV48HG4zqEaQuA1DWV7Yi6Exr48hsNLv/Ob7ecG5prQXWG6fG7cGUzR
 T4y6afg+6/re9gSjoUH9B4/jmYcBVY/z8E+WnTt8iAEwXQewJXqeP81Cg8w3C1vJ2MZSv7d1M9X
 8GYEem66I7Fo5PCe/TizQiceNDTylmIgsHZ4xH0u3GyWpef92pkPx+tFARtw2f9zrT3vqEekdjd
 SxxaPwv4EPnrxcO3VBoqDb/jgUcJiy3qa4jMbPPiMPASJ4LU6O6vCzFivkyH/tMtSIjhaial9q5
 S+w2BcvAw3nnTU4Ilyw==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d6eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7uQZ9YJ7dxizA-XmfbQY_sa66nq7AHRI
X-Proofpoint-GUID: 7uQZ9YJ7dxizA-XmfbQY_sa66nq7AHRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

