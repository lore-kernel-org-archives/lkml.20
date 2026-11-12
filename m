Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497806;
	b=nMqK9NXICQXlY7OWMSHJmflEc/gyYiLJoA3yFkKA8iXZKNxLsbm1E39IfBzAnZO0wru1
	 8tLkL5z9mr0rn/HAw2dzzWi7I1fFoB064UNQ2sTXY+WK4Iqdhceffh5QsWbHEGblsHK0i
	 AKxuH5+hCW0pbR31TJIqlh4AGFDM5niRhRm2mDWHNwRwRxJ16rmdaTFJf12NVTFVjMu4r
	 ySN2385DjLo5WxnoJHttGjew5gf7HIwFXj3UgO/IK1KdcWDWrn5zY6IIGL33vA0jiKJ/N
	 oQhVzF8bomZ3/+R0yukurRDXPKl2q9JFCEUredSm9fl3ZzOREmP/ZKBPu7+CnJbozDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
	b=PFCrbpZcGbeh/Nnb7nMA5Hi0gAIh5r9hD/usMRAlTQnDKlQL/3RPCs78r1Cagm8vCnBy
	 3Jrvw6rSqPdwDpiYRBKFCTw02YYBRDuhdrgiL29FNqXLTTuyblV1O4+grQrg1ckRFDbGp
	 L0t81hM6pAOxogBeS0CfRK3lmdPgtwN3pLFTUbR1rciZlEeeBi9/JFCsR9OqTUZiPRdYW
	 +HNLuorGpmz+4MSZ0qA7ZVLZMPmEk7yWbDhYQEf9Gb1UqiC4MVi3omephUVHZsskcO6cL
	 B8dTX2eZ/+odL+F2fL4XkChdAF2YzFrQ9kfH0e0z7nmJAkkqIxoxhMmBnfiLN1Sw55A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8cw1c5d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gX6k5Tlp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8cw1c5d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gX6k5Tlp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZZIV656973
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bByGg6JAw17Ly5zyYq9Oy9
	b5UiJSKoKnL0GaYBDTkvM=; b=a8cw1c5d1f0tWkOY/B2w+cAq3Bi5Dz5M8i4Vbl
	yWYkA0MArDrj8xehZZ/+az+VKz3CKcsIMfCK3uaPP610t69Pm+gVAmRpJNeIYsy1
	HOjs+B+otWRJuv7hso8fKQseru3tI28WHmZf7q8ziM7BUP97Xp8RJ8vIPaEExTPt
	pDG28q2YlrykPG+0f0JsC1ipie/YoM/tWY8+OH0iabvOe5JNfeEgbGMr8PjnZAvE
	dYFt4I0upwAjDi3LZdlabj4xb6v3TjYRYAD8RuNlaQ181g/hYjJUAUsnn886f9HY
	mvrkcxBjhsM75Zor33eFsgP6iB6YLqPwjV6AWVnocY7iVyZQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuj7a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-998de183a74so910237241.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497804; x=1795102604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
        b=gX6k5Tlpz9rotdlgtfGIzh/stxizseorFqZ49kX6Rm+HlCXBq3LFXIaBBlfnlufzA3
         NrD/ru4BZSjac2BcRtyn9akariuKyolu0Yu6IxofeP0AUXO5AF32FU9vSixw9iqFZ1dY
         7lDLpX7Lh57/z1HSC1d2QvfUEAyb1bKTo5B0iBUWBaJJun7IbrEraN4UHCmH8missbhS
         9RLn3apDc4izGtVhPA5AFQMh9nSyXbX+yQiQB1ZV6Bx2E5hwBsGMX5JVfxoO5Jru6hLJ
         BKDz5h3S490iH5biImWVCD4iVWHUc7Ygd8GaC9H4lcpYecSwnDxkV92De5OKu+vJevBp
         gNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497804; x=1795102604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
        b=PG7zUA42qqNy/408o+SHeT9UHfRfe1NO1X9jZs9peV31U+2hvM26zPlC9ELJpX4PEO
         IFkbPzG9qpC9R9CO6tlQfAFuFMRQj4qDUIfCnjPiQBKRE+SdVHzavsTfWiC5SyBFx55b
         o6KzmmjzYxDJ05RUhWE9sRQXLKXTxWBa1hOBt6/JiNm4Tc3bQTyp/GYsIWorTsX6mG3g
         2JL171HGwms8WeQoWs5z1EzgPnjCTadFIlJ+mvRzdERfE8Umhw+es7tCJNWIafK+nCUm
         5s8UolpYVkJEjUNo4NCx/8MksopzjkhCoI1EWSBSHhtdtWUfoi6uD0LFoSvDvr1UXN9+
         ByPg==
X-Forwarded-Encrypted: i=1; AL+hErHVyVNCLNAXHYBq/+DP9uxQDzzdEvffx08Bga5CPHwlbXSwDMwUruYbPQYnuqyne8Nv1FvGK6nkaeOCV/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LIUSXwnNdK9FGD3IJAqYaftz2bxMHAh3/5Fo5aWrMsONXr7lN
	ODZnShS1VaHiyhcR9oKIazOjLi5yn2etFMqyCyYp0rNEOzdpEK+SGLQkBaLK5ZYgiw7bv0aLCyJ
	jtJg7XQaRJx6aaR8G7WgwtPRKIeuzLSg9mqJ2Bsv5yApx2i5TvxM/ohCXFUTesFFpZ7w=
X-Gm-Gg: AYBFou22uFZc5rpe2/ep2wFWrcE1KLnFmksv6qBxUY+gwQ9qPqxMxqWzwY+Gh+JUdes
	ee2zHrSF7KUlKW852KhMNOK78wvoZX4w5jTjVgUTHBSvR3EMxVHycvQuzTw89yC3XooT2omJpGR
	4H7tj0FlBQwLTnTF2SK/CtEIOePkEyTZQT1LJPlcT5SASsNPHUOpvnJ/kxv5aIxT47vU1ZS/fBY
	Zv3y2JqlvjFrnZ//2GSA9SzC0IvE9+8un7Rdjn//WS9lZixfgCuqU8vFnToLU711xWvCYi8S16I
	xlaaClNki3cfT8RzO9/iAzEM9StvfNx7VlY5KUCC4tPMjzhlDId0yAg9AE6acOs7tro1WSYg9wd
	dLbSVDiIjX+SHR8pPxDRQMNjJ0t345O73U8Ryj2Y/5owz0l3icHVaXDTBlBHmfPRd83nzmke3Nf
	NrUA==
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr2084942137.37.1794497803567;
        Thu, 12 Nov 2026 07:36:43 -0800 (PST)
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr2084932137.37.1794497803043;
        Thu, 12 Nov 2026 07:36:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: Describe the AHB2PHY bridge clock on
 Nord
Date: Thu, 12 Nov 2026 16:36:37 +0100
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAXd9WoC/x3MwQpCIRBA0V+RWTfQzOJB/Uq0sHHMoVJTiB7iv
 yctz+LeAV2baYezG9D0Y91KXuCDA0k+3xUtLAMfeSMixreUF+bSAvp045p2lOcDOTD5U5AowrD
 a2jTa9/+9XOf8Aew8FqZnAAAA
X-Change-ID: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mULlwViyv0exnFtcM2GrsqpSROgeSPiUGvff9t1domw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0IsJ8v4K0XcrRUuq3BdJIgorK6rsVPY+uEN
 NtpoxEpklCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w6auD/95jrzroX+IKtiATPMHYGVSu7T1Uxa+mBTb7LGhyEWm7J2ub4ba9rYAZv3oQX06/oJWmIO
 NgUfAgALPcd7Q98g2V7z59mAKfrb80yJnOWDhf3XrUfroAIvElqlIYXTfwOUwmYGDLCC8qlyymv
 56etBFyWuDmdhsIrxIIKxBa2v53Aquajp5peqiGNRyaWDsTQr+//djo78kZQ4qQHAIhdYmmEV82
 47+U3+VSszq4qQUV74wnHQl0YrirWuwtNjyyr9x/+AokTuJhPII4MsG5n21H4/zP1+65b9pWkfq
 6LHY+wdsbfD0oEwWVjeAdWgipqcXeHoOlfSQae5Qcbm4Ai7AT9V0/NHZpE8RmMhtoIQ24SbuBiw
 B8uwWiwB13uyVvJ6YxxL7M2E6xz1vR8NqcTA9JniLLnufXojSEmOMPKBcP4JsYmDtYqZDTAGdoA
 U/n3SmeL/vNLUuTobJQA6So1jKFz6PWdOLAFjZnlm7vZ6N2U261uY0F8e53VWQ/b0Mn8kkXPhAS
 UFcmKRhSOeaOqgct4SsUHDgfbadByOIfUp8pVCpCQkzF0I+kbB95kKU5dnf2pRPoQem5PApVVXf
 2Baz1UkBvdZKRh3P6jfLXyspmuiepbzTUy4VDOeD7vBFW8qwEEEMeLQuPHknYAQ1lVJDh6Xuw41
 wVPkCzP+cEEQ5KQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: p9MfL8Zw_dLoo6cZgPfBDMWFKVpTUH_O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX70n0gg/ow4eF
 MlZR0A6T0gecEYjhi0u7yki8qza0C2yONfhyIA6xYRtBwTQwlnqhckFFmwHWptmk1xCGYuHDIOy
 EjHQLbqWz+S9hkZvAcjG7VkLMc7H3+g=
X-Proofpoint-ORIG-GUID: p9MfL8Zw_dLoo6cZgPfBDMWFKVpTUH_O
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5dd0c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j5_5Z_UV0zr-ZIPiTBgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX4IpwY2YMMI9/
 yX1pKHU+3ODY0Bzu1nJzi4fQDQpfE76meK7jXM0FqHjZaCvuEAQm+g7XpzVfOoOEQwtDaRKlNIT
 8iPt7D5o9FlkheY0QlmnVPbLLU5wh01CewQNoH2VUXNnG7n8vi5HzDCdPXE/yVE6OIH/4RIawlV
 0BIZ1EzuzrhN90+kfBZ5YNvHDTnEuKI1Sz1/a4lptsodCVfHVQtFPKZoD8+cJzhIOOvQz7NhAkq
 t8s1TOw5xCDKM21Vc7vd5imFBddc92tsZLow2CE45Eu6oyK6UGBKe6P2U4rgOk4H6RBSXaIW8UG
 1CPHIgGrQJyZhyAq7ocJtcVtjm+WSPNN4kHRhrKa2YqIan0TyZFwR5pUMOUmQcRzbEMBKSD9Fad
 MRhS6MvDNneMYq2lHwWHe9nThn/zNee1NxHt7nFc5rMAm/fZ+0zR8imKGiHfdKhX99iFAqp/kbB
 3pR04ChFmDQ1vaMcDxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120062

On Nord, the register space of all the USB PHYs (the two USB3-DP QMP
PHYs and the three eUSB2 PHYs) sits behind the AHB2PHY_0 bridge, which
is gated by NE_GCC_AHB2PHY_CLK. None of the PHYs currently describe or
enable that clock, so clk_disable_unused() gates it before the PHYs are
initialized. The PHY init sequences then never reach the hardware and
the controllers fail to come up:

  dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
  dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
  xhci-hcd xhci-hcd.2.auto: can't setup: -110

As a result, USB on Nord only works when booting with clk_ignore_unused.

An earlier attempt marked the clock always-on in the NE GCC driver. This
series instead makes the PHYs consumers of the bridge clock, so it is
only kept enabled while a PHY is in use:

 - Patch 1 adds a fifth "cfg_ahb" clock to the Nord QMP USB3-DP PHY
   binding. No driver change is required.
 - Patches 2 and 3 add a "bus" clock to the Nord eUSB2 PHY binding, and
   Nord-specific match data in the snps-eusb2 driver that enables it
   alongside the "ref" clock.

This should go into v7.4.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop the qcom,sm8550-snps-eusb2-phy fallback from patch 2/3
- Make constraints on the number of clocks stricter in patch 1/3
- Tweak commit messages
- Add Fixes tags to DT binding patches as they actually fix existing
  issues
- Link to v1: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/

---
Shawn Guo (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add the cfg_ahb clock for Nord
      dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
      phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  3 +++
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
 drivers/phy/phy-snps-eusb2.c                       | 13 ++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

