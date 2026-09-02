Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37EC4A64D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361451; cv=none; b=Tv847dVwIdnsL26Dfkdu3APnOyB1E1IYrX4YUZ5p9G0Rl+HzgBDBNZp56iYh2M/wrJfghB0WW03BnzD0WnQdy2L/Aq030HtpX82uwbnPVbNborR/w+K7Cm5sVHlZNLd57NvSBZTBdIivLim0+Lo9GAUn18Owy7wPXUjMLzCJ1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361451; c=relaxed/simple;
	bh=wCCHaHjAyebRsmsmEX2icSW1s+oMksjOOy7EFoGCWjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9n7uIqM/4Jf8EmlvTXCVDgo/wczOhdTT3m4jwnfWtvXW7WGSySVtdDwQg10fv0yp85hANBeHwiMJ1AwbWAO1/sNVTNhtk7BDf8+cDP72eOemmbOBoqXUeJ7gboZ8mnfE0w/5WVihmZjFH9vJxnoAbuGdT2TmyexW1QZbViZ/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gslt+rWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFTrziXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gslt+rWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFTrziXi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682EcrUX1675952
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=; b=Gslt+rWgaEkn8Wtt
	/GY4xVCimRHa2DbrI8POvL6E7qeLQdytf4vC+D7M9SyKb63Zk/egQ/aHObhm5XSu
	34V9wJoSKIIdXswfhBcglWSNWtlppU0yMF0W8bzoiG+2wlczpOXtKelwdMeoD7kG
	d2XmgIofGoxkaz/bwRWU2k0qB2J8ejlZxWBqPkI9Ixy6ZmNh3yRWAZ43JOXZ+/Hn
	ORx3Onu4LCsoqeCGG3G6B246sbXK2ZAX9tO4Ur3C7Qn/lcj48kj66sch0Cd5xSB0
	JlKyaBGQHkbbv7QF0r0IxAZU9Hy5IWzu3aVlynpWBl4F4bzz+a15q0OtyyAOOMPc
	y+04jA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdr33d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:04:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1714308a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788361448; x=1788966248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=;
        b=eFTrziXi3Lluc9XUB+MReoZbYQTEm4pDzXfbXQlpZly6DRQ0p9QjNwKa9fq9J8vapQ
         yH1wrzWjVUheLnprhKlVQFoAtVGnxy4cbw80LsYjGv0ZOS897Qoi6vJ25seQl9yuBJqU
         zb479x3Q9CsGOl+DbYmIWMfQbjqZ6SL/yA+aURBAih1B3y+XUH/gns9W8KlkI2EzrHtb
         LagNjp8QAL5V4j/3fGzHFHFc+7mh7hcYH3p/4fLqebWvHFAKNoAhh1TR81LTtEAJMhPl
         0Ys0zxCOIpj2qenXBS0p5YzE76r0hSL6Q27E04V42c9Cdyl7SnHdRgxfD8LLutUOmY2T
         XxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361448; x=1788966248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=;
        b=bgzIO6u+vwBhIqQmgNsjuvvpK06ZpRzPyGv29x327kBr7tFiCiGh4KvQdCqBTkWEly
         ghePM236qzJGEuk+J+uhh7axR5iQupKsk+hvZAGTlZ9ULH7PaPoVf+DkI8OAzTZZknZv
         mI34k+JIpN6rCDlEH1QEJdRlRryziZ8VLoQ4mR5lRPPag6P0LnWiknH5Xevpy7LqNyIP
         36BCgMurPpWmhC58YqXhjpvtTmT1YzchoemTOyZT695lgGGx+sRHL9lVeJRY2KlZ9nVU
         4q/HYL0BTVasE66QM9/mrgPNUlkNHWaV1N03gsj+A7hM4TLJQEakcKlEqCr6qIxURLuT
         QY8g==
X-Forwarded-Encrypted: i=1; AKwUvBxYKDuHyl/B8UhNH3Lf58U81bt2Slp6V5fkfPPTd9YRQWnmGL4Yt3oP6UCySdX7904oLHH4kIskGLNhac4=@vger.kernel.org
X-Gm-Message-State: AFuF++nD0GRnmUPW+LsirHE6xf9Y/PhfUMbHF6V4Ms5HIFiqHSa5vEIg
	1QsWdXWP15n7AjobmWq8+N8BkbSTKNIWpEnF3sKmpGzJP5etVWLGIN9ba1P5YjlmD1S9+ojan38
	EuADhQdpsqP9faP24JdlQhd0eKYXZtp6G6Q+HdpIlcEC1OsY7GgrCxlbe1EadCbYWK1g=
X-Gm-Gg: AYBFou2ikABo+QunDj4WYuKVJESXZGF9v7GZf0X2IG3L59GLXhioWCafjI5vTa04QCq
	tsNQ+RGI+YOt39xGn8fJV4zOiJ1AXdmlb62SSCFs11cOwCLuMpEabYl4zFcbFYG+cfWZ+0WJ+51
	3eTuM9JvlSPuo8FRnpChJDM8AZ+ghmOgUvqHOAqySqWJVxxBcMlQI8wsvySfphEHEHiurFeY4pT
	xlRtVnVeeqwppb625LoFR1RcgwnQ2Wl77AZSJTz5PwSKHcFN9foWU6dlCMBkORiE2OKk5kwMGd3
	0j4cmiBNnM/6D50fzN3yhHE1ZrQuiCXrNReR/ZeiPJL0m29nilVqryZu5or1ZaGM8+55+Nt9MXb
	u5y9Ixsb1TdfAJl0yAjf7zeRBjMFRoUFYZLwN3uPiMuW3cKXiwFAHLSEUGQ==
X-Received: by 2002:a17:90b:2ccd:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39aedf77333mr8400167a91.11.1788361446276;
        Wed, 02 Sep 2026 08:04:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39aedf77333mr8399969a91.11.1788361445459;
        Wed, 02 Sep 2026 08:04:05 -0700 (PDT)
Received: from [10.110.114.54] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1f4fsm7552713eec.11.2026.09.02.08.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:04:05 -0700 (PDT)
Message-ID: <d530f962-4fd0-4897-8022-c7335167f450@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 23:03:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] scsi: ufs: ufs-qcom: support ICE keyslot
 partitioning for guest VMs
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-12-linlin.zhang@oss.qualcomm.com>
 <046e4b62-6d25-40fc-baa3-2978eb96eb70@kernel.org>
 <b571ea8a-4434-45e0-958f-20b2f83ced24@oss.qualcomm.com>
 <ff869d8a-85d1-4148-b19d-af3a70fcc904@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <ff869d8a-85d1-4148-b19d-af3a70fcc904@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a983ae8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Vihkso_W4dyqxCYGQKUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jKRm3tkOQ36ODWnIQfyFjVtVFIEHAjdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfX0Lk9jA2uxp5R
 388FV7miWEjGaIIWR9Hq55xUioaIh5I1/qHgN0QWPLaiiIn5v28JdzthRPmC5uIuFIEGFG0AJBP
 wPA8B2bOiiSf+9kuBr/AzjFEkL4dUXbojKnnWDtjGpu4h+HV16GsYlwFdUHGiWGfp+g2RB0NMp0
 /5bOtHABsBJa7u7D/WewcT2fCLDUyH9vryrZ9h2xv9eFHOgaHQXDtUbHMri0CmuwSlNZvvRKlk5
 aI6nh9aWEN7QCwDr/ts0PeDOuQPUr+vyJCDg7R9uv0DXJ9YnwWWd5pvYrmEylWxy3aeBxZwChkN
 3S4epSoSRBu48fWKFoxQSChRd4zzIdRGI48txP8/pKv+8/8fI55nBGr/N4I0WW/upudlO2gUhb4
 s8OWQzDReQrPOGvgryJU0jSoVN7AcD7XELGHM6L3hJFCnH/kK9olg8H191GZqvUiI7Q4KiqPHA2
 AbcDZB63v386hV5BLaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfX7ZhYWLW7QCNY
 9A7Y/AiHOEFHOPGyVNaHyxzuK4HA5wzMaHDE1vcBJLEQSwLZs86QSF0IXZZDAIALpX68QVOdVI3
 tshN5ad7XPM14M6pcFbaLZ6SWTs+oWg=
X-Proofpoint-ORIG-GUID: jKRm3tkOQ36ODWnIQfyFjVtVFIEHAjdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020133



On 9/1/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On 01/09/2026 12:54, Linlin Zhang wrote:
>>>> +		u32 off, max;
>>>> +
>>>> +		if (of_property_read_u32(child, "qcom,ice-slot-offset", &off) ||
>>>> +		    of_property_read_u32(child, "qcom,max-ice-slots", &max))
>>>
>>> No, there is no such ABI.
>>>
>>
>> ACK
>>
>> This is submitted for visibility. It may be revised in a future version to use
>> a TZ SCM query interface if current out-of-band key operation in the guest is
>> approved.
> 
> Don't submit downstream code for visibility. It just clutters review and
> wastes our time.
> 

ACK, thanks for pointing that out.

> Such code IS NOT ACCEPTED to upstream, thus posting it is absolutely
> pointless.
> 
> Best regards,
> Krzysztof

