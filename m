Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478246;
	b=i9ozeWzMvr9EZ3xDmn2kF2hN0I9gBksLyW5wF1oa0E3NkzfSh5ESEMrofUS/oDtjq6Qr
	 b+Z9C8rSwf468TUSfp90NuBwt9mZeX7n6NmvwL3YFmw8a5epudRFqIo5tV3PUn2yGz/SY
	 vgz5z7JsQ94Jg2OFO3yBLREuYwO4TVSjNYI0b8MFWLSiYashPEWEJEc/ER3/vAIOsGze+
	 MoyTjWKKu9t4+NvQ8NdHDS+F76CmcvKaER8IHbO/Tt4O8YVcc/o5iBMx541UacJZl/g2/
	 b48upy561Xm6NjUcixw9hz8uS+Mho+imG8pxNE1g3GJatDtqKCioANO88L7iTKmi91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
	b=fTmQeRAU/4UIk9lS8vNG9X2yZ899oHA32QG2njJBEbjIWEnSYu1ES2UUF1W89PC4lGb3
	 66JOvEERsI6qntb8152Sd4VEmfXyypbPCfXnMlrVP9LX/+0S1CXST6j0yASWviy14/Nc8
	 WtQNKUjPgAOcORpMfQPNryaLRcKPzKcNJwvAC3ceQgifM0d504+HdHrUB/z2N5eKyFc2X
	 03YyrmmzCWCUdE+YnzcDVQK547i/+3c3h7NEI32mIcef5JMt2CHyYz4eo4uAln/xdnvS/
	 zttQ4rdeqXPwkEHlMt3VkWMoIsWUoVkHpnUlbyzddEGaA+wf7QK+rlKy0KO7wmEjPiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C2C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOdh4032275
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9
	ZL/nzZpw=; b=On90Te8nj7S+0SNpk4PUbooliAGaPPjvwOxNdKqK1dPomA43X4q
	fk2IFUS7vHGQsx93zXVeCh+ZGBD2brS6Tmt76mR1IiS/yVrlAc1WZ07suQhutdvS
	6O11LrKft2Sd30pv7x3V7vb4AJ6Dmjo7A2TNWjKg44aaODYYMSBy6dfl4N97Nf3Z
	vQj3HE9u9jZzNCnvV1nU4ppgko6+aHEHuAF88zSNZUnE++rsR2MqmHucRZq7l/Nq
	2RbgBiD8bLnZsoHPt2qnN7GlczExtjAYON9Zei35NTbAPDE0+0OhR8EzBaPTLa8Z
	gAFzeZxcQABt5tPfYDpMOcDDFCRhKsLkBgw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q95ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-186c1aae818so4287477c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478244; x=1793083044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=LaByuWPRQmp/08VCDyjWZo4VWcA5gg36z+bxzO7ehKPwPXhRDPwwGTPVmh0mJZ3rp4
         EfD7ko0UEIM274kNw8x95I9D6yrkrShu20Cwxxus53qUvpNTkqI+M44gKLY6FFtmNJMw
         9NystLBGW1wy+YDIi6VPTPr2hrUWcLjfH0C6+iRSfJqTdd0valsTVKH6pejaOYm2wLCo
         0ax2+Oo02WZjNgyLwmWALIO5KehE31bL5VwJRdcELYgf88+3v2aDCvxN1vBKmNukVKYP
         M1eT4fvxt4Uknnle4BNEgrjS8o/+tCEElss4bwWhIR1Nh6CNkOJlMG1lN+lncvvSEhRj
         v3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478244; x=1793083044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=igIOieEpySshN9OcPB6PWAl4QZ820FGwFeJOa1gCpyGpGgTEPDwpdl+JOdyUkfKLJ7
         ceICBwITP9G0lA0sScfgwnzs6QdLHll4BHDpeMm99GeBkQ2OG0/SAWyluwRKTySXSEtN
         kyC+hKpWjrqeRpUqL1ZIn4IHH/ARkwFnddDZORBpre/3LTkNX4ct1zuNpghNHasHbp/3
         bMto3jQHYFQ3FstyQb8n2qZjGwQQHHMYxWyvSywUDGVpbLHHU226nNDyn568zJyHidGE
         +zQI6hgAcvhhumFpAEbVhRbWFKF7a3FErOMAqzSe9klfot+mzxvG9v/tPftvYZeKQwSN
         4VTg==
X-Forwarded-Encrypted: i=1; AKwUvBw4wt1VUhnUZFr9RHMNmY3IzjBUMVBd6iDohViLnR/o2XWHYiBzz835hbziUWNfjeFmGxgjxxtaoUvZsBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ55Rn2wDg8iujE4SfNdZ0KoySAFZh8Pjz1ayntkYE1H7JOHvz6
	HFNyM2c+zqnqbVngLNBtmpTVQSsoP+duSrCzgERhUK5+GSASREKJC9iUURUHnFNbI3eID6bQ78q
	LZc5LIQg1IBl43ypGhCfHhGkSrnhtUQVx0GcoPl6Exw+90sMqjW9WEMTScGTCv7q+yPU=
X-Gm-Gg: AYBFou2evwYYn+2A/uqh82XXYvQI92oZsI+j4H6KNEw8v7IeCiEU0xkB9f/PpaXKVHi
	pwWVmIXm/qV48kaMNJOqhFVu6OratwtF0t1Q+0W/tTXpDdjGGi+bRzWR+z/Yw0C/ii5FXnRxy/c
	FQveDhqTGTH1gsR1pjgP7VamR72Di3nNPKSNeND0uSQDdG10UUKynMWMPy7pnvn0NVbBrV8C729
	U1o1fPvQpCgHkMU5ERulQBj77GgrwyfLpIDV3vfFFmTD/sROtftgy/wVGfMZbhmeXvEB1f6JkYQ
	49hzf6rQvMgi8R8xN1wbTnLOrRXLsob/0edFklbKGIBt7joEnT+EbutXoXUPsWdvpq0d2LMUWBl
	/KR0646eRf6TVFwGlXSpeh+gRzNsWuqbU34Ah9zNDTOK/ww==
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254374c88.47.1792478243758;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254342c88.47.1792478243242;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm30791906c88.8.2026.10.19.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:37:22 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power domains
Date: Mon, 19 Oct 2026 23:37:18 -0700
Message-ID: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BFgAtDqAkBZSI3yw1oWIvwM8DSi88vkO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX6kkSB9gdEwNX
 IK4LDbSWz0DloTZfhdmAeAKrWwSDhEwICcMI+k60ssp7rT/3ShcPKRXxA3nkQE0isI9LJJWkQ/B
 91p2tpizspL+HaaL5OVn7vONyYsZQ4u220OTM+8TJLRvWj8MPphB4lFavzO0zIK+DwZoz3V8eS5
 f7AsaQTuND0otnmwBp/m/VZ/gXgOuv1VRnIA2tjsXzQPObFrdlqSFLhAH7Iz0//pzkOylo7BM+C
 cyS1qSc70wKpTpA/zgzlYdxrirwdvhti/CEC9jaYh3rihHxdtidVzZE+tbGzQ3Lad74Smu4+pSF
 vki6TkxvI43jVOMY4Znf20930cUZwBX3xMbmUReAzwys4zt8WvYvvjg7ypEWGKeI8Ku6fZ3eIEF
 Zk08s5tO9uhCdzWl3c9fqyqTFFwhHv5MD7WoGOAqT/UIfTY6CwNrZ15r4CAD440i0wTCYCgzFKM
 Yb+RZ8Kdez0h8uggW9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX8PzTL1N9YfPH
 jpKchQPfzHRQI+O/xH3SMix5L2I6CH+SB18ZiHmohnvyyzpz4uVFOBkVFMIC/6lBlGLvJUrS70k
 hBqeGTGrwwID4tBZvHCgblpjqEYYlJc=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad70c24 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zuyij4ZH1eBwXV_bZR4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: BFgAtDqAkBZSI3yw1oWIvwM8DSi88vkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200026

KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
but both share a single cluster_pd. Even though their domain-idle-state
configurations are identical, sharing one power-domain node means the
kernel's PSCI domain idle refcounting merges both clusters together,
preventing either cluster from entering idle independently.

Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
tracked separately by the PSCI domain idle logic.

Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..5428f3f44361 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -273,53 +273,59 @@ psci {
 
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
-		cluster_pd: power-domain-cluster {
+		cluster0_pd: power-domain-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_cl5>;
+			power-domains = <&system_pd>;
+		};
+
+		cluster1_pd: power-domain-cluster1 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_cl5>;
 			power-domains = <&system_pd>;
-- 
2.43.0

