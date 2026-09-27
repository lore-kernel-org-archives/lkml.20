Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413028E0F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481476; cv=none; b=TsRH2D4KmGy4EwKEkUY5mj5lBdOkuSYG8N2kin2aow/JkzcTCY1GXXs/pmxZV0Z94Uelc3IedlY22Qb/zvq+3bVEUnnC1dZpo0bax8XaGf+OyRMlRrnMDunCT+8YKuOnMUIpiqBKUA+giBjt+Tq4ee9fLN7rXdeKYGiPFlB1lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481476; c=relaxed/simple;
	bh=EssiDR7tIU1leVmnuL9ncrgd0q/uyV4nJb2AT7WNJfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=T76bYUtZDwGlHdjIkAMJIvdZIzt4TclHch+C9V+Sk/YGoByFJB+xAVlnuUVL1G3F0d6VHuH6W76EYEhQYTr3v+ChxYGMvk/hyWvcWWiwCdbwHeWCAfJipItgteBnCcgK/VYF3zXvtvdE425uWi6lejFhQD0Z+PN/UwYQPYRTyng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNafrDPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0qNcoR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNafrDPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0qNcoR4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R3riP22754342
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GziMRmotnuRnmJsRHHSXSxyj/5Wi4x3EJPkL8EBkCgU=; b=VNafrDPiidPYdNSH
	qkke64psewZpVujA9ZN1C9e/oEXP2qF5LPZm8aHP821JxUKf5wBpLWS0ENae7ntL
	bK7BgotWGFO6l3fLj6RVB4eephzc6+8jFHXRSlXSh8zagNSvUycQj5bBHmujVQIL
	twH0F1pD57OBZVtb/dD5uwyrMaqDfonj46/76VlbKwWVVU34iBnfmJdIk24sXezs
	kJvupj2QsoT6+lwLAuzFCXz/rgj7HdxDej+F26KnE/exvQ9WtLke8QSM8qs62/j7
	bkX5Zn5+KcFLE2wGt6YEKsBs/oFe7HuFiPcuj1uLN/zYRlZNyeoNE+RNJhB/FKZq
	MnnsOA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfthys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34318e88ba2so1136954eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790481474; x=1791086274; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GziMRmotnuRnmJsRHHSXSxyj/5Wi4x3EJPkL8EBkCgU=;
        b=g0qNcoR474QyevEoGJhNnA33ofPIiHn+2EN5X79YNVH5MtRN/i8EklX3aT5oUg3Rr2
         dSwjULSuI2eUnZixy9VnuqDOEDviNedDN8p320EFbrDqtBhw1S1+Gs+uemsVhYeXGH8y
         KDN5AB1+Gau1AFa5xf2kA55LCzsA1XKdZK48NbsOfRR2wdXi6Jz7SZAIG41WF1CebKOM
         AB767cemYKMGAlegdT0GZw+13P/ksPkhm65eY1SlVUsK8uTKckLB6Q071EGJlA3sH/q1
         ofEsEdUkLsT8kTm7TElVJqisTnQZ7vXYwN7NfPUXhagW02/PF5Vz6n4QHFO1YU9VYMR1
         5BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790481474; x=1791086274;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GziMRmotnuRnmJsRHHSXSxyj/5Wi4x3EJPkL8EBkCgU=;
        b=mQny25cqObVfyiGpXzmygRIL95w54duYaPxwzFVnaRThswWpCZTrW66t6YbZjY0I23
         EDNjJnGAc+R/e5VHUIbtJNTwi+lQqK60XI+b7qP/viI0ePjlxlFUVAKR/bVQl87WHQnt
         gQ6MvdopmJEDM/gxgMT1mCQU7rliTG1sCRZkNKir/7m4BI0+tHRlfdYJP6oLUb8wVv1o
         DBjIKNV+9yRDG51O75LQUT5a47CBYq3GQDGDLmc0gFO7D6cbSajMRC+gzx+gHAtZ4bdy
         9BUv2xgE47y2oB2l6n0YFwLNnH8+OQPRrrfZe7okR3H0gf9fIm+hx0ikvs++Kqb/wSN0
         lrZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTxJCJ6bnFBaX8xbP2Ns1YvScKeW7uV/jfa2ILky9G6TEJmYCgAjaRFeMJfL6ly5NqO8Fb3O+/Ea8S17M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRyfSOJlBmiK3YS9AZxZj07RSFAA4t4Qnpj4ytoTgpSWYnllR5
	D+/PmkRcXgYxisx8e+SlPST9YHVUziJnpsLJ1UK5mTCfdlg8lEFZx9ZtYSjxrUi8tBdmB3+iZU+
	C95RjOLr30b+sogkuj7fEaLpzpTUDjnuJbjC4EfWfCp0QjqmIPTXnAAD6rUJtuTNS4ck=
X-Gm-Gg: AYBFou0hIYjuGG37CIY9lg0WPsgJ2JzP1QL9tWGwpAlojM8wJoZXuyymTnfJj/o31tV
	eG6v2pqKDUo2+QF8ZkYVN/8kMgGRTDBMEoVxjdEQFFvGjCkQL6U2lN6OAp6QZgwmpu86WEkblSg
	80F63vJASrvmOxkS9Mr9FHyY6cqriK5a1ZgOD1MlU1SF8BQ0BCsMewig5NZl3VWNAbME04qKjF4
	llB26Xm5iKl1XyZRJ/hYdH6o/4brcU8EAAKo8XSUXSOINHYAo+jHbmZxSQSYVwRKkkmzhp8lHu/
	Xx2TUsJOrKSlEdbNmoTZXiMhihKXPEGCvNK7cXMisYeIW97o9qHsbUVJOst8y1iABT2duJP7vtk
	Fe31C/FAZkfuPuZgMKbJEzd93D1GQ8g==
X-Received: by 2002:a05:7301:160f:b0:33e:653b:59d5 with SMTP id 5a478bee46e88-3427207a575mr4945415eec.29.1790481473738;
        Sat, 26 Sep 2026 20:57:53 -0700 (PDT)
X-Received: by 2002:a05:7301:160f:b0:33e:653b:59d5 with SMTP id 5a478bee46e88-3427207a575mr4945359eec.29.1790481472042;
        Sat, 26 Sep 2026 20:57:52 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm19618127eec.29.2026.09.26.20.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 20:57:51 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: iris: add vbv delay support
Date: Sun, 27 Sep 2026 09:27:44 +0530
Message-Id: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiUuGoC/33M0Q6CIBTG8VdxXIdDENGueo/WHMoh2VQKiuWc7
 x5600XZzdn+Z/t+M/LgDHh0TGbkIBhv7BgjPySo7eR4BWxUbEQJLYhgBBtnfB2aUCvo5YRZzhT
 VkpEypyiObg60eW3g+RK7M/5h3bT5IVu/u1TIMMGi4VJUnDWt0ifrfXp/yr61w5DGg1Yx0I9S0
 eJLoVEpmVIlEQVXADsK+6+wqKiirHKdZaIB/kNZluUN//JYoD8BAAA=
X-Change-ID: 20260730-iris_vbv_delay-343d2fa30842
In-Reply-To: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790481468; l=3871;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=EssiDR7tIU1leVmnuL9ncrgd0q/uyV4nJb2AT7WNJfY=;
 b=CB47GSXtx+x18h0fHdzUicS6c6MXV4Dmajc+QMnpVzey2YpYkG8IPZ3h1W1s8V4CzLhQ5nlzh
 4rIAskmgKmYDCILX+SNCDnjFJJj7HhgyTpmsnKBAP84gJybGFaWbV1G
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX+UrnDdHUj6X5
 ghiKtipIivKX9cl5/KLcMvgvnTWNov3hqaTWbRQnw5+u1icO8fSRz1vgsSAIZbRZMVhiWtjW+Z0
 Kv1X/C/zmWOcUn0o1btEcsyDa68BZDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX88nBGk4Oh88H
 U7aYCROMqqgbz4xi5uop4CbRvM91BXTkWU8FsthRxB4aHJGzQ9vSe+oUsnQw1SkBRm98WUjDhBO
 sw9HwxG19vW3v0jOl+M2MKq38FpxChJv75Ne0E8x2TFBoMntug03dT2PetvgHQYEAWctWScyyQ9
 tb73DxwlMFa9JFXc2UGMF5mDTjQ7yUsgRvYwj4NaYsZHmFujZaN6O1GPSxUGYgo4t24Mp2CwJcy
 SSl2KPgi85WUuFXgfzkFc53RpH48Y+mPNs3UCzcKYgF+FV+IKVIY8AWBFw/xREdDoiOrCaQuI+Z
 MYLZ0eKFPy0Rz9cxlroyryzUwGUVT0G4nvEEq2gij9bdKTEEI9b5TavI0KwY0R71WnW992qmCta
 +9UiaCPNzPgVC/OAhCQfL/cSY9BkHZzKyN5fxRfg2Go93AI/OL7yCmBkDxuJ07AVW3oI1SJBGTg
 JDGZeLIzX46ntLMBAiA==
X-Proofpoint-GUID: 3l6cUbPMFWYFxadT2UZfudl111uW2gXo
X-Proofpoint-ORIG-GUID: 3l6cUbPMFWYFxadT2UZfudl111uW2gXo
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab89442 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C5IDlBnpNeGhfuk2CuwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270015

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
Changes in v4:
- iris_set_pipe(): also require fw_caps[FRAME_RC_ENABLE].value before
  forcing single-pipe, since disabling rate control makes the bitrate
  mode (and VBV delay) meaningless regardless of CBR/VBR selection.
- Link to v3: https://lore.kernel.org/r/20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com

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

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 53 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 19 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 70 insertions(+), 5 deletions(-)
---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260730-iris_vbv_delay-343d2fa30842

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

