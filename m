Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676C456DE5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920702; cv=none; b=hVaTsccR6HakluN2jCVdm7ODu0WQZ4lVAM84ydQX/ikWDJPOHmxE10v3d8/h1tyrlIUT7Ri1eaxTexCXqQg51lbLwHalVYppWLaMQ03ZDVKOcGfUl2dqAFKJTwdTGwQeI9Yi13OH5f1L14zJfqClxndLvkY8pWUh7cUjpInjuV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920702; c=relaxed/simple;
	bh=jag7TnyI1q4HDlWokwWFeDta7drw8fsrAdCfZdrce6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bByw+S2gTIjXXoXeKlS9Un31OkAcemfoUES0ir66kZMyChWLeFrO9J/9gUvKFSJwkAvWSlnGZkHgnNSNPUmK5H+LHsKZteD6GSXf+W47oUh7/ZI5cl2ubcIVMScxYKtH4wtRx1gWC9IofXQzeIJYxLT6IiWQe+UPhpNatuh6xoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYwt7hrz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaWXCSQk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYwt7hrz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaWXCSQk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7KlN2725293
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=; b=aYwt7hrzoWnnkyMo
	AbYPVEqPE/koNxFyxpZoBgeLduiMfPfsVMN+zOBkU9GNl0eX/N9bEzlu4WRM9wKM
	VSjFZiljGpvbjnwEG2Sb3PFIIVEjvgyCjouOlc35IkQ09NBrpHK0TjCpKjkFSbBV
	L8NwtJ7of0w+yk7lzAuLWpJu9aK65Etn2JpCvx8QH8nbM4XftcLajJSoDUhAyz6M
	NXkTPRYEUvao9rnPcrs4VIpnxuxiVwO+Rv+Fy5ejvEUOfH6qmQugSX96XhWNRoxx
	yZSM8GgqI0/7H5ZyptAJhxGkscstNJjJDvW8jevaAjgb0FWFL5hnNoYIGAqgwKE+
	4Z7KFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0q25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f9e903b02so18618021cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920693; x=1788525493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=;
        b=MaWXCSQkbcDBDgH/2FOE/qpKcN+SxiphE93CPB3uUVZ5DFaVOiarEZblsu4KNMBh6c
         O2xqGmsEYLhSJGU5YnX+FjqTK15sL+OTzalrzRkoWjYKndb7M/NW+Xb3sul4ljfBuP5q
         l9rysxkcTghqJhAU2m8IBhYI9kODslmV1aGoH0wtwK+Mukb5sVdy8rOkmGIxIVtgIg/m
         sJroAFLGDH9mU92GxUx0iANb7zM8pBUfXfBK+3BjLof38ylkaZYI5f6YbD1QAImjmUQ6
         sV0kx3+p9y3ts02vjaOt+khwSebbOaIyI0yCnuYJ0TbKdZEGOh21Csvre5UpMD8ljG0i
         Yq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920693; x=1788525493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=;
        b=bVbe34mLJml4PMvjgNS62xvv/SOsYtSRg/K1S9Checr7y12QuF7HIxO0QJyCedN+Lz
         K7hraUcMlPa8HwGoj2ccXKpE06oHN5RXLgAhGqYRhgmra7afVexzHrw+gnjaPQlfr1hu
         OZIuEbPMZrnspiL/mwvlUL3QgGwqALOkCS0p0URWLlXDImVWvgPQDc4Jse7E9AkF+4Q1
         GL35x7f3AGAhHuaZiwjx/FJpvoAizmUVFy9EtgMTzWcUA7CEE5pRoyAZmnen4r1PTF5h
         J+67QKJNhFRBA9F6yYyJRd4RT/pxMSzcr0mwxD4uUE0oKCREGCbbHQPyuwtihLyeSupN
         qjSA==
X-Forwarded-Encrypted: i=1; AHgh+RqHv9+JtJ3gtNgv6jEWI2H5ghW+LoskdL+KgENnsLSD/HbhRu2cR2fCITgQIqodni1ketlJpLtDmal5hr4=@vger.kernel.org
X-Gm-Message-State: AFuF++kSF7yEob+YGI0kGMZyWKa2F4Xo0MWrlEx25z9tQG+jbVxEYDPI
	BjQ/YxvrMimGCuuHN+IeB/gILgfq6fVEmtYNIgqCSIPzDVI9KZTF+lspVt1yqMi5hKddxxaKmzA
	5TJzA/92O0vM84LMxeIUgMDzazl0/zJ9B4gZr9C74OhzUwF1GZ5f9k3b62ZcxSaIBs2c=
X-Gm-Gg: AR+sD12VIehlWTfEYT07QTIsRNFXXT7+NDpudp+maHd5pzBZBd9OEfOuIETVNl7qjyE
	8pDaUbLjA4OGu56W0jaudb5zqNyjofiAn3TBx/JXLyDg5t5HcROvz0mU0OpCo2ZvbZ6twy818+x
	udli45vI4IOBaSOh87CtTxJl/kJU5sfYhGgmrHOvTb5w0aIRxqJexjh0jtNe03umbjJbcgYrn2G
	Vu24wKkMIwBXH4kK/giTsBZeFA014tm+uYvglFvW/9vhfGHbDuP4u1FNum8Jm32DyKKzhRakEKk
	LZTkhDg6ltN2SI2ZT10LFjSDofO9viqK6tE4GH6s8IFiJOG7gx80L2BKE1XUcBsWzrwSvptHkNq
	WwgyqR18=
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr155172591cf.6.1787920689535;
        Fri, 28 Aug 2026 05:38:09 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr155166641cf.6.1787920684349;
        Fri, 28 Aug 2026 05:38:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:27 +0300
Subject: [PATCH 08/11] arm64: dts: qcom: milos: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-8-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jag7TnyI1q4HDlWokwWFeDta7drw8fsrAdCfZdrce6M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYERfgHCrAdpRiyFjfOONoU/2VWqLOeu6lzOH
 uANFTO6vG2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEQAKCRAbX0TJAJUV
 VinvEADERDVJ7oQAlXBPxTLH5jre9uXpeC1qHNOWa+xSKLW3Z2Q6fNZa1tZYBzngrzczs15UO+b
 jdBRvDpfBbBjKbw4sP1nrjtqpNLcmAAk8Id9QpLRl0lQqVD8PYu0lhK5yYbPF9IeyqCUEw9AE/v
 ASH6Dqnd8VqfSXYMNdJ728npUDIP6DdvnGztPHO0IlodUYBAT+5igACI/Zc5g3G3tYdKOzrZQvA
 s2N2kcpVpf7rw+Bqn2TXAzruvD+Te6X309bc0X3EsO2BLyKqCTyTnllYnDm5HmOtFsv44/lQdG/
 GAFMhtdiqWZDqDbDyUUuBpJp4etLS4M5INq/A3EIidhYCnzY1xuIKkN+4j37NWztbociNWExNBf
 alpSDoQ/HD6fnid3y5ZYHwyIpdQJmitIWkcufRSN54phv54MmSMnZxRF+plcd8Rd3pfMjrUJseU
 HPgmoarhvGAJ0vj3pn0jDfElDX9pKAPDQnKnGdNVT/m8zGTFZX4I6OzWHUyqEHwMX4IE12Rlw33
 dGdd/joTRwQEF3d2pAsUgrul6u59nWnxNIRWYc9uIzoup9JHtV3a1xkx++shPooAq6EcGUIxB/o
 c4S6mdkp59hI58lXP/2lA4ws7haUNrpKisizkDw33IM855OcBYlpW6nA/WU2zZRu8+zkHyGqKQc
 DNOZUPtIEu6JKrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: SdTRXL57IasDF_wHGQ1PTsLXriDpIInz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX4KyF1K5o2G0+
 MtH6XKXRn2oV2wSHI2PO3CJQXFEwFTmRdOstnM9C2iPmj2JHDDkt1AvZdYJxsmV/YzmY7GIgyQt
 q1GaGewi7ZaJBA4X1oqL4XRYVlTYtzwme3YGEg6USn+9R13kZJThs3yrd2Ky+UoirMHNmXDNml3
 28nGFFE7WkY53/D4LCDRTFCn8lekwQd/iYv1ylYAyaMHyuAUJktN/N45kAKQuORr965ZwXTQ+GF
 CexVglTUBoRk6jyBiQ35xdAXeKb7Lz8MTHkeGs1tuPQYL51u05zKnBcme4tBjc/ASQBE0Bno9OJ
 iUAKchILymRWiDlTeh6pu3UXHhO/X5Ic4Zi3JBAul+z2pP+s22ZceUMpM0lIlJSziqbqTAVJF7t
 EOwWdOKSDZ/ItAs/m6mVKMW51Pp1J4EdBKBgpGu2iQRncLWkpKoi1A1stkSElPuwNUyp3W2b5l4
 7jXl6Wo/dtNqRw5kP8g==
X-Proofpoint-ORIG-GUID: SdTRXL57IasDF_wHGQ1PTsLXriDpIInz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX8uPVGbjuxr+F
 wJ73itsUYe6PPtJ/lW7JRpYY1300K622dim99EEFJO9W2u7OcyFdrAox87+MeDVht3UZPjHDvWR
 60Q9GMLHA3mRHImnLFXNfwNoDt0dgDo=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a918135 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: b7c9047f851e ("arm64: dts: qcom: milos: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index bb3b67e2fd01..dbda9dddcee7 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -700,6 +700,10 @@ vibrator@5a {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..b910990e2220 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1281,6 +1281,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

