Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1E46EC98
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363752; cv=none; b=LCtYPc56Bxk0S1DG1cAtiiXY4oZvh5wR+rNp33kYB8EAXnoC+How7ZsfI5jDjh/RnhczXMh8kHzkaAFzcqD/pHjS8KgONcGCjJ3YYGAjzRj7WzLzvj8iZQqvT9L/t7//W3v+vceUzjW3I6PxXffhEjN1bxzrQ+k/g0vffb65CwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363752; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fw34FXwPliGQM0AgadR61ZXuWxSZXvAmQrwzTgmqKIrdwbUAQpk0WhjeH/1ZQxDc8F8GruEDmYHxmNOaNsJuZAWDw4sb5PMjANfM4P0ofxRCyWqnZpH6fj2ElZrcSu5AFkpPtua1Ojlr4sII/qFQoUGd+gJ9DXV2xOKkqa1S86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH7Wmike reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH7Wmike"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjEB2970140
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=HH7Wmike1lXUF8mARPRXqCIO8+t
	1rgK5rDHsaeBo/TBKj8+bXQioYfHE8Xfq41tAckbE7N7iIu4lt1TD/tS1mWVxKYA
	eu8+NOJpPzvsPa+WwG//pq81Jovs9HxdUlJy3uWHWoR5M48M+MpAdGSe1Drj/2sT
	lv32CLUL2zIMTGYZ29UrIOd6fLWEMNv0bUsSUh2Jwhvez6bk5NWGB3Ts6VSSWuI3
	Yx2tA9ZQof6kSsmQblUslBpTB5WMYBA7pfGnDWxWW3jKU6xsHAHO4EiCkb381ZxX
	9pWuzxLDS8A0RtLZ/acsE87OwHBW5irb7cOWd/556iXUrlXue14GC8XAZ7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679buu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca4a2b9c4so843206685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363715; x=1791968515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=jlI7VqEnWCl7nyVeybCfIsAqMGNuOHKh9W3/U1YlpxhV2gSXpW27ygcRK8lJhHT1f0
         cgCg1Y7N4l+FKpWrvjoIT6bERVsDS7Y6j+Pwc1yCCf0+8rPJP38dzVyxIoEGVS1hpCGH
         j3ZbHK7KR+Wam/mkX7X3iENA3HZkH20nQcax/8MzRiA98CDH0RohtaLulQ14P3lZt/UR
         mJ3x/UQknY9GpCvxDuZxdVkYaZ2LqM4e5LvI8qttMbnMpjTJmqn8s+V6oOjNYMFESFJ+
         vBr/4dwr7uZ/3fENhyF4ZrdbKIyJVit3dhyLm8+2E/s74HNj2sKrAC2gJDesSS/9RaAf
         cEBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBgoNcuhlWZvsNEzRd3ySUhfH9c3A0TelqJrJsV051AeIBcMe7WwLBXf3E++cKAItaJKqOGEsZ1Orento=@vger.kernel.org
X-Gm-Message-State: AFuF++nANifr7e7dokH/mzjiN3XrnuZuEKiSDl3jjNaDd7qm7HOxN9uq
	c7LTF7KO1B0hekQOvDIGK13sXiv4rpHaJFxtmNbWxa4c7z2trYVZsEoKvea9iwMx8WSyV17lP+s
	A/dcswaqCMhJhOuD6/Zkilcl1izOgMBgKPAGUW7X2HDy+uWAMqA78uKN2jaHsbClbhYg=
X-Gm-Gg: AYBFou2fDkyVFAooORmsEF/vPQoctM1zzCBSIqrwb46+t61l9Y/WWybjyvkCthptPOu
	FWlebjtCBe6nCfDlh3rth0scfmQQZs8RRaZ26gWK2OcvXLYETYnQTq4+/0HCl55giYA44deQefO
	ZwbDaxB4a1ZmTzLqZVekpe+6mU6YPaBkMj+cOcNF2ImUFooaJEQLeFEF53Ec5/3G2SY80pS2nsa
	zaRkdMHgjd30AdwJxUaaHeK9jjNas9Jlq2SASdNuNIFi3/fjSjIYMzErOLrE0nMVxOttHBx2Mzw
	YKVZhNiQl86V9bIVL+v2HD9C8f4IuDxx8pSBkXnL129zNWLPTzDLR7gbTds=
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290930985a.74.1791363714810;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290923785a.74.1791363714297;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:53 -0700 (PDT)
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
Subject: [PATCH RESEND 19/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 12:00:15 +0300
Message-Id: <20261007090041.3732717-20-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXxcgrYi2oSHvl
 Z0M7j0hmCR0IruqhPh7Baimfj8hva4OsNg4xWa7Z1Mf/RQXn4MXdUqcH5hGqdLT15BwgpuYJxXl
 UOtbjqgW0k9GiHOiJTKbOJI4j8GzZiU=
X-Proofpoint-ORIG-GUID: KDTyuhkx9yP-qjt_pnfhqpHkDZKC7DeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0AOOJo202vxP
 hjDYqky82JMJGxJnK45ehO6XrrqNPDSu0Uoddh0iZFesZ/RhO4Pe70xRIIckKmizFKDlwL83cTX
 21G6QFTHihi1KfZaYraFEH7aBrOnh5T8qoD42YC2o9ghordFNaQyIcKtd1IMcTTo/mol0ttbArd
 u1Op72wzHvWwXDY5OmHQWtC953fARbGIJiTJa8a2izxHPXKpZwTdKH3NKPyQCGclwxGL8Mm1pnE
 7mFN0DUnEqkh8+0at8alv4zlc0K4jvd9eIBwEjEXuuDQ3MjL5fl1wa7FvMcw8URa9t3xH0UIZGL
 3e7dlpF5vqO0HYeQ9BiZ5MRN4aUxNyK+52wemfJY/2NV3rtLLt8NKHa5ra7KgR8U3Yj2h9FxVZu
 2sceo+3iRxCZbZ/Da5Xz5MkXwtIljkUOmJi5WaVCznXwuxOwuIDGvZfaVxzpdroEFSvEUXdMPFz
 vtIaFPDXG7eKX83vYUg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60a83 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KDTyuhkx9yP-qjt_pnfhqpHkDZKC7DeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

