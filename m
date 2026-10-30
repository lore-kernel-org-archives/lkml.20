Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341268;
	b=BBdjguT/utdi1gM+5B8GCRvFd4hxB8seZbUH2xxOAHuW4AxXB+fVOiNX88Zm6vsAGWHB
	 M2YuvB/ig6TcpijS4i/yeMrxZr/o6P6Q+9gDJIQWkcda6HR/ObeESLutDJRriMDY/chrO
	 2JfZQXe9H9UeC7xHOFhqQVtJ17NxYxhsDunFqdU4O1JNAHi3a5FEnihVzOS1JBjEXBtLG
	 DcsBLzyEBGkOiqiGu5OZ1+S8R0skpeKIfeqeHHHgI+TJ9TduiqtkApOC62HE3WawkIn6m
	 JitLxHVmE1ygX0Bxb2BGYw+RpLc5tmLTNhHm1oNbaAcLyaMYaUXKot3nnWnMHo23+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
	b=CUFEUqKLNbq1Y11tREJx84JusGuHCtaGQVlxXzKFV7Lwd1JA+7nwM8/STfMPJNU2gnFz
	 8CeDfkBHb0TYHtfJ69VvQBN+W+vhaN3kvtBbNTXYrRmJvfulTMc+pjqA543ONzhoG20dI
	 aUMNjuC6IWnCHbNjf1kiWEueW6orl1VVEDPbx/OfMtllOJiZ/tt/6HL6khunJBIxpgIEY
	 wmTAaEe0C1Yd5gn92wQlueIFuj203y95o5WgItDHbAB5hlpc2gPREj7k2TWHsR8ri/Lgi
	 xNe1zS9/rmyI1Rd2RR91vl0yQp65stZfP9EUtHP6vSumdyDgEMydBHD/OjbKMvtFpdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIlVJi9O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C4606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIlVJi9O
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FJxb2287190
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jPH5IEEnZfHp4FyLuqzT4
	LyHDZSoEvCM0gwfPSo7F8=; b=hJwbNfE4B0B72oAOUG6oyM61n++VLVW3g0Qp4A
	efHXAzMBrqyzJb9Ob/thuaxdVqZTvDGp/inImzHf+PBAubupkCjLz9JrELnF6xT8
	0CvlMEsl+rMrvUhz7TTvzvUBst8fSEGQtKokv2kiGgeuE/79JyjR/+2ptBx2xaZO
	PNedvc3YVuC9nTbbPY3RquQ7oMhMmKBWO7uSq4Vx4T0+wyv6r0/ekAUxSxa9Q4ig
	+0kgr9kIrYtRC4oO/hS7wiUkdgcSdQU9dOpQIOHdqHYnm6vtFCKWUIze8WZpY5jz
	BX32Nyy/G7QbYEzPIfVmLsl5zp4pHs+Y2tlgZIYuOVpGg78w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd65285537aso172868a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341266; x=1793946066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=aIlVJi9Ogx/gJj5pD55YMdS+WjT+Upq4Na6mSZkA9EHCGBc+knRlZ18eAohNWeESYn
         EsiqDSGi82c3q1axbiLqC3OXjFwX8oKAzrRqMDjARAwpRx1nooQciXq3D0JEJGgOPQzv
         FNmKv5qhkWmfdbWF7yAWTv9QUgL3MYt1eNYOlMcM50ag31QBUp0pSgz/slSKzT4Q2+yI
         YsmuQxhyOqgGGCqrpIerGtyThkqCwC1H2VPwQ8qthsbngVSo/alj2sZC/Wvzo+6geB48
         fySr+8fdc7biQdLj6N2GJDyotc6kpJpic/nlwiDMw9KJbl4ud6y1Gdj9IqNkhEnNZ9XL
         XVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341266; x=1793946066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=FPqKEPy95PeZVhdfwO8CCXiNu2o8JunSEny5AAP8SPKytgJMfC62e3+r53RDRV7Lud
         Ml15FM/Q+e0fts/cVB8byBdqY2z6rWQUa9ySTmMkZLB64H42pgTxU6CGRmay7wl3oXMV
         0D7qS7W2qhku2qC9RIBhmWNnk4s/hxB+BPNiDMdqpox0goygvWvwR8B3HULSPkC62UIv
         0PsZ0ItdHpBAKm+gXUXLteA+6fBQPX4+dw4qlCwOXyB580w2ZHVfg0wfqPtT0nbXM0UQ
         i6zk+AnAhYutDQkvE0WOQePtPQnrwSAvsm8jfnxbBQ23pUsmg1XFdgC9UyBTckjXHfk8
         8apg==
X-Forwarded-Encrypted: i=1; AKwUvBwQmoQJ6Hzu8pAJDpucqWdy6UEQBoBc0N8v9roJ+GXfdpklwI/5EfsuvWHnTKYEqpV0ceiZ8wSPqaQjdGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYK3Db5/mU7NQIu3c16qu41IjsSKeCOx2WeT12QaXdK6lXrSCn
	BallmUrFMXjeHsbAHUFSZ6aHXndDjS5Tw1rppFcSxVVV6eKGRfdXXXYFXv5nH0yH+BubIUQdc1J
	KiT85lHnhtUCGID5Q/ajNtOGbQorMxNp+iLqa+d5lVlp2atjTw0jwJgahv9nqqXmH9hg=
X-Gm-Gg: AYBFou2mXjLr08qFemHibycRvhHl58idJi/47E7tfjFVyq8vQxoBQInHtbkDNLnhUDB
	L52f3z9nWtcS24zbq1PDLWbSKc6Xqb2JvEewEb5ewVvHvJxXS83WApi4xfoO8F+RPUtOPbLUM8g
	A2HiUWo6U0le0tIWCpZoS4fWA0RQ/gWVBBfh05AHF08+UziZM/2Y7qOolYfFFjtJPT/LK3/tOBg
	Ux/kAhI8+Z5O94oXeln0tB89kenu2TOPWf+ZEOMY0HGnS6mM9UdWXiFq9WK3eX26sbWX46ZIJ0A
	IqpL/ut5INyD78cBKHEKSO9u3Rs+qlWsWDrG81v78kgP1PQI8ruOW7KHlFC/Kpj6vkauJel4n/w
	D3Ke86Kpi/jsr2KfiXfS6xm2fX9qAV8uT03BdFkXPIIhB3i7DvUXaOtIhwwHkwEHdWI8=
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373561637.20.1793341266230;
        Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373539637.20.1793341265757;
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 30 Oct 2026 11:50:48 +0530
Message-Id: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEA35GoC/22NXw+CIBRHv0rjORxc/IM99T1acwqYtBQDZTXnd
 w9s9eTL3c72u+csyCmrlUOnw4Ks8tppMwRgxwMSXT3cFNYyMAICOSlphseeE0oqDaJy8zgaO2F
 GckiBsgIEQ+FxtKrVr016uX7Zzc1diSma4qLTbjL2vVU9jbtfgO8FPMUES8WYLHhby1KejXPJc
 64fwvR9Eg6KHQ9/EyU03TVBMDWszCQ0rM1zvmNa1/UDu3uswhcBAAA=
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=3226;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3NpmJ00rnG8DyBULcr5JZZHRbARR1VK7xLOxGL+7IFA=;
 b=/vJGQOS5qpLtuieD0HdMKPT5yZCZYaakmgVb/mxMetHXtqSQInFlAwSct2xAEuf++Cl+6XLKP
 Sikm8WVVrv3B5IynI3PwMLOI/0dI2fR+vsdoAno4MVqoAFyk46bQP4B
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: mx45neIcls3Il7SB29LVjZZ1Q87te0fb
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae43753 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jA20YhC1vE42qShcUG8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX0kBKdVgckG2f
 XkmqAl5Pvx1HORBZ5ugkfJotZ1P1OnRa+oDmcZKcIAafRdk+rWyqaCdNHFTK+AUSVQfW7DrlGaF
 Wg/9nULZsb9ERiyPQjjAo1KWLcaH986GObkQQ6B4spi1tNd9jOnT3KDjT/WWFqU1U9sqCj5metW
 09eIAkIb/HnoinFr7s8k8XuP0Q7HvPCmudfGrFmrKuehaLF1UihQOoNzKEIKOPwknlDdKmQolCf
 ff243pOhmXpdWHozsD7oi2tUmMa49kHJdVIiJRjgJl30/dTN2Oq3t9hdfL9kx16tysWP9/9H9ag
 K+6/LWqfIbpUCANqVCUm05kH/C3gdXUW5DTTwSjtyhUxtr7L9rkxIV1sVrUribfbBs5SQqvuecu
 L+gYFAzzl+oXy7tYIAXu/IDNjUrO/3M3tduPgUbi6WqVeMh5MHFASluhX3BHoaHDqgISh28lgnL
 5/mphcOMwG1DGCYC9hQ==
X-Proofpoint-ORIG-GUID: mx45neIcls3Il7SB29LVjZZ1Q87te0fb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXyKRt3aQim3RF
 BM0CGn6vVCmxVx/GBGeK/DnzkyXVugBSRAYvC52xhxTYtP0wYs4jxkKM6Af2my89xnc0wKpqiCh
 87dzYpuavfLzxVoyVjTvxOn4oRKj5PQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Updated commit message of mode support patch and added regulator ops in match
  data as suggested by Guru.
- Updated pm8010_regulator_get_mode() to read LDO_MODE_CTL1_REG instead of
  LDO_STATUS1_REG as suggested by Sashiko.
- Added NULL check for of_device_get_match_data() as suggested by Sashiko and
  updated TYPE_PM8008 from 0 to 1 to avoid confusion with this function
  returning 0.
- Link to v2: https://patch.msgid.link/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com

Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: pm8008: Add mode voting support for PM8010

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 183 ++++++++++++++++++---
 3 files changed, 295 insertions(+), 70 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

