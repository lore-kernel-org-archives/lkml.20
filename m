Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9044AB91
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927081; cv=none; b=htpYdmahhu7NHss48ucCn4HB2Z65l96lsLkJKL75B1UM4W/e7CXaoHrayXibDDYCrVLVHYI8gMf5TH2I02fWoxwgaWNmZb1xx03/cqyjdX3LNntDb9n+9et1sP5X3HT70X7ivXHQBhksfHIjx0vo7j+XYrfag0/z8rn/KxPTl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927081; c=relaxed/simple;
	bh=Y32nzHTgygdSKjSWLppEJ46/uEo1LW0riu2YxKK/BmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T2SqlssxUwE2mq2BjD49aUSrjNAnxUuH0oXimwPlb52SsK3NDVmQtpw6kv8YkaqrsaEfMZYGLbEH6gbobWePTpjYcZAbnLNvdsLOJ2mIKtO2pXpobyqm47pDGrKlYpJL8krkHKP5MQDd42C4hLeH4dJ+u1sNs2AsWmq6Vkc0CJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B12smtEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBtnJJoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B12smtEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBtnJJoM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jfF0234197
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 07:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+SxKnZOuPgaaMuySPeuibG
	wBoYCKhKJNg4lrEeXC2iY=; b=B12smtEk6yVd1sZlwbT+wrNm1o4gFs0emsQC6B
	Wa3mG3eQEQDNo5P1ELXIBgNTQlKsZStNK3cICDEM6Yf8kA76PDodcyw5LLDtOJe6
	pvcn27PMPhCivXiCh+ZFDm9a5+lVv9krwrnpVqysGj5usaCo07MhLkg1LQdiXvmT
	pKUZsjkRta/GzGJo1ar/28hYQEbd4LJARvyogi8R7RiK8XDr+fbxSATvZ23qQQIb
	c5Ee3+JS5Ombres2DJvl5c4h8HyjRc4SFI+9tVU91AaW+nK2PkNOAFizqoOVg5wd
	xhwBtPiEzV4+lCboiQnbuDt8Biqe1kMZIOyHg8mkNpyNeO7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9ab32r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:44:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d84114044so7601317eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927077; x=1791531877; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SxKnZOuPgaaMuySPeuibGwBoYCKhKJNg4lrEeXC2iY=;
        b=IBtnJJoMtuWmRcNODdipI7g6y5qGgA5W5/QvLqn7uPWDlpf6YuIYofUcR/yj+mTTd8
         XNU9CRsMYz7Yt5UgaBMDJsztCzK5CwF+F5iEplV+fUylE1si7sr+IJdn2sFbkEu7K4YQ
         SO9X59SlQdZlwL6fAmjFiUCVHkhYpZA1Rfzs9U4VUXiRQFV6jK5b1cFzcd9u8+b/wlqB
         V9V2riXnN+hZbwCBXQLB41I0hI3UHqPlEdaSGK28KNuDprqa4XoY3x6efhqRSyTdYjNE
         aGg4JGvlhveBTlJmB+jxhLnmL/HgmcoyrNKzBHBTG7OJrJRtK/fQ2hGhiUZEQ7QELRqI
         i2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927077; x=1791531877;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+SxKnZOuPgaaMuySPeuibGwBoYCKhKJNg4lrEeXC2iY=;
        b=fKwb9q7ivf0SwWg+d98JWei04M98BdligMzSNyb4Eu4Juqhf4sUhRt1o0EyFnoEJvk
         HvfVQa6LE/HpS8SkDclQtd1vr1ZDwc4vrcn1vfowvkBsPi3/GL4J3mVfhxziRJZWQRbK
         RaKe5Ppf+VLdJ2jSte4BeFoH3sR81mOZIOZSH3S7jU3ZNhhvywRZa9hqYuVUa6oVTvyF
         UduSpS8OpuYszZRrtxSFQjU092GlgQ+jUc7bjR/EfrFsPBSt8W14z1JTZO9HuSgFCsU4
         e8fxZey0W8ZhDG1vzOveACJYe5o5BAqvSBUuIQOKZoAkhAkA7qeYq+0ZCM6dv99Uyc5n
         cc6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzP9ZtclEtmQkxxtmg4mTWmoh3Ug0AI2DDCvtLIeNibZazme6lmPz1MnKvrumVjIoEFo7QXm6HoKMGyP24=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGoAcI1Leh/AnJtkvfvHRbPCoBQTRUakraVzU9st81ebgTJ9wK
	E1BF3u1u7AIt763iqysrt4IATg3OzK/KocezjVu2Fi53VGnHkVC85tvV/6ZQrFzIibJUrBy8+gG
	xjxPKTzQMkWdVHxmX3LvEqO5VuI9RLAcGf7zkHYKErC85IROHMuW4qYFRlXvLwdXILgw=
X-Gm-Gg: AYBFou2knt53/oRwGetjOM6A3dfyv3R96Q0pY9sKMKC+6LfGMacME2trX6E42OUw0LE
	WR4jERvFpwWseu8Qs5EM3jnDiUWJgr/lXXvUgFTAFyUllsVRdxmd2sBKaepqCDl1wcbGoDUA32d
	boc5FuXiOkPI76AlHI+x+AHgQlxJlneh3Ukt0LUg+GqFPDW1N2/arnQyHm2Ng5OhFSZh4okaVjU
	WEwPeyzST96yrVmjx1U2GRH/7E5f61WwHDYNbEv2e9URizt0rrpLg16fEETMPA44w/QNKEw8GoP
	4yHny4zszjQhbNrzB0/87efQ1sIkXi4YlHxOerhXYdgFnju4bqjvE9Gx/aBhBMA7XDiR41p2Z4b
	VjPQCX9+MrF608Kd2ckJUNAb6hVS61/M=
X-Received: by 2002:a05:7301:dd85:b0:343:fdea:9a4 with SMTP id 5a478bee46e88-34f2185cae4mr2196184eec.28.1790927076918;
        Fri, 02 Oct 2026 00:44:36 -0700 (PDT)
X-Received: by 2002:a05:7301:dd85:b0:343:fdea:9a4 with SMTP id 5a478bee46e88-34f2185cae4mr2196156eec.28.1790927076262;
        Fri, 02 Oct 2026 00:44:36 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105835bf8sm2326258eec.9.2026.10.02.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:44:35 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 13:14:21 +0530
Subject: [PATCH] media: iris: fix 64-bit division in iris_set_slice_count()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-iris-fix-divdi3-v1-1-b2284d7fd77b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANRgv2oC/x2MSwqAMBDFriKzdqBTi7+riAu1o76NSgsiFO9uc
 RlCkihqgEbqi0RBb0ScRwYpC1r26diU4TOTNbYWYywjIPKKhz1uj4qdm6VrnEjrW8rVFTTb/zi
 M7/sBzukjuWEAAAA=
X-Change-ID: 20261002-iris-fix-divdi3-44b1974118d8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790927072; l=2226;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Y32nzHTgygdSKjSWLppEJ46/uEo1LW0riu2YxKK/BmE=;
 b=AkLb4ftVxScz65DaL8GYcaXcsa+m20qqeN4Vj1M0Rk3E3D+5Cjn6Co03iuEnxZM8+JSnGgIPj
 6hKchq5JMSqBq4OCP1oAX3U63VrF+lzBXbIJHM7h3BvKdhSg9eeecwl
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX6SoztMZ2vT7s
 EKhrNK1ptp85XNtTs86ZKuuPvQ5iv0ztfidaiEE4u4R0uoJMl41HazlERgpBP/LhWxQh1NeBAay
 wPGePb+W2OVBL3p8cx14xz4NJSuzYrQ=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf60e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=igNROUxOmin0j7y6hpQA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MFD_X2xMFdgE7pSeLaDqVTZDCWlgQ0nK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX0qESVRBcg4Lj
 iUkVkYk+keRaT4SQ64SBVzcx2tuPJbv9ywnwYMSy2Ib7Zw1m9LQUj1sKaufMRKqTbZ8Hisoigw0
 aaKDFtQQh+gG5GYFytrZpVq0SloqGZcQBdUy9mPLmQ3FWnFVh5Ym1uyJojE+hwnaroddrdwOl1M
 pR6b7hnxWI24IUyEgoVLyiUNrc6ENqUg2/B/OhF/86h3fbQAgXSG66vtwV6kUIIV2z9O+bs9Y1l
 Sv41SW3R7rs5SzIVESR92L8pyVOTZrPVxKI9pglzWpzaPQpUQZBDdyxnRFyl3d6EhecbTs0M/i+
 2k0lb448V43rlJ7CMx++nGb6vviZ8k+9+PygVodVt/ODA64IPDtU9wTjqopyFi+/GtTU/ou+gFq
 lP32zbI3vUnKNJuVbZFCGUZtP4oxErpul8f214lX8R9lIYIarhGt0OJTE5ZuTKGT29qpUp+YIHc
 zOv3sfrKLvjJyxms/1w==
X-Proofpoint-GUID: MFD_X2xMFdgE7pSeLaDqVTZDCWlgQ0nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020030

inst->fw_caps[BITRATE].value is an s64, so dividing it by the frame
rate is a 64-bit division. On 32-bit architectures the compiler turns
this into a call to the libgcc helper __divdi3, which the kernel does
not provide, so the module fails to link.

The bitrate always fits in a u32, so copy it into a u32 local before
dividing, as iris_set_peak_bitrate() already does.

Fixes: 9abcab03dbf8 ("media: iris: add support for multi_slice in iris encoder")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610020426.oUzBZ3mH-lkp@intel.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
The original commit is 5f21cd9a4ae4 in next-20261001 and is
9abcab03dbf8 in the current venus-iris-next branch.
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8c4c47944f22..06d99b18310b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1548,6 +1548,7 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
 	u32 max_width, max_height, min_width, min_height;
 	u32 slice_mode = inst->fw_caps[cap_id].value;
+	u32 bitrate = inst->fw_caps[BITRATE].value;
 	u32 max_avg_slicesize, hfi_value, hfi_id;
 	u32 rc_type = inst->hfi_rc_type;
 	u32 fps = inst->frame_rate;
@@ -1588,7 +1589,7 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
 		if (rc_type != HFI_RC_OFF) {
-			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
+			max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
 							 slice_caps->max_slices_per_frame);
 		} else {
 			/*

---
base-commit: 9abcab03dbf81439e18d09f1f3869bc39290ce4d
change-id: 20261002-iris-fix-divdi3-44b1974118d8

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

