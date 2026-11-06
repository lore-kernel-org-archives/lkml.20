Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975376;
	b=eCAbQ2ndLfXunq+PR95d3mOeeCLWy4Kw+XeH/WDAuWMW/7HQR21rmJ7Fejww7v5z+HYz
	 NO6UbVDa0MyjRrKpUC7LyFb42zCcu6yGIGVYfzqU1P6yaIkyuPeSpgHmLppJinQG/noJt
	 KzOBTsu8pLevkCOUPIg4gzknCTu6bXDPZzHZ/jSccgRJcoRIjaRUhUWL9iwv7FNc59v6g
	 V4NO9F81UIkM3MXOA+GM2ZcVVJtr3Sl/ukDyJ7hZQ49Rggn8Fsc7aI6gMPU0Kpe7+Loy2
	 MuJ9CiASUn5FkT4qq5blwa2JmnpYlaBCWtny+emUCZ6MPpOvv728x+n73w3qvV5eiDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lSRVU7RUuxh6puB6b5i6bOTbwTzK785NvXxbRg2foaM=;
	b=rGCTYVMaI1eyrGQz2MyEpkYKhH/H2vGdnqtrmlTV34wUm+0u66euOO3Em6DbzV87LvSa
	 b+ijEUvPzAbNxNooNVnCNhOmgxe2onUfXbFrHJFIDFn4ea6cXE2Di5t4yJA4eNqZ+JrsF
	 oWETOEiXvpVyIFdXKOx+ibSYgRGmGTPyLndz7AR+MJ/0EOQNVDCZrq9odqgXcpEWevinB
	 He7fWH9uCcAevz046BlQfQJF9nQ4TtjASfTNRsfzBGxSeMyFusTrR3E0tzUUGVqAEu++8
	 z4gSvjSAWwGDiIAHng6oypyCgNZ+LtnHbR2doqQzO+ER59pDLz+fGq7aBYKRUxBh1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWQBit+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NiuANmX4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3D606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D3D606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWQBit+A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NiuANmX4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQVVp030261
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSRVU7RUuxh6puB6b5i6bOTbwTzK785NvXxbRg2foaM=; b=YWQBit+ArHsWuZId
	kUEzcqzG4QNF1fIC0/VMFdTjAuAAen8EgfGw8DAOsC4SpuaMyx7KjdPPZRavtpxS
	MSQkWCjKF1VyUYPKVAazDJ2V601Tw8ytrJEcrHIe5d/vz2s4Pq2cUjD7TwvSxWHX
	aChA0k2oWVAydjxyeXxqXy0XY+QDOXPyfZNm4G5TSjIWcoXHrvHDqmeJpLNqJmYS
	Vixkm3ErADLZ9D9ess4fbF0qOiLTVNwRY5lWUgNeSXOfsCjsHnarsuyPIhbD6bw0
	ficbzblHf7ht+Nk8no8GFxOPZjN3ZsLs1GRww5rwAGIVZfxKcistKIZP/MM4Z8Pa
	cPRpeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa36cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:29:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-887c99013edso439460b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975373; x=1794580173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSRVU7RUuxh6puB6b5i6bOTbwTzK785NvXxbRg2foaM=;
        b=NiuANmX4PIhci/hbJRjwpuDg/HPkRcMKXbQdol3YHU8fhb1Aq8F9BpTZGLkSzVrSZr
         2+V3LNoTKmn1ztUYw20VWRZ7t20Qq7hqdVuN2wo9cLx3WBGIJ+MAXZIRbt8ikyYTu5uy
         EBJvnXPE+I6xCwV07GvlTFzPLBXkVPooVTMkbIVPYYP0YaRRgg1dol1njBOJ0VLV54Gf
         gP6y26C+Eih/HE8qPvmjbvnptlSlg5JOiA4TsEdRfxyqVmCrXRgo4oh+2gaVRrKRnlBK
         EOKxRoMOMMDkyq0n91hfIzgwn6+iHMJ6FDdytKVrc2VJR4QJmIYyeftCzU5GZi19DRsF
         sUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975373; x=1794580173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSRVU7RUuxh6puB6b5i6bOTbwTzK785NvXxbRg2foaM=;
        b=YmydTMopYq7lI3aqwsbunm9mYxqsozQqQK6PhS1zI/9U1spZVgId7EpoaW1h2n9ACZ
         knlgj4eolqcRNL60Sva8sPQaY5Bk3A1vLmdSCUPPhDulrTeQYMFklua3/nOynw5LTs2Q
         q4kKHSoQj+pgyMg+YdaZbGKC2ZYufUnVkonlDDtKuF8N0MiNtEztputJENqILGf2XPfN
         uc6HLXkDn8bB/kASWUdkOd/cd2o7RPQAevPwpIScPouBl1HmUS+VeIC2ycqPZ7gj94LX
         WnVtgIY/lDS3pcRCxRcPw1FGrEJceJbkwliu3yfuwBcKexDEc+K/PlPDUH8AbcqGGHaE
         7NWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkscDkTMimQMOz+/0xsnD5eGv1yk3ElFx8myQwS52VqcfHkmPrRViNP4PJju0uaaVJ105cOm+EXa4+6lE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93LHmvonT807dvLEFHFe0EScZ0HCnRT3aLLee42UfuNrTBEcdu
	/13nEdjgjqe7DecgyT+1u/rmcyCiPiG1K+O+N3ZEPUT0K4SwCG5y68uJd/MkhR3XXtQ/sRe5TOV
	70OwRCerIC2z7XfOhY0JtGq/EGTfdGtx5OAfwpTASLlFng74vskm1y2CkjKpez3wdigAdHkPegT
	g=
X-Gm-Gg: AYBFou0hwG31/5plTlkHf+q/nKN8QCurw25t4gvKlU0tx/i9TMzzHyODGse3n87Kdei
	OwtMbr/ughLoU03qI8tTOH4qSXR0rT1wWUeqZeQukfPll7VtYnQx7/s21qXak5kxWnTxyeSjfa7
	PzWxLozF21HZEChgDjUH7z7BugquOt8rVtzs2M56NcNI9FEF8Xk34uYOUOvKWBVx3w+S5e6ep83
	6Vwaytsfs9WOBGzqmx+b4fvP2rOHfeMWc+zKh3nr8S7wh2noB2Ev4MZeaD+Jvu/kM0GqslRSoDM
	AX4bZzVRarp8OAI5HhZ1B7ZS8CHLm+icfuy0fiC8KT1ZBbR3sQZDnc8AEPqluxd9Vjxit+WmAL+
	rz6xTqRSIgKgiEWlf9ncVac+4RF1X131MeK5aR46Uf92dD6k1co9yTbWs/SD6gRI6EgJRxRtJnc
	SFTpKeag==
X-Received: by 2002:a05:6a00:809:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8b37b8694a8mr2601836b3a.40.1793975373248;
        Fri, 06 Nov 2026 06:29:33 -0800 (PST)
X-Received: by 2002:a05:6a00:809:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8b37b8694a8mr2601802b3a.40.1793975372600;
        Fri, 06 Nov 2026 06:29:32 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm690244b3a.26.2026.11.06.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:29:30 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 19:59:17 +0530
Subject: [PATCH v2 2/2] i2c: qcom-geni: Add panic notifier to prevent
 transfers during panic
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
Message-Id: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-2-d3011344fee8@oss.qualcomm.com>
References: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
In-Reply-To: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793975360; l=2868;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=z8OTmYoOW68Wr7bPMyY6C22t8YZnlBJl/0+EpX2cz9k=;
 b=n1Byg/UlMz833cQsKM8f3PbKdih2Pil67dVLYQL1TcyWewpIu3Ww1CCw/EEi95skq3mf8sk0u
 dTwBQJnFuX3DtLPJ9K+CjVddaFD2Km3W0o4uVaQQjly3ExRsGCdthEp
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX8bG6ccKNl+bA
 7/g5tDFXdFE6p27xeQoGzTJ4VFRhzRpGcBpNjei1+BuyMCReQEjwD/G2fGL5Zfnwbbgsg7W2ngm
 W5wteupLh74Kd2hYwzjQWs+zANZWeDUTldAeW+F6nwmlZP5zIZ9XHPakrtLd5f+7fr8hTmBnBaw
 BBMQpC3Q0EP0ipKCBEDC0JFc3l3or7eEYmLLFXs/kmebQvip4kR+cQb5JvGj61t2YBwLLxCA1eC
 OyPTBG4tUYxUS6W85QfUdS2EjLINqyALZOfkjrTYxFDzOyCRCWs+P04U3RbdkkA+gmLLSWTisik
 BOGh97rVaSr+muMrBLJIcGXKITAP5zr3IM5rXl3hsJ9yTYUZ9oMWC5mkjtTo9fJaR9Z58wI4C+b
 sqz/nxnfuT0801xntXaVPIG376owaHDi+DXH/6s9wRiOJq643MFKND3618T8Vl7GEICRAv/EigO
 4uIzI31djNQJX8hCP9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX9QdUK8XHxG2i
 TG7L5PPnPja0N9WYNuhh6cDc0hKqn8K3X4U4gdod20pdJUgs1pgGhau6q9e1DuO/YH4KnY5Dl1l
 v+/bE+koF7VWd7lr3W07w6bSAa/vty8=
X-Proofpoint-ORIG-GUID: 5JwC-cV-zZ1BPai8rvinOTs011xam5-g
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aede44e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0wxbfleT6UKSQBY2OSAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5JwC-cV-zZ1BPai8rvinOTs011xam5-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

When a VM crashes with an active I2C DMA transfer in progress, the
SMMU raises context faults as the DMA engine continues to access IOVAs
that are invalidated when the VM's memory context is torn down. These
faults can affect other VMs sharing the same SMMU instance.

Register a panic notifier that calls the same geni_i2c_quiesce()
helper used by the shutdown path. This marks the I2C adapter
suspended, preventing new transfers from being initiated, and
cancels/aborts any transfer already in flight, limiting the window
during which the DMA engine can access IOVAs that are about to be
invalidated.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 79707095bbbd..6897cad0ddc0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
@@ -139,6 +140,7 @@ struct geni_i2c_dev {
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
 	const struct geni_i2c_desc *dev_data;
+	struct notifier_block panic_nb;
 };
 
 struct geni_i2c_err_log {
@@ -1087,6 +1089,16 @@ static void geni_i2c_quiesce(struct geni_i2c_dev *gi2c)
 	}
 }
 
+static int geni_i2c_panic_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct geni_i2c_dev *gi2c = container_of(nb, struct geni_i2c_dev, panic_nb);
+
+	geni_i2c_quiesce(gi2c);
+
+	return NOTIFY_OK;
+}
+
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
 	u32 proto, tx_depth;
@@ -1241,9 +1253,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_add_adapter(&gi2c->adap);
+	gi2c->panic_nb.notifier_call = geni_i2c_panic_notifier;
+	ret = atomic_notifier_chain_register(&panic_notifier_list, &gi2c->panic_nb);
 	if (ret)
+		return dev_err_probe(dev, ret, "Error registering panic notifier\n");
+
+	ret = i2c_add_adapter(&gi2c->adap);
+	if (ret) {
+		atomic_notifier_chain_unregister(&panic_notifier_list, &gi2c->panic_nb);
 		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
+	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
@@ -1254,6 +1273,8 @@ static void geni_i2c_remove(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
+	atomic_notifier_chain_unregister(&panic_notifier_list, &gi2c->panic_nb);
+
 	i2c_del_adapter(&gi2c->adap);
 	release_gpi_dma(gi2c);
 }

-- 
2.34.1

