Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A494346A02
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813232; cv=none; b=sdEmxReCKCpWITo3i36j27YbBeLV2HzEQlIW42FaBX/IFTjAhfIRzSs1V/Nad5bWM7Tbnn1/E8hDuLy0CvP2/M4MhltlLaU+0ondggQhK2Enw9RWh1hvaEPl2FibdvCCcCpKzyTXURE8yowoJg7yNN5tlM6ProiFk9bfIpqZHcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813232; c=relaxed/simple;
	bh=9cU4U+BdT0JcM3/H9SU4/WioDrfsF7Fo4dffAPzaix4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgAN6SGKf8GukhxUWyHwvvd/X4rh1tfmUIeGdglGDSh/nmS2W7R/JaLxxgEhAoBW5KNWiCdqUlkE91DQhLhQFtKe+vnLXmfZqjnswWBCdzyA9oBuPedW21ln6YNZWikN9bpxz5Vd2tnW72DoQbrzGUr3Al91zPoqfF4bjAVDYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chv4SF9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTNvi5R3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chv4SF9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTNvi5R3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R6XG2074671
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/AhrSXNQms8JbMbrVJXa9I6QwNAo12of30xAmlbY7A=; b=chv4SF9sagsZtzY2
	BilGCN4MtUUf3vXNv0d2blfxOwCcpMXezUvkX8MSPx5v51R4X742Aeqd46RJPgsP
	8mmOo+G/5rn3T/L/qmf6xgFlcoAW54Nt5ToSJBDyvfauy9zXHwyzzQL6KSRpBCvw
	vQOzZfplf2lLnGeO1w73x7GexWui8fhWzmteQsybpG7w2yd+s/3zGEFqVi8N6uJ6
	QZzv5BOIRVjIsa65YtahCEzpdt39IWVlfSVnZ7ZSKGuS26DQqJI3vbsdrDZHc3nv
	8qqEg3MYKmpI+N1LpHE01vk0V6yEGJXMv+vy+Cqpt6ZnU6rjVa7Nm8ztShNuM3S1
	RKbAWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bh7gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:47:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so29940655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787813229; x=1788418029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/AhrSXNQms8JbMbrVJXa9I6QwNAo12of30xAmlbY7A=;
        b=CTNvi5R3KlWab4JlwHldsIekHpIDPmfCosi4fKNyayqPh0SGcLGSI5s3Z5ThDPDg4T
         jas18jK76lE0fqw1NGPNKf1cqpRF0EwOf3avPtTVKMURfDQI2SVoWo2ytPXhMkz9SmMQ
         9uZbEVSIAkRh21DT320KHNl7Q+zMnnCcvGfQAV4E0xI6t1U6l3LPCfkgOEJyz8BQXv7T
         fE+lp1UOKnWK5clhHbRDPvbXzC2no6V3yLQn7YM7Mzzu+C87VZQSiLiBOGabflG83hXa
         cOrK9ZRowkDlJSDXRLmrFXkjW1N9mfkbZacqitTKktJo5WWIlQORyqYsK6lTrz4MOHS3
         hpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813229; x=1788418029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/AhrSXNQms8JbMbrVJXa9I6QwNAo12of30xAmlbY7A=;
        b=p0MpRpelBliccOfwYRNW8ct50GVQKlBD7XoBB5XwjCzf/or3jq9FJKSE7qwkDfyXb2
         byWVqKiKgAcdXqRvUoFeq/5ejr7WFtvqwlvipwxSm1iZJtdaeTw0YsKvHSKReibJ2GZ8
         IbqYLRpRwsoqFXZXP/CtcPUq6RPrKi1B1By/Bi+4+FkMTBw799FudEk1hZjUCGy9lwAI
         3FcII9Y+o4H2Y0dZAk85FZLcCPrspjaiZyncEmwrMihRlnMXT4TKdtqddM2gyo7laQWf
         17LkmIMEklGgNrckChxC6FAzksl+jRCF2tn9P5ofo6OQRcEPr4Lvf4vKx7hJBjTFdGob
         n3rg==
X-Forwarded-Encrypted: i=1; AHgh+Rr99mo1XQ+ugS3QLe+BCe6Fvcl1cQRsmYx8l2b+iDw+tHxUqBlKPEUSJJUuf3a9CM6imAzwQ3mRWgR++0k=@vger.kernel.org
X-Gm-Message-State: AFuF++kgm4CBtIZVTkfhvQ4kAJbQ5+Y6kuS0He0DpHusVrV/sI5BUS7z
	QsQjNYCcPD8f6T6mv/ioOR/WVl2ZjPl6TMj5q8Jjc1wNl3aghfAKn+jWvk3H9ZG0GWnyp0tEOaw
	+F5ONaRywTmAWDY8wteXJTEb6lsOfhuD6EU4hA0fR7bhoqV3ZJXi4AZ8Uv+XfOWZEKJM=
X-Gm-Gg: AR+sD10f4Tdvtja2qPH4wei3Frirv1e6FP/UC3Y18PGuExVTx5AZnDmIrryD+RCIB+H
	AfHlY98qIZUdyhoUyEpTOguwgELQI+tQraTNXeaPVTzO4+e1gQ6NVlExTk770GgpMUbscjUmKLH
	0PnHjVpB4u5s3Imf1z3mZckekEfNW3jOcUlP64pCaF9mPyd9s+EtzuVNkE0nuzcMLqH5EYqqtq4
	I/ya4CpdEoqPkNkl+7pkRud9zYH3G8plBkEId4/QYfmpKXMsYpDGj+GIUxEgr0jkTetfmyY7QZt
	KtwgPq7S01SfP0qL6fKAZjpHc6+F0L9WA+2QgGV2v38ZNfiuMgLqdWqGt2gUSv+EkMciBy1ZGnB
	QZDsRC0Kb8iJvEuItO7lhoCWnh4gT8mk=
X-Received: by 2002:a17:90b:4a50:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-3966d48c3e9mr23462907a91.14.1787813229260;
        Wed, 26 Aug 2026 23:47:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-3966d48c3e9mr23462842a91.14.1787813228830;
        Wed, 26 Aug 2026 23:47:08 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1123142sm1486827a91.15.2026.08.26.23.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:47:08 -0700 (PDT)
Message-ID: <d8304387-ecff-42d5-8cc6-d3b4526fb294@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:17:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-1-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-1-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfX1N9Yq5Lt4Squ
 cyLTA4etLSpbCnwvQ2+NhUoxTehZNy7YDeah1rJ2NeyLPdsSiLnfCtdBhVDu5D9NLh8q3y3ZYjT
 wPQ6/W5IJ54bpO783JOejvUeed6XPXbi2DLDyIfuK180i5K7MVZNU05Ro8HRrSA8dWLHwXOrzkD
 MCHSrYODOnQq9xUEg5FQ+MHqlnRVY+ozafFuCQ5BiXlDuUx+ft3DQfHG/qke6FIGRw4bRF2CWmA
 gkEU61zVeEYCHqTdCnmJ/CCyDinGEwdYY4wOLWGbPjVasUyFz+FB3+SBDMgOAGY7s8R/SxBslYw
 dmdAMNqXYvQ7Fmwkmu0NnKwW8eKLUM8QbpAJmK9cpQ1sJPXoIaxSAothH2IqqIPhBYX5btumJLU
 Dn9xonRAHN/yDTZ+3gwHqHmPbiLw+sB9xURIY56+aUsrxDxeYF47A4wrPJ/smvjIZRfgi+Wsvpo
 Fz0H5L0Gl7w0Q/YygCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfXyS/OdLeeihrE
 HJdLrzWRgzHvQV31ruOS/QDsFppNUrBH0YVWi6uGEscF6HUKbf8fh4Z9/J3jFVY6AiQ3hBGKpQj
 gdPGNPJLq3z4udYlto/aSpptv8SQojU=
X-Proofpoint-ORIG-GUID: 9qeO-66hDfGkFBd06q10awsAdBSnMqAk
X-Proofpoint-GUID: 9qeO-66hDfGkFBd06q10awsAdBSnMqAk
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8fdd6e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=WeR_djdGDpRL5iHq6P8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270054

On 24-08-2026 01:17, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a transition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains optional such that it does not cause probe failures.

iface clock and corresponding dtbindings are merged for v7.3 and your
change will land post that.
We can drop this from commit message?

I think we should scale only core clock and for iface clock should rely
on ufs/eMMC controller maitained frequency.

-- 
Regards
Kuldeep

