Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867339;
	b=3r6cnS6lFNiotv5pcDzP4pObHgXrEfFmGaD15l9Tv5w4x0x84AFSTOdCQt0UJqEQdx1l
	 lLV72EmLtrjGw4xorpt1bw14e5ZwbOT3tsefBi7sa6cFL0FyJ9mnqLlaiXkr6ot+qxRBN
	 IcU5BH6EWIU7U9vNvk/QwFxKIoJwm0LG5ddxCIpZh6BlpenXeSKB6zDegWa/gw5npncFX
	 o/zbMoTgBkf2hun0rHwKkJ7Wor00SrJdEF9P7YBJjydZpqlE0Sf9koHHP5CvCW3KUmd2K
	 0VCE5SfDE49EGwzjnOLSq+tsH1hCCaktyA2iDFQ7vtBfpmLxpREW+MfQzm8UMDWAHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8S9aOO2EEWm9Iuhm8V4mTtS5AaGJ3AEgVMfCGPAWGsk=;
	b=2sLcsXtiyE8shubP+QAtlU5/QQJ4nnS7w1SVOAZvMqHDGW5UETJUyulvuYjmjtzoo1mW
	 F+/K50xUcPFdVg5zU85V1QypmceIU0UtEiLLngWGOaN5uU1UC5VMRmvTuJA2OeaxbRJDd
	 DoyxOd0jNKKg9Ocfbe67ZrK2KnKXXNbMWpgIvNxgvB24aUnzVnHzzIHinPrNAhgVvVYG7
	 HEU1wmxKOAj9zxtm1I5msqWMKqhr7F7abuxAZu+kESPqFSqMvCocj4uplV5HPblws8LP8
	 1U263/eWwEVcG7lCDJM3r16t/WPv8bTQoHxMVaR0sEnmWPIyJdOdGARecHgOLW6F3FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pm9BRPCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQwlpjw9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDBC606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDBC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pm9BRPCQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQwlpjw9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UMtV1018151
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S9aOO2EEWm9Iuhm8V4mTtS5AaGJ3AEgVMfCGPAWGsk=; b=Pm9BRPCQ1BYidALm
	LITCB/+F1RLv+O51ejxPLuA8bqU8QjGIHkhJ82XUyUrdzLA5Ra6COGHB1S2E4QIg
	SWEm6Hk+Gv/rULZ1fFZ3Ypmckd8fWA4qd3VUEgLfsWI2VDWO1UOq8xip85gRIhjA
	v6LIwoONco+x8HzFTEtCgdekE/cl5bGtlkH788JGUQC2fqmwyPLEg3XdYMqKPB9S
	zhS+H3UbAYqIbTugXEKI/Q6DPmOuZIklqVWULQakLZRhymnyNb2Qr3WbL65F0ZDV
	JFsW5D6F/lfLtSyweD+gTQZl23GmD4CINf+UsRcoj5bqENP7mfIQ/NgXyts1cELH
	7FJsQA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnm28h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:28:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d06f3784e2so429422137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867325; x=1794472125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S9aOO2EEWm9Iuhm8V4mTtS5AaGJ3AEgVMfCGPAWGsk=;
        b=VQwlpjw9VjKkicY3K9BUWO0GqcprF1EDRK/30IKU9FZzzSZN/1ci1EExnUO7mU8HGL
         v4M5XRHvTMQEMQMaGjNyw8r8KeauNYMnfQkFUG/a5gYZcfJ4JAyUrQ4WLx4PoCucI5+g
         Mmu/l2znoMJgxNC5nmta+Vyjiy+RAZwmnHIouDXCSXrT0ESvWRwPmgp40Xoh2ofoJLIb
         /Vka0f5iGAT9s1CvWvlDJtaVZj5NCmrdy2XYi+hiQRTd52koEgD5y+l+Axf55MycaZl0
         DVtZrcBIb6Fg7WrWVs4Y88uGiZ50Rn3a6oOX8XOY8tTDUhdNY55z4TsUBOjFtjfmaruK
         dWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867325; x=1794472125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S9aOO2EEWm9Iuhm8V4mTtS5AaGJ3AEgVMfCGPAWGsk=;
        b=r9BeVxwTFEkmL07wnxiud6w6SnuhWuw5ZA7F9ZrEGix3a1l1Bx3gctG4Xdf+oqd5Tz
         tESKGIyhg7mlS97BlORl8BQt/kfN9eWKHr9AA7FAmtdj8ktg0/Pl5sQSUtRgx0fmdjm1
         VMP75lgx6rJW2rQEgLCKWxpf+SpR3it7B2Izv+DRAifgJPhHgDW0IBD7hryhhgd6ZU5x
         Yg1XSYts5tK7ZZxA0EuYvM9GSbRO6IowVbaiya4WqY4ifX3z/4F/VQCz807axgFgbxnd
         ai4xE0WTRjT0w58ShtmtH2AIxsxzd+GfNcnraFtcWo4B188+J4kY7Sm5Xr6NWypdE/nZ
         htLg==
X-Forwarded-Encrypted: i=1; AKwUvBxpedubHWrQrpoigKtGq2hOuJ9Ge52qSLXsH2rFVthb/R0xC/qRYWePNfj+CAy+YCFr1u+8xmYqcp6RVCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PaG6igCr6Ez+f5fEVUoQQpCCjAsjbjh0/bfX0C2jYfhbBKZOx
	brvAuJxGt/ejMyKB8ujTq6hcGe+lguY6uvvbeT08uuvBKwnT87q8cwXJ59aSVByDDcDwbuY8WGa
	4bOXYmKklC6P+uha+1CB0Vhm/uEwstmEI7RUXPQDW7lWjCnegizDRcwIQrB4Vo5VD23o=
X-Gm-Gg: AYBFou3hQLtm1Eyg8Fp7QUBdNGbRondzkDKTuwf7v48QzbcK+vGow3J2KVvounnF9tx
	LOpMJaF8Qh1EeMNKMtEyfHJf3e0lFAOvvVQZHcMmvaXSa1sZSgsePHS++Vj84yOit8O7GtAqgvR
	F5ha9at1QzCQHT7iIHvr+bJ14l5GOlWRxV2Pyybh2sHOfbxtraC2/LakVQqXkFkHp9MhAMX5K6X
	HpSdZ8IiIwuNjqtqmb8VkuLQGzsoxE8hsfb+6v9G3/N4muQpSsIKud8WmH0Cs6h4LM/MUcN2Z5Z
	sI0uRPDwYP+bkk2VfNAcZtNZKrDZfaW6nLBMvqGiyApGjKanvSIa/FpPBqHYLZoF4XkAUEim6bq
	VUIwKkcIbSDODOFPDu25OOJwqeLcXN/K4hS9bKdxFMYFSImQ3Cw+fznvtPGX0yTBNjgONK4RcsH
	6qzA==
X-Received: by 2002:a67:e106:0:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d27f9383d3mr1921419137.8.1793867324795;
        Thu, 05 Nov 2026 00:28:44 -0800 (PST)
X-Received: by 2002:a67:e106:0:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d27f9383d3mr1921407137.8.1793867324353;
        Thu, 05 Nov 2026 00:28:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed55249csm7406821f8f.35.2026.11.05.00.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:28:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:28:36 +0100
Subject: [PATCH v2 2/2] power: sequencing: pcie-m2: use devm_mutex_init()
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
Message-Id: <20261105-pwrseq-pcie-m2-uaf-v2-2-3e1dd415af9a@oss.qualcomm.com>
References: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
In-Reply-To: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VZh8aXZyr5sjhB5ZdfUSMMRl/sDHEV/BJMlTnMg/j+o=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGrsPjbIo3riAGok+LWsCI6ouC8rZbClyzAiUTPvBICS+BIxJ
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJq7D42AAoJEAWdLsv/NoTDPwcP/3s5
 41gXz0Ap6CofQJZghiKj9pkfEgS+Tu4Fpv01/qreaYxl9RnkIL/RHA/A528JlT/HJdumv86o+vq
 bfQckiVjjflswftkCBBZKLxBMUJeBb6yrb+GNxIkKmRpBB/RI44L8usDMLYwWxfpcylW0sfI2In
 iezZWx06H05otZCwm90D92UD4u8tqx+3Mh7hBQ89KR9Q8Z+xjZ/P6kcDnyUbkVYJXAuBTda6l7q
 irETCYuTqdnr9WcUQS0KZ3sHxpTvgOlQGhSP3zYVXOwl3/liUodMrNlJDhTxPTA92fnt4iRqZJ9
 ZBoIACPzFEQSmLlvJJg//WFlc/ZWaUUZRpwCxC1DbRAd1aHJSnPr0BNbhCtJ8J+zcLcqHbOzc7Y
 NLlWK0t/nkj+K3/jzlp95d740fgEgqwssbBYoznurQQ/CS769dfXpwlkv4G/lckm23IH6M53eOV
 hKreNaMprWrLbk0bg4vZgF9HhmE4wCoW1D0l47lyRHYx9Uc98jfWJQEVly5F/bSiSAjlrQtArhI
 BFJ33TDSn3t78DlxMJw3A/9G4qeDHrYmsd4FXPBybKjytPjM/zASQ3p94wVEr4jPNyf7gVhaw7D
 eucgsTxuS99axiCU3LM/nTDyxT82bqLTOGNDbbZK1I9tKtpmla9yWtL72bDzIIKxaAV6y1VPip/
 39sOQ
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX1nlhjA/T3QUs
 AyTnA5L1fAJw6ICMUQfo7WU/lJi4ajt+6cATGfpFqMBSFNReRgNpU6KXsTwZ3I11gLrL/t+EaW3
 kbBUaeMdAngf3Dew3zvM7evnEhzVIb4RYImVDlx+vIoGLhqU1INA9NOZvyqHkXMUbmSoX2mqVfs
 xrOUeGQob9kEwzMbvK1zr5qNqPyIjMHZORJS/AzO84yk2Hf54Bnp9FoyGdLnHpkXKrsk5MyBz6W
 9TPtxncN0KoP7NELR6RN71U8X7+4ZAiKDS+UEeHe3VTIbH0l42RWom89F+TnmxRjsxK8T7Gyzr0
 TY1/h8PBvbM3bMCollSm6KT1wkrBlntskCTPFkoBB0tegZk+AThA4kZ/45nzwzc6guEOnfZTQ85
 hxhX0k2efZEMWb6gYZ9pkPdkyh5yN4Xas++s8XJl0oFiPbxo/9cHSnIedZUJXWDW1AE9lfT5gsx
 pva++9FB2AXDZl7STjA==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec3e3d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=biZV0kq_lYyrW_oFkQgA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: lxRMaP1VSEMxLmqLoVaEgqfyjL6VQco6
X-Proofpoint-GUID: lxRMaP1VSEMxLmqLoVaEgqfyjL6VQco6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX8LEmFdfTFDfj
 IA9aZhp3hrNHEZHopltH6WfXi9djzFydG7JTOinSy8ijHk/1xGpV5oPDfNpvJgshvbl+k/S9Y3H
 6ul9vOho3BV34Idbwt6H4fRbURg2JBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050033

Shrink the probe() error path and remove() by switching to using the
managed variant of mutex_init()

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 60990760287fdd51c29ccf0e3b97a244669e4837..4f283af8b0147a3eeb322b777f5e52e7d1c3d753 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -596,14 +596,17 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
 				     "Failed to register the power sequencer\n");
 
-	mutex_init(&ctx->list_lock);
+	ret = devm_mutex_init(dev, &ctx->list_lock);
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&ctx->pci_devices);
 	ctx->dev = dev;
 
 	/* Create serdev for available PCI devices (if required) */
 	ret = pwrseq_pcie_m2_create_serdev(ctx);
 	if (ret)
-		goto err_destroy_mutex;
+		return ret;
 
 	/*
 	 * Register a notifier for creating protocol devices for
@@ -611,14 +614,7 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	 */
 	ret = pwrseq_pcie_m2_register_notifier(ctx);
 	if (ret)
-		goto err_remove_serdev;
-
-	return 0;
-
-err_remove_serdev:
-	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
-err_destroy_mutex:
-	mutex_destroy(&ctx->list_lock);
+		pwrseq_pcie_m2_remove_serdev(ctx, NULL);
 
 	return ret;
 }
@@ -629,7 +625,6 @@ static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
 
 	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
 	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
-	mutex_destroy(&ctx->list_lock);
 }
 
 static const struct of_device_id pwrseq_pcie_m2_of_match[] = {

-- 
2.47.3

