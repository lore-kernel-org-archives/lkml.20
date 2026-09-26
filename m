Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5F39FCCA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428100; cv=none; b=SyBf8O4J9WHXotGHwjGvNqS/Pq6dhxGqsw2g75FDEt6wj/aehq8r9sp+pQE9kZisXHxq5aH7hT5mCAOfyJfnlqLDZeBaivTaPnpyfqvZL58iKzrcvF8IXZZII7XKQl99zdIEdl/UgfIxBBaqMB7aRoHHjd3z3lrcl7V1eLQl3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428100; c=relaxed/simple;
	bh=O5RHq8VbDNAX2oaGL7TqD33eUDnNypgHfkK31Ne8IfM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=bBXoM9yAsfv/60GMGpW54i6OivcpExwLdpyvWW8g2FffrUuGuFkRnhI4NuP9PE9rTMoGVaNWu7QSZgCS/SQ0MKe8/WUaku5AyuboXxyERySBv/H4hXRVEt76ggLb9fPlbDv2IaBV+PCx11qA8UBf4NuZ7XbXUn2WuW6t2NlTJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HB7pgl9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbuHzyJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HB7pgl9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbuHzyJv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAo49V3045857
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR+q3wVR+Kss3Eawd9nmtdjN9B3OfgoqT4zSL+4Xwr8=; b=HB7pgl9B/gtAdyJZ
	XFU47cdYI9sSP+fA19FFjeyuhh9XDoZDXMwEIaPgkPFAZcBjZsELQvTvsquoIL9D
	oTMcqEn0/LjrcosJLl9buHV2tEgQ77gRLAbyLhWGsIi+YbHo20bHQ4WRsIT/giCH
	7w4xikgyjfxqnyF3wKNsq/gpHkiUIAaV8Lg8XkMUx8QC0sQchtuSejF/NEodP8KM
	ogLsBeAMrYPfUGeXuVTvYNZ2q0Nz4NZlhUrUIH1HaeZ/wF1SyR7r9xXmg6nQQbjZ
	pyXUHiu44MTdn5rhr1EdNvgU3mIEBLz/usuSkgyb64NmpvIHVvNTOp3t5xIkCq9s
	kp4GiQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e80upn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3721400eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790428097; x=1791032897; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR+q3wVR+Kss3Eawd9nmtdjN9B3OfgoqT4zSL+4Xwr8=;
        b=WbuHzyJvKRlPtUhQKTdlmD5GzWp9LAmyNlBELusAg9HgPkVcrHiqP1lkdUWu6rl7vU
         AoxdS8vzH00aYQWxmwCD9Aoz/EeOdZFiyWMzpB7tNShGQicrSV5zXIMDFFhgmlsZOxTT
         Yyfg+v4JX1B+Gx9aSjwwuRQYlrHb5U7+7bfcYNlCw7MoqkvtZgYGF546ZEzj8txZ5fjS
         O73RuLQ7Kzhma7LPWC00xdVS+vcEQrpl8v1TMLdpRWwDPrRzqYYTa8tRoBK3B3mT4tIr
         QGi20ILJKEDvLTQcyOCY/3wh/hnhXBWrDgUvhn6K97l4cI5MtfrBMq7QpxRDXFrYIaCs
         +4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428097; x=1791032897;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR+q3wVR+Kss3Eawd9nmtdjN9B3OfgoqT4zSL+4Xwr8=;
        b=vBU0RdxmusRS3Z4LQp41aHyMAK5wmq44xmcjml9ADVxa7ADDGKMmriV3jd/PMEPbtr
         7UbOoDWWLwqaqzL61294DezA0oOGxQmjyP25YNFDkciwoW5HcLM9kHgvhvc4+29RC6aN
         ANHy3rlNY4+kmQ/tqBawlfCivYypte03qdQJYnOQDn7KqGJA1sKAnMO7FsU2ZoriOcA3
         vMdMfRfHZxyik9gIgou/WyTpWZ1hzLImGAQiye4QHP04UwkWSBQ7xH29bg6gchcpcIdZ
         CWANqq4a3YvzeNVID60UYIgatMiVOlVRB11xi9fHGUqLx2sJ2j/urWgBr2llBa1WhgUa
         qkYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR90RMc60WBsI0Ek8nLmMPw9OwJM9mp72zXSZkKdgVb8PggqM7a7SjZ7GBP/uRQCC1dgNca57V+vOCNDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrcpRUEF3HI0Iw3cLNGT0LzUagZReEpfugkrtEzsN0h6q6Vc2f
	Wl2TVyadTQuRd9+gCvjdAyFJ8Hyb5FRITxLIFbRetQKKNQf+TDeG0kSWyCmVju4agCsElBhECDb
	UP+TjXJpPcZxTkPWkqkEnDvMm3co8rxAx2aOs2CSfgDeg7LQQ/Ka45yTkjSduHnMfT50=
X-Gm-Gg: AYBFou30EKBX4FrpA48PLX2nuEEpw1QW809rU/GfaJQ9rTe26WherHh6W2GZWJzQGJi
	Q2FpMg7XYzNLUB2mg1DbSSyfpQRm9F1m8BSe/UJsM3HMnWCKri6SWP7sVgXrw8Ua/KkLnRdlLrS
	weqKXvW7DbA26c+GFqA4rNza09tDAWv7vSBKAF0L4OYBZ2UrhX7soV/zuSFbYxLXwcXf4Czi0N3
	BpaOvtUzyKwHDBL8VLKpzLmj3t4Fr3GpxryEMHl60orEcIK1y2c8qmxk+wkjScz6qAUjZ3Letbs
	UfV2AH9XCCSRz2kWevIB7qZNPpZldcNdE0IFlwZeaGthHXogrbqSwJ6Lru3pFP7fn+S57wZP4P6
	zGWqpNqfVe8yNW+GUXYTUPQPuu0KjWTg=
X-Received: by 2002:a05:7300:3e95:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-3426cce7bcdmr2549572eec.0.1790428097094;
        Sat, 26 Sep 2026 06:08:17 -0700 (PDT)
X-Received: by 2002:a05:7300:3e95:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-3426cce7bcdmr2549538eec.0.1790428096372;
        Sat, 26 Sep 2026 06:08:16 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm15356614eec.29.2026.09.26.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:08:15 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: iris: add vbv delay support
Date: Sat, 26 Sep 2026 18:38:05 +0530
Message-Id: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbDt2oC/3WMyw6CMBBFf4XM2pLSgqgr/8MQ0hcyCVDtaCMh/
 Xcrezc3OTc5ZwNyAR3BpdgguIiEfskgDgWYUS13x9BmBsHFkbeSMwxIfdSxt25SK5O1tGJQkp9
 qAVl6BDfgZw/euswj0suHde/H6vf+TcWKcdbqRrXnRmpjh6snKp9vNRk/z2Ue6FJKX4XDTnSzA
 AAA
X-Change-ID: 20260730-iris_vbv_delay-343d2fa30842
In-Reply-To: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790428092; l=3228;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=O5RHq8VbDNAX2oaGL7TqD33eUDnNypgHfkK31Ne8IfM=;
 b=fI76ZFFysWZsEgisPaLk6ES6kEfc1D3mbz/CRegf8D8j9A7m5vc3x4xZqqfsI2tYgDtF3XDQG
 rhS7F8azeacDlRc0zv92RKY13NTYPP54UX5OeQHI+eZpu10iwpkSpfK
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: 8zMT0OCnT7qv9VgbNeANOyGNfVGimFAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfXxZ09m0qw7rVM
 8kM83jLHDR0Rq4xciCT5QN35Emy/SEih5hMCN69PYTe5lkXDm0MRubBCbTuJ+f1gn8swWV0rnU2
 m6fyPZpI+95+6E1+NbZCmXT8aldLZ2tn+uHIBn+U5HyTyCfxL4QKY/SfTtmyNtu01mkyW6L1SwL
 mys64fgH7E9HTSA/25yQ+DAF9B9n5E7QYGIXD1tNPfkHwp2Ey1kzPA7hNJOq06TfyEr0Zvv0d/q
 iSK00UIwV8ggmfFAYyNt93KLPUtgCoKCLxzRAozqmuUmu57bA36/vY1F5arHZzMvEFa/22wtFaB
 pAZFyXh5Gcv34JkokB3gHaQN9mzh0rrFUvbB6TbzkciqrtV1ZXH4Qkc8EJzajs7SIURhhgA1fNy
 mPWTUFOFOWs7gYTGzktBWvEEGpDXCaUHgcPrq1IukOO6vBetE8yUjWH+07Xk4mTgALhieFdFqvw
 IREN6W4KoyaH3HFFSwA==
X-Proofpoint-ORIG-GUID: 8zMT0OCnT7qv9VgbNeANOyGNfVGimFAT
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab7c3c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C5IDlBnpNeGhfuk2CuwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX8mluUpZianxA
 WNNMWnvbTsm6hmCc3uBoKXDKneszmu/6SF8g1wQV4UJZq4TLrI8IJTgltfm472Npl9BRgWtCkwt
 G4+rCzTP/Ircs0pHH3ui/Ug0lXbcbYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260052

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

