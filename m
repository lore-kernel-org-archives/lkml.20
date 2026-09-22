Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D87559C92
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091142; cv=none; b=IbTZHuUbt+QJkeGMrs6WsggtqQM35LB8eAX38JoOiavJejVsioKsTE92tcO06iGXjOB4E5NX3sehIW9y5J/yD1aaI8m41UBJd7HLjqox4txhYJRnwcvmwTStxRjb6M/uHcXzECKnBeoR7a2xjBkHJlbglBdOLCjCRvz/drR6JfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091142; c=relaxed/simple;
	bh=qQ+8A7jlgueIaNxtKQ5naiv06CQe+YVVt6R6F/kOjgk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h7cD7dHVjtarOoviSMqvU6LDIJo2YMDe2XMzYnfAnOZ5db1JnFl37W/Uyea4iroJcFUGYMBrYT7t5LmrDJLA7FXFTB/33loAC3l6yVd+tYD7/sbNqk7I/0sKN4e8P48HJV5WDeH28uj52jRPcPRECahN1dYiEB67GZIqCzdBb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fic20CR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvxQW8cC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fic20CR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvxQW8cC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjIWO449489
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/p0lRupYwuhASYZA8idRjF
	cEvQiwEq1WLL963CYERkQ=; b=fic20CR8/WdMqlYLe0WAzOmYBwgwwWhgyyI/5F
	Arsz7977b4kCmhCvJV4jylF/aNMhZlviAMGBbSJwaD0ILFBR37BMEHFGGQJjmTyz
	wf71KkoIrim0sxt1MrUE0ClOAvu+JL48ZIccKUfbFskRU8P4XstQ1ExTQJ1ePHOK
	Yq+NJsqCh5zRIns50r+F9jwMCxGxHEnMX40nH20bFHwXbhGVKvzTHoqi9OtJ+H2e
	Tkq29mPT+vv+6rur0y+LFTXNdYSMNc//KUHORdizDrUn2ErMO/2F4JaaVfHmZPyv
	HdhQR13FFk27pacqIIwrS9lQZW5EZ5MB/ozU7u8LHvSZz+tQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt3a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so56255a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091138; x=1790695938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=KvxQW8cCWkD7AWDv1eiWCmZCYlufeKdeJjPknpl+sJe4ovjbK9MQPfizqJivswhicj
         YbsylkHWzW9TD1qa3WnIeShkjZyzbFGk2oe0t6MZGcB9WPbAl5ogLctmR13BwA7r0q2P
         RvLujPK2oqbzf2RLhKKJWxI+7txS7Y3URVcDrIpHrv+/Y8JxfmgiyeHi/LxUvmapHTSJ
         dYcl7oglEZ9swEPaAsXlg+Uu4QVhkA3NwOSrXCoPZjz+ejRxkwnwv6p0F79vdzs4RQlO
         /G0bMyNBFLPVJ35fYnI/oE6+ufb0nEIqt4BSOAsOcgaytRRxDUOkV6Q5drRPD/CVwFlK
         QXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091138; x=1790695938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=AwKKViS365k//ef2zfOihhHpSvvsXdge836H0WdAe5yDzTeJNlGCstPjUwt7Lbe70k
         mG+Ogidh1W4fYFVlQ9d3eVCld5jH9LoGOLn4offhMNBVUShtx7pVQStd+3G9YFZPGIzg
         bNsS6wYG6HVE37Szm5WiqdXgcE4k/2kFAW3vQtXOHII4xcQHDY0EmEfFPv6qYKCBAmiU
         64aRLuBUGhbxQpZu2XOskAhQDxsixjLRJw/4YoyzLkRN8UvEqMTiIZTGJsjjy0S9UcEf
         gYUNCHjxFCFIPTcC2On1Ysf7sgVTveIb0HYOQgmOnkOrdkJw4xYbcl4EPZqaokzB4uPH
         i9jA==
X-Gm-Message-State: AFuF++mf8QZhEORdY1sEXsmCEkk3Xjxb7gGOoWZODpqjh3gd+EdZJ71p
	z4C4g1thrZ1HpbAnnHKpflkrxvuQe8/TIdrBL5486TxOBk/5bF5Bq2zBGFrvQWejf72Eq7X1oAp
	LNoJyBwQtqH1AGA+zNdTwWTf5KN7zo0Ud6EyK7sN0MzGkY0Hcq6OpUNpz57mkxYr9QPE=
X-Gm-Gg: AYBFou0gsm4EI+hlGf44useTIZDnB6VbwiLfg58MWTm7o+8wS2RiIIHnR2pb/XSUcnP
	ZNSEO6aZUssETHeuItsCcIlO636ztSq3iUHuLma7GWphF3B/GZ9d7FUBZiMZdbQeMlM3ciC2qAw
	39jxABJz3O5Lue25B33gpF/jUi8XaVakQa7fQHnADpL7eST6BirJ3C/N90gggEHI3+4ooUXO0Ce
	7Z2cLdpRwmESALhpUzXuSQx2gO9o2VZ9rlFza281G9Chdkzni0USj9QwPaoCKDwLSrBYoWv+/2W
	FYu9GZ7ODW+geOLb2YRgq0kwD+hcXjoPwcq8hZ/phFbOJGOncreWKivkBV7qR1TX5cudqTJCMz9
	1Z/2JpyhJLyy7YfAvWknh6YN56kY5qoIeeyk=
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19445515ad.53.1790091138143;
        Tue, 22 Sep 2026 08:32:18 -0700 (PDT)
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19444995ad.53.1790091137602;
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Tue, 22 Sep 2026 21:01:58 +0530
Message-Id: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6fsmoC/2WNwQqDMBBEf0X23EgaidWe/I8iJcZVt1Rjsyot4
 r832mMvAw/ezKzA6AkZrtEKHhdickOA5BSB7czQoqA6MCipUpnLi/Aj3T22IrNplukq0agrCPb
 osaH3sXQrf8xz9UA77fXd6Ign5z/H1aJ27391UUIKaXVuTCrr5NwUjjl+zeZpXd/HIaDctu0LZ
 Y50NbcAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=2083;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=qQ+8A7jlgueIaNxtKQ5naiv06CQe+YVVt6R6F/kOjgk=;
 b=AKVJ7umpg7/EVOsRH0kwdxgazwLWrXZYnm4QisJMsRwzeAOhxWVnXp9zpE1YFsdDdYj0Amty7
 JU4mjs3eA+CBxVeSMUZtPJzRS7LXuX8nDFu47bqDjArxL2D/WmPidYA
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: ZtlIsaTyofZbUoh7I0NaeIerbnA85mjH
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab29f83 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfXxsG76v/u6TyO
 2OEMnbx4bwAg8hMdkjtKeP3JH9+Z0SX+I9ycckJWmF633r868AAD5hyfiLabALxYMsHKvxtsfaZ
 gbqGtsj4OVcfmN9c9mkv0MLKZ7w/aC6vcOCCEt1niBkaabFh34B+56eAlhLs9WKPspwpkA2nk9h
 wEvM6MZgPBNYVqkMYCOGBO2j+BEW2mDHs1NVlweprpEJC+PTqNz1bpab5xopVB5EpTa7onpqqa9
 Z9h5RvoPdY+uJAiik7Dj1L82de7+76iic5oFUoZbRx8+glnJ+mPBAu/OwrzP0hBrBZnuJW11z49
 +V/iUhiYxK15hHKlhQSQUsIzxw0WuWyIVAVuGkHsH4tVM21iov0iX6BHBYDZMmhF3l430Zm6VkN
 XT1wxVlVRTwjd2UiuRG2eakKhOIIoblo+c3M5FoxFonX1IOemgeDTRZAQEYx1CxEGYi+yn9vdDf
 4HYr01psEaScTHslzKQ==
X-Proofpoint-ORIG-GUID: ZtlIsaTyofZbUoh7I0NaeIerbnA85mjH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX1LJExMxRNSm2
 wZ0C8kh4uASKQMOZY+QNXVOirpiuwEb2R4GhsFiS5ucVCWPmzmEQJ1wD0cSz1RbquK8jwzVkbz4
 cAC8agMlceFKSLfQubg+LrhXIlfmSf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

