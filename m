Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2013202C29
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296091; cv=none; b=tCgkbMB9IPdwISBWQarN74aGuM5bo9XjD8erLrOZe/mgsbGJAQ9Fzks2REbV0y2rxuiRsTgYqTQZFFLs5UN/JiHSMJEG2qKgji//2/JY/ekCP0iywLKra+t5dfJGi39jSbI2U9+i2ZnqbFQDoyFj5/UuwuHpKElIxtGxKAAQfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296091; c=relaxed/simple;
	bh=soE8lT07CzBv6xf5EGPSJ5lUSOE/f7Y80sMTtzO0Ue0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bj9pI1e+P3a+y0QB/xnD7vW4/c+LGyIFyihhhmY+6KdDZ3//r3mT/B2dFYqQpas2v9513EdMJq0vMGJfDz7F/aOsaPo8ISns35w1LdgLwLA04viPerF02UsR7ESV2ZKFUPj+BHyiEX75d3rBHIGIZJH/IzwT8G9gkRc0awJ/9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWiYl+uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jnx4+6zU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWiYl+uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jnx4+6zU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP9Vg2771539
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tQY/WVLhioFprULWzgT2UV
	fTL4zMmOg14rfE/6nm174=; b=LWiYl+uqcmfEOl0ehMuXh08P4EOHG+Qd9BuDb0
	juWvUQk+cScPep+39pJ5DrquUDLReknucxA1VKITMt56eSFBspMqTuNiOZOSPRoC
	og4HgMpcGxIpp6m0nWerZLlqxr/yqT22AlA4j2Nf9Eu9bsDPt+UQSXuq4NK4Ms39
	i6jd9cutver4V7Vhp9ZoLcQVjM604cf5PkJKGtOcSrPKr5r2yKCwHW0gemhOI+56
	/d0jL1RiX7JJ/HaJRCXxcHapQnj7NDjJHVPdFSyKTo7SLjX+lR1QreiA0NhifTo/
	oyONkug9G3JZCYOORtJYpmBTdIBeRFkmHQN5Fe+QiYBfTJBg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7u6cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313c7315becso17051eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296087; x=1790900887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tQY/WVLhioFprULWzgT2UVfTL4zMmOg14rfE/6nm174=;
        b=Jnx4+6zU4c+QWbIAQkiAwFnFbdcMeKqD7wW7+ehMxx6uOLNyGPEvdzrb2y4zCbwgBS
         fLOnWZlzWd2njGFH/hbB4m0BccmUOxCoqm5eocYI3rChNgBBZi4op4vaIoud7+2pohXU
         GzE3QH5vc2dyIcqExoSzu4BhbaxlzgDEaYnyV1Pvok4RHrJWZumChPeWKKilFiE2cjuw
         kL+KLe1WDAKzkWkD4EaDiGXz13yZwoVr60TvDdvwu5bSfep8faDoBkNI1yB69khaZmR2
         ehfsWRoze9+w36ga9wJjSokUeAgd11VQNd2bjiy9aqtKGT/HTS5v+SdHjwH1NRXMPquC
         rzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296087; x=1790900887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQY/WVLhioFprULWzgT2UVfTL4zMmOg14rfE/6nm174=;
        b=1tDbxE6SW7Nqq1wScn86iws5G57MdBSzHVnXK7WzDvxuJG/YbmA9BvfCwld+kdxc3H
         x+h3vWmpi3OxjSAuIaJuxxeE384H/9cL674SW4n3NVEPHzMG3y4JFGLX5wmkG9bLVv0P
         LDmh9wFfE7/a2SIn7OZEmKWfpnN35lq2btBUbF/NCiHyZZhO/BmCtxS41wxamj9psT1P
         Ol0SOXPn/fw/tQn8HdhFtzgdd7AQwL9AJYCE3cAdIJ4yavbrwlCNVG74xqecVARIU15r
         4Mh41fxkMYk8lHUQlf5Ic9zewZOg6cjyZsiAJBgnFIFvv8wzDm9YJuIScmbtteYjKZy7
         3XWA==
X-Forwarded-Encrypted: i=1; AKwUvBwrlnCphmOp68mQGxApbxRnpdgTVLDcwHLF+bvIbgkR7EbKVaWu2NVlTp+t1P7QYyZS9Dj5lamIXMaPBpM=@vger.kernel.org
X-Gm-Message-State: AFuF++na1Uc0N/9Vg66brbsfxhZ2XpICNyTe+52IrFtvntJ5iNoAGbpU
	6+EJKPv12VvV37PcvLIzWDL6g5fuPaYWBrqRdNz8SCv/DbTTuZIFKsD0REmSxOAeXzt0wKKnu8+
	c4p+jLcKsbyQKoiM3GArSoJta9LryOxycDFaLq//B7n6qw+4qUt1KSZK6LlI6ZStcvNQ=
X-Gm-Gg: AYBFou3IuBoUTold/FJHT42rpxRVvweFxbKzRrAIWTmuxNqE33ItwP/FKFwOTVUxRfy
	2pFI9TbhTG9zMNbsMXS4JjnnkhlUqSTiq2Cq5Raf/B0tGKIV+yuNthHxjiJnA9Aw5tMofPFrvgD
	L4PXYNIhnVTEx4EG+gIMlycI9/O9BbSAfCxbl6PNVrdHvSH2EPYt2knaxvltSbSn8feS6UiZJSg
	sZifWmGuNDVjeCzEu78dcvsfRiaDppiKUY7behFX/rwY28ByDHzbv9hYLhdKwHYo3NzzpWrJMad
	gSDLh7qtLQHEwVNdcugHVx4oK3GG4gm86LxBMRwrINBmyWBd8dLiPWuJWxBaB98tYajDrGvTFuY
	OlWV+PdJSt/N2d2Qu2uYieMTmbP5AEjrat7bd9Qaum0I/yCx2TXENcx1FzlZr
X-Received: by 2002:a05:7301:4d04:b0:33e:4e49:d08d with SMTP id 5a478bee46e88-34149bdd0bamr1158802eec.1.1790296087087;
        Thu, 24 Sep 2026 17:28:07 -0700 (PDT)
X-Received: by 2002:a05:7301:4d04:b0:33e:4e49:d08d with SMTP id 5a478bee46e88-34149bdd0bamr1158782eec.1.1790296086466;
        Thu, 24 Sep 2026 17:28:06 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Implement Region of Interest(ROI) support
Date: Thu, 24 Sep 2026 17:28:01 -0700
Message-Id: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHAtWoC/3XPzWrDMAzA8VcpPi/FH4rt9LT3GKPYsrwa2niLt
 7BR8u5ze0kh9UXwF+gHurJCU6LCDrsrm2hOJeWxhnnZMTy58YO6FGozyaXmWuiORjxOOR1pdP5
 MHQRlewRjlSNWjz4niun3Dr691z6l8p2nv7s/i9u2Sc2i412kiAhkdFTqNZey//pxZ8yXy74Od
 hNnuSpGwEaRVdFKWxWH4JFiQ1GrYvlWUVUhrryW0skAtqHAgyLERoGqCBzISeC99y2lf1T6jdJ
 XJVAYACKPaFof6VUZnii6KnIIAdB6xPhMWZblH57QGAURAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=6259;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=soE8lT07CzBv6xf5EGPSJ5lUSOE/f7Y80sMTtzO0Ue0=;
 b=WjZxbipMwAwYUfmdBZXr5tJRWleRDJnSimJOnJYNUHE43f6DFYDfDttzUXTSqXrNu2YjWSRl2
 W+kotKvTU7RC1FvNnfvwk42A3xRw08Px6NIH5+9ZPLl5yx1b5jWq9JI
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: XZf7o9zZ5S9zK4gKu2FQ6nGDdiYASLXO
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5c018 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=DKkvS2Dz--9TOQqJK7AA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX4Lgg0KR45WqV
 j40yIMmd1vmxrFrGtw9Tb51GaJJAkY7UFxZw8MFRPru6+wPfpmo5bS3X2y0c4ZGGwkabwd4ZZmU
 ORsGBMHRzCAawV7oy5bHqnoCRDK31WNGMAmRBNINq/qjLoZL3sPJvkfi+s4nSP7JCi3P1rNe5jo
 dHwnS6Bt042iBj+oK01X3rQaiKtmG3+XZP61/b5MzM1dBodvcEU+07imnyduYZU3NJZG5pVT0sL
 YR0vx518O0cRs2KLv8enVIKtAJR5d8ZheThJsnt//GE7lOse53bjD0ZSh5eNqBd+PbzndoM4I+U
 FoGcLJQNmx+jO9O6773eS2+af6DtoO/wvP3kDuL1QngIwiyLDi+qGyxPOGUKeFWoOl3sfDqoJ+c
 j7fQWBDJbUoM5ivxDjsE9131fePnzAm6krortdG7EEdUe7rVRKgiE3ENvLD1QUtS2dEzfndnguR
 PTjcOkD8e8B/4NagA0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX5D239VnQBdSm
 qkWl+CNRe3ZIVOujg/GgqYSybrJ0eU7yMNuV0jIcOD+AjEEpwyGUN9tvmifn8PfDDiPHs54p4l3
 Sct4AqN/VDcCjH1u/Lc8Qva0RIeuPeo=
X-Proofpoint-ORIG-GUID: XZf7o9zZ5S9zK4gKu2FQ6nGDdiYASLXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250001

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
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  19 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 460 insertions(+), 4 deletions(-)
---
base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

