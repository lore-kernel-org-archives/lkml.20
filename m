Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9E3DDB00
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227599; cv=none; b=IOacHo/pSZov4aeCaiJTSQNei+eWpUgWOP4fvFTP2S5w4TcrYASA6Fxt7cP8D50mCyEPdSL7rq8IgehxKCpiL95n9khINN37xgSNqT5L69I9EbdyLi0pg0JPRBpxFSReB6ddU9o8jnjlpICUGyhc8wI8jIwt2c8m6vIi+OuMW1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227599; c=relaxed/simple;
	bh=VUwZU7jWoZ6qeQcd5+n/BQiIogXblzniZHsikRu0mN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SL28mEEGQmyf8voI5spOXU6mocyRasA6sZ9kD+YnV9V31RmifG8N7P8bR+xXS9b6rzbGqpINOhW+WiQeTW4cYLG6vs2ckkYe8QT/+ju95o7ktfkkFpghBMrDRh7EnRHMLXQ5X10bsqsLsCltCkAQbbw5DhWliujR3lJW1VgyfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4UdnJWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5h82XV+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4UdnJWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5h82XV+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810op0o979008
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 01:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=; b=F4UdnJWse8Wo6ew5
	R6u37rQSAUg0/2vPiAvQmwnmK1KhIW53x4xtnPG4+5WSClh3+na15cFmAu9ury3+
	xosxq2M7PmHFyCdM1y7+n1ECcoFD/RGSz1COfySCRBYZvMV7fIfChLZpCX+pJqLc
	Tolh1S/6n3lpjDrL+PUlugd7UArkgzjn5ytAFvb3pCWAaW4KKC+GbKHjIyatalV9
	QDhvPnF4yr7XSO26LKCjt8r76FqU75HLHWLvMOkSafg632ZvVAVpRXYNihYdYxLJ
	cm5k0rRs9PD9b0afbIrEO90UqVgdO8LcY6h2pRVuvvfwi0fMdeJQrVTF7OIO5VaP
	eStxPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dtb9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:52:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7552446a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788227537; x=1788832337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=;
        b=I5h82XV+5FkrQJrGanJ9O4nMA/a4fLbkrC6fVQ3Ay7yfKIHuA+syE1CUbqnSh1v3JU
         Lrza5TR++Pr2U9o+IaOY8mUeC/gbMmeBwVZOqHg+Zee7uJqr3W0VTt2kj9bZGD0T92BA
         uYeOFBWYAwgqdHy7o5jkrfoMCctsSrKIWq/XpN7lsC4eFKyPy1zDlS0pN3aIiiX6T2XA
         /RVSeYQTi6YJypH26Cn+MPeDlKEzh5rwFW15qQNGQf1scG1z+E5hFFEVTvp1eDsI2wQK
         av6zgFKx7a0wWRHn06MdCGoaxDegHM4xXO2vxE0fUWjFynpGiudEEhNzQlCNM13ZI0Va
         pt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227537; x=1788832337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=;
        b=pVk55KGaLsaY7kVio/PKxliXClDG5GcZ8yDHBGYyZJpeXRR1+haa73cDafaf3pWIGu
         QBOqP++WUe7ytcnh2BC0Wszo2nA0MzkucN2nR1i92BHitIFMSEHNUl6oYe1R2IdAZCvA
         1hsnkZM1g53z3AXDTEWCXHVDU2WPub1z2O6iDXy0CPC3LFp7sTukDA9hXi+I79RgLxtm
         pFz3YDhmg35enlYilUs0z6YzQidar6XeWGM3aIO0Aou720OMJ60BkMboIRdOwI57MN1e
         kiWa+y3/NPNHcHbMHAfKPRhIt9XW12jMbQVigl+Aei0s+2IAhWF6WVbOHIs0UhDJtu60
         4Vsg==
X-Forwarded-Encrypted: i=1; AKwUvBwGMcq4AIG0yVIUngHi/fMiD5mJJzPspZoU80Ax+4UkYgij3b5ks3BWlWKEy2nkkH/Jv+uXXGhmARsROpU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYNxnvoM2Iqx1H7OrXWmJt7L5iFKvTM/Emi7JKMcAuhTmpHlXb
	QaMPS0j3EmWva6fHfW5NxqPchbt5c2fkLWSI2SJeI0+GQdXfDyiIUVEuLXyYlV5V2Jayjr6iG0W
	tANkOa9DMOSQkHhteJhdOxdFVq/3cE+SWTQk/dk8U3XWS2TvfZMDjKYHACXIYRkX+z10=
X-Gm-Gg: AYBFou0xOn+eAamcpR3mCjZThzFYJ4s7vGvZ3GO4KcSG9NFpvkZe+r1v132pTGtap5e
	th7fxV4KsPq3Ej3MP88vJqtbX87XhGJ01O3hNwKZrGCFJUr3WulaJ0GD/eQQImc1iljV3zScdT8
	eltxAmdL91r3h26hcMJVZ+kDMdUWtz155lj8Hg9sKs+DT89KrVAOR+2xkXsCVsEVnB51q0GMm0K
	yZA9DjVxL+4/IX5UwPIU1GBCjtNUqkdDkwA9Tt7wxsBG25RW+aQrxSXkYeYnBBMKeURdEpYsMyR
	lpE1iy/XFwnMCx4MT4QIPeP0TKM+Tb48IBJwzNr4FKmUjdtD8nfvf//DSNkM4B3hEjmms9m8KDJ
	9fNhDjyJ3+exwt0+mqZEQfEo3DtGnl13ZAZxqB3AfezBFwyREloQgqmjv30648ty0eagQqTN8
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr33405065a91.21.1788227536780;
        Mon, 31 Aug 2026 18:52:16 -0700 (PDT)
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr33404983a91.21.1788227536255;
        Mon, 31 Aug 2026 18:52:16 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf8079sm2709695a91.1.2026.08.31.18.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:52:15 -0700 (PDT)
Message-ID: <1a9f2e1d-163d-46bd-ab40-03491786b962@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:52:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a962fd1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ggg6OIdO8VovxE8tBwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX/tfZcARpLDVa
 58xTckCP68GeDTsJznzV6b4VpkAhHyh0go43GsvI8+E0Uk+UwrtWZiia67VWOdM9dp6k9wMKU6y
 LcWXVfgM05svczPItWNBllHuXZFyM0JetW1zakH+Gu0covDCGT3+SXQUkfS7STXD/Z/RuOTjbHy
 D58d1kGsHNBBkFtq18Sj62iyQ6adGzqCksoG3pJ9F/ijRydwCGXzJSG3F3RRS4p+6LWXeb0rxBm
 f6cUP8jTsrUnlYjVjKdFeRrzgOotYfg8OTIRVaAeQXt7KfCCP5cYtfWjabjBlkEapCZum16dZ8C
 hq4nfDIs7Eac8sKXWHLQjFEsU1/OPPwuXGS32w+1BKDlXX02nwT7qz2nXKwlCLVZlKInkEl0XSy
 llH6i3NR5fRA1+H1sc4fGjF6Bjc2DSZOWWxw7mMuL4mrdR9vCS5fCDTJ3G8+rX6eRt22fiKAFgT
 80KAeiceFPz2CJ87YKQ==
X-Proofpoint-GUID: 7YnjVKIgaYO93VZa0In1gzH7JiobE2Fv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfXzFRroZDGJu0m
 n+bCdaT3qO7NN6SRuDrZL2y40O1ObFYUgIRoVVDT20UT1XmDV4moqXKXNGCZSfWVI9hjvZe5Yuz
 bmbbC7/kXZjchy/O0qdpS9dPtKvohvc=
X-Proofpoint-ORIG-GUID: 7YnjVKIgaYO93VZa0In1gzH7JiobE2Fv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010014



On 9/1/2026 4:09 AM, Jeff Johnson wrote:
> On 6/30/2026 6:30 AM, Andrew LaMarche wrote:
>> +int ath12k_core_check_dt(struct ath12k_base *ab)
>> +{
>> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
>> +	const char *variant = NULL;
>> +	struct device_node *node;
>> +
>> +	node = ab->dev->of_node;
>> +	if (!node)
>> +		return -ENOENT;
>> +
>> +	of_property_read_string(node, "qcom,calibration-variant",
> 
> I've fixed the following in the pending branch:
>     ● checkpatch.pl: 126: CHECK: Alignment should match open parenthesis
> 
>> +			&variant);
>> +	if (!variant)
>> +		return -ENODATA;
>> +
>> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
>> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);
> 
> Also:
>     ● checkpatch.pl: 132: WARNING: line length of 121 exceeds 100 columns
>     ● checkpatch.pl: 132: CHECK: Alignment should match open parenthesis
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=c9d2d0d1c4a0faaba5f57e3c3350707db9f4f3f3

looks good to me.

> 
>> +
>> +	return 0;
>> +}
>> +
> 

