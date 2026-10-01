Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B148409277
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840805; cv=none; b=JPq0VT9NOHGqOzYLIKlLDQHBokfqE9NMfSYf+rRN6AgJ2pv+ELgSDfkXrpJwwDxAxq38K936jX+7YKAbVVU09J7yuWRloTAjEOtVuOEimh+ay4q4mx9l4gSG0hNu1ENh72zrT3TJ2AAOtMEhmQFGAdFBU71fksxRdCn0T+sbEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840805; c=relaxed/simple;
	bh=/PBjhODp4FauEwXtFO3WUy/JrxaP4yrhFxuvV1ViljA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F70B/vqPfDQKA8ajmhrcluWV0xzuPJzrsMY0J8AGaYxLL2A+pipujfa4mjTNPmkrs/s6vEK5d3u0BRT1gGmPwvKGQvllXS+Q1XlXUY0sEvBhct4hwdw1xuOKEO31DUprGXXSvkPuMZnAxEIYy90PwiIYydJ9nkgXrmfIXjxeFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxvJ86rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbJS/jSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxvJ86rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbJS/jSS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xtXf1661232
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=03jFD9Ri+WK0GS6qcD3CH1
	sAGysxpXHnSn+4rqMos/k=; b=DxvJ86rAR3vrQ02j9womCmf1dN75wSb+NKhalq
	0k9hNRCd8fPSMkb+ZpHlbs5zSGkD+mlYx8Y2bbTW05lvw7+eiaL+hMUByRKd5Rww
	oqa1aVyi7J+X8MLC6KWQxuj9r5qwTebO1rYtDA/hiRO2BqQNa6EIe1F4egU2lxNu
	49bJGFky1/GM0SFZ79sc1CC+ZSW7WWx2GTFxbCvTKdfhY0heZl42R4MUp4OnBIcF
	eVI5m3F8zwpDrNZE6W6u+usPdZ+FRR4CLBiTbGxPKNv8HZjhw97nvDL+cFocvY7Y
	KktHDRrW1ZQ7lpi3HNjVNlK4wEBcVr3QJkM5Fm/2upGJF7nA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pk44x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:46:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1141482485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790840801; x=1791445601; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=03jFD9Ri+WK0GS6qcD3CH1sAGysxpXHnSn+4rqMos/k=;
        b=dbJS/jSSif8isLtdyrVrAbNVNSrbwDFIh0o3k7OnsUnlSeyhdsvudFH4SUhGuA3eEW
         QcRif91/FHJz4owVRnMlFJjzG/hlH9qdCNLYLq6BF9yZPx4JPB/qm/19v+Tq62vmKVny
         3sXBxsuupwekZQLbkiLz1LaunHbzcy2eIRZvjxg7d2MmG1XSzZ4ko13vVwDpiknINFlR
         b9srFxp0c9kktm57bncF591+Fi+V36v8HLDO5ECypqy+BMhSYCrOWBiw7G3+hHN0W2fh
         wIhUj6hZA9nKq79mW/h19wdI+T6r6V1gzQJcsKxazmPKp16Srpvyv7sJZqBVIl/bJEor
         F/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840801; x=1791445601;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=03jFD9Ri+WK0GS6qcD3CH1sAGysxpXHnSn+4rqMos/k=;
        b=Feh3d3blObVtSJn07LhdGUZmO5M6nb22Zr52MYr2o9v826uiO6fHcaN/mv67uyiWE6
         zwHwCFmRvuj14daZNCJ7ZiS2NJkBvupbu22rd2Ke6qjTmFbNDcrfccdcnzSFjjE0qrcN
         IgpItGDIHYtYyt60g8ec/oZoCjBzwOheOzJDSrB4BjRIi+O7QytkOE6JcJ1Lh1zrK81e
         2+VkPcjb0ffLRmAukiMHHui9tBwC5Ojw+BG9+huEufJPmBoUCxiNXqup/84n+QUDsKh2
         hrQs7zJUv0TZRbaEJOmpKJdAZPgMfkGYaG6qNbxf2fPjs2xenaYBQVmCdtI+5RSnoMNw
         UZ7A==
X-Forwarded-Encrypted: i=1; AKwUvBx0NMh1mI43/3ek0vduMOLPHIsLTh0Tgq+mf/FeautNMwdIMedvd6C395sKS/eP9KfNV+At1VudRcOwyhM=@vger.kernel.org
X-Gm-Message-State: AFuF++kTS/II+vklVEL8BQPPw3lRg6ySjpglek+vt87cGRywISo7277Y
	IsfB2nwRJ4+de8Iq6x5kswnmhq2cqi52PBBtIR3IMC7VQOkR2EKqFfsq8TUmudAsgN2zdn8Kv6d
	9PHJGe0BU37/8WEEv+5D0BIGaDm6Jkn6C/jPoIyAyM7aS7tNYwIlDGpl01guzhqstdvE=
X-Gm-Gg: AYBFou2JBw7DSrrX8LEK6RY+GySKHKDjWh1QHf5bz2KI95PkVhbrAWZSU3ikaJ8Ja+m
	00sYoWfKTGweabRVtU9KmXfxOgWlmbEvFNsCRQqwmxe7FFP+N2rAshfyvZP52GUjdZjduXxhevi
	idTsyNlLsDg99VM8S0K8AVvBwjYtNOadrG3BlGaPSTu+rul8A4DFn6zEtHtLkJXTR/iJfOoJ0c+
	Zw4mHk3lbMq8I5U8pPXjCl7Z7iS8Iirw76fkeEERG8ZyUOyxGeo5iOa2aUbUDJGG60N4B6EqsTb
	GX6vXOr1zTlVDddDrMZVaHHD0iGRFMAtRZdcPzgSa9WoW34jP1Ho/KGPtgDcNP4La7EHt3/HK0F
	RjtUohJ4/
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ca97c6111mr768901285a.36.1790840801033;
        Thu, 01 Oct 2026 00:46:41 -0700 (PDT)
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ca97c6111mr768897085a.36.1790840800398;
        Thu, 01 Oct 2026 00:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f923320sm52034455e9.7.2026.10.01.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:46:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 10:46:36 +0300
Subject: [PATCH v2] platform: arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom-hamoa-ec-suspend-irq-v2-1-ec71a7cdec79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANsPvmoC/42NQQ6CMBBFr0K6dkinEERX3MOwKO0oNUKhA0RDu
 LsFL+DmJy/57/9VMAVHLK7JKgItjp3vI6hTIkyr+weBs5GFkqqQl0zCaHwHre68BjLAMw/UW3B
 hhLzIlUSjbVMYEf0h0N29j+1b/WOemyeZaR/cG63jyYfPcb7g3vvnZ0FA0LZUZ8xMaRErz5yOs
 35FpUtjiHrbti/MLxaV2wAAAA==
X-Change-ID: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/PBjhODp4FauEwXtFO3WUy/JrxaP4yrhFxuvV1ViljA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvg/eTkvkEBziWCnubcDUDp0JUzkIX3T5lAy0g
 rIX+dIG5RGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar4P3gAKCRAbX0TJAJUV
 VhGuEACk7j/6DGYiUlsVCwE0OkeDQxuvsL6BCa7Z6Ijsj7PyPxvnWKjALhlW+UV/jmm7/i73QLk
 xI+TGh82ax9MnTffBPNIxc0NtbgptuwQ9gRnDA8WpcejUJZhD6eKall8KHMfmD3xjlZPCM+LqeZ
 XhwrO5QpAQLb8vfI8cMdGyCy7/5c1dzfOqfSmztwiRF08vqrLRaSu7gl8L6U8Ur+g4WSOLtQ4Y4
 X9UJn8Bl3K0yORT70yspRukAmGVGnRctMYyYYHIMpQWlUt/9Yi1zQtbPSsZ1JLf/0PLXA+9oYOj
 rwHv8YGH8FOA0nqV4CrOvvlisP629vAtGeiitGaJs/OhY1Ucb/WCjH76lSYIjHGJyyZXuxyvH5k
 ltvNny3SO9FJjiGBrs/6RtvPg6IoMZyuznOMeirQuon/0BL2S2IBPOXHBDWpDnqcdZaip9HRErs
 /NCYtTzj+JtMu2ifvm0AWpFPAxqX6nuQ86upaZ9YKdU2LjoPwvSOTzVeO/0D2iCyMAjF+zzvQZ6
 ij9yYt2gQDMcj/n152ssnNOtLX9Y4/6CmDYxOGz2ZoVukcZZevGPEB9ozVnCkoQRkq6vd1uuMX4
 jJVr8DhRS7vZ4FPYbrb3VbWYaLFyT0H1sYxPVhsQoTsmLzy2OvstlaWPD+jtAkJOboCRSNoCIhG
 T91JQycRK4ZRkuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: mIdVOJMWVTXRv4t6B-4F8FZEjxOyIj9I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfX4meehACPGmg+
 XturVj7GtRVXsWObn2VU2oop5DFUJ78ZkFR385KoGtL5mUy9rG4STXIXkJ0S0uNsAEH4c2fU7GI
 sVk2xVso3UjqkzdQFS3d5tHl2mh827s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfX3N+ctiHX+2cI
 k0lGCGy/vVzvU6prf0KddyfNTAdROXv+QQvhb1XhKS9md1CKMyNNGyiaHn5FVNsv/4gO7UTYfnN
 luI+5Xstq4cxmvxi8M6CAWIYg4u9lgZhGrHoPvD+73zyTQmu9l8t3w02s95lUvzTq9njjheisQ2
 XGjYMbQNmLp8kGO9qWdxWZIAIIKp6LFXrYY9DTrwTdSPmIFdrUAVd4dCf0DgRt+2wTXXjcaAQmt
 x844bFbXZCKl+WPOu0jWe3CsfTc8PUaDgUY+Bkg9htB9VjcRyCJyj77Wwi8ecOnRz/+FUgDdhsb
 DZo5Nug9idDee1QYrX4EEl/ABvE0SkCtWGto8Y6+Z/AFuB04fw8KiVZNa268yzrKQroaiOR4Atg
 Ukz8Vg7cNU4gfTYPq68LTMauKjZUaHIi72HI5ordlbEVsLB+kW+CQc0+r6FZhPES1ZCupJXoNQp
 6LmgdVJbV6xigWM2e/Q==
X-Proofpoint-GUID: mIdVOJMWVTXRv4t6B-4F8FZEjxOyIj9I
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe0fe1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qH2p2g-4CMqcrQuKSa8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010030

EC SCI events require I2C transfers to retrieve the event information.
During system resume, an SCI interrupt can be delivered before the I2C
controller is ready to handle transfers, resulting in failed event reads:

  geni_i2c a84000.i2c: error turning SE resources:-13
  qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13

Keep SCI interrupt handling disabled across system sleep so that EC
events are processed only while the I2C controller is available. This
prevents event reads from racing with the controller's suspend and
resume transitions.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Picked up Anvesh's R-b tag.
- Fixed the Subject line: "platform/arm64" replaced with
  "platform: arm64"
- Link to v1: https://patch.msgid.link/20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..d34afd901324 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_EXIT);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_EXIT);
+	enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_ENTER);
+	/* Keep SCI reads from racing the I2C controller's system sleep. */
+	disable_irq(client->irq);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_ENTER);
+	if (ret)
+		enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_probe(struct i2c_client *client)

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

