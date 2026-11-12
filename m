Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470585;
	b=yC1OpuA9aLdNnBjSCks2G0kegV6MCPojldcXSKKD2NkRqoNG7WKJ0YyoSjQO6UJli7N1
	 Ie8zPjNJ1TEPg4fsfQuH5Yk9bWE6aaaS/ozDALHKjQYUgWWIfQOoVFN3R4427zJoD8+R3
	 vbl6mJnsdpsB8HSk2n7OhHMdO8lxGcruJx2nfEw9VNUTljSP/cl7mixqL8M7CVJRcZyVV
	 TYec+j3IvZ4f40zlpVGEBkptEz8n4rwolYFMdo5v2vN1kZ9v328APBqzzJPP6HzqMxtcC
	 S/ichrGpCjOjr9msy6ReBAEIYGS4wFjCeXnVGjNPO5R1oD3cUJvLlkOeiK7qhDQPxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
	b=c2yPXkYJYyQWpP8mdHMfX+ioSeRn/CLZHN7bAp13uExyzoNoEDLfI+nhNmOvvYKU7AjG
	 Kpa1ZqQGedZjlUyx4bB4Gimpl8Xgt7jsGv6bvvbf1pT+pG37HVX/y7rXxgiwXUcJlVay0
	 VQDJelaHgYiWKrDSp2775fF8/6KaQeRihqJPEP+dRJxvP0R2nNPi9q8vUgdGPM5CE61Jf
	 TFkgsgwILuqtLdwd1Xzc4c7xAtFEwUxYlu8A+ugWDaUhUumEy9wrnvlfkQm+Xt3/GpszY
	 uBaK+wrGzlhTH2rEfVeZQ58zjoQZH8rP7xKMw69ZOsQXPPOLtxGIRjbHaG29a/iSCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpEBR6uh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChxsvmTu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE2606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpEBR6uh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChxsvmTu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7ot3w2820038
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZO6TWife+Q8t899ZyGzHRG
	ytN/7TFwYu3pw4vzN9A1c=; b=FpEBR6uhr1ZbVLPRmq7xnrmIpdpFGOMqY9SYuT
	tBqjH1IcTSVBctOkSUwp9YYfVF4bPB4KezfVucbaq3VrLi2Kh/oE0HGihmvj4xTv
	twhWpLfQIsvcBFt3ife0y7tv0PDXEexuwS1urR/HmCuAzLQuf9eBBjBHK4x1RLQN
	x1RPPauWoahoUePhl+1qgIIBJYXSrasyCil3FpHlBZ5E3aUn3cGhehs3Rks9q+IU
	pq0uM74MpZVPPfSirW3HCRyrEIHsvQ8uxAdZaLehG1CMnGTb06lOii1oUQM4E33X
	X5Ako7N3oWgbPNLKLqNHD0UKq+oPF3e6OYKXFCAlz/ex+D/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e181h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso2230029a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470582; x=1795075382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
        b=ChxsvmTuCMuGM0WSDME5N19QzcdN4i+5zDoqfPcl46JsBJ4K73ilH2c30exDY+dN4w
         NTDHnyvBv8PHO8JwCEqqDeHwcFVOn8+7JdQ5QqvHhp/mMMv0GhBN+X8hFQmCPxxCJlzI
         EmQzOZ1o1m/vYLF6fIsVHFFVtmVgpOkBmsVG7210A7KpFgjTUdxaNIMQuXRyZUrzwOvI
         5tQL0W3o6DBPLnOPJD5d8DWI0HxEu08cZDNA+qaPBjfUZLmTkUdE1C0ZUBenAZNqMe+9
         tJFBHd/fCKzr6kVDTeqlbPZIU/AA4Z/dI6wRnN64IrCrTwhAsUtEy0e1cUNA4Nx0hMGU
         K/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470582; x=1795075382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
        b=vvD4FrzDzFYT1opAZvkYyHLQfyB6CsvQr13Z+XQEnWCgTYw7BdbUEV1A7AnqPkyZ+/
         +7cht2MZ7fHn5BeiSipx4fMI2O61xCcAuF+S/CYv6sORnl02JExQ5hCKP7zt8NeFmzLA
         uQv1ZndwwJ5GeweW/9tL2b4fp92vNgpO0u6Yd6aFHyPy8MG+mB0nlSg3IC3A1PfwU861
         ccLHYFRl3APhaEWt6/cBehRW8Ah8+wiIErFlbPXlehGc823CZDuXgED7VNkLTvwh8ySM
         2vfMBYQoQuM+ZYVbazriF7duZr8qo4QOM3YkUhHA8DOFCtKTJium/24YUpvNAYxHRzll
         0X+g==
X-Forwarded-Encrypted: i=1; AL+hErEW04RqjntN3xSXyiSixmfKtF8AGe6Gp1MT/4b+WkqCogdW8G2WtGatRx0G84dOgU9G0ADjvdHHQll4CfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+arAmYTkxPTJts99GTKUzXxI3feDNShFAXG0ZXKwdufdsi2YlE
	TAJ/j//yVVWBf8gVpWsd5caVmUoek+YhY/S5tI7ZLQiN5Sn3Z2eKpBNPzj3npHOtAz516WNVoMX
	ZNRwZAMzlaK/E1WCYuJQpFA5NbEczcUwZCNDJelmlBwcGyGz9NE1A9iY56Yga/gPhqog=
X-Gm-Gg: AYBFou2oHlitxT3x2k6Bgyd55sv6fck8HjMZrk1melfmpAzqt/hko3iq6GSC6x0RdUd
	KmSuZjy7TGe7OPmcp+RS0fXxpYio5OAiyNIaibf4O9IO1UUUBrfG9zJKF+6fAaQTuS5lMiTH5vH
	j5876gp+3LM9yCFny7l7zF7vnV21NZIVSoYamBHkT/4Gu2gh324z2fvnsvTF19VuNJOK9+rgFn4
	rb0qw+yCwUlxyxAHSBmTufrTLcz9RHERc5M1wndwu89JIXv3HJCJOhlkxBg9YsTRlu3eAJoiCpz
	OQ5PUtlnmOpqwcFyXc8n/ZnujzBzyLRYCjxVDLh4SLTEdibsgOC2QyCzv3yoD4qXTgPTh/qOARo
	wG9VkLEvyzjQfjUG/U9+hNZXC0YL5iyrHEHPPKlK2QyI+mt6WevD2ChXvFStpI4jO1kr2Btipey
	CrEyXTZurx
X-Received: by 2002:a17:90b:1dce:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b182eebe5amr4168854a91.12.1794470581939;
        Thu, 12 Nov 2026 00:03:01 -0800 (PST)
X-Received: by 2002:a17:90b:1dce:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b182eebe5amr4168819a91.12.1794470581395;
        Thu, 12 Nov 2026 00:03:01 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:00 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Thu, 12 Nov 2026 13:32:49 +0530
Message-Id: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKly9WoC/3XMTQrCMBCG4atI1qY0kx+rK+8hLtLMVAPaaKJFK
 b27aUEoRTcD78D39CxR9JTYbtWzSJ1PPrQ51HrF3Nm2J+IeczMowYhSaN6GiDwF524cH7yuHSB
 UldOmZHlzi9T41+QdjrnPPj1CfE98J8bvVzILqRO85ERCWmq0xqreh5SK+9NeXLhei3zYCHYwR
 6olAhlRuBESpTC0xT+InCEAS0RmRFiztQq1cgp+IMMwfABRhr3IOwEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX7aWWYv7R0Rr4
 iriJHCUEweiffKtziPKsw48SX+hAQRI4HWXaglHdB+ipWpIWMYceOOpZ1vhG4KeOwusGdAj/zXJ
 1C0A7eYInB+DY2gPDmtnQhsUZ0rfv5v73Bs7AhKqNZ6U0qGPBj2xvDt8m/NT5n+zsR3mB6mDhnz
 CKs/nFEWhkpUz5fut3pcy651h52pmO4mPXNqs/0C/aL3dUUoKA4TEO/mDrri7cBVl9Zy7C49M4b
 Gp0qLh5nxsyyKYAlRfnBglRtQYQJOV1YxcTul/mVH1isQYsG3BvrYzxR21yKe+xx+h0vJN8f7sP
 GRtNMHDRtABzkFepG7aeFR2h0b5hwAjSLH7tgvCYe/WAD/Qaj+8fqVe+miE0ch+I2lCCP216eno
 NaAPeCDICZdZvPBOdgN4oD1YbtHA9HXk+7slxm1WPO0AywO3TzT3rlF7QL05ExUWncPaoZo19rG
 XyQaqD+a1qURDIFDE0Q==
X-Proofpoint-GUID: NDEvtlkZXFQAG4C0qDUzQ66Uxv0GiHE3
X-Proofpoint-ORIG-GUID: NDEvtlkZXFQAG4C0qDUzQ66Uxv0GiHE3
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af572b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fqOI0YBPAjHUksOb1HwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXyxr1ZlUeZEde
 4wmX9PSv7diyrYuY8vbZtz8WoOGysQs3i+0fWDh+o2IWztyltggjSU8EAasrzF5hKse92qFZ8qF
 TZP9useCZRe3S/bUYzNQI7nWiSEr4U0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

This series adds device tree support for SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v4:
- Removing the RFC tag.
- Dependency  "arm64: dts: qcom: nord: Add remoteproc and PMIC support" is merged.
- Got Reviewed-by from Shawn, Konrad and Abel.
- Link to v3: https://lore.kernel.org/r/20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com

Changes in v3:
- Rearranged remoteproc_soccp node in nord-rrd.dts alphabetically after remoteproc_cdsp3 node. (Shawn)
- Replaced nord-soccp-pas compatible from nord.dtsi to nord-embedded.dtsi to resolve binding check issues in nord-ride.dtb.(Shawn)
- Link to v2: https://lore.kernel.org/r/20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com

Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 10 +++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 56 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 074f9a67c7ec6287105641f0100797473deb843a
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

