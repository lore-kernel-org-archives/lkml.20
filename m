Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B04FECCB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536567; cv=none; b=AXdtCNDlTLEjhfXv6QoxX8FgVALYSg3UGYbXBhq/hSAzH9dYdSmCu7WG9ubRTY9jFNqgIDibKqLgld1frEttiMqdcqq73sfMHub8ThpK6a3/dZG4mswYYCc3zlP4CGneHqu9XY0eOHu4di7Xhvl1f3F/UoxRKeAzMSrHuMUd8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536567; c=relaxed/simple;
	bh=DketuHJTJ2AlfYdQleqI6+O28Z0Vk44wfCYCPKymfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifvQRzajqvuB9TOlJl0Nclbj5m0rRa9blDb5U25BMppz850O9/hGe75nbbm5DwtAq1mlSCEkJ15h88qdBAxsBbyedB0kMqTV2FT6XUvjIPlAGHgHtPfXV2dJD6qbMXOVcnTMu3GsawdO2ZhGakSF4pwE9QQ+HdWgBc5vggXnmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbRXD4v9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvdcFb5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbRXD4v9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvdcFb5f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiRoF3190495
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 15:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yApsV8ek6sm1DDA8uG/ESAfoNPZgj9MCFK73tfFdH0A=; b=GbRXD4v9A27QZCV0
	IePXKo7wnG3hRuINtPA+y7vQ4hAhufw1eSbZGR8ApfMIJOGvE/CNtQZjUAoQrikR
	esR+cBp2gROES1vue+m9bq2TVfENRNJFfeVniBzvdefPPjvXH+vhH9fMNkueKtfw
	/GqAELUGXHt0/FKBf59Um+ddN1swEdGT92yG3FPap9uw3kjmdNZA6NTgMktDKxCi
	8uye4/AJfDuO0MX7ktD/bFQiqHMUiv9hDGPkpEiqm5zvS8zF29iLskzj96I00M9W
	mQntvqqOUAm9wQcltweDatgMRhJaB+0ZjsT6Mrxw7UI38ZHyWXJElG74sgTnSmJH
	CaPpzA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg010g8sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:42:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so881468241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536553; x=1789141353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yApsV8ek6sm1DDA8uG/ESAfoNPZgj9MCFK73tfFdH0A=;
        b=DvdcFb5fy8pPb9CsYTiTinr/+tgNjv3FcpY3TfU+zqQC6NvyCteUs210gRhG7OYu7F
         7JKnEUMqlQtRosOx1fXfdlB9woE8fK2BjwHkVJR0NmgdWOeJhXYL0DJ5cGwi0UjanULl
         oUQdCzOd6579xrglwXoK/T96hXKSXzJQt5uJ6T3lAd5krnlKr5ScbMScNBgSC3VkqKxB
         FlJakyWai2S+8adr4cFf2yxLqZcss1R0BxgTes1l7+T4TXbw7fHNmeCeB1YgMMBu27El
         JwWdT2aJzCrR231d50HFLVs8GpvzG8jLnAJ3fYIVjQ3JE1PfuUq14wgR1YZaq1uTmzxH
         ACQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536553; x=1789141353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yApsV8ek6sm1DDA8uG/ESAfoNPZgj9MCFK73tfFdH0A=;
        b=T8iyRhnbLyRj+IOQlvRnsZ06tUYd5ZmFxCjGbTWGiQFYi3QapHdxmLZJpHAvGqDX7H
         3zRZi2c6Im95+iIGQXMIimSX74kozSjfhGE4ewyN+9QjN1OGxZTbHYnpZQf6UTIQrGkq
         ryngngKWwKrm0jK2WNDtadklsEPBHESe16Y6f0tEyh7SXk5L/spSouuc69GhihILczfD
         Y7Su5h/cr0sGK/gYQKtmpaK/rIEzsI4MrX9IUOWhWw6rGC08se5mEbI4S73Zynff1BjW
         THuCFbv5+c0TE0tImbf6gMc0nnjjF+seH1DXlmo8SxWOs4b/Q9Ul9Vy68O4FixWpjlvY
         6Utw==
X-Forwarded-Encrypted: i=1; AKwUvBy+q0iBhXlBwD0q3+gPbsJ9gOxebwMfSmA8mGyc6VmT0FCz6PIZYe83Po6J2esuBGm23zcvNFuYYHX77Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+9jS1Jd5USX+vw5UhySaPcxnGhK9AEzEz2Uvndtt1NCTLk/o0
	20td/86gaSSC+oHKMDwYJ5sPlvnjgB0XSxoUK90i8/yaSWEyHK7zVuWUP0j6gcmTS+C0Sd9okat
	WC60Ayr//BMpwidndiiuAr/xE33tuuTv1c3bZTk/t+bslhV1ByhVdQ5eJkDZXVl9Bf0A=
X-Gm-Gg: AYBFou1HeOLC5njb5lGJa34XL3WD4yqpqwI5g7rF0rYrEUpOlRvEOeA/GOkMEo7doh7
	EN0zVwiUxgBfi2VluCQ46PSo/i8K/SNCVrn6KJOIdZkPVA5SCXaAewyuZyclqnpg8NO45PgO5ld
	LrzTE/vn8R1FLInaB8zEHUUdkoJJZ/22GN1DFqPYxjHYNDktg3kV37SipOcGNTGll/RwtI24LO+
	wiTPzybKaNSMZfY5ldGKyMhB5Q7SLP5L7DVs4+yzU3wwLEylQ1F0BSjdm1KAEath2mY2CLtUJ/E
	ZU8mNyx8lzEGRQRD1yEUnOAD553XoShMkBj/zriDqt9oYrxc/ko/y4gbSE5MNHCPtKhJQtPS3wl
	lptbRTKayx7enTHtrGtrNsc8OezGJODLvM3Jpxbo1jVC6YpFrtt+UguCdNNp3aSQIrRSSqQlSMY
	meKcjV9YQicMwwojZy1Hc5B5Ar/FP2X+dgrP3QakjOAFWa5TyBNCs=
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr3371902137.2.1788536553353;
        Fri, 04 Sep 2026 08:42:33 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr3371628137.2.1788536548990;
        Fri, 04 Sep 2026 08:42:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:20 +0200
Subject: [PATCH v6 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-5-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX/uMBVw4e2UDz
 b7HaUaQbZiwbOH95kHH0KPvG0Km5tp8jG650bWZgiJLWHyWgecLekQDOpNdxWq+lhItd1ptLCxB
 sGMIbEtPI1q+/J36e8oTTyFuMyPZB3REcLcmqVmTYSl78VT4dj04AIwgvzp2epxxDD7K2lp31LH
 I0MKHIOMMYUVBif0Cl9mI9QuyQ703hGXs/a0lguo4ThMeUS8Ob5fKxqhf8DKW2EeLLgm7G5KEm4
 RFgB3mm9e95G/R3rg3Xee6D48t406+LhAvfCQeb7e/sZSlp2JtdK7zIAE4yKWTFFo+EnebfaaJh
 lUSr5GKBKeVVx99+BXU0ztnGi+hHQQ+20fbwTqnpLbLYAQbL98LIqsYmGuCsiSx7g+XOEkwfoVE
 UXLBeJBCG0KGj8J8jJ3RYEP6Sb56KPjslYMOlsVo+PVBca8eH3wp0JeoWEjDJAHldfar+W4txRh
 eF7pHELlHa6bjBFVMBA==
X-Authority-Analysis: v=2.4 cv=YNavDxGx c=1 sm=1 tr=0 ts=6a9ae6ea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QWuo0IUDA92h_ITipQ8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: n0RsK6qL5GsMCr0IURsc8RyBkmq6AyXU
X-Proofpoint-GUID: n0RsK6qL5GsMCr0IURsc8RyBkmq6AyXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX81ZYbp5NkfTW
 K3p27zlx4ZnyYA6JRRPY4lUDLYAglKl1OHLghD9Hb9WPD/F0XCw+m5SaPynsviFRkal1O/n31Od
 RupfOzWIB6sdH+TLJnpplkQPLoViNd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
gate the respective functions. These GPIOs are optional, on some boards
they are hardwired to an always-on pull-up and not routed to a host GPIO.
In that case the corresponding enable/disable callbacks are no-ops, so the
consumer cannot gate or reset that function on its own.

Implement the .is_controllable() callback on the "bluetooth" and "wlan"
targets so that consumers can query this via the pwrseq API.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index d41793e1fcd94e6d9073023498e111720af2c0ac..7f88a29b2c33bba5b1bc8e625f7bad26321fb1a4 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -183,6 +183,19 @@ static int pwrseq_qcom_wcn_bt_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_bt_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The Bluetooth enable is driven through the BT_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the Bluetooth function
+	 * on its own.
+	 */
+	return !!ctx->bt_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_bt_unit_data = {
 	.name = "bluetooth-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -217,6 +230,19 @@ static int pwrseq_qcom_wcn_wlan_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_wlan_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The WLAN enable is driven through the WLAN_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the WLAN function on
+	 * its own.
+	 */
+	return !!ctx->wlan_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_wlan_unit_data = {
 	.name = "wlan-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -257,12 +283,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 /* There are no separate BT and WLAN enablement pins */
@@ -280,12 +308,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn6855_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn6855_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn6855_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn6855_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 static const struct pwrseq_target_data *pwrseq_qcom_wcn_targets[] = {

-- 
2.34.1

