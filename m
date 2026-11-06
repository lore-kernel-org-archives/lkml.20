Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972692;
	b=rFcNdf8wATKkWMyhNRMlglP9wuB/Cd9PhrC2wKlV7/xVvDH0DuLHlYwiWvsghxVt5Ilm
	 exZcZJkwJsTwZ0OX30YN6BYUHRumiT9YS+Mz08S24XFcH2tmLkocXCxMhBwIIxdMXLFnx
	 GJ3HTjfn3qUj/QhmlifgwUmpdMIIKTnqWlJlYD4U6bO+3VBpku9wsO8Taktbhitcf2KZ5
	 +INaQj730CAP+d1y8BM5xHc+cHXPUeCNShFIobSOAzyf8vAIArdtUWWnl4tjGWDYlsyf9
	 xU5GHIcPHRS2EYRB5DI8diIBiBY2oXWAdMh6Bpj824IQ4vn/m688MRoNGztSbmVfVTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
	b=V/bizRNZb8MDCOkAzBB+kH4bJM5Wf1WZ120ldfhAXdhIamNu5azQifOqXcGUkyb1oy3s
	 eBlE+K8lS2mvL1joljtsRO50kJfAt3DeNIXWpbKKKLAM+mZES6OHtigJJH7HL8rYrBE0c
	 sKi6qLjc+fr1vpHxZgGlW3pGNyuTJt9aANdXIYFlfErGA9hYfJlL1J1FRPIrxwCSFl1Cf
	 TIRcTgPoIJAcPkYSnoVRU5neeQXLUTpkdAlPxQ6eIavksJZGjrfxTAKuEHdLkyRmu4BON
	 W0DLO2Id+DIodLfv3ZNR+jaaJ5o1BcfeCH9ZMF4WfPCvdlzFcU6Tc8s2RSe4v1CVO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCtlIrWk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8dxfjJK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C86082BDF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77C86082BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCtlIrWk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8dxfjJK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APQ5k527862
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=; b=HCtlIrWkCwx7OWhM
	nrYCUiRxZaCAK6pjTBsdZwRjOiSvJliD6PnepH6C1lpYDTVgDIbWUGmZWg0bJew6
	wm5qVxLwUbK184Jx+6jm8QOpBoOeGDROD5k3W4E6x9KNdEaUE36nSsgsyRyMBklU
	ejygzOCvkH2Z917JRex4QUWGZHs5LnfE6ebSIni6JH7Mcr4jtzNWA8f6rq3IrxG5
	f4NJ03KtUhM9Nfd0BwW5S4wyXneEVPm2ebTbImrU4SSstTCHeceTmfJeOyNQEFrN
	rdmD+DzLHe+FPpoI2s8RPhBVbvF3HDwu9ZAe8GjM8H7Mn+ogi9LUjkEoGZYaSLEx
	BVQizw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u05b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:44:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so156569385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972690; x=1794577490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
        b=i8dxfjJKwoXzFabyzQbMlpwDZOSe2/9371fu1qDeVM8Nuaba+n5ErGBGQZWMxVYZ/G
         av5qLA5KfFwbyabCJ/Yp4E4DFNF6w/LTV7JfeNg2HT1YALSQHoErj9ZsCD2l4gW/9bDZ
         rH7YUCEvPNAeWUtMUx+BcORhwYi+wG49fyPgCf/aRx3EqfJ84L55whytvB5uSKOkrgET
         jPnqTCIciHoq70BLilbYFIoIsCMyOmwJmQtQM8k9YqaAmyhKqri9dIhriWAaLWpitYuG
         swba32H+WVD3eWyYZIyjUdhUx49ran3qMykVonSPQY/8+7UEuIHhS6yQKw9e3/DoOXJv
         0W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972690; x=1794577490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
        b=Y1bvwJMgBJWV9D+lAU/Pxl0IFrCl6mN9b8MQkVXC5hHzKZPNKtDfUuuKUybdZuFRlz
         yzv5whhZbq2tDw93W2rkOyCUkF5bwdddJ8l2qQHT0Kv2PPxATSmoGrV+HZ9IrahS8ZLB
         QW3n9Q0n78zUpydsNe/SPtiNw64bU6pV75ZagHB+VoEWR+V8dtd/ZhuBWbT0v5cp4moj
         r8Jsx/o349Oa4F2LhaN1iKdTtOCIyLsP9aPs+OAClxKeQA9uSw5WF2q78hRMdGTtHiF4
         +j78Fzf97U7+Ka25K4pXezythoSGF0UmoB1szcupPVugDZVyN5bdI00h9p5W8B3ihjPI
         uX4A==
X-Forwarded-Encrypted: i=1; AKwUvBxlsbqliLWcTTO+20XlVi/EE9sdYE53Tkchhco5RCRNCnPrN63l9mZ9pkEVh+bHsGmJoc/2k/897lQlP3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uVLko3QZG2DbaCb++YmoEkaAVafUBxOcBLOie4Jl/elet8KCv
	M2NgGvu/cftikN5nEZbtBxMbWAWwA6piKyCo1fbiMujmem1HA30+vbVgR0/Zv3DC9+NnLc1mJ+N
	HQEI79/THV64DjpJMewfi8HDegB3ud2MSDRQ84kaVIVsA/UG4JbsAi3ybK8ZvmflyFuo=
X-Gm-Gg: AYBFou0lSD7Mf/+gqAmRuT2dsG/sSlV9kHILJWXBIbmm4z561HYMEMjw/eNLDXtC2nK
	aXHo/aQJV4j4RBOaAzCBECmY2R69n+YFBcxmKnLy55S3MSddBMlbkbA38YMm/0s/Ku1YgWfDMuk
	aFmjkO+IEAGXzjr+TyL7iwI/ph7yx+cFAhdfMhHqjHno9Xo5YmjBhDb4Fpt8j+5PKsWFH35BAmW
	aAtxAo6mieKZkc6Iermb56Ur/2XpfiEa5s+0hHVrkR/W80iN+NLSf/raOjRFHJrg70qXWqmlZtA
	GzMzi9N9vaqR2j4HrkyqC2AzydVLc1bNMiLwd1PD67w/SFcsFOuFWAf7kviUUrdhTnc9tbEamqr
	SkEKAkZcHhUgO/8H6ONfonGKk9mA/y4EkmDY+fT1pO29mnOpuklZloPHWjzDW0TkWewTNW+gqXM
	xIaTti1j3iXEn5D2elGDMjgSfN3bqtggtdLyqxcC8TgGCKPNkHrSBZ1gBJvx+1Hg==
X-Received: by 2002:a05:620a:4804:b0:93a:11a4:223c with SMTP id af79cd13be357-945f338ccddmr335875185a.9.1793972690059;
        Fri, 06 Nov 2026 05:44:50 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:93a:11a4:223c with SMTP id af79cd13be357-945f338ccddmr335867985a.9.1793972689409;
        Fri, 06 Nov 2026 05:44:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:13 +0200
Subject: [PATCH v2 7/8] media: venus: report the QC10C data stride
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
Message-Id: <20261106-ubwc-format-docs-v2-7-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ut1xc1q+G9TMsg5s2WqSp3Sx8sHVKqPmNJ33tZpkuAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm8KmXANae5Tj5iETqw10bNgCF735iCp58sY
 gxJ/9xUgnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZvAAKCRCLPIo+Aiko
 1VFICACKMLr2bozdG6xmGkQOVhrx3vYFq4ngn4q8vUWW1ZxoofkgGAikEKIPPuPSkb525LryrlC
 0XAenVx9i7WZcQtxwFHueXJUwPwuxXEhcIJfJMiPxfzNrmDZC/o3IzQleukID8s8sCwStuVsmbl
 kln32bNC8arP15mSXQ4bjB0Lf2zWr/thF9Hh5DHCJTlYXwAGTaYtA/PPxwzjxHBMsNEWI6CLsE1
 IKZDeh3LZPSlTxSxJdeqdLQG+CESLNB+fjo36WN3j2ndFNqfksBqNIC4GxLw8aLchs06icl9kCQ
 NUZTXEu4RKD/OW4uxQR9qSZcZYbK+DsozSi4aS79slcX/uiY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX5I3e2mSrUTys
 h27X64+HHO2CgMHpVAOkgNpCyJieCPgQRBzRuqLmwQm759wFcb/s6YC8dwznVw515sQ+kAo/sxF
 3jgikYLwhUWQtdfiwwblWYMELqe/2Uk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX52DO3Szs5b9B
 KBAz5Jerf3S4jYXKq8Jy1qS5RQOgyZwMLtrSEV2W8L+ol6wJdosPypXps4xiHQfaP473q7gCzNM
 uRijzDlyFUfgCaCWWorRNua4Q/f9aZ7YxQ97RvtF23efV7b/QhwCL+Tk2WFzi2stg2PAB77eg13
 AsFaHNy/DLbSWeuW0i6epkg1Hy9qN4IBrrThHT8T2fRq30nzA7hROZCZWTe25bKUhumsOsh6M37
 4T1TRRbnO4GhRhE3rCGCzaq0/OobdUl2p70NXPEXQWHc6cigJrd/7zRg1eiFXI3D8LiCrXFwKHV
 ncObyz3tKp/H52Hb4KhdYEQMbQnqJqKj7Od9xavZlqQB/WXWLsbxGBzdRBYdPihg6lCMfBpXuJm
 MdWcyTEsBGdTfQ250pr1QgRuSkn4l0mRs9VNSMK2XCtYw+dUe325SuIREV3luVp2v6UstcVTQa/
 02X9I9KG5juddFx+yxg==
X-Proofpoint-ORIG-GUID: _Oxlh7ibOpdGlexsE30hzD4qkcg42tP2
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedd9d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lvl4w2d8MLr2OEpUskUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _Oxlh7ibOpdGlexsE30hzD4qkcg42tP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

For QC10C capture buffers the decoder reports bytesperline as the width
aligned to 128, as for 8-bit formats. QC10C packs three 10-bit samples
in 32 bits and pads each line to 256 bytes per 192 pixels, so the
reported value does not describe the buffer: a 1920 pixel line takes
2560 bytes, not 1920. Userspace passing the frame on to other devices
has to take the stride from bytesperline and gets it wrong.

Report the stride the buffer actually has, as computed for the
buffer size and as Iris already does. The downstream msm_vidc driver
reports VENUS_Y_STRIDE(), which for NV12_BPP10_UBWC is the same
ALIGN(ALIGN(width, 192) * 4 / 3, 256).

Fixes: cef92b14e653 ("media: venus: Add a handling of QC10C compressed format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..9de0c9bc2919 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -227,7 +227,10 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 			stride *= 2;
 
 		pfmt[0].sizeimage = szimage;
-		pfmt[0].bytesperline = ALIGN(stride, 128);
+		if (pixmp->pixelformat == V4L2_PIX_FMT_QC10C)
+			pfmt[0].bytesperline = DIV_ROUND_UP(pixmp->width, 192) * 256;
+		else
+			pfmt[0].bytesperline = ALIGN(stride, 128);
 	} else {
 		pfmt[0].sizeimage = clamp_t(u32, pfmt[0].sizeimage, 0, SZ_8M);
 		pfmt[0].sizeimage = max(pfmt[0].sizeimage, szimage);

-- 
2.47.3

