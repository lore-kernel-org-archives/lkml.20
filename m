Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1587513558
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677900; cv=none; b=jOxrQNgYCHXEwFfCQ7eOR4k15y+x+u9FjuGD/zVymJJ0oBv5osdTe31mRT8r0HSGBa4kfvZ8Lqt7A1NzYjvpEYc8Ylkew9Od2yXBULtwm8BjuMHYe4wEMNZFN8rSuhfi6I7X+erUY7FzceNGpYy2YnpK+GZITVt4FgCCpUqQ6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677900; c=relaxed/simple;
	bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b3dtucewuXkJUL3m/D+wK2xg0mVtxJaNSIi2Nk203V/R+yQ3tvh7axAI1Kep27ircyuq2hjHfs5UC0ognkr/H3SvYiEYQac5y/yOuVVZgqczEUP5/qCExekvxbYuzdBvFGadesQJHmzxTFBOJ+4sAz4XumMRLaLvkjvxf4pljy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Acq4uM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc90gcJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Acq4uM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc90gcJT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ToFt3435129
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WuBWHHToL3K7RwYQNdbWwY
	+nhIh7kIQTyJPyvxEIHhA=; b=m5Acq4uMj1KHvZGkR8kFXaqrqXg7eo5p+fte+8
	6bI3G8o59cXGUWCQbTxg+aDnohwSY4tmAn9d1OicbSt+WAnkrBbgwcQ0L4WKmMWl
	MZHtUgkzcnCGLU+6rXCjXHh73bOFMhvVQI4dyWYgjLwTb/69wiil12lhy6Q8y5lx
	AqSV8Ab+8NvF0ienmgXObOSnd3a4nESS/C3JGnNdBYETtwUd3U02ubx++wwpfQNN
	9EITar2pmZoSFDiyzeI4/cQN2AWFapG6O3lO/AYVxqTdAFCW5zu95nmLK7sCoEKv
	ZXURuvgP8YcnMrUeUtwOuZNlcvWgfojKhk6khDxew+VFmTQQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbhef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3389220a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677888; x=1791282688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=Zc90gcJTr+n2grhAgnSrl6tRcVFI2tvsi9YxpFUsIuIxlmNhj+uFrM59aghW6rt6Qs
         QzGAQRMBhr6ikJD2PIUkqWq3X4e1Su77/HByuIaYJebiLtvaWZfowcPRQFVyXeN+ssaf
         Lbbl0K8VQ6wIhT5OMCBu6foY7vJxJRgYmw/ogpkd+j5inCDpMZRR7Pk2NcXrY15cAVsu
         ew2AmdvcldCef5i9oC03r3P6VkqWJVxulx5gIFOdFcrDL5F837BF7/Hhl9jK3ROiEqkW
         jxo3QIL5dL8FDI1MFSYDjTItAtLUIMrntFwwzgRM71aIiB6YMTIiKWxObFMJDD+0xj9E
         ULhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677888; x=1791282688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=e1LnFtv4FvTl2DBc2/kshyp9H/90JA0rOj6iFf/z6WtW+gKGU4fFAUvQ3doL5cr0Xo
         l2aVaTi7HHcuLQDVLuCOuk3kfJUQSsvbg7BsKSPD+ag9ajI2y5wRNwI/9wrpwElzge72
         HaaK9l5zqRIP1NuV0hS8aKz1bicr0yCr5EgPqeAvT0QP6OuHSmLeJ4TvzuzEGwY+5vr7
         r79+vwQGLX5AMhVIFDArT+zrRZW7roB5VrnNolJNJeMQmUzEyNVsp+CkOkQWYUGXXdfz
         xfnSk6NsoF7i5InghYVPpe8Zjirs/oJm4G7KLhAj/ClkQLZwIb8M5rEBWuWWVdigsywE
         Vhng==
X-Forwarded-Encrypted: i=1; AKwUvBxAQnmvL/fK929W8CoCSAPNOlFknnYXnHy+M9CdaV270EiM39mCA4cUyRbplYYobsIW8+N0ylisP/vlwQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKrYxrSv8OzcOLZnKLOdcfXeSwzMpAqKC0+JVPwg0EesGpnw2D
	8VREUZ/tbG8YrPs8EHSjwWtXcHAMB9dg0XqUNkKy3NXtDyoBfQFq+s/jR2xG+giHQYr3FIA5qu5
	6yTTdM2GGqLek48wlnWFYpN5TGMJhW3RaVqYs9yGkEq3MdD5uEWnFv0KEUx8mKaXw5fU=
X-Gm-Gg: AYBFou29dxDo6inIKZxsfJVQT8Zw7v8YZZH46k3s/XfntQrKrNaT1UIiWPuLhLZbIyS
	fJBuhssU4EsOiaJWYXyX+EswGYNktnzz0E/90H+3LxY3bW7OHSnxkq3aeR1gZoMD7macBCLDhIF
	t3E3mh+cv1RLNno4nCr3NYvZ0LYrRClCXyLmfN0vO2XD3UbrscPRc9c+1VQGiLWpZ2vQj2G5hJA
	K88TZToXreMAkTee51553iXLUekBfaBKQYSRqpEEceeCDqiHpAMXFtiQ1yGdyZJ+6h6KtspvW1S
	I2Ofq+m4MwcND5jmAcrgKXnIyGrkVua3zkJlHxgxK/AD630dPHxBOcQjKkZlljtHRPjozWafNdR
	lAKREwD3vLyLVAw==
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606748a91.44.1790677888299;
        Tue, 29 Sep 2026 03:31:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606726a91.44.1790677887783;
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Add watchdog support
Date: Tue, 29 Sep 2026 16:01:20 +0530
Message-Id: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiTu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3eJcC3NTA93yxJLkjJT8dN00MzOzJINUE2OgsBJQV0FRalpmBdj
 E6NjaWgCZ41eJYQAAAA==
X-Change-ID: 20260929-sm8750-watchdog-f666b0e43875
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=657;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
 b=CPxKRN+SRfNGx9D8zFn3yOCXAefiaCsFOITRfQoELYm+zrFRlpYM708iTDnB/u05hlu2Zp4NH
 +QD+Ex9wD1cAbsdeUrZBZgR5keXDWzrflDLpn0XQFjQ1qVdj5G06pvp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: MwwopWukd30OgH_UZZbD4OJM_voz-ocE
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb9380 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gH04VMV99jTEonyKTDQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX8pCwvAjIixgy
 kXEsuFi7NTcWYvMkbDro9g8NTpQ3OK39HJX7nKoFc4ReTwa0Qp6d7WrawGUURob8gn6UAuFa9jm
 VQB+JBQ2PoYrROIQ5rGbz6F9iVcK0yIGD9jz45/bVNfHsEIljNea3IDfS3juBnbLuMDqsim/nmD
 YAx7iNGkZk06sJwMnOvbQMedrAoZiOx+achAlo4PzuYfjfJG+XRmSTCeteG9C8tPPeVwX4nLsuR
 fQh0mCJy74aCTXlmx+jImhEmHMV5TZmE1dhSEpcgnNJ4xA8U3DyRCM+fESZNIABMnL7dJ8vtNG2
 YrCXt9G3VdQio2/ze6b+CT9ZFddSuWrKGaQ8g44GrmudRH2uK8r8yQgTVkL5Abk6p4symJJZDTj
 4+/SWUfWOr44ODwbmlDDp9nUJ9P2j1q/J/Ba94xnJ2IDZQXem+/NHf/DrTy/iyF0Cpuc7ngGxgo
 +7ntuAkXu8ZlnC/PYmw==
X-Proofpoint-GUID: MwwopWukd30OgH_UZZbD4OJM_voz-ocE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX7a8ONagJiIUH
 jYfD6owvucW4GLxfQZf1fy70VOo4WbOaHIGTFcH5X8iLs8D02PjBXEx13LTYV4aXw9PiOtENnGM
 WzexSsexyye+kA3v13El/qjmKEDRJA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041

This series adds Qualcomm SM8750 watchdog support by updating both the
binding and the SM8750 devicetree.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: watchdog: qcom-wdt: Document SM8750 watchdog
      arm64: dts: qcom: sm8750: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-sm8750-watchdog-f666b0e43875

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

