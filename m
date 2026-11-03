Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742266;
	b=yD9kWatn+m86kqARr8gqVLxlAdxOdLM0yTDM8ZgUE95N0Ui1pey43FgJPXsI7ZT3ib+K
	 N0XSaa8RYzSEYCoW2NqxKGwSImhQXLB+MwMIVJwMK4Oc6BbfgVylIS3MoNaXdRsQsr+A3
	 gBfT4/JNGaCEhJ95451o5utiWoA0kALP+cRUS1tqRQ8NvXf84/sID2VNZaw6aQU3Gms/m
	 Vr1L5U+tPVHenjxyD2PwAOhkCG8F8iMvo9BWg1j/mEOJCPnE4xp8TknpeskaJRclYan06
	 DyRPwIA2Sef9MOzaaI/uMri5xYf/+iEEfU3DMr08UumvqGnm7lJo6At9OnuSVB8nsfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
	b=IDUnAMHGacwR+gAgb1tjB0SAZbpCS8W1DFPeNtL8NgU9NguGaNpgnHyzD7y6TgDiA8vq
	 iUINkkMbKDP8Te/HfmcaH7HkAt6YIEmKiPs2ppM+C40/57kZrzu3glzpmxQZawrNJnQgQ
	 OaCp9/N+YtOzaH9PUry2+MRYFDm1VqEAJe8ESF7KyOyjqq4yAQdMh6qRYKWp5cQHy46Df
	 IlenTxZrZiUbY8FtH0PRv9Dsfede8g/jBsr9yg5tcHgp6STCQ0OTxU8X/YiDPtYREydbp
	 tcfl4A+rHECKLuatEceCyWrpynKVIrVm7/kgh8l33abcMP7izOSO1N2rOR5TjRJXdEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9ml9lev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gh0FKk4t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747E606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7747E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9ml9lev;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gh0FKk4t
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKxQl445703
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O
	9jAXqPXg=; b=g9ml9levk01tTILlao9CA8SRgQa9XKCvYOA5mJX39srXFuPMF2g
	lX1lVpSADQnqSE5AQWPZoPd5juDE3cEbEgfhhn45IBCmiHc43eDM04TDRSD+PV7k
	NsmsoLSd9fB1y/iHO6a+LiVwAGcy99u+5dfTXbvw5Gc0WLdJv/WHMP808xbgBaR7
	/TiulbR2XN3rcCGntbZfFq5GokWP8HWQ/Objqa0sZlOSyeMU3SkVndUL/4uwoiIE
	Z9A5AldIrugJejiNlw3cMruNILm/WVHAFvrXPeyti6zEj+g4QGSGl3j1faJqPIbr
	w+OHMyRf+idKiV//+HlOWAHH2tcn4uuXhnw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mrk9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:44:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99870ee564fso52639241.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742264; x=1794347064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
        b=Gh0FKk4t7r72BI8T0lbhKQEvm7Ns8nM7Y6Soxp1fPn6RvmodjWZHHov7WnCpOcsDI1
         NaUoKsRqzXekVOUnPWfTu75IiF/f6jAanhx0M1Aj/i3g2DDZywvUZtTczUecwF4PgECd
         /n1PrG49WxUSy9bGo7WeBLxi6McyBgiwKxMZvPCHfS64bSpg296YVCUleQIphR6FGQn1
         ViwEJV+kCgDFq9QssAnt/9xEaNMaVm4MWcZ/PH3G0eiT+OEf4zkyjP8ExV+iFRUeleaj
         lUQ9riVyGACh74eVkkoSqrc3MFWsPzCMialNIPZF/Y81zobeAMya/vqO8E7G1tevgIse
         exQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742264; x=1794347064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
        b=TQsZ/zGEAfywIEPEVvDq1HC4NzpZ24+ncEIJh486DECu1em7YgLnM0n1J9VHjwmjZH
         2OJoUFKIBWgmPUbWwKKDeEL19nzJs1iwb8Hl0lJl/Loa/uVhc5MoKTtQ0P1G9j9sS6iT
         ghcRvWvodLvs3oAWJQthBr1EPwkKNJKQme3Zo3orbQpNbaAYgZ5LUlEl0CfZsWaS5E91
         mqMRR0v5dWWidfaOqVAy9FYyojOagEwpJpbQEsprSAsCSXVAnIGQ7Anz+PDupZ+bi8Bb
         dPKgkjuTP8rVOXafG4IkAVCieDZlYK2FSVp8LsR0xidgZMHXgEMi5f/6A9tkP8yzL4DC
         I+hg==
X-Forwarded-Encrypted: i=1; AKwUvBw5bXpZkBBLN5k6rlEn08vHSBZMx80oazQf4+nmjzaSTCqJMfwuExrS3+jg38up0eNEw/Dx1OZlnyZgxgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nd/rPnQriWvJ3FeJsHooxFpvjiwK1HbU5MUu/YJ65y7/xdDhZ
	i6Fb+Yg/qpIKLQAyOdWigjf82KLyTndCPq6Z/wci6dR/wYDipPAXJci8F7r04mNVlAqErTrAHsW
	XMh27u9lDRpE1nsjqKCIDOtqSR0rkYM6jIQvScQHi5/3Ov3hDUj093bEMP+tkXWvsDZo=
X-Gm-Gg: AYBFou2CI4q3LSn1lFSXO+cEcus+1oXRYbSkZVrk2JOPFjA+/KZIUCM9THiDkCJwAKM
	9ZB22RhaZFWsYOHFujfaPc3yK8FwOvkJlDzm+BzcEvRyTkvYh8ukOOkPA4FhCgWkMN7QVSr+nU7
	/vPRK8Fi5vcRC/fnJFekL4ZoTDaQ4ndpZqw/iXdMvP6i9TrGg1MIGZ766JzfRmwdi4o5s8wQAxz
	ygThOSojP+OcbH9kf9H1WzuWgJtyASratyKFoyoZxQ3crnYAq40BlBgAEQNQ1niXiOt6oErilFr
	pm+o8rILdNR3yXxmZnX2uTgKCOC8DC9wmuICbwwJvGBPVP186LvIi0K8fRir74x7oG0ngTEGnah
	l2oiwqJHakHJXs5VdD7HLdaZzWhlbpGozhjDzoeDSTjxhgD+A1shp9QRo3tj3XYd3o3U9jvKsH4
	vm
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7d072615564mr6302513137.12.1793742258840;
        Tue, 03 Nov 2026 13:44:18 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7d072615564mr6302499137.12.1793742258366;
        Tue, 03 Nov 2026 13:44:18 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:eeba:6d3f:bd6f:18be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm181674f8f.21.2026.11.03.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:44:16 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-pm@vger.kernel.org (open list:THERMAL),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: thermal: Use signed integers for coefficients
Date: Tue,  3 Nov 2026 22:43:57 +0100
Message-ID: <20261103214357.2700244-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: r_KKtpU9ahheq6TZuJ-dXzCS1QqGu1uo
X-Proofpoint-ORIG-GUID: r_KKtpU9ahheq6TZuJ-dXzCS1QqGu1uo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXxlx8Nn8z/sXy
 rZ+l8l+lWY0ZowjaYBTHbxoxf8n7z1/YguXkEs5KXxlFPj+1JSkj7rRbzboq9A/uXGeJQaYNFDB
 rZAY487tnndtBQpibireuCdRWTJ5dNr7hLS2N4Xngw1ns7j/VfoPK0UwvXxDxcNI2h8wN2M6Wa5
 rF/5qcLOJZzWtVmkavOd281InY5HCHwQei9WwA8/FNOELKF7Eozaw/aIP5Icm0koOs7XnSwbKaF
 gurMSeedx0Rt4vbTrrZxlVknTegFWfmyrEwRCFYDc1cY1Htz0fz686laH1dUXM6fEoFBPlCRVkD
 EbfK53qyuHaWzSsTab1cPxX7EEVUKBnxj5WCbZCtJRfGM0TdmeVpV/5Wk0ikMIxDshOc2LjOsKg
 esHTBcmjpnnC6kV8Vz9ihfkd9488uTkoVHgIcesZxf4mOPPDRkv1K/p5iyQRnELdNVD5d0dmb3s
 SJ0LnH2NMjxUmMat3wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX0oV7/OUrUOyF
 RWQK6j3TyWMj/hY82MaUKNxkko4QMnJiDzvoh2kiLh+gMz2UbOTtg9zBkzwklrGJvSoxQCxcm/T
 wzJ1jNR/1ZLJU3Clayz/SG6sWPwJdvU=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea55b8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=W5l6zmR3omWN6YeRZy0A:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

The coefficients property describes the coefficients of a linear
equation used to derive a thermal zone temperature. Both the slope
and the constant offset can be negative, and the thermal core stores
them as signed integers.

Existing Device Trees already rely on signed values. OMAP4460 uses
an offset of -9301, while OMAP5 uses offsets of -1791 and -2992.
Broadcom platforms also use negative slopes. Declaring the property
as uint32-array does not represent these values correctly.

Change the property type to int32-array so schema validation decodes
the cells as signed 32-bit integers, matching their intended meaning
and the thermal implementation. The cell width and binary encoding
remain unchanged, preserving compatibility with existing Device
Trees.

Fixes: 1202a442a31f ("dt-bindings: thermal: Add yaml bindings for thermal zones")
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..72e419124f98 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -101,7 +101,7 @@ patternProperties:
           thermal zone.
 
       coefficients:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
+        $ref: /schemas/types.yaml#/definitions/int32-array
         description:
           An array of integers containing the coefficients of a linear equation
           that binds all the sensors listed in this thermal zone.
-- 
2.43.0

