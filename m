Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CCB42123D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379708; cv=none; b=A9zdRv9oXYkuub0E5CGQSs0y6e3D2TFSXitwAWb0JMPPk8G9CYJ2ieI8NA+JEH8rxCcNm8g6ATJtquSudstUEmlCF/+jtvU7VWDFZtFVL48aZYcFFWbjGWZY7y2vKiK0Qj9NZry86pzRNa0heXQ1SY29iTZxcvj8igaSAC6tzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379708; c=relaxed/simple;
	bh=Q/UORPhGAU2fywQU1yEoWb8L5nIPF1bJxGdWPOrhRfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAJ24mb5GLFN07k8Y5/9ZxXpD6VWzPT1gjDkm2ohsKWkMcrcOcnMKlNOkYbQrjqqWs6WdL7GBiyb/jzvpTx/1esfqmc+7QZY0l6PuhtK0bsGlBrRRwcsno8SsYyr7XGVers17AUgYwzy0GLCsE9ZtJwkvN0NdHFcTfrYS0ZOmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz/tv1sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfQzaleb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz/tv1sR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfQzaleb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqvHC2104773
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsdtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2377508a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=IfQzalebZhi5d8GR81FOZgAoUT27M0XxTOxade1QlRZ5YMAnsrEFjIcojhlThuI6uN
         9VZ+8IIJeZDBi/3uIqKDjjNsx7WtWze//spY3mz5Q5EbRaCos4t+0HAr9u36uQVkOoNa
         0OMzBerPfTMu4dFKK6iPAQBmDHcJx77SSgGccaNq/XGlcj8BNzaj7V4mt3CkTA6fvBfc
         f/6M4kI3lbHHaIF8sn3BJdQ3anwLcuTAbbOiIB1yiijX+E7+jL9qnEO28ddScOdJX7C4
         3LggqsVa+q0bDDppFThm83ueByVYgqO2rP9xOvuUjM6lbnvUyplbvw7mmkqCG0z/6f39
         W2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=G3qoKrwhbPALq1SL83biBvxtfOrrrbqqkoLKzyrW/7MIwgwMPE8hYZzslgi248p6EP
         cK7LnMzBP0c4IUzQNcwpibH5bbf1ctOcOUeshOcdJKGlsSSaRFptBYIgtD2j8MQLY+Ze
         IloAt9uhN5stKd4r3mxEj0aGSxpnnYDqU1YdaaKdgRWS1Cd9l7qXhRDwNzmho1yjZAbJ
         ZP5SUq0zIwX6IUZw72zOMuh8g6y1cWu+3c+5cVX927/8YXYDYdCL1dgYb8wK03vkiQyb
         9YGxOOBhuet7Yen3CFxjhOokWXXH9lw6NpPp0wuYX2qrde1rR677QwJsuWScaILDvUkT
         bQow==
X-Forwarded-Encrypted: i=1; AKwUvBxTC/d6whyLrdlXmI1NsUigp9IDyB/exARVa1igsmqkKgtG2GsypBFPw5h/YLKmkW7xUveEzxWOn+Kj2ok=@vger.kernel.org
X-Gm-Message-State: AFuF++lb9fpUU1OgGqyw3CH9GY6CospjXvzIIEhhqXcqkj916oV/8MEE
	GoJleMBngwzCSftsjztSzNtfRFNI8Zkc7CfkvGAHkhDtnS6BPNw3f5/cUK3qR34tpncm2Ig0LYj
	azzvj320Bj7rmWSDKGB5OEnw/FyAjgkXedLqIW2GEiTXGBRpVpflOEki5H582QR7eJNM=
X-Gm-Gg: AYBFou10yodx7VZnjQFnjnah4TxGp2MbbQwbokWDpXagV3miLHx931WFbsA9rObu23K
	5QmaNFYh6amQGf5NNZoIL2tYyknifvkW6D5phpx3/0rHoqOzn5z058uPJvgROgifTH8J1MXPD9l
	oYFXXmxl+Mrcas0+GyYsFruRe87h7yhi6HdjzYUzbVQpczgRnEH4vLvQbux0Ba+d8V7OBk3u/uW
	108IKOnih2bCSulbecKGppH4INDj5clcIhtSnpn5Wj5aExMlDrfkVjsyz4UOv+678I3eAGKjjfb
	RaAR3oeVIfZ6lRRJJZBEUyXJa/wyihHsBalSfJwGXcr3pCk1JXIFSxLAfeajGxET7nj8IEOaRzH
	HlzE0GQRsPX8IJPcJ3KX7YpTyANI=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293367a91.7.1788379704631;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hllRuOwSAgvqy-DoQ-wJiGJaZ0O4NvvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9Hc58Pc4cHcn
 aJHqgiJS6/K0itilqnWg9GISkfbWzOFLltMURHDaIyYMYTNSXsYgAAzFqquHiZWIZn2p8oWP7y4
 JtiytL74O/8v2HSgBCgqISaXdUAeBd/IMymW9qlTghoLNXjITsSFCqcXBMNi9dAsYL+ua+U4Fif
 6yRA0+ZkODFCh5EzImMZfJtSuQVitwpegMVfOHQ7/JW85mbNdrV5ciLlTls6FiSOG05gWqJkWIw
 5Q5Nqh0hBF6nzChH57qnCCkWehjqs+2Fxo+l1WFNsjOgxQjzjcYSEKR+xBZeIZo16v0iTIbevNg
 hsP99NK6px+Z1OJJrAi5yvXu3AR9r+m6tJyuOupLYXGEBOaC4nfdRxPX4FnIHOnUVICwqdmKExU
 oT5K6iqBqz0cDhSwdvTgZkhSNeUxE+eM8ImSswsWGg3OT95ctp29jFGDG0UupB+ySbXP8bv1L9i
 XtAGpBed0j743hh3uow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5DZydS0ljhvy
 RnVwUfaQv6GOqqGhhVStY4iZLieVAsDdPCqRqct6F8LAD7Y7YIvP2sPcWihSP7cQFTL/j6y/gM+
 InC9MZ95dnb6RkB4PdiC9boRgsW7AZo=
X-Proofpoint-ORIG-GUID: hllRuOwSAgvqy-DoQ-wJiGJaZ0O4NvvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0

