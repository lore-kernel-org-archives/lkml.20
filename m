Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D076846D085
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363667; cv=none; b=CedtOMWTRm3GqgKSkmNXQVl+ER2zRNDxUDQ5oy48y0f/zXIS5TYJHz8zzv6jeUj1/pSAScjzWMh0prNfQpYYaVkcf9kRo4U+qxx57WeWWYjh5KkppPZX42iwOcLmKgAwegmBsv4c/sqv8EL4jhxgOmVihOurrJcN7wGc2IuV56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363667; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BI+fdDdyelKLNTGn0Xfd/NyU3f6e5qovN9RKGjsu4qX9sv17btawsYgyYeaor4w4DD8dzSTCLp0vwnItSj/7uUwJhv3uBioSL9kaDDSe2/cftI8goH05uhgQ/vgR5KCZstXv+QEkrBLRag/kO+Fj/fc3r4yQU/CPGTHRAkDp4sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5qOJhLg reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5qOJhLg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbSx3298317
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=f5qOJhLgqYfx1alyOWBqLPh/23G
	MKD8+LsUXULbmgU8067KVe9KKvQebysD6zGihBJf1itBOUDrwB1AYbLcoDDk1bSr
	iCsQcfEF6Rxib3mT1KKqRTWCyGZHXQJ8N54o8OsN51nbVTK444E41iONkq6Woxkx
	cHRpgKRRmliy2xNurRGVnUafXwQgXiNPQVcezhk0KNrQrzulQBABi2Mowz5bIsmd
	Ssi/F9gw2eNwuKk1mtL8X6p8C0IB3EbzCrrBIZmQBvPGJ8dUvJSO1DtbyL3OR0FZ
	8DdDeDLsCwQYBAaIM2JOJea3Eyu/vPHnBs6iIeXqtk6jZIR8kM+Px/ULWtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso464574085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363661; x=1791968461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=qf97ZARWtYKWP6+QcvvNwxq79iUdj7M4EE/u6QJFNo45+LJg3R6ODLgCU89ZnVKgbo
         U2nv4JUh0AHvnNYpkCjlFZ+hMej/XRqTjjcB4qwjSpihbeXhTyLzesWTpWezChMlSnmp
         JxDw30J/tCXt6c5MmW4hV34zhF9Q2k1ObHT09zfu8yer9ygeEggINpBiaSaL7V5WeTkC
         vLWwbgI26K8qPoP9eACYKzRKOG03zX0DElJt8/VYyhxXRnwjtkyh7+q8rTutJHHuANAo
         Wo4KuH3bql9Lq166vOsyJR5CGU9oTjTsGX/AbMQnXcphI6yaTqyTUymd5eGczgMqd0rd
         zmdQ==
X-Forwarded-Encrypted: i=1; AKwUvByXTUWmn5R71xubpJeqhaKXh5sIbgOLDHGvNdCtqsSmLGAXlYErrugy/EebCuumUHKgh6Y9AK7KJ/oyAa4=@vger.kernel.org
X-Gm-Message-State: AFuF++kS9z1If89gwO2364ChTP9lw+p0Z1qLfMo9fL5bJE7YRsPj3aEv
	EvDQauZ78YbFjHdW/lI+ItMw4Xo7lEiu/pOB3hDh5Iz4cFUKnL79zINjWtCaC8RzZcndDDjS0x5
	rsXM8jGdW3rSEQ+9hbyqqWPFqWrQ+FPwRlw/RnbOvjmyVGb1EttwTWEw1OEJFLppj08I=
X-Gm-Gg: AYBFou2LBcaWvF9/p9dU/JUvhhTIm6cV8xo7qUaycYDpszQjut5zMQ72jx+DFLObMiv
	XeQkpHdhMrdVUan/GWHORGhAivTKG4k243vFhwwXQZ5N/8fp0ownp6i7+vrDRo5uv9KYOiE8FHK
	H/J3XMuZlrj0mcaZdlEojuFKxuciBEENgk4lJ38SVavYDJR8HeipdmSEq2GId8iwWJz/3SqjrqW
	/ZXy9GyKeY5dYaCCYCgRLFucZJdKwkutDEF1IARdq2TE/FTm/eS6hxw+tm31WWYk5jF31v9Pj+j
	94CTGNAtCShHcjTU3tdfRoAI+u/0h+TmZN6wwOGfK4SIjtdyFK/8Y1Rxk8M=
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197582685a.24.1791363660542;
        Wed, 07 Oct 2026 02:01:00 -0700 (PDT)
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197577885a.24.1791363659865;
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 03/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 11:59:59 +0300
Message-Id: <20261007090041.3732717-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G0hwKXDuGlJOV99QKwgBwpAwo5ipL2gY
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/ZWkUyWwdopw
 loTW68rwTt1dyDiWvKlnTmbe8kMWO/IOGQwxHkuRAWjihv5XuhEuyZqjyE1+oCLkLoucQgc5aZg
 pCEzx/oVHt36yoXTzBPPgRkwr50DgvY=
X-Proofpoint-ORIG-GUID: G0hwKXDuGlJOV99QKwgBwpAwo5ipL2gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0Rg2rj1jRqcL
 GqafbCES89VuEoklx3/HmMetZpSoCwBJxOZ9goZvTB4JnFzM7f+9EPsxKuvdOkh7F5PKySPPsox
 uyjheMYKdHnxh0TUk5w0SL3AO2LvKaLd0rOFnfWyywAk4ZW+JTOpqTlPtpQk+TObTBYoabIiXzv
 JytCs8JDOV5rRGqpCXQCT33rz6ix8TCAEXOop8ScDjz/aGo4r7WjWVzO7SdRNYZkzj8g5cFzVvs
 u7FFxF+9kU+PYrI7wI1/qcmAwTeQhRpbXs1U5nFD34o/66kdwkHaH74QNNMfCFdUB3nLfSXRfa6
 E4XXjKy/4++LvIwe3cU9D+Yaj60uH0EXuKq4k223vVlQyC3OGxS4JRMvpUikDlzkNoIH4TP8+aa
 fR0fG93vNKGDGoKNN9hvVQboyiSYVJXOF7t3e6hAvJmvgPnoZYCoVDPIP8q51hdR5ZEG+D+UCYC
 UhBerSNjtiogHzl6e0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

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

