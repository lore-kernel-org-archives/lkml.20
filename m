Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623831;
	b=RqlinbG9fHQFS2AJnAztIY4pLuG43kTct94J/eQqTtl1+HT+L8gfaDG0VDcG4ayVGRKG
	 cmlReENdxKZcAMF8a0OAcy8mCI3OZdf692kO2GjWohyZ7gLbhPJ2+NIdEcP5qMOCBrfjE
	 LIIcReRCE9JO3SKCDiYd5fhogeGyXJBciP9c5wwSH9eyG/FhtX/QWLAZklFpEylrLqtqX
	 WBqhm5TAGrqefnLIez7D19S10ZptB879bDRhfU+9LfBHzXM/XL/r88D6l+Mq3J2ZtXJma
	 CPem81Eqy0o+dwECcrSN69IlJti+xiIZCWkstWpJKMBwodvi0aJp53Dhj5yjswE3znQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=d3Yg+hSCNG5SY8I1bpEpXgHdIMaAY30B7wm7DadMCIkpgkw55Ufh94dC9i+sw0jF5VzZ
	 jvlOpX6UOg8kXwLNlVHEWng3m1DVoj9u4byJA/wMfi/STDk3epoyez0hhV88RUwcVnpkE
	 yRZxy5vTLctHCXRJTa3NqJil9I5oicqn2CRirSTJKZmAD0JE+HsswXjCTqAvuy0exE8RB
	 JwMpPxmNOkvnTDUBUX59e8VCB69PRH+PlFCzMLMEhP/HTlWCAIF23lT+MgR5PqqIhNoZL
	 8IIWSJ/2hgoQj+ivhsa4JNCoqQGYts6Hm+CduTLx1VfzEw24Vyh0aAJEd51szG7epqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242760A261D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A242760A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2sAl076854
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=aSyVet6Wknl1vVSH
	iQ9qWtebjFENHAeMBcSInxE15ffKi8WdamFBvH3XX1OpWp1TeD47ix6vxCfwnp0u
	sQR14us0veByjSJi18rqfxlDv3ctJn/gg2hK5XsWHChxlx5yrydPbAIeTVbvKmxV
	vK4vjhJGCGX1jK08yEGHbPkQ5YkStboR0xLvjzZuDALfAJqgUKebpe05HvpjrnHn
	D0lV9XKtb/IhxIQhK2l38wHA3DzQYV/pPxDNKIx+ChgsRISh1+KtqJ2oZ/1xCz7u
	u34/YTZg6u/omYVqg7bDBgj1UnZ4Uzn7BvYv1U5EZyRamX79PdoTefzctS8ezatg
	ARPRBg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rbty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:50:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc37ee6562so467424137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623829; x=1794228629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=VPIpzAPxWnHEYDhPoacfaJkUqd1ImMRRXfEprxkym1MUO2Us4oOlechBEdW3M0xZK4
         hZKOoryPvl6xlfATyubXF8nSCzrabEuSuN0h+/pcd5gTWz7Zyd9eP5IyPjVFcVJkbhys
         DzJX8rZDvsn4sudDv3kBCPV4cxWpp0dMxbAyyTYUnJu0plCnBajZmFabM8Bo73ym56PD
         6Jw3vNeZlu2LEgTgoby6HdlOFP9d9caXKWUEgM08LIQ1dh7O3S3seRVJtdqq3I0kXCGH
         NXd/2B2j1PrpWu3wkCp07aeOcKI3y2eVA4TMWRANWthWBTxxRYweiLzV2QiqxW9T5vTb
         8I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623829; x=1794228629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=lHSPQ9auzYExizI6redjnAYLznl2j8NazlZgru1p7ea/3/9/F51os8/TqLMEyR0oaW
         XAnHnf/+SY6Fex1sPb5OrTgNxDBOsrQQ3Zzd5olh86/Jy20yGSxPoP7kx7fjY93Bidfr
         o3dJ6g+O+HTIm6rfIlXHno4XRbvHrnrd1WKo+OTFFfM/BCJmno+UaUHQ8QRzbYMyn1cq
         PiVcsNySo0yo12qZIweJMp6QDY7rgIzZ0pn1OLkb7MwDBLfYz1Afax9Vgp1YuFQl07/1
         5IIp9NuXQa+j8Tnq8zuBFmSJ+sMQ/nZfuqqZAlq8EKisuTudM8z+4dPDbCMHxeB0l6oT
         bqjA==
X-Forwarded-Encrypted: i=1; AKwUvByouiLMiX7f9wtL9fu+KOJtpnm73Lj3FXUIHkksdeDtOAF/TprvheC43z5mZ+FHaH/7qoPAx2Kjx1YVnMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IyoC1AZ+nL+QhQM67rqJyI/3JIvaVRjcHkk/jnrLMhG59hxEp
	yHTjiWk4O+PSiJGKZncqnBfExzXWOd4XEpAQzldxsezA7QF69sF2PYUkvOdtfvEO+UFJNVRNE66
	n2nO8YOMXncEKgHisdq+QoOPBwvFKHGMlobgkXvzn15/j6AGLWq9K39gitf6GznVQSEQ=
X-Gm-Gg: AYBFou2J7pKts6FwWsARvqJT+85RXrxobXcOYHWsFM2M0lTZTm4pg6XVAqd8Pl1KdVP
	Wy8f6z9B2DDmjZpvx7Q6GTGJvrjkQ5kUaWg8SmPIIVNllgqJX2EoSSEs1x60LGogZ8lEnmg6sFl
	TXswrW0cWsv08p8+Dkhm25br3j3hyQiubohwrGeTQbbBYMKGnPsf53rhlVmObfNjZoqlbImBsB9
	HOzn+hDAliH2/SE4rJByez0zxAiACFTuQgvo2WkU7907AGRUuont7FfDByi0vxSWwqc3mQI+C/r
	C1CAqig/C7G2K7GAsrNZ+p3Rrs1a0f88Z22oi75FFVJy+UMfBK8sqbIE9OjCOTwZozkmBKzLvfZ
	SRgJqbII9VG+iFK50W2HcWzYRoC0wG5Ij43u6YI1Z6xP86U5SzQAsrpBiesH/PZFoBcFs21BVkH
	bhhQ==
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266936137.32.1793623828845;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266927137.32.1793623828345;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:19 +0100
Subject: [PATCH v9 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-1-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQYP5BQLh2cvFSimCvqQmseme4CAWihk33m
 uO2LKVbeGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 wzcID/95nJ8RjZY4PzUH2GKTv868dSvroebqFK3p7lP22SfEiXB1sqnnWrSCySvMXrrKimOlUIF
 piI9LNVrX1ZADPKSSn+MXByfOU7apU+Fx3DNrIkzhfxdbbqgca+bchuOn4XvQivDW16lKOLwGXr
 bTQmV3ENumiD6870UxTvbajqF67oWYk5xA06IWL7YpiUct9coJtl/jEiFAnf31N/jHB3JzIDhFw
 0sXR73SJ2eAqHE32V9bmbK0EgNBuUG3qU0A0pcCnkp97w9tGt2uyRb4BZVTUAxu2/v3DFdtwuGt
 63eRy4yDOFCRs/uQgGFsiFMSa9s7SwkK8NsIdoUAYamoWF1gDsIqD60fJht6FDDgzXMf+vUmTej
 qjlOBviUu0I4Wo/v7kNlcBxBVFIJB708ZOpE3kt2LkusC6mm4bDvMuzMNUDyEZ6q8NAGP9zYzj4
 +q8bm+k4a8IerZCk6TkmCdtP+V8emF05R7eNNcbISVSD23RpZoZUd8bkIn+C3kcYiBY7GJOhcFL
 wvbp5mhniCupdys6lQfPvkCYPrfv8ezaQgb7fPK7tmnYu4qWvBtccEdQzRMQLx5b1pR7pOC2rYn
 QUO/CI0uuIeGzxFhHk5PscrELQsuvmeMc6MU1xNCC3m1aDkiCrqceHXJGUfZLjAfWJ56nuVSBnb
 Q/xQTv9O1tcBcKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX6QKjZV3lSyjW
 hOTQlzuuUkpi4qmOPFJSseMp1y9BcGKz19uxCmuKM1goWvPxLmSCSFwWZ0BpFImBoIMAtMUsB05
 sHLwh2HJ1vaL4hmlJ6SzJsK8CaeDI6bibIbf8KyDJo9dXbkagmiZ3PR5JbovtldN+zuRztCsXRS
 vGHblF2p8PFuuSFU1LzAUIOvcyx1hzMGA2X1dtMoN/FbCshFSguPKWstHUS2IX8gpY+iR2upGgU
 DFV6lo3egsOp0vh+pXBbg+cphp/mWwf5dV38smPVSAeuFgfiM7pInR4Scin7HgrV2hSSHpL8hbt
 MtG+WaWTePQUiDxMRZLKRdHPHg46ac5gxcL1JSg0SGR0JUoIcEhyQ1zKRm0fIqf0le9Cgm5b5AW
 d0IoWIyxSneJbBb6fnEnlceUumzMP1msYP4+z0BtwwqFEPBR/76+/HGMxPUUH1cFnNcIS90inm+
 XjExaJZhI91uo7VjvPg==
X-Proofpoint-GUID: 2XEjBqz3eQc3bs6a0HtaUP5XIbjv1FDZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX3+SQSa9KCtJa
 mbhrhXOgxnxt6GmO8SI/zzx+a8CLgSM9+8YiX2AO4sSB0FLSsKmqKNItdkdWkZhHfHD5DPoUdaA
 MPwy3und0ltCxvLmhD31Qnc/wuP5Ma0=
X-Proofpoint-ORIG-GUID: 2XEjBqz3eQc3bs6a0HtaUP5XIbjv1FDZ
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae88715 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

