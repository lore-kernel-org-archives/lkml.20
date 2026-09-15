Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22913D75B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509619; cv=none; b=r0jqMn5fTeW0aUWQkHkiPWcVQG6WGRHXzDHuqStv6EP/iZ1ZXrgKF65EXvFNEsFbUlmm8jz9mwiIo6G/Ml9zXl9jZlWGZ17fgN+/nwVo0eSxzdb3V/TZx52f6R8+aArgrt8y7ESCExUFxPQNCYpCYZYaQ3vk5LhjTf3uUmLr4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509619; c=relaxed/simple;
	bh=wNVHPxkaB4vrAU5ZuZlGBH1cLJwrMzXxiccFlSIQZNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R71Qfs0f6wu1MJV7t6+8LOTI5uY84qN90srsjXO0dYgILju/7peREndLMoe7gsjdOVCuWW7HtkW7hCN3s/NPdVS6x6pdgPt5XB9YOFP5nAZ6iDDJ1fl0My4vupq+u6F7HtcJTopONKPm3bWkDWHEYpmMU5gfF9Q4lJSXBRE9xWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuHy8eyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvHQpKR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuHy8eyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvHQpKR1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYedT225019
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BTDWLVoCVpMxiIxViCU2K9
	N7MVy4z71iBiixkHSPnCI=; b=fuHy8eyTiPWYb6Wb4HmV14kuOJaD2yyjbkivhj
	FsGdp4ywIv24yI9TGtqetdiGNm7N3Vyb5uIBc1tVcuJvF9XXrH9V1nFaeK4rYnoS
	vya7R+q8u5wlCdBUo5lHMGLsxzx0i5+0KmoOOYIyYdgnkqvPFOUsjlwms+XlIuim
	x7RECpYD9Nd3ddha1t7zRkppKHoXwuZo27dfg9uxUhjkdcLqzQOIp9Uw5rYrxlva
	JFt+LvnRR0V5XseObELQEVSzTxk6t9i0blvkGAFQ0yIn45IBV2BnqkJ5JKfyRCnF
	gTvGXLudVynqsZ8zvVJ5AYQFVFa/toHLO+331vP29xmUkvlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmngq5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3967eca9c6aso1480424a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509609; x=1790114409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTDWLVoCVpMxiIxViCU2K9N7MVy4z71iBiixkHSPnCI=;
        b=JvHQpKR15vY7+t8LOIDxwPid6qi9PmOQENSbt7dM8sTkspo9QhcE+xo333mnYe21cB
         Omt9EOWMgnyYRt90y+EP41cz9okQgsLyn5D0IPWJ6lfG4f9PszFdDx9T6raKRoQ1UuMK
         VJzTdc6h8REpME3uFNSfD46+FPfEqLglDaG1WoFJPFCjfx96JpqQV+xX+WBgQiFZ2W0c
         BSiTeX1AzJ2/ca+GH5Q5ATY07yMoLZJ5gKSbIg9xPVi/IJbmZCWkLRiwcRrOTMFdmbXM
         Hlex+Sjf9GaueUyWhCy+QZHkeQMfLEEwXQcCGP9H2//XJ4S/MgMAz/RYpt03i+Zj6BMJ
         PURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509609; x=1790114409;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTDWLVoCVpMxiIxViCU2K9N7MVy4z71iBiixkHSPnCI=;
        b=VOXmC+6jJMYGnBvBUp9vxjBTQC8dM36CX1EQmgzy4vQQkv2VxHv+mxS5UPW7Jc1mEf
         5rmE+w3r2BDBjTVl1SCGRGcMe9JQvLAWgSY9IHtbHfK8l6mC3J1Lt+BboMlS+thhRSk2
         98W3hrne/HFr1XO5Tg0+T0WcDNTIML8ua7x6ngyKRpLRUl+G9r8j+4fMYavI2H7BE85m
         3A+mo6yAVtofMjQOE2CY8Dz9HyFGeohljtm/iazCdp8HIxLH//n/S/15I+KfNN1s0odj
         7Tq1naz0WtiQAcOSaJh7CGqyr0LzjPUcb1kvPOg4ZsL4iqWGNCJZpd/fqCgt7pD9wJr7
         PYbA==
X-Forwarded-Encrypted: i=1; AKwUvBzxE99cYHcNgPGoXlsKLJPw2I9RI6xqCzKoFvsTjKqaLJY0DrEMs3LP3DO1gx4ONa8PQASDsSFJ7KB18eY=@vger.kernel.org
X-Gm-Message-State: AFuF++m3MFm/ucHvuaesT00eSjKHz4hn6HAQI8VRkJoFgopy3EaSaoUU
	vkA7ISQikKNDXvRhWhOGVtzRno8Q0d9uCc9EE1N+45LBU75uBIMwff+8TmW71ACckoWIYE2yRcZ
	AWuZtpb2MWSMXXVjYlvKZphQJz059Q/o325DY/gA8Sx0Seq4KK5GbD+lYdWE7NwIxyYg=
X-Gm-Gg: AYBFou3i5zuM0rS3i+0gQKbwUSjiqJjwNneqIuGLsrZmnzf5Q46yML1bxBMymCPPFJj
	dIOeplmY4+7SUmKj8Xvmfw5mDSjOJFqq0U3O1e1+glsjRh8I4z2nP0EE+AHpBDjK/kE/GXTh1+h
	YR9SVPrLKfdHlmHpuSRkbfPEygya61yRlpW0sy1vhVvoKJGn6AbylHYWFot/LBeQZVuaZt98qVm
	RCc46NlUZh3kusD4/oO8e7Ef5dbWNAEw0XQpobWJWihm9juOpiCdfncDC2dOKxi3zUdXsDSxIzm
	llb5wGzgLH5Hlb27zkEYItYF6nhvnQZABFP8e879aA7+b3m+vhNny0E3sQ050gtMjcXdnXnHQ6m
	iVbE6Nu5w//Cg3r+vuiK8Nmw1zB3P9L2OZ3lVeSChlVAVbht/L9CsBWOoeaHl
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr292884a91.5.1789509608920;
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr292844a91.5.1789509608258;
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Implement Region of Interest(ROI) support
Date: Tue, 15 Sep 2026 15:00:02 -0700
Message-Id: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOO/qWoC/3XPzWoDIRDA8VcJnmtQZ3TdnvoepQQ/xkZI1lbbp
 SXsu9fkksB2LwP/gfnBXFijmqmx592FVZpzy2XqYZ52LBzd9E48x95MCWWEkYbTFA615ANNzp+
 IYwSrAw4WHLF+9FEp5Z8b+PrW+5jbV6m/N3+W1+0mNUsueKIUAtJgEsBLaW3/+e1OoZzP+z7YV
 ZzVXRkkrhTVFQPGQhqjD5Q2FLgrVqwV6AoJ8EYppyLaDQUfFClXCnZFhpGcQqG931L0o6JXiu5
 KpDgiJpHC8N9Hy7L8AUIImljLAQAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=6023;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=wNVHPxkaB4vrAU5ZuZlGBH1cLJwrMzXxiccFlSIQZNA=;
 b=8ORqJ5QfpIv+SeERrouPNTQp/qLHNtcNnZjlisJMPTVyFTkL7Ft0nDHbfRdVdjycSkQFm+Squ
 HaV4E3UONZwDDn1vHyGcfCscTC1tySdFX+THuQxedUyhzx4srtDTR+1
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aa9bfe9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=M65a8TQjgKWshqU4mUkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX/3YQG37xMYpM
 pyI2Kgn0RR+YiF03cLsTzRZgv41IqiE5xHw35i3qzv51DuVWuQy646MXg6C0pV6pehDg7uRpi67
 T3nJGXz9aWbSL11cYcdYB9QVvR7ReS1ChOOOYTMVAhQzTvGuPXhBWeItFr/I4nYqbW+ZWg61uO1
 Ojyi9BJu2v3HKq5eLUqYZD3Bu7dyFE8Zm6C0ACFcauPcaXsocVaUXaOpoKr/PyyP/ea87QyXC2A
 4AA19XHwp76MnqUDx6Z/koH2keWBqCy80CdVbnT2nGoaQgLNkBkv1H+hPz4/9HjxiTjlNfJU8Rp
 +gTio8LHTaaNVB24hawbTftA0fjbXB1Hb04WokSFfSXa/Lx2XNJf0dj/n7nSnAmG09RInI9sWjB
 xoHSPOV1gaq6wlsYb+fuurlltBDqgj18CupZEJuV94f2VDTmswItV/OFYBxxvV1jkB3GEPniiwA
 98r1x5zC/iLW5QQbPrA==
X-Proofpoint-GUID: 1jiTL5ih58rjmYQF2n0scPU8BUbsJ-iq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX01m44fDYMBIP
 ePVIVyumLCu6sGC6WB6Z5EGhKpdR4wcMQowzrsI/TxW01HMFVtn0naReS3H0w9ceYjtZnkbfgnz
 LpUGrDvbbq4TN5UFwJvxfTRjO5pXGyY=
X-Proofpoint-ORIG-GUID: 1jiTL5ih58rjmYQF2n0scPU8BUbsJ-iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150321

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v6:
- Update documentation from custom to array, __s8 to __s8 array (Hans)
- Update documentation and handling for non MB Size aligned frame resolution (Hans)
- Rework patch 1 and 2 to add V4L2_CTRL_TYPE_S8 type first followed by ROI control (Hans)
- Simplify handling for V4L2_CTRL_TYPE_S8 in v4l2-ctrls-core.c (Hans)  
- Link to v5: https://lore.kernel.org/r/20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com

Changes in v5:
- Fix Media CI errors.
- Rebase onto media-committers next.
- Link to v4: https://lore.kernel.org/r/20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com

Changes in v4:

- Updated Documentaion, clean stray lines (Bryan)
- Use BIT(16) for header version (Bryan)
- Split patch3 in the series to reflect enumeration of
  the platform and adding metadata support and implementation (Bryan)
- Link to v3: https://lore.kernel.org/r/20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com

Changes in v3:
- Updated Documentation (Hans) 
- Reuse ROUND_TO_RANGE_RANGE for p_s8 (Hans)
- Rebase onto media-committers next.
- Link to v2: https://lore.kernel.org/r/20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com

Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (5):
      media: v4l2-core: add new control type V4L2_CTRL_TYPE_S8
      media: uapi: Introduce new control for video encoder ROI
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  26 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 +
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 123 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 +++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  14 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 455 insertions(+), 4 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

