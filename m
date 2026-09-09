Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B7560AA5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957454; cv=none; b=HemMS8WiKKxzHf5OtHKFg/P2UejrVChP5tD8oQ0p0VoFue7M/Q3kVIXdOYqWk1UIZov3QWfoFxeN53n8siN3uouKp4bhD4PmxLwAgnGS1fIp2HtcShvQvkrlR4OS4njMeNtg/xZuoK6rl3L6j4nZ2BTiXDL6VC3ZVKgmyh589hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957454; c=relaxed/simple;
	bh=aQ4wUnjGc5pmfoIzvGc2IT9dZtMCvDmo5D6QlqxAXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4YpLfNfW2SbdPj5UIh5FK9zDs2wLJM48bgcL/B6I6419wHjrY41B67DkNwkZOnhEOEN3WvNsYDBcqDO8fp2kVRrMfwZLlInRGXOVqqlE9fwtEL09GynlXoc5SN1m6VNDuE9B/C+7Cxo0fhGxeF2tPJ8AHh2Pkptk5aHd3wqlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQ4r1EO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gk97BU61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQ4r1EO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gk97BU61"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoX9G2698594
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHOk3O4iY8NmPYpem4zaMAQrb1+f8Tv7Kz/g9GavEs4=; b=DQ4r1EO+UlkQjRzh
	+81BwMd5RWqJLbiNTyDtb0bL8yVim75g4cbxiTk7fypgSRqHo3yoJVE49fWU9Nq9
	UCqF5HN/aMvw1PQc4kX7ZhNwe50OVP1yjV7hK8QIw4l6t1c1aJGEiuZUWF987PDm
	CJNMaqqhNSlX1k9jJEvFk33qtCzJZanlv3h3/DpDD43Te1+py29rRXbNwPRJQcV2
	cbvZeYNMAneys1BrkJtuHEELF1F0B0jndxi5zPwpozkhsP8dwNwv0zdPrIt50yMd
	PL8wfMxwRLE0wsbTvQw4S3mFFQ/y3C6kqS1/dbnfP9P7IWmG+AoMckAA5Xo64Auk
	vN9cVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh059p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so986860085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957450; x=1789562250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHOk3O4iY8NmPYpem4zaMAQrb1+f8Tv7Kz/g9GavEs4=;
        b=gk97BU61qDMkyNcUOQmDPv8EU0pEmkXNW8nk3jh2mpEpVjQ5tI9eR6pVNbb8aDAHRh
         17RZC579jy6nDMS6dQMBgBIG7v66VaAIngqq67E8BxDxkeDjBt8LFFDhCIQxSwH2h6eY
         IcS6RwqDt7e3cuveYJLscHv3tSSOVidyDN/IohRWOCQx2Nrgfjd22hcE9U0KFNBCAsCx
         vqjkh6ZM0cKkx7jUwyVWoXY0qddNuiM3FcFMbBupVn7rs2qwVtZtr5rYoXdWGtaRuxFN
         +OD7jOk6BOtH3lqM8iK9S8SJnIqbS/ulcVNSSosfvLD6H37OXeo5iffuirlNxASCmOSr
         uZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957450; x=1789562250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHOk3O4iY8NmPYpem4zaMAQrb1+f8Tv7Kz/g9GavEs4=;
        b=UkGXTWdHdK4uRKktChIc8IRgwvTL1OKQiBTwLacMv7Qsjdcf5GImvhhtv778PoYkx9
         O2DdaOWWT5XAebEwmTQ+qpVEOLO5PDnVV5OlkriTQ5WTkLfIESZ7l3dQlkzuSVnJXPkR
         +do7xkBYT26XiPB+ibOxq1bbhhdL8F46PVzKYH1HrYnPt7KLcDcCyfwrU16g+FGj4CV0
         kRcg64NvlxaqDsB+NLi14WoNbNFHsX3a8e+NVFhk8hxU+0ZuMlQN5fHlB9ABoHCmzHAq
         dmfJoNHjzkJg3t4AZ3TuhHJ9hTPnue9pddrLJdYmPCZ49tiuXAuS5uSmYZd+eTSH9FvF
         ZeTw==
X-Forwarded-Encrypted: i=1; AKwUvBx+Js/o7yzpqnK+Nmkvp4bXWrY8WwaQFz+qHkNMIBHilxyasXi0uwg9p8vChttyx6pcMqIVFbWi5G4X/PY=@vger.kernel.org
X-Gm-Message-State: AFuF++nR0JH2LN7e5hDZoRML78Xmkws0CNHzODx31QMA4Qf4sVgn55GI
	hAscHbtvkNbNe3ZJEdoRhCV6Lcmo4hAJZAVXWhCQyO/d89ahh+evsMauSEnoRdVzg4ASNliphP4
	kLYVzHYRwBEjnwEGqaYVQCj29ldDW5b196/S6VZXWXBlA211sU1CJhvjfPpIvcS3crcqXaj8Fdo
	o=
X-Gm-Gg: AYBFou339GZwyP2aAMrouHMpYN21U2Cazoqwqxjt+nmAlMYuMdlb53kcPRxscQQM0kx
	6ze+mJEo5jCtPJ97AOrSWJsYfLDKQJMdkd4KUXhk1bswDEKNgN1ZNIYAMX5t5ZA1TQo/MPkdx41
	W8FFyj/BFUTUaM7/A5K2VTjpXbAv3D9O4V1Ux0FBJhM51Fyk57LVVId0rH/g5CaYdajFegTRzzR
	WcemDSCznu/bPwAtY/5uWPWsBhAkqqINAeiD07F+JELTDfKmz1SZqp4AhA2Bpp5Ijvlj+MLzvan
	9QWxKmN/GMd3UDvJMhAyozAebbZ4q2yTTkdT97Iit0zVUI61pck+DRTqrReiqQAKkaxntffFsVz
	EbWVzXtrYO1RMmDIzfGQPa2SG+zyf
X-Received: by 2002:a05:620a:4494:b0:939:d440:e530 with SMTP id af79cd13be357-939d492a0b3mr120412585a.9.1788957449701;
        Wed, 09 Sep 2026 05:37:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:939:d440:e530 with SMTP id af79cd13be357-939d492a0b3mr120400985a.9.1788957448984;
        Wed, 09 Sep 2026 05:37:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm36317328f8f.20.2026.09.09.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:37:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 14:37:09 +0200
Subject: [PATCH v2 3/4] power: sequencing: fix NULL-pointer dereference in
 pwrseq_device_register()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pwrseq-kunit-v2-3-ef496afc89d2@oss.qualcomm.com>
References: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
In-Reply-To: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aQ4wUnjGc5pmfoIzvGc2IT9dZtMCvDmo5D6QlqxAXbE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoVL/Sq/tgXU4/X6gqqO38xFKMT5GqgUCVy035
 4yRgiUMKpGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqFS/wAKCRAFnS7L/zaE
 w4w8D/9JI9hjiLlbLoDtubGkshl0wI00tYT8GieAZK85Lpf3rJ0tsRqQsm0Upc9WGH5N+eqK+ce
 brP1+0Dl8XNaNGsnn3LPyrLRQJ5kt/numaL4MBHj5KcHtAVT+0kE96m/svFzw2pEsqdVEynSOLl
 8JJZT5HYeQh5sFdJm1nqfAxE26c18BofBEh5r83X1ztYQZrCgPaSC4Z3t+20nTEjkuqMQojqKqz
 272HnjTBbZQ5dk7KnT55uKB56GiEt4ukZKUOhKC3vzuLMzK5H4+E8+AsPNpF47TJ2j9bmoLxKYt
 cgAoy4V2kG+rQrLDr8Cq6z24pRc4T+lC2Cr/EUuRM7+YokTgJDVpVCpPEj4ReFJ+PaArguB8QgR
 tmFrdOQhUJdjpoI3tnq/A5X66miBO1WEpaEpeHJetrMUC9XWwJyZnOhfIUlPv+Z4s26dKDnYswH
 7WMYfM60lD69clYfHHwhSqjfeVGpOojUh7L8khYtzPADpIFXRdJAeEkdOkflSt+bQ9mWLw3Lf5A
 xoR+rcCtzAsmjbJu+n6yUzBsJpui8VQC3nevIlVyqw7OvvoIrQKUyjAd8sTs6yDHkLi2ZQLZHUg
 VqU0ZbIYs6imQ7vPlwNt0axvDRnvup0HE/y2HcNoS5qdE5WNd60ahMPdp7lagcb+8ZuZHOMuIjd
 YKmmWSFncRYEyPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX0zx39KGHHpTr
 MAPQkY7vG6gCedubL4h7Kaf9EUh3gjOxDO+S9S1sJUy3hSaSLmN24xn7CNgD6fUa5tyCrys9QLy
 KXngOhOD5t+qgKdrS6TSqJX5ChlpI+hVt0LBFraJx4G4RK6Vm1GD6bX480Vq7dn6f/Db189UwLd
 bucJrSALtaLO5/8l/UTcQUAw7miVtieogILvBZZH2UCxqQOb1kMXv22fqd5gzqzuHM8Xrga6R7w
 k5TLac67OlQKrhEl9TXt7Vwq//uWN30enBtL707o9utVgqlGxU9e0GKOiwGvqpbO2WcpKZKj/IO
 TVfG/Xovh/bsJNJPtJzCssLy/8X920T65ZmgoXk20/XEIz/BO7be8SYO+Z+ggXqameUpRG0gufL
 81rPVQGujfKDP1KWPLxOtr7ttWQj18N7T6/6N289kBuvHV9se50xWNCttjzmFgmeLWB1HrR7ybW
 6KNDnTxSUKh+YjCZIxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX9NjiBqkfwvI1
 GhswJ/tkB8trCB4y7bUO0T9BcK1cv8eiu3vlv5/c3HFa2ICQl8r2H724+RbKkEZ0jxq+gKqOye4
 XPP5taVO2YWBzlopfsUUzwQKaE8yxoY=
X-Proofpoint-GUID: -6_s64xHLlAFD30GEWEPvc0gSp3nNbrx
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa1530a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lh2aROLewo0y3NVoW6AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: -6_s64xHLlAFD30GEWEPvc0gSp3nNbrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

If dev_set_name() fails in pwrseq_device_register(), we jump to the
err_put_pwrseq label before initializing pwrseq->targets.
pwrseq_release() will try to iterate over targets unconditionally and
subsequently dereference an invalid pointer. Move the call to
dev_set_name() after the list head is initialized.

Fixes: 249ebf3f65f8 ("power: sequencing: implement the pwrseq core")
Cc: stable@vger.kernel.org
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260903-pwrseq-kunit-v1-0-1f893d2cabc2%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index a092031943397241b2a9970de5793a0bbc8d7ecf..3076b3879af9e29261ff1f4b133bacdb74489d7c 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -505,10 +505,6 @@ pwrseq_device_register(const struct pwrseq_config *config)
 	 */
 	device_initialize(&pwrseq->dev);
 
-	ret = dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
-	if (ret)
-		goto err_put_pwrseq;
-
 	pwrseq->owner = config->owner ?: THIS_MODULE;
 	pwrseq->match = config->match;
 
@@ -517,6 +513,10 @@ pwrseq_device_register(const struct pwrseq_config *config)
 	INIT_LIST_HEAD(&pwrseq->targets);
 	INIT_LIST_HEAD(&pwrseq->units);
 
+	ret = dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
+	if (ret)
+		goto err_put_pwrseq;
+
 	ret = pwrseq_setup_targets(config->targets, pwrseq);
 	if (ret)
 		goto err_put_pwrseq;

-- 
2.47.3

