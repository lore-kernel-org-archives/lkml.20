Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923311;
	b=ntwOkKR7uJn28owNgEdRNlBSapMsXpCHrqr35dAvtE0D1zcuj05lYuk8zercYwOADo0y
	 DoO15cYuc95K5wwFaK9jmV76PxpARR2MyOWytTVnSKGHLxlJznWq6vvn+i5b430A7mJjc
	 CbZK9WcYrMwUZT9YsOviF3g5wLkpBmR3NI6H5PsNB6XRUo2z8zPBYZrllcgne9d+wZ9bc
	 pj8RDJlme76KesO1D+LWXxZZsXh22RB824EO5+mXpIsd8jIs5DNg6KNL9WBKk9umpFleW
	 FqW2uHsyDtvily8QLZEMn0nVH02auDvgJrPccB0UQrUhAbmc887q+93VqL7DKPzHfqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
	b=vJ837Qr9zdtuDk6ZNejyPJOHqpyTk9s6WPe9SI/IQmKqY1/XGN8sFY0iIr7M6cwZx8Sj
	 ukij0dkvahT4fkLvR87TlID4H8i0ptsSZ4PVFm+fJyBZIFsnBnE4jCC1TggUdnj8hne5+
	 cYcW6QF5XrwyGXyrUBANzD7RbIqX/Dc2MO4AoHM6KXcUjMCeUyKellbQcvk9I7MWDuqQ3
	 3oRF0zP9Ssw7YbXL6yyQH5RPM/qwBmbODZM8yTOwAwygk4Lt7i8vaCxaBbtwWN8B+OKvF
	 bXqg8guNXOBeBU7ELZfv6VlRI4S3yX/Ra+9JUGVt98JMGT4vo9IY8CephamA6wYknYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh9Hl1Ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0wtXWwC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29666606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29666606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh9Hl1Ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0wtXWwC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1CTP082120
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=; b=Dh9Hl1Ns1H/p632a
	Sjll+Gg9OITC2W1dt/qrEAHy70T4O+FRHr3tgr99D19M7i9SbOgZhl3NJxyYgatI
	nGr4zSxrwXOSDRDbUGpQE0ehyQflIeYHhobsBKMd8hQbMKfCXI4wYZInQE7J5vQx
	/fG84HlYpn05Ziv4iLDGE2Be55zHqbVXCdFn9LNXUY3XhUoIGVtOgHPKV1cWQ0Dg
	IngzQfWskJFSj/Wj4bnoEXT89tXaFSh37y/hh7Uf5laZlRHJCtnFUh5Lt2rMO4x1
	bCbm02lkhXMmRjj4tz1yLYOzAK6wxlwPkMN76i1nv7HhpAFT2eYoNGNvYvG0KiUW
	X3wYwg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr1y0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5712131eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923309; x=1795528109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
        b=G0wtXWwCkC2Ki5oyY7M8zueSdQhbYcSm2nvs0qDadyCMGunmQualzdJ2LIZ50BrOGA
         jYfvtswS7dtj3HD6jq1djGfFMYSOcuQloPSrQ9rTMMQUewuy+WiXU1ceUOxbuyHFbjGP
         xRY+BdcUhYY9O6KN5cGCvPwJiKLBTKdYzzUq8w9ujG/KuyPReN3Vv8aDzia15scq4Wck
         Uc4wBSQfjjcPcsPQGT8zmSBUdYzNQxRqLhY5wIda3GW/m6Sxbb/PKtBf+oc/4g5bBrhR
         ZfWe2s7zSN5rzy2eVoIa45mqmPdrmfPV3Pt4nU0RS8ZcqB/8iBHadjK32fqv8+N06JK1
         Pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923309; x=1795528109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmrEMNg4q9t/ca7wGc6lOJyaZRJ9HdGVgitj8Hk3qW4=;
        b=QfEXsUPnJ+VRZCerHUVBIzhud0z+urvS4PwBaodTMYJdgHPLQRhZdniBksX5AFZg6r
         Gz6VrFJP0lzN7+jHZpTgXZWVqtdVUcwH81J1CeaSlF43kiRmGEIS3aH3tYTmixfGkdGn
         5X+9T/0fk02jEpN3NMRB/56q3xzM4D+wM1Eqyvj3NVpXuG0WWRcbs85b34eChlNM5iSu
         sZD3QHCpZ+yOP2pURLq0uU+Loi3qCYVf7ty7v7KhkDiUE6/FgL8kAWL5AMWdHVM5eT/B
         fZWA3e3+8zwYdyhs0AqinOKPWWYl8FPLeBAkvLYCbrhRtr6SdlKMrlzVbt9i+Dw2i8jG
         9jNw==
X-Forwarded-Encrypted: i=1; AL+hErFQB12LY67lClSSneyPZmqedbTNEoJDAEmnxjr5lv9vIT7/PHaS0M3LbKmZeEfCvqz9XmqYzgixVxe/JR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I1heuShCyN4Zh95AaMPmr8sQyeozJI1i40BDZsejY2Wnyu3J8
	T8f8lWAoVqMuR0N/Zt56xRAKLWx3mA+DKlWSfT4hrr73wQku0SuEWGKD11xNWyt++qtsq4rNwM6
	frnRYtZhVw5aAqJDMH3w2SeHF6sP3sjunTZBl/YnOhxbc/fANl9TNSEp1EGjylfx/grM=
X-Gm-Gg: AYBFou0futYgT0cycATgNFKRTFnbKu+w9BbYsmw5wBkZMQ1dNZ8FIqEXziGV/HdjYzV
	xh+qymLCZdK0Cf/7SzzUTqbdqi7r2TEHaQIHobB5rbS3tqFYrTmljF8akwX+lQrEvnCn5HHsPcG
	BYzvt2mXNSWN/S0WQavk3EiHw4eP9S31odv5XKXwIsbQHK/sMLu74UKLnGbFSgOPHJDTy3ORBXl
	mEsusolUHBXmZ5yf+o/PiAh9rr9ydY0rzQVHIVkWlI1dAWb7i7ndVYgQmVh49OFzNCVEmZwJwiE
	Z98TuFuBVhFqEfs2drjTY3sjIq+U50Tec/SeMzOxYE5/taYztbPIiWTK9CsW61WdQXn1KM/JGJ8
	Gt2ze107ucn4x+jdFcaxATH+fLAWxfmdnIk9JMSLl6PH65+BA5aSydtI1pD2EPKKt7oO3ozToq5
	dwHA==
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr10968211c88.8.1794923308992;
        Tue, 17 Nov 2026 05:48:28 -0800 (PST)
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr10968188c88.8.1794923308321;
        Tue, 17 Nov 2026 05:48:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:18:05 +0530
Subject: [PATCH 1/2] dt-bindings: usb: cypress,cypd4226: Add
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-1-a0fb052c7fcd@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc5b2e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: R-Q7V4jUJfHUpqOsMl3aMH1QJwdQrpfL
X-Proofpoint-ORIG-GUID: R-Q7V4jUJfHUpqOsMl3aMH1QJwdQrpfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX5h+oSJYTY6HB
 Jze/UdeEPs1nVd6sxdqukaXrrTnXxFwOKgbbaTdt24MKkPz0d4/+8tpVuUPknYtpdIF0T4zlaF1
 eolpPliMIs7oReC5ymyvZG4VTxSYEu5hNlYk/pN+hVB9JuxIxpC/wokqmDTOlxEgmJvsqhFyalx
 G2ymrRJMVPp1pklaVVUxSEG0GZG4zXwxVdbTmku7SPLLe9SehDrf47D63/AGh4C8xYWGt7i2ej9
 3F3G7DYG/pTDTKE0Ed49wh+1hB+kzXYpcVFx/X4IzBU8RZ9ViztOQ+eXkxTlokYiZ0aYxrbSfCy
 2cq6eOO+V+t3bT3kjrAiBPV8Tq0lgdUB85FqQml/voAlgANaLirYZNgwpOepcoTbe/NRRXWD9iI
 ceJwEXOM4Lh4TCiURGak8OnSb/KWVTzd9f2gywyFg5d2X+1NLXB1oI+d9p511h+wzwN3q9c5/ZA
 elOS+/1P0X4uFViJXZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX5N4145Z+lmOj
 B7W7n/WNhvnsta/Rb3q4VEo4BrUQQI2UV0prxZLpOa8OQHnRXwy35/G4vQFkKrx8tN4Qql8dpR7
 f/+QEJZRG3JT7TDFdpHR0T/TkFCY6Bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170054

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
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

