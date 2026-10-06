Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF339CCFB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326433; cv=none; b=O2aWaxl5Lo5kbGlNTNci+IXN2J8uWoocfjFORz9Y7UQDDWPbO/7zw9EJJLH6q2wEPesC8j1g81ufzf7tygoo82eOVkNUf/FsiakAZFDlyZ8nI9FkJcRSrxKNTgNaAlNAsps+A9DZE018cAqYZ28xpaUK/kNtmaDHqb67okz2tRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326433; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQv+xWx9ocdpVDJtgQHWlZXXK095OpskF760YJSTWH9vXe5rjWJwWGBKxEETYcwJ5UPWjr79645usZaHrqdwUj+l+e8rz2hCX4X7hlRlrNmFy0DVAziSfjZzw7fj8vdHIyUoi5CEdBvZmvgR447uQC6LoD08B03D6UQ8ClpmF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO3Ga/vC reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO3Ga/vC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Leabc2514102
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=lO3Ga/vCQOvPl4lOiWmolG206QZ
	LpBXrfJTW1Cwb4SHy15CVGqBnmXt0bedrW6cu7VXhPBe3gMc0dJKf3aNDCBj+Cu8
	DYZKjxTUVke/IxTA3z2TP4bYfizpxYNzv4RjxsJrcnTyG9vsrK7uIhw47vLrJoMT
	+qdW6BDDzBxMw/YXT3YkmoDknj12Qb5I/qtSFn5SkqmqQA+8SKDTTRphQPU6loGf
	pYa0AQ4J8lf/QJKncpr74UTxioJDZbfL7M9YRYnB34oPJJIZtOmLTZwMcZ6rmeC0
	OubHJvgjQ6S1xFKvPqFFPV2purN1lG1NbQbL9thCsuAI5+kLuZdO1+gf9Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtw74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so602581485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326425; x=1791931225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=2yUf/flIxulTGUxK+LoxlD+wSbEnsO3OarXUoWkTMDMBgMIwSKGzGj6D6rGGxlrCKZ
         i0aPcV0yFNiOB/bZ7nPnDHl0OscIOEQgYZrNtesWd58ShWu5T200u8UtZkL9DUgjHAKV
         JWdNM+MQ1Hs/W+5ukaK4P2CTFO5UKgipWeaBV4JeqegUGptHepknRhke88sB1PSvdnUq
         1UwgiIeg+96q+xWBDBKDBzwqxJyyRb99oFdSFJ9+NJVZ5nfgcJgMY+tvxiUk/4LhSBL7
         S7pjiafISH2tUaJFIigywfHY01I8yflHfJ7E7wUcIIiu3MYc2TrxJSZFjA5YaQ0+6bpG
         q4Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxmPTdTMOsrJLs+KHsIzYjg6tgxQHb1762grQ6fkMYLNSFnzEgJLce+X0mD1cdslnwPVyLz3ictFo8QeVU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQA2Lx3j9Q6BsUHSLZ2kedtIK9LGsr3blxNcvBxVsMFpDwz8Y3
	z3goXtlh/F48Ma6CrqnJcrduNqpAaU5X3JCb6D4ZluPBlD2/O3qx0bHD4FbgLGoPLel7V5DzG06
	ZzBQhWoB8JEKRcku72f8VcE5rEDwWgd/akgX8iD5JaVkMunH74XKIE65unzcAKm/52YQ=
X-Gm-Gg: AYBFou3U+zk4I4Iizt2mwVUu+8pSkOMmK8XUVe9zJBWI4tUx9EFDBGL9oEuYXWvaDuP
	O0Nl2AXwh3w38HuHjGuDZNDSzaAt0gGJrdot+R0aLhiMPxpLYY/RVt+wluThX7NS5kvZM+UporB
	TlX9mDPDR4SA7xPzL4iogfHegOPyLWEXS2Rv4FrrToyUSXou3ei4hCJDw/0XhykrSJfFouz/UNM
	66NYuc+ijrxBcL9niwIwkJCxwYgGn5V8mBd2DHuQ+CMhGBbR173cqJnlvev9MFbW+vNGfzFxRXU
	EABIwOHYfr42iUBOHySu08HdA1VBn3NW7opzOoNq40moVcmfsWvOfDoclts=
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80367785a.72.1791326424855;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80363685a.72.1791326424280;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:23 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 05/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 01:39:13 +0300
Message-Id: <20261006223953.3382273-6-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3VjxpDEldU3S
 saBNkfiku+tKg5edm+02wkzRJjROjTgWgb4F/aPQeSFzCoiZz+g/KvCFzIzqWfU1KMhN/nyL0BR
 u+A+rdjgk80NQzN4n18zhZlUgBCWGIQJbBsVA8yW30JM3EcoWYpzsNxIQjIpKEkNEmgHwb41pBe
 OIlix6Ru7NVao8kCjb1BNQuizkXqgitg0CbTzrqkc6eXOzyRbhYOEmSYh/T7O4QVRkpowXo2rd7
 vZJhnETpwnQWv4Xlor29HGCgtQMz7FLu3UQtlPPvGNvV0bQKwIeMKZLa2mRFZusf/z5SIuFeWHx
 YZ8Mg6+Z69dtgts/+cax/VMFB0qyvQYv0cWLWNJqBzfFpnS/7Iqz/7pxonSrU/9KVhZJneVE+Er
 F62qgOUT411QqvqAJvaSf8JYrTZemUTSHyhIe4hxgErVFYN8h8E7Mvhc9tWh1tCjd7tWvEibEWq
 6qGuPZ60VETF1TVKHxQ==
X-Proofpoint-ORIG-GUID: tySaHlgCR_mMxg8J9RSuEPUCWNu4n7Zz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX04a8JvDmBLjf
 D3muaMMinWoRX7bQtGWKbrJ7nU1/pjAI5HJg/hxfY3qUwDcANg+C4GuiU/hJZ6AQ6gkXIf7uKW/
 6kX91jXVuwy4k/BOCeN0LjntFjLQI4k=
X-Proofpoint-GUID: tySaHlgCR_mMxg8J9RSuEPUCWNu4n7Zz
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac578d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add a stream_count reference counter to csiphy_device. The CSIPHY
lanes are enabled on the first stream start and disabled only when
the last stream stops, preventing a shared CSI PHY from being torn
down while another output is still active.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 9e95d04b7235..4938e56f481d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -324,10 +324,18 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (enable)
+	if (enable) {
+		if (csiphy->stream_count) {
+			csiphy->stream_count++;
+			return 0;
+		}
+
 		ret = csiphy_stream_on(csiphy);
-	else
+		if (!ret)
+			csiphy->stream_count++;
+	} else if (csiphy->stream_count && !--csiphy->stream_count) {
 		csiphy_stream_off(csiphy);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e55c098dbe67..8c1eb83de751 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -115,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	unsigned int stream_count;
 	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
-- 
2.34.1

