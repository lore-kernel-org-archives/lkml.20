Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4C4F4D17
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717727; cv=none; b=pBjiVA+mKjX9fxGimyqdXAwzQrl4LybfZ9CqO7/t8qQH7kcsJKPa4zDvubheH/kyoMygFCpw/1sXr0q4q5BojBzgBBUhjBOsRP1bvF0z8inORVt7duUHpNtXuVaNOx9p68ZS0y1j0xPTWHQIDCuufJEbGGnwJBbMBVxHSIFro7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717727; c=relaxed/simple;
	bh=CPcxz2/VOvWAWtViNoiWgwxMugTpbWTs7rbDXCSIDRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0DSv8vrA7oEpfbtmKF/woqV1BsblqSsQQjgG/lNcI/tE1Dv8PPL+W53hX3YTJwu3U00amfGhcESETYXFu14xKC+dWO3kYrIA0l3vBblFoDFbpVmNMUHf5mlaQ7PgVrZBP4mBIyCEeInvsUzECgNmAez+yZ+1etPh+0Mvn75kXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbbI+5pU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyA7T/pH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbbI+5pU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyA7T/pH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THgda13842806
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5t8ikYnzF7L
	NMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=; b=EbbI+5pUuEYeEWFzQkLfdOqBb9r
	57jd+IWs2QjkTmw89kSwc+aGvBUmg63mI3/nUsicr7xUzrn30xBOhegxH5CaPcRJ
	keirJkLIsYhl5B9OEOMVTKBSPnp0LtKWbGwyKaL5XY4ybUE5JjFkZjRaXE9zagrX
	TP55GFzrKmNxfrg232QezIFFBHybpYij3zv4pz5eLwqNAhMGQLErXH+WD4QOS6mU
	+0gQC0JLBH4ae6cNYjhjyXL6LJ1lcy6nr+J1Ug6BA3JGazLcDqD2D+eUJhoP875A
	2LRSgkblbFgPW4xA5vTwc0+1awhx3NOC0xa8XFTGdGyUZcMABBDLgLglL5w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0vb1y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so9274199eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717722; x=1791322522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=DyA7T/pHueczU4xlfV2Vw9tU7JcdgaiCn069od89nebJEtC9V2uGUEhdpCnJLWnEup
         d0DkP3XgNEKFPLjAqC4I+S+ad4rl92R8xJqFCk8ehqTnP5TC687OVM0wtwjACS/r5gZj
         0OqkqzL4aS4XXM6D9YFb4qe8jQokEJAd+trENttL6jeAkW+WjmUNG3WS0XpsjedV/F0t
         QP5wRH5EXXnhVCnmA9ZQTkAOSU08JdKcyzWEZsLtSplGwvwW6KNpgjVm5i6+OUhMGUnn
         /jdncHECl783OWZEsbG05pp9tkXaHV+5/i0Cjyumakq4e1inf+D5mYNr9OGF0mBK0t4f
         LFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717722; x=1791322522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=ZQTTr5BJt2OzLXE2TXmwAt4fJU1ZuUh8Q2y4u1axyaO5VlwkCNBCGVCRGvAja2RSZ0
         uhcL1Cs+lZokEQ/BqqlMilfe7+ibZbEPB/aYP4/krCDANxsb6qKGLw1gSlb7YQpjVoQr
         n3gpDnUdSOEK1/Yc9aBB9tYt5ksBcWgrnK0mVsQ3P9hwKoRCzEw5GQBAofCMW7uIG7wT
         i8QX01/iLThUjWXfa8Lcl/N7F2Bhk03TsS0f3VdZSugi5KawUJq2VE6aQQMi5FMo/AP5
         81sbkLRyCuGJqIX4F8QxFpyX1P7RSZOIkIMjJz/Pv+colvH4+NQYJwtOhpDfMMO/5POy
         bnlw==
X-Forwarded-Encrypted: i=1; AKwUvBxQGYxfKUd18bEiRdXH7vaipuEQD1ecNwZYMRxUTomkCufsl/iU0IQggCEUEpR2B8udlCn46R3Le5eLtBw=@vger.kernel.org
X-Gm-Message-State: AFuF++mtTjTGTVvKN+8S8lDPD1ruDyRMu8Wjpbqjqms115szKRm1qQSl
	5SHCSpYQdggM8QkOTkL+UqkpHr1feHblAuH+lrdcL/9U2Rde5yB8TPiSaSj6u0WLAWzd2I3NFmi
	Dop7utnYDe40j8f/dzubwWap8Feuur04HxqFgHC6ImYpSmEyZKjqJzkoz/Wj9rOj6YPs=
X-Gm-Gg: AYBFou1bL6zB+Qptdj7nd0zLRUcSlc6437bsnllbvfTe73CQ0qLnoErMUiKJ0uRQt4E
	YeKBqvmxg2DRvTEBa1/7+fbxbt3Wz+tdXUnsVYRSxw/DPNjU8Kpzo1MVUEo49zldSRS1J4ZjLwk
	HRBZwW7HvXxEANkFMM/f7aZnaa+KU2p/nxG2QJFcUkFhs8k/PYLCQ5jsYPa+5MEkNPKDj90l9KP
	g5AvxisG+hEubNjIfzQtT8B/oqYf8diSTevFHT+SHKdUjmRts/+tlI2ZkQm8XwZ0AbaZM4lqpMB
	7Dj16+32ppKJmwco68VjEu3r5fPD4NRGtMkkLCKD/vlvsmXcc/VmfWtA9JgJYzQhcEbiF8L89Qm
	C/sl2hwi3VFEp8ETkFxWmty+NfA9SGcRaWmMmwkNqCWMUIn6iZbk6
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576255c88.38.1790717722460;
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576206c88.38.1790717721869;
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Tue, 29 Sep 2026 14:35:10 -0700
Message-Id: <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nz1W_tXLkO4SGR_AYhHC33NGhao7dCSD
X-Proofpoint-GUID: Nz1W_tXLkO4SGR_AYhHC33NGhao7dCSD
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abc2f1b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX/faLfKrUCinU
 VLqF20VrL25etiiYWF0X4OSExobOTbQ/V0xRLc80HQgPMLN4CcMKwnjQbmxfqLjXjrJtspk6Ad1
 99d2oIGOj+O17+fMgm4IYPlLvdoXThY1DgqayIjQi1imSiwvRPHPybyXv/nQiwHLwHIe2EnRIjB
 ONyDSbCTMNXkRIFVhDIpGBw36tBaSTxgE6kPneDr8HYOJ1fCH9EoxJfdhjc9XAaYu+B6urS+ohH
 l16lFyXFRJQqfZ8yhqNRiAALJuMJkB6JAjdlWAbxsE6C8xAGGRHzQx3pnagnKqLDibtWFdberXG
 PJXyJieq6FycWDP5eFvWRWFHri8rYZWdkuAcJSodpyAOXCIM6yDiBsv9JCQFlmxvcyo9epC9YOP
 QuL6v+/jyJLkcFaHviiVfydCqBJ0ctrvTJvuVhCQMXK+tzIaxlsAjAPsNFORCxnWCEt1Rg2eqFj
 An74js5CqcI50/69gJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXyp6H7eDOZAoT
 PgzMa6BL/Ayoa59eRkOtBsDlfhoqjnCDl7XsmLKVAbQP06G/rLivLwG37RpYO2lfAwqa5oR7/LI
 DrQoz6a1fKLBTMhywnb1vfKehNjQaF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48e474bdf818..e227d05cfecd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

