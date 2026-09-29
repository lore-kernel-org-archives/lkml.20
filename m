Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6834FD787
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675328; cv=none; b=t5OahOmPOB7o9Aumr6dPMvWlrFnMAGESfGJUHWsM+ZqxB1xEHwPIvqJK6/z2WXpWpThwuHEBQGa7M+hlCjN8ALdXYHVKwc9JzeOMXAS2mqWbX/MApPJLdycKPCBX4IIyANEgGdeWtN0TVozs8P8j3xi7Id0TKDaHm2nvpDlTPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675328; c=relaxed/simple;
	bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrG89q4iEwUT7YZV1ucbIQYyRovzbxUBiRJNwSoafdy0JLt8wMbolP6hhmUDwzApM5Q5sFTES8SKaAm+wjaVm8HCANjknPYZ2YJEnHzPFdBhOpXJHRKnYd1yM+eWRgF1Hnh1MAb1SmeMZCZKrzCJuCbkcb0xkU1mwD+ZlSHD1rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koOhRLNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaUY4s/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koOhRLNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaUY4s/Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XYKi1004789
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=; b=koOhRLNO5KQmXB+p
	wYSKWU0B/gIGJomYj76p2TtkZQ8slliYa4DcFyT+f0gLnU65SnPuNs09YipwysKa
	8dORQdwrhIwjTg4xCyr1feRjbgG5ofMdVpWPmISOXgiOHB/GjyF/faC5jMv8ayeN
	7qMDEQMw+qgrYEcLSyupEPeny7gzs40Zr9VN0VLUPxO7RSAMmvr0v3avs43y1eHt
	mL1kJ2r0xdEb+7sIoZ0yKblXM4PE+o6yAYHF9u7aFl+t+UWHrG7y+uOrIFenJp6L
	WvUuPZW2HYtDN86KaytSZr8GrM0FhVM6gjQ1udnYbyKIXvwNfLpepQcPLC8rIvL8
	g0Qd6A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4r9wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso642621eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675325; x=1791280125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=VaUY4s/Qgshqy2Jpc9sZ7kDXwHXGOX0eBykjbtViVLOV/ZRlxXXZvdF3C5dv4qdX/b
         QpHD6XQN5gH74grzHe0DIpkHxvWwVsub4xAgONa8cIFo/beYiygf5OkmB3Z1Mj9nlVXY
         rg7m3JwAAAwaLZmFWfv118oe406Dx0L7CENF4SjsliKCh1LP26fHAkt4Fn9sVBSOIY5z
         tVhTtTUpI4RGQTkicFcoBht4UQXJNJm3iP9m+RpAouev2ekCQPLlUKctqgWh5z0xwEad
         bYffJo9l/TCubUeiLUskaUwVhrUZFacxgzYUfATrBJfU84KPpyxDgY/s8j24oxJ3Fx3g
         fSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675325; x=1791280125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=Yd/nZ5sUxDcfJ+g2lFMlvAAmBKi+Jg95HLQEiuu5RganENVU6b0/W3RlgCqEz/jZkw
         /TFDNMuFzlDI0wA/1XtM5PDkSdZbg0jD3BJaL8aeXGeyHO9OtKTX5cKvCVblfKibM2js
         +NGpVUcBbyDCAnfoSO9+Z27jIOPup5+T/h4oUaiTNPtG7sfvA0X/X7hM1PyofirxhxDb
         RW/Wi4DhOxMjGP1PbICsS9s0Viq8EEfYYNKMGMTQHc1VTT+RXl1ugvX2R7x4QrJT5IMa
         exV6HSJldCJM1GrvPN7cdNStWmEYI88BWteq+uBWiAmPT+tcTHbC87QW6Tzd4uLK/378
         F6eA==
X-Forwarded-Encrypted: i=1; AKwUvBwEco1KA+kJlxlgfHixlB90rxBdOBG8Mx2ucMpluRvjhuCMypet9JyfH0QgGvoVfKGN50Dy8h/uuzoAJTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lTj2uSQp1EGqlZrrwJh7gURu3yj9ehArarxNTr9RUHHQx04S7t
	9CNlfldlOwFKIwJCjHF2h4SwyuYobV8vJ/NJ+wae6jGuOkgVmK1OxI2EFgOCy+4h33hgywQCJX/
	CeRXMAcN1Y/Ch4oPrltO5d86ojaaJ7ciikoK9JGhYMX0ftY3gZS0rnEW9/uEZPcux0PU=
X-Gm-Gg: AYBFou1hXSyGuwstY2Jac45xl2B4XgUlVgVbSBJXwkdpkt+FmDVAmORE36x0Laiz/rE
	+XfKpcdvR1Qchp/NP7FiQAOO848TH4HaRCD8a+IYdcGe5TOUQ17Qw8PLMWN8ow5XNM7hfKuR3xe
	Ak7cuQ5BW5T65y3+tDc9sM0XW8NoR2E+i18t2sBljh/67JlcF16EHjVoiH2ZnYSGC6iDzp+qpSm
	WAElNGEl4bx02lWaZeqE9NOVIBFnV/fCUWoPkkeUzmgWiAMTFOOe0O8Hn3sCj3piQPKLYAgSXpM
	BbrzwY8KQZ4jIVc17qcLCDeg+9+D1JY+0s552+TBTRahR8AfdVR1+ZX6W0H06VPWKkE0HkUGYF/
	kpk4AlWdp17fsxAfmDrxrJ//mNaPV85wviIRipIWsyEHz4/WR7oZOToWvwb/ioSJhj2zesPsRuy
	UVXfA/G+xq+rONMLyd86xLmIo=
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414868c88.17.1790675324997;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414819c88.17.1790675324308;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:06 +0530
Subject: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=1170;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
 b=BNaL8nY6BMt6oeiq+dbAuQA8H163cAxwKxfyPg+qkJml6TLk2y4CdmQebdyvtkeJfQfH2YXP5
 PSQFEfxd4xDCPWndJQ7CRB7xxA6Qmk3wQ9Wo9bcADe0CHtZunb2PwT0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfXy9ilyVvbU1xX
 Ko/2/eg0TXpcU5wJkSJYjz4foypqS9jUOBkwOlcfZn3nCusLqfMix7EC2GmNnCmt7MyE2wCe0m9
 JuUtDEcAOZiXmLT9UiPZGgM53RgJEfI=
X-Proofpoint-GUID: uih1Q22ERhbM-T0CN64xt3U-RHZNZ8h_
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abb897d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p3y7badNstDnMIU1-wkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: uih1Q22ERhbM-T0CN64xt3U-RHZNZ8h_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX692efzWqkAWH
 C8mPKsOl1O522r0zkiv7PfeJFS+lY0OZBOpd14oDgavHbcu0T76p9sCodNOd7V4gBuoEaKrHI61
 Y5JbrGZ9oxd01pGJADumBZ7JRSb68l0uNgJq2GLW9+dCjGs47arFsNQ2XX9UnpV/7rnmE7/isA5
 8RXrstPA+wlfHKxfQXx8rSQL5q/Ky1QpMC21SK0QREMQTOGmYj8bGMRBtPnoYBTP+qhUbp+TL7f
 So6e4JcqKg6PPrX4hITzwKh41mF00q5XSOt+2mNdLB93MBXkeGtgkeRuIoPqulzwl8jUFKsBTw5
 CBOzHlV6Ms7xwUBOGDSSQ6qQ/mR1UHv1MGhlg5dB9qtbi1mY0BUASP0Xn4gMOb9jW1ArWT1pT02
 Fm5QMg6OuvhERq8sAkhFqkcMkNyFp6Lkr+tQUa0DkYKObTSjmpTtnzYP6HbkXOr9Sth2JgWU7ql
 iWkaqAxl3Clquz9HNog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290038

The QUP wrapper maps its serial engines 1:1 into the parent bus. On
64-bit Qualcomm SoCs that bus uses two address and size cells, but on
32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
forces those SoCs to spell out an explicit ranges property instead of
the plain empty "ranges;" which dtc only accepts when the child and
parent cell counts match.

Allow either one or two cells so the wrapper can follow its parent bus.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 54cd585f19e3..c01ad421a122 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -36,10 +36,10 @@ properties:
     maxItems: 2
 
   "#address-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   ranges: true
 

-- 
2.43.0

