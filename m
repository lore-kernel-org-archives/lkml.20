Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7014514753
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793044; cv=none; b=EVfx0hepzKIkP7wlIpHZLfRSkq0FzNtXAh+8BC6KtHgM3QWHOSApSS6scHuHKRk8oq1Eww5XSGfuPpnhbWq+yC+daGN+4rVS1TV7PT1dYTzl3e/BLPy2IujvbzEez26PuA08xxr/h4KgfZmFcSNbYXHI/7TFXzWNcBNkVXLb5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793044; c=relaxed/simple;
	bh=WVnFwNcJuZu6uTxG8+GS4e86AIYFkK8gCSPW8n05ioo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OkRKlUSBjYn54MIQTQ5Iuq+gldE5QXZ/wocvAVeEky6OchrBZ+z7kKasCF9/SMs6U+p55RHFBx60zwIClyo3rOMD9uWjklUAFR2j+y+wjNisnki28tKoTKAe2j/K8r5KnNe/LgO4kQXGt2LmyAx8Fx06IhEdgxW+/akh4VtVdrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwEcyi5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AA5QFyE2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwEcyi5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AA5QFyE2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UILfJv3655835
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=la1ea6rTWtTHgaqJBryC4d
	g4LdI2Xlo3ItgxavNF1HQ=; b=RwEcyi5+vHbd51A7fHnmY4YmG/hfTUn7kr8bB4
	IhsD0MyizvXh9zGzcNf9FvuegY/GcOrzqGRyjQG2f21s5V0y7NNfZkbKZ2SEmtps
	rudJ0dOE98nrEl/2o7t7dfkxYkGJJLQD8ZK5sUaqqsLeuSnzw4YgCn/gpozDk9FS
	zCXX0dWjzuPeqaBJNUNxVZBtKBBVzPlgBVyVmFe1g44oqrpmO3Ez3JdrqITAAA09
	uQqkOvo3vSP3NYmyi/cDwJ2qvnYhLCKsgAtFkn8Gd3BBxiHykpFZy5kTw6h4Fzg6
	32SWu+7dgJBmrii6iAd/X/Gy1QBt2/IN87s0xb0SRsu1teMQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvr1be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-144f87ef7d3so180021c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793041; x=1791397841; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=la1ea6rTWtTHgaqJBryC4dg4LdI2Xlo3ItgxavNF1HQ=;
        b=AA5QFyE2OT2xArcHJtIw4WDwhwTkeVNndS3yhD2x9gaMS2pj9YqX+9E245j/X8jji/
         ZAWVLCrHy0VBDVW4M4yPt0X1BWQ0HpDF6abSsmooT3QCsSmiCz0SrkZohJNQN7SwHIER
         ufZDelmun5GQv/YTEUallb3k+SxAmYQTT+76V+loXe8ScKHbaHBX8lwsvVzX/b/yFV2w
         yLE8lxLjriXJ4OqjBEiwxF1a8Js8GGjMTRrgMy/sHb2Zl0rkVnJSgK6hEQTEj/Lm6ogb
         fJqdW+wi++Cf2ac++ujiSpLioMPciHw7sif9qgme5vDYxRb9YHZlshHXR7xuJ8M447AL
         DR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793041; x=1791397841;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=la1ea6rTWtTHgaqJBryC4dg4LdI2Xlo3ItgxavNF1HQ=;
        b=ueWmnRQMlhABq0xk4viGbYTcl+NGc06pMQQ04mf+MVqTEq+jFJ2q8I2VskxbX+9F58
         l5QCBCcQ3o2tIqa/Yz/vI+6wRWeXWnWoTE+qagva6i2wYPwpoMBsV2IiT/TV4bN3axwJ
         tU+dMlRug8Cko4AW3lSvJrOY1qsgxWJg3mksbRwHjbikpxUv8qo+KsF2d6TPuuTLjIB2
         aXfXelSp/VPbGCd8+fX3/Wm7F1ho+0hMag3NR5Fw9pCMxgCTZ37AqmoCS7M662oZB9ZK
         RZVFp0MMUy9OF48Lh44ZtYHL2RgtZo9AVIwKwx9pMJDgZc/sMRwvlDbjPRM2cjcQR5KS
         5dVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm2FAhd/UJmL/a1bjHEjnNCXY4QKswwUjKHWLXB8TV7L+Fga6hGgcXpd0UGJo8LRu9mdgTkCQerCD352w=@vger.kernel.org
X-Gm-Message-State: AFuF++mLPxPiw8EX9uP8kegGOPpRAELkYIuTTv6yfiEePawn7g/Kadsi
	oQTsMMPVVR3edPJkDz2+LVVgu1eLPIjGoXeLtOBM+UnKsc4W/kLoMYz4O2FaaaqZ+4D7/ikdBUA
	+QXYP+GcP0lXFzRb69RISlMAfAza5TK87gpswVXViw8Z0pNGMH5sL2je81Xq1Qz3P9PE=
X-Gm-Gg: AYBFou10QwGzy9YUYgrtulP3QGx3qjw1X60SNYXzKCOB9rGKJXr+0CaO65AnRox3IiX
	4gAGuLf+NJoz1Ai69yNeA3lXVPpHcTt6aNONaTHzRf7N+21WAho6exVKLwUr4XYuLvWdveBqgUM
	M2QUeJz13iMi1LIgsLSkRilj0TNi6Yj9NXpZk+zR+a5nnx+bT/9YqK/0uXh0N13MgyACyfxX1eo
	Y6LaSMMRRMLfQVemQmsevGJ2qASEKs0eIRnmaMxYzUHFaS2fj3gjz2PvntEi4lsyH65SUVwuV/c
	EK5oNMLfUMCWIaI7lPXsCRIF/oOdesNQbPOGqlJyipslX8hrIrRUJF7BaAXLdBobNwCpBPKm+cb
	s4RQhU58e6tn9YfF+UbLvwKvZZUsqv4G1yCbYTZNMrLGYuxycaL9Funufftsm
X-Received: by 2002:a05:7301:7309:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34cdeb6be9cmr3854947eec.2.1790793040962;
        Wed, 30 Sep 2026 11:30:40 -0700 (PDT)
X-Received: by 2002:a05:7301:7309:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34cdeb6be9cmr3854892eec.2.1790793040158;
        Wed, 30 Sep 2026 11:30:40 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:33 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Implement Region of Interest(ROI) support
Date: Wed, 30 Sep 2026 11:30:23 -0700
Message-Id: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD9VvWoC/3XQTWrDMBAF4KsEreugn7EkZ9V7lBKk0agRJHZrt
 aYl+O6Vs7HB0WbgDcwH8+4s05gos9PhzkaaUk5DX4J9OTC8uP6DmhRKZpJLzbXQDfV4Hod0pt7
 5KzUQlG0RjFWOWDn6HCmm3wf49l7yJeXvYfx7+JNYtlVqEg1vIkVEIKOjUq9DzsevH3fF4XY7l
 sEWcZKrYgTsFFkUrbRVsQseKVYUtSqW7xVVFOLKaymdDGArCmwUIXYKFEVgR04Cb72vKe1WaXd
 KW5RAoQOIPKKpfaRXpXui6KLILgRA6xFjTTEbRe57MUu70RkQykWp8Ikyz/M/PLpXeFcCAAA=
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793030; l=6584;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=WVnFwNcJuZu6uTxG8+GS4e86AIYFkK8gCSPW8n05ioo=;
 b=2kVNh0icCizc+J+7bTjioe99TWLS8EZKJf2ubdqdkm0rRcIYuWqT+HVK+Ni2dMKDeKmbof2vb
 SigpIB4/TlNAYZfXLDd1KXX9z6N2qq3UEDVxPxiArz7yUzzzGvubqc9
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: Ba9rkhwh-znetWJhMt9qtumvSFiO71kF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX4yEpqrnjEGVt
 69TraO+0P3PkpZFuAZKvynXCUASZ2mZeDevP4wZQmvZtxJwZFkc8spvYB2FX4Gx1olv6CmYClqY
 8OXzH6+uOQkuNWKH47m2w1ewMxwgdZocnnaZmuVur29V3YgpdMVDXU1p0uJQe3lYOkmKovgBl7l
 4emKA6lf2sh/03Rx07LMfB8Xemi1t6dQY+MeVYH+9an32WHg3U+Hwh7eQnUzv5Nu8Oh66Ydkb1+
 z202GBQZrA2Rz0jVSJGW9PRT2+PZDgfuWKYwcJEAKFIK96K/wuM7p4iPKskKPqApZQgROvZqvdz
 8QD+nmkN5MS5FRW36PzSsVf50wGzLiaNVQTJtHNqOM0cl1ZAhfN814+o0iEDFn9O4dbf+TWY9g4
 Pg0XF78Do//1yPYhko/WcKxM73OzhIjn1DK834+QYk7o9D8lPy5Bsu3SQ/nZka5ZvP9DVZeGeZN
 eaFNyk4lDfmdhWR2pww==
X-Proofpoint-GUID: Ba9rkhwh-znetWJhMt9qtumvSFiO71kF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX6SZTjU3B2SUB
 JtpG7F4FAwQzgRdL+/2s+gYg9o9koomOZwO18diWGzW8V0iBKoETlhUdQm2V4BArbub8COrHjqV
 cW0cnh7nXrpe8V9ALCJDAcM3zjbIWO4=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abd5551 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=DKkvS2Dz--9TOQqJK7AA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300075

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
Changes in v8:
- Moved p_s8 below p_u8 (Hans)
- Update Documentation for V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (Nicolas)
- Update returns to a sngle line (Vishnu)
- Update n_shift calculation logic to ilog2 (Vishnu)
- Link to v7: https://lore.kernel.org/r/20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com

Changes in v7:
- Add V4L2_CTRL_TYPE_S8 to v4l2_ctrl_type_op_validate and check_range (Hans)
- Rebased onto media-committers next.
- Link to v6: https://lore.kernel.org/r/20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com

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

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  27 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 111 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  19 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 449 insertions(+), 4 deletions(-)
---
base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

