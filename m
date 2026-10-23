Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797953;
	b=hHpCqtKOCzw9st7U5yfzhabrWOn347tKxZTX8aB1bKY7NrexVeLqQRazUzjLzfjk1Qpi
	 srhlQz4UFesiOqO7qbxtDEuasrKBoBHume5WBV+FU4tMve9jf1P2aFZIpE+1vI9yVRUiL
	 giRp6CL1YcrALYi+w+hhs92AF01eU1d3dAjADVvpClncI2ToZ29n0FBQqgkwyR5zjlHtE
	 fdlOxP4fnQ6Z7FMpyU0xJcT6etvd8rgQldP6pfxjTa/43JAsMzkbbG37xpZk9yPY/pHjg
	 TTzUYO3xbY9Oto+kyFoF9QdXG+VhtV2kd+KgtzCrxZw6knD9BOSVqCxj+Pu9+itvJ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
	b=gOT9BO+0dugS+CtqNFirCLdDrYA1kaUxuxWCKWpzvycAUzZjwMQAtP8S6ajZuQpu+t5o
	 V/DlduXNgCGFczREctChaFnDR1+nSBLu7jTMhqQOc5xdLncaGJ6pbBS6e5DYpumrmJ1qu
	 ufBgJroirk9Nb89CJ9NL6GiepVm38sUmC4ybeJevqJ9H0bhwlNzInpqEJvtdKZGNhpAof
	 5vY2xs7VfL7fuTRzUAnKQk4WcdfBu4oQDXLoiWWDnvkbA5EGl8mqexryHhTKedwhc1Ik2
	 tZpyoKNs2KGcO0aXxjEFHxIs/6JejMTv8LTpmOaqQ3MgkQGM+zkURQxIT/B2GML0D/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjWxWVq5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6aia4Ot;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0560A260A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD0560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjWxWVq5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6aia4Ot
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvOBq3683998
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=; b=OjWxWVq5sZXvXfdv
	X/RtLBmcID+sZj75zetAGs7GWnr8JW0NS1lTaxU/pEMJOhn7+H1aSwrr75LrQaC7
	gmvsZTZHb9IwnR/LJK7wddikL9JSCwRGD1u/ct7fQiX1ooTH6BGDVxnoa3UjqLLc
	jsqlt51H35iUNFBVU4qjVxBmoKUuFPxSQuqoMYhZGAo3BtNGbhZoCtlbc1J+bFN8
	OG/KyzbhuxI0H5wKJjr+NugpF4BDo88jFK15om27Wo+wYglspzGoEHGv/wrxeP7V
	BH6VD8hm1NBQrdJloaAb4h1AhsYBC2pbLzX/iaR21g//AXmRixexldrGxcdU/cZs
	WXMgxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so317103085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797950; x=1793402750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
        b=I6aia4OtKOAm8gOttHmln+jazbkhSdBu23wSWafhHowWcaTu1qI8ojcAbKBk/QcI3V
         KbimTXnt5lPn/uwV4lWSTq9K/qBVjNg1OFFuEmDBHtgtgiWZjbnsGgAUK1sz0mqFxFtQ
         5kfiFYw3NNz6wVH4YVWlULEKnXXfA7D8TXuI4RtzBfZtD/q5Z+JGxhLJoUJh27t2yZsV
         5dO1kTKOWC6HnH39WiPbLeTpNnaLqLAThl6keY/94PJxxYAyzkMukXsbKUHYPT1PWFcA
         xgCFSdI5Bv56rYObamGtytMoeNIHMnJ2gF45hWGd2DP3WiRaCTn4MUBRZgAFu5uaNzST
         SEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797950; x=1793402750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
        b=SrNCgM7TQtj8oG0zVikt4zD0HBufbR6aHJLXmnQFGi0FwuAoCFVsSZ8WyqaD72yET+
         avhV6tL8NtoJXWgZXAcYSgoQ8Vn/e3r2FcJwLjvbSbHqcUFlHhoM8fto7nZCjNUuJtmv
         ig108iFyoHfYBd871waiNuHewtLnGVvZbp3f3+fXrRSTx220FL7Wg2Rp0MzAXIzf4a/R
         0bQx1iv0DzpvlXNmf4RjMRmKCKgqDGZRisesWJYuLW1JBRWB05JPNqgAkheO5KoXl2PR
         3V+m8Prvj4Mo2xhZQbTPbzEK67MJgb8Ow+PBE/B4FCWinti3eKiOWwI2za1CoH75ctAh
         1V9g==
X-Forwarded-Encrypted: i=1; AKwUvByBCfYfwApUgpkxp8xEj9K3CcZt4E4XMqnFJofNSFoqlmsZp5GdxLUA39s8o6wB6unnqiK2ItTcEXy9MFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tCWjIzRt0HEcGPfsPM2fLinQHgC1jE2iCAHINGok67W5H7QW
	3SxMN+Ren4OjSWaFyZaWyLxmQt0P3R1Z4cIKmoDP1Fzwpn9coaDrV/S+PyNtvlQsePglpdimeYo
	LMfZU3TBlWR28xEQfFAOc7C1LMO3eFnW47FKlld9vT6+h/5i6u6YF75DWTDEQQtkU+fA=
X-Gm-Gg: AYBFou35JPNvpAxw5gh4CQktfHzMiD+Xj5UTOkU9xk4RHQ+UHxnCY028KXb8PGRcz0c
	N3w4PtQq+FasweJTO/VKe6d+SCQ69PaF39BebourNZyLeru/hbzbLTTCNIfj+53SXvuCUdBtQB/
	Ca4MQDK7pl759P2JNtfnjMynBPOQvVv/qSd51Pzjb2sng1U5DpXbCpdkQjm6oVM4q3RoLZNttyn
	rVXCvpc0X1snAE3XCIxydBVstD5yZ4vXYOixCLv3kRnY+HzYw8jVeFCE8oQwj6QRmCEwLB8NQNP
	/Q9o4diaQbE0B9CasPbM0a/eqtSXoMHzgNBlPUqWUHLfe3mOoo7xrqvdl9LQEs8jNkwAXKAk4Zu
	MsFFlwWSrZ3yQraYyEK7qLtqdufV3b6/LjvHp8+VNik1xQnFreaHkUw1cLj5zykBTnSx5WB2Voc
	trCdJwA1ZRQpYQ
X-Received: by 2002:a05:620a:3910:b0:93e:c12c:f12e with SMTP id af79cd13be357-940ef9b19f5mr80355185a.73.1792797950381;
        Fri, 23 Oct 2026 16:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:93e:c12c:f12e with SMTP id af79cd13be357-940ef9b19f5mr80353685a.73.1792797949899;
        Fri, 23 Oct 2026 16:25:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:26 +0300
Subject: [PATCH v5 05/10] drm/msm/dpu: clear the CWB blocks left by a
 previous reservation
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xs/CwFXdBTjsc3qfr5DTpttfpNCZgIxVn86qi7QYupI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zpIlwuhppzIxkagYZyU4H9WCxeEJ4vvij6F
 pdj5FaoneKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6QAKCRCLPIo+Aiko
 1cixB/0QMpbpIymUJNF9EEhko2ZwTHssN5EYk+Zo+aMBPRGQtCgOnBpZtiSlP8U2vOWXcCjtg+W
 bMA6UVbdeUsNjC4i4DKoSlJ2t1ao6Cueh9Pv7sBax4n6+l0vPWFZ6kfXy73rtSfoRPI7FPcpo5b
 VO4Jh5IAuTr2lKyhLs/mNjPnogcyQ4i/e3OT6468Cfah+0TCSP+8JSMEJV0OglYIb1R9flI0hhG
 3FugHYeYcWuvBPEt+mg/rMdY6jH0ayBDYVg9k5OPhw9GgWECdTqemRGaXWVOktLlSwirLmE61j1
 zG3BYcYb8F9buzfzVeRxgRBlo9MKeYiGhR0n4/K90vnPMUKW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXy+oVEhQb+M1s
 HytxyY5JGlJ1O3pK4P7fi4aPhwPoAUzbjEwhGe/6VjwYoMzi3NfnNh7KFHG/Leu/QwURlP4WUyZ
 PnN9QEbgUhgn78oemzqyKBhb3XgoJW4JU+OBQ7QfjspQVzXyMYXf1+aL2oYYKuKOxpPxgKEUODK
 JfJQ2iHMzB6MeyITOaRTsew9nWzvMbSQyulpcLZjtwJjTPqEA6wEuMLsxEFhlIGT6GvvQJYIM9K
 2tSgHjg2cxO2MG983xcjz+7TXyED23ywXFQ3EPT1Dh04E7H6coG8OJqR28pQ7Tp7fabHo0ohHBD
 OoZs8lMSFtEy+gBSBBnnu3nxhzKIUheCMGfaLwo282H/0SuJq4f1kbFXjAMfupg77u2vPtGrxDH
 d90l+xw2enwmQJSGp5wMwE3EwmLgwq7GL0Xr9K38CQHq6+ck9DqVDH2KyDvuUhLw19W8qWyQxtk
 r00HlDTeCzIF/LCoSoQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbecff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=00kiT5jbeo-7mEmJU9cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OlrAsw-Ibx-SzOpAeGudTkpDNO8uaB0k
X-Proofpoint-ORIG-GUID: OlrAsw-Ibx-SzOpAeGudTkpDNO8uaB0k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9M0ZLA326Z8g
 K6xD/pZo6lNAjiWtSq+WCEnpfOQe5kD0a/cvPdlgyRidhsoHJ3J/QqHl3ZfpsjO7Og/DnZKXje0
 4ZDy1YLxzfn0+EhIreJi4+jMWpfzjn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() only writes the first num_cwb entries
of dpu_enc->hw_cwb[], and not at all when the encoder is not the
writeback of a clone, so a modeset which drops the clone, or reserves
fewer CWB blocks, keeps the pointers from the previous reservation.
dpu_encoder_helper_phys_setup_cwb() then walks every non-NULL entry: it
programs a CWB mux the crtc no longer owns, and looks its pingpong up past
the pingpongs actually assigned, in the uninitialised part of rt_pp_list[].

Store NULL for the entries which have no CWB block, as is done for the
pingpongs.

Fixes: 5008375443ed ("drm/msm/dpu: Reserve resources for CWB")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..8fcd0b4e266c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1205,9 +1205,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 						       ARRAY_SIZE(hw_pp));
 	}
 
-	for (i = 0; i < num_cwb; i++) {
-		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
-		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
+	for (i = 0; i < MAX_CWB_PER_ENC; i++) {
+		dpu_enc->hw_cwb[i] = i < num_cwb ? to_dpu_hw_cwb(hw_cwb[i]) : NULL;
+		if (dpu_enc->hw_cwb[i])
+			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
 	}
 
 	dpu_enc->cwb_mask = cwb_mask;

-- 
2.47.3

