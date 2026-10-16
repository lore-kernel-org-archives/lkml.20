Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF43A8384
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129215; cv=none; b=HWMlP+cp9JTijvbliADvyVYBSsr7Fv3KjkZzB6VTQroYjHCpOqG4WvzcEnh2V1VKE5ZrKB8+E+OO6yxob9BpVXDlnsthSUjFepj3i6h8a+Y6XF/1UGzVdglQ27jsEDgKwcQHN/UILmwTDOgIgY+vhKgrvP+DyE1ln1RXeaD7mmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129215; c=relaxed/simple;
	bh=lOl+AgLFVl+ybK4WG9cbTQOJi/XJ1LFnK4djym4h9sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ll0WayKTmzSd1i39l/Z9QcVG+JwrFf1FpcJFrQtjq6CQvmgcllA+AyjJzc6z1rkN1C9iBZh1/+2pWBSJ0PJ3DmCZL64tKv6DUo+DNzv34zoMf9HmCGQNu0E8o7p8hTXiEcB+M2o0Ez2ts2mjxobqFB02NNarqJoEeI8KkLoEerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJnmiKso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSOgSJN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJnmiKso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSOgSJN3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNtgQ53493212
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=; b=LJnmiKso7wNLCH8g
	/4Wb8EhBNjd7pDOx8TCRvNYM1pAgUKC8NFHPEhRmsgk2SAjtjGg0fZC6MmTUWN7I
	Fr26Dto+Q1PdDMS2LxPXM0x9eR7MReRykFZ2AaNsoOS7JQ8U+pK76/tCBjJNS4Zm
	z2mmqxvaWCI5WtYm8rkVMTRfInid1DKztD38DihD4fE5nHZoNGQwjuc2Q8P+OfYK
	BdRz8BwMwv7KRgAEAfDi79WdUGu28Fd6zSzUeZON91m+FIrvA56XrskWLKy+M2LE
	YGi18tgLabG9Cw6d3e6fkPxlSB67qhbJ38liQJIlV1707gJAiv1/jO+Mt8XC35cl
	mXZ4dA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wtpnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2837308eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129211; x=1792734011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=HSOgSJN3ccJ2b7DssM4DtBKqCRBzm9tImIHanc1qHvCXmpsNDFtovrtAU8f3eQt2Hs
         MlEM0sWD2t7fenEgWU7ibrBlyuijT362CmchLnS7sEt3JNOjQRKqQAPBYHJP24WZ8t3F
         4KuNfUBfh95UgN8FdeKSFldrT12Ti9RTYVanTsYURODSjLkrwD3Yz7Wf/k0rzPPFOClt
         h8T+rVVAhjJsQQk8AWKu0mjqOAWHBCJzDoiPyR+zzsnahWkst1OVRo53aXDsd/q5U9Db
         ODCapS1KIfElSvfVmHO9C5B3r17WEx9owmq/FVgAMHbTr/4Kyiv9FCVCVvVm1oz0Hjoa
         Fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129211; x=1792734011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=w8aCmqpaxg0PCsHPF/zO0M5imZxmbfby9MoqSMTFaSe6ixqOBe7jk3Zy0TgiLgY8oH
         5ny5e4zglxAD8uqrD44cOFVC8gI1cD1mNze1GwApg1RlrijUOUS2ZYNFF6auhqjZyPp+
         s27SM8fXXed5QwHo1OdXwFIk7bfYIcEuanOJ7diwvAYmT9+qMT9ZDZWWhIHMLrwOh7AE
         S/sT/ashrObQML2NgzvafmxZ2ASBP+E6jscpZ090W0OshLjbyw2MHclR4RxrUSGpydKM
         nvMvdLt+xCDzhC7CPoZu8/SKoZahXfkHRGmYn3sFB6DZHE7b/qtdMRC+/BcIs/ake3fX
         3itw==
X-Forwarded-Encrypted: i=1; AKwUvBxabslycIUuBBv0bbeDqVR2Ewx8qkcP16widUhKeMTT9hSKXh5uzJWXbNuAmUuO9yW5U3d7aWXnOvYvlOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcSlHepfLPzRPs6uSg2ntAblmhSYRBQOoxM457AMF+MMKicDmp
	rt/VzI7ZHphqmOHl4HDOCwosgY9izNuuD2frdy7wC9VMm1UlTjj+qg7Lw2kaMnUEv0nua8BDAu1
	2BdFtkpO7gI1/BqWYUur7wTLOEjBdx9GXhxivkKDN25bojH4X+iQV7SeOhW++/oFUTBE=
X-Gm-Gg: AYBFou1uPRxCsmEH2r5U6QgUWMSd/I8Xz5pbbB5QI/TL2hjFXoNMZG+gPYq1t0YGPLI
	qsTPcQxS4GmbYS1H5ZHdTrxhDKLgy/CSg9qnL0uZF3k3rYV9UOgLasX/RMkbUQdP520q8ySQQP/
	dKdE0oqcQZpk6Il//kgtsM43g1ygvUbpIyG6ofBJzGMGttOP6X4egXlUZCSq9lt7p100tWTKx7Y
	tyuzLt45DTIXdq5w5iOEZ71qx6m+MD8vrjtFQL9om2NucIw6vtRgIacR713QI99xaRFm9P8ouvd
	KC9cAuf+Y+Re6LniudmWwaef+al432BflCvdK4SA4aTQipUID1vWpL7nEs7BzFhuvvkSiHvJs99
	o60eYsk7wXFeslwHN56J3tuYY4si+OTm2KNIi
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1891eec.26.1792129210899;
        Thu, 15 Oct 2026 22:40:10 -0700 (PDT)
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1856eec.26.1792129210348;
        Thu, 15 Oct 2026 22:40:10 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:09 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:55 +0530
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Fy37swlaWJQeR2NqWIuNYW3cHGagbTOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfXzkTnL/ZkyPXB
 tWoW5I9TspuTbKX4Q+5pKDR3iyby29J3SiLYCZr7OQtyLZ100rqR/VnHE9bfzOZBHgQ0JYnqPMi
 6j1VdHxXzocj4078IBGVLu+CEON1pSpoN7Ojgy05oITmnqSpQf5lb3oV6+dlSOBaHNf2pWTiuhy
 5uauxZznZRvU0iRq97v2ox8NnaSEqc/Q7wMh+3lmuTQ4BHna+A0/WraFDwvSwy9T5gXm6lsoW/O
 EFXt5OaS12ZAH7r/cpY3JOvAsiyoTWhd81nNtQ1aoLRqo/P2HQqBuaoPpGb5iw7v5fwr1Owt9Hi
 xTfbgY6hf7Pzq+ycEYTT1rtiiszQCBx/UHYOIQ09W4WW2dOV4MZv/SjkdyvwsAvMEovYXRInu/l
 pyWTqd8vtvovtLOdYsT6pqVgKFl02vKX5WKGdkQK7blyHuOSQ8Gcgy6W+fEKrIZoA5TwxoyofSs
 sUQL2BQfYt++SLtG/sA==
X-Proofpoint-GUID: Fy37swlaWJQeR2NqWIuNYW3cHGagbTOP
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1b8bb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hST0b9sF66eLrQ0HLjgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX1jsrSfIFs2rr
 FJPYF1Qav5/Y7Kghx4bXxxSLyLov5ueJeW7KnMjeCgPt1EsfRXPH5i/+k5QEUd5E1R9bvKIjT6s
 9uAiSLFw6J2pU4x9PlmQ1bQdQP9aw5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9db94c3b0c91 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,12 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp{
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0

