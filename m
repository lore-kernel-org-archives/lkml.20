Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79E3E7625
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093677; cv=none; b=LSy6odFNIv0+3e/B7aSNTJA9iZ9xiC8xrCqvuKzkvgxpH7uAcNRwvoLjhcDaP6mK76rgqCTTYWmIF7I+LqHDVoGFlsSVJ7apgIHX0LVp7/RakVba+C5IR9io9KCjBhS7Wi0mrUnjQoTEWhlIvEGDBJjjmCP9tmRxD8xNWDXQLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093677; c=relaxed/simple;
	bh=a2eCj0h2ijL6N+sNo19p+jwZRN2ssbDrAbTTPwAG0o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/R/12FhhxOVM+YYJLmCZvv/6duGUw6sHcs2x4W8hmHelgmZF3axhsJfEg+LfcIFFFf+aiRRPTFQky8prnXZD3fIpeMWi9JzKV0Q1yC+1jmk6qZWAKh7GmowOagtyTfB3cRfR0fltT6YJRfrLeN4Ab0mhwexv25faMJXJxJlq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe84cgqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su5RFUgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe84cgqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su5RFUgF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFDPoj4126286
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0
	plLYdHlE=; b=Xe84cgqmIjAfum+WB4q1jdGsKoBgc+8VwLX1fmsmmRH+4cLyzDz
	MbP3VJkihytT32yXZJAz2RSJxAlgClVHh6Q2j5vQWDtUPdSf+BwUnROTtn5fU+uh
	i2jtshv7+b24VXMm/rngyt1ZXoF8wVrXN3BkuTrHGAntBrE1hcOcGV7rcukQiVCh
	LE6FzwUdp6ZkrmjkUbjsKK2NfYy1Kae+V7JnLgEA/6Hif2vrLbJTj+zJJy0CqJWl
	vQJS/2N2ETAOwTVQLGpLughDUCsh9aLBTh8WHTXm5UIUCI4yHYO/tx7Ok966WlCX
	MbZAt+o+s8xqoZPJpp7TgBeP6PW0JGD67Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m11nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso401923585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093673; x=1792698473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=Su5RFUgFChwoY8NV6KlLd9rvk7DNGYvj4ARqGvuvY4HalzMGSp3pcWVsZjcc3qR38m
         NbSJtyb5DjdfV4GmvqWh7FUBUY1bgjXyrUF26i+7pXTMXOZJar9ykVuRjYqjMnKSZ9C3
         yDItPrWt07N+CiiT2IKiNFEEqO5ns0q9VbTW6L2G3Bhal+SRt9eFM9V7RtF9WuCaK8Af
         H53u3DxZ4+cSI+dQsQKtORHrY8PeTAGT6dRs8s50qtpKvS5yu3q9hveJOFfv4f0svvUG
         sJGarjtceBQzyfs2g/YjvdBwqamGykF60NDBE9aevDbgdUqUPNSCLUuo0MUeqHNOqgzg
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093673; x=1792698473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=LoC6GiwdbyffQILVLHF+2nrLA3IPIioHTJUkL6rQfiOCu3VSczMsWKAOhDpHIPMgXw
         HfPRqMbSo8ja6W56kzmQyIYKlwNzXhwuKhvN6l5qYPEH+Ru8gg6SORlhYeEHjcYdOid9
         rDk9u3Og9stPewZcUoSvdgP2NzFBLpcugErROj9KpSUr7vpCqDMx29PalcWMzPomZjDC
         2o9SWg2RRYrRoHUZ6k8XfaGslWWl4ptWi2HEMn4/ReUUmThwCytL7YI7Qis3jMKYpHZp
         gNgoP81zgXDziKM7IGnb8bmylFZjz4ashsJCp0Yq/kKui9sJpynAeCsojHIBwIcI0K06
         CxlA==
X-Forwarded-Encrypted: i=1; AKwUvBwfGXeDpYScI2LvfDaVT2de8X7rnQoj7mxUNmawANW5JYOQEU5TIyJKDW79EfsAyw7pvwzQGD1bFDVvoGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXjamx9GzJZZg7grXJZFXRYcYkH08a1Yex1Qd3SxoUg3i66DEk
	6cSRpFLymz07WeYfE/OOTZqF1SpyxluQku1uLKxR36UHcVJBYs9+AQj5KTyhrxKk66tGQK9TQ2v
	/Qi7kvmH5nOdoiacjgjmvBd65is2eZkefF8onj075gVZmvM2EWCkyNiHmkDZfDwCbfWk=
X-Gm-Gg: AYBFou3fptRL7benE176lnj24Cc3n4DQfy6OQ4UAqWHX9bnjPgMd2nNWOvNHbF/vg8m
	KH7vGBd/aHOYDTseDvPwbl+ZHlLjKyF4urb7rZYPtUsILFXC9nDwooXTMJypVhZn4P+V0YFHgIg
	lBhdH34HX9vaNWK3JG8uzeL2q6+IBJZT1xwsPbn2RyM+kTpPL7FAu/AoJLmY5glcvXCGvUWl8K5
	uphDQjAUGkfn8VYU2CH834rCWfc97g3pcfjPpCPSQvo21sndI0fQayOoaxx4ZU9v9NHMg3xxOYO
	+AEvvHC35wetlUeVuBOSuppQBPWk5UbuJXl1ma3DLfZN8KsJ71VxrguJmmiTIHOpgzTnhHzBPIh
	FF/TjvQFsA2g7
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181565485a.41.1792093672631;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181562985a.41.1792093672234;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] Mahua T14s Gen 7 eDP backlight via PMK8850 LPG
Date: Thu, 15 Oct 2026 20:47:27 +0100
Message-ID: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad12de9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=6d4XDeVx90xq0oCfjTwA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zB28LKt95JOVr9YVsbXzugP-M9y4OFeU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX4DrAd+ccRUM6
 Ichky4GmCGJ9Q8Iu602RLPknxhaCFdqnIt2krvkIGh8A1fYwrVmwMIi+TfirYcvIeU0Htrnj98Y
 hH1SdtWjlgwNDjgFFhvGsX2qkEUxJLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX8a4ahvSpQEbk
 9AAjhuEVkrhQtp4Ivn8VQCk3O1uiKuJyhUqqcnZwfrgjiqaeeWx8h5qNAXTAY6mmxg+yqIps+a6
 PuosYGHNKQqbsysyt84R+bkt3HpiisRd5HGFSg0bQJiIAqm05cFQK4+oJEg931SHXEcS8wKB+WW
 q0iRo+6oYeaPoLvoUgnRRFK9FRh48a06iXOy6pVKbzugswoRK8wrU3LcfuDKub1wXW5mws7E+sN
 yNLd2rXoF7Kqt1Tii6TuBlgBwYtDIX7n+EkeR7p2rcZxXPvBxv4pMGlnI2/gyj1uv2rvjr7Unx/
 PD/ytmy4aS+xXFxALk0ZtQLanPehOvRcRLXa3sGhpQv9dxNNwFV4zNCH0mKfoY+fb2QH1jhG0PS
 jtqkt6ZSlj1QfUiU+0RX7gDsBka4COE0rNqbikRvfq9V/GjF051AOJUqwDI6riVNtKwWrUPPxHE
 jxJckHAaMUjH74fYjWQ==
X-Proofpoint-GUID: zB28LKt95JOVr9YVsbXzugP-M9y4OFeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Enable brightness control for the Lenovo ThinkPad T14s Gen 7 (Mahua,
X2 Elite) eDP panel.

 - Add qcom,pmk8850-pwm to the LPG binding and driver; PMK8850 reuses
   the PMK8550 two-channel 0xe800/0xe900 layout.
 - Describe the PWM node in pmk8850.dtsi, left disabled.
 - Switch the Mahua T14s LCD overlay to a pwm-backlight.

Based on next-20261012. Tested on Lenovo ThinkPad T14s Gen 7.

Srinivas Kandagatla (4):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  2 ++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++----
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         | 10 +++++++++
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 4 files changed, 35 insertions(+), 4 deletions(-)


base-commit: f53c44783aacd8920469531e7c45f9f70afd291b
-- 
2.53.0

