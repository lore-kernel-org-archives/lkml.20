Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096D46D55C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363827; cv=none; b=frIO2H8Bymi6FZswCCVskFGaNCwrZRi0OcQMsvqvjn5PNwecNILSH9YMzJjx5tUhhdR4Dtz7kR8+/cc+AQ+p6KveKPWvpq5hYa4HkK2hUweAzGJ3ERMvEOhn+vbQZqSrJYem1K7fJ+JR5MOfnSx4+f0tPPTtOkvgLSfBQ8UDEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363827; c=relaxed/simple;
	bh=6Y6z1JDeisJ2Nl0/RT2ILCUl8kE590RGswDtsPSxnfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pf8JRmBpnnQH9jbF+eQoW6tAoKwFNpFYevcEQ2tQ4IVRtV8L8zHqhRKcZs13dsErYlZxhXtkQdyjp+lBLdEmI7cmlpDQSFtjB8v1RqD9Ca1W/S9qPRhsr+tcrx5ZW+rRYV07ol77tGms5fptso7ZHcC9mk1BWxMhX5sSGoMg/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn0+CLcJ reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn0+CLcJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jYiE3810943
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Wprkf4GoAH
	etdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=; b=Sn0+CLcJ12M7Ims03pjAQzMxsY/
	7Xe4uhqTKxDUmYnz6Zu5h8xzk+aSRFbCLeCEFEgEqeuNZiuMy53HiEFmA80ZmOOy
	UuDL5O3+xElLrTU6CP68TV2cwybIJoHNGCztKMXPhFoSOXVUxbTRN+oiGbcYursI
	hZWifqjsflYi0RxzzTvFcP9rRBng8VIpemZUlVYodKGHCXCr6mq1/96gj4t7qzUm
	8rS7z/eZBfIQdXxxw2VG/uTVwfgyv1hn8UeOdDNAw3nrDDl7ZatSzR6UqAnRO23K
	SJDKj2l0iVF2rRhIF3yLZonEz2I8YoymhRiWzY7VI7/OMI9Jj2zCJEThs2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrg4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso610332885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363725; x=1791968525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Wprkf4GoAHetdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=;
        b=PpU9IWF4O03myACMyMK9FoMBJEMaIPCCB3uUA6uXhiBHGCb5cfoyuL1lU/ZMc/DFep
         GiYvvQkdLNBELZr47Ee/q/XEJO6oInJrBeE4i1NjxbmHJxT569BajIG7RXSaP+SR7W8z
         kWrXWWDW15VA6zyg7CWyuLHkc6SaryNGU0iuH8MVV9y4hN7zRWM3M11hBVjGcXbyra7f
         bZcq6l+K0ar5OrGKueckEt8v8jJ82dvw3/bnLI8x13QHBMNe60eE6AVsLQH74l7pVzI4
         nKnLRGqpU/6h8lp9h95vfKjmjNsuTr3roYqZBJBb2swT8MeZiSics45pIVxubK7DHWvr
         GSGg==
X-Forwarded-Encrypted: i=1; AKwUvByjDKWq02fubNaKmt2Qlsig640AJzr+vPajwb7ejPs1OWZKuo9C5S0KdMbLGUZS74EIixtXbUb4niGaODw=@vger.kernel.org
X-Gm-Message-State: AFuF++nCfGvS2lAh9wU1D6XllIAcRiYp4n19bWoprDr8iA6fBvy16Wwx
	5+cR03SmairIkI6/fV/c5yXXzYNNvd/kCl/oy1MJe5Cy+goEjLb5EATiA5GRNiU+S1GnrZr4U/J
	/kz/cM25Akd5ZN6uxqRjt4kZzgKll9EQM5qyIYG/FniXregVC5QUDDEFQoihpfeVJZUU=
X-Gm-Gg: AYBFou1p8W1xk5yW4VGrkdEyHj4NhPZ2hdh9nl9wycpKa3bY1jKGHgbeevteSyu5AaH
	c2GZpYGLBwotTJINm5Wa2YHoRtVGiTGTR0B9G5ONBOZYBRIDPXTdutzNFCyYKR9S/Lv9Dd865xw
	HjTWPztJyfyiuXrr7ZyAjkHCBcMlNhv4LmPLAUoxVPHAiSJNuVzFz8qF96WJpfVcDZ6dRtEOi/B
	OaxTOcnawFsg06/MMHQUrbJzZvoyH4C3zVUB4ibffck1kMQq6GQa/5IvSIJC6/FbSgP8zYnG3NQ
	VVqxKpuoCuDL+7+xfWjtDknjNDRsjLaYqiyMIg/1YJMS6VAqz8F2Fz7Vvyo=
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284556185a.29.1791363725286;
        Wed, 07 Oct 2026 02:02:05 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284548885a.29.1791363724650;
        Wed, 07 Oct 2026 02:02:04 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:03 -0700 (PDT)
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
Subject: [PATCH RESEND 22/45] media: v4l2: add Qualcomm IFE parameters format
Date: Wed,  7 Oct 2026 12:00:18 +0300
Message-Id: <20261007090041.3732717-23-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60a8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=1ys7_V7Nn-5Y8TJEc3AA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ae8BK3yDtCOodB9SPTS0Gmlu_nC-jfdF
X-Proofpoint-GUID: Ae8BK3yDtCOodB9SPTS0Gmlu_nC-jfdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzSFLpksG4E+4
 yZTEyZ2aTG2Nee4oQ2IN3ivrQQDKMa5ZI7zGO24gzFSgeBf25MecwI/8pTva4I3DtwBQKZVAI1P
 xheLw7XVnCtmejTIYSRozkHKjETBBcv50nu08yC8woL1RpPPfIAkxo8gQkY6fePaQnYnqnmsOiS
 qSqs54GefltbHnp8txzXIUyW+S8OzPTE9dFZLH8ciUPPMyXA4tpN+m+hy89ntvjQ5vi5hE3RreH
 gbKPYXITlskS3qtuVN3//ENVxgegnDyjluxd2GubJGOmx4IPwsQIvZ/JVJoZAvm0jSrvyhiasNZ
 Wj1mEJMKEN8KJ0ncwCkqjVjm3K/rYXFu/QaOy0z69rpV8puGUNgtZDqc4iWLY+HoFX7FietZVfu
 0o/Kb8iQlhXiCyaBRfBJSZPxCjI8ngOJPM9wCj84G8NHE8tmPKxFHza9Ii9lYJzJ7aod5PJ42KZ
 N9HMZ4J5+fsmghkbqSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5qhGQmvLzqPe
 31oSgh8oCNGjKZ2YKNlon3Cm8HWbOn94LTk7kb5BqsKZtgey0owsoyZBd4GmlRS7VvSIIx7hz/b
 aOgrrW/q9lBv3XIr7XnGTieV6Pewj2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE parameter buffers with the QCF0 metadata format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b7173a258225..581ed9d74b82 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_QC_IFE_STAT_3A:
 		descr = "Qualcomm IFE 3A Statistics";
 		break;
+	case V4L2_META_FMT_QC_IFE_PARAMS:
+		descr = "Qualcomm IFE Parameters";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4a0748b60a15..52ad260e65c8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -878,6 +878,7 @@ struct v4l2_pix_format {
 
 /* Vendor specific - used for Qualcomm IFE camera sub-system */
 #define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+#define V4L2_META_FMT_QC_IFE_PARAMS	v4l2_fourcc('Q', 'C', 'F', '0') /* IFE 3A Parameters */
 
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
-- 
2.34.1

