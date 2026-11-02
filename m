Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614748;
	b=bwR5u5QYzQuTCt9GXjpnuEUWNmlYg7lC2QnS8bnrMtt+ZoXW5FelcxHsFTuy5Z9z2jPB
	 ejegzP6kwL0rWilRXZMByD3iykVsLwje1z7Cx5TIPtAFZHeyB6y7N8GlUnu24UAWn34jM
	 AhAH3eTqWDI0uLRBOmkIMCA09UBaL29AxZoCjx+AxDieigxzHsJHfU3oiR7VifmW0JkhC
	 DIUqaJpcYykfCOU41CRtpqygPzAyDfwZuxq/5ktAZcVot6RF/75qexrl8WWsut+GfraQF
	 2hFJSCHwWgrqH2N8vsHGtk4kRq3C5OMRFW3rR/ra1SENGu03ZLEsgYsRI1ZzWrqgnvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
	b=OMK006fd+dMmhl5v4uL6QzxQbOB4uQKeD8g3KaJDacGIbdlHMuNdgcHn3TOELezyU77m
	 m+0KzATs5WewJyigwayd9mybHvLl3oTALUdS1grboZlbu8ty1lI8Yc/NTUUZuNnDqa2+j
	 s5ZCz7krwdBoR3w6blKakibOiXksQ1PdH1J+i7kgjY/MgxaMOxLXO+XGnuHgxuH2GdztC
	 PNdf7fnqQpC9rXEjlH2hIYjwSwCovXpnURrkp7GXhnz1D/h6Ua/ALivgpnDx5xhJ11SX2
	 ueU+MPxru9VY7pejxJlm4vfC7XEe+33luZ2Vevatn3DUUTrIq+XjM8ygHbipFhTS64g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hpX/6Fyb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQ3sUz6e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C85060A382D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C85060A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpX/6Fyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQ3sUz6e
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6if213989
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=; b=hpX/6FybHZozlhoK
	vIHGkZdU52AUGWQvEb5aTqG6apalSZuaUTgGdtZmI1VuIrhw2MW9iUvI6m+Vs5JC
	EcZ2jL+6/hyt+NpkSb5XTjB2zOgVhOob587X0WF2FQMWE+8nCp+kWejeD1nM6oOI
	7NX2FEs5iDVkjcqiAc3VXCnWFRZW3f7S1XF129SnyRCSmR1DNLKmlOhX/HLlXCg4
	gwtzb1fRSk5aYXXGaCnjEaoZL8w3BLGvi6ocujszrc4Gr63OeMWEW2OMiX/9TEp0
	nVLm2Nh4fuCW5F2ql97K8tXguK/i+ItUGx4aYX/jmduMjQwheTx9GJtvAG5o7+5Y
	3row3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s3m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:19:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so567209385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614746; x=1794219546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
        b=HQ3sUz6e/ApooZDSjn1i3FCf+PN7h4xifnU26u3Xk0c0vdJaA0aCEIJJC7/WKkxQve
         dnQZyDFNsx1zEzd4dPnnYrBy6OtHVvHch8/vDeUhJTaociQdtq/lXMWbZCr1mg+Acrml
         CefO2dFeMkXzkIzmInU8ghJApQDkKlWWrsSbDPXFtxNewfkFPnZb5C6/010/m6PP5ajV
         eQxfibOM5fEJw7bYAITMxVs9qTOAKAGFo072lLcJ2auKrp10FTNVRLJ1a/rdj9SUhx1O
         K7VowEfiIvUmLGGqFutlOlYrz0RoiVVSXR3dn63dhheukuVns85Zj9vOWwo+bsygfOj9
         QQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614746; x=1794219546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
        b=a72oV2SJTYESo6ieM5vxwC1y1Y8bbkfsvP4I1cPutjbODTEI2QVbUhxFNyyckjKlBG
         RE3qem4tJc60BEH+UmemfOtQHJGWmbSr+TU2B+1wUW28SZEzWd6xIAhReVnBFlGGpDIA
         WdjyR3lPXDzWS7fyqQ3P+upVclPG3FSc4H2ropvZbkSKOlIhEpziHExYropi27550BAt
         6f1xRUSDyM3T9j2mNCaqTobHZb+VdfMtDlWJDAXh32hoJYSQg2vJqKb48sGFZ4/0NATR
         Ud2gPpHDAriGf566b1f3MY4fGk4mIEI5skYV+ZwS9uJSu6OW2cOgvpdv0vIhXA5nzyT8
         ojLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMjutvDVRCwnSz3lNvIhyABU/4y44laBoNvS+RVwdSsn8pkh1SMHXSkwWVOgKKAv3MD54Uhk3wUmKfmBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfXw3pbY4dFTJwU4EKoHOa9xjTdbFvOJPmpz89UAXIAf+dVN3h
	8NtTInckj/vbdDhRC5p4LX6F9qHeZ+CocXZ6TZLoZoRJsWF30gZFc2Tf+qBKF9mjWUuPvtEZHQx
	TsDrxoK7ycMmhUp+dbkMXQRwidPsmFawlX/LPItwXZExugbYBHMyqPm0MaKNW9TCcxuez8Cn19i
	E=
X-Gm-Gg: AYBFou1q/19fVyjM/krea4EgI+mS+xeBvIbgTW8bn/eSFxRBVmFNAZuQtLrU58JTr+f
	AoieD8AcQARWfpcSMnd/Jmog8WbxLEe++QPS8XSkcnpe+THP/6prPwyJfs54PBRpKV7B2CFKY8C
	yYwNAqGe9XbDWaXRr9AIydnq0Z+p+xHEWerEmTTIY8/OBeZqyA+nppPBf+FAESumBZTwiQVHfND
	p6sPj8fr0xpbtvAYdXQXrVpcOkZTfGRwXJS5P47YoCkBEhTkJktP5S0S3z9OETeK2AkmkcgtGPN
	P/8DO25gDZss7dd06POu+yRbps71H9vh4y6SHMaT4TC3rMkUYA50gW5AQ2PoARVO+QH2LGeTK41
	Hx3iHYlK0nvYeTBvW3Grl+yJ5b/L7PHnoaiRClO8nJSLXzw4webVHlIAAAAf62dSfxdGyCgaGvV
	/L8g==
X-Received: by 2002:a05:620a:258f:b0:939:6dfa:48fd with SMTP id af79cd13be357-944217a105amr1467226885a.51.1793614745676;
        Mon, 02 Nov 2026 02:19:05 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:939:6dfa:48fd with SMTP id af79cd13be357-944217a105amr1467223685a.51.1793614745135;
        Mon, 02 Nov 2026 02:19:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:54 +0100
Subject: [PATCH v4 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-3-21fdbe876883@oss.qualcomm.com>
References: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
In-Reply-To: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6WA0szn+2IsjDbrOHuMstXQe3C5UXanuAMkyULI/g4I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GOR3DEkF1UWGSNforUC3f1jw8q+ZpK4iiJ6z
 GQ9yuAr3cGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 wwavD/0Y4BSUmnw9IExYdq8myLYGYUEXtYW22bAOaIZji8n7j2S7DOUDTskIXzRWz5MmMTmB2ip
 X0g6izxZ63qcNCmEy4uAuGNomSENI3MUGQkv6K59xtMJg1UEk7oOWtpR4aQM7L2xJ8ll04YuA1t
 ldyMAR83mXFXLYe75PQT/c8axisQFDQOZN8Id9kzcSbmYZnNmYEq+LTMSRfhTcplUQhxmVIX3jV
 HgqLtRRRUy3zMfVSdvlx1eUMzjsl/FukD2NWTCIcBf/DxxMrvhOKtA1q8vkmGRSHdcS9vs7ZU4Y
 CnqDGgCC+hcLg7ixFdLu4iEQOsa823+hpqGgfrNpaGQkvpsiD5cennPVl03fi2aZWEas+C0E0pe
 KHEMCgI84GRugGdjCG40xV8mTB5io378hgPkVIZMu3/Q7p9rakB4FRXtW/oa9PpxWxoO8u6Szq0
 BNKU/K7A9sp3bls+q/K5Pio9s+XzFtbfZMaQrFjputOwH6zJ4wlwTqRB5qAXWuirzyOuhO6QSGt
 YxwSb66njHNQNkXo1R4tuuV3f4XVzveP0JKxT4e4XsX9kbKHTpRI0CMEPAZ2HMlyMNTFJg6GeQA
 iZ9fxUZzfAoQf122AJkdiuyE6LXawEPp0p4dKML1q/jKMAkLrnv2UZdZpzzXU1HdHf0XXJBOnLS
 Lk75xbUgTe05L8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: av53QJe6q7IQ5a3hqjuYmRzTj9WFm2ba
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8639a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=t9k0K3iV4HLebYkdnPwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX15FdVjvt/D3t
 U77QvwePIAP03wOHL1EPc2RQyPD02FeerdRp31puPEkR1kdXXdxgpBG+GDwgKTIa+Zd9mDR67Az
 rlxe9zk68pB9M57KEnBCtjOfWKWngD/0UZ2GeQmd2sHxaMGaZjk5VAPT3gCH4BSyCACc3n5sC15
 OEgaZJ8pjPFqbUHFLuGHamJbY9wsKaO9f8B1JIYJJ7nzp0CRce4gpP+yYyuY4c6e4krjjGcqgF7
 A5f5i0ADtNZ6P+c4gZqvBhiYuA2cnzekQlSxKzJSLV7q5jpjxWgkH2isQVjxbjuTPdUy7RGn8Uv
 M1OZ7TB+URbKj/KdzzM+ZQOd0qIfJc3JHua1SdM2GfuC+l0tF4N09pGjeS8eMW7nJMtEKVzqk2m
 /wLl1T5Gysb8FuD4Ya3AnwY2a84bzcEHL7GH8gQFbW9tedBcJN8bRelOOz4iTMHnXyDS6WWt1Ww
 Y82gBGdzC8/Q+jCiijQ==
X-Proofpoint-GUID: av53QJe6q7IQ5a3hqjuYmRzTj9WFm2ba
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfXwICa0spW17H0
 8XRITCT5b3q11izeaVLb+kdzdGe3GE3yOpKCEwExw3xY41VMxLjPOml4/rR1mQnQm2iEuFiUjgC
 0eR6TVWmY6AK8deVh0uulVmnNCs77tg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2fad9607fb0d55c33893785ec0db602c4f9e6bdf..28fb80a8496fe9a613228d4fe3acab9de2637634 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk_guard, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -589,22 +590,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -699,20 +697,17 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -777,13 +772,13 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return ERR_PTR(clk_guard);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -840,9 +835,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
@@ -858,20 +850,17 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -934,20 +923,17 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -1705,18 +1691,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk_guard, clk_guard)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk_guard)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1754,15 +1735,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3

