Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CF3CC324
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461677; cv=none; b=RowZzIIWVn2hlrGEHke0YNs4+rs3LQ7ThNZ3ZunB9XPpIM8nmZQVFdsvtS9gjE0P95FxblW8OgW0oUjZGOr4DwfC/2W3L/uJws1WoLrc2A2iwQi/A52VoS+dNLgIMkYU8FQaQBarQ2wV4dp6zOu9nWFoevPUoli3zTZf6ybtJLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461677; c=relaxed/simple;
	bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uaaw+OlwuG1vjVib4OQr8m5tGsBkUJ3RLxbAoWsZpbMp0qUOQIkzjCqmbgqDCKQdiOB+Ss5rtIrFURJRUsUYLXDaVh3BaADZ5w43vBRpkRBgPIkR9O8qWwTHWBtfBQlZmb4x9qPTXtc3XoK7nZiz9fvPoG5rEsQ2ZM1Ofkbl9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RF7LQViK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f09l+PxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RF7LQViK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f09l+PxV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3e6M1431142
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=RF7LQViKx/h/cYdv
	SHckR1mhFiuUegvn26a0UMfpuI83lVwa1rms8Z9Nsya/OLlBj0WjJxfBXkTg0wiw
	SU2N/LjYm0RL5Lc+FuIvKmLYq+RyGzBw05c2VygbOD2qe2FU40BP2rfhk4fgmyeI
	KaGhYnT9UbdNI10/Eu1Ivsy09qsiclYl6RE1Z/O1gA0d7o/6LTUF51e1hUm6eAtn
	oa0YzdAw195VQnmU64L3GrbqwvVXROJD839nhtwaqEMjPviNAS+LMrjQpVwr6xih
	vzxgwJh9rV5Vyis4C9qlpAXBgZaaE81PccemcoXmKMZmw8GK2yh0bdRdBJAB6cWC
	CHXL5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kkj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so202864a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461668; x=1789066468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=f09l+PxV7JoCdnvhjoNncOgayTMlA5GqW9EbKaY14xPWWGHY5B7REu0Be6HJaagVq+
         PBBwyAHZNrXKJDUjepSs/CN1jUF3o1L5V7wWfrR8TBKPT/57+7i4mGF2WzUS6VNDqSjc
         Kie6ktM/Wz0J6hjfUiLi6yCt03U+mg6RZmxMTwXRv7afMYyGwicszhtSxlL0JDU5VY7a
         kea/z8P5AdItDoA4GyhROWuMZg7WvVA6L17PGjko46HcVBO5Bpuqri+8AT64TNrTAMAU
         4JllorhH2k0cZjuzZoRsNhk0wvkMMD3zy8rPVSJiSx/etxjNlEPNQK0YuJy2tAVnJ7Nw
         5s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461668; x=1789066468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=nuqC01HkvB47q4ubwgI/5XOmZUWgLBAsPKMT/5HB9CmwkkbDE0ndtLBdebVkjcoMRs
         plfOnjd6uFHdeDFTfXrcPVGS17fV5rjkNt1DM8wXIzUyqEmmpmY+tgHKhsqdxirhxEWb
         ycBNuVmqC3+BUNT4H06lsneIBRB1wVnQyMlLsZRYEJbo3oKqVeB7cMyosU3QwD6bp2Zv
         7j1U44YAv1YXaqle2PdNMAduNDfwZUA4RZBUH1gVT6uuosoVTwJy/1CQ8aCzfQO57yGB
         kZjiELm/tJewdLHOhK/fXMUcPoPIUuA5WCex8uTIPSWUWj7IAHO1IbO9bvjkrUeYpQob
         nCQg==
X-Forwarded-Encrypted: i=1; AKwUvBzO8hwRf6Is7unbSD0hZZvP+FP5lB/kaZMGGemAS9lGvb6Q9CoAUioOxcT/qYKiA7jvm3Oo36Q5L4aSKm0=@vger.kernel.org
X-Gm-Message-State: AFuF++kE9u3NjKgkc7JdGEmy4dQ5SWD7X4GuOlx9i+gFkHuRmV2NrNhm
	wRv+Ycoxs7oQBjRXf4hr+NkKk/9VBvy0PAS50JlosldpxpQdH7u3ED6pO1twuEhBqXogX7h4zqW
	EQksAbTARI3lXHExFo5ztzt8dXjcAOtNSQHeSPDrIvlNoY6oTZ5RvmPD7loNjt+EsUh8=
X-Gm-Gg: AYBFou2JIz/EeAMNepQBOUvTqdiytj3KHgqwa3X/XBwPcwD54qrDiC1pL7HuVK9qZ+5
	pUoueE+EAVV7cVnUvQlBfFoVwhzJsATFqxyyCaf8lf89GzFY4Lc1Vxj9hEMseC+Durl4fbfMNGk
	6qeH9GMm4j2uxNTAqahc64LyKdW4NFrDEKnraN9jAI0DD9/hASZZr/0Pm4d/GMjbA2Jv799zbli
	zra+USbhthgtZmkiw0coGmLjCsoGjUSgAPLUmBENy34Df5o4R02eUmEfLeLF70o4rkq/MGUBJmS
	Dl8IKZkF56SM951jfHu/ms5P2GS0VhZx8T3JgEwA9krwZe0ItGeHpgN33Wg+wiBMYlcUUL9F39W
	VgUyCWp7IvJTm072GuTlEaEwjV/dsLA==
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr725691a91.6.1788461667846;
        Thu, 03 Sep 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr725630a91.6.1788461667387;
        Thu, 03 Sep 2026 11:54:27 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:46 +0530
Subject: [PATCH net-next 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=eVFEzweOdFMUDglLnNWnuYLxu4C0abjkapXwb7fyuoQ4PkeZeApXpsh5hAGeFCRUiHhYQuDpy
 fHZY6wwVX4lDYrfI5Eqfjlapel1JYhXvDvXf+yBhUAD3eN9YSuBvjCW
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c265 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xQyfE3mNZHAJ5MJ_35Rc3arIjvA4JAi_
X-Proofpoint-ORIG-GUID: xQyfE3mNZHAJ5MJ_35Rc3arIjvA4JAi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX5a0YlIBQmVsk
 94tOoVhoCeex0BNgxcT9jBw58anwPYCXwZfswlRUZNHdgPlMv1FoJ+X1sTOBBufI0N4QX5/vb9H
 yUQAV2nO5HdTaNunuXG1wyAvEpTzbn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX+Jtf1BYo0pXQ
 KK5r3R1lOUXjTEh/ftlc1x/BBKSW/cPEJXqUgne8+5l9HI/K/TGl7WeXEY6AWJBBV3BzHesxLUy
 VVOp12ul5M70i05YjzUiYj3ob/vHrHUMm9T9j5LP6dU6+zRyDHFgl7mOXRdixKbWpAOiY2Opesb
 sj0aufGuvoHPBRnJYy5z31i7r9AeM8VfHJqf/oQaDAfuuZMRlpAIwB+2CQPmgDSqWeyWEZ29LyF
 jfiOgE7NEGaVLHtsZx4JYulQWBX0J/8bTSBOB3cuvFt7LL28i+v8JqP9xVD3z8OI8DtPvA9kZyC
 XmN1y3QgH04gtw8SU/5GFMXqL6C6xUnBHASuTvCudKvQyf8MqEgH1tvq0vqhcVloWvk+yGDzaPp
 zbCK+w46XWMfOvJzmbJYZuHlRJVnm8g9b5uTGBsTOnBWqUJYJlz3stU/mfCh9Ado2cvcejoFMc/
 BqtxakKloHpcch8EUMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

