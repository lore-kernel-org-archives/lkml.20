Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906397;
	b=t2FLsqzikHVg3mYtC9tCUzCP9c1pkotizVfUiknKa/P1Irf8ZwV2kXrus70XxW774vh5
	 QmofK56yGzKztWwlV7qHEnkOZPSsj28sywfytpqyOcIwsFOxbAn51S3QuDCeHtGKg8w+y
	 Ki5g0aa6ilCg2Jk6E8dBJNE2Ff/0mvbxp6+k3um5eb5OhUkJI9ph5yDTXC+FWYnqqxQ7r
	 Nd7XwpOI74SAKATPuhzXGVHaDTUdXc/hfw4b7vfXL7pXbH9t0+aTncl3lRJ2DrWE5TcTC
	 nqj+JYkC49tTvtb6ngxMLMvZbyX/4YyLjgM/nSBn3gTRCnmrNL6xC1Ac8tUzXDsKb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CbpQBQ16MuMOG1rclITbIxI3R99WZRv9xaq8kicbAE8=;
	b=iZe01pdFRbCOYHOYnKjTI78gtLyKiIMLcJ9GI8NzizxYGnDY2Y3SgRiIhlI5Im9bRkBO
	 cbW0ZwYV9mkx5lIqL/j+9dDZ55FCPCaA9rDDZwtYLZEdgtq3Dz8j7eX+ymU6IXoFqbDar
	 ItdpWZS4z1LgzqVRo4TiKF6a3YEsKzwckj7p0V2KTh4jqm8D16ikL2yXLUMUghkRZzopi
	 nAsetWGr7SOY3DOPog9aH7I4tjz3kmK0jYmAuVofWIav4r+XZ8y+Kkg+nTQBJMs9VLfUb
	 AyeXRuWaJmS3bYRvAkXIG8+NeE7Tx8Kv6KjhZDLQHj0JXGBlyp3tVyhrc5sNPiN+D4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mED9hrhw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtNbuwW2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3B606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E3B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mED9hrhw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtNbuwW2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55dfS3349999
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CbpQBQ16MuMOG1rclITbIx
	I3R99WZRv9xaq8kicbAE8=; b=mED9hrhwCRdmXiaWsLCLLG55igCFlZAnweJQuk
	4Kkx0T778Cmmy53TYeGLX/crZm1BmKNSQEwVkcxmVijLWx3CmBQdSDu1TKzvJa+F
	VcZ1cqgGvudk+asE2AUnQ48mjt5pANsFcjSv3XjbwtUTP0tq955KxvqKgPiCzJy7
	kLVCfp+qyPoltPsxjlIvzD/5Onf6C0uR79AYkSH0aJjtsAFiZV2kO75/K9VHfqEW
	lMLV45R/ugdTPA+EqT0uRY7aC40aG8UZIaxp3duHSgJDBc/l2MM12NsXqtgtVIPw
	l8vcyuxMe9UD7nN0qQfBpiSpv+j/sqZKVTLma69olEmWhGvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0v5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso763237885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906395; x=1795511195; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CbpQBQ16MuMOG1rclITbIxI3R99WZRv9xaq8kicbAE8=;
        b=PtNbuwW2mEcME2XncsDQNMQUhko71FRxhxHAj4DHUopTw5t0XioFUcndBv5fcv2jnI
         d5XwRH2OfxZM/0z+S7jJVSBfHD8J5UCVndsGFJLqI46IbBf657xguDaqusrc5NGxBFZk
         tG0TZtEMjH3iTKXlINyHGTKkendJSS9SS7Wuv/psrNiS8BDITnLac8nV3H1kt47WyQ2O
         nUK+sMj/FW/l9MDDX4EFp7VoiRqjnCWMdd036CU5YSnwpmhNls0+VL7NrQ6WeTHCI8FX
         Xzd3Wy+HTzzGVaqswnq+3M35vCrNMmcME336Yxrd4XFV02nOW59tELXE9P5r34GQDsD8
         daYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906395; x=1795511195;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CbpQBQ16MuMOG1rclITbIxI3R99WZRv9xaq8kicbAE8=;
        b=wICmfbYuBPOYp/WOnTpwkXb7l0oBMVwN1MJPVvEFahnZjcVhUgYYelKD7BIZhPYexq
         vCss2zGOBtCpI+D3z67KHBwTLP+GF09pAVdamc/qKKKVpMBpFQS28BeZivLhqwQjo4FT
         SFQFHynF0r6/UnsJw3S6OeH99j2bESoVGrAw4q+l+51f3a96f0wanSiO2YcPKWSRt1Ga
         oX1j4wWIhITXXpaXtsr9Mrjv+EVAaGm65xpdIPqLUK7qtk3Ywe4xh5mVtvDvfoGfl7H0
         a5Yi+XJR8fzYV06SnI2uELqD+XdK0QLIeelsFeQEHT3jVTrZKDVM65VEd2RaaC5WmSWR
         9trQ==
X-Forwarded-Encrypted: i=1; AL+hErFO0IRNN+ugA21fu/pUnFFmvj000d8rwnU+qJI66Cm+xAzm/t5NEYPU3s0m3H895BX98ij0EAnKsSZV7+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EXY9g8AXVi+ZBqYzmOm5Fn9ReTbG6LtuewFQsD8xaUrtRYAJ9
	T1Cw5MYh7mNA8q8O2HOX3LweipHsS74kc9Nf/KuwRjyLrW2+zOA88UrMKKMlT9uM2AWIrfH/3Vj
	hE0Yf8PhuKpNkK4/8bP19zf3G8bzxVYcRi82Z2dvBPT2uULAgeYq/5TbO+m+asOxi2TY=
X-Gm-Gg: AYBFou16HeuJ8b3VrlDp4j/YKYLOQ+QLD2FSe4XCuBpBIRL7y7wrHUBLDUB7IFlmYBX
	33W5KNLP++2ssClpCv/9zowcQIb1TrnbKHnP8xT/MgzNsKYKmMcI3yQvYp/rfiHVXuFs0xV0Zou
	YJunhpjF4XkrRiyCWyxDcrfwkEmFMo/ARF2KtAfQeFLGfdLhPGr3DnBa/wTCjZUvPcWD5JB4pp8
	f28q6cELrFeNhT7pdS1Ugq5b+LSvx4+F2x0btGyMquA+yHv9jj6fVT8KJSF7QroH2x7yVB0dDX7
	PUTDTiMe1jlysupToAb+etYGFLq9qJ6wEr4CObFIzK2fgFA3O51p7oQC/jDDdoYbTPYTRr+FitI
	XgTcx7IJxNEZu1qWzguuxspx8JMcG3nhVimIbuhoIIZsFZwObpbBdi1nCLNznlgxBDKndRROIDc
	A=
X-Received: by 2002:a05:620a:1988:b0:949:6982:3f07 with SMTP id af79cd13be357-94969824095mr1482998685a.32.1794906394993;
        Tue, 17 Nov 2026 01:06:34 -0800 (PST)
X-Received: by 2002:a05:620a:1988:b0:949:6982:3f07 with SMTP id af79cd13be357-94969824095mr1482995485a.32.1794906394484;
        Tue, 17 Nov 2026 01:06:34 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom: Describe the AHB2PHY bridge clock on
 Nord
Date: Tue, 17 Nov 2026 10:06:27 +0100
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABMZ/GoC/4WNTQ6DIBCFr2Jm3TEwNDV21XsYFxSwkKootKTGc
 PdSL9DNS76X97NDNMGZCNdqh2CSi87PBcSpAmXl/DDodGEgRhfOOeGq/ISzDxqlvdNiN1TjE0k
 Tl61Wg1IEpbsEM7jPsdv1ha2LLx+24ybRz/23mAgZCia10O25Id7cfIz1+pZjiU91Eehzzl+bP
 ILpwQAAAA==
X-Change-ID: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9FHbrbM2yg3aPa7LTlEh6W+OMMqKW+QlgE+H1/SgkKM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkWuxVk30T5DY+X8ZmyVBzygJcc1wcuDGYix
 E2mzr+IuhaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFgAKCRAFnS7L/zaE
 wwPaEACC2/JUDWbXh1Ss0pzbUDZcfYI6iZpv1vIzqTgJ28mACAaYnrL6DVaRvtJzm4d9QFK9fC3
 NwE0Dw0IJjr5Mhlcoq2BDrX0TBbORcgb0PqK9FKAisiYJYb9bqVZIoLjx89zJ3H7+qti4JO67P3
 JzIvKJOu0JVBO84lX49UBkTmtb5mSM61ABp7PF8egOP5EBWL/NUScri02A9YEduWWO5loyt6Gv9
 YKbEUStqmc6MANFojawmF2WY1vekisxHfrSjmquzIado5zumDU5/N4QLnuZ0iE1P5unrcBQHbmy
 O0bCGCGan1q1Vw7vqXllCIumwAqhhSaTN2JmJnfu2xHZP19fW7dwvLkYDf/GGJfDKQ+18FqeJIz
 ZOZ2JGRf8nWzmIArgy7Niwc38tdTdB6VtiYpbNOqyrV3SiPG/ngKHY66FpHLTi5RiHKJs3fLR8A
 u6+md4EMz3UXVZR7tbrAPy2xw0pvUuzsrdiq6QDSKbODsLc9F5a/Zl0nwyG+NEKZKHg3vmjd9cN
 S63BZGhNXTIfbYHsmYSBmS/nsG7aPE4NdkYuju3zINOxC8VDp+B9glBFDD2GiE3F3cjBOXRk5qu
 CjwjWgDXEliZVnqgxg3QyXe5EgJMaSADA3/6fadaWljMQj1YFPZ16Su87TzeMMovznGnzC7dBpN
 XSNBq7CSG/Ws5Hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc191b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j5_5Z_UV0zr-ZIPiTBgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: tB1Rx-4m-8AljQ59E_8uLSuJBiRLMJOA
X-Proofpoint-ORIG-GUID: tB1Rx-4m-8AljQ59E_8uLSuJBiRLMJOA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXzU1X0IH5OKQ8
 6Vw7B/K7nGBIbMrxlxR+bymS9mlQJA/1pll2FYAMYd3QTeqNuXSYdvhvLTim1Ku0mz3n/M4mqtF
 r1wk3g2oRh2Z7QZAAZRZM90RArA42j37aAjVQmqynkX7PE9/Kif3zUYMNNnD4pNi0KQvMvbTXtS
 7WBQ52T0+Q9qkjcfrDKDbZDOVlN7htwuKKgv+Zcy5/7XuOWAwioBa3Gk6XAMScIZg6/lOebNw2S
 LbdX9FvzF8OBTYE4CwLTM6mbzFN1H7rJul4uy0oDKaYjwnMVUAbTpBrXMbbQJrcagn7jYY21ic8
 mEuAUAyWN2XgwF/2a2Dr4yAl9OQU+u1eCG0neKrKo2fqrD1C5Fu/SlKC7zE3mmSUeA7oegme+A7
 zuF9YAOQp2rtv3j+OJI+mK15+w5Ja1QY+6ZAblyBmSArlHJu/N3dTO51IWSHZF7pDowss3ywjYi
 KfFuMQqlAnioRwVaa+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX3qqYPGIy+eHC
 Opj0ishS1Ufxpu7dBdfHaGdQ/lXXZhqGBRh1DZrE0rOEoXAnyX02nbpJiWPZ7A6XZe6z1+hraUk
 1EGJ+rie++L7X37OfRV3sJ6SQIE6VIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036

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
Changes in v3:
- Use an enum instead of a list of const entries for the
  "qcom,nord-snps-eusb2-phy" compatible
- Pick up tags
- Link to v2: https://patch.msgid.link/20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com

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
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 27 ++++++++++++++++++++--
 drivers/phy/phy-snps-eusb2.c                       | 13 +++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

