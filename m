Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101806;
	b=0ZUdeZ0YyCa/Em/1oiibBfmcpouJhHwXgvtQIXFqipYwEUJog7y0B0UUFXsK0juFKr0g
	 gwP8LP5A6Tc+NnchzN3NbW+5ySQFOYPFGyDol3MlDaPZe6u9wqZiJtImVhHd/7V597h61
	 u4L3lyijICAo3lPfQNOiFJJwPCXVVGu9Ssq3TFmQ6hCvIPeygj3W8Fb+B7Bf17A2IferX
	 NQYvJwwbrTJlOcy9H2NLAJOVphDlYh4NP9k42KTTM6xgjkgw2yUx7jOPcVZxI937NO5KS
	 /2VrL6rF6DqqMeE/Jugd25MneBUupre5UqbjnYupF+y+xePJxL7ZRTZFvpsdEGZdHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
	b=HQlpWm71ORX3e66UNifFiASy4FdNYiZSN7MscDqBLBUVEztLV3P4sfrrc2BgLC1vUBEA
	 5kBM1rEe2dk22Hnm0rm4Q50iav+rwKsnnC0cKKbyofku033jZVJolwFnGY0y2kF5h/xBe
	 9xOz2RjWyLgr5lTarhFWJQ6978odzGjsl+K1pTYIUmjKr5n8WrsXhFWVi0U6r4Uv0YcQO
	 30TOB/1kYTH4R1bD1XP96iH+9XQoAtr9p/VYj6MRxzLyqTOO1JZBDCtQq05Pm7bGmLLqM
	 BIHrgwXCfF2HMHFr/+b51+5rDt1PkZHLha1CP+Enas/1zapo/qfHS0yF8UFH9vu8ZcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D5606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626D5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCtE3012028
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52R
	JzKOEy+8=; b=GOZCGZxNGVkU9lZgDezE1pEQgUEGBimtTwmG/4y5B/BnRaXQMke
	I4RDEtnpt+Akb57O49mMO5Tx+v71FpqNDy314mWqaGrpkFH9kUu0U0EciWOGEHxh
	5qBPi/IN/0+UAz8j8IzfFFZ4CRNJCFwvOOV9bxOoCvyhwQfjHNG53t+0GmLUilFb
	pqzkx2k6UnGJukrbzVlSZ12rqAXyByeJXUMBbuYkKVOVnJf7UYG37gk6MKGyfhop
	FVdWn0T91xw4ZYFDNIkuypOxKs4yKTEmG47Na9OtmM9MNiELK5B6G56w+YVbAn0r
	fe0lQgLYbW+qKUcyMjqAH2qOjrtA5gAvSHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3daudg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so11531764eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101805; x=1793706605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=HepyyvFZzNrlUQmNZ3kXMsSlXgrMnwNGft5UYhas9CUJojJ3agOkHU9hk2YK+nulu7
         D/i4Lx+KnVW3dIdssoUHQ+BaMYEygsgROfN7rK5NrNkLRH6GbQpl/HgMsHOuDh3Rdy/J
         97lh8ERV1YG5D3LLQnYqM/CJitOhvYBg0If8T5uXaFN3NlbHeCY2xSFNKt3lZCrhOfcf
         Sy5SYEoEI8pkRcJ806sh/ym23vmbY1qIQCBXs5VOw3LrD3NKsO5TZE7RBqTL2feqX77K
         sbRAacgQ0mF2jeopTvSEEqwyI4xmFtwjMeTeaWPEhasl//AaEr1RYbu09UpR2cOaRWEF
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101805; x=1793706605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=sDryRMtdSbwFOvRy7MQRpYDlBwBgnSJZMH5fxQWYYZx2bZ1ipB0c82BybtQHcDPCmk
         DPpXKAdL+/aFIZrzzcFEzPkUxy3t+q8ke8oKn+Tg+QPW43HeS4JGwwCvXhHCgYdmF/hw
         g1TLoScjFIfGceaqEUmQv8cKWVoGfZe7QZ3dJikM/50GFY9pNPJm3fn9wS+RvYybXEmU
         37oC6UPLSxsHWiY5xlQvkkHGJSxlaLJ9c7Pkdn2HFp4NCZ+YRCb+Ba6v/K454pJHi7GA
         HFxh2zMqxHjSnfXGnbI+YPbzH6zLH+poBugzCQqzZ4hhUQo4qRBgWRGc1f6wufFt1buF
         BdbA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ2FB5KCANsp5tatmkykCD6nGqwg4caGxDjtf+Dzh5iFdtlwIcmtj6XB5OkJ1swzSTCNyTVd/i4f+DlMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy7FasLLLiu5NfTnFIQ/pEe37xGiMk+GFLqTmzNlsgWKjckE+0
	jefi/eZGM8yHhGc7s2rV26lrmzERJTVsMF0JnA1NG6Pk9eF/qlkfOyIwACVA+d+eusYKDN0li0F
	ORPZhJ3pW6SiStjJNcOJzEp/iPFRF/SbfwQYQV6elZnB1aQs0Akgp5vms4vUW0HmoHwA=
X-Gm-Gg: AYBFou2qv01+hS/nBKSebEwEGyOLmIf6DrYJtFEdzhu5DHNSQAVPHnQ+U1ky4BwC2OI
	q1fCfjKTlrCYRZmR/DdooJQtHH8CGWNNVHp5YpqPN43B6IvYIkFqJa/wjEZDtbhkHWx5tQQUZjM
	VSySq8bR+AKdqdV4fqniTJoqlfpzrkqHAYDWivP2f5KrP8TO+lviuig6wnoUEF4JGIL68h11YXK
	o42XqpFjbXqAyK5Mwf4BTU2Q/7lQK9/CFOwVB2x6tkHUQIALL8+wpC2/tOhXxi9GfHhG0Z7guUQ
	FQneBLnLN/Y+NFx5umflr99BoIQ15/VFJXaqF4zD21jc5muWG7HcR0UvAtbJbTExcj6OEK9TuMB
	rvhscl7IBz6D8x0hZueeHOw68eCB9hiaqSknKttQpdpxSAma9ZEN0cN2mUudtfmhhR5w4BzFri2
	bUwzLTuFzEdLo+YRzKjRYoGxsLPffi2wYCivcoAVqWaalOq4o+zSZsorbNGJR5ITNmTdpwlX0=
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175236eec.10.1793101804332;
        Tue, 27 Oct 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175144eec.10.1793101802250;
        Tue, 27 Oct 2026 04:50:02 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:01 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
Date: Tue, 27 Oct 2026 17:19:51 +0530
Message-ID: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0uLaUDTj/i/+
 spfIbOtfPShoivPgCxTReUvR1eAA/wEGsFJ1jJH5xTI+tTdGkj+FSyi1JZPpcKrQUsb7fVG1/lU
 tHkAMA+c7HOfm83APBluNlHX7TgNpGk=
X-Proofpoint-GUID: a2r7MPEVImlOS1EIXMdlD58oN7xbTES0
X-Proofpoint-ORIG-GUID: a2r7MPEVImlOS1EIXMdlD58oN7xbTES0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX2tRgfRikXh2R
 wYRr7lkWVXbMofaUR8HAzhnMIgW8RI8e+Xuv3Sxx+lUChYoRUoJGoeJX1unfp2OqWTlmitIY5M4
 pB6fmhbKEiOXZeazk00tOi8/nl3WTke2V85c9zbeBY32ovPzjd8/60YgUJJMqqzDQVKnqnmFLIR
 gHBPFPAIyG7I9yEgk17+oEdbshXLsTBNAFbWBZnX/ottaDrC1IAolzJ/Jl2bn6TV1+3dY8FaXYm
 aHbRH9SlNej3LvWeH2xgcYndBl9DVeedWr55vKjTapA1jrLZyQ4IQbdkY8SF+i6xaart7GVR9RO
 4x1pv5MCXRYtBNVb8kK2cPdkjcs8FBW6YAqBo7cXZkaSs9eKoxVV3zDPRgmu4H9EBz0Gx1TTjjw
 4VteX6f2OojtUfxNAnk3bascxeYlkSSREpPkKmBz2lzYbu10VFpF8OI4xFmtwi5RgvsCVvyD5vJ
 swC0cOAi1vcK0boRuGg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08fed cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=LhmUFbnPgsWGGw1Yd08A:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

Add initial device tree support for the Mahua QCB. The QCB (Qualcomm
Compute Board) is a board built on the Qualcomm Mahua SoC. Mahua is a
12 core derivative of the Glymur SoC.

Unlike the CRD, the QCB is suitable for compute workloads,
power measurements and oscilloscope-based hardware validation.

This series adds the bindings the board relies on and commonizes
Glymur QCB and Mahua QCB before enabling the device tree for Mahua
QCB:
- Document the qcom,mahua-qcb board compatible.
- Add Mahua QCB to QSEECOM allowlist.
- Moved common device tree nodes between Glymur QCB and Mahua QCB to
glymur-qcb.dtsi.

P.S. 
I tried b4 send, but for some reason the coverletter b4 generates doesnt
detect moving glymur-qcb.dts to glymur-qcb.dtsi.
Git also for some reason didnt detect the move by default, had to use
--find-copies and send the patch using git send-email.


Gopikrishna Garmidi (2):
  dt-bindings: arm: qcom: Add Mahua QCB
  firmware: qcom: scm: Allow QSEECOM on the Mahua QCB

Sivansh Gupta (2):
  arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
  arm64: dts: qcom: Add Mahua QCB

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts       | 667 +-----------------
 .../qcom/{glymur-qcb.dts => glymur-qcb.dtsi}  |  28 -
 arch/arm64/boot/dts/qcom/mahua-qcb.dts        |  38 +
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 6 files changed, 42 insertions(+), 694 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-qcb.dts => glymur-qcb.dtsi} (94%)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts

-- 
2.43.0

