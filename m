Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273706;
	b=nAEkuyc0Zb+TSFCvSia7iIZ3O6SMcRdvTrcDzE1WHuQzqIQGuVl/lMi6DTTAZgSvHyO5
	 fEZUKT0OF7x/OGTqciGF2KwZZQe0+GYUKImwtQkJ936DNfY5Wrhl9mttHal5xaIx64asK
	 IrWFQKyTKS4pTDBkk5dvwg1BNB3TkZtOUehxbIP2EafyJ9uS9KLh7A3wIMkXxBnizJXap
	 YZjsoxQ8WoSuP4xJ3POC1rSJ8OKzmOOC4XshMTUhf84C5IYF1oXpG0agGUZKEG4DKrjEe
	 sSDLvE0OHZp8w0ADFkmhSqJL74BKDAdHQ36B6f3veVV98bC5gIIDx0aXb8u+HcXQ1Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
	b=R9N/hDrlD9Y8EJZigy4PTri5kMDKZu80j8/GMuimduGAf0har8d/tkHHWc4GRcuFizKO
	 3KdY/yEaF5jRpOZ6j/uewiDvcvqntu0Lusw16v0YCUR1Jf0R68fvL6+KYLQIY653BQ0HU
	 WTtfa+a3Nz3uxa67htB2i4Zn81yQJr6rn/64IAq2aKCfK6+bUMglBHFwQW8TFb1Mp63YG
	 XwrKw9w3LvSbN31ppp2ZrJS42VEI+LhneWouSZBsoi1l/HUdYroU0YAZeRlFsTLsb1N31
	 lL+M/ZiieLfY6/dhM3VF4liippAGu1m96mYZEc6yxsZxvsrj/GR2+ZwQPNRSwMBsmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1jPO6On;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReIuYGKF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B4606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847B4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1jPO6On;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReIuYGKF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j3R41323059
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=; b=p1jPO6On48JanXFT
	4yaf1fBc21EJqjBXPey/FlyERlNs47OCky//WkyOr8qBcMHJm9pZx05M65oKFR94
	9pp56fv29jq7dyQaItr8OhmRlkL5pYIqkFS85kDtfWCbmVsxd6OseTWREmuyrMaH
	Q3glTqyO5ZQ/JMqHSJS16sTEpl0/0ykhhJWDofrzvRMXvsGUKwm1Apw29JJca4my
	6Szbx50Q/O3cUs4i22YUzIn4uYXUBW7RfB4os8JkZiV9hFuvnC5+iTv88kBgc70Z
	kDKr2b4b17KJQxTb2DPUCuKGR/GyF8KV5v9JrHfRwnY1puZrJJ6UK2CwTEcDDeX0
	Y7YS/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58bh1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb362d1f5eso14712215ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273704; x=1794878504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=ReIuYGKFblN5Vn+dcKk4FjaWy9ivgRp5vs13i9b+re3/xVk8hh9/oX5s23Jz3Vsya2
         a3sEKNJ3BnNlwjCW3bPpDO9VSRxqC9iDLDUGnCTZfFS3AzU5Bj4ZJBB/vv6ryxzNHLXJ
         b2DUyg7CCWPMsuesXODouV3IWhTkj47E6SunX2GPr0Z7CCdiVj0es13gF9T/4y7ZMXbj
         0hbnpCixomje/jYbwkuHh/jM2y5OA6jGRLl+6782ih4A4fjUudW426obX7T+4sxgwfad
         DNhX2wzMFFX4Qcy5iPnUSyZTXfE8Dxr7IkH1LER/pBVOTczA5RoXh1g18uiLRbY3e8qk
         +IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273704; x=1794878504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=cA/VPK+KeMoTGZwNpmKyGSjhudH7qk8fC8ASQaADqB4SxE7DuOhz4/05SvlYEonei9
         LSUn1RVdE3l2p+pvlJ2iEWEKbLihX1XbNXMh26/TRoivrq50Tx6CS95Lq8oReQA5u3G5
         WUW+ZdTMIsKOWY7KshsluWM+9vuGHpd4TOaCLdL3iUv2k66J4iV6mSuqH4xp7vTQ5sSX
         r9vl/9J7/ceKFfLl2zgxE7znEXK9kpx9V6TeDvdv0Ar4HbNcAzU9nYjhk589+awNbUS4
         vzrq5FQQbfSUiU33hzFtGXyEXgxV6DJ/i0V1BfNFiLjW7oxxFf7fAhzvSYhJXn55CrW+
         5NXQ==
X-Forwarded-Encrypted: i=1; AL+hErFPCgl8kWFq8fuITszn+gYh7cW92cDLQrFSSK1S57qlD+KHmyJALcTht75Cg0wWtpbEXGwf4A5XNsfrOLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8LOiSJNH5qSAMyHWUsCSBGzwQ7jdlgnutA9kiBGRyP2AACXMK
	lscVR0x/FUrCJ4uMoyDbcUxL+vwZZ71XtOq9kWDfssY/Al4FIoUIxeKVpdeKkIejSCcp3FBSFX0
	UV5XX0ttvDUspdUPH/nAt4Ce2W5cQMHw/I+Dbfnw7XwteeMlqGtQBpwbn5Q9fkc+/k9E=
X-Gm-Gg: AYBFou33mLjG4JTq7iSFroout7HM2LPsukMMULva0o7+Af8A7byJqTY+Kp48kA6DYil
	JFhOZmffo4OZQTIbJQduMMmwGFr/QTaSgxlvvXxUyYIb6KS+FXf4/fXoXB79t7YdJmyva/FN2Yz
	7TY+4gpjXM3Q4d+JJ2jmSK+T6J8tSLK6TZL0jsci8+vEr9cdI9gSla+NktpREvv3rX123FB82aN
	2/VNfdVN8iGEG8p8HFowwN/j99fK/6VNqkKPL9v2KDrwFktneohg2AwiF4mcak18DvR+PiXyL8X
	I4qq59yMNjKoI4Z0cNF9nfSWXmQFjMpHXthkj5eXDZiXo1ORe66AjYCdiQsE6PGGFDuJp52Tj5c
	CUHuZa/nj6hSHOvio2sTg28q1DVrT86dD5WJpPZR3+fYv7JBpaL6WvixcqVw7xKg4lzhRUbw/uH
	Kkt/E7kCfGC623AxJtRJ8iloIkP98hCcc4PMU=
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824375ad.27.1794273703888;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824235ad.27.1794273703462;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:14 +0800
Subject: [PATCH v7 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-1-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=1976;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2oxHkcQaQLeTvUlBWCfoatURBNLE9gB2lsW6YGYzHBI=;
 b=Gt3daX0ozggC7r0JYsXI4bbRCKxGFVnSXpJ65M7c6iDL5mtDLeNtwHK3Nkqy4uu8ntIqlojAQ
 XjWzMxsf+jZDHd6Gr2sxsnQ8RRbkmOCY2cccxVG2zxg5Qw7M5l9u+fx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX53rRA7vzREHs
 O9HMB1FzNChm4oP/BoHN+PzmIrco4zlJUVl6aUyUQ/eoCyoRrHFkgNZALaLUapy2sFwa49fqPye
 rPpAAy31wo+kRAtdBotFYK+XqDN+9AnhclwqtQZPHqTiFfU1zloLL2dtv0cQ5rcA3Zcky3kh2ml
 Us2p/01YQvpfr0+WalHTOzM6LuQXntnQpWIhVhVLyao1kv1KjFmZmblNkKVqmHvlvpBWVN+ORVE
 CLs/aLZUujcpqt5eEoJAbvY+E2dmjQoqqY06CqeMxI0D0+Iio/KzMpQ/N+4AZN2cROdTgv0am23
 xWcb7mRdWHyIUOrsH0i1lpEMnSOj8fiJzwGxKDL2IPtPW+gnnFDMbRaYaWPJf85UqyqcrINB7gG
 tmTJ76NEAUzMTnzzR8E3peiV30ldWBTBSdhShdneUOY1ofahpbp27yvBRFpbysa4IX6WKvPNiDK
 eR5oK1X3qo9U1R96AtQ==
X-Proofpoint-ORIG-GUID: 4EdL86SIv4y9cDTJ9AZqT9fUFxhqKGU4
X-Proofpoint-GUID: 4EdL86SIv4y9cDTJ9AZqT9fUFxhqKGU4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXxx6ts96zFu9L
 +BwTveljs4nSNto92RnoL5q/JKxJkjYJeXI1EPk4P+1x9+ABQaRuqFa0hWmd7/vP//pGDcNuzXZ
 sU7EqjwSP4uTSEMGb1xaKA3/UMLl0dI=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af271a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..625801e3d3bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000 {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1

