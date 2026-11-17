Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924604;
	b=tZ5TLrutR6Re39R/9j+Bjf1d0P7U1lReh1kWF0Qc9TdZKY/LRTuoX7x79mJNxXE4zn6z
	 0hm9AlEZyqd/Jx/dUeaz3NCXlYygxuapngyj0T0p/nC8ocQXfnoj928MI8j4dmz4Jtdj/
	 qgTZqPZji28ML4N7H/EN0EI0Eq/kkPfUFdtFDhl15mnuOHxFceAKZTdDBBW4Z9r3b5kxm
	 WHSthGRceP5qIFJofnAGJwhCnXht4uogy8vIFWiJQn1pLA5F88rFKgdn6KnOz43HASLzR
	 qNZ3Vb08ZVZ08ZWiF9Bb5rmhq2FBg52qwE/CbuTV2A2SNLtrwoT3UEoSGt4G6LfJv2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
	b=R68d1lebAc945q8aAxSFi1XMN2YQtcwrj9hhpAUaru9HpjvTTlR3sWlKJQULRhMko7jI
	 vOfWHeCj4dPwUD50QeCloymNIS6FAp9JsjgUSC/hjaNfOp9y3A5zzbu01H4UJlpX7X6f3
	 NWhWAKrEhYTU5XjtwnHSia0m3dU4o8cvH61/ELa9HoNuRwwDvK6XAvEPytHa+5Ejp8oXG
	 sbcfWS6qZP7A0ba/3alIyzVx1nEN7RFNiOVVTPkeNGDS+zoIQUOEST4gfku9ywUage4Dh
	 B/B8HU6Y4jyXSdPpRq/YHoqImREnKrTtbDRFv13BBgozC01frRleh8wROxf+Y7TeWmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mJW/3Fy0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bdd0McIv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96968606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96968606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJW/3Fy0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bdd0McIv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0q1Q1208480
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=; b=mJW/3Fy0zM0W9585
	LIF6G3TBdysSLcyM3vk1PvPoJiCAkrzARSZSR/PwhfHxArBhdt7117CPUVQj4v8w
	467paesTsTRetP3NV5Z9EMLSMidVBos9dvsViLlMRSmf9714eQVNn8NFhz+vqL+j
	yJHSSIRCF99AFiOYse1QgDrEeYn6Gsy2Ch1hQ9QYrXBydv1k1X7QGhTIdvZOHyuz
	jnGd3SY9ZDWUOnVlCJBqyJCW5pnTE+u0jNCcGp/EdONvN8j1lJoEoTHU3T+pJvgY
	keqBFSxX7YEdlerMm4q5WD9vdMnQTCt1j9lVMcEZGf+ut0WDdhpzRdjZaP4NeZIu
	7UK2Ww==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc9agn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862bca06702so3670937a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924600; x=1795529400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
        b=Bdd0McIvxkZhspk2YMJrNW8DEblin1W8h+yJsOYDYJeNkSTr5XWojN7f9eJl0a9O9C
         +1Vmc4K11NsnvuPPgJSo5PRe7x7gzbnDeAL9hQ6o1tz1FCZyICbMv55CVwk8ofoR0S8N
         51XfpPSv9xfcp9nEdE7YWo3jFRdzU1CR9yHxbONimgRD4H0ZpfNZTsETKRzBwup/XPyh
         u+1E2gjptHtoYbB4L7cdXffMwtpw0rzkgots4VCXlxVg2ahO77AUyR64vGFIZkZQvRpb
         889TzYDq9acp6cGoMl63DVIWESF/+ktXsAgiIYzW59UjFUIT+afyCplEF7+7bHtj6EbW
         XneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924600; x=1795529400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/E3D8dPaIt23Qw1ZQ9w0kfRvdbQWguBGHTJ6/4fGuSI=;
        b=PgVa1MFhlKMsJfDl4cz5B611P5JjMEcshU6ZN90bJkM5zVWSvm9N0Hhep1gIeiTH75
         Qpoq6+P1kOKRa37jUCslbp13IRpE4SnkyJuY2280bAz9RoLLSIcQMJKV8uVVKxn8bCmX
         SjyPjNj6m9s1lFqz6+5qUWqEGrcE6k7HhhrRSZuGPHHOP3WeYDwsmHinB/ul/9yaDQKh
         4BqePaxg/08cq5LXMdfJtiN15xfw9u1AwF/21El4H4AB7pz80Dfwn2lCod5EBzXZBbUB
         RGu8RAejKqJhzj0OD6cHIR8Pv90/X77TaanOgkJ2MadbxzmdBS5UyJntCWkN45J4r5Jb
         57xA==
X-Forwarded-Encrypted: i=1; AL+hErFPOZUQEg1KDtl0btO6XvNtfqWWN1gojeSm7JEBiVF6DvI1HFQoTT4ypT6jtmwMBgVQtiu30uniDmYYnb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NKZPbvUVRe/rwu2UeafpmLRYgM/eXGsjYiOQlkz4BrvYtgEOz
	yJ7yDJ1YsEvbZOKqlJKyncISDfr3Zemr6s9UJRJ/mouOXCATjXynk5buz6HbwOGAKonEWMA02ny
	IE/3XRR2FEq2pZLCaKGhcVo1UEEi4iMqKMsE8zkEvhtelcCiCDe19bfZ/4bO08USiOnM=
X-Gm-Gg: AYBFou3VzI0hA6gsMUhp8dDB9f/lb59EXrtWSI/RJEZd+MQOyYpyyiO3b9CGz2/MNAu
	dfRaWUVsqPInEWgviLfzx5MwtBZd/j4y6ag6fSJrWRUfRTaWleE1EUURIB0H045QpvyJjuwIbjq
	DtI8LoI54gSOrOlfJq7mrlNPJcdJvlIb0CtrULwFyj3DligUkU/TUufm8VVOQ4mqbUpoZLHNT1A
	bvwTSfsQnd8Hh5VoeV7vBYp/PB++UUXOPCZSMxRefgTtR1y1RBHtkO01Y7v1GVlIWE48LHOZeFn
	mchMCo5oS7KTmXMeMWVFXriJ4qu8F7BFP44s1MnovmfZCytz86dJA/Orc/SLiC3iAMTMnLCF3C5
	9g3Ouke56WrYN4wLKiQjzwJ2sWOoiuWb7luV6/5xec0i5WjUUpa0P7OfSiIarbaiNb6856Jal/t
	W5zw==
X-Received: by 2002:a05:6830:310e:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-86289943c81mr16707445a34.22.1794924600528;
        Tue, 17 Nov 2026 06:10:00 -0800 (PST)
X-Received: by 2002:a05:6830:310e:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-86289943c81mr16707412a34.22.1794924600075;
        Tue, 17 Nov 2026 06:10:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:09:59 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:39:47 +0530
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX4rVaKOvnXTg+
 kgw6w//mkPpYEkFcuN/+pgfEFi9vaXNG4vz6E6Jui/FEUuPM8NWAgv6nTB4UPycpqJU2Kt+W6Cc
 q5mGQebZvguTxrpRKrWOgv2vzHHogyw=
X-Proofpoint-ORIG-GUID: Z5FU0M5UMgCW5HbQllHFl9FJgKAf38On
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX71IzUiF1IBjA
 +kxXNM3geqg7hTHK11cpPyuMYYQD3v4SigmtowWwLpmokCexoi6U2kY4+v9FFuifIkwh3Cak5LT
 qi78Jp5Rm0FAZpvKaIZHJZltFHp211kxBMLVXmUSWIxoqFaL+xgdpheUD1V4ZgUIkrKsMsqOcPj
 +HBxrgwfJ+9ilO8UkhC04YWbU9j6NbmCD6k831Itz32vA25HWRnDn8VnEvmuHQn41ZIwwq60GTb
 Y3AwdilkQys9V1YgsFP0J8D07I53VBCADZChldmFNG8J8fXCVX9YVJ2jttNUYfxGzFcivfpMtYb
 XQrmF1dhohaW7OTcVVsmIAA3FxaFzTdxNhd/aFNwX2CybVXWTkiEIhZ67Zr8qfMO+C3OyRWu/vU
 F4ireAUwx/xJEhMIrq6klmf1qsZXrf5AAlrjyRLh7jJA/FxJkOblwGOtZx0nYpoYm68/hk/p9vQ
 UAM8V4/AldIdfxEGJog==
X-Proofpoint-GUID: Z5FU0M5UMgCW5HbQllHFl9FJgKAf38On
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc6039 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..5716c045d87e 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.43.0

