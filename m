Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269846EC88
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465350; cv=none; b=nbMBpnuodwmgT5uNJylx6q6Sj4jUHUpdQToovVhWB46YgKkhKFGiZ2SjkSp+81Bjg9D9G+6v++0N2Falee8lKGbIJogYbx/0h58QZihCWIVDCjzEln7iE7x3yjgpOGRyO19gyg3mE1sLx4X01Qk1vJ6pBN5ulAoQ7tV2lGowkzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465350; c=relaxed/simple;
	bh=OSz6slksdIAoSzgmisjbvzEKnbj2o8gL8+vwRbByiik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9FxNsa758On51KIpvRUGz37bExdXpBT61lWN9BiyQtXOY1yuYEfYL2m6znR79AFf3eOZfPOv3cXIvK7BwrShfuft6Bxa5cpQbx3kVj86nXiyfgjmQfmHAhvv8jSrnN4RFgqjeWu/PIVwqTO4736ovbNuYyUeeSbo2WblWsBbKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrkmyge7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI20+q+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrkmyge7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gI20+q+b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z9X02415198
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=; b=Nrkmyge7ELvAg9Rq
	EZb9IYmm3ElvDzPi7X6TknVXs5VesFqA33aI+BMl8JLopDY6Tunjycz8Dabz+d/H
	v4lPNkHmVwTWo7eLbLpTIbhWVx8dNKYsUmsdLYmL6jLPAUqTFUqcQM+r+de9Lxrh
	FmBEOyq+7o0+n5+HtYNv4nBqi1SRAoXDhhC+EzOX+NGLeP0FLDaVgb+EuyJtZ7xQ
	oVarFTj6ZKJpOSyLdEJ20Ak9CzlMQB4Zy+wNBDUPRxDlrW7ukCint2PUZw/l0RoT
	YgWQYabwkxUAKT/scXeKAdbJipaBYfGC3nPFrOqgPCWFRt/d1TASd6ML4in4CezM
	dClYBA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd95v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:42:28 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c07dcbe60eso5075548eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465347; x=1790070147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=;
        b=gI20+q+bnOU1IbghZO/ykcquk/ThIJuX8oQ7rdr+5Z0iyhTnoIot+4bf6IR3Xk78xE
         OIi0tnPdi0Nmgwfvn1gVKVkvJGaZiGq1pSbmEW50cHpasaPrue69n7st4/5QYdjaiyi5
         eWiDw8FQdmwDhZoYDdOr5iqIc0orMnENj/Sx9aTlOapzmiwMjQR2FHE2CbbZwg7ZZCOO
         hn9UC7maGx1ns0xvs6yi6KMDiJyPj9Sykp8wBhhvljlQE/SokDrYGUQQkMhEPGcYacAZ
         /n+oIG8b8slneRHblRqtHwkYULjQyxnQZUbAwZR6ZqAWH1jmpUlglnXgxdFyw6zzFIkP
         gStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465347; x=1790070147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=;
        b=Y4829aUrA9Ga5N5wVb2/WxPVcvigXZm2lHdg/GWDayNi6EfJQ9is0s/dzQkyMBq/In
         0c+SfTBQhxV4Pp39EQznNrFzx2jKo9Adk3FU541xte8Wb7Piupi0CJEVrchVlsp6DE2g
         nSHhpRfnkJIhJTy+OdvuWkUZzOGBFpDT21N5HF+5eyIvadZYcZhIYaS6mFkc/XiyT5dz
         OaJcgLAblbRm+jldAFLNFh2wXMC0oMyAOwMZzb3HeNiTXvLM4hJUzWQK0sr2GT5tsgyS
         Rm45sa1ncHUN4OPAr6IVFQkeg0S+Sip8XIp5Z1/rQlvO3DiIkE8rqifdwjFh2ssRIm04
         cqHg==
X-Forwarded-Encrypted: i=1; AKwUvBzwo10pOhY731F0D9ktDX4or6HpjArIliB03V5+HLXG4fN9cnVBfQ4QVOx+VbPLE1WbN+c8jNs2IlxY4vA=@vger.kernel.org
X-Gm-Message-State: AFuF++meUtDP+r8+WWBxyrlSHyybJBOBhetsdwDdkcvqEzSVdo+mI0Lq
	w12DAV5YNP+KuwF5Etybq340zwI4vP3rauF/xvigH9V4jwLL2PkJLHjthEWPqmkbcrLm4b1OsL/
	4xAEk2hDfMGUs2jFrO+KWoK7vW4ArQJQ20wkoxVec/WjgFz6mLvbIFi3h/t4P1lFMm80=
X-Gm-Gg: AYBFou1NczPEh5GakU/4Xe4LHa6f9TXx5UIk4quNhFJRam1LfR8UN6qHesaqRQsvJQ6
	LsAYfu61zbj1fyfatgKv1RgkHNuA08MJAwf0/vrOZk0V74DKjoVz0/IZm66gGbK0cQ0NpxrmMAd
	VjnwLMiiC4ay87MrS9E9TC5LRM+MW01/+w0yJRteB8e7A/jKR+705iUzix5LJ4ruthtnQw7nJ/c
	zbRPUSGz6CDTZZ4MoTqzqtXWD/kAEwr230f4TNqW570/mPnJ2K0mZR4pMAv+mRSjN4SARvciHLn
	YFN6nSlpZU3rJxoIj6M1DT3X+LeoSIOwi7EX4fWIah19M/cwssJGdJRvj40V03yxnVm07rRFSV/
	jgc0IApHNiHT3iyxgxsrX9mEWZjV+wpjm9H9edgfMOM9U+xvC9Gj348sAGPHFraFSZfyV
X-Received: by 2002:a05:620a:1d0c:b0:93a:1b82:4962 with SMTP id af79cd13be357-93a29a39ce8mr907219385a.47.1789464890705;
        Tue, 15 Sep 2026 02:34:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:1b82:4962 with SMTP id af79cd13be357-93a29a39ce8mr907217185a.47.1789464890363;
        Tue, 15 Sep 2026 02:34:50 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:15 +0800
Subject: [PATCH 5/6] media: qcom: camss: tpg: Add support for TPG v2.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-5-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=2550;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=OSz6slksdIAoSzgmisjbvzEKnbj2o8gL8+vwRbByiik=;
 b=svOSthiaPLI7WPtzxH7/4SGIVTAaZ0rAoZ3WLtiGdemaUdD4z7/l604Ra4X1TiyGnbwOljUWE
 hZ5xhzaTLPgD4CN1qnY/kBO5TSopPXTsSXc+0Ghvf7stvSaRDcLRMwV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXwkKDmA0CbmXX
 TujUBPa4TyIUMvrT719gDnJ0Zq7eH7IQ1HzRoGHJNJeZ303zV0OBjG9Drk6Kr5dqy7mugtGvdxE
 BywjOXBoE75VbttTDxn5hhyzs+87s0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX2z1nYvH3w911
 Snu+xw/uVjeUU02BR/5PnzoDHP4K5mNf3jpxMMMY46lirJS8xkJV6GhGlHNZYlLvqDU0TEeJ0Rp
 ZxlcrjOuLo31deazk2fv9bTXB3Ov3W1NbDwlTIB5qPiqAsfPwtv53AMkeg4XEmrJtHpkpIW0v0R
 iT67pYu8lK9C8MT+vQDgky/rgxZg94yGDCLH/JF2/2hkN3P4e2CsIY9PnX4mEhIOdQ8NPibfVdy
 aDNhPXcG3Su/BtXAIbNaarkOXIp84c8XT4E2ChvVn8zRudU12RwhNEiHKZZNSv0bJzjQQcu8+cG
 DtDZW/SFU7plzHoB2aHIEVxSSmVhzjUKOMpLPaJ0cdjyD4nWBlju0RongzhvkxkHGYs1ZuuhPiX
 6vYRSa76+2Z7Tg2wsTrvo14viwxOXzBoK7/wJdGs4Q8KPrXvkbyYVeRq7X+3Uj5M+dThZkRsnYo
 ZcRY1F5hjIZvvhkytLw==
X-Proofpoint-ORIG-GUID: yf7QUCmhHwFozF5oW9zOOYNSBKguZ_w4
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91304 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kKMPr9q_OXaYOzBTrtwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: yf7QUCmhHwFozF5oW9zOOYNSBKguZ_w4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Add support for TPG v2.5.0, which moves the stream enable bit out of
TPG_CTRL into a dedicated command register (TPG_CTRL_CMD). Branch
tpg_stream_on() on the runtime hw_version so the generator is enabled
through the command register on v2.5.0 and through TPG_CTRL on earlier
revisions; the reset bit is unchanged.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18ee3c1778dc0626e8c198f354eb1f..de7ef5b8ff5fbd22e5659e5c896c5484a5c818b0 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_5_0                TPG_HW_VER(2, 5, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,14 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+/*
+ * Command register at 0x1F4. Earlier TPG revisions only expose HW_RESET[0]
+ * here; v2.5.0 adds TEST_EN[4], moving the generator enable out of TPG_CTRL.
+ * HW_RESET[0] is unchanged, so the reset path is revision-independent.
+ */
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +172,23 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
+	if (tpg->hw_version < TPG_HW_VER_2_5_0)
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 	writel(val, tpg->base + TPG_CTRL);
 
+	/* v2.5.0 enables the generator through the command register */
+	if (tpg->hw_version >= TPG_HW_VER_2_5_0)
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
 	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }

-- 
2.34.1

