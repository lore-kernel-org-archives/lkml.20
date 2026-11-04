Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801077;
	b=NgvY1+6RhrCXzvnH1iXzqYVeM7UYnTJm63V3j3wqCjWEIA7YFu8kpXFkMSYJdJaJXVKX
	 weUOjtOrXFDMj7/wM9DwonnZkMhgjI9xMISffGGoS5OgC7SgwvKeo8si2Hit/S3vUvGrZ
	 8M7Af2q3CF4U1entjHBKlJb+pdWXC4pDchnmjYkMlsNxpSSkakGOHWAfuuwB3/sOa6oBe
	 oqTdQ2g6vI3Oh9h/ZKdVmndilVzlaodSrD8B3xuP0+nt2rKi1VQtaj11iaDqfy7/j1RA3
	 BqwUArHwWbF5W1fJUNrLXqOhbgbOtSZfCwhrb4mXQoUZgv+aEWsfrwUV2BLqyO1BrJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
	b=Rmm0HYMNq8dKY+M7/xlUdRK5aiPO4wAdTSJ4Ed3QTayTHAzOTrM7X5tIvmIs3mSitkJZ
	 O/9lgRRuor8DqV5bGi3h1B7i+GdAO1Z4aUU6t6JKxfszc3OdjI4KB81EkC18i1YxUbXNO
	 9RBzBoQQUEm01Y4CRFO0qiJbo2Lgu9OoD8TJAPQrRAyXVbcGQh+gT9kfa7wQ+JYyOXB27
	 CTBu1jqJfZakF6Wphos2P+cgHTIEwFf96oXY4MX3bgGi3iVmuE17//ouXI7lmyp9ofVVo
	 xAVQ5/U0s0T6otK0H9rWHoTSIeRfYAUx2CYeQGMG+KRDobLB+7/eSivIwtT844EM/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBC606D833
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DBC606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsZq2667761
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=; b=gchuXv8rO9edzX4k
	9qDs7/iWqeOWA9XHdem3GvBvH613UiaHaQ4a2k3XuXl0vIk2+z09HP4L/ognem5D
	o8Xeue245re7R3yoKngvcRV1YcDMWvbWNF0j91pIJcumHa1wM5ODziKFoYFMiK/8
	LkzX1OmeefktfarLz+A3xY+nQHY9sso7EDRd78jzV9nFvR1jnURHIoqeQmARzK54
	FdbhvYqw1u3Hm9ieKzdPIG5R/+p0lkJvYxz+IwcBGWEGX1Puvd5Gm2oBaFfTuVD+
	GNRE9SLfjmKan6B8yCaF1PRHfhleWIBYdcklOPmFFvxKxK72c7zxHR7WUaRjrgzj
	dVO8yw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmefq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:36 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99082f450bfso560117241.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801075; x=1794405875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=iOq2hzB8ZIzAL0kATvijGaEyYH0ZXJ2EDRzy8FmBZhpsc3H5Nn+KlJb5Fxynl4CTVJ
         aCMoRE3jkUNa1MGQU66Yc8TZDSMILHk4oLNWsAP9C/ZYOmAi94VgUQjPboNwcLoLKA/+
         ysPF2FPbR1FwvEp4zFRJS6xIFkD5v2uMsVVjmUK0KNy4JtnrHz/hVboOYkRugEdhJD6u
         nHSMTLFqhksHYOehdjfFGEVvuYoC9me4jUoD9MUdTsUZyPSw86b78uRO/81c9I5/wKWP
         4fNUmfxX26nasD3GupuU6GkKWyiM7XygbkK6dIDm4DaKrBKZWvIWqVszAuoo0y+I/UAr
         0cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801075; x=1794405875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=x2mKfuxbzhjDqB8dFkMperWsTA2Fo+sh4RB+gUaIjCwCkl1G5AcAlNjv5oa9kRwI8o
         ytTlBQULltkSMuhNXA91xZFwMtqUDZ+ChwTFZk/NO7tgxw0Zp9DAbjhKEtBwhsGpn3AX
         jdxmiLi8IAo3ehfocFKanXz4BKFXgkqvW3uYofZZesziHCjEczL+zytwspsN3/mrM0O6
         aGCCHxlgDOWLjjWZ0nbPk8+a2Ojtrc6sgxqQ7JJVf+4bhmG5GMuryP96luzolLoTm4uQ
         X6YXjQqJ/+ROnWH67earzkf0vZlwPRLTjnHspt2eLZruIL/CeBRgSnViZpJj48JZQ6qi
         0X2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2qYBYCDzBgANTsczo+3V2+h/cHW82WSKCiZ7/QJ+h2dsEfJJgfcANQENDR0DmmvT44GZ38CMedM0VAzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZvB8B54es+jocPAqWQD1B1UmdHVipKuSgqoiog5G5HP3Fu1gc
	4VfCXB7rnv1QDmHZlu45nkHYOObW2lk0cDDFP4coE0cCWW1A9/cQE2P49Gk4m5mf1svTtVITLam
	pwkK3r9dgnugUGKNZCLEmDODoJozUwbtymv+xtfUuTxbcdMmQDPB36lUZWfkpSOpCY2s=
X-Gm-Gg: AYBFou2aaIFfrcTx1bloEf66uDK1Ecw13lOQQIPhiUZm9a4JM4HQLV3zyK8iXQ91FPA
	lqJ/Dtv+bpSURcMMxxHVtwv4aNo0NyaG3euIuaLK8maM/sRFFf5a0jchem+rEC9dxsIZF8LQb1u
	AxKDgDayZ0RDzfkqES9wN7OfOGJKRK++Kq50wqM1ez+Dq6ujMAZps0912VTEEmOqvcAhKhJ4bJ3
	c8iuqOXTJUh8gFtKbfR5H+ZXkPM7E1sfDEq29bbb9EzvhaiArPgYHasRgbKsf0ae8RP9olXmzOe
	58nHWKvDrBrxOw8cObCvYUGQLMPibgqJShQ1N0hplLCfXcgjRgh4dVyVhNm4b1EVyOHSPCgUtPO
	JfNTP5p0Nb3EdBUMGCTgyNDfRLL9icbsnd/GjjCvyMe+P8XGDgXrEEKmrokQ/F0n1BSXky6Sm7w
	BpOQ==
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314478e0c.7.1793801075026;
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314419e0c.7.1793801074572;
        Wed, 04 Nov 2026 06:04:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:49 +0100
Subject: [PATCH 7/9] device property: provide
 fwnode_property_count_references()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-7-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CscP3j7PWUDfKaYGcKxatd6g2T25BK7kN4l1KEUd28=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSs2vnFhnUytszIj7K0MWGPjj4eH7eynMe/
 zjl1O2hEWCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 wxbqD/9x7yrGNGnGGwHE/5F84SboRgKxOd9v7VsB83upksyfCmrNUJdCvj8btxeeA9qzgCSClcD
 T2+FVNnhuq+bimeEhLsXJVc5Mj/CfnYLlLf2HjYTBw5XKhY77RyYO3/zL0ion/h+N/o3GU/Lhma
 VF8h2/k11CBVzYr1/hKVcN2UC5jnTB2dHJyx6lZhWY/gjBebAny99BGE6EyfNNQLD+HHJFgqtX/
 C0uKfmTKduexOOQX36t60DS2U2psmBug0DC+dc4AXDLq3lbfkgndojubKYsuBF0p+/D1sDt0zI0
 ZIruV+1C+7YdqLbPhKHvqcweY6qAQoQn6IFFQnJJD819mEy47NLuqS0pL+SfoZdF7UpNz8G0FrK
 fdryDWH7y14b0ytPPljq6G0ngevcTwf7meR0wMlSLH/HWzp0doxh1r45gpfIzbU1Sg//kXPHGMH
 iGn8BXYBDykkG/EysgPwId5ZbrCICEEpOUVEi0CaqYpNfiLGCvLIht1Jwmhp4NgoesgamhlX8ch
 UWI331eV85JS8aVnHQMp9Qd4WdJlUN7LCUSDkEwzGKUa341ySKsI7OzA4xdmVhWtsUoLSCMGjQe
 aNX0J13UCtBnpMjdzB/6iszkDHGi5e0UDr1TJjXcQAMUb5v/Aw9JnI15RStkZJ+fAr6N012X6iK
 zmmFwOT8akGpUaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4Z9yFfo4jBNk
 WCfXLvAfPH3noG+nwXnTgOBHwOnkjcdtEzC84AgxLlPvinR8ATxRqdzMi7F8LNHZ8NRMPk5vfs7
 hYcWgf4NrYOHXS8w5h4VwKzJueIrkm88rOSkQzOXpY19BlNslRDyNAagj2b+XESCLGGvMBxAPmp
 8EwMQFgLTdBLfX8EJwRdGeVlxhbM1SCL9ItBBwgAMoTax05sobouLY/LNjICYEy6IyDHUbcoFre
 c9lCFRzSD2LimUAJ46v1WB6tkQIpKOgR/6biI0zmSa7g0GHRi5Wx0Qo4+AgHPv0Pj80o8aIdsK0
 A5X716mIlSZtvuoYXIVfmYQpwORlsXFbTdUlLm3ZKPy9MNVfYlrxkx4cI8qYPK+x6SOUFjzL2Pz
 KwW0XFNuw/kV8jTX9DqMaW54nbj5+TOu1hTsmRnyuDfLkEIKMg/ZX+661mkPA9dp4SsrUMpwUpI
 m/ecPdjxJINcqpfZeBg==
X-Proofpoint-GUID: vQcaBajA35D1DcXwrXxqbvz3dHxzgCC5
X-Proofpoint-ORIG-GUID: vQcaBajA35D1DcXwrXxqbvz3dHxzgCC5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+lwUMF9MMUWU
 TXvm/Ulg9rAYSpuhZsSR8uZUNKatJtF6Hco2P6KiQ3xWZQIrrF9XxJR+naOgya6nLRX06tafrOe
 Y/243ay1PpxEY81fwrpdhykxJYCJkFs=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b74 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7b0df3dfae53b6377dba91330aac746684e8adec..259ecc4dc31a7b07e2ae5f53aa2424de54ba8236 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -654,6 +654,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
 
+/**
+ * fwnode_property_count_references() - Count the references in a property
+ * @fwnode:	Firmware node where to look for the property
+ * @prop:	The name of the property
+ * @nargs_prop:	The name of the property telling the number of arguments in the
+ *		referred node. NULL if the references have no arguments.
+ *
+ * Empty references count too, so every index in the range [0, count) can be
+ * passed to fwnode_property_get_reference_args(), which may still fail for
+ * empty entries.
+ *
+ * Return: Number of references on success,
+ *	   %-ENOENT if the property was not found,
+ *	   %-EINVAL on parse error.
+ */
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -ENOENT;
+
+	ret = fwnode_call_int_op(fwnode, count_references, prop, nargs_prop);
+	if (ret >= 0)
+		return ret;
+
+	if (IS_ERR_OR_NULL(fwnode->secondary))
+		return ret;
+
+	return fwnode_call_int_op(fwnode->secondary, count_references, prop,
+				  nargs_prop);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_count_references);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/property.h b/include/linux/property.h
index a70f3c4c087dd85390951da950c3632f89c6cfd1..9f0b9aab5920513cd468572fa96dbe3371609591 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -137,6 +137,9 @@ int device_property_match_property_string(const struct device *dev,
 	return fwnode_property_match_property_string(dev_fwnode(dev), propname, array, n);
 }
 
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop);
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,

-- 
2.47.3

