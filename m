Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104525;
	b=LNY/pCckLpwxmiahAMbxXEC+ez7UjNDJBRsGYF41BBr03JHmv8/hyuB6cidurUITpa85
	 6nnHs61nxIdm5gZZ8fierRk2qrw5AujsKpBWoS0sLBf2d0gEXubVX1n7syxg+bB521iUA
	 NUs5ekY5LVM+xC+4ZaG0gLx+SxKnx/VWmLmFW/j1m7T3Jd3eSgt3abQEkw2MQ6alyHYyg
	 X/S8hLYTFVAsQ+HBgim1mwCsnxgkmjTFxWa9mXiIw39iKzq3nSRK394WjiF/xCbtneeqp
	 O66/PxSanisMRtB57KRrSYdd8Vn/BiEAf3MzBgux0TLo+0ZJ11Upo+OH+/qvRJB0Jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
	b=d8PrsrBwX7B3ztOQtTSdCGiWpmeVCNqPKsYAd+CYBqqBdRGQo/31IbN23o8OWCKxCmKI
	 S3snRwcfUFdnInz7DmlYm1YrbmpBoMkrw8Mx41hQhU6NcC9l4yPYnVE01VbG+Ise3+iDr
	 cq062g3xQ0KRDfajW5tmqhCWQUwe9dpRm36eBCi3w8CeaQgPQMAJ1otVqa8qHcyi1mdaY
	 J3de1dzth3Fm4hl+1H7cb2Iq6XIDTew9Yx9LdUyo/cQjpTKn/og4w+dX5xH1JfnxyHjpd
	 KfUHv2eLHnTYTyfnVEUOcVU3LL5lpO1pgvGlZhoQ6dxRl5IFMM/NJGoOjEUWJewDxcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D6606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14D6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCO8dn1124847
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=; b=kSARHC9pIv7rT6Qc
	DNQ0xudpnbuLzyp33PUPFKhNGszS10J8MMb5fi2QCCl1k9OZn0l49F/KFJqFbE9L
	xc6QWikzNWBwC/SF0MTO9Z1Mz19aYiQyVlaSrx9l8S29RKzRdJApyxQQkvO3EgB8
	k9b1fzhaoYV2kOHkW2HDEvRJRkY6LuaT8GW7rK9A5bIrR7lg5yB5ik9OSgfDKnie
	BYrJZ16f98cCcur2bhXsGKAnANxEv1HF3fFEYfSri51fGPAP7LbZyqWQats0aSo9
	9ubJEx3mox4AUcQWyRzqUQXNS/UdgAoa/Uc5o0xPGX85obR666OD3PSIW51JHjPV
	5MenUw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9819n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0adb0b8dbso64570997b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104523; x=1793709323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=PDN7sIEj/OiIxLqIes0gwT5vZFk1H4e9vkm9BTdoRqRe3jbUggUHzAzknzra+h/HIH
         7Fxjr2STkMHP2T7cleTTkr90iOQkkBV5o+UMoKHXZ9ZXnk0BDpAVvtWd0H9Pc46sIjsk
         m17ByaR/aGwl9cbLf9URxNdLQkL9f6C//j+eaJ+qT1C8BPEQyvVhE/Nd8qj6/FK0/wQx
         zpkyEL0oblzFIo7iI+ynWCo5ffs/Gefw8XrAcpic578S8XAdWxWZ2IbRJKr7U2nocSbs
         aMS2pKIIjBxR9VH1XgZXu8ZSalnGrnnUCL2Hcjp3SaAjvdKpjxpRF4ES0A+tQwU8udYe
         zOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104523; x=1793709323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=Dbyokn3yJl76MRgKF7t15gs4pW/+AhmAsS5KMzLJoaq1aQ9eFA7xRMhI+piFyJyi3V
         rRgbXCnk896Albsos2RWfYrhzpm+CY46FV4V6YCGlWAAo1Qu/QIeX7BjGQvagMxEPrra
         czL0AMjX3RQwmWEU4c4PWSW6Eyu/dPoVMvRQmMOVmKfDuk44HBPcw3oWh2IKSijfc0gl
         Yq9ybgikAX2zaI1N0dR9PnFBPmFAF0+5o0XZDKz681ZJboB7O+ndpAXFKJF4ANs2Wnn5
         uMN31GivQGppveUheEWhm5Tq3eXWNtF9Gk3QqqW1V3BNmOxHhUk9tyngzWBuQNbFUNBB
         8MZg==
X-Gm-Message-State: AFq9FYLfj6cPx05M42bGCtR8Xs7/Nc+JIp6d1msdXBr8vkwoHFckWZzI
	jGH14aRZny7dAMeV/uKShE9bOnvtzwczVpAAstw8GrllW+og9ABlYph/J5pSHqF61sjeZIWcs1Q
	Lxv0Hl3PLEXFkoDQVM/amsMdx3cx0T92TnKT2fH7rnky2cw3gdSCuFux2G29SgolHMr4=
X-Gm-Gg: AYBFou3oHbJNB4IWdtxH4bCH/4awlbHykOEhR5+YmWn+8H9It6HUfGeSy4ynUc/ftJJ
	VyIE4QI0uwZs/+clTeii0mUmghGqZXtNp0T48YhdkX4VHTJUEwsqW8s/UXskivQdTwb3a7UmJ7k
	wa/uNdZ/HuIkLd3nd59yIIqc3Xb66dbdCWHRuSHVZ6piXWZ0OOgPCXlPhbQGPBiOjyRYYbKaGNq
	0cWCYwy4OqnapVhCF4JpFnoPYwguVyf/WJcNJUy/s8suHaLooteHc2HLl5iJqS8EPTrZRR78pg5
	WFHj//BpELYCSbCbV+Jx94KHio5rC3Y4bwX4DsdScQsUESxbzML97HkW7CgjqrxBBFXIzXOr0Si
	grDqyensu0Ig24BBpPw==
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80032087b3.69.1793104523187;
        Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80031767b3.69.1793104522417;
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:18 +0530
Subject: [PATCH v5 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
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
Message-Id: <20261027-regulator-off-on-delay-v5-1-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=1438;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=8ZlC6sJQp0U3FTSKTP9WDG1CV81XRr9JEfHI8yU8VFI=;
 b=/hPOEDNrc62EetvSsVAYKEj/2yA8UIrOp4yK7jzuwlNRf5eES1bVf/l1yc98V/f29ge5qKXJq
 +B2K1PTKPcsCibm9wVwWF2GOb+B0CRFIENx/XeteZ/tIud+ahZX6Ube
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae09a8b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xl1xDpuIGGFnwhC4BG4A:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: n7rT9IAnfi5inSzvbsIwjo4g_0nPASZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX+Yua7Ip6lqcG
 EsHJDSQXOy1dmeV1Oi95UbcxmEk1ATo3Xige7fV53hLA3DiNu502voQhL8hvxleidu7Z3g0rzVq
 8ghFrLBGjW36Hc/vtPqzNFef8KKMHU/D1UL0ZrVsdqcABB45O982oT0JYDCu/QaIw9zxUd6uae/
 mJ9RQx+3/JTgSTqKZioqOcfY+1v9inyoMD9pE8M37rD+ReTKWW4D5Wf6oE7HaGkLoHmZaks7AWz
 rk6IWbFBU6/7OhYMmM8YpHlM6KmG+50rRjcec9fAiWZzvMrriwxenrq3yjiHTnbKpDTGkOBEPbr
 Wfu9YW7+JVWLqeFipEsI7MAm8yzdUfRa842LNQszlpoJWCZ28k1xVG+KD/tDczhsfwyljrFkfKS
 /tB6S97JNCzF2e88Nu4ViAQzZ08+a5mEmeiaAkZ1dRL1kammjX9lTw2XeYd6QA6xLBaPWoVwEu/
 9h9VwFgDtoggKEHJ3HA==
X-Proofpoint-GUID: n7rT9IAnfi5inSzvbsIwjo4g_0nPASZh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX6qjIMwxQCSAf
 pusZ6cl8BzrgHUV4v0oO6CaBLPFd5T9CSs8kahTyvlepLpCJO1LZb1c74lWMT03/+YzajtajdBY
 SaN3OGZQJzhtpyi3za9CicAGmRMljCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
between disabling and re-enabling a regulator. This is useful in cases
where a regulator discharges slowly and needs significant time to reach a
safe reset level, and re-enabling it too early may lead to a brownout
event.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..73e1bea87adb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -243,6 +243,11 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-off-on-delay-us:
+    description: Specifies a minimum delay in microseconds between disabling and
+      re-enabling the regulator. This is needed for regulators that discharge
+      slowly and require a significant delay to drop below brownout thresholds.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node

-- 
2.43.0

