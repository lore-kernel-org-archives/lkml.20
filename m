Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323668;
	b=khHhfcgFRNJA0jeTgdebAfCIqKCDAhL78I6sEVPJDSAj2ixZ7zh+QnbUbBYka2TFO3rv
	 DIKpCA/431kY4hgySjIYw09mLNHS41I7p6Aq2yJV4UZ+/kL3v+m96dbAj39Iw0rtebh0T
	 1A2V7YPiEP2ZJKQY8rg8XJKX5qoJUSS+2liTsIVI1Sue2O7mb5j8Lvv1Y/gozR7MHnU78
	 eUTZ+Dn3R8efHAWjirEU9SD78dS0adjec4IO0Ey9qdf4a8WG4UP7xIa5neca0vwzRBnuh
	 idrQdALLYJ/A9wbMnqY7cKGQ0uu4yHv3Vz7q96Y4e7LDCufQs+MWfJzcdnpVrGfrtQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gERlYnqMraEDZsYQky6xL2HjZPffZDUJmiECrM+pxkI=;
	b=tPDCljncVVyabH7fG05zNS5Z2qoYpLdJfFpedxR5is8HyUfy1JEcroWxKxQ1Ki73sgXE
	 rwUSFZ1EEC7xGxroR7xn8WOVu9oQVAmGjP7RYTFo+0UAxikwvRf+lY58NnYJWo4nIh1WN
	 MoWwne40eAhtMlsHykhJGH7Z2PMftB67NMlv8oRsNVV0g2W2ntSBcitknWAgRcRViJ3gY
	 OqgJpKlSztmmBnX3VrSrSE5YmDhPs1wDqYzs6Osq9PnkJ1QmtIziMSEWrx+xfctpcp1Hu
	 QvvpOBveZUZAUHTyMdEdNhfKNh9aVzMIWy0ipyy8dgxD8T2DD8MsE2LrYq4s+MZtiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e2MLxo4i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5V89kE2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823F606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9823F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e2MLxo4i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5V89kE2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0CM23713588
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gERlYnqMraEDZsYQky6xL2
	HjZPffZDUJmiECrM+pxkI=; b=e2MLxo4iS/q0ToCm+puRAkVllrVerwoJKzEhJn
	SINSMVzJSTBcrgc3m4vxAe7e5zIPzjI42w5XVATd0nWntJsX1WtqEIGYS2eznIRk
	+/t8Hd4aGqoX+7yEJtXCBBTQaK5hLJs+9DfHdNkdnTahJvcH0tggzMkXXQ7v4QBc
	z9GQCBNoAMbjDs2kzrqEIdBJYGs/AKpS/es3FYl4415LVzVZQwnbjHO+HBwF3ckP
	sBt1L4uxjbN6lOZzx9wwA31LTXuwt9PwXnwl1+mcGcr0fRtGw7Acmll4mQ4lTNxg
	x+JYTPcyTBBQjKW3Y+G7bscp2iRh5JSfuk/y1KR1ISOy4SEw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda8f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60a8bf5so423087137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794323666; x=1794928466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gERlYnqMraEDZsYQky6xL2HjZPffZDUJmiECrM+pxkI=;
        b=T5V89kE2YuJEVkUouEA1s75vF/ZdXVkFNK81Ral0RC5Hlf5rtGL/NGcsT7PcZ0TPcr
         lLLDnpiSSJSoO9te81WlODQD+CrUqFi8Zk55jfjzwwq9ypSZwXAXk7XHlkLL4XKy7PEI
         P3OXbgUSiUhpn33jEHXzTct1iLQgNCw/nx9uqYhY5oC7aX5bEbwIf9pYWtv9bLb6exAJ
         kl7DFGKsqva6Ab7ppjK+PP83oPeTqF/MF8Fil8MP9qU4miuYjFEqTZbbo64zFr6yJsIT
         yRcACz4tPCiu84AYFvcK1hktJwncfZsVdPk4vjNZGf8La4xIeoQWYtXWldIA5pfGhFdf
         /bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323666; x=1794928466;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gERlYnqMraEDZsYQky6xL2HjZPffZDUJmiECrM+pxkI=;
        b=k5Yefbo4ItesfC7gIz7ModTcdU8ZfCv6WBbm3njQtOwH4D56zhIX8all75x9aQf9jX
         TYqzy2nnNYPmR2qn4w0Rm9YsIBNafXCsXHvuJ8OvyaKxQsI2tJ66PgeqA/N3G6qJsEBx
         kKobjAk1RVeozmtlCzFI2o9/nWX8r76KQ60rLSAEfDjR/ugBmv4JwUwr+SNvlpPBKL7p
         bQ40ZEiWmMOpmcF913SSLGklaWpz5GE9/m9W0xsJARl9d8Z6ZevOxnwOEVmETCqFComf
         iCli+++iaj0Qr7ePlZgX7+Q4kLXkdypQEwYwBZw/Db+9ixEU5YaWiKqrX0JDk7WWJ7yd
         XfoQ==
X-Forwarded-Encrypted: i=1; AL+hErGRybXb1lLHk0+hn1nZ3NLt5LDkAwGfoYnjH0Q/sw+8YF1rc5myW8M+hhFk9fnQmgHpAZ6P1JExE6xOhM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZgIfSG5dpTHksYJ96eLxTKiEg6PDMQ/C6yvLbL6JiXshthGy6
	/aK0iNzw9yvhN1zxUqUuSZiGHsVp15Nl7f4ajpMMmJSmRgOLU0+DhTqg+F8K5pLoQ0/BGxZ9K9a
	lpWPLA1cRkt4uR4PVtSfjBkB07y4o5KOHKaKTl0RzhvgFrFj45YFMjynuAGMZ52L/T60qLmWxLf
	Q=
X-Gm-Gg: AYBFou14cWw2Ow0K9hbIJFRlJW1Oaj8sR1jMfC2biyPGgp8EPEIAtfPtcF96Ji3bJ2R
	GFUV7egPASBEI92k+NPh0oEPnT2MWzRjZ8Vjm3LJEn8xy2tYluITLR4rL/TxemmURVBPBsoJK6S
	KzauUcMbxFYDfPqX6WlF9IBi4EbacpXy5xNSnQqEx2gY5JkYI+sLT38TwGmaPI5zctrIF7+fMjG
	Yzj0IrF0xDV2Y9/DMArbu6YhElHWWu6iaH9aDUFCx6dducWyxclvmL6C+0rtBfvNkXUQtGgRnI4
	ihVt9EPuAMTJKSQYGpVt/ef1AGFQine/43CXlo65JqvrrVjSurojiq145hsw0FMTSKF0pForqpq
	0RM4iOV5oUC+oES2zIAIVOE95/kqQ0WMyj62TuHgACAKSEpaBj/3/9W/lMh4H2JP+1g+X5BWpMx
	rRikVamzcHvtQt0fmFPZ/ZKuvL65hbLZ3OKzwAx5wdKTUR9iMGXDi31X+g8PWZ8lQ=
X-Received: by 2002:a05:6102:6f07:b0:7d2:da5c:6f73 with SMTP id ada2fe7eead31-7d301bdacf3mr846981137.26.1794323665716;
        Tue, 10 Nov 2026 07:14:25 -0800 (PST)
X-Received: by 2002:a05:6102:6f07:b0:7d2:da5c:6f73 with SMTP id ada2fe7eead31-7d301bdacf3mr846961137.26.1794323665153;
        Tue, 10 Nov 2026 07:14:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba023a1fcfsm29388665e9.4.2026.11.10.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:14:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:14:19 +0100
Subject: [PATCH] pinctrl: qcom: spmi-gpio: don't cache new config until we
 know it's applied
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
Message-Id: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMo082oC/x3MwQqDMAyA4VeRnBcwpRb0VWQHl8Wag23XwFDEd
 1/Z8Tv8/wUmVcVg6i6o8lXTnBro0QFvS4qC+m4G17tARD1+OO9oZVeMRTPywpugnYkxjJ5eKw3
 ODyO0vlRZ9fi/5+d9/wBeY7dEawAAAA==
X-Change-ID: 20261110-qcom-spmi-gpio-cache-sync-6941bf152459
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AGIBWyVLxOcee3LP0QFchKj3y11Zq68hX0i5sAO9N4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8zTPwpa9C7UysIkP3amubYJsjDnBP1JBD1TGw
 8xNAGrtTGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavM0zwAKCRAFnS7L/zaE
 w5qmD/wNGYXeofKHZyfg4uDHBdwphbjUi5BXcppbofa7dLzcF9ihdFXVJdzakcW79SNmbY1axWF
 8INVJk+/bfuVHzbuXXZeldzDJ4e9tYg06TDPVzy1mVtXXtiYS1PzugwAl0lPpOPT5GpdKSO/snZ
 iJXwaut4grWGf/SvsO/FroNGpIB683ULB9gWXkF7oczNszpIxUaesb8MrCsnxe/qYFI42L83Sbt
 v2+jipdDoLfWXv8BvN7rsTsRPfVFcy+1IvYyAHIPOJuX+JcjUUmHBwOUZlh05u5/88z1KLnLNLr
 ZTBngLBP2AS8EBIEFCHMgv+geeSxPeCN4aNfhu1VELUBnJIqiE2km2VXrfIo6NBdQAKFldRNz9L
 CM/0LExU/ReSPaWUiWv3A6sjQAzqXsJo00KXb82oqRepXhZ5xnuW0k7YTusvuaAbUeHQdOucpbc
 IPSVoGlEUTICJ15GWELYRNkjnZIPCFsrgbMZ8cwnu0zJESt1JfHUmUlpl/DDVUL1G7nmIlVEjzK
 JuWDPaqLBldLnZO2bjUMsrhjBVT42tUmfX5AZg4KoifZrDxVvza42OXpds3WDR6VXVfw/1YHqy+
 NlRX6QtXtv2CGHmthosNe6pzJE4G2xkA1dWRZCOOpDZOsI21/adEjD15eX7K5yEOiSdyQic/DOE
 h9YV1WBE4bwhu3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GR0LvAAnOYZG4lkpJqWt8kWc-ioAYsJg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfXzu5NfVC5/7bU
 7lBNj0pzcI9zGuvWbJWlpV4yKhohpRraRS4VNUngTmYywFH/7UEDEBGcIxDP7gV2RzGKe/Q0gCe
 quvFYJuAeV0r/2jh++Wk3YFm1z6KvU0=
X-Proofpoint-ORIG-GUID: GR0LvAAnOYZG4lkpJqWt8kWc-ioAYsJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX/gH23aXcOgvp
 qJkIEPRriDaL/uilil93WdxVkiGao9IPEWrtjloXUuVnO2Nu6zwbEpm1iW1FwFvKFiR+FLgQ21k
 HRinYatrsksK1G2TdnHeMbKt5gRtaP6bm7mKMhJ0O8l3AwZzoQVuF5/wZTMtRXap/9N3adHVuCC
 fpd40Yk1LaLOFSs4/lMbkKEjewmUpwGVPfhLun3ExNUwTk4VDU9p5QA/IorZtTyEXiILwG1LgPe
 P1AJ0cOYiy4OoL9mE5oEmVC5xhVxYgYt8lbYEAtw8T8kd3ZP3+Z/bLf46Dwpc4l8juLEL2hQJXw
 /2xAI5ZyDQw2lGT/UQS30c80rA3E7m+6g14/Z04scJJWE+yKiuO3ftIevOi3y7ppgu5j/5pJ0Aj
 TViCiAmRgBPVLegle9E5S7/GARg3wr7MoGux0KllvkqUyXVIA/yQ9ZdCGOrBVzwBieFh8IPBcmc
 SeHWS1xDD0+nbVax7cA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af334d2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gx8430QjnXqzkbs9h0IA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100060

pmic_gpio_config_set() modifies the in-memory settings cache before
performing any register writes. If any of the calls to pmic_gpio_write()
fails, the modifications are never reverted and the real state diverges
from what linux stores in memory.

Work on a local copy of the relevant pad and only modify the cache after
all writes succeeded.

Cc: stable@vger.kernel.org
Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Closes: https://sashiko.dev/#/bug/linux-49f0403d-732b-497d-980c-109c36c92597
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 05291b7397d6b15531e66f073b8771ed318ed5fd..7c4266efaa27619508f0cc3cee8f8a607f7bda57 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -480,12 +480,14 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned nconfs)
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
-	struct pmic_gpio_pad *pad;
+	struct pmic_gpio_pad *old, *pad, cpy;
 	unsigned param, arg;
 	unsigned int val;
 	int i, ret;
 
-	pad = pctldev->desc->pins[pin].drv_data;
+	old = pctldev->desc->pins[pin].drv_data;
+	cpy = *old;
+	pad = &cpy;
 
 	pad->is_enabled = true;
 	for (i = 0; i < nconfs; i++) {
@@ -651,8 +653,11 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
 
 	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	*old = cpy;
+	return 0;
 }
 
 static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-qcom-spmi-gpio-cache-sync-6941bf152459

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

