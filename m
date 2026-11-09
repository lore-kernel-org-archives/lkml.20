Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220037;
	b=Rodf0D1AIucMclYqE7qxE3/YlyCdnNpSowkZKax3Ltkh2ZDCenPx1T9VMFoPHx7oUK2i
	 zpn7imS26snRMpQq1XDl1M0fr/pAKWKrFQTXV1I9ZDkS5vbfJQc0YZWqXUZGDi4maj1oX
	 N0JUfAQtxocMjnlR8vYrcM+S508ug6lCfnpdtns572O6KitX0jkPMmfANP8v3EzPffLpW
	 ZLuLMKDT8cGylJVIIgOXT9Wifo43BudyYUVMSxsk4FCshmeaWRJ5/ZTMJ2dqACOxqroGC
	 pymphFRU8JXD4KPVPE868vdu6+jw8L02Fle/Y4DGacyNx+LHhoqSZ22jgEN3QNkhtOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
	b=u660ng+9lWe+InLjOZMkIienMMVTSjVnzDYh/d8fpBxLwiuEhF70aSt2z7cGUpuqerW6
	 ig7MJMPSrVyFHx0KEG9zpl9z0nKHWgjaEgLMaMUKxxfmrHLSyTJ6PWcVlPKWTaJq3bBUF
	 Xg4s1bghnf/VcQZeSUFt86/pGokWKUJugeCcdXeyDtRM4FVd/QGWIo7wIqo+TzrmhtHZ4
	 ycCtVJyudsajDXhsBK06asvoWvcoaZKWfAIbaokEfzLbidE+VtUXkONICzydPp13fPIQq
	 PEHP7arYHgvo7na3xDFKttJBdtAccWO4xIKAhahHilVc4aeX+4XCh8wRP2jUGIhxHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSeFggLU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoPKUshQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09806606D828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09806606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSeFggLU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoPKUshQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99umGK2502909
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=; b=bSeFggLUQf9br2vd
	llBX070yz2soSCAcyEwwWbv0OGZ9jPrD+AzyG3PJMNtynYhzvXO3s2AmDMoSZd44
	ACyowWt8OljDtAJ/3fXwlelQvZgzEg684YoitesuQvL58lyX9QjRW27EM96iQfah
	fuQcFXNdqne0eylcSIbaBpzQzKxhdZM2vTkncEYYwG1dzsytbkgSf2ugQHR4ULwc
	ko/tjR6FoL9sE4hoPr6qztZbznuOTsZTy+2lWqJ8EFfDKUabvGPr8NNeTIJvD4z8
	rMrhHOZu9bNZzgkhEnw7xm2ZhQoF2vRgJV2q8tjRbv0n1luRbm50D0nKnHxt3d06
	uRWdQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8r5te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:27:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337b591609so9257531cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220035; x=1794824835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
        b=JoPKUshQd8X2OEUkFkjwmT0j5B/uBYXYwGnUH1KbS6ECtlzHeUDjnOIU6jFliS8226
         36Kw5YCC+y2NrWKBxOH/qjcw7aDmZKCUhZn9ypBS5DAagNhMrQbuDJ7UOcGn9IYy+wIs
         KXJSTvCPdOCahJXtVFAmmj5oofjJvYwFBhjzquUpC6XyxB1/v0q5bB/HmycGM4CrWihb
         P/xlYw+5+i+LArnXgRk6Cao+EumCXsqah7YL4f4StxUqQ+gYUm/to4axp7RjFm9ilzvL
         uRQBuC23DDrNUAxNtY713/lHBokHT7JA5Vk/JBU+nkqFJC1jh30E+Yusxkz+9ep2Agi9
         Yd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220035; x=1794824835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
        b=1Je2hnQ7WbvLDwcsxZ4X5tNYRB4fk506uPy5FxVxpGr5YV/Sz51J7TDaLp7gxL9Od3
         p7PofWewYeuwQ8OwdiFHESfKiWUL2odXqhmWmk2lqpfHHEPl9hEvWj+8mIQq+4eDovlU
         pqFiJyNmQ/2fz/xI3/iFLdHz8Onh23hXRgssEEyJDGEsIN8WYtqk2+XRzsqT/FS77TWd
         V4pekHqQ7W/kx4CJhwgRiI0bvJZYfYJSEgIc3OlGudYqh5qJGQkXWHFbE71KhzKSSWQU
         tmDb0nnvZenagb5pLChdQl58Lcq6c0A3HhUBBYNHP0GOzSS6Bj2Rs2UTMJfsoqmxk+s+
         HUVg==
X-Forwarded-Encrypted: i=1; AL+hErHPIrMzNWFClRoLLSXNkJhy/TSR8p1/Z8Cm9smAbNfPhQ9evNXg5h2QqFpolxf2pcrFVMUcZ0Rdd4NshwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8U0jK3nm/5MYc/gvw/e7aN9lGCGXzBMZATYWbmS06gdFOU6Vo
	8mZzn+g230hDG8tjGVoQKwzdSGrk1rxcEKepj0z64REnlWJuC2KyyiCFKt+DGiiiECLMsZnVCWm
	eNQOErKcq6cYhiediRiR5Eone+oHhlG7BBXWGzoDw8B9iPlUA/maG45NBFWRpq8Z7FlS3V1wj2d
	0=
X-Gm-Gg: AYBFou2BUdgSlHNDBwNRMDvR+By2Ms12/s0CIUInYkMG4DHjmz87MY1WF8tFlVbRlWy
	B3uTyvWKrYG3XLM5/olUmAGmOuawxZohYGx/7KYCD47M6dOV9g9YAEKXiSmFX3S2zXrk9ancrDe
	odz+xy6uH4xPQiSgMOpGakcIOp+pLnnDW4HkX/Q9RVv9+n/5NqsPN8hKfkPWgGP1+y9LzjhRZ+z
	y6s/Zal4gxiMqxq15gaAvvj7n3W7kJwKnaszg5CzbSieswzqydb6sl09qEYJQThObU5hJQv3dkw
	uU4UTdgFQwms0MEWRbrahTJ+3p2kPbaNoa1YGY0EtW+wZzUlLpKoWdpWImxSEFixZCmABbIk3Vp
	CKrhADBu4XCrXmALI4os9KXp/kFXMHWhJOPuOHjM7a+JGF0qYdSzg9vlyMbSIOcZN/1q2rIItMo
	hgX7r5lVcX8vzD3vSjf63j8s+2j128TNAUNs30pdT6qR+LlMmnmlsWNK6OUxjGeD4=
X-Received: by 2002:a05:620a:3711:b0:93f:94b:81ce with SMTP id af79cd13be357-947842dadbamr549601585a.81.1794220035320;
        Mon, 09 Nov 2026 02:27:15 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:93f:94b:81ce with SMTP id af79cd13be357-947842dadbamr549598285a.81.1794220034690;
        Mon, 09 Nov 2026 02:27:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:07 +0100
Subject: [PATCH v2 3/5] gpiolib: clear debounce period before the
 "requested" flag
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-3-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjLYAqTAwPoBQw3HhJEzzNxlWBVNFUeFcmzGHg5iRNk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7ImRKgIQexAh/PTOgpovkCu5YsmGAehnAI
 3ny9JTKuZ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 w4dGEACpjw8Nv+ql7+F/0HXFpyTMxcQKIFzl73xEmWwbMNDn6jdFIrCO2luK4vOY0Uhp+1LYloe
 3ZjjM7Ku9F6kE0HBNol9lYyebhURXxW4JFTez/Qo4IAGi30nE7MtRgvkI+mwotqNSzqWdKir0hf
 aXib5cDj7mKfvDP2aRiPmZf7wAi8KttBGboAd77dOwevp5qwZHyRhi9Y8NFvh+n+63+8dM8rmAy
 8m0uy0P/rt2nEsurhY4fWUnA/cz12UEjhdyQaLZ1EBMNwT1z1HLD05Ps1PhWTYNI0ahUPyRHmpB
 M/7eawggfjuvOQq0DZPcI73FyJSEs3RLox7MPK46li5WeyRDzTV8X79dXDZTpLyUoMeQM/5mqc0
 fwqEutrHcWqHv89qp8tJrfUdBRHpKVVbuCJPI7afKnPuN0hGIQs7bwxrxCGxKMieGLfANPDDb1z
 8Ckrok9HG2+/FlsH9kIUZNtXleiEfJL4cEHbVBX53Ka/w/I0jRoVBpNOtPOsjLoKuVjzllucjBQ
 SC+mmBDWuUASOzwAf0CrBQ6rYaMLRd2k83tUIZn9AXQ6ZN1hH/BFH1QG9HiBvKE5WjDeA720VY2
 NgdkojUdeJwZomF0tzjG/4Dl+ORgz7UzDpu1To6P8INrM1P5wG+aT5sm5wkuU9goCXe0iKxJ5dT
 Ic4Aga8IT6RGxZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX/+pcZ9f8UdLE
 83HWoShfYg7iKadGLAeV97aOvZ0Qr5/QymhoMlrgIjBFxmQExfcKWPHg8OAoGtTWmTkQIFfqpic
 yqveLZIBjxW9X4FJzXKU/WaFWCKJjOcYna+f98LnUtfRugjVgHCj0mIJep2yvcAA6IB+MJAz+8k
 t3G9mcd/ESHLY0AAPRc8om1nZ8p74rkmnL/IPcVwY3mQ7pZOjNWcbXikKpUzbryeg+/n2JutBd/
 hpGqZx2rE11kSsZYWslGbIhPhwegmXITPrzLpo2s9zHfnX85AzOw1kmu0x5HdGzIcdytAuae10q
 HN1u/foa5qJRumGCpTfy9/sSvD2dJJvyOzaW0v+ZnTkAEJUQTMDaA1BZLF0HIzUmxXJ7dt71q2H
 YcUA0xa9wBHfAf6RW4Be6VsU/xFqcyXKXD2Jux4vEHTpOqdYtLGGOqPfe+s0oESYfeAu36x30MA
 84QrsdtdevyJaWhXZFQ==
X-Proofpoint-GUID: vVTwrWFL4vFD2Oq9lHHdJU2eBp5CUykc
X-Proofpoint-ORIG-GUID: vVTwrWFL4vFD2Oq9lHHdJU2eBp5CUykc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfXzYbuQfFYEQrt
 nssRZvDym02Yvn8kNtfrRWEnsL4cUEqAacMepHmI0W27y1G7amVei83/sIlTUkw1Jr2BFd+6IS4
 V73AJ6gmuzoLEdr6/AcjfzfyOoLux7g=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1a004 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_qOFVmDGdm6F56flM3oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

The debounce_period_us field is protected by the GPIOD_FLAG_REQUESTED
flag, so it should be cleared before the flag, else it could potentially
race with a new request.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Closes: https://lore.kernel.org/all/20261105042905.GB8436@rigel/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..af2d67d977f4925558ab77c34b37c3c29bd12a6f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2693,6 +2693,10 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
+#endif
+
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
 		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
@@ -2710,9 +2714,6 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #endif
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
-#ifdef CONFIG_GPIO_CDEV
-		WRITE_ONCE(desc->debounce_period_us, 0);
-#endif
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

