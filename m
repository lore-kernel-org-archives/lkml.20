Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DEA46D2C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248439; cv=none; b=u2UAr08KRncwNaBp8dHXtbyy+zqNJPZu5Oas6iaQHMREbCvvnowSmb/4RO2Az5GR9gkP5MnjQK3PMq9VEsMGKfK18aO+H+QNcMoFhggg/kEwcE2ghrGtawfYJt0wSBmnz2ZeX2J9zhun7ILNRAGRs+plRdJeamhKU/9X8DHIULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248439; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHQUp6fUCoJrhbqc79oQg70UarqWu4bm7h8U5/kDjleXEh5NVtobFn2pgE/rzf7XHRtCzQW9CCQzoNXXQ7tYkj3PyKrE2i5Zer0qpJdgiYL7R9Yegr4LkkBbXNQH1gP2F9V1RAuy83ZIoIplPJmBDi2ot10dhkxUeNfUHZfMJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RD5usTbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzri5ELg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RD5usTbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gzri5ELg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792r1705425
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=RD5usTboIh0wJoaR
	G7pPnPR3vvmrc8rRlrHFPlvrDElLmcu7HjrK1Y2t5UzvzQ4Xg4zqYa8HKZdezxb9
	pV5BVkm+yQ9p5ehsbZKxlGGwXitp6xo3xTOUUL2ZjaIqSCoIpCRkwKVejWhaWxgN
	qd7YnyTzIidkPHc9UMmz6IqCC/IQ0ixP1tRYegWWfbrVbhtokkMf+vfjfGZarz3d
	IVA+TrJERdYNsc30d6dxyZf2rFX46r0q7b2B4advFL2t5GOKkOLJDiQaijQYYxd9
	E/jsAXEUqCApc4OMs44eXFYSqcLnFCYQaWXQ7vrpxXB/FsLbGZE2GrZyitveNZBA
	wm7/5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgjm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:40:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so1074211985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248436; x=1788853236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=Gzri5ELgyGyhbOyPB7QypXsFL2gqouZ/1f3QRk4iDqaWyHb7qL0KDyksZaSUe5/5rN
         EwCt7n5a8DsYqPuupPXxzHV2Na+4UkeTcv4SQaK6C88kco4Hgk6hQ0rFWDoSfjRgzTFW
         EuYnBCUvZq2nOV6r+2g0drcPTS6nQp9yy+zMIdVlyeIWY5RYN+AqYEAajhgfnJmxT1Mp
         VCZ9xR2euA/3Ro28XnHr21mZkRtC10jtsNz5ArHBKQTXue8EZUhCnZcvDFkcX8pqnMV3
         FosEDl5ic14nZ4Fz8piG03kNT1TrqT1EQcBfEw+9T/njaqLyN9Kkp2EXX4UPDodTFovc
         BAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248436; x=1788853236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=aNUcPTqh3m2y75N/XlHte4nqDODfdrIXFIvKtGtIkWonysTxqfvNyfl0OeGuGjns3E
         kSxihH0YbLvS7L1EwATcuaX50YTkNRmm9hl7GaSjCojFPi+0RB1UcQWTtLeuz/79rqyj
         jGkcvuMi8PV4iudWrhjDvDFFr14BMZnwC18vxIOMsFbtPlF+BaNZ6BUP8CgghZ5vpMkp
         1Mo/LyYJ+IU3aOhDdLoZvFt1dq65cHw5DvmrJ3v3e98Al68VDWfW8LDz4DFWUuAlwXdV
         cpKTruhIipJR1hJhrE40YOw7RXnBWimq68d17d4PqV4xjEiOPqlwJFuGdDYzqHFjtHea
         fFZw==
X-Forwarded-Encrypted: i=1; AHgh+RrH0siZC3yNA/bIXibwvdzTvyTAcg0Y7aCTSnZLafehRGbmSUe71Nf9n/p7HAlQBiQLvRQW1CrtqSfr/H0=@vger.kernel.org
X-Gm-Message-State: AFuF++n6GBeYI8uh0muz1Byzu9PmZCWFTNClMKvCRYDcmwMrDJHJzJWu
	rCSx+rTdgvtoKVxkdAbxwWcznbp0AI18EJfbwMoOpqeVqLGdj/kYmAnpy28mGiIeQsBJ4G+hpiN
	2YjTiBLdJppLZP3an6BVvtD/1RxZ3vBCOXFMmi3AnhAZ84shRSqs4GsbXpneNqsDIiNI=
X-Gm-Gg: AR+sD12w1zASBevmfKm2slo9OeYD736QQUr2BXkbyoUoP1zy0Xk1sPXC7PhObPWkMfU
	YBpeM7QPbeE2NOU7zcSvRABhX1DAg92MuSAkqGFlOlngVRIHbIkxLeVvfs7U2jp4BANzOcxmDOz
	1kZo/zGmo90c/uwUuUvpfznUNfU20Mi+zYBjExAoOpa6RmIIz55xagChR7WsGXRugsykgx1QmL4
	mUJeJRlFYIZYzGhUu3Qks1ljNpW4l6/NYE9ud0gfk3kVy6/BNnWMCboVWV82aB8lvioxBUz7Xoj
	h7WHeOhZrwN0CGiDmmJX63kxBKpdgB9eACzlYwiMpDSi4KJg7HNsKBnwQyEfhu8lHhRhbIJyPOv
	QFW7PpZLAFI9+YqDWyqSoHtwtRvyaCyNG1aNJ+28CLv+J4lKzYVSJPpPPdyJMGa067L9s
X-Received: by 2002:a05:620a:a414:10b0:937:6aa0:db7b with SMTP id af79cd13be357-939137b375bmr2860698685a.5.1788248435765;
        Tue, 01 Sep 2026 00:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a414:10b0:937:6aa0:db7b with SMTP id af79cd13be357-939137b375bmr2860695885a.5.1788248435296;
        Tue, 01 Sep 2026 00:40:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:40:04 +0800
Subject: [PATCH v6 1/4] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v6-1-a05b2d04c892@oss.qualcomm.com>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=yVRIHwAXVhXH14MvIsQ5q7D2SW+lzFPAbllEUFjWurhJQ0oOM8BbjapX6dQXsuGSsOZJ5Rb+k
 LqGT9Ow0Q/TChtnSjooIV26OJYLB2zKpBxYLUn60OMUaVPlCntM/jsQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX9UB/azUcgrkj
 /9vWVuMbyIvqT5R2KdcVbxV0zVNZ0CgxF9j63tyuI4sbRNAnyzCHxHDZY8MisTG3/+1PLXr4pu1
 Py3C0Pp9xt0zbPMx1sdAzuT1QIZDP/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX3FhGTP5Wpssh
 doW5Fd5hGBOxwl5fzJ7sExaLskWsCL5jprnU2BAsL1PgsWlcu8duW896Zld8VrywxtTFMmQjZvU
 +FZO0FuTO6zEv9R/NPSBjkAKj5knkmuCd6GkNGO62a/EKEsEJ1Z9CSq1s7/sb8jpxwEOV6refEm
 uhhjRkA7EXiAaBdM9pe7Z6DkSNcp6oQUWK8FWZqbahJgD3wElD7zPQTJLLrCi+p4dcu5fQG9lHi
 46V2z+8dyKUUtraHby31vu2IrBeHoDYax526sn2nXQsKqD5nop+0klHYTUYT+TDYgktVtf2JdF6
 Q68S7B5cBw0XN2K4oVrh5Y4Ek/Ap7bGZ1cqf1U7R3uj5V1TV5d0EX1kwLY6hSpFjM1av2dAZm/6
 MNNcxxe23Qadjd1RzyyAuoe/2X27fWTPlFjCnLQsXExHxXbRXpPKh9ENbltcS6zrJcHCWvuMXLr
 sF1/aqCmcWD7BZV7WnQ==
X-Proofpoint-GUID: L7hi7z27qmqNJrvhNNR-Lv9NpY8x9EE9
X-Proofpoint-ORIG-GUID: L7hi7z27qmqNJrvhNNR-Lv9NpY8x9EE9
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a968174 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010067

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

