Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782844E64E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920696; cv=none; b=hvRrhruPTB52lw0UgvgrPAvxbfeZTRn+DATR04p/X6v0monPsa7CmZ4P1Gx4E9d+qv1XzB1BZGRHXFEVNKkYZMVA0KCbnqf9auGw/z4aHkrO1JtWYWdIOElsAzXJ0kbmU6rrEUNXK1UOnBbRyoI7k/8VrQR1MA/pA9piXq+Ku+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920696; c=relaxed/simple;
	bh=Fw9JFrbWkU5UPBGhv7YWEEZRzQdgkL2hA40UBz8DY7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arPkBb9vQ35nPXCVE5F66ALI3eQYAfNrk7Wiisu8KrEwu+BCoLheDqB733nlTZoDX19tGvky1v423CRJHS+9vF4dphKYvzty4bp0zVvttICTQ2NZjZAqONInJZ31vCzna/nRbrQl5MYEGu0ZR9g2IQOk/xcFwsKyK6UZBDvT3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxqFc5HQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q21V2jig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxqFc5HQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q21V2jig"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Eke2725218
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=; b=lxqFc5HQrT0BBLhZ
	yAW97D6hF0bmnCyRhYWY6K5t/8rfWuKA43CXm1WEpnx2EOt2yHc0TcquIAbKqVS+
	umSOSYe3I4OnZcVq7yjM4utOjUcLd5Qf8PN4w5CcU/xfZCfgGYCEobBLycDbANZ7
	CPYocQQKpggNZ0HJrWE8aIK9OsdVtyo5+V9VCvMFLjn2eB4VTWqb7rEEDijUIA07
	uIb8DdCUsn0asU6cuhNNoiWe8CCXC5yzRygYvwj/BDzrfFxo+tW/Ezl46VsXrTL0
	7dDirgtMuPOJq+xskWSKpb7U8mvfqHoJ4Tk4BWqjuPF7RcTSpnsTczdSX1se07Sn
	QBjw9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0q1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ff14b1c02so5611221cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920681; x=1788525481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=;
        b=Q21V2jigiZrU/ME6nwgaolI7vK+xd+VJKWbLvj86RPtqbqSzGTsoPaDKi8D3rUtSSR
         cQxAqRMOkQvlFwJepFfliner8MGwB0nH7kyc1IYsw+jjETsAZB54rn8ZyGUTeRawkmsg
         cxC/XD5BJQQUJvnt2ua8c5gmSkv76E0GkWMwdjdrTkPcbi+CXgRcyzp01TastXAVjSNZ
         tNXj4GUlD/iD7Hvisstie+OIcGNOjTdPn2w3nTLTQnBKQV26KatAPA782eDTtLOI98WE
         BpWZE6PCdt/hMWznG5LK5eYhLm7zZEYauDusmZyOnt4Q9Qg6cR0DnjP9sgT3f+QricZF
         BNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920681; x=1788525481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=;
        b=Wgq/yV4GSnu2t9P56kt7rXHUNHQ4nxqPo1grjI9gmZU0PZpQeDiJ/Dhx+uxfX00kdc
         BIQKH6j8F7Pb3chV9mm6Dejz9ClEC53CtIseTxtF7SIExbqvMfrup9Q0kWB8HPuMQG1P
         RkR9imi7vTNzSNkWqHZo4T1c5Yz6dTvfIvoiUNSc2vTOj4pa0H7+RbMW38LOqM/NmFv3
         7ZfzDdf4X5jlu/idZjPp2+earhZRLnCFvFQa60QgxOElNivMHcLwU5F9+6VmtXqZqWaA
         Ix18RC1fpDNuz0y3Qweun0avN3unAOmE+mieXsi2RyG1KFQvflGHt3VX2Pyk3ub6WAsd
         nEzw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8Lson0PrqAj6ATgaqK122f9x2EV5RmEzgW18XgNNyRe+YlIzV93Mwc6q+FU2J7PmxVBqW4qkgafb41M=@vger.kernel.org
X-Gm-Message-State: AFuF++nyg3CXenSZkdnfiCQ/ZMEG519EQUWHq0DGmaz2jlSnRHgktBU7
	1tXBH3NTomMIcr8PHCpOg4ry9UgIrd0Is4prQPHyvQx3AyXQj3xbRF46w5RIGX4PftRfIjsirrb
	kdIxp/V2O5ajCjo3vCxjevpfC7LiW+YJndrRHigEftH0xN4AoBz5S+wZH0xr3vQ4dQXM=
X-Gm-Gg: AR+sD11GnD3yl2KYg9BjApQHRKwexNcc+uY6tZNn4M+xKzOplDfLxexdvWYQ8jXImE+
	mgN0rHgs/1afOrbdz6mOr+QKdEo2o2cW02QhdDCHBevMjdEkvxhczJOvV1ueSKeetY082QBJeH2
	Uo4pYSCp6IxbRvrpCBpg2RtqcNztugbLvK6/WuVLXQKCdk1BHACKo72EHqMqVha6T2TcLrx4jnV
	vBbn0pc9RpTInssarVCb1wItsXxWDpTdRAuB77TkJI3TIB1Vritf6V4RtDqPsk4WdthvxE1iYbW
	JeI4D0vfTucZn8j9vW0Kror6+fn8nF5kVtyn46718Yj/N3E2O1DDDYVbTDB+/8XmWFGReb4i2xM
	lAS0dPMQ=
X-Received: by 2002:a05:622a:1a82:b0:52f:aaa7:af7d with SMTP id d75a77b69052e-52fb9429a87mr71740931cf.15.1787920677536;
        Fri, 28 Aug 2026 05:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:52f:aaa7:af7d with SMTP id d75a77b69052e-52fb9429a87mr71739921cf.15.1787920676815;
        Fri, 28 Aug 2026 05:37:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:24 +0300
Subject: [PATCH 05/11] arm64: dts: qcom: eliza: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-5-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fw9JFrbWkU5UPBGhv7YWEEZRzQdgkL2hA40UBz8DY7E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEOa0GGzS2UQA+XHN9t8KTpN8DyflOMJ8R6z
 18T2wkA+OSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDgAKCRAbX0TJAJUV
 VudiD/9S+eliGJcIdBcOR1X9zZusDWQve6TOgMu9oDKZUrqe/2hJlhsVY4fLmlpwDPfTtQMw38X
 0oc6OYbeTnwJwTJRVS+RIrYL5BzFtxhGsqZPTZ4mEm4XSpw6O+D0vl1uKZx2W8A3m9r/R7nCfDb
 D+lWRJxXt8zEPYn3ACf/i+k6qsBRShrEuwfUK+/DS1bQ242m+n4FNRIu+44f5CXKnuq4UXWDR28
 wkRZQKAhiGBUGz7g3jF2YJYdJakzZYElcv9aVvSJZQeWWWxaLhpzZpq3MmsrUjplnCXWU+SFnxd
 dlIUPF4u3/ZXog0oHIXd13OvKDfii5BfRovEwZgbalMyAwz3h++KlJ37HfiwDyNmZGnQEpwa6hT
 tdonax47qtZrPgY0ZjBZPDl9XBAcbITKshoH4TUlgJ3zGJDLJ1aQT1gtFIMMh1d5Mhl1pS23/m6
 Z1UjJjjWJDibnFkMmKa9xEmSHi5p4tESvWVUGoHhb3MCCHEp0hXrhZ8Dg1/8iGPi+UlvDQx06RV
 9uUhN0hU8/hN6D946IUZ0GPkMBMVNv7Ql97bSrTLQ7BQo9Dk3xjPH+8kelrR/FvU/1CsMd+lnAT
 yGGunAdXDxUCAYeZy7n9hnYHuvMN3Y9sQVfdmc7likUyVTglqncN5vlFcnabIyLI0EwwyujkLEC
 Qf5nQi3O5dmTyuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: I-c1SyOUEVmuSSCNJG2PxlBBeu1qwF1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXwmjL3UFbNXaH
 jJdHldeJ1rZsC7Ebj7HDJpgCl/b+OheHCJuFUK2bmWTv5KY71LgqciQSVzs0GP0QkrwTOa0VWXh
 HfmcUuudrF5Uf5NHsUwn/ZEqIqHP0qwXvqn/COnJsIi0uFA972WqA+jadB8Z5T7IB6VGlImGxoa
 Y6FjjiS6JTMtMhIxIr3oPEVgYUuXla4I4/s5gfWMBnLiOfYkBoS8JmqJmPtKG+7i/jzAZ6g2FFR
 P9l/zw73esWuD42fsCVaYHAq8phACrlapS1ri1B6zb9v60wxA7GoFfsm6F/Boqu4S8WmF6ZQ509
 cldBxWiwQMksHBnxqnds1xvH8X51VzqC1qC78SJs6+fG15OAbPyJCFU1rkhFyO9oO7dvAqDLBKZ
 CKhqd63SeMxGWyGAnQlTmaJ7MDXDQ6ktSWapsp9KrBw5F91SO3hkxdRZB9HCiNPfx5+0uN3dWAJ
 6NPf5PVAb0oWHdyGSIQ==
X-Proofpoint-ORIG-GUID: I-c1SyOUEVmuSSCNJG2PxlBBeu1qwF1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX6XPu8382nRkz
 IwTHstq86wUSEQIcEEoZypY717GFY2sSrb5XdFDSwuHPEVmSux0FPP0AwqF4N5AK2hCMV5TmSlm
 Hye0+AUF/mFoiTvR0XaQwLbZ6qFeO9w=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a91812a cx=c_pps
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

Fixes: 90825ab392ac ("arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 868ae6c34830..4cba8fbbc1da 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -422,6 +422,10 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..52c4c28d1b7f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1926,6 +1926,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

