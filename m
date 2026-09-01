Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE214430314
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278537; cv=none; b=rfLqxgbL+8A2+f5gZ6yv3DzATLVdnHPF6+T/QMYWFnofD29nT0NmYFbah8g42c+Pnr9YO4GZH4XmeR3bFmANUCbUTCdJmFHSIJ380m2cR4X/NAWYaplRMUJiIIi9de+xeAk17CTSq3uBWY+eMBrcIzYNbhyAWxGIsbahKe+/zUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278537; c=relaxed/simple;
	bh=w4mM5Ssoiev7XYTuaP4BQ0VP2VrO/qBImVxraWj4CfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThsZM2hIZBVoHRk5djmR9FxGVJbuSpXpfxnSVHSiQ7m9qUogxSo6yP+Rva/iwCjaO903tKHBiX+2RsnC3/rk1K1cOPpWALF1E65km1+w7S9yer6osvlI16FQaWEiCF5HtNbzfeRLNqVTxamDJH2uvc8xdy/u612QPJ33EHSCEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODS6pkaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR4EipQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODS6pkaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR4EipQc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E98gi2747602
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 16:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=; b=ODS6pkaLPLTANowl
	4iG9bEBSYyMSSlPy++dbr0cyqIYAWV8r0MY0D8036Bwex2TlbYbfUWCWCILomsBk
	MdCocYYyRH9W8I0UiJWUrWU07EH/2NM5iwMfOb0Vw40Of3BBQpUPQNn/6DOmF4lA
	VLu8jqXfRCAUfBv6ZXF1Xk3UfGuMhJROHsbTwce/tY9b3+Zpemg4Bzip6ZBKSzAd
	BH9xn5iCtBEla5Xqe3S/e61ftW5nYx7KuWyOLtNG/yejMHtRbzqTq1ElYr+3WhzR
	CHIFaSIxpwkqINM/k2C1OOhBNWgr6u2woHV/sGlA4weNcDj1OWDmp+FXZRvQUvwQ
	q1iutQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm1kmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:02:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7828cdd1214so8012137.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278534; x=1788883334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=MR4EipQcxoLgA0yz1BZ5Roq9b7knFm/ExNTqIIs3QoE/ihkO2O2AAnVgmIFyDBPDEv
         +crxzfEx7nFH8/HcCo4kl4sZxpQrHS7wilju2wjkKaJ37+Q8KAuL66+O6N0ZuGOLkzzn
         d/wx1/lLhTB048IGv9gZux5jYyg9AIhrlgBcSv2z9yFoEmAKssk8JG8Aq1np9K2fhX9j
         nEa3O1EUIlbHKtiG2By6sY9uotXHXxuuPJXP8oNnHk7bgt+tjjwJO9L6cnfF5aiheywO
         DsrDWtY9bt4/OJr/uyZE5qbGvZ4RUnoQRSMiZxoEbUnsb4d00vKYaltbLEv1RI2vmlj/
         KYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278534; x=1788883334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=Httdpe3WNJ28FoXUU1dLoOBjaltwz+h1nIuHrCVWJNIRV4UbZHUVNSAHJKEN+FhL5i
         mNg4HKvncI0ypRrAOqWZB5oan0VGw2dE8NwFxyiclDZJR0F5uGJULhGRx58VcdndDKra
         mp2oCSNDq3ChTTR4M9XkQMK6nAA8A2DO8upLUVXAwQ0t+B6tzmXUg5YVSNwqWqOf8kzP
         kKJRbu1lJlN9VU+UXugPQ9ps3eTrZULe7vmZRd2bh3MVteVxBgc2RZRit0oxtApsnu2c
         Wz97WcbwCs3AHZ0ZGvudx1TAHGhFWCJ6AjDZs4bOHe8jNNJcjiTUeu5Mrj+KVthDUbww
         9LdA==
X-Forwarded-Encrypted: i=1; AHgh+RrEbMftUKyaXJ+COWeOeMopAWdZPWg1gYlHYYWTj0CURwn1LbHEyAMrgAVCEz0AzJD625q3J+JgnZdM6AY=@vger.kernel.org
X-Gm-Message-State: AFuF++lSB7B+g/nixv8jWPcG9kubv1/Ta8QCf/Geb4L8tZNaTxLcWMpb
	gQ0V7R0xTs6Z0TmFlL589SYcN80vWQuhSpn2kdlKIwP4CCCCdmYg17GZefPxNZwUuyiyQRtfqGb
	wcteaH2JPw7BPBul2rNKoo2bR/PaR95edwPm1mhNGuAOYnRHjU9zqLAJg1//9+HDBVnM=
X-Gm-Gg: AR+sD12qlrzDi1QzmDp9wuxhTU1gddnLz1x4cFABRsR8EXR+C/Q/sRSFUtGiEqUzrVe
	8WLPHjD9wsM5l6ET64ugP3jQ3fj7DXRaocLPR79DH9ocnb4QDFcyzoqBM+90PKRnuh1MMYEZQ0p
	ajW6x/DtkeWl+zWj8dXsHb4LuJWM4gUvPOw3gihc6Nnbfw/t8ECmDYFWbNezaoTE52juIAgpu7l
	XJ/PYP7v56Qg7XPW3zMitn+yMMAblUNz0V/r5kBUPDKD39ZHL7Qo2yeKEI2ixkR5+5eOa5bJP0s
	9Gk0CvStltsKANLYSa/O8Q2RchiL9lOHYfsnkZdOf/fzGOP5EUXRXKzg/0JAcH/r9NCjdowrwPD
	X9rXfpOM+SjXjLw/g3VwvK2KhiQ==
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11326059137.2.1788278533846;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11325986137.2.1788278533185;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10f08sm77090785e9.7.2026.09.01.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:02:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] pinctrl: qcom: Add Hawi LPASS LPI pinctrl support
Date: Tue,  1 Sep 2026 18:02:09 +0200
Message-ID: <178827852464.39834.11620315583830437575.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5k0iM2oGaYnn10DGyUfCePEc_rc7QH2F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfXynCCs7Yk+IyE
 er4YR4PoZUUARGBp0DSrq44wzBZNSccEJ/kLnTOoTmQ7jKT3P3TEQqCEw2YbL80ODgUyXbY9Wuy
 +XT6duBrROZyiVCEHkPBGn3LdHxMXjc=
X-Proofpoint-GUID: 5k0iM2oGaYnn10DGyUfCePEc_rc7QH2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX3eJISomaVDoe
 YYjdsm8jS7z5bjWpyzYm+1oHgI50oGiymPRnLEedtaKd6omL+QTqKdjL0sqIWkVMG6LsRBa34vt
 EMaYbr/iTlJmnPmPrVHKhE8F/gYM35KBx0Au16ugwIoHxOGNqgicENR+FCDmc/8qmlUjygrSyMp
 PMk1dc7IBzhksujgeXj7UtmMheR5uonwOEiw7gavN0x4YLhcui90v9Vn7Z7tK3DsqQp//uq6sfm
 R05btrH1qgR1h7XK6UkqDuASZASOIQJx9csT+ICioxWBW7h7skJ9Na36C+ji22hOwq2RseZjr6e
 gxN+hnVCiNato3GehX8kROITkTw4gWxkQLxLXoUdwXrFqaMnkd7IbXvYZtV3LxNfcEiDFHNORaW
 35+I6MZyWJ86dEFVw4WpSWineULTfg==
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96f706 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_3pKljZcgwLS8jvdWFwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010142


On Fri, 21 Aug 2026 17:05:46 +0530, Prasad Kumpatla wrote:
> Patches 1-3 from the previous revision have been merged, so this
> revision contains only the remaining Hawi LPASS LPI pinctrl support
> patches.
> 
> Patch 1 adds the DT binding for the Hawi LPASS LPI pinctrl controller.
> Patch 2 adds the corresponding Hawi LPASS LPI TLMM driver support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      https://git.kernel.org/brgl/c/a67c78364f8b3312d36c3518fe839af8f8385101
[2/2] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
      https://git.kernel.org/brgl/c/6f168dea0db7bf35089a7fe942f1df6214464fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
