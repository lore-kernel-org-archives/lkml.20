Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769524;
	b=J3RrBWTvGsUK7AYFvjWMi7zpnQkN6Ee1jFBNOAkBkkumXOWbTAhWt1/dcByWzwLMa1Of
	 tjtBwUiaN5s+REFGW9rued573HRYmWgkqxar55OjYvuT9gfEkJ6J6eGVhalROH9eD/JtJ
	 27JafX3AgBco3/ShaRQVKJYzsFehcDYmjuij1RxSpY2UQ2MCe1rGT8ooBzOScXIFk1SCK
	 pfU6lB09gSXlCaWwhyMSPi+FIipP8gmDpUDvN2MTKb90lIW7iGWL7bYDInBKcKzyLGDSd
	 +Uu3Bn78Gizs4/QK9B0GgUW2GfQD4Jou6m8GRIEaWItEkFZgxVTohZnNShj7sfuN/Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
	b=k+fn44+MP3gMqQpxJLZHSas/tEXDrXJKTylJb9cSDsC53WGpLLDPFyiDUsFiwweP+Kql
	 kiXNcqinPC/Y6OCWOKA4uBu11GE6ejdeeVZ5t+h+kse9cEJRhg29UCU0cGbFTJN9d7ipo
	 nW/k14NESkEcdYiZrT0qvIgimuKWgSovzbES0nGVRUHxovDqW4mdXc+fv0+8C8uj03BxJ
	 bfrtcQXLuCbnrvI+IxtL7GIv3oYeZ5+6vuaAPOki0eTXZBqb3YRH3+psoGZoUO/6yg/xL
	 L/6xpZj5aUjav16eMcYB+OByDW8C+UnSiP06OT65SxD3StK2cCS5UfenEteYKNLlQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAkPQxJe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXWTU8W5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84A60A2602
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E84A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAkPQxJe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXWTU8W5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6E9d1955222
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=; b=LAkPQxJeD1bDr/Kt
	ee5zmzt8kC41YgfuMuYkYCVl2/NgNM8v29SJDvI7rHsFMpwwxwXgsSGayehXPLh8
	wrpiLJ1inOmaeYYEjiDDxo9ttACXJlY0IothTdtrcuc0EgmzmURxeAAQ1PUf4Y10
	Ki8GnDioG98bAgEeIJ8d5qSowi7VrLrW7NpwuGs/wAPul4wU5qZXSsmPKTZYhret
	88z2wzWgAcDIxxr/01I6Y7MoqekajN1b+0KTbOeSYxfMT4Pp9Nndy0dTvqSyy2Wl
	bXA+nmHT1iMRgeTBJqdSf5Tyt24C9XmdZ9QkTv91Eq0DQSwLRvR3y4AfZvXx9yyt
	A2KlJQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso235873241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769522; x=1793374322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
        b=UXWTU8W5gyoiejCc4wKW8d+B+9ZS75ikd7aOGnd4tcoCGYdfevt+Flmt3+dSOoZTNx
         LS3kqf/wyopwheZFcDMf+in3+3o+UzPfu6v4/oXVvLyw49WkwnemUn3USkWDI7vbtvcz
         aRyn2zkhvkZtSDOnIXptlAfntoOPKH/2Bc01MpkkG/Os5lyudJdNHKaf5awX80fZCAEb
         znKJK8BPj+MMqkgStnS4Ibs7pwhRqerjJcOUV9eYKsF5++SoKno/eU8qPhGYJM3WVdS7
         LqQddhySaI3xlvCEG9aD8YjhVw9ayYQFfNYhSHCdZv+bEUMgfZquXJ0ioXj0fpvbXCey
         5HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769522; x=1793374322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
        b=D6yL25wKRN3Pt4Z91g1VcAu6z1KO3BtViG8LTjH4LO4/nwvMeUrbouMVBwGfps5g25
         2UFuxbLKQ8WHKf5MuTDAmAYqh3bLyWFQ0FBVCKibgllCjkeEgUs/JrYggH56zqnpAOXF
         kn1Viz3pI/uXcS9AFIKwYI1pTSsnTKpC3J7+Gs0cKaMS6HXXWzT06KTgH29jJc+eZIGQ
         rZZisba0n9AWSB4suy/GPPDLL0jMgLG0wRmTkrrcNV2agXkkOrUQ7/n0dbe9oR92Iv3e
         wpd0IWpDNkq/qvjKonB7B+9ASdJoAC083p9ysFhvJXjHbf9/Z+pQhKZ0KSEfKpzjrr22
         +sNg==
X-Forwarded-Encrypted: i=1; AKwUvByfNB746F87DGdopbfSq46XwUPkLxIgGXqGLCVFq2J/d5Bwa/3HId5W3hhiyeMBEk3AIQ8WmVI+t6NsbBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhwaS7Jfe0WOCy1xeACael6mPkLg8vCrtny0lRgPNgvZxxwqo0
	nrmkMlh3J2o7uk0+ofm+7vqzeqlMqyJm+ZGkb8kCN1sb+vpvmLYcpvGUZ7Y279/FiQWgf6hRo76
	OxAy5V6RzTPoAM38rHNhaiNDXB04kbT023AjDsjU1nUoCHZuAHY9QnqdojWs5/R2ek6A=
X-Gm-Gg: AYBFou3/sz3FXoF9/euz5l5RnAXMjkiOWMBlAz/cMLve6yyI/qhwgm474w0ZTjdl9q0
	hPS5TcFnUmkKSSeHNLnUU7oUhvN0o1RSjPW03OFUF8AF/XN5+02o0Tsy5UtkDMZUlbYwV0A/QWR
	7E3RtQKmRLNCSFf1G7TkrLFsar/PgVn2cQ72+tpelaGeJVcWDE5g9mN63oyz7n1F5x90HPlcLR3
	nTrEzPW8L1aTYvyEvqo8fTVpxKdZ6aMFyNWaY8PLqWKmnxMBKFIH8D+HDmmu64G5zRKfV9GWTaM
	QE3AIK33D6MxnJID2iTaa9wivXNbC1DKDbVmrmS3ivesQYil01dxqs7aK5NwiJGfNq3XjEBOXOP
	dfhcCPIeT19SXJoz6pyS9Z7w3JZi1H+pSy5KHO/kX5ZebE8s2R18lAOVLM0B+UyA6IUgQArqlud
	w2/kAKJLVscpwS
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938883137.31.1792769522349;
        Fri, 23 Oct 2026 08:32:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938856137.31.1792769521788;
        Fri, 23 Oct 2026 08:32:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:25 +0300
Subject: [PATCH v2 10/14] drm/msm: tear down only a successfully
 initialised KMS
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-10-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PAN630EnSzX3BheqdkticFypvYZfbOBPCaMWsVhZcGc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233YrOmxPRIDaXhST+Pt2z1sgFp7f5ZUnmoOE
 2KHOhxQI3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92AAKCRCLPIo+Aiko
 1XfaB/9PXSyiHdQxAHGqMgIcu1/9M+kv33GQSfsgOzkyKmv7UpdDp4EPbB1FzJgApgHUSp2PsaV
 Q8nElS8UWPqzWBjluph371P4W21eRpaSiVVjIeKw9KLGgtJ0zIziUKXmBDwBq854Yrxb5zjZ+pJ
 KGWxC+pvA5c1WlAVgGSudxS6mLCwVvHZaEyWT1jG7mdGJ44MzV+mHV2lZk4icUIivJ5cdpX72lL
 +YDQ9nAkF05KIaObCxqhwVN3NciYYnzEauaB+p5YpgPppmxTadMIrGFJ8VQlyf6aMhgsDS1lEG4
 Yfgvwd2rsD12ZVcu6ETNYjNZSQsldlCP5ekB3kFcuaOcnRb/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwHe0Qr6y/Tew
 75Ry7dozNTy88WjHyFGnINI146b9HidOF52RHEKIJSwf/pPFyEIFCHMOTGGUTdbTVVdlcMjnvkk
 rea8q3g5kG2+jpCsCM8eaY0ZCNVj11w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX/xfNaZDMGIYV
 l/g8j+HqXZUM3/hwZeN1jMdxX9po1GD0vuIogNhXkqER471v0Zg40hX45CvpMYWcLRXppb1cAhP
 8fC/HWQsaRBaDjQV86Fspvl6AYCGkS6i8yt9ZEtch5A5///PqlD2R/Q6VsdjHf1duyh8I5wb3/A
 +YUvtdClKYhS/1AqqAS9ib3sZsrj7qNEuyu8Q0eeNXLNT6/rV7fG5ZWq6q34Qnnq6l43KkFDkT8
 rAlLZXOzbqDVP6iCKPupCCXxGDMdZrigxFVWEnU/r9n0cVQ41xAwXDr7PJWbkuUxh9fIFgzEiZ1
 137mHZHX1GMRhI98TmYLzjY/ts8E11vpiIaEU/DA2Xa+OcmmIxtoMG4HnOwoGSyFLjQjoDduPQK
 aTTbFUxGRxg1eS3Kl/lihnOsWC8fWqF2qmbwVmkTYiOPXvROOJo9Rpj509YbLaqge5f9xkJpyxn
 /srcf+R+B83lMihW9tQ==
X-Proofpoint-ORIG-GUID: orVJYqyufoCqnZzYxS_Q71VQcr6b8Myl
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7df3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mlEQwpWygrYFFZNu1HYA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: orVJYqyufoCqnZzYxS_Q71VQcr6b8Myl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

All the kms drivers now undo their own failures in kms_init() and have
folded their hardware setup into it.

Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
successfully, and remove the flag which let the drivers opt in to that
one at a time, as well as the handling of a half torn down KMS in
msm_kms_destroy().

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 drivers/gpu/drm/msm/msm_kms.c            | 16 ++--------------
 drivers/gpu/drm/msm/msm_kms.h            | 10 ++--------
 5 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 255beb83fc94..65ba8fa697e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1290,8 +1290,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms->base.init_unwinds = true;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index cc6f202aa011..b6615427cebd 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -395,7 +395,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	kms->init_unwinds = true;
 	mdp4_kms->dev = dev;
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 30af8ef51e4c..c349eedd55a6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -505,8 +505,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
-	kms->init_unwinds = true;
-
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e4d61935a6df..9a207c1e8583 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -293,17 +293,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		if (kms->init_unwinds)
-			goto err_destroy_snapshot;
-		goto err_destroy_kms;
-	}
-
-	if (kms->funcs->hw_init) {
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_destroy_kms;
-		}
+		goto err_destroy_snapshot;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -347,9 +337,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
-err_destroy_kms:
-	if (kms->funcs)
-		kms->funcs->destroy(kms);
+	kms->funcs->destroy(kms);
 err_destroy_snapshot:
 	msm_disp_snapshot_destroy(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2f097e23e2e9..b5e1cd38cd8a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -23,8 +23,6 @@
  * for constructing the appropriate planes/crtcs/encoders/connectors.
  */
 struct msm_kms_funcs {
-	/* hw initialization: */
-	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
@@ -149,9 +147,6 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
-	/* set by the kms drivers whose kms_init() undoes its own failures */
-	bool init_unwinds;
-
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 
@@ -214,9 +209,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	/* the kms drivers' ->destroy() also runs after a failed init */
-	if (kms->wq)
-		destroy_workqueue(kms->wq);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

