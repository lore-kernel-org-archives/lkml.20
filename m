Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373856;
	b=L4BxUc6R1VXaMcojAo9EH5/s9MdjR3ZhmJRDCC8GU22ZhoV3tYLPV/l9XgpIy1yhZ9X+
	 kY+DzvB3/IMZIbaujFkhi1+T4z37wA5HaxbI1SzpDTjQXQnwVxIyjL4Bi24RTqj9plYPd
	 B7CgGeaV5zkohPtsHN9SXhzj1sxlbpBv5s0IjECrWyY0GZloStOkAVUM7obOnZOfhe1rX
	 wg2AAh/GhjyC5aWQfd7aGe9z0aIuQSPWrw7YsZN8eOhoKZCkjoaYr52mzc8hRWwL4fRxZ
	 D19Ug8C2uTQgvJCPhzghxSPk3VuQcae3cp6Hn1HxVdEaao/pJxsGzwUdJWUZp6Zm9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
	b=Uzbxacjn7RII+xzSnfX4qkK3JoQXLkkBf2QWTIj7fyq6UTxTU4HVq9gPqaGYg9aaYzyi
	 BKoVOpJm2aqbyRmNxePICFiP+EF0a56dAGSNgN3SHKq8Df3ZhOJAo7gSenQ9zTbYaC0/g
	 8xNuNnrjG+/tou3ONgNpmANcxWseOHKqZVCov3SMWUEJUubJwJ8ld/+v1yeqEemE6nZ15
	 9megw//VHA5qrAewGgD7ZkXuXZZwCVvElhhJbUcf7JySHlSSaCGlZW7u6zv1Ufp8wwGD5
	 tmBWI8mMVXgBxEsu0Q42BD6RX0sJ9bDbNk0fe/S76VmFkWcYL4+OuMLqZISG6VI3Ozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iT/cHDBL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PzMhpJZ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB51606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iT/cHDBL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzMhpJZ/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCmW2596712
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETS
	UZB5t0Rw=; b=iT/cHDBLzav35dNId9cT/Hal5Ga9KPaW5OTvdZ6xpWDvjKulWr4
	dZHETTNr7Krwq5JF3IaIQnQsEVKm1ex4YDANTH6FVgda9GMBIHWGIo8Q40ZDVav+
	4u1iJ1iebmZ2QHerl7Kq8Xhv9c5IivnCfQnHNrwGYBOGZdDtiR2DTThg+PlHhh5b
	KTvVPQPd8Lrdoh75DmeZLNpM9ESSEtYrHLWj0rcCXdfqGTwJoFQaRysdFiDUrFRK
	ANAFgigKfPlLjxHENKrzvKdSZQjN2L+KDCMPoOgXouI1zKD6tk2sOGOP+NaRvT/l
	4cBUV7llganiKTMfcgLabdS8P1wzdqH3hiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pbqxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so39919066d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373854; x=1793978654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=PzMhpJZ/6mPvhOutqKj/Uod4+zurRW8x1xrMkToT/Ux1xzbz3xqxH4IOidp5CKJEA9
         pYRPysuYOO6PnhZzxT8hkB8c5mo6QZJYGhxx0LLuIr0KJf8lNmckSspBRgDlAvvb1cMd
         TeWQMA+i9Srp1Yf7rMnI/SgPjs/45P2RCa+cJ4iGOrpeZvmsiDyDcIDjLAOOltb+wgLN
         9IWWPJAUb7NsYLqzIG60/mKzukrDaivY880XGHlWFJOp8NguHnvxAREp00gQGakuO/gQ
         vQrlGRDVKqQmtqbZCp5M2Zjj1xZ3rHF7CFvodMlaDMe6HgK1GGbCSGzIowzCUuI8UCNZ
         zEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373854; x=1793978654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=JQDF8a0V8f5EBgW1J0opsxuPuclND0aW5ll9w5dr9iQ6f+GMCHnGzVzCklVtrkHDzF
         sKXkpq2O62KpzTbyx4koPNEIVks9ZJdfgmRMDmQiLyVk3Kk1xG/J0gbnhykrvNgZ4Kyt
         U9I9q9hyP1bDbbIZ0q6gbq2P8TCzyWulpBTvRzburyWqwlewx6qJX74FYIdhfdyIp1/9
         8vsfPHz0uewfZt27DG2cCWadF8RFhJdRH14v9WzN/cnWIGnOFWtYvj/+CljAR1IHBuPg
         lQpaMhZws6aHrgklfH+5J3Asibfqb7nAtgt248PVkioiZQqOXXFsunD9ahEYetHLLDtm
         YCrw==
X-Forwarded-Encrypted: i=1; AKwUvBxTgPxUOR9UbuxutZErUVW5jRCsLenW5ehazeevSsfEktVEoywJXsVbNKiyVQGKA7+J6TN24/c+ZeeBhY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmMwDRYMwgU3r/diPmXXYkAimCWnyy5crb9VZ6Sn39fkZKo9lP
	bs+Tkm4sXUm8+dV7jm8fhGTdstBMfbZST4j67GMIqrQFcI7RdmLcZejMArdd4bpzaE66Uprrhcl
	01090n7SFZeDZf8ey6x+haYVQZOme8sXPVFR+Bqr9Ez4MVXoNhRkPTHmS7QxhtCiUil4=
X-Gm-Gg: AYBFou1jUb0nZgkR+DbCm7puWo584Tw5wrWCTTSEqrz+XhDuvvSq3JEJh7CRnIbvL0n
	wNvRgSlJnx5rJJDQ8vZjZ+bkzArpVBq94n8qZxQfe6QuyD2JH6AyZqKJvFy1pW2A03jZTSWK/TG
	AbwVtLobkDY7RCkRIhng6cck/zx6AIAc5An9MB1DPlZc9FdFYAnsRwFNe/3O1Ulgb8WqUWUD9eA
	FbYrHjjmZP6RqDMuKBCCezXibhXIsH1EeoyRcIwPOK/ya/lcInil+GCmF60s+evnCadZrl9LRDW
	U6n51v5LQg7x2SvtUMdp51Z9VNk/JzUdj37dO32oLKVzKCk+mFUwDrxuKbPBbD415fu8bTPg3zE
	06Zh6GeLCmuduECXtrqmINM39ymJJDWpdFrMzqLQ6K+NDIofiijC2yQPmKbAwRQ==
X-Received: by 2002:a05:620a:6187:b0:939:b053:ce44 with SMTP id af79cd13be357-94413389996mr928845685a.22.1793373853758;
        Fri, 30 Oct 2026 08:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:b053:ce44 with SMTP id af79cd13be357-94413389996mr928840885a.22.1793373853253;
        Fri, 30 Oct 2026 08:24:13 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm142847215e9.1.2026.10.30.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:24:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Fri, 30 Oct 2026 16:24:06 +0100
Message-ID: <20261030152405.281376-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wFhbia9prCL442JdEQf4UMZvrrCKTAZ4Ok3cjklDBLo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LaVZGq+kapElhK6n6TsLDGbX08W8YZOq0EEI
 pWpSLYJq8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS2lQAKCRDBN2bmhouD
 1xMhD/9ANg5eGH8UHPTagwQP1NLkMZXe+QyI5r0+r30Ya80uaHNYXwdC9Rwk61C9iGK00wdpQBN
 9WdzP7ugttjnzignv764U5jWwpLfym3bC0YRCVIxGNK13QiKKoIDfn0yz5zDIue9yIc06oECf6X
 XRMGL6HFkjyh6S3dNf+o0/M5LfpxpvGh2IxW6M3FkcgnYaUu2Uj68smuHDDdZw50boe/SsfGE8G
 nWloLFxXPpfSos715os12j+f9fNnJVXgaPOnQIGPp6U2mwvevJkh6WFhqmIbFm2cw7Jjbof0KmY
 w5WEz/wvlFIDTs5YGzVZNRfCcZPL32LZlABzL+dyCLUlal5/GtbvqgMZZ2aX++IBSGgMbJKM7mW
 CxjtyDoncdmxmhJK2Zmb/W4lUC9T9VGtV/fnkg4F283uk5u4zE6o3eVjWIEPE42leAcQmd3Wuqg
 560V8B+JH7awmpxcQ1B9z53cjSt4Wvjy2cYVBjUaK/n9EHMyXE5fQmy+z4oN8yA5rsrGOzFgBzY
 fSAFgh87mC4nQmDcXJTZScV1VAA2M9uesbc5od0yQsQ7jC55U0oxSAU0S3lx6PaKuuDpc6oUiHb
 RCsHt6hGKnY0GY24zOmaySOEox+Z0UoOcGdq5/WPFXuKbwMd25oKxFxGBhgHjNGN1T9aK2qHHJv hIORlticgFejOFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX0qWXTKXva6+b
 obCgVqcBDG0nGMu1mLytWJKxolOp8pOVb9OcuM4HmhsQBdQMJ9/62tqCcDtboqzZI6Z7nk4PNOn
 qZdfujLaRZVD0pE6CYU7MEQvSFRUiOZwHvAclZCLjNazxBecvnt58FxyzED8oD7YCNcJ2UwoFNL
 3oXzvyuFECiDcESfdxvztjcTBh0Kb81rlbYY2B1AnyqaHOlIrKswFndJy1rcbJPdI7OxlZSAmTl
 l8frd9Rj+I1mpYqu4sEPGISXQ0+oib6/a9kl+0Zk9xUPmjW6DuD+3f59r9iclrfp3VZt60dYkjD
 h2pPTikqx07/gKmCBg8RjDHKb4bMyuzq89UZTxHXahdK9NXrLFZgdQWSzyFokFGw9SDve+StWvR
 0R6T+5IAgYhCh77WNJ3OSt8oOE8Lg3ofwZb45YRzKAmqf4mD26tqe/ubxnBTTNMtdu6U5M5QetK
 /qqgBSdv7TsokKCfxcw==
X-Proofpoint-GUID: -hd6ylVNmX25bgTZcevOkZTv-iJBRpvp
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4b69e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: -hd6ylVNmX25bgTZcevOkZTv-iJBRpvp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX4LHHwZDbDXc4
 RaZU0oiiawVAOHvw+MKPO5O08d1la+WlPYxVj1qCr+73y9kpKGNrEuk+ghEyr9Z8oNqDQc0cSXg
 nOz8SI+CMETPjINVfbkDGblJE2HGcLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

Unprepare and drop the SMC clock reference, if probe fails to avoid
resource leakage e.g. during probe deferral.

There is no remove() callback, presumably on purpose so only error paths
are handled.

Cc: <stable@vger.kernel.org>
Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
Reported-by: Wentao Liang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I independently developed the patch and then checked the queue with
pending work of iscas. That one has issues and other complains from me,
so only credits for the report.

Changes in v2:
1. Handle of_platform_populate() error.
---
 drivers/memory/atmel-ebi.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..7dc2f7add1b1 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
-		return ret;
+		goto err_put_clk;
 
 	/*
 	 * The sama5d3 does not provide an EBICSA register and thus does need
@@ -572,14 +572,16 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 		ebi->regmap =
 			syscon_regmap_lookup_by_phandle(np,
 							ebi->caps->regmap_name);
-		if (IS_ERR(ebi->regmap))
-			return PTR_ERR(ebi->regmap);
+		if (IS_ERR(ebi->regmap)) {
+			ret = PTR_ERR(ebi->regmap);
+			goto err_disable_clk;
+		}
 	}
 
 	ret = of_property_read_u32(np, "#address-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells = val;
@@ -587,7 +589,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(np, "#size-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells += val;
@@ -603,11 +605,22 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 			ret = atmel_ebi_dev_disable(ebi, child);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
 		}
 	}
 
-	return of_platform_populate(np, NULL, NULL, dev);
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(ebi->smc.clk);
+err_put_clk:
+	clk_put(ebi->smc.clk);
+
+	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)
-- 
2.53.0

