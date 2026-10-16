Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A802D9EDC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129206; cv=none; b=h3YJ4jNbglVbWnQ+fDUt0yPqQQ515l9NSd+RdTcONd0L9rpuAOrqKES/0BGeqMVtSuQgbBOmRKHxIzMz8RaW6TuZ4yfeLzUafEzbaztuK/heLusn/Vc3TYmSv38GIXumoaIelvOnLWXKlyzzZrfGaM7J79N2Phn5t1kZaK18XDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129206; c=relaxed/simple;
	bh=prgi9uIT3cI074Yv3YoKapZT691AWKMKmIDHgwpgfTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tJsrjXLGKlVFVn3ev0Cc3DD0cKlake9YuCc6hNN3LbOtmVC0sx+oi5dnr5MCJUfU3lTIgsoADuUo2zA7a2QgO9WZNjAP1DxiDhDKgB8urc8yZAq8oPa17L6/pA5mH/7QHYTir0XHwYih74PRiDqvvu+vPB5QN6hSxdq3Rb9UQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVd/9vnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW1wSIi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVd/9vnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OW1wSIi+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2047X3202312
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jd/4RTHbYphJrMILDTACZX
	dVGSib89rNuWM42n/FXB0=; b=mVd/9vnJRu+t+rQ+gInLHU1ItJDUSZ57VdGzYn
	geM7b06d7gOjsMd+mlJknKNlUm69Kc8B0Aol/5ACEYNqcgeqazFQt0QJovCzhFLj
	aPvwp0r7aCV/aKQzMIkorcToEyP6eqDjrCHA6ve3JegVIvQcAHm6tweTUpH3d+ui
	EfgN0WDrb1AJonh1G6iGP7o6xz4fSScjyZ4WbNHUL/PC8GySE5wxdFNMDzJdsD1L
	IDcqeGE8QXPtMcLwiXknLBcnM1x/xOXQG4spWeCZiSd+dZ/bzp287dhafCwAH0OF
	P9bSye7juaSRkENnN4dlKmvb8ORFN+RXQa/hhsBZgPbagrtA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3a7uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so12335244eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129203; x=1792734003; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jd/4RTHbYphJrMILDTACZXdVGSib89rNuWM42n/FXB0=;
        b=OW1wSIi+rHnnpZ/l/mEvKkmvihxiGbGYTP8cvvpJhbupKQlHLm9xMd6lp9yYDJ1aI4
         waVP9vMayPLwz+2N4Ad2qpbLtoD9vYPwDzw210uniXmZ8keZa3uv8tl5N3KrjrWm4Hmb
         VRD0soEx6C25HcioeF9dCkiJomJmHd8uj2lwbjLm/aTWsOjmrH2OWs3yGVK88aDawQ+L
         hrPaQuuH5gD9TbuYmszw1YiFYBwjBS2cPpOTbVYyKKGPPTxQKseI9DpoK1Z485WC9tkP
         vHj7+VYnZs4SHkuKCnvqvMlLRf9AcDYKRhxiLLotDCHrEmlufeSx72gNHY5lXdq/zVQT
         4uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129203; x=1792734003;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jd/4RTHbYphJrMILDTACZXdVGSib89rNuWM42n/FXB0=;
        b=F/EL8QSi1CWOt9OGVXBuJRgDI25Xo1MFcCV6sxveRnyPaHMi30rcOWFRgd89MHoA1a
         turu3lR7Izb9qIzUr5SgW4Ajq0xWX0LIzt/pHc2liyd6Iug4pLn1n1isIrXfk/bcxlPG
         JBztK7xVuQDs9fIk0BPKsHu68k8iWVyg6xgDzOoFoXz8o8NlZj17Oe+YU1wGubgft+Fc
         zjWNHdbVGfqMtuxJL6yA74Erv2mCi5XAv2SC67vtqSDS/wGQkHwQelub+EnmWvswxJc8
         lLTXb5cYM9xmJ4+5WDvFytS062yJWa77kX14G1hUtqoapjzpNCzjhqoLItAVPbFyfHiS
         bG4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwN3zaHQuP2uHP/YC6Rm0BkwPXWp8Oh5DyUXehIdvQGek2bmI/z6HUQDMoShNET6UR2vXE3RBkwRjJ0U7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzDzgzkiF8zZrcbcm2IFQgsBXpnGD1Jdati5O49iC+uJbF+TaT
	Wujj/OTXw93C5qRnVCZhQSXILTQDHcUUQa24crRmdqZ0Fyi0FaVTxwYXOLOYiZWwxGUDYh4gyYT
	pfR8tks7YK8tXdsBtAcK144kKYfHb63ufFRsZnBXEUvE0AluwcM9oaYDMB0z7h8Fak54=
X-Gm-Gg: AYBFou1c3+XFSc6FOBNZGrSMU61xhT++bxEbIzJLdhrDmZOcNnC/8PgSo609Z0mDTWn
	cUaje6pTKCgwjp7CcJ8sK2jyZpUsx2xubnEvrTa4RkZCv4NGb2aF4qZzTl/td52V2mOA/lZ83Wn
	1G77FYAI9EkZ1D5nh/EjUCdz84aWmbjnU0ebWfMmodfOK8D700GVoSdYr2c2vnxB7cfwjY5Kjiu
	wvgmzy3ZHfktC+ZDNGjKGF61pz4RpWEuA0FIc9VQwnU8qtHaq9PclUWsiQFfwOMm/5aiRnzjANw
	jcYXEAIl2LBD1+IiMXUPb7rdOQlcTM8dEa/Qw7O/38UkO0/qkKUcWtCJjRCluAS2+qZZtkTT2Ov
	fgsALfKPQjrTrA/HwAvp4/ZaiLYJrdrSIDKNj
X-Received: by 2002:a05:7300:3398:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-35cef186bbdmr12882153eec.2.1792129203015;
        Thu, 15 Oct 2026 22:40:03 -0700 (PDT)
X-Received: by 2002:a05:7300:3398:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-35cef186bbdmr12882121eec.2.1792129202394;
        Thu, 15 Oct 2026 22:40:02 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Fri, 16 Oct 2026 11:09:53 +0530
Message-Id: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKm40WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3bz8ohTd4vzk5ALdlBLdpKRkoxQjC4tkUzMDJaCegqLUtMwKsHn
 RSkFuzkqxtbUAQSYwGWQAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX6LKNymzgiDG8
 6a+oHYSVkchdYi5MewUw7zHEX8g+8Z/gQRSGYMh8ZT/rC31VrGHoUGN7gC6v/tGn0ezxfz6z7ag
 F2s0RxEM8g+8PPYPKMERQtSADX/ns1Rctpp0+NYrcNv6Gfuh2AHX5YMczpx3z1OHyOcsC5jhtty
 XRz2RjJaCCd3e9IFziO1BMZftFNUCFQ3/BqogB3u5uS8NynVLPbqqKFxDgCrWQmHEt4pPvGKC1I
 UjBqoaAMhvbMFrZZ3zbBjq4JQ5RNU2cOzbhml/styBwK1RT8FyVQvDh7EvbHyDfL+TMww6Awdr7
 zpa5B7bfyUx1jGz6hKt/8HXOiduQxtRq6G5TwiEvxb+ImSFgnSz63kMOgwUUivEHvQJE/mVeIPG
 /Nx9/L5MErhN1opm7R0hFUyWJVirIpk0SXgz9PjzMBFPl1575uxgRGZuAtcnSjlsJmx95IFJawY
 o3hisl1jhtI6lT+R5ag==
X-Proofpoint-GUID: m6WEKT8FQp10TlpsiEVrh79Z6MvepytM
X-Proofpoint-ORIG-GUID: m6WEKT8FQp10TlpsiEVrh79Z6MvepytM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX7x+CFd0XwvMF
 cyzlJlYanKTYO86pFTxPl/Osptqs+GLj+svJZbuz4Z80Pib3y8v+FvJ7lUUhUaZC7t8HcuznIuv
 hJKLWokHFRTq3QlgpEGOmXLzYCZ9zK4=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1b8b3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DBOEi4bJulm4djh3SG0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

This series adds device tree support for  SoCCP
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
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Enable SoCCP on RRD board
      arm64: dts: qcom: nord: Enable SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     |   9 ++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |   6 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |   6 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 126 ++++++++++++++++++++++++
 4 files changed, 147 insertions(+)
---
base-commit: bf2089c6d55a812b133ba2dabe59413746c2328d
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

