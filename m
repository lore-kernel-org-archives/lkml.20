Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9BE44E66A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920704; cv=none; b=MK/LnCp1URJ1cE3GO5Co+2ROwVvv5RD3gcW3Bdan7w4vSh5OosAIP74aPH3NlawJdvmt/ZhXlpYrfb3rPJ5L64bJ0BZ4fkG0ygam8HZR6CY/evcnAfarCW+7ACHqNF3OgMKxhhQzcNl19eetFGwmEUeqBINCSOirq/Yl7V0s+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920704; c=relaxed/simple;
	bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9mUlKQQJYw143O00fZB+R2F5/Mq+z7Zi6ARB04/h1BKryC02lC9UL1lpHV/uxI/gpXCkiKjQJ9LueFHWZcAV5g6bek6Gc1p6j03mOL/fG/1OuV2d09iiAV7aY4ZHqecVtInLkWS3/dhECG0f1RqK/tAAl9dt8MV93eP6pMuxwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6TYltrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCQIkblv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6TYltrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCQIkblv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Nrd2167694
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=; b=Q6TYltrnIngsXK00
	Ph9u8KlcyQh79V3LBVSaA6+y4ql2lb8NrlCrzK276KXKDXt0mEpFE9QcwbHdODNg
	z/tWYl5bhbU3e4EGjt3rHNuVCdMGamkNDg8R1lkVta9Qlf5HyKaDOZtZGarHcZ0t
	tacYlppaV5s87x2RptD7GIwuC3MIwwizoeYnSNn4HvQR2BgtxnUNB1ykppbtUJSg
	hrlSvAbKmAUDV2LXEiHkWwcDOcz1ozQDvARPMEV2dtW3gDunsLeqN0BYsiUtxiX7
	eC4IMV2cjVGDGsxu28JXXELof77gxhMz7VWNsQmYS0Raw2YKaShFvzk9s4uCsW2r
	Qt6vEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0109e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc0097865so15251461cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920697; x=1788525497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=gCQIkblvM/OWn1oM8zHpdqlOyUrxawY5YeISenU0qinq5arLRQuXi/kVI32OpnOuj3
         yU7FIgvlEWhlNJBxm3OBrcR//WDhMQF4Y146U34kDpZ0ju17o3auaFSHQRzPb9MLWWSO
         2lImYHCwZTapPQhCmB/4WCMtG98SjI0tAmL9SHa/5SKJjrGwfQgWVAv3UGBJSEBCTxS2
         kIBT/2ocKpFqwbagPzXgACS6IrJKkTyrN07nLxOwkDBQIGtBPutnKjrR4423ybgG+L+6
         oR4c6C1evNsw3CN/XD7Lf/1FfRtDr2njtg5CBdtZhcXX9pQvJW141lGfbEq2/5lVBJJ1
         my9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920697; x=1788525497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=EPUiG0HOsaqmnwk2jO71pqlMB+gjChcKAtNf2zup1Y7UQ4Cr9hSxFkWuWmNiLRcBmb
         BEB45HYEt2fZzx+4fdhG9t8jcnG4lvd+y5O3kzxj9+bfJW7jVGwL2IHo/pz5v62fjfZ9
         uyqM5hxTtEc96U5Nb0ASLuiM28YSpPND9mwHadMBWW1QraJ5luRHtcGShf6ySAEA2O+V
         kOR/+IgJr+jaqsok5ivZQOJz1a1y11dUEmorMFkedOX8nVEpkJmLr4pzg4oIXOyOQt9s
         rfv0i+g9PnAzbHSBhGaCUy/QKCJuxOs6CyYLQ9LR2oCbhDlm5zxeLq5lmfaggRoRHW9K
         UlSw==
X-Forwarded-Encrypted: i=1; AHgh+RpKuaPzUe54RNHXFXqU+peF8z098ZNnzLRN8BQZvgmifMnQgnf6215WaEAjAEzqxeOnCavCVqW4NGf4hrw=@vger.kernel.org
X-Gm-Message-State: AFuF++n8BI1SGosiyHWQAdm72lEaYHE3j+84nMVsYOuTbC9DJ4Uk9b9n
	swkKdH3ad/LKYEuu5+PKTGV+c+pVJcXgXl371nPoUCdWX71u0iEFu1p99sCyTcrEPSiUCZxTgew
	5KF+GLeCCedJFqDb/CaBkFtZwkaISIEqa1PRM8MsDLPz5lqB9xBPBYLYUH1IyvtkY1sI=
X-Gm-Gg: AR+sD11MeKWokmYn+ch3CNxDYUXtVrPTL4XyPxmFY1Twg6rXuXCpEny60L9qEuqrZ4t
	N+EeIvPvtGyRAQU0mppgLuS00nwAwR00h+8gY84wa+LCJtOFGsCA1pn8sXpL7UIFQtauv5lzN9/
	lUJCAY66/2Vk2U9VdXTBmMhFQDYdpOHTIZxcBmBWkHO3LPGY4y2RsdXGe/ecB5bOh19DsJk4XfO
	3phig9YoXxNuAZe63/ivbSV6/2mGnlZK9EShs0HzW56Iy1d+J++i010JG3LvUiHr2bft3lAtsGo
	mKvfmpjkj/nANfUuyZziTMJuHGajwcAoeyg474hL2hbk3jvfuvRx++jDPonnnTdhXGdUQY0oIg2
	T6D5tIbg=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33286361cf.23.1787920697100;
        Fri, 28 Aug 2026 05:38:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33281691cf.23.1787920691863;
        Fri, 28 Aug 2026 05:38:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:30 +0300
Subject: [PATCH 11/11] arm64: dts: qcom: sc7180: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-11-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEUffgxq9Sb1/B9R1By2e8YlbTxrnOECOgug
 G2mBQldXBaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBFAAKCRAbX0TJAJUV
 VmJbD/4iI/2xFABG3CvUSDkl7lktJjB9Wf5MbNhiTZTlLSOScRqfnZYRwWXd1rnGUA5Q0HNrbFQ
 Q7xcJfuvz4rqk3Q2KVoHamzph9AqWjfflJM8OJ/I7Ufp/3W6fjfIzhpfMa3pDXg+3jEuiqcw2ck
 yxupgVUUtu9yF0+9TrbGuCO9BstrwbCEzgaKuM5b5yAtgyIGcIomVBuiMkzCUhJXvRUNzAi54nb
 jOVtN4M8482VyjHdoJdfkyzP5k+6YNsIVkKXj9VZlmgteStLz9Td1GdVOfd4b3kXQC11qJf6qRV
 BcqWLBXVAtoK1RGZzFx3JNvnOV0FV2nnGMgLKIdQaw7oD7NiObcRF+5agKVZMw0+y45bQqyPJr5
 mlmI7HbvUhA775KZEZS5k0a7PbYbR6xc6SwFJpW+5aF9GlzzB5gscNVWDpizUqra/mCupOzXqwB
 cPBUh1mY12Fm8b5NsOZNHtMm839MW6mJQIRpVWyZPURFBLWT18grlCUhiIYRdqvO3P2VtlzcuCp
 HFIyc8vXjr/CtjK4A4vqjLBOfh+k7lTNc7MjIilEUEq6UyNQV4hGTmxJsS8fUhz98X+DyN1GVa/
 qpEC84zfgmaZB66FhmNMs0CdklLZkhtm68EX2jSCXq5T+eEyScc4H1WCye1TnwD9SXlfPtKICbx
 fqdd8qsUI65X59Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 3FeXE2DTtsfJwNLDVL3r81kMEp4glyYd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXyOPCz8NCykle
 t5R60POI2amP8uuuOYT3TrY4Sv/r3Xb9mzKFuoZgZc3GNBQjI0T1xd4jTUHj8wngw9STutgSLHk
 PhSEtpPbCLcbrSN8rlufBr92Dpwzn8Q=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91813a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3FeXE2DTtsfJwNLDVL3r81kMEp4glyYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX91f1zdwlGZbI
 4ma7jXTQxLRQk24vMzD8o/r9dYEzGgseiBcn9IczSa4eT5+z9wGJEwyG/doRUBw/Z7uGd69gu2o
 oMSKi1cjK3pFB8QmQYwvxt/TIDcvhZdPe1+uKZbRY+PzatX8dMy5iI0uB13jYpT5gBibaOwTnuz
 iT29WcgAhM+DZkl0om5ZLv75v36JvqdkMn2FtRFOWziw17RspYTU7mXospPpQUqeOVt4L1vNV4K
 FcHXSWB/kiFrtWWR3h0TP4axQH26SONcuzmI27KZgRMkoIMncQhBdLXGKinSk6Tx5PK1AuZ3iTq
 LbuHTvWnB1iQ0jQvd7903Zg4EsyWBBLvFKHY2m/+rnH7eJf4kj4PmJNIzrT1kYCWzprC3U7kJXE
 o8HI/0Zgq3As5ff8KjS+sz3WrhxpxM6r3hDr+AYjJJ1icoRzV7r2UPJAQeDG2aa4nSMUt+BZYCR
 VdRMWwKGHY0k5F2zx1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 7cd7271ac525 ("arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 ++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 70fbfb31d4a4..9aabecdc57cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1611,6 +1611,8 @@ ice: crypto@1d90000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
index b9cff60efe6f..cb419a44ea4d 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
@@ -333,6 +333,10 @@ &dispcc {
 	status = "disabled";
 };
 
+&ice {
+	status = "okay";
+};
+
 &pm6150_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.54.0

