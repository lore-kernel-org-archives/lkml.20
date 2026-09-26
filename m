Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD4372049
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442597; cv=none; b=klAnmh+T+eDZaFmR3bMwpTqUNt+PzRVnwBVD2S2k/OJg6g+FYeec0B4fkbHQSbsCKYoPRYlOzMN/yqYoq4fBLf/ZkMv45qBkFzO8DUvkWJgiNqDBHLMVyTr6QIvLghG9LYdRM2Z25RHI3Jb98+DeV0odfI/EJp4weis8/jM342s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442597; c=relaxed/simple;
	bh=STiVZUpT+s3vPJexpbqT3xv1Uo/tXIYN5dxNlOT7nDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=lL4PMNKNPmEv5ivbPMRF4uMHJqbOT9z/CtF+azFr0aZyzw3mJ/f1vweRawifHvIsR2kFrH+2QYDqObidrOWBCaAAkE3LtoMgR8ndPnjzwwfaaAqWKJajYjwyfXVxD11bj+vsViof1WOE4FPkCH2Nyox899u7gK1a+gr4mblFMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myX6I7iG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayQkQRaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myX6I7iG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayQkQRaK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxRqG4013829
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiQkd4IOjtl3nJ9t+N0G9gteEttX4XPMATGJn+gizq8=; b=myX6I7iGHzzQRlhD
	edo/7gASVjd3xCjlDgxewAfq1uD+BtiWbarcnaSuAv2K97FBWnz2DTcUkwXjFCAE
	CMTGM9r32mUtjv3X2q/dRNGTViEIZcaam0hw6OY/i5Xg0Md97YCNFO5MFHOmw6Kc
	DpSLfe/FUoBonJlRP0Ug5kkLWvPbFWyhAqMy1KUwTEcmGxrc2WPwyWigxbkyPF7X
	dO5onXUJUcwLmUxsZSGNhE6MVa2iNvRXABajkb3MPVdOM1qyzt7ENYi6YeVxmmt0
	MTg3vnaiaULxGOo0z4uzY7h+mMhuVLGcMUIxmoPTT6j2QM7fgE8RATPmqFGv1KBS
	litoPw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6teh91d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so6643642eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790442595; x=1791047395; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiQkd4IOjtl3nJ9t+N0G9gteEttX4XPMATGJn+gizq8=;
        b=ayQkQRaKZ59s/WGzirnehB03wrT0oT3qAll90Osbk/uRLeG9kZjD/knAU4FT8Kz/T4
         H0gYSqIxRAoKnGj3yx6PmAT17Nwr+meDgMGV1Mr4bwIqTiSTR91Fuh6ljA2pYjcbo8pL
         U1uCCvsrJ6pr/t8zCzMsIp+hnCKsObnDsZ32Y0rOxCmT6JfKnvI3XHyg+9VQrAMePMxn
         TzJeExJI/Z8tHWIm+BJAjRS91nRCRJG+pb1KzDxDxeN7kpWRCfIGBN2okeOqg5mOUt0n
         FwYguzc4FPFP1snCNLjh+g8l1T4bUDatHvG4FhIF91Z9n3sPoGSJTIzXUxGcRzKkmAx8
         zytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442595; x=1791047395;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiQkd4IOjtl3nJ9t+N0G9gteEttX4XPMATGJn+gizq8=;
        b=bE7v4lBumrrnJkJyibawVbVcJ3XtNNDFCbNjv8r+Ov//NXcjXIkNOSUcj2rwV8C9w0
         VtD5uoQ5cWV8b/xl89eqIjsoaJsSPWSQ9tSEQdbhP6SQRbaAfN26CYhuIgYGiFg6Ysc+
         4rsCJaLdPZ9eDepnRM6hI7f5GwwLc2SjUTUHo6gdMrPVGQ9zSPqQEUEje22w/5JCqVE3
         vZ5dbJEWbYj+L2gwTg61THzWHFwuIXiF+ZuSi5krhbLTULz/6JvFa6ttWRoz6cOElYpZ
         4evvlqdeaJcu9+EikKqs6+rnWLSqpO46G09nxCPpkfZ8MQJWjwubnjwVhu4/R+k25z5u
         Um/w==
X-Forwarded-Encrypted: i=1; AKwUvBzNQi4Ecl1VL68Rx4sEIbn1V68biX+2d6rgU3WHgsvDYRlIHHhv5EB+DxriOLR5aGbolA6HpKwdMIm1nVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJxNCl7Y/IzSb+6TDSPB1+b5Py9uIUceFi/py6kgiwcaY0UvGq
	BavoooO99bftnskwD1+W9YQQHFdGoPX2uBlX3Pp7pQ08KtpBwA5/31bUEABMuEJOPRgIfXGGT7c
	aWsGdSRZZZZILaZBgXOZ4XvwvBDNgkcGwJbKjPKQoNwsXjo0XHtQP0Y3MoC+oMBYwQyo2VpwIJP
	U=
X-Gm-Gg: AYBFou14Dy4iExrbRa5p/y2tTTka6RatfEeKElEU1KLBlh7HAughp42Arf2oYDL7FMm
	V8ZtlYuZHIuvBDS1I1q2anI4kmHx9cBesPkqhqQMnQRTypt9310vez0Tl6NFqCGH1Loqh9ZR5on
	q9YZ8ByqdVg2pcFYe6PeQg1dacBBJqdL82Lmo5Q3JcgO2abHCHHzTVlR1gXI9DsONWFLhGtcznu
	SupokA1IWl47GqjI9AYg3GmCRiuv720Pd5YI7aJiD6DOd/+Bp9VKRS9x9lPWI2zhxDm0hZhDrXy
	MqCUIthuO4TF63TOp6nuM80mhb0Dvgt1CKBlzxcu4aGKeHOL/tsheoW/7T52mRD4iwnJeu1H7Sk
	b0tbhCtvCXdcRazD0gZM5UQawPFck4w==
X-Received: by 2002:a05:7300:a498:b0:33e:4e63:5d80 with SMTP id 5a478bee46e88-342703c084fmr5279616eec.11.1790442594501;
        Sat, 26 Sep 2026 10:09:54 -0700 (PDT)
X-Received: by 2002:a05:7300:a498:b0:33e:4e63:5d80 with SMTP id 5a478bee46e88-342703c084fmr5279584eec.11.1790442593935;
        Sat, 26 Sep 2026 10:09:53 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm7382231eec.14.2026.09.26.10.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:09:53 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: iris: add vbv delay support
Date: Sat, 26 Sep 2026 22:39:40 +0530
Message-Id: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFX8t2oC/3XMQQ6CMBCF4auQri0pLVBw5T2MIaUdZBKg2mojI
 dzdwsaFupnkn+R9C/HgEDw5JgtxENCjnWKIQ0J0r6YrUDSxCWe8ZFIwig59E9rQGBjUTEUuDO+
 UYFXOSRzdHHT42sHzJXaP/mHdvPsh275/qZBRRmVbKFkXotWmO1nv0/tTDdqOYxoP2cTAP0rNy
 y+FR6USxlRMloUB+KGs6/oGjhGw3vkAAAA=
X-Change-ID: 20260730-iris_vbv_delay-343d2fa30842
In-Reply-To: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790442590; l=3542;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=STiVZUpT+s3vPJexpbqT3xv1Uo/tXIYN5dxNlOT7nDU=;
 b=0AcClfDZj0jyfJgRc+SmBX0NiiZDs+Ax/t3/uw1bDK7DzcrZKSAiXUTvwyyRoBubs21vUlo3X
 uZZcJpiuX0gBvdIOrVkXIJLkGgtb7dmecALljBwA84rGqxOBg5jMO52
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX7haGcHe9MzD2
 kosNaABV47PtMt2k3z6YICH6VxnsnK+tTMSc57DMJ9/dOjeEyLd54c2o/832Ue1NaB7/IW3sC0P
 Yp0yeOz7NtWJ3Zx8EMJ0//q5GmoTeEsErnJxA6Em95S51YXGvTM1GmVoFhujucPREAUbpSfC/yW
 g3/caB7egf9NXrWfHgbmERoV/7JKysr6xubT+VThhQEF3o3pzqJK+uKUTvUYrZTMbkDZ+wlTwch
 srNHK0WNlGClU5KqL9skNL/vniCFVBDPdLhvJ4Qm6TNxXJEy7i/Vg6MTHZq7GzgYgdzTjpru6RQ
 mkwnDRb+7kDhXIHO8KNSxJdUoRZpfKb1Y5/xc9xFZE82F6kTTiJnV1AAXZj7YPhSUFsxeKM0Nx9
 6l0tPSeoQO/IpZcnsXJ1Ia9mh8YAR+tu7R3RRaozBS/oDjJgEYqRL1E9jSdo1sZBJAFPis5XnoY
 OdbsHdMhMcKBc/byqAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX4nqtg/mY/ZgL
 hn1LwvYo3lACTp13RNWpj9R0PFsnOLGHknIGOLW+NqtQtrlSgQsVDaCGUJNGjP7HL90rAMMM8ZC
 JokaZahewfsSHkbUUSKLXkyePhuxoiI=
X-Proofpoint-ORIG-GUID: IGpcA0EJIExSTQA4M5OQqsu5CB_v5wPR
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab7fc63 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C5IDlBnpNeGhfuk2CuwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: IGpcA0EJIExSTQA4M5OQqsu5CB_v5wPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260068

This series adds VBV_DELAY (V4L2_CID_MPEG_VIDEO_VBV_DELAY) support
for Qualcomm iris encoder sessions, allowing users to configure the
initial VBV (Video Buffer Verifier) delay for CBR-encoded streams.
This is useful for latency-sensitive encoding use cases (e.g.
low-latency streaming) where the client needs explicit control over
the encoder's buffering delay.

Patch 1 is a prerequisite for patch 2. The PIPE capability (control
over the number of VPP hardware pipes used for a session) was
previously only wired up for decoder sessions. Achieving low VBV delay
values (34-100 ms) requires the encoder to be constrained to a single
VPP pipe, so patch 1 enables the PIPE capability on the encoder path as
well, which patch 2 then relies on to force single-pipe operation when
VBV delay falls in that low-latency range.

Patch 2 adds the VBV_DELAY capability: it registers HFI_PROP_VBV_DELAY,
wires up the V4L2_CID_MPEG_VIDEO_VBV_DELAY control for the gen2
encoder, and only applies the property when rate control is set to CBR
since VBV delay is only meaningful for constant-bitrate encoding.
It adds vbv_delay support for iris HFI Gen2 based targets (qcs8300,
sm8550, sm8650, sm8750, x1p42100). Support for HFI Gen1 targets will
be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 \
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
initial_delay_for_vbv_control=300;" ! filesink location=/opt/test_enc.h264

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Changes in v3:
- iris_set_pipe(): check fw_caps[BITRATE_MODE].value directly instead of
  inst->hfi_rc_type, which is stale here since BITRATE_MODE is applied
  after PIPE in platform_inst_fw_cap_type order.
- Link to v2: https://lore.kernel.org/r/20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com

Changes in v2:
- iris_set_pipe(): use inclusive VBV_DELAY bounds (>= 34 && <= 100 ms)
  matching the documented range.
- iris_set_pipe(): only force single-pipe under CBR rate control so
  a stale in-range VBV_DELAY no longer affects non-CBR streams.
- iris_set_pipe(): read fw_caps[VBV_DELAY].value once instead of
  twice in the same condition, and derive the default work_route from
  the immutable fw_caps[PIPE].max instead of the self-mutated .value,
  writing the final decision back into .value so frequency scaling
  picks up the corrected pipe count instead of a stale one.
- iris_set_vbv_delay(): drop the dev_err() logged for non-CBR rate
  control; that is an expected, valid configuration, not an error.
- Link to v1: https://lore.kernel.org/r/20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com

---
Sachin Kumar Garg (2):
      media: iris: enable pipe for hfi gen2 encoder
      media: iris: add support for vbv delay

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 52 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 19 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 69 insertions(+), 5 deletions(-)
---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260730-iris_vbv_delay-343d2fa30842

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

