Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D845352022
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140224; cv=none; b=dV+aFJdxLyXKxAvBOVbFqwAWRjacxUt6+kXjRSq0vHNlkx4M8Rzhjl6xdCxIvmoaXsHS87FAmwhNbwazue3Dflz0y3S6pApFR9P5sVO3zEVHBlHQ4dp8BbN9Rr3hdJykd3eKbg0Y9Jr2QCWYU/QUpMYaMr+Cwi3mbP6p2m2Wr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140224; c=relaxed/simple;
	bh=fOozqXRREZdVE1IpU1zeudvT0HR4HrTNyPKFTzqIpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6+EUaTZNg5AkOanwRINkn0L83/grwvtEtdH4XGLVQDpKTk04tdeXoC9JZ2Ca1cnjL7ONlR4BD/nf0AXSVT5M6qkzV9MnC1xq4Fbg9Y4rT+sWAzlKBX19rdlllaG0r7mUO2khr7mt0ehsRjXmoPn0cAFyZlKFpXcYKlb3JT1J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp4kRRQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbuXTZ+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp4kRRQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbuXTZ+4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmGnK222842
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g5ESSTcnZuT
	5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=Dp4kRRQpf311WuUvZyTt1GXXi8G
	mQYJJF0dlzq5DsvMj5qcT8+2XoHzzdBcsvCTXIZycX1tPeuDr4fJwTrinWI+XCIS
	RZr9KMknF8zabRu1Z99rhRnOTBmnz+oGP3KkyHZ/x/7Zkp/P/UnBfrcxzuo8rRxS
	AYpK2/Xy0wzFGf0g/R79AgTuzeqTejBhWQo53tpIEBFMzeeLvKLYRq+pN/aM+N/y
	Rh7oNoGRbqeQPF7851HTH+/1Hbt0SxLjaX2xCcry4jhnQpsiJR0/LIXHo9rO0VF0
	5rigtLFxh9aHI/uR1xm1pDcI2KT+d9BFbPNeCGMghN2kgL8UZSAg7Qt34eQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdradyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso250190137.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140221; x=1789745021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=cbuXTZ+4WkyBb4ynOOSGwOfliiEZM/KTP26BW0R/sYoQJx1RBTdZe44NqKNuhDinR1
         IohOxOvQG0Rn2IyNeC3U2rYsjCxE+r90+IChi/vseS0uyou3Z0IT4QHE51odPsPEw97/
         w1ycaCv3o0RB1gftggrWFpAmZW6fUTlY6FSpXKWmTpAr47ZK1ECJJDSBzd7cNUULnlkE
         ukN1MF/Re/QAwYHJB/nYK5x0EOxj45ceeWFHy2kDNbT87v9Vo5mfYYh8RHJvXay0aPA2
         3ZXua2SMV7heJEbX9RzQ2wzD2DuHWEgll8w0bOcOwF9oouYhDrPgTggkefGqv3zcp5rL
         QJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140221; x=1789745021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=jM+1716qPcnmXcqi7vR7xZM87+G4OmHH0S69acwwKrdDv3vvaB1gGa4pSobsrBZ5qr
         Y4A+QReEJCdJnFVc+NqtzfCRM0+0QzH2aZgP+rs1fiQ7iRSjIE9y2B2A/NTEnr9NYclT
         UavhO+i7wV1slY2yXFw5W2GxLerVCasWWGFpmXElVAr4l5cBQXyhkqGG/SW0N72CLEm7
         V2EuUt45Wz/D5NlqhdTPjmocWNl0razFWkHocZ/4/E9Rb5gghWBshkr3fHOF8SkIBbl0
         eUZbkZnlaMQyzSl5pE4IrjX+tE6iSZU8KS9fu9tX/gND7gPQBTraJwx8BNbqWZf/prUg
         wyCg==
X-Forwarded-Encrypted: i=1; AKwUvBwe7E7URymFgAMXs+lb7f4WWrZGRnRov/74vokTluAffjlYE+UCb29XjzjcB22tARbSCuGeWSpakPCqqvg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFXyYozTi+4vZyHhwCabB2E8voPLRJek6R9Yfu7pQloW9MuWD/
	Y2Uf4hl27PGmldq+DvlDLbYOaExRpR1dCsxlc3K7jXseNj9p3WNVQFKlivjrKi3ZHLnWorDAS80
	im1cW49WSpa24ONw/iWGYVU5ShwchBtJZEq2FCceJjWci9RJz8SxxeExzXkzpMPmKQS4=
X-Gm-Gg: AYBFou2DsPUMKo2qWI4eQEQUef59h0McGiwmrQOGQIRsKPTwdNU1atFVlElUwUHzx/R
	QX+pPEdhBSUDB0W3oOgUzyI6JOdpPExrk7mBs3U/qyyWDBzYg+pHBh1yw0NnmGsQyPzRRg69cl7
	UNHjMJkXODWGtbAy7kymWoewF4MXXzZ4EAKxYl8G23IfLsz2HkBLb6vOlvuNhsWpbuy4VZqj9ov
	KKWdyJDuCT+cRSCD6lAvg7cyUTK/OROd39wMaj14OANPEaLHmtXbii3cD3xvnDCVZH4NcVzjrqx
	BP07Tun8XN2tIWPmq22ZwDB5fZqMBZGkC6zD0uDDKNYMsUif6ymPpoQhVama0d09/HNQiFPOzbo
	wjyffpLsHXXRnXmZngpqBKpZ/i6nRKW9+JEEKgAc33BvDCGnSvyWbTfRKCnOUESYZD0xgGG4qNH
	+AJq/s7yxLpsJiOck+rDU7vtfr8wGmfpMLcmAE
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324941137.2.1789140220664;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324849137.2.1789140220237;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Fri, 11 Sep 2026 17:23:27 +0200
Message-ID: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VRaRF_ITP3Ya8r_JlueCQDXTNrGLPnfL
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41cfd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: VRaRF_ITP3Ya8r_JlueCQDXTNrGLPnfL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX+JnmG6d5yuKf
 6Eelk0mZQ6EtfcnoNCyEwyl27KI2x1n5O6XRPWIz6PZ+8DVNpmGZTWlIr+tu+jbmdLK5dZio+B4
 useJ3oXJOGyGtD9QO27uU8W6Hs4Ir6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX7tKjiCeHfuQn
 oH/5Ew/3ub2LvttuKkV07hfvY/JEOoHWeAflBpuAwqb5mo7KCQMaoKnE8MvPErYKy7qT5ruKJ2o
 cD+PZAaRAkW1YuMlZU7UGz/uEXmMxOSAHbyCRAneP7zmEDqN3tDVqR8PFCUocPw9WjicM9h2KU+
 j94WhyCdCo3Yg/2buzWhAhxZtqXKXPV7OYFIi9sipaTFvALGDqCL7ovd+PIrc0zqyKKiB2Ile2U
 3ssXAuKWYnxva4Q/PgHKtCkfo//1m1rnDTSXywT6sDx8rPjz3AIEQal/THv+Uv9QAvRzYEZdFjW
 6OwcSpg3SNDNWQc+OpNWwNCVlNsBAP7x9biH2Mb9ue8awheUQTK/VXZKtbEU1nX3AHF02Adnk7P
 0mhEdDhdCB8goOVcZ4qLV2LWCvxM1PgR7drkScBr4t9sfOZxDrt08Czl9MKqbWH3Fh/BEw6Dm+s
 Z2cf+NiEVeNoq02uCXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110214

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Add Fixes tag

Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0

