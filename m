Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CC47DFAA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468046; cv=none; b=o5DS6KlmonMC4MYZfXdmuHkaGawabEPKaJQFAzufKComUMcuBcTB1ZKsFAZmkdPKi961qFsXbMPrVcmDmLEXTPTo9TvCZGJ5ivkYTOr6aH3ZOvPbx/A5j+7lX8p1ThlEC4zwdE+s9z301kLssgb/M7T0vE50J8PrmBR48w3waxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468046; c=relaxed/simple;
	bh=ckBmQCsGl4i0H5swMQltGNEvLAQ4QNaTpkBEqzAPUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEqMlavvnjCQn5wpeI0J0Iu5djqpazq+0s8xum7FVF8tbXvrqg+Hm/EuC4FY8t7vmn9O9i7jUTCBnSB6sRbTzIcekBFi5Ay+a1cNF6RTYEDjD2GIGjbsYsTPuxZxaAsIsDDBHztDkcf3KZ+vdKqOYKOnNEW3JtKw08qxyNptXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIwOYd+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Syrxhp1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIwOYd+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Syrxhp1C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h24L2086727
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=; b=bIwOYd+JYKFSCYrP
	nCi/eAq75tXkFs1ZYz/8MAhCy2Nx5mfuB+SFhJqYWAdqO5Ki8XFzECuVfSnWzAuL
	4thiNLSTzeKsrQH8W8M7dEv7sk3jh/6jCBbsThaG7649O4nEo4YKTFQMFhfbymVa
	5/Ra+rKB114Ves5BkmJ3Yct/+R9zfzlYATVK366v4VWegslqrg2Cxj3wA/GeutJ+
	ZWlEWlB1EpGpqgJqPR2SIE7wQw3G1l8luRBwF010kkya2wbCAhYUVOKD4FWDU7b6
	TfjVDwIpn5KdQCHsae/OHIlHaGMvkewseomzIlAx7Aykto9YgL2jjaR+TswQDBU6
	VQ6W7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8uqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f27c80a3so852458185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468043; x=1790072843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=Syrxhp1CCcwhbMw38BKg60gKJA937jKuLru+Nme00TgwjszEzXLmv56JMqgp9SJ9kf
         a0VqDu/9eNXdqcus7cuYBS8u1shDsl7uqmvnpE1XLj5XjUxqbIui6yw5HqEKdYje02z1
         omE6glt6Z7PXsysVSEdn/09pzKI+0dEkR3oltYXgTsa92ThhB4Cq98oQ1BRpe1yFTx3W
         3mOpnFD54tUOW3exYymrDGpDL4OOmRJuDGUB0N3TvTL3pUL8HpVjwriIgUWfmrVqZgF5
         N8oP3631uA6OCTzQX+Jd/bAwzrOksCTOIJ2kjgZffmifw27a9rcId8VbxHDGhboCfAhD
         QLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468043; x=1790072843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=2KwvULB4s9CBNS6CPA30La+WcOQ2+Tf0m9bUemHUq+AgrrdSq5mbtSGi2PqxI9SNLJ
         v9Sm07ScpkYcdYN4N3VQYMMGF0wSFKnVm7oNRa9WGO60y/6p+o9pPJAtd/JeNLQRWihQ
         7NB1h8Z2rRxwXoiik+4KhZ5bq/efTPeC1x7o+oH83wg50OuSMth20cflwZ3AED+64ZSl
         5TkaMRiD16KrOpO6FI5p90sy60GkZhfbxTbt1hO0ynwM8SNikjedx4/Zg2et6GywwFjE
         /XVmvGE/cIOHELOeU91yjOpy8VdRnRcJAPJGm6c+qyQb61ztHlz2396qWR2g99nNRLcE
         BKKg==
X-Forwarded-Encrypted: i=1; AKwUvBxFf5K3yzPv01sAfiCN9COWnWUKpcVrreMP//iYI5qenJSDXBcFoynXyj1QFya5hSU+XsEaXudKya8XXYs=@vger.kernel.org
X-Gm-Message-State: AFuF++keOuUXq5IPj1Fbks7o7lx6cDjj9hO/96KjzNhIvZpnXDC2JlwT
	yUr9r2EjnfQtOc7Ah0mspmqRAHEfS+AspbZCj6TjHnAF8M1U/ljqGZrczsrFG0jRfD3fnA8NxkY
	l1M9GVzYwvTwvSOe7RUR0ef3wtGw5npNGlo2ynW1FTrUmk9zMPB03dmM/C2dQL8ymuRg=
X-Gm-Gg: AYBFou39LWnb1FSIlcAwMJc1mKCmVtukIpI5MymFn/Dsctlydk5lSr1o23/Ag4Qxrbl
	3GALxMo2Wz/t5cQiOuw5jci/LHMaY+c0hVcU7X3MFQ/V7uYN9T1jYxnwNYOMlkpUE8fq1CfETep
	f4Qi+aCHuOLMtYPehMFpBYJ6kpQXFejl27md/Pl/nnQ4aRjHo1+fDXrHTa+0v46MAjYkipMQcOW
	GEQr6jyOjGIqDCAvQx7TuAPW19Pa13fZebOg2AtK5z0UKKSleT5KOGjvcYbWfguisO1aa/s1WSK
	buZDXwx/1rdDz0uJY5KqPdBQnDOWztiN1dEbXQJjO7UpQjTPW+8TL4JsPZPNorHuLEnd8haJOQc
	xaQMdbIMUzQH5ENQkUvadfxUPukQn9yCeF+WW+d1vMg5jNNdSHPfe5oU8srmBNXI=
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921844085a.49.1789468042629;
        Tue, 15 Sep 2026 03:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921797285a.49.1789468037445;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
Received: from [192.168.10.107] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm71836915e9.14.2026.09.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:27:16 -0700 (PDT)
Message-ID: <0bef7837-9fd7-4401-b6cf-ba744f5beb58@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX9zlBpkg2sYog
 tURYbhdA6zhVvR9NpH7SNW0bBQsf9Ry0qzv4NJexg2QXUA/96CfBQ3qJzj4F51/JnV/O2LgRUi6
 mkKCMq8JvoOExcAF/1ir03EWjtj7Vkg=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91d8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Zce52TE6RWQhZkoPOn4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dY3S_WOMbETWckwx1eOCn352e9raGy_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX5botX4qk8Fct
 e7mETnKmtNsn0s17OALCZhg5UMn9OZLgQlgDZCqV9zrdbIFOKAW6mrnW1tZZUjDU7QoCaCfXUgZ
 7d3+s3psAYZLJUYx2F+6SY/zLuitHhmGVBnZwiWHfGDxwXPuaDV1sX7iIzIaWZQuwsPTd2cLzuc
 t8P9HAolHWPDbekQhWe2/TApmCvdsa7RgiDTNwgbt2CjnF0S7XdmGSl3APddRzWROTlc5s02k4w
 jea18lQf2SgrhQtLDCoZvXCzgae1tA4coiKr45Df17QbRhldMFk3UiT1heSna+7WZKGFf+3C+I8
 JM4y1LczpHS4rKOFYCJa9vlEtqphC7yIqwdgRiXjr1s3uOFSQkyxRdyUC8dTSt6loooe6HhDSKM
 MhSWlxQitldkLzTTp6Hq4DH1IN8VyrRX7AkgZ6B1JECQtEdNxVKHTAWrxqpHXfIqkn3+pXpTPug
 YIHnqaef3h4GRx4UlYQ==
X-Proofpoint-GUID: dY3S_WOMbETWckwx1eOCn352e9raGy_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150150



Le 09/08/2026 à 14:28, Gaurav Kohli a écrit :
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
> On Qualcomm platforms where remote processors expose mitigation controls
> through the TMD QMI service, client drivers need support to discover the
> service, register cooling devices for available mitigation endpoints,
> and forward cooling state updates to remote subsystems.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Just to clarify I deeply reviewed this patch and made some changes to 
improve the code. That is the reason why there is a co-dev-b tag but not 
a r-b tag

[ ... ]
