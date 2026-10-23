Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768178;
	b=l4pKbYytnIcfWh355SUqXWgdhPj98O1zdnRvPZl+mLvsiFImMp9yUS782KmgUs+55UnV
	 lU46UufcHr4FG+up8Kz0Gk8Sv8RBQtX3V/+Gi9aLa6SGMvosKczhrvUKr3KV9nvu9AGgg
	 PIjOu/LFy3KFFGSsi43lH6LbgUiPRt5eb24vr8NhgImiLFnU2cWpIELs4Ou47LJc3dfe6
	 GISr5uIRJDOcxRYvtJPUQWSewZl/Ib+ZlV7EGO7TYZ101wfSIN1WGt96OP91Ovf2a5v5r
	 nvREoUxyqednw9eKQfvG+XLJ3z5nQYf9rxTP15QDCm0HzwMV+gKaQoArAsh75FNNODQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
	b=mwr8467bLqJP7BrIX5WDxe0ojQoOtBy6fJeM7B3L8H/1cDK+o2jp+zqasfY7TR5pRgkD
	 x909UwVQjpWJDk5cbBwEUNYCRJ96fEnBwJ+IxzqSF9W0R3PbkZYC7w5sRPYREm8KYWez4
	 Eyw2EGBf8/D/zIlaubxGcchvwSm6/gwuyAQdAokhzkDRN0ZOwBuIjKfTEbd2PcvVv1GBr
	 IhevlIK3UhYrCdGwB8OcWex0bvNButONz4E18+dvGFGTkNdD84AA2HlKg1p0uENUHFPAt
	 GLyyfFbLSijvgAf+mvFY/XtCV6oRlTLbphsIGpGzqmvl1agvoQP207dmWI1JSfwe5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB042606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB042606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CQ92974567
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=gf+4Ox1pI1TJJiqp
	t3lu4fUZWLnoa1a2jMZy5jsyEYxcwmUATjZW4xGitP3AHjJFtnOe/ocLMBvIsO3t
	w0Nwc9goGRkql8MWb67cNqSjA0VuxcaYrADgiaQsLanKdSdiI0r8+LVcJDFU6i1I
	Nnjm9gkymXlnNuml2qcv+3d2Li5PjObCfClZRqf5H04cDuuImGk7S/cFRrEeu+Oe
	0UQcklRe1jOBfoxoV6XA8pxrfSNMBGe7FqOZycLyi8D46ZjUhz/j9ZIpfbMZbnUT
	5TpRb0pZiYVqZsXmIULFRH+E687Nsf71gQBvc9Zisimwvj2xWO4c+bLU+4bzEg/7
	F0e81A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4qss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so199925785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768176; x=1793372976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=Rt19+j7QgadhsvmGbM3BbYhgP3TYDl6s/nsDBcknPsqOSv4E8ZpZrSh7p3rbVnWXs/
         12GrFPLH5Vpx/j4Zh2F3+9Z9XS1eES73BS3pGnYoQ+XeCXx+FaX55BDJDGpOjIteuz5k
         Lwggz9iJnsM6saA7cjC3DYxQO5eASS/IHzw64TJtMCBfLKNw/sqip5oICaGkyM4J12ds
         7kIDP7q4srVfqM3zeZ7w8Y0CuTwt9uovu8z1PzD3JwEdfJyH+UZ9S2L4v14HATXKkGFf
         5qTKdI8mP4YWmW+hZcTFNqqbuzNvKXSfZ1HuyHRmHFJpgZFKQBG1WueHNKyLG50uRNkt
         J44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768176; x=1793372976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=cRjDi4fQuzjScPSX7LT7+QsmD8huNdTg0DvFDevahgwSwdoSaDRCJzXnI3ydA2WVFB
         MCpuil7DD1QUTOgcwobWrxeBk8OZu42DStJWOcSwsfalJZ5On/SRlGhAl2OEAbHUjsWX
         6ScQ6pdmdM9qDu1m0UHVlvEyyMwJmd6fZl1lKKQJ1u2YJECv1MffyuNWBTL/Jwvg9Xji
         4f7pKgxHcdO9p7tnNIqpDrF4sQOXXN6EQiinJgEdO8dOui57LRect1gT3C8aCAWVwEYc
         f440fGTzvwIC7qqntcqEhRFURZqzP4x0PI13Vn+/dN7piz7T3XJqPSLBycy4JQ+Sy00M
         4wXg==
X-Forwarded-Encrypted: i=1; AKwUvBxzPGQAHkfPREOk1OZfKRHKqeWsgVvusqrVWGtI0Q6JqyGu5uFgPP3AnTw65UJuZKq9Xm3oel4aZX11rrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYInxR2b6D0J0hUMU2j2M/Fwc21i5XlHOJUOzADME8xJIIB36He1
	uYz6CgGNHmJkZNJus5kHZeunDuqcqGQpF31OXAI46XIHrYFrQV+Vq6A8XtbQWYh6Tun2QG/jv9D
	51IdSN7TkH9Zmd1jCjZVjpwAq/YLWYhNMyMmPHjBucjP28I9MaSbuRsnaPGMIlL1LveRPSdUGVR
	TKMg==
X-Gm-Gg: AYBFou1Fn2gln7lCLjplibwixL4sSCQhCH6JiaK3D/JD2pvRuBwqeSjJRKYwmPFjYTj
	aGtBSU6B0tcZJQaUPwDIOPzxViI37vb7HGtCuMD6+3JpLBPJFSNCOQ7Qh61xHfFIxzBj91hFNod
	kPIx+/VqMmyKknkiwkdLvzw7cPyDckoiFzcF3XlcUpQBTCgHdsRPyIgT2l0lM18uTsYJ81Mrqel
	UnyDqcUxZEMeEDDhRBDu7UDVN7GaDtaw4p/ED3v62L/LfO4MCg4rmtOYmJiV4D5yOD9NHVUR6gM
	iPkqSy+SBknEfJNG8lK9dnJcqEooj1M5cKka7ApfO8AnBfQTCUZ/3nAFB31IMsGzZW12wfbMLf9
	hucJOQFRm54gECieQwzDCvGGHNZjBX35+X5CcIXl2PKtUjzulGi6nttlQNda3DdEKzkd8q/OzGk
	qDujwnfcN1DI3ISQjcfpho2p+VkrMwnCU7ycSBlto1Xhn156YSY/c=
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945066685a.14.1792768175980;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945056585a.14.1792768175420;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:12 +0200
Subject: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 04CadUh7ibU5Qy8wh5HpecWBDYNrWrk-
X-Proofpoint-ORIG-GUID: 04CadUh7ibU5Qy8wh5HpecWBDYNrWrk-
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb78b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzbdtZZ34M3U0
 sumo/tnZdKLPsid/E1D2H2yav02Anvt8MyBmfVcjMDu4UY0hyFFid6SfC8B2WMoPtkD0liz4knM
 ONJNJ4VKMbJ4CyOghv7Z9RvZOJ8E7Zk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX/m3xtTlEgzPT
 IYNvSI7n+yMmb2AnTCdQveBWwB3JiY++Q/bputb1UTWenYB4bI16gv5WLd8EEE3Q/TfMnfoYNwj
 EKiHV+8y70pqL69rqvhUZ8VtMtNF/XM7bPitGVsVqXWt1LEOV/m2QZ5Yv4HbZV6e7qtlUv9sPAw
 ccDQfkmBlVJayo9rJKnFU+olKMs3m27knFNunutOVG78eirBYzcz4bV8/P+xKQ6etOc8O6n4YgL
 tKuCMCtUnMhh4aJq0xeLTH5+8F8HSO1uETRiex4Lc+oa3NpUgT+Y9Hv0n8TCDLDF1cczOxeXwQS
 optASqnk9b+zDvcN1nEAFWdLx+KTdX3d8Hco91jjcpzkBqs9OB9uxaaLrDuySM/j9b5WaNPdRf4
 GWXWNlqgHTCvE6I9vPBWakigiz69uU5Ajy2bBA9+MpBuBVfT7N2xDnOydQtfxbmB9+Ot4O3u/+V
 kb9oxecse94r3jop5jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

