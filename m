Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2744397E9A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369236; cv=none; b=jGzwoQ0UKFJ2k1V+I3h2hNQnrHahUtnRcjp10/DlOXtyiUM+pwxgotYGBjs/PWqcuPMmOUS3+zXO6dNg1k2WB07D6U6R5gnF8NdJdZ+la/bdaIS4IRyZx67MDCrUfhOdrhoprZBX+Q+x2YgEVsxheXpKIDiNAyslAjONg0rvxTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369236; c=relaxed/simple;
	bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYZ3qCo3nLo5FodHrJG8Ag+aw4Lop8HaB8gPmGQkpUKuhtmQRsv4M/TR/6St0/paP6AybQq3rSAwZAXQAmnuiIY/U1RcGHnpNzb+xnTh3lqiZNxZdJAGEVa+KVWUVak61y9Vm4Bvy3QA8aq/JzuR4DWyGjV51JzLC4+fLEV/6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOJAJfwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMhlfU8A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOJAJfwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMhlfU8A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0OT3369463
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=; b=SOJAJfwIqF1liTOh
	QcrLc8dDTCnHrG6jnWIQ3FbP8+VoDB6Jlg9ETnzGwXD4gGytD6HPlg0XIXlrkTde
	3wSerAv9Q6RLfDr+FAKcVme/o/+U7DXxLPBubmTk2/AGYD7ZcNDTZmLKFeRTu9jM
	ThCjaKpWsvTUG2r0YfdpP4CLFSe6OX1uoxZ+JNFK+fV45SLtcpR2fmpi+9N/Rzbi
	8eGWSiZyQYNaiLNCbWJ65F8wOxn+ucjtniKNpKijUIswJUTYc7gTMboz5J6qvQii
	SFFzOAymJwDDn79ImpytZlnTkvZY4+anViWsgYftbp509eLTq0gUigUaQYQpaVDj
	DfYzQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5e8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4259580a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369223; x=1789974023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=WMhlfU8Aj/Dqji/md0eycN8IXrXfaP71Yw71M7Z6/syMJoBzCO5NpERPEr+si30Xed
         wdbVXU3xDgOfNT8gE/Yd55hL/2KF2nYrt0vFItPP6aJ4kQ8pItBBUuvkWwufY3tla4lw
         YOJpR9MfrZ258X284sXUp7VSHfYTSOSgIglLpYQakjZfZkIZ0K1b3RbYg6EkyCVZfk3h
         gs2DYWNb+NAxYFak+9UQqBwCZ0cOBlIG5F313/3lqKKokP8976FyLyyMJ7+gq2RfD2Cz
         AtFgHgPipJ8zxA7pVpblcinJNDIznjrOJBdINcWGX0C9c3WBEJXQh3PgWo05uDYengdF
         JrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369223; x=1789974023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=Pejp/b4fr+7WImnDb8w0TOTQeA9rssu/nel52jxE2NXsJIYNJZFO3PGKcrc2SuPSAk
         xKxIn3gfbdYaWBrm90/IeAjg85e//5qKoiTkCaiaByqVTwQxGnGFWjQR6ZugG9SrK2aQ
         j/LlMBQkcOaBmRuIQojwm0Bcy2+uQ3UoRyj2W+73/4QaHUHgx7yrFyELi2mnxRBw46e3
         q14kp2WnMYD7xn5owHc30NamE2fqh/1LpZk23hsgidRAtwkUfjCt/8GA83caV12izG3B
         j99/HZvScSDP0kZ797KnfZYdva1iJsZr9Bbs787s9wwhooT9qqJEADtla+CxLHl6NzJN
         hOcw==
X-Forwarded-Encrypted: i=1; AKwUvBwsUOOttSRQK+XM0xz9LwBvyFfKwqra9pITkL0QixQDkh5NDOYjE2WivSnVPy1+iqB5MSby6Hzs7g8y8zc=@vger.kernel.org
X-Gm-Message-State: AFuF++nyrqCDIUvh3WyA4bMCH0PKSjdq/dqkNDPp6jEQhIZtowcGHpfg
	H09x1iV51FPWThfy7ikVsi8aIOcVLAAKzi/zJChpf3cHNDOmahl0kB2/mYkL2cqSeyUBGkfUlBb
	3ue0cnolRd7g3aPia4EC47ac5FWR8A5CJ58wknkED+3f/y+QDkswx1gOBE6LMUiSTh5E=
X-Gm-Gg: AYBFou1PqZavkZDxai6F25Q62bzfHRYJW8t276Rqb4vHEHJLNe02MCLWzacXZrgIz3r
	UdtiJCkusrulBqRGbBCiBOq1wmWYa/twSkOmciUQixfQBko6hfJasYYPMEZu9fR3A9ND2Auis+x
	C5EYgdLathYDtqPIbOwxd8lJ+I1Tj1lQ8mK04sJcbYsHCcnSlZf5gU/iBarShpvGoztu2KoceS3
	llTat9ePRvUi5HqkY9jwwekqaabdAgACwUnazNcw4KWNJSle7tgtBQXW4GiaJD20Hsj1t6Ujo3l
	qE2P9mx5L6oibli3dl2RttGzds7b4HaG9c0KLPMomx0iPk39ch3vVtjTcA1ZYUWSVvBZnD8wbP7
	iNGi2lhuG8lCGW9Pfadc26r+vYCc+
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466224a91.21.1789369223026;
        Mon, 14 Sep 2026 00:00:23 -0700 (PDT)
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466001a91.21.1789369220525;
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:39 +0530
Subject: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1702;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
 b=6Hq5HgVrykHDYtu6kyFVxi+R7Gm/imP9XY00D2BUv0d154Bf4k/hxduwO7s5/Jx6824WDakXN
 nvPk/90WtPMCPwz/RDuj4eH2tiRVpE7/w3Y6ePA6jQe6hhbxYUmXd28
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79b87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX2Hj4mhiAkOw2
 IlCxbZhOLCf7lBS4o4rw4Vnpj5Y6MjgUYNxcyjMqOdalyxtMbNS9p/USYQ0XgVNax3DZQuDO7lj
 4d7/QQgNJC9zV4nBc3uzCuG3h2BW1e2Dm3Qpn9aMrg9+jGpW1oLuPMmnvPCFDZJtnfrhs3OFmDy
 ZmOh2Z3fR+wL1bTpyDKrnBswc8hQJ6djHjnhq47kJpspqhQKyvIvBb65gtA0EL7ov+2ezDiPFli
 oqb1oGg9t1i9Qkw7i7ba8Nppfb5yqhjhfp+r4IEMV11hMwqsSgAY+PbXVW4ytuZbh8PBjQvRgD5
 daxTYa8QGwdOdbyeSDx1w8XsH2gRtMYoD1y2oUUEIo/J0xcIYnKkQ28mkIeEBuoxanT/QrFZVQO
 D29morkozD/tofBeLHiqTE34lI4H82Wgvjw/XEvzliP+5pFT/B9lMBqKB81cgoY2HZWOMU+npLJ
 lMp2M25LTDp0uNxyVog==
X-Proofpoint-ORIG-GUID: Ju-YtJlYulreVYYASV6Yy2nHmrBEt49Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX71Y8KoTAtKRN
 04VBkWlXzNVvpBlRRjhgdM4fqV3VhBcSAOrNA6bUxvkl1aUCJXOFeLK0uK5kSsj3xi8OwEpUgDP
 +0UUXYzWz4+1OrkbhMpva3tDmnYOr94=
X-Proofpoint-GUID: Ju-YtJlYulreVYYASV6Yy2nHmrBEt49Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..e7af7e36ea1b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -284,6 +284,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -293,6 +294,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <2411>;
 				exit-latency-us = <1461>;
@@ -304,6 +306,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <3300>;
 				exit-latency-us = <3300>;
@@ -312,6 +315,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_aoss_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100a344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

