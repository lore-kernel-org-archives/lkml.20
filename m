Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559489;
	b=SEy+j6FHz4PjnA16GlaK9iYP2aGiO/gk4BW9KSYRoBObWeewLT8utDku+xhtcU4VjuM6
	 +bvwpFNTUvDA63I8LXZhCbx8tslp8a1LNwhrGGZNnwZdmvbIX/ep8jfxx3NvjIPvEXcRO
	 cQrKPoLPA6s+Lzu7qIM1zNiUcbKw5mK9AjbCe1tu842n11O/Gp2RfIIaTzUkcyK6f4hNv
	 B4GaREFkPYgbYjTt0hhnkoywBN253u4qZScUJpH58zCAZ6OBjVqtHQjVGvypSyAOr9XSV
	 Vx2MQTewLf2DzhxUGhu62OT+yDszrFhxUzND/R4zIptXLUjcm2IZDuFyQXYYhyiKSWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XDcPsQLu6iWo5QUWkThz+zDgWOZB1iAbeErqpv7/mWM=;
	b=jiI34dqKmyQJ425xHH6rD/fr/uqc6RQeZovAMCdTfHrNtr29DdOjq/yTsJ6b1R3exn/0
	 BtdlKEeFDgazsSCFuwM9wN+UUF4bUmZhQMY3RGSLaVY6YM5+dagDuxtD5UEGe7SkyFR+f
	 qoF82SKdeY1U82fDDgLcsvcWENoPsxvgi4c9ak85dyuq6Xk6CPUU4Ei/a2Qud4KI/p9gN
	 B2YjwEvJWfrwz2L287geUgpOJNrb94Z0sg1xmaUTrkle+bl9vdXCsBrT8Brf1ZaNWkHQC
	 LqHpiktopmvo5lBWGor3C8GWtntUV6f+RXXXfK+ZhtvVdPOi21Dp+7UsTzHpQjNhbJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/q0OeOQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q/34oSqj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E6E60A262A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E6E60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/q0OeOQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q/34oSqj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VB9A2182064
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDcPsQLu6iWo5QUWkThz+zDgWOZB1iAbeErqpv7/mWM=; b=K/q0OeOQN2YcbzHX
	wuuUKrZJQFgTMCFxOdIndsY+0mWtY2RcDxFDBpnE72iVn7XptWefoDrgqUIrOS0X
	c+WrRoJWfeAf4tvOh6vL+mUNNZlZlMVcRI612DZfFQlCMC39NrOactI5fraMftUN
	eKBIog0iTM81CVQbIX2SZeXTXv/2QVoFw8R8li7etKBle8XRQodWkGMwi/RP7MrV
	9zlCtgtZ0XeJ1UblHQYNeaqdk6BelsVQ8++ziCpKHPZEWJECB8mE8FFnagBhXM1/
	V3fOJqrDCQs+9GjjTjB7pwsXjwtgcxlCIXuI9UTHlCcPvkjddvCHdXXxQ045L6ak
	703GTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rjh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so421425eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559486; x=1795164286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDcPsQLu6iWo5QUWkThz+zDgWOZB1iAbeErqpv7/mWM=;
        b=Q/34oSqjeKkiRX+8jSDILqByWDCubuMve36LdsG6he817W6bAc5875nc6AhdF7wYTd
         ZuBx4Yodw9IaQdXvYKCMtqWbWuft4ju+GeA1lpzTfAv5zCVsQkC/k9ly4K81wA+iwiOZ
         puUAKLhpEKRpqe+hy2xo8QOjxRVoXakp/+u4ZJk1py2Etl4UkqOcplgCh/sX7bYDKsUz
         YM7adjegNcCMWiC06/6JGh1IEzZMqnqsatCJL4d8uz377Iq8sa5o1Pm+OgZIUCip94C9
         JGOnfbZ0Tg4/Upjl9YWQDe3rFe9wjcw+VWLWacZRVvUwXaZIq5Kc77YriY6wNG8EqN3t
         cJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559486; x=1795164286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDcPsQLu6iWo5QUWkThz+zDgWOZB1iAbeErqpv7/mWM=;
        b=V+B23qW1iSZc3lSy/Or3aeOycspArlVJCfkODmQfrpDtTOPtiXGSgr82fLjFMFe5p6
         TcFGwD7flYKFzSZ62Uy6oDX+HBQLRMz/7mJm5qOgm6MIwT8LSPXCRHpKO7xlsMpZJ0Co
         CLn9mVcF+e9zgEEE+e94hdhkXC1/iA6LcxQhXdWVoR0oH9Q7LtHgaeT2F1A16+kPopEK
         qvH6jdGI6vYgZ6l419eZtKrLc9sIoEsjiJ/XvJ5oRBkLFtgOjrAZ1dG4ZP3kfPtMv3AA
         gF2fQKc2Mc0WCay0DMPdum/2UwkNqtqoijnGQOwU5pAMNrLrL9T3skRZL5NAF8dH6sq3
         MdgQ==
X-Forwarded-Encrypted: i=1; AL+hErHyUOWJMAKZyE2hOJwmd68BwOs0UB4RCHudJfiDqMOxYqjVEUnztoxNH7tfweKfe8MWjC1WFO+3d/a7wHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z74fTvqaMZqYf1YcTAyomqobS/fYfZKUXrZKl1egbG2GGYzbH
	P1ObPwSyFG5InA1GoTYGEM1Yr/C22uzNHx+RiTkIQhedtPuFB2DhytwDribvjElvClQU9qw7c3i
	vqag2enpV8cxhqDkYYwp580Lajj5rsnxADCMH6tDBF9BBaWLf/OsHlQh7Er6GDyvTHyM=
X-Gm-Gg: AYBFou09rr/IAONaor/7rfmUipbiZx4/45nJCly3eggl9EWrLkV8SSSOW+E1rWJhw+Y
	VXQcQ4oQVVC+4xhnyb0VxqGOeum7ahjqJdPCVtku/TpG99od0XB1zwrdAq7hn+H9zLVP2dY+6dL
	tuQeHYJnmRjmSdgG3KlMAqCEBz+ZRXaCR/H7KGKG9puximuciYDEwgpfyB+tD0v822/7aZCjJIf
	7r5DmDu/H+ayg+NyrNB3BpXoOC3Mih/WvwpYAaDkI7jCTRpVdoj0ooeRA0p2GoN2NTSxa4pLxgq
	jV3YKjN0D0H881IaLnbY4Xsi7RR248PYHwi3VidXHIxbjdIRHu2YcDZOrNgAnTL46H6PCHpuj3w
	/EjkdDlNdxY1SpvNldh89DnMGQZx98pR40i7wYnmDUfS6wgv8YEntf4EHTD3uOv3NBGZva0RZs5
	RsEGA=
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-377e093db88mr4412860eec.4.1794559486280;
        Fri, 13 Nov 2026 00:44:46 -0800 (PST)
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-377e093db88mr4412830eec.4.1794559485604;
        Fri, 13 Nov 2026 00:44:45 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:45 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:47 +0530
Subject: [PATCH v3 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
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
Message-Id: <20261113-thermal_bin-v3-4-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=12978;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=U1VTKpkMPbbHkfuLVXfzDCPCV2jAW9Gty8rWlwaSbVo=;
 b=7ii/YD/eAdA8jXg898E7WAhfwNgLzQkGY4uvOxSnBJgIqJdgGgx4eICvsaNHAtTdFwaEc0d1r
 ph5DrTEc2qRAQtc9ctk5nDZCmJH9bQfhe0t4VEhKdvCsBLxf8OmAZvd
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX6rlTHavzETvQ
 0PaIHho+B64Q7nNaj3JSuBz44BfDhwUu/dDssyeyLjcJUre4ONFT/TVPy4LfZyRMGP6ZLpiXurE
 gMgy3SMJz0yhIye3CoAKKfX2tQ9NnaHHIhifNQcSGar480ElmHhTJcg0cqhtB3D7EHdsqfgg+7j
 1hG7B0Ta2mB31ffeERpZZILMy3cKKUCQAc6S+rwszrbHo8fScQeAFhoJ/CLaeFO6f862+d9CLcn
 OozuCTWJRutb9qRozI4jr3xO7RNBTmdzy4Y82WO4z+Q9XquJ1pw83VRTtpRye6zNTp+KgnInIgl
 ViS7o41f8o9JsInBdeY5SeEGnnPtWFI6R/EpFPu7r8begvf9wethXp91jNw14MZXTWlXJqvfdZC
 feKpxfdLRRqiURS1hFCLfmGXqyEONWPL1E0iB1LuABtyacv7+qYl70nzck4XKTIvZHYKVeNKJsN
 JW4471kZfp4J+C4QS1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX9wud5/jXoDXR
 4ywRD0Xl4pvaJofUImgBKjQP9h1eJHcW3el93K990HpPQToBfcFegxHAPS99fxs5eFEscvcoDt4
 xKwGKwgP4B1GQZ+5CzAgO6Q9cPOTA+w=
X-Proofpoint-GUID: 4F-4u8K9n-efTztuKmKSMybgL2OTlIRh
X-Proofpoint-ORIG-GUID: 4F-4u8K9n-efTztuKmKSMybgL2OTlIRh
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6cdff cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EHpzqkDVQ6hHbY9poFgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

Some Qualcomm SoCs are binned at manufacturing time and expose the bin
in qfprom fuses. The thermal OF parser can filter trip points by
hardware version; wire tsens up to feed it.

Add the per-SoC plumbing:

 - struct tsens_hw_bin_desc names the nvmem cells to read and supplies a
   compute_hw_version() callback that turns the raw fuse values into the
   hw-version bitfields consumed by the thermal OF parser. A SoC opts in
   by pointing tsens_plat_data.hw_bin_desc at one of these descriptors;
   leaving it NULL disables the feature for that SoC.

 - tsens_populate_hw_bin_info() reads the named cells at probe time,
   invokes the callback, and stashes the result in priv->hw_bin_info.
   When hw_bin_desc is NULL it is a no-op, so SoCs that do not bin are
   unaffected.

 - tsens_register() now uses devm_thermal_of_zone_register_with_bin(),
   passing &priv->hw_bin_info only when a bin was actually read.

Two descriptors and their SoC wiring are provided:

 - tsens_hw_bin_desc_i_temp reads a single i-temp bit and reports it
   directly as the hw-bin value; used by data_x1e80100.

 - tsens_hw_bin_desc_qcm6490 reads the jtag-id and feat-id fuses and maps
   the known qcm6490/sc7280 ID pairs to a synthesized hw-bin value (0x1
   for the standard profile, 0x2 for the elevated profile); used by
   data_sc7280, which serves both the sc7280 and qcm6490 compatibles.

Register the qcm6490, sc7280 and x1e80100 compatibles in tsens_table.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c |  16 ++++
 drivers/thermal/qcom/tsens.c    | 190 +++++++++++++++++++++++++++++++++++++++-
 drivers/thermal/qcom/tsens.h    |  29 ++++++
 3 files changed, 232 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 843dd29fad2e..3a56c1496b84 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -271,6 +271,22 @@ struct tsens_plat_data data_tsens_v2 = {
 	.fields	= tsens_v2_regfields,
 };
 
+/* x1e80100: tsens-v2 with i-temp hardware-bin trip filtering */
+const struct tsens_plat_data data_x1e80100 = {
+	.ops		= &ops_generic_v2,
+	.feat		= &tsens_v2_feat,
+	.fields		= tsens_v2_regfields,
+	.hw_bin_desc	= &tsens_hw_bin_desc_i_temp,
+};
+
+/* sc7280/qcm6490: tsens-v2 with jtag-id/feat-id hardware-bin trip filtering */
+const struct tsens_plat_data data_sc7280 = {
+	.ops		= &ops_generic_v2,
+	.feat		= &tsens_v2_feat,
+	.fields		= tsens_v2_regfields,
+	.hw_bin_desc	= &tsens_hw_bin_desc_qcm6490,
+};
+
 struct tsens_plat_data data_ipq8074 = {
 	.ops		= &ops_generic_v2,
 	.feat		= &ipq8074_feat,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index bca3fb1d2bf9..db4e02529c91 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -71,6 +71,167 @@ char *qfprom_read(struct device *dev, const char *cname)
 	return ret;
 }
 
+/*
+ * Hardware-bin fuse support
+ *
+ * Each SoC that needs trip-point filtering based on fuse values provides a
+ * struct tsens_hw_bin_desc in its tsens_plat_data.  The descriptor names the
+ * nvmem cells to read and supplies a compute_hw_version() callback that
+ * converts the raw fuse values into the hw-version bitfields consumed by the
+ * thermal OF parser.
+ */
+
+static int tsens_compute_hw_version_qcm6490(struct device *dev,
+					    const u32 *fuse, unsigned int nfuse,
+					    u32 *hw, unsigned int *count)
+{
+	u32 tsens_jtag;
+	u8 tsens_feat_id;
+	bool elevate_trip;
+
+	/* Hardware-bin values for thermal-hw-bin matching in DT. */
+	const u32 hw_bin_std = 0x1;
+	const u32 hw_bin_elevated = 0x2;
+
+	/* Higher thermal profile identification for qcm6490/sc7280 bins. */
+	const u32 tsens_chip_id0 = 0x197;
+	const u32 tsens_chip_id1 = 0x198;
+	const u32 tsens_chip_id2 = 0x20e;
+	const u32 tsens_chip_id3 = 0x20f;
+	const u8 tsens_feat_id2 = 0x2;
+	const u8 tsens_feat_id3 = 0x3;
+	const u8 tsens_feat_id4 = 0x4;
+
+	if (nfuse < 2)
+		return -EINVAL;
+
+	tsens_jtag = fuse[0] & GENMASK(19, 0);
+	tsens_feat_id = fuse[1] & GENMASK(7, 0);
+
+	elevate_trip =
+		(tsens_jtag == tsens_chip_id0 && tsens_feat_id == tsens_feat_id3) ||
+		(tsens_jtag == tsens_chip_id1 && tsens_feat_id == tsens_feat_id4) ||
+		(tsens_jtag == tsens_chip_id2 && tsens_feat_id == tsens_feat_id3) ||
+		(tsens_jtag == tsens_chip_id3 && tsens_feat_id == tsens_feat_id2);
+
+	hw[0] = elevate_trip ? hw_bin_elevated : hw_bin_std;
+	*count = 1;
+
+	dev_dbg(dev,
+		"qcm6490 hw-bin from jtag-id=0x%x feat-id=0x%x => 0x%x\n",
+		tsens_jtag, tsens_feat_id, hw[0]);
+
+	return 0;
+}
+
+static int tsens_compute_hw_version_i_temp(struct device *dev,
+					   const u32 *fuse, unsigned int nfuse,
+					   u32 *hw, unsigned int *count)
+{
+	if (nfuse < 1)
+		return -EINVAL;
+
+	/* Single bit: set bit 1 for high-temp bin, bit 0 for standard bin */
+	hw[0]  = (fuse[0] & BIT(0)) ? 0x2u : 0x1u;
+	*count = 1;
+
+	dev_dbg(dev, "i-temp hw-bin from i-temp=0x%x => 0x%x\n",
+		fuse[0], hw[0]);
+
+	return 0;
+}
+
+static const char * const tsens_cells_qcm6490[] = { "jtag-id", "feat-id" };
+static const char * const tsens_cells_i_temp[]  = { "i-temp" };
+
+const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490 = {
+	.cell_names         = tsens_cells_qcm6490,
+	.ncells             = ARRAY_SIZE(tsens_cells_qcm6490),
+	.compute_hw_version = tsens_compute_hw_version_qcm6490,
+};
+
+const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp = {
+	.cell_names         = tsens_cells_i_temp,
+	.ncells             = ARRAY_SIZE(tsens_cells_i_temp),
+	.compute_hw_version = tsens_compute_hw_version_i_temp,
+};
+
+/**
+ * tsens_populate_hw_bin_info - read fuse cells and populate priv->hw_bin_info
+ * @priv: tsens private data
+ * @data: platform data containing the optional hw_bin_desc pointer
+ *
+ * If data->hw_bin_desc is NULL, this is a no-op and returns 0.  Otherwise,
+ * reads the nvmem cells named in hw_bin_desc->cell_names, calls the
+ * compute_hw_version() callback, and stores the result in priv->hw_bin_info
+ * for later use by tsens_register().
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int tsens_populate_hw_bin_info(struct tsens_priv *priv,
+				      const struct tsens_plat_data *data)
+{
+	const struct tsens_hw_bin_desc *desc;
+	u32 fuse_vals[TSENS_HW_BIN_MAX_CELLS];
+	u32 hw_versions[THERMAL_HW_BIN_MAX_LEVELS] = { 0 };
+	unsigned int hw_count = 0;
+	int i, ret;
+
+	if (!data->hw_bin_desc)
+		return 0;
+
+	desc = data->hw_bin_desc;
+
+	if (!desc->ncells || desc->ncells > TSENS_HW_BIN_MAX_CELLS) {
+		dev_err(priv->dev, "hw_bin_desc ncells %u out of range\n",
+			desc->ncells);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < (int)desc->ncells; i++) {
+		ret = nvmem_cell_read_variable_le_u32(priv->dev,
+						      desc->cell_names[i],
+						      &fuse_vals[i]);
+		if (ret < 0) {
+			dev_err(priv->dev,
+				"failed to read nvmem cell '%s': %d\n",
+				desc->cell_names[i], ret);
+			return ret;
+		}
+	}
+
+	ret = desc->compute_hw_version(priv->dev, fuse_vals, desc->ncells,
+				       hw_versions, &hw_count);
+	if (ret) {
+		dev_err(priv->dev, "compute_hw_version failed: %d\n", ret);
+		return ret;
+	}
+
+	if (!hw_count || hw_count > THERMAL_HW_BIN_MAX_LEVELS) {
+		dev_err(priv->dev,
+			"compute_hw_version returned invalid hw_count %u\n",
+			hw_count);
+		return -EINVAL;
+	}
+
+	/*
+	 * Store a copy of the hw-version array in priv->hw_bin_info so
+	 * tsens_register() can pass it to the thermal OF parser while trips are
+	 * parsed.
+	 *
+	 * Use devm_kmemdup so the copy is freed when the device is unbound.
+	 */
+	priv->hw_bin_info.supported_hw_bin = devm_kmemdup(priv->dev, hw_versions,
+							  hw_count * sizeof(u32),
+							  GFP_KERNEL);
+	if (!priv->hw_bin_info.supported_hw_bin)
+		return -ENOMEM;
+
+	priv->hw_bin_info.supported_hw_bin_count = hw_count;
+
+	return 0;
+}
+
 int tsens_read_calibration(struct tsens_priv *priv, int shift, u32 *p1, u32 *p2, bool backup)
 {
 	u32 mode;
@@ -1209,6 +1370,12 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-tsens",
 		.data = &data_8996,
+	}, {
+		.compatible = "qcom,qcm6490-tsens",
+		.data = &data_sc7280,
+	}, {
+		.compatible = "qcom,sc7280-tsens",
+		.data = &data_sc7280,
 	}, {
 		.compatible = "qcom,tsens-v1",
 		.data = &data_tsens_v1,
@@ -1221,6 +1388,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,sa8255p-tsens",
 		.data = &data_automotive_v2,
+	}, {
+		.compatible = "qcom,x1e80100-tsens",
+		.data = &data_x1e80100,
 	},
 	{}
 };
@@ -1330,12 +1500,18 @@ static int tsens_register(struct tsens_priv *priv)
 {
 	int i, ret;
 	struct thermal_zone_device *tzd;
+	const struct thermal_hw_bin_info *bin_info;
+
+	bin_info = priv->hw_bin_info.supported_hw_bin_count ?
+		   &priv->hw_bin_info : NULL;
 
 	for (i = 0;  i < priv->num_sensors; i++) {
 		priv->sensor[i].priv = priv;
-		tzd = devm_thermal_of_zone_register(priv->dev, priv->sensor[i].hw_id,
-						    &priv->sensor[i],
-						    &tsens_of_ops);
+		tzd = devm_thermal_of_zone_register_with_bin(priv->dev,
+							     priv->sensor[i].hw_id,
+							     &priv->sensor[i],
+							     &tsens_of_ops,
+							     bin_info);
 		if (IS_ERR(tzd))
 			continue;
 		priv->sensor[i].tzd = tzd;
@@ -1443,6 +1619,14 @@ static int tsens_probe_common(struct platform_device *pdev)
 	priv->feat = data->feat;
 	priv->fields = data->fields;
 
+	ret = tsens_populate_hw_bin_info(priv, data);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret)
+		dev_warn(&pdev->dev,
+			 "thermal-bin failed to read FUSE data (%d): trips with temperature-bin will use first entry\n",
+			 ret);
+
 	platform_set_drvdata(pdev, priv);
 
 	device_init_wakeup(dev, !data->no_irq_wake);
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index a35b15312961..24489542b8a2 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -40,6 +40,29 @@ enum tsens_ver {
 	VER_2_X_NO_RPM,
 };
 
+/**
+ * struct tsens_hw_bin_desc - per-SoC descriptor for hardware-bin fuse reading
+ * @cell_names: NULL-terminated array of nvmem cell names to read
+ * @ncells:     number of entries in @cell_names
+ * @compute_hw_version: callback that converts raw fuse values to hw-version
+ *                      bitfields for thermal OF trip filtering
+ *
+ * Embed a pointer to this struct in tsens_plat_data.hw_bin_desc to enable
+ * hardware-bin trip filtering for a given SoC.  Set to NULL to disable.
+ */
+struct tsens_hw_bin_desc {
+	const char * const	*cell_names;
+	unsigned int		 ncells;
+	int (*compute_hw_version)(struct device *dev,
+				  const u32 *fuse, unsigned int nfuse,
+				  u32 *hw, unsigned int *count);
+};
+
+#define TSENS_HW_BIN_MAX_CELLS	8
+
+extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490;
+extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp;
+
 enum tsens_irq_type {
 	LOWER,
 	UPPER,
@@ -533,6 +556,7 @@ struct tsens_features {
  * @feat: features of the IP
  * @fields: bitfield locations
  * @no_irq_wake: if set, TSENS interrupts will not be configured as wakeup sources
+ * @hw_bin_desc: optional hardware-bin fuse descriptor for trip filtering
  */
 struct tsens_plat_data {
 	const u32		num_sensors;
@@ -541,6 +565,7 @@ struct tsens_plat_data {
 	struct tsens_features	*feat;
 	const struct reg_field		*fields;
 	bool		no_irq_wake;
+	const struct tsens_hw_bin_desc	*hw_bin_desc;
 };
 
 /**
@@ -568,6 +593,7 @@ struct tsens_context {
  * @feat: features of the IP
  * @fields: bitfield locations
  * @ops: pointer to list of callbacks supported by this device
+ * @hw_bin_info: hardware binning info read from SoC fuse (populated at probe)
  * @debug_root: pointer to debugfs dentry for all tsens
  * @debug: pointer to debugfs dentry for tsens controller
  * @uplow_irq: IRQ number for uplow (upper/lower) threshold interrupts
@@ -591,6 +617,8 @@ struct tsens_priv {
 	const struct reg_field		*fields;
 	const struct tsens_ops		*ops;
 
+	struct thermal_hw_bin_info		 hw_bin_info;
+
 	struct dentry			*debug_root;
 	struct dentry			*debug;
 
@@ -677,6 +705,7 @@ extern const struct tsens_plat_data data_ipq5018;
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
 extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_x1e80100, data_sc7280;
 
 /* TSENS automotive targets */
 extern struct tsens_plat_data data_automotive_v2;

-- 
2.34.1

