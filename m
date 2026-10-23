Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797598;
	b=A+z2JxYDP7RWdmOiywyJUdiA7vhDcNWrGNbdjduEHRXNlVZ0l2tFYrfEM6a15cuMkUzD
	 FXtoO3qz2hH88QH7Nj8wV+yCcxg9vH5Qlrq4hoF+I876vf+B+6Bb9rn10v54+mkUOKPVO
	 wyKZhoTHPCg3l3VIrNgu6IugEJsShIekpeGqza8Nz5ZBwqrJ28fDomX2Ikp/Vh+l6XhzP
	 ImxXjEYXQTwcb+R59Y8cNu0ytR625Wx0wDnc1sDie4+KLputgH7XAOiORiojfRmjl8M+Y
	 Bj51goE2MfErW2uhxfmmZkXcai+I7EH2mANE9RU3klvkD+6Ku7pyzrd7T9K9Fhaz0Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
	b=T175J/JLH+8OvfWJIoJNkwRP4nB8iHbFPBhB6chJFgM2C0aSTaSJWtfk/cHB8Qla9uW6
	 LDV1uGLhRfTpo1CIA3WAzc5YLFf4CsHaD0uXUr//zgJgEKOgEW0EIkZMFF3pFdr+2FqDJ
	 yHEEK7TYRMz6KYz7f+kAtpBdngvrNmD9XZQH1PauTadbNHva1EyGmMW76DLRXHxEfBadL
	 BYHsR8tJXQIRo4F4psCxIjkHq+Op/79AOn65BgLg8bv+Me5bdVzkjY5Hh1Y0UHXThkQZF
	 Gu3zY6U/RDHj65QQyenDHF7+lTatrGpDIUyckKmzn/etfZQ6A3HMl0NVPt2ZW/YHJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdOx1yW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8jjBef6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdOx1yW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8jjBef6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvP0D4027111
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/gKhJm8D+3RUy70YA+6RE
	MKGfetc5twJCUNtCBa9Ig=; b=kfdOx1yWsKH5kO8t2nKjIKyFi+wwE2Ajv8a6/O
	lzDxzTN+KKnFtBEBpQjz5V6/WZPacGHgWLJt9IFdP5RfTT0iD+PmQNWbRltibQ8J
	I49LFVoP6yNgbcRfCOJ3zfstDI8PKvo55gH8zAYZq/TUq2NZZiS9JWdd99mFGzEZ
	SmUb+N1Jz5PLjd/GpgbRFW5s7KYjIHIZU1/YDURd+BSLvcQkxZR8HW99qiPWagJu
	sM4KXAiPhFgegKIS4E2y3wH04oXmo+GUpq6FUXW/T3m7TglEvUm4qaj2UrfiP1ik
	HsrMphpr898vjU0l8OT0PSI4rRbHTworzaFsxjiYsEBx+Fig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7gvft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso270709085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797596; x=1793402396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
        b=Z8jjBef6XhMtvQ3kTef23MSQl88aAQTNTVsBsI9EDZrEbgpVlbQ1LzsFPoXsDaQJZp
         jJa4sGJeRxXm9NKmmd6uvQtn1Az1zyEDDIKAqoxhtt+V6ukwX51nnfvKYa0Mj6pof6Zy
         yQ7ICfRhzs4PkOhVBdq1XWUNLbe7+FIWUXpN7ieY0oxa2WkFQwSETOnZvitoK31KVKp5
         +UkT0C2eh45cvsKNGk9UB/XzFG1ZU+IQnn7TNOH8vZXbsNgABGv56JiD0n2xIT9GY3dE
         zyd/rS0981sik8fkyr/+h1URiWmmlLUgylcgeH1j/irGlm8KRqjoVye7toh/Id3vpJbI
         7gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797596; x=1793402396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
        b=KPMXc04SIOKZRosw/nhX+UWikaCOaGF811AdqX/HPXKoRlTCJmwUYDnp2F4QnLwdkN
         fxwsRGGC6nfUN2VSNETJYQZ+Oc62DWzV6ow3PKXN+BNNcpGiD088dahjD9pCP5l7X/eD
         95mVgtERihWL0dKxFZDWjHwh9h1Fa3fHoly4tXNwXlJIOUZK3eZofeMHnmPLuq62BIoc
         6O2wpUr8I7G//97wKWP18TPpbuFEkADyMcCbqSgnp3/+4pTSsgr5yQLCgWtD8aZUuDKe
         STlukIJlJPPXTZ58hDxLsNBFcEPPZSMHqVtXfbEHJx6PENrM/cdsLCIwRBO26EExhzDr
         emng==
X-Forwarded-Encrypted: i=1; AKwUvBzb35H5kjQuropVD0xKI4DjCVydqpNsnbkggE9A9Wl0x7l8cfCJ50MMAm9oZex91emRR8S9mSh8gY+Ik0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKuD2I8cVmcXWTLiA0bGRbL7plmZkJTkDWXO5PfGTCgirxSgGK
	XD2tTpukg+y7VfvNYrbue58Fp/oMXrZZCU8Oxn2/86zThf+g2Bn2LBMDMDU1oeKZ57FngAulbDs
	9yDsxyOKztQvn06cEVLyvvhckftLop7P1H2otUfZ1iPYqlTA6Ajh+XELlfrjiiJT8nas=
X-Gm-Gg: AYBFou0IzKmgtNtNAejPMqLsLNITib38WcFXjBTbvsy7gEnlmCGg1lYI/cQwWwb6oui
	5Cuc1/ooL4ueGOdIp6ITnj6njIM7MlUkD0TD6eq4q0iI7FM6nicVdwW0m35kO5YuPEnFMCwBOZw
	FQi2svdd9vzzsHGSvvEsCIOJpsM0Yk8NGcsWNCMxVnV2wQtMT3EAPnWNdO4qrUbZ0kiUZ7BYiZa
	YY521br7Ro/JrLsscQhHHQZnZ+LpHhIPOeiDddcmh3G/bMGDweuYY8sqqQbkfAPWuJ2dKDrJOMj
	IpTxLVAmB5coACMhlAzqUP0mtvXkU5zIwMfoBGfW1+P+UIDatx2A2EBW0IjW4BVS2XCIr0+bwq7
	uSZkUcTrF3auKEtB7yOtCLVyyUJtc9/ArSdz+FcOLcffrzXcbRZnfr3wNuxZ9fuwZK6IjBXvt4d
	YkLn8SbbwBYVsB
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr85586685a.51.1792797595999;
        Fri, 23 Oct 2026 16:19:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr85583285a.51.1792797595526;
        Fri, 23 Oct 2026 16:19:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/14] drm/msm: fix the error handling of the KMS init
Date: Sat, 24 Oct 2026 02:19:33 +0300
Message-Id: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIbr22oC/3WNQQ6CMBBFr2K6tmY6NVZceQ/jAuigVUu1A0RCu
 LsFNy5kM8nP/P/eIJiiIxaH1SAidY5dqFPQ65Uor3l9IelsygIBd5BpkJ69vHuWlriJoZeVexN
 LqGBbKKuzYq9F2j4jzY80PZ2/mdviRmUzwabG1XETYj+LOzX1ZocC0AuOTkmQBDssjM3JmOoYm
 DevNn+UwftNOmJSdfgDw0UYJtheGzSlQrRk/sDGcfwAGjs1uiABAAA=
X-Change-ID: 20260930-msm-kms-destroy-fixes-0f04b1d39b83
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5666;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4fDxGfpbq/W/o8WwgBUX09912j7OPaz0X+wudJs32s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uJppx48xsLonjOrx30k1Ri4C1eudk/9xeMN
 VTOZLSC/+6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvriQAKCRCLPIo+Aiko
 1V7MB/sFaerdhZNYNUGblQ1JWAgjlUreKqOUHRpUXsSfYPZ42gFOgnJ2sgwP+YLzlwYER0Lcug6
 DUwP/3CeVTKy316RYuv7U6TZpKnNfVPwWtdIJzcHiW9yeL3ry0rVI6QHGWr7idrQm4kDwmsrmMd
 Kfk84BCI4PXGlexaoqezoSd6XAWsRRu61vf+j1E6tW7lB72FWX0oVAscwee27ktY1un3qJMA9fN
 upg5d6vP3QJGWNHM6SHDA+91phWrA2zkRvl0FdewBDUJB1Tml3TdpXU/KnSAVfthLxhaJocG/pc
 VXn5mWRSlbzmg2E7/LUt+pTirm8z40IFCSYaQ3Z9qZo6MLj6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX1Njmeu4k9r7p
 I2UqpT/pW4DHqxIsdi0g1gCw0YYXrfJTiosPUFQJAfHCikDL1Mg+J6rNs1UowGk7q1dERxbpys8
 TrUjHOUVcgScKKI3JnLvTvDGNX/fEk0=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbeb9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=SeckFaocyGfTZ33SJHoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXw5dAqQUb6Rhn
 uXCaaO2/Nnzz8RLH6dxL/guyNvxokPZCIQmAjGhCgKpOMkrQflSEsVGvyCsIvg0VPF73d/kPZOg
 FXN4wJrnEbw1AoVFR7OveqjfPMMdDeuyHUuA0nlT97oZqu5nkQJuXX1qISOAPJMR3Cp/sMf+QoM
 g2J5XYJd+NZz4+X+79b4L8d28Ps41DRHjpaJhgWR37ysKBdK/M6t/frOTzHXlcIr9B0Xilf+lAG
 VdI5W/3cIQ6jYv72RRXXB4roe6TLgF+6YwWSUbrxHboqh77BqqQLoc3rFORFdpho6Umq/e9EieL
 IGEuKjsQ+JZljv6gO3QbpEwZiUBO48iqJdViOxPxbsNilFp3NYC9WrU03GXBnf1Q+PcHvo+Bov6
 54QAUcYLBF75REcDmMqsEc83HIBuuULbCsqRSyhFQpdTDukLxA0lPjDte+z7+cQ0eXlr5CapiiH
 BDj5VawVJZOnO5eLd3w==
X-Proofpoint-GUID: 5H0qtXm-59do9cGSZnhGpN8N5hf67W8E
X-Proofpoint-ORIG-GUID: 5H0qtXm-59do9cGSZnhGpN8N5hf67W8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

When setting up the KMS fails, msm_drm_kms_init() cleans up by calling
the ->destroy() callback of the kms driver. That makes ->destroy()
responsible for tearing down a KMS in any state, from "not initialised at
all" to "fully initialised", and the drivers get it wrong in several
ways:

 - dpu_kms_hw_init() and mdp5_init() already clean up after their own
   failures, and ->destroy() then finalises the global state object a
   second time;

 - mdp4_destroy() dereferences mdp4_kms->dev, which isn't set yet when
   mdp_kms_init() fails;

 - msm_kms_init() leaves a NULL workqueue behind when it fails to
   allocate it, which msm_kms_destroy() passes to destroy_workqueue();

 - msm_drm_kms_init() hands a half initialised KMS to the full teardown
   of msm_drm_kms_uninit(), and the snapshot init ignores the failure to
   create its worker;

 - the IOMMU fault handler and the DPU interrupts can queue a display
   snapshot on its worker after it has been destroyed, or against a KMS
   which is still being set up;

 - the MDP5 driver appends its hardware blocks to the arrays in
   mdp5_kms on every bind and overflows them on the next bind;

 - the DPU never cleans up its self-refresh helpers, whose delayed work
   then commits to a KMS which has been torn down.

Most of these were pointed out by Sashiko while reviewing the "drm/msm:
fix SMMU fault dumps" series, which has been carrying the first fixes.
Rather than teaching ->destroy() about ever more partial states, this
series switches the KMS init to the usual kernel convention: every init
function undoes its own steps when it fails, and ->destroy() only ever
tears down a KMS which was initialised successfully. This reverses the
approach of commit 93c125e4ea98 ("drm/msm: don't tear down KMS twice when
KMS init fails"), which moved all of the cleanup into ->destroy().

To keep every step safe and bisectable, the drivers are converted one at
a time: a temporary flag tells msm_drm_kms_init() that a driver cleans up
its own failures, and both the flag and ->hw_init(), which gets folded
into the drivers' kms_init(), are removed once all the drivers have been
converted. The last patches fix the teardown of the DPU self-refresh
helpers and follow up on the new rules: they unwind the DPU hardware
setup step by step, disable the MDP4 vdd regulator on teardown, and drop
the runtime PM flags which ->destroy() no longer needs.

Tested on DB820c (MSM8996) with both the MDP5 and the DPU drivers, with
failures injected into the msm_kms_init(), the MDP5 kms_init(), the DPU
hardware setup and after a successful kms_init(): each of them now fails
the bind cleanly, without warnings, and a later bind attempt succeeds.
Unbinding and rebinding the driver works as well, except that with MDP5
the HDMI output does not come back after a rebind (its extp clock fails
to enable), which is not affected by this series. MDP4 is build-tested
only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebased on msm/msm-next, fixing the conflict.
- Link to v2: https://patch.msgid.link/20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com

Changes in v2:
- Added patches which register the KMS fault handler late, reset the
  MDP5 hardware block counts and clean up the DPU self-refresh helpers
- The unwind of dpu_kms_hw_init() now clears the drmm-allocated hw block
  pointers, dpu_kms outlives them into the next bind (Sashiko)
- kms->vm, kms->wq and the timer workers are cleared on teardown too
- Moved the MDP5 counts fix to the front, merged the error exits of
  msm_drm_init(), clarified the fault handler and self-refresh commit
  messages
- Link to v1: https://patch.msgid.link/20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com

---
Dmitry Baryshkov (14):
      drm/msm: fail the snapshot init when its worker cannot be created
      drm/msm/mdp5: forget the hardware blocks of a previous bind
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: order the display snapshot sources around its worker
      drm/msm: clean up after a failed msm_kms_init()
      drm/msm: let the kms drivers clean up a failed kms_init()
      drm/msm/mdp5: unwind a failed mdp5_kms_init()
      drm/msm/mdp4: unwind a failed mdp4_kms_init()
      drm/msm/dpu: don't tear down a failed hw_init twice
      drm/msm: tear down only a successfully initialised KMS
      drm/msm/dpu: clean up the self-refresh helpers on teardown
      drm/msm/dpu: unwind a failed dpu_kms_hw_init() step by step
      drm/msm/mdp4: disable the vdd regulator on teardown
      drm/msm: drop the runtime PM flags from the KMS teardown

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 73 ++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c     | 68 ++++++++++++++++----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c     | 52 ++++++++++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 ++++-
 drivers/gpu/drm/msm/msm_atomic.c             |  1 +
 drivers/gpu/drm/msm/msm_drv.c                | 29 +++++++----
 drivers/gpu/drm/msm/msm_kms.c                | 55 +++++++++++----------
 drivers/gpu/drm/msm/msm_kms.h                | 19 +++++---
 11 files changed, 190 insertions(+), 124 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83

Best regards,
--  
With best wishes
Dmitry

