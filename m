Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1046C4AC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393802; cv=none; b=XGcjDxLZkPKyh2xKTFq/k0/s0u518FQ7G50GbDOMzg0IdoOlDlms3MYsSi0BCTyppwvH2QOVZTzHHmsBjk5o1glA32dZt/XH2H7ODsm4ZArK1VB2RpFJQpKTGxMq0AxrUxb1S3wfMVUpwWSaO1eTuVWoDu8sMuuGlmriCrDMBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393802; c=relaxed/simple;
	bh=UT06poTznfl8ZTAhUcuyx70LEC/HCesL6yPpBlRCnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDu5A5hPXlt6horXaRNW/St3brmDsuAtUgxo2ERrbD2IlaKcuA/6jfYacagXS13cVpQ2lk0N9PQ2Lpd3UBMizurmSwpPF8Fl6lV4S989c8nucaiLmEKqd8YiEdWfCRCenKcfrD00iVgIQ4xjChKaP5bkgVMmT3NVA2LIdVafwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF1vugy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clyTa6G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF1vugy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clyTa6G4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0V0Q3588164
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=; b=SF1vugy6tmxJ9Hb3
	/FBZDLS+4cz7nDXWp1+crGENkhyjij95AdcMLf/rFo8zeXbBVavHGJvBWO6ZlRGa
	sTxJIBwuvKbhzK8Fai+hdLeQpX36RNOdlBbmP9Iwaw71Pe82kEZjyuex9SDZYo7h
	YE62YjGxmLa/kUEaTU8Rqf+dOtXobfFfL2qCniywySt4ktcgriRDKTNEoooHHdbF
	mXwQWtWU+MFmQBj7NeK1DXGEh+fYXbtk6yGMNmollv9EXrgC2Eq582ZpmX6/BLjB
	D0U7eqyZVEvBPfWqFlUhX/CelJT3zX/ys8qTycl4noDf1sA9hf7Z+Uqnugw1C2Dq
	q1Zi6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8wn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc5388db1so37253241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393799; x=1789998599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=clyTa6G41OmcgVz+BoTYkkRar1ffIRCGqepWY1Uxc+jLauYZ7cGTHER7eetIUrpP+c
         CJ+St2Zu8VbvU4Jsww6rcOlsnzuGI7qVyZFMkxlbDMYqjWIqn77IqH4RgJbfqMt8J37o
         3sejXNeoPsaRjjz/Zkme9YnVbMevWayWwnJpVfSpgn+XNFr5xXDudsUcydOdRV2uw9kY
         7NQVI22MmZohz48B6BUbRyH/42DVGLnhFT4T/FpWKlBDhKktDvLjHzJhWyfUCKT5z9F4
         LPhIA9qxhtEyfgL8BQhLatJXSazcUzfwFTF5wRxcjzS48fFFR1VWaeepmOx2NWxbhzMs
         Qbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393799; x=1789998599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=B/JfIvPJT9/EsESOtRq+ip2L98DUQXPex4ctHf2FHwz3RllDs1yV/IYgO0o+zQzTM+
         TAHP3nQFs7OfgfGXJ7oxa+EbP344xeTZ1OqSJex6u/0QgpK/9V0v2c3WK8yc4JdYA6R/
         OP4HqoBswxOOwjZQpu3UhwTznWDZQuEcVvlG2MuLhERlhie7fZOrh2IksSn4NhpGLiiL
         BjyKnP3uPXAx2lmsoHyOasN5d/X/lHnKcz4irM1ImNgodmegMFHPGL6gV33XjIs2Vs7h
         Bv60ReUQlSXTp4uS/k3S11xx/DQk8XJZ6qsEZXbfETAwF6HxsD5OnU02WRiYB7ph3Zg7
         XGoQ==
X-Forwarded-Encrypted: i=1; AKwUvByziIkm8JwnXS1+Xfk/Qg6YQsJPpw/+ohXePiddffVrjBjF/C0DHlB1d/SDg4NCnBpCCPDL5OgA7l4Xxm0=@vger.kernel.org
X-Gm-Message-State: AFuF++nie6atLKbXiB2CxgLMYotakK9kIdK2oEdV3SgBbiw1hkYlMTU5
	Yfnx/5C/wCITRZ+1hAHuWFICCwOfMBVzMkWaMzQAv4j2rcgEEzILWlHSbeUT8YBvTA15b1HL9yG
	VoI1P+d+98OxVSQ6DSxxafuL8VKvP0pylBdy8FFb5d/0U9+MejdQ/koGNymKX2WoDFcM=
X-Gm-Gg: AYBFou2kZu9Cjm5ZNRFH6GV+nL2EjZZo9GFpPjOl5BUomZxKS2Pzt2ICBFTSCLBw+wa
	Dcm7j1OP29lt3Vt7c25EjxyTilkfSL7XBTVTUT5mKvvAjmb/IXiL+EEckQf9z/prSa1Oi9Qxcbq
	tlBFEqYFf4GLp4HHGf4P1SBotMJ6yBz1xi6VLrwRL+YRyiDOZNSAeWoCGl3/A3GWMsBVHrtJHAv
	SFaykwIm8mm2SIa7IJxglpYZKG1Akd1a2QtHxCnXUpFU/HYoXd2iaLkvJw8BNlArSIyVCwaNu7J
	AQYGV/4d0cV7I9cQO88n19sATmkrdWkJewEHb90Dz16GAlDXPO/2HjmeCblcShlqo4RdM30nzz1
	Y8//H23VeNhlDrzmBsSXXwQ==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594967137.2.1789393799282;
        Mon, 14 Sep 2026 06:49:59 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594950137.2.1789393798841;
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm440791566b.49.2026.09.14.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Message-ID: <732f6e8c-d7b9-408b-9bde-7034f73667ce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7fb88 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e1BaVoEGz4s6-YW_u0UA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: OfbMgHUvmNCiRcL9z9diASDqMce-3bBE
X-Proofpoint-ORIG-GUID: OfbMgHUvmNCiRcL9z9diASDqMce-3bBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXxCrf4x5GocXu
 88vYIH7LFD7eVa3uz97od1k6oQK1wtgHIULVX2hIjdfGTmEqiR2Z9y0PLxl35nSYXW5+QYiaxiQ
 TIDk3NT/bl6Y6wFSnx7L/Z45EDWbRncSsIuVoY/W6yXqNeX2gfeEWgHOZ2WRMixLyoopBA+NHL+
 4KGJgGP9NQJvtrrHG7LOoAN/XfH4ItJ4g1qR93+oLP/VOK3dLMvcZAQDBvK2lt6t4QOJlhY4OvS
 GrFuau4/8JYgS3A+HnY7R7OVld5C96b/+QgBP/BTf/4baUoj3L5KBwSsXAMWbpbYuR7lhr+DD8I
 eEuRmlO9oRa2pYbpO3brDall8BAEfSro6smWw2n7KKKAk2RkTKIbDyCBF1n3nvd6akWo1bZLFX3
 uX15Q314X6y2msTNC2kmiS1y12/o0bZxHgSKYjuR6jWSxURO2TJES5czdrBWiRX/euZBU+9eSWo
 PdEALNrHa1QNfXiVAUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXxDvVy2IAAufR
 GV09gYgCTG3mW0x6U3xgG7dCXZp3P48TIhqTy9YE5YzezijNnYAlX5IWk/NV2ARYObZDul71Nlc
 DXlLRYZ6QUU42mXu8G4EyfwzJRbQKCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140198

On 9/11/26 6:47 PM, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

GPT confirms the sequences are OK and I can see that the 217 mA
load on the regulator also has some confirmation in docs. Not sure
about the other one.

in general:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
