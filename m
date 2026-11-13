Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559482;
	b=i0gNOC2STaj9TAivbjx45Z7fLxBElfTpuw5sqW3u61ia8mwnZeI2xtncyDSjm0DamAyW
	 gGTgPCuDqIofq3SKLobAPd5jNGtksuHYz5aTq8uSkLA/z+U+i7FkHLkZWYHnyFo5ccTMt
	 vcYSFsCLAUXwEVGbTElega4osxxy0lakMu3mJ0P37GWfhr8yWcFl+pz0omLlIDiT/ocpc
	 rEer86TqD7u0swWfSzVzbhhVXSKtnzfsUOKhF+c61sLchEEWGimBGg0CFzqi//gvT8XDv
	 wEcVeqfZy8hZ1vLLlQDp4pv3OUOg5eGeVrKKMqiTNmlzlJyGe3GrfAppX16510g7BWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
	b=YfDLdSFpVGOVJ5lK9CrgjtBCdDLF0QQVMbbnLZ/EO92BlBKLAu+sr4d/Bam0D5190pyl
	 iWsK6R+0CBMuogG2uXZ2HdH6pBdsnJG+gc+JTN2YbR9t+V6pNNKgi6ZkGH0n501RAgmKh
	 IC6OybVNKuGh9d4kt2/hO7HgrkTgfEZiHkxp5nrufCVgfl/30GFl3Q+KHkTJKFltKOk9I
	 Leq1zn7Ql/dQrEN3ovx2EaPKzerw1UFboYrK/6ulyyTfNTl5C0U8idUgHp1+fx7W1J7O0
	 wFUVDL6lQxOg+7/tpLnWMfRn+/I286GkZIpX7769evD6/wRI/YL684BMudWZSuQegsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3160A2604
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D3160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VSXM1527725
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=; b=RWIx79Qb43YpODZN
	UrDLH1rjSOQSUi32mYZnnjk+SsakssXggJllrthJ63skr1a/VT87pxwJAJsDU9rJ
	kfGPzeXBXlk4EN706NzCI7yBOFYn9qzCW20WjNevdF1V2fkX3Jkcpe30tSBffXnK
	av8xSNTJG5xfzV8zuD4GOP2V6x8eCB1xEKdCE/zWC8U3SKXcU6DT/YAPyARnOB4T
	VwEzjqyVulbtUSze+9WUQqebcHrTd909jbld2fOTRz08Y1tRkG4K0aDLJS0VGAtW
	P6dPjB4/CZct+tJ1/qMQUxutM5agPi3StylX7OOgpDZBbqIUdcGPqv77i8Zt/xoE
	KwRQ4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8fy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so934791eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559479; x=1795164279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=iwN8MxQ2nacxBJdnAKNmF+qjSyInIwnHoOk4BS1w2/0xBqOe/ig64jx8UTItnG+xBl
         +tBGE3SQmhVobLUWsdXYTyZRO4xppDjLY/e5mcmRSSC6e02i1JhPM7g0R1spLiTjjr5X
         P9gobvE9M0kpdgO9KjCfEPJ9Slxo6FYkzaqQ/sI23S4H/IicYIX3LROsk+VS9b6k4jOa
         DRKceva9GBXmn2bS8VjW31TFpz/VSCbUAtfhHfw+j1ps1D5GhNSE33VkTLHBuMT9Xcao
         J6JMG9LsDqSc6CreG/WbReXO2FZtZ2treeL+yENT6AqGLuYk05LchIysZmfAjR4ARsf/
         3I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559479; x=1795164279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=wR856hBlcONlxDbn609Ac6ST8xjXaXaUPomX0XvNDQVvBK9G77gQjjl/PlRixENPjJ
         we6TEjxqeklbKfCbKg//N1xCKaoaYpH8YZ7Q8MnfwlWoFx1dPHWXyoiw6DvQZc7BLQGm
         ZFjXxk66N9N8FyIz5FJxeHg+jMPZPTF4x01JWk9sTUUSTbF+e3MmsBW3yk9JiDo3iroC
         9YAbzIWRKrEr5rcydVsGdxCosezEW0aDxbqODnxB+x61IbavZB/anu98ymeLMuVC/a4a
         JujufMYTJwh4qs1k18I/n6Y3tTTYQVKLoJlLc/Pm9MJGBFmkMXCtIR7TxT/9srSIz7U5
         VNOA==
X-Forwarded-Encrypted: i=1; AL+hErElFd01d8fywFfD249KFKA9IBy1RYiKBKhNEWRPqvPlgzsu489CLfEZHdUBuw0nQCzR0IB5DOypQjIW9T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9WnxVo6kRmAqeazdx8YvGKtN0FL1UXqQPpsKq4TmHIXLrD/WD
	/btWCjyXhJgNkywo35WxpmknKU5Zb2iBWiaHB+HvGnR3iEkybzGBUwJ+hCEXY/1QjYeWmK/fonR
	ecw19YyRcFNT1DBOSpuDCqwSt/xMXZlWoRcxBinzA/qHF1CoE//NW9EgZP39xDAjJaHQ=
X-Gm-Gg: AYBFou3I4vzvtcVKsJvNAgGi+KjvS5bLWSmVd3l5UIdUiuI/ns42sQ0nE2yKpwqC+Ld
	Kjswsx0x9I2lOEydSIRM60TMzBs4yuDvbGaSsDzdQGpaD+sjiLJOmfgjLvSV+JUU/sYKfeT14Mo
	oMbYQtjdwJTgvbUexQS8Jani1JtsBzZUo4Dr1Qis3exznYbXMRb416NgLC1BFx23/ANA3aCzHnU
	3mK+XfP+YwGZfLGr+AZI2N7JJmn/vbDe23NtWZ4GY9NkcDTQzYTynmj3bj8On+RqaJHlVPZdZyy
	0RomopGGAqwwtHU9neKAALix9a7DH+L8ldmNaJDnArLyQD8CWTvYiy0d+XkGzphIjKhRvdurEMv
	QO1iFnZTlNqtRtaSqU+Cb+xcK57FiftPx/yJx2xlshdcCskGAr6rTbJE7n1s2bVosrD4nuUJlyB
	NYKwA=
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914375eec.31.1794559479200;
        Fri, 13 Nov 2026 00:44:39 -0800 (PST)
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914350eec.31.1794559478641;
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:46 +0530
Subject: [PATCH v3 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
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
Message-Id: <20261113-thermal_bin-v3-3-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=1843;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=vwYmeuoZ5lHmVqk80h0qWG19XZnP39VU8XyF/LOm3ZI=;
 b=aeA7dvyrgX7CJFxmnzCADaVvcpgLvAr0AI7xRba8QE3wF0ZoOviqkPIDA4JfSv+d6Cg4VR9kD
 zLlm8CYXaUdBHj7wZgEROD0Gvk4uUyRquehwJ71pl/N8GmAhIHlkjNb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX7XSMCm1AzCVY
 mq5Ya+u6FpKH+TNcV77GBiTfjvspx7XD9jibASA/CWMT/aJGz7aS82PdMfTjFQ9EgBhvVkb+9NV
 O+/8UDd7A4g+vFUV+xhIWTib2zt10dGEsxx6DVi3g0xtL5y68x1lD+pBtEgtWt3TGvT15uBkNc1
 giYbuxtP0UCBnw2iOSDXDcpdhAmu1foM2IyPUbfm58LhP4ojk/8HCmvCkMuqGa6MSws3xvEgFqP
 iBBIn3ivnXwZimkG8gMktgUmFiRLqWTJ4ijolUuTfYu50bJqSVpajqV+pW/NzEaaPqAWycHSmWQ
 wHvC/ddoC571hzkoIEpXARjzKutsH9rXS6B5cMMMUPSbQOzqUtt011ePbhciQbiKfreK4DCf4Zt
 jZ5Cw6IdYvWpOg/MXfcOo+eYdz1/1PGTgKFC7icH/E2uZ30PzNg+aKKRjkPmxNPY3a4uW7QBiAf
 k6NnorBlaVZnImzyrgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXwnpB8NsRN2tD
 ziFnzFDzIftlBzg7lzSeKxj4GnJswMP5YDB1NXsOOG1kCoWHv7iYOQFDSJtvRkLydvaSlKrTn+r
 gjWtsuQYk3J9t8KwOuR1SNiS7rtz0+E=
X-Proofpoint-ORIG-GUID: nyOwHczojBVKWTViTP-Cugh5DItORfhS
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6cdf8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nyOwHczojBVKWTViTP-Cugh5DItORfhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..e72d6b8b657b 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -66,6 +66,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -245,6 +246,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

