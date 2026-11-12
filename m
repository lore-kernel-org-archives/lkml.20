Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500137;
	b=LA6es5WA+43KVqphFRFyMtsWKpOk8mSMovvnRR0FgBjdAmHelht91RE0enEcEfoiopZM
	 lnV6CodzMbzam0/O9BPpPpbbFFtfXlgH9/DdWFgGAHT/Ip8gEO5HoH6FkoSMsDHLvsYJR
	 mMSCnJETEGZhrb1rMiqjK+zZRxcSF251q7b9nCyVxiFdcsXl51+GghgLIQt5aarok8LDb
	 Nq+3w5sYl05v7oNSUx+evU1q9CPvnSayxpmqOlPKv3thNhYrnbzXP+ZsryGIxUxV04/iV
	 IvyUvkAlvw9+bv4l4UpsoFv+sLqiQqWF10EdinmJb0BwZ8YdXYJgpT9R5DhzbJwsx2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
	b=hVm3os5FGtcGeFwL7k5fPkmGcYtqznobGID8UN6asKYZjrlBT5/f63+cfDi2SgzCHZcz
	 lXusV/3edEML7VXleyFLRD4UeWaY3FUTWynYMtMqJYY1DDBjJDPtCnERAzigswSlaKyh6
	 x/55ht4jVLTUotOKSqUXQzcsiynzOjSWak0PdeR98XwfVj5UidxFoynjnReGsDqR4qGpn
	 LXwtwISc9+UZV+a7518a1azBQo13piKUXXzMAJdkYEUCNcLBHwYUc9M6Cp6GbM0XIA6wh
	 WNR95mbztPePCKPYQMATQiT3prIPR90RlHaHO+apcugog4e6kFZtNMzgr1fGDV06X6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZgpyJ/j9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3B60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD3B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgpyJ/j9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZNMB2293265
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=; b=Han4b3j1QL3ItFZa
	H3qFmKDcFOQ69n7RLBQxuWcIFSoboWfJAl2S2sk+DuQBCQqQygcHsrfKRdneCV6V
	w/V32eqG2JX2X+gv5hPhEdA0dsU+i5yOImLzhihcKIjhBW4YeySA1oW7BidYc5Gh
	elaYhqFZvXjvtBK51BH2BtsU1SMU8P260MGrmYp4R5pjJDccMFSw/cKmwI1UhiS4
	BZBeDgprwqQyn0sPjGJZpAFN7oRR+QJLOCZ1hMRJiiIszcCtZ0FyIYECJ6EtjKk4
	ujh+3SH9m1BCnyyfLaIMoCXDuANxuywY8f+DkhG+Pvq7CTI40BepaiiH7s0kAglJ
	cHAMFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs0187v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2eba206f4so3231940137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500135; x=1795104935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=ZgpyJ/j9FkBenDESjwRBIAm1j+23w6nru3lSoCD+nBGlgXWPw1IYf045rFj8dAg+8C
         gUnXVREyCUDxLuMpdxJrmy5koKgiPRgmUowOODAC4rLn3gCOlvzMnRTQ9vxGaaIFfiAt
         ilHR9yKDdZ0KrpGd5QST1NRXdfwlXuPRCS3go+UDmH+nmrcLuFUgTEHvhCCRJjSn0wc3
         U54xCheNnuqsnbBesWcPtuc8Y8QCWd0H3ayQ+xM1WZjW00tRVWvhbcAMeqi2IbILOKW8
         oUDIFN046eXrnnu/1I8Pr9r2si8VsoLeYmOpaKPLahr0nJ8P+KqRuxtdO15tbUdouaPL
         CkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500135; x=1795104935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=Tonju6zUUJwWUzaML8GYkHZp/vsRx4p69gObNqczdCoYoCom1Ja48mhsP9CgnCbFu7
         CJ1tkE3m5tPnrP6uxa6W+L5s+E6jWWWDPSIb1N7aW9dLz9yVaPvaa9+M9Mtz2qaMXzb1
         YO8cIJlETU84V5VC9Sfh2iYniWv2W3f7DBXWs9tRZP+55E8w9tb7JPaSKDZCzSW+DDe5
         W19aMr+A+fgXs8k82MRnJ8gquEt1AoOHdt8+GYa7DVCZvswTLQPIh/i9xT03WEX9m9Em
         T9VNy5ngPzPBX+c7VyT9HFGmyAm858uf2kPxQbt8bTLPXTl47LyftdQNLVo/H2P9iQmD
         xBEA==
X-Forwarded-Encrypted: i=1; AL+hErEqjrQlg6aivuDL1cagD50me/UBYDIRldIO4oJG7yViSAvDM8q4imawzTJrgmejKYIJudOjNBzVejoVxNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DHOL427iTH6tI+3qs+zdYl8BjAbc4Pe3lFGoNZ0nKq+8f68bz
	4hQ08PpyY5YnsISfRNC4/mRXv+Zd/4YmobHOvSMdD1vqiBAz+5fCxqGgen1YhOSDC1qaWc4D9tv
	v0M9qoU6sBOY1u0EoIlQQVtH9F4trJcif9bwNKhQjXbulOERKP0DMfBhEzQ9bjqrdbJ8=
X-Gm-Gg: AYBFou1QSKvnUXKNLr/Phwqutz0JokgY7s6Cm11T9mD/nW8YCsPYMSn5I+xXijru9hT
	lJQcIvO87uSaNE+F6U0XaPIemtCuzsUOeJSa4XQgRnDdKPX8WnNs+a7GMBnhyqyuCsguV1tzK0H
	8iemA/CCxQ9HGSHYLeVapr199qAbFiL7DitrBELgJmjwmVlNxOH+grWIGiY9558NmR0FLGy0S8P
	RQi1qBMcojL3ngy8dd2SKmFNJ7ZKH9FAYwJvalqmPcZaB/0xOL3Q2um7L2jzloUKnwHe79JWq+H
	jCrWOHCaBs3k/HjrGzrdnWnmT5CImPnpmxn43AHBxD+gpAYiCSv+nsiITW/4kGz3ekQ+kFAjDtO
	vdVoUrhZxsGfHO9WoBTdxFyAlvzxrddCbVhP3ySPBqjwMSU6+O9b6Tp3GESgZdEUW9wgMmgNQqF
	fzZwGEQ8Ewb3dMJ/XpFQqLZsgCkIMosv7Oe3z98M+QCiM1x3UorZkx6ro3Vzl5DIPIjNrA2xhsZ
	r8NKcFV0PxiV8n4YBgibcwMO00=
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905698137.28.1794500135484;
        Thu, 12 Nov 2026 08:15:35 -0800 (PST)
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905646137.28.1794500134460;
        Thu, 12 Nov 2026 08:15:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:15:29 +0100
Subject: [PATCH 2/2] media: qcom: iris: venc: reject encoder crop
 rectangles larger than the source
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
Message-Id: <20261112-iris-fixes-v1-2-22b759c3c285@oss.qualcomm.com>
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
In-Reply-To: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX3ZAWsEwyVKBY
 GPVgj+KGarpX72nWphMHYDfk7fxU9GRbAKRPB534KAS9249TeW8vLvvibx5EhDNHvL3nqWbG0kN
 6jLf+dtnUl3pypQeYSnii7Vmeg9s2TPpW0SMd2gyXQnKtcuJfYZRPQlzEvfPkl45hSvyXm5cT3n
 oD84HzxeFj1fhWqxDKTz051JFuvQM4NuMQGeaT9HVccxaOGj1yeyOdmQpLTrFgZq9t4mKcUeEMH
 ey28YOExloh/DxVifN5X2DngabauhPq3eTgN9V8umhbMDizI318kdPng+zhS8zfmQaCGAMKb6tg
 2RpnStKd8Cwq8ye6uRDDv8jr8GaGVb9HXVChtcMK8Kq8UjXToSb8QXfceRvn0MZ8kLDShQe8TLA
 Dn0GglAMM2eOucYNT8M5rh0OqW1RZy5GjtQDSg9Ps3CN2IzSQvo03T+aKVw0GQIoJ6SGo6WYnzw
 vYYLxSlW48KVU7o9nhA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5e628 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3rA8L1DBDF8j2ObvkVYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX4e02a3xJoPGX
 Jm3KhJd276cgDKBldvGVcQXiCaumryTlqaNkwg2lEwodd0THp86T7oHloyhy+PcNDo9dWkTkfC2
 bKCtpVQSMsvCialNZQWvy7wamKitVCI=
X-Proofpoint-GUID: F2EhDEnx4qJgf8P3fMslFfQeBdMcTjhH
X-Proofpoint-ORIG-GUID: F2EhDEnx4qJgf8P3fMslFfQeBdMcTjhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

iris_venc_s_selection() bounded the V4L2_SEL_TGT_CROP rectangle by
inst->fmt_src, the padded buffer geometry, instead of the visible
resolution in enc_raw_width and enc_raw_height. fmt_src is rounded up, so
userspace could set a crop larger than the frame it submits.

iris_hfi_gen2_set_crop_offsets() then underflows

	bottom_offset = inst->enc_raw_height - inst->crop.height;

and the encode fails silently. All ioctls succeed and the EOS event is
delivered, but the encoder produces no data and nothing is logged.

Bound the rectangle by enc_raw_* instead.

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --set-selection-output=target=crop,width=1280,height=730 \
      --stream-mmap --stream-out-mmap --stream-count=30 \
      --stream-to=out.h264

Before, 1280x730 is accepted because fmt_src is 1280x736, and out.h264 is
0 bytes. After:

  VIDIOC_S_SELECTION: failed: Invalid argument

Rectangles within the source, like 1280x704 and 640x360, are still
accepted.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index b367367ac2ccf874a00606b8b1352fed37b37a57..1af692d10bcf77060fa95c6c3906e9067d167d84 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -380,8 +380,8 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		s->r.left = 0;
 		s->r.top = 0;
 
-		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
-		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+		if (s->r.width > inst->enc_raw_width ||
+		    s->r.height > inst->enc_raw_height)
 			return -EINVAL;
 
 		inst->crop.left = s->r.left;

-- 
2.34.1

