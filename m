Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788CC345CDD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970512; cv=none; b=SH9AYw750b3WAt8ayVERWvGZlu7omY9dJRurKgET8ACP2BZa9dn+9RQGe/jA8tEqFDSL5vgtgod9sd8nKKocg/LIl9Zc6WGtzcfzDBnwj1t5kzmztkzVav6Xmq3M7p6K4duSOMHe/jkxqUKhx/veBhXTmd3EonF8HcXbzNQZaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970512; c=relaxed/simple;
	bh=4FWIx6VuylaQXp7SnJTicjNkiVgzklnGcPldcpLUBqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MFOOxseyNvVt4SSOLRPYWc9ys6R23wsOPldkwUF2Ut7k2I3GWpWIr4VsPgyqgUCPDg0tmUzWIp82PdAcPLt8mEfHQ4padaZyrwkPj3fSQhcwZNQCqpmjFQCeojwMO4MHJnLy4rsdTujYxl6dZ69sElvLBqAsVH3EW8P+YqgKpxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mq2RteX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCRZDP8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq2RteX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCRZDP8L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6AVn2514191
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ib3fLjMjNjCa+R4MwIblJ4
	9C5aNpt3ZHaijeoM/GS/I=; b=mq2RteX0+KqpemOtAMZw1atJMGJlwlo4DD65d/
	P7y3Kbna5RGLXw3al7nux3TRUxJcU5IJHVcW7SBfTgYikxNb3kVAG8qmeERvbqkd
	idqjZ+AqJQ+lVTCvC+2U2VkIinU6Uw2R1w6r0x3MFCM1sZCp+ElvtKTshu45NaGq
	0Sc7YUtks6u7Xfzn803kOSmM0ta6VhNKBk6AYAOBFuVF7piRcvvyQex/iKc93AXZ
	ALdgNkT3D/8t8Fbzz8rm5hb6KzQCycOC7V3P+kvO0oYQVHrkQwDyzJ3attImCdYH
	tqwsci5m5A7fSTeLdT9LJ1OWEeKcTcKkD/OmnXo5f8tYwJ6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj0264s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:48:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so454019785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970510; x=1791575310; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ib3fLjMjNjCa+R4MwIblJ49C5aNpt3ZHaijeoM/GS/I=;
        b=dCRZDP8LzZxShh9kqXakBfLxL/Ud9WF9FPbX3EiEnNXl/ehPareW7faSnZnkfSsHIO
         XwVSD5HKmx4x0R1sNlYUPkqs2eMc3c7FrjpNdZM4NyziniQ4aNEuXMAI+bwiDmy0lkdq
         paD7rGtb+jBKuHsrWS7i2w/M+fRZiXojZG6XqG+n/vhwOdFwURFOutFvMNthZgLke0r4
         H4krr9pBN51r2vaG57eBb0/e56dTwmvzK/GkR+mhy/NRLkDHglBO8iBj335f9poa3D1g
         azNTQpeGktBM9CAigByvx7cH4fyWaaP/dF+k+Zk/STf+fjBIfdkl3katlsw543BGMGq3
         ZNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970510; x=1791575310;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ib3fLjMjNjCa+R4MwIblJ49C5aNpt3ZHaijeoM/GS/I=;
        b=mrc+wybfyxq2KiWOjL/IU2/zSSJGDcwfiSVOuKGLfG4IcWI1OcKsAHjoHZmJXRB0nV
         cpAgTFMZUeBnhM1XkT1Br1K2JLzA25ioxqRFKZlufNZGVm1Aycptga0rOQN+IJ0m+VjF
         ki4gJynciBlEPUYO2RgMn++/E7WfHfRXe2eZsQgqt4eC7ZnEiAPeA4wl/KMtvD2ZMZaN
         Iuw5wBAG/w90KUyjx6tomvhfWxgtdp8Hb0GWF4zk65ikm21vpPvXtdZpRTlceQ1iFPuY
         DQfuoXwgD0O8GzxZ5FzORn2MrNllpzzOYH3bS2YRA3Pm7R0SpuL51JPqENwxoTY+sYVt
         Z4zg==
X-Forwarded-Encrypted: i=1; AKwUvByyflRTC9a3hoslJnQpsrsPj3HAxoor4BsuZmIxmDjiXUGDhPgyBe0NtnqFqrUUyBvurOvr8YnEIPUpd3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mjNGjQIgyNsx2GfhVgrKT9JV193drK+nZLxMlVO8d2BlHNTmwC
	Km1KtnanhUJL4Ua4jDYWy8XEVfkWHGLGAlSJisbb2VYpBtiOgQ+gU1gQun61qMrI3C8LL9eVwuG
	84TLXKtBXkEF0uhUP03FOtuaG2SUpLqHHbgvEwMkagRmrkKVOD3w2udkm2/2FPhFQl2M=
X-Gm-Gg: AYBFou1TaupC4pwDk6K7fNdgGHGLf4LHlUnS2PDJfwhPcYERv1owJ9NPlslYIPRJ2+g
	me7uPVgaRS7tnLPt0cO08av5lD9/aJJV2K4NmgZwFLwPzkN1B+sQ7HwFpvCQ4rDU0nWcvskYFvv
	4RXnAkwA2cb6kEkFRGoxIqU1JEV3nWKSiM0Oe4EJy9emVfRHkLW6MTPMXxeMd0b97BewVnaM6qj
	jPVGX7c0udQ1BzQdvSkmLiyAeOr9bEhwDNkD6ce6ZUjTjNzx55GonNqcz8uf1aQ/ydwAJUNjuHO
	VTFpTSupblZKhuf/HBWnjcvOR526JbpfuNH0xVK4n5qjQWPfmxx6WNCUmA4XMRgUv9QfIDHNl3b
	hcw23/kDGhaBrCAk4tQLqN6AYNCb6NgkdiuJLlUz8I+eweBA/hC4agjD/Cwa4Q9NfbrBxO13Xwq
	lR5PF1kwnDaT1X
X-Received: by 2002:a05:620a:408f:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93cf19ccc35mr616983685a.63.1790970509582;
        Fri, 02 Oct 2026 12:48:29 -0700 (PDT)
X-Received: by 2002:a05:620a:408f:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93cf19ccc35mr616978785a.63.1790970509035;
        Fri, 02 Oct 2026 12:48:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e304663sm12054681fa.22.2026.10.02.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 22:48:27 +0300
Subject: [PATCH] drm/msm/dpu: don't flush a legacy CTL after its interface
 has stopped
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-encoder-flush-old-ctl-v1-1-2a2f29e9b930@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIoKwGoC/yXMQQqDMBBA0avIrDsQQyraq5QuTGbUkZCUjJaCe
 Pem7fIt/j9AuQgr3JoDCr9EJaeK9tJAWMY0MwpVgzW2a42xyClk4oJT3HXBHAnDFtFdyXnvXT9
 QD7V9Fp7k/fveH3/r7lcO23cG5/kBZW68eXkAAAA=
X-Change-ID: 20261002-encoder-flush-old-ctl-45d4bbb489d8
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4FWIx6VuylaQXp7SnJTicjNkiVgzklnGcPldcpLUBqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwAqLlsmz3nRfDXmPxd7XaBWUqlLQbn3MpTmN6
 Xh1YWv9cW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasAKiwAKCRCLPIo+Aiko
 1eQ0B/0cqLfLxEMbDH2p+2WQND3KvWHl+HpuVTNNSp+P/tw4rmVpASOWBgSyBj4/mdMEiFITBCp
 gTYc/HbCjy2fuK+xnSJngQc4J63/IgL0ci2eLkMVRmzFGg8ZZ4uYppe1D1l8fHhCwtZumiIEP6M
 eamnY4lLvrsoZKJqKI03dTCts2zzqS5jFQObd3zbFqkbAyDAdk0ZcR16fymoW53UUbnCqTtWexq
 Yrv+UChFe22b03FBuoSDzCwMqItNDPhBtZBql+cpbtiUfhdPkyKSNZqyuNAf3gjnH4GEs0F2zzM
 MHeeXKQsil6pYjdTR32mNb2TRcQLq91oGi5EMu/FTo1/zKVf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfXzla5eMtqwec+
 9H+CpWixqj0VXsL4Bk7WO9RGVsEp0J0oEU9DsDHra9WvEeglneRd3TBNOwt7rAxi+c6LsdtKfjD
 dusrugz//sthDdV2cfsQL5ONdwe64/Q=
X-Proofpoint-GUID: lm1GH-ciwW2Vm5tyfIAQR4-Zpd-7iaSP
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac00a8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hfaEzhZv1HUH2TEzNl4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX2rhaRW0JpsFo
 wY/Y/rvnjeYm/41XvoRY7cb38bXkvnNzGGTsP0VdSpaUX+dqQ9UMECuJVC6cEsS0aR3A61SQLSA
 SrW46ccaE1gjS9Ja59ZM8isg7JjGjUgPUCbTORckif1V25QGj+G0zdnaq5iOzuPUk7mDUsI57+O
 GDentzOw6ZuhRNO2GYgWdKodSLFQVkTNuVFSdnxd+N4rm4FGdDtpVCcBCOxTAK92iLGXNX91Rm3
 uxQjscmJzU0O55nocZ0Qp8YD7XCbad9K9x0zHGClG+3mKhyibGu9Mdb6nEMeCggPPfFg3y46Euv
 kPIhMK4M/cAVG3ljJMTmPiVU8uRCEu+PVogLhTBcgtv04J2G4tlpVZ7ZFmChasZvkEhrjHYnFcr
 5fjgQFsE8VnWSFBhSqA2oHu/jRENoYTw+je8ymVaaTZws+2iJLa2LGXWhHD/Jc4B+fmbjKwa5w+
 AiGFpPTEZ1V68Zlg2VQ==
X-Proofpoint-ORIG-GUID: lm1GH-ciwW2Vm5tyfIAQR4-Zpd-7iaSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

On DPU < 5.0 the CTL latches a flush at the next vsync of the interface
it drives.  dpu_encoder_helper_phys_cleanup() runs after the video
encoder has switched the timing engine off, and still flushes the mixers
it has just reset, so the flush is never taken: the bits stay pending in
CTL_FLUSH, where a CTL soft reset doesn't clear them either.

The next display on that CTL then waits for a flush which can't
complete.  On SDA660, going back to fbcon from a two-mixer mode leaves
the LM_1 bit pending, and every following frame of the single-mixer
mode times out:

  [dpu error]vblank timeout: 80
  [dpu error]wait for commit done returned -110

Only trigger the flush from the teardown on DPU >= 5.0.  The legacy CTL
gets its registers flushed by its next user, as downstream does, which
rewrites CTL_TOP without a flush when it stops a CTL.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..5a06a0fbc7e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2339,8 +2339,11 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.reset_intf_cfg)
 		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
 
-	ctl->ops.trigger_flush(ctl);
-	ctl->ops.trigger_start(ctl);
+	/* a legacy CTL latches its flush at the vsync of a stopped interface */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5) {
+		ctl->ops.trigger_flush(ctl);
+		ctl->ops.trigger_start(ctl);
+	}
 	ctl->ops.clear_pending_flush(ctl);
 }
 

---
base-commit: 5e4a3f7b262060d70cfdc7889cfe0f4aba9ea3fc
change-id: 20261002-encoder-flush-old-ctl-45d4bbb489d8

Best regards,
--  
With best wishes
Dmitry

