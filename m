Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA813E451B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094404; cv=none; b=BZNq3Jv4Ksxb7QI+1u9WNZu/LU9jMZSD3pGgn4CSgVmWH04EiuDStWLVM1tJm/F2RB64nunNrrHl/gcVbNpduchrR0yrhngynJWI/MBtv+wBqrHgcqhMGPbA8PqsbfNg3St0oF+dxiJVTPRImDNC91MzkII6ewHLzswgCWROj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094404; c=relaxed/simple;
	bh=JdeyxLKm3z51enqh6IQpT4fiCuVV6Nsi8TE2vt9eEus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qvK184mR4dEIaWO21DsHhegIdpKiVKNSfSX1ei8HN6b20Ki9XQG41Ek7nlkyIzewB70Pc0PN+VZNy7ifjWPQ+jlUrmlTPn5nzx1iK9t1VJVgzEhQb9bLoo/D+zrxoKIQrfAZp3NLCE0EyT/xeJPFRXw5nxOiCorZtoty8+POoRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVuo2hy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3My/3fv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVuo2hy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3My/3fv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B12t0J2125191
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gmcYueUYUzUniqPCLBhx0d
	LD0mz0L232i2G5Xjk/FAE=; b=DVuo2hy3Tis6UAHe10+7Yzt9OjQqPNC1imRTd5
	maOq8hXIcVve1PAZOEroauhugLWKD5WdWnlelRlQ9hvNvp5fkUC28SIVLp8vECbb
	j5da7ZbIxngcmb8FN7enomlPdaOPI6GPEZOxiLMDkYz3OW8JEsVYbk76FcIOsTfu
	r54YOPyoX74muPzJlgbVpgCMA368GZLhM9+26o+qjDuwxwSljuHUDcFk8to+DOVL
	Uos+MOwJ8Kod+yreoxwMT0KarlUObE87ysJCi5ScX+IMfm2bi4Yi5AN6LB4OzhPn
	UmuVBMefxXHane6sWfvz5FOt7n79zJXaJ6LejpraEhZsXeXg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx30gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso649092a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789094402; x=1789699202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gmcYueUYUzUniqPCLBhx0dLD0mz0L232i2G5Xjk/FAE=;
        b=I3My/3fvWf9CcSwDzzdbvlSuzUR4cyma15T9li+cOkMEFCd7dib9AMf+ybc3T9dPBy
         D5MhzIRvf5q6LGpiTdYblwQm55hkfGkHQET60Vx/sbi2SEGuaEOAQ8r8RaxP5Nq0daif
         jG0CFQV5GuNeesHAfUyMQdWQhrvE8A/pgk4j1evN2RLKWzN32McVklkQNEO68fCQAiSf
         6GGu0KZf6i/7C+2cAm7q0yFvJ9BxIaLPrOyftNC3RlmXFsi5rYFx4NGBtF+S2RYJ4aEC
         E86tJEpOy0lbny7VgoGNRyZ0O7lTpaJQyrHydgHtYs6LfXynLNB1sOKVAEfJV4r38Tqj
         lVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094402; x=1789699202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmcYueUYUzUniqPCLBhx0dLD0mz0L232i2G5Xjk/FAE=;
        b=V8OQMbuepTA/kOtV1HksnjQlYfztWaQO6N1dZLfWvpq7uTd8MJTfVqDVjkvqfO7G3G
         O9xUwoAVDysPHY1AkFBQL/ediu4DHjCMpgHUfOMf1yo/LC2kc+wfV09UtymJtMs8vMKs
         SAWotxPZFqzMuvKIR3yrjEevgT+XlkShH1d/TqXi/zcIswBKFsj7OjceQsDrJFeluNdd
         7p4IKEUwg54IoaKbawQWQyrxEwr22xP4wdPhZjt/lTeEeVuKB0TfPzhBM0USR6Gjs3Ot
         gZqj1IhAT4OqXNIDTdqJ684DQyuXLGdQ066/asyM294BGa7d8ToaFGTFmHglveKwfmY9
         oFwg==
X-Gm-Message-State: AFuF++nnbMI/Kkbl7Daggr5LMFv0ZCbAk2/x9065NSCqArsJAqF/uTv0
	6ZeCep6V9a7xXlt4liOlJ3yVcQEqUVBoql1mKkZvNPwwvKOyQIBH6RP3U8kviPe6uIrOE5RsmUR
	yG9XS1EyCwjHIgmgFP8RKQl3kWXAalm0V4fQDqz3dyLoZBqr8NHdz23gwPqioaw3iSYA=
X-Gm-Gg: AYBFou0iBqx3G1OBq2R4NqtR3ENmMp973EW6ZOC/ybH+wOHxDKYm47wOffmMp0iP4NX
	+DBf90gDgxomYOuGbmBf2JY9dVTmv1v4zrJ30O5N6gS9T94V5LkkW0oIe9q8qLxqmC1Q4Q/t+QR
	7zsSnJ/30OW68ZWEXowOSJYH1/rQXvBouiZm9YDcai9+zP2IIvrY3J28CjI1wqaIdbOlxc/fV6l
	mAM2U1S87lztmzc0NSLnTaK8XmSvwABSlwdGSDadNv3dubCqURKXbC/g1Fp31Uqd+TLd5TPK1mB
	E59BtjVINEUWvlFjOiG2qDxof4KPVpIMEOnaCkQGE21zBWAygLyQt482TDPDr/VgREpbPahjIU8
	hAgwxqOhU7Rdm48ux34cNJu5eh1Vj7u8=
X-Received: by 2002:a05:6a21:1014:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3daed3db08emr3724633637.24.1789094401691;
        Thu, 10 Sep 2026 19:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:1014:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3daed3db08emr3724575637.24.1789094401271;
        Thu, 10 Sep 2026 19:40:01 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm2094481eec.11.2026.09.10.19.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:40:00 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add firmware debug logging support for the qcom
 Iris driver
Date: Fri, 11 Sep 2026 08:09:48 +0530
Message-Id: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRpo2oC/4WOQW7DIBBFrxKx7kRAwEBXvUeVxYDHyUhxqMFxU
 kW+e4lzgG5G+vM1b95TVCpMVXzunqLQwpXztQX9sRPpjNcTAfctCy11J72yMFLPCFPKI3DhCsM
 dLvkEh9jp6Dtjo0PRjn8KDfzYwN/Hdy403Rp/fi9FxErQMCPP7Z/vpdI0RHPQbgjJ2d6SNBpdC
 ooCWtNKDF68WGeucy6/m/OiNth/eosCBcmjkxSl9yZ85Vr30w0vL4N9G+K4rusfKKbGLg8BAAA
 =
X-Change-ID: 20260815-media-qcom-iris-fw-log-3b62b8645b7a
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789094397; l=3283;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=JdeyxLKm3z51enqh6IQpT4fiCuVV6Nsi8TE2vt9eEus=;
 b=C6bPxvTO+dQZ5ZJ/0yGMjvE/WcT1JRCm4vnvwLuwyTyyh+IaD46GL5XL/HQiw6r7QQMERzfuC
 V6Fv1whsf/yA/xyD8MCQYE7hl43hN3x91U5m+/eM3+G7+0tKIdU26T7
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfX1CCXYip6C3yX
 uYT60NUMnUFq7ofedmmCsD8EnhzPsS+ZSg62sxu9YgFVqWgW0thBScHVyenvozVFjLq2roywno8
 Gs7faNmV2G8m+zvpFaiW9jzCNG8WIw+W7xY0BEJMVtwK0KU5H3cWedCd1DeLJ+ZOJnyGf3vCv8K
 u8idJYD41SJw96+7qxzLfyFrDQ3RGHMBUU67Jwx+w75FvjjdIMekzsheqj0J/XWUHLXRbDUgA9w
 TqQfPNwxqDo68b03akdPMZfv44P+i/jsqLx7AfWjcaVkXy8UuYc2ALMqpcsoAU9fITE5Uzrs1QF
 nVjIsWiSP3CeiTRvEzXqOTbUHbyXG6aS6u3WZYv8dB25HTn3xzYKz84aa8K16nqfRFnXp2PIDrL
 W8iOC+nQ93gIY4Z5DwA1l8+cAk28LCG53xfnGq0l2FhaWk9R2U1oo5Uxxm8GhMPiZ5uP3nlcLaD
 JqUqnwF+BZeo9a0sMCQ==
X-Proofpoint-ORIG-GUID: eH7GwP-R3y3QwugXQTk6B2fRxHLuEjg9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfXxXFIsJQhDMyc
 fti2WK3qBxwL7opB73M0D8n7WDmT7G3GsmkC0/r6MtueDNsGvqHtn35SXtRLj3K62lbjr07cBMW
 p3RELVndM8ZVKX8AFkSNVl2uLHVI5JE=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa36a02 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vBuUH1DVfrQNvPyK4OsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: eH7GwP-R3y3QwugXQTk6B2fRxHLuEjg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110033

The driver currently has no way to configure firmware debug
logging at runtime. This makes firmware-side issues harder to
debug, because changing the firmware debug mask requires a
rebuild or reload.

The patch adds a debugfs fw_level file under the Iris debugfs
directory. The value is stored per Iris core and is normalized
on write, so userspace reads back the same mask that is
programmed to firmware.

The firmware debug configuration is sent during core
initialization and before opening a new session. This allows a
fw_level value written before a session starts to take effect for
that session.

HFI Gen1 and Gen2 paths are added for programming the debug
configuration and reading firmware debug messages from the debug
queue. Firmware error and fatal messages are printed with
dev_err_ratelimited(), while other firmware messages use
dev_dbg().

The default mask enables only firmware error and fatal messages
to avoid enabling verbose firmware logging by default.

Failure to configure firmware debug logging is treated as non-fatal
and does not block normal video operation.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
Changes in v2:
- 1. Increase response timeout for verbose firmware logging.
- 2. Increase runtime PM autosuspend delay for verbose firmware logging.
- 3. Drain message and debug queues until both queues are empty.
- 4. Fix checkpatch alignment warning in iris_hfi_common.c.
- 5. Drop direct iris_hfi_common.h includes from response files.
- 6. Keep bounded firmware log printing with %.*s.
- Link to v1: https://lore.kernel.org/r/20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com

---
Renjiang Han (2):
      media: qcom: iris: add firmware debug logging support
      media: qcom: iris: reduce impact of verbose firmware logging

 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  9 +++-
 drivers/media/platform/qcom/iris/iris_debugfs.c    | 56 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_debugfs.h    | 14 ++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 43 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 11 +++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  8 ++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 55 ++++++++++++++++-----
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 ++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 29 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 36 ++++++++++----
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  7 ++-
 18 files changed, 311 insertions(+), 26 deletions(-)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260815-media-qcom-iris-fw-log-3b62b8645b7a

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>

