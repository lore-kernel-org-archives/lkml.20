Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F93353A72
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362107; cv=none; b=mrxXQY2TXfeY2y5JzpdSigkSVwFJB9Na/D2g2vD4I7xueBZrEgo8lgqdH4opUQGYpg9OlqKfUmZhugIlDQiXBqzU/YEuNRxnw2gJO8wSWR01YTSX63aoiB5Jq98pXNjm4Vn/HlaGFGvuWaHhUgGQvZf1VFoylP2cRgGM1Xf8hWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362107; c=relaxed/simple;
	bh=QSRrsalb79O2QOlkeMyIlIAN2oYTBb44RJvd5DviSUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awq9WU4MXHB7nb8AHPuaooyvrOLKmBhq8q8PkHWVfHvruTr4is/pd+dUgjN8i549CbAohKJeCFTeJNKAlHL66lE7sNiRQOkaPqq5lI+zt0vC8erRZrK8mWb2AoncuURxUHiFpW13A98rVcTMV1Ck0/Ay0mMXbaRvF1rZxpuoU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAIXltTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mm7iqhlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAIXltTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mm7iqhlN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR9iW1647742
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSRrsalb79O2QOlkeMyIlIAN2oYTBb44RJvd5DviSUk=; b=eAIXltThPvL2Jh0b
	EyVO4U3NTf749+DWq3FszW6rV7h78IYv2R1ZjJOnY+tL2EOXnPpdZV47pDn4tMdE
	v3+aiWFnBiiFpD3fbG8aKIdZ22PsT1L9BHRwgwN2CfNUEedQ8Du1iy2MIqZS9AF3
	nAW7jBqJy2v3L5zW8lrrMHRKStVhAEYVMZNN0HUrsLi0z69Wjlz7vY5Wqd8nwdXl
	vzQhzcxOFKKy3BfinweNdWwzf+00uxladAkw9eHumbFNFkXxiu1fbzNxVoI2rbOF
	0G4Ky6IINnlaR2/dtBHKi0oQyFqq3WJdrX+awlGUBcA76WcdrVuH5fv1ACcxGK9d
	x/OjIw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv88w99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:15:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2622581a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788362103; x=1788966903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSRrsalb79O2QOlkeMyIlIAN2oYTBb44RJvd5DviSUk=;
        b=Mm7iqhlNa7vYPTPTp6jrbn3SOC+aoz2roZ40Mr3uqYjU9WuwNtpJr2BWpXoCAxrNei
         E4QXsXRULJMElqJS+9aW1rsLgrrwKRXrIBRBFe/izWd38SqrKMR5twLzMMwGPL3SBAW1
         3iEOI55At/s9FGH9uY0PX92eXJsi1B4quesDwKkYTxpolN5my0BTqG/l2bsc+kgxijQZ
         rraIy0HoJcTKMiQJXZTJhqgB0tkZO4V0QfQE4/PY0K8HK3AHbgb44hUDshsmCjAvr5Ca
         8l9dlO2ktrOnGqYUy5ggLFH3uPQ0JhZvzlIdcz7YHFyWakR4eZxMISL3BY8iSVGGfTBF
         sXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362103; x=1788966903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSRrsalb79O2QOlkeMyIlIAN2oYTBb44RJvd5DviSUk=;
        b=LeHeiJXWxH+NOR868g6NBNEdAIRpHouzr0bSi6sk+tUDXzascCXMUADjlqGQTfWtcq
         /EkcZIR7nlkmHULTAMhOGAB4IBwXruNtqnikU8gFveNf4wyQBxbb0EJweQjtfpsfGfcm
         w81MMAzEuRj2aZRTdv85pvkWcETwFzdPVhh4fK5jqptV1Cym9S266itYQusdU4CkjDEY
         bUMjWZueSxtIfM0Hw94dGpevxU8Cvk/LIRF6yfsRM59IbSE7J2WsxrDqSMKATvSbnE/l
         R4Ntwxzrw+dJxx0jhwGo0VEgb/5wQbTcM4Cq3KmEYqqwFVMkA3IuxCKukrmuFO6hbs8L
         N7mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrN5zrVWZIHM6xG+WIkb063psw0zv7BF+fFUyr2k6wrPzFgIK7Jbq3nj73xHc3pgV2mPZsMlhySbz8TU+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nX+37V6eqqUqeCSqt0xX/FoQ3vylI7mn7isiplclDH5kT9vQCF
	+pex6bZK7FbE01pPRqZ/6CFg7VUfaZxQoiTxAHWNpNtR2YS6yV8+yxvBvVV4ApCbl9xcog2nnJ1
	Ue8TEXWVbxJCmbNT7hZ3W9mQG7oms3+VjYbhg7mjyaYS3QNju9iPOEZue3e0Xx6KH51o=
X-Gm-Gg: AR+sD10QrQrQjw8X/Yx0KRs4rdvDm1rTSrVZqIAkV2hoUJdAhciAYftKZuw0xiRgtV6
	ALqq18uOo6UVV9SI76b2Pm2JYKxX+cmVhR7SXDy065XoNqYgJc71m/i7yYTLwQVwvvt1mCmDmKm
	X1+lDQKo9nwvTbuQNKMmaK9Tcl5cffielPBevuA/ND+NOieQQezv+az0pA6rYyGF7sx+jbUCdpt
	zBsfCAnCXrE+Pu88emgM4CCRhPbmK5SoTnMuSSZqtgKs4Ftt0bk1qBbIkwlTGRXfm15kS7Kh93F
	QaSJPvAfNFpz+Qr9uG9N0xaY/em2cwRKgumZoNF7aLI/CXi72sPponTu0m9AXefj9VaEXH0ITjD
	DHzuAuq3dnTz9M4/skRw51NcgOl/9dgd8swU=
X-Received: by 2002:a05:6a20:d509:b0:3d8:c997:6f14 with SMTP id adf61e73a8af0-3d9b2384444mr9029934637.22.1788362103347;
        Wed, 02 Sep 2026 08:15:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:d509:b0:3d8:c997:6f14 with SMTP id adf61e73a8af0-3d9b2384444mr9029804637.22.1788362102761;
        Wed, 02 Sep 2026 08:15:02 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc35ba15000sm1203032a12.32.2026.09.02.08.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:15:02 -0700 (PDT)
Message-ID: <1fe0ff27-abc6-4813-a4a8-8bf8ca92b91a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 20:44:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: designware: Set DMA_BYPASS bit in outbound IATU
 CTRL2 register
To: Manivannan Sadhasivam <mani@kernel.org>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-dma_bypass-v1-1-3a53dc748ce2@oss.qualcomm.com>
 <mivyhgl3axsebyqktjqqglqgra3ptx4q3u5a3ybudmnxigvdqy@tn5sga4z45cu>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <mivyhgl3axsebyqktjqqglqgra3ptx4q3u5a3ybudmnxigvdqy@tn5sga4z45cu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WoQaiGcLG_rqpo8kvgKsUi1rYc8kD9LP
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a983d78 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nmlP1JGDO1WHMdNil6E2Tw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8NpGDg5UBIApyQi253EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNCBTYWx0ZWRfXzbbP9xk7zdbl
 rRZRrzzRrRbZtBLaWfheowIfhVfI0Z73te4T7oWsKldepVFgXED9kvtM+ARrU4J27rzjd8x0zL9
 zKouefVE4M4ofkkoA7khBE1P96EIhn7YMX7+t1SCCY6UEO3HcRJpMH+UwSP9L+MCI2BOqurFSsU
 jeaez0xmW2GnMn//pRcQ5DAKEAk6fvYjFNsmAFEKG3NRAp5VqaCHv8ZB+wo0Aa+O+EX9Ji7WEQR
 0eQaUJZeBw9K240RWZL+pC1xB8QY1V+zw1V3wetljLDHPutQsgNUdGNb1pQu9CW+sjTq7q5nbDZ
 e86/pGIkHi01kLuldESayjmruDvS7MoSt5aeptgHL6a3LTSMmhEz99SFZonEuQfagEGVqQk9THb
 KFRYEqw+kqLSxEf0sYgOlxz/fElySF8AX3JwFafXB4teRTvex9pXYUJLYl1YddjonwC9qJlzrgr
 X8SzNiu2ZpzA4Wi/IWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNCBTYWx0ZWRfX1E09Evf+nZ60
 bVECtr4iHJjeH5gaOY3Fg2WTxESmsZs4VszxQErYNpchbxurKoQGG0y2vArdu3BBhxiprqYLgSE
 zPYhoqlNZaQw1UckVsGGNqbzMokEgsk=
X-Proofpoint-ORIG-GUID: WoQaiGcLG_rqpo8kvgKsUi1rYc8kD9LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020134



On 9/2/2026 7:37 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 26, 2026 at 02:41:20PM +0530, Sumit Kumar wrote:
>> Outbound IATU apertures are configured with local device-side addresses.
>> When DMA engine transactions use destination addresses which fall within
>> an outbound IATU aperture range, they get unintentionally translated by
>> the IATU, causing the wrong address to be sent on the PCIe link.
>> This results in data corruption or IOMMU errors at the host if the
>> translated address is not mapped.
>>
> Why are you using the same device address in both DMA and iATU mapping? This
> sounds like a mapping problem that you should fix instead.
issue happens, when host address(DMA destination address) matches with the
internal iova address programmed in iATU src address.
As we can cannot address in both,  we need to program iATU in DMA bypass mode,
so DMA transcations will not go through iATU window.

- Krishna Chaitanya.
>
> - Mani
>

