Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EB4078D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804486; cv=none; b=FUTsMvOaBGsA5Y/enqUXbBEguvAgaUPXlEvjFDnt7/CGFpNSyt4T9mLjioHkM4GNZCXUXYqZHaIIbrb+BBlxRYrdp2pBniEBSG6cvvCgS1MFinZl3q/4dczTGLyYu2XDh4aHkl8SVFcdSjkmZeYy/nNAlKv5JMyoerIQe4fco7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804486; c=relaxed/simple;
	bh=qjLm2iBplbOItMK/nBGuK56LU3E2ytdvfFyzPtdXtAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0F1Mp7GNp2qQ0HpuhFazZnAKwQhGsxqa1EPDr7D9RhrKWdUz5DsXNNLlFZYDhCO5ciz9y0dGEHlxzQzAE6XOsznrZ4jOLZKdAxx9tLK6V6VTvz38tF3r3+i4sj/7jOdHaaRedQ/pCeGolInIuS6z/4YLiyW+ATCJUDelLLgbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gImQNbwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elE4aiMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gImQNbwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elE4aiMB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEkl1754822
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=; b=gImQNbwdgJWauHAY
	mD8xFrawwRgpJu+i5pfErJVfx1bc1+jj9MyTZQz31bEl7BScch7eGz+5NXkmeC0w
	K0Nzn1tXgvaVBKEF1L678T3vvNr1hT4/Wsx4apRrwWwam5euUV2lEaHGHqqY+wF6
	iyzNely90CuD/iVOaErHNoKc7+ibJZHxLi2FfnyrjqL8ylFzmZkkPDomzeZStmjd
	m6hLmXBgxmxklByXqNCQJkUGDrB+O4+k29Am8ycEHZfJw1wlZcXqLf3r8HOCMgY0
	wMU6orZA36xouMkZNPBXW1PnUPROFSl5hQWq6hdlJqg7J+U9tpPbenrev+FHVsYc
	TKB9GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j712qxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so5072072eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804482; x=1792409282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=elE4aiMBx92RkViyU10SwbV50mh+xHJper0Un3j9s5dckwiEjeRET6mQdTsUvaYN8y
         nx1Zi9EFOkFvsHWpLSdZC/q+/zaBolRr6dAGU6xGGBAWM7ELOH4t/OoTMC3ejM9ItgW4
         ENoDCPljllVUAhF+9XNTGBdoiB2jsIwZt992HPHceiGyOujImM/inH/n60T+L39cYW0P
         s0v6IK69iAA7rLt5YhZ4df76mnio3RoFiS9Glr2UCGVlAlM+ORmtyS4gLB3RroqbB/Q8
         Z0dSnvMRY79mWZF2DeQGg8N74v1N36dD1w5uP/8KSJWT3RHk69SkI1j2zAOTyHB4ZWen
         WXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804482; x=1792409282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=e/2iZQG3iHLyriGxQHpzp2NodaDXH174E21DgMB6nxo0iq2NmhsppHbTEV6sQNHtZn
         ne2d851vOkDhnqUp3kmwEgmAUBCB4vI3OtKvAyiYaDAZ/+x7/9hRRyCyGX0MX94ac8b8
         iwnvMyQKqv85K46e+Sogh0a1QitAXmRxpIyK3l1oKaLdrhxC4Hbp9rNWaz278ZqTTdT+
         EEVzBqKYpe8ZrIIdYH01oTr1/LvIAWqm02spFwrvrzh3b3NxvsHcE7s2RhjkyRGxYkRn
         CnrYgXQq1Ah/c9c0R9mrM8xXaDqDm4N/FL0LX3uE26iaiuWWvtEY4PUoN5NJOI9PPca1
         1Rvg==
X-Forwarded-Encrypted: i=1; AKwUvBy1JG7Cu+JwRzjHAgQWZN+43zdzTa+s7gCVNrw9f3a69HfqMp5l8qb3cOYBznIeWSBy70V2Ivh+xpgDhms=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEzjhK/+LGkiBqormXtviKjYjEhpT7HzHTwFqpbJ7V08TM+j0m
	HSy+4kZSR2U34DFTB+P3ocvkWjXJBU1wXKhqQFfFVoxyKzUgtXyUe+PmwXPzGcGS8bHGLZGBA0v
	qA4p8uxgK3Y4/LRar+ovRLh+q/N6rWoZMOY8NvMH1QdtDnbVHwEjNGCkJR6S7niD7Kv6lGZadmq
	M=
X-Gm-Gg: AYBFou1B9gdBd+AavlcbCBZCjf3hWeKCjuhOQ9qzTMcsVxQBxjUOxwzgCYm0uLW9NkT
	ktB+BpCWaRtQvhNzmcoPOStbdBZUQdhBACy6ZdC85AsGDnY2p/XmBjZ7AbICvb3HMOJc7pA8v9B
	MIOfwfru6pcE7cwm4MatGMM+JqOM21sTaIp7hNrO4koNqnoOVomXm4VFARX6tgyochZxdKfeXL4
	xrLsJt7t85nJDYAWOfTxtGnhAtt4EA/kr18ZaVmsBwHr6/1yZHUqJudN1mTy5EAXferMIBAKBQO
	riHHFlDWh5pDVD2BikPl1RHUm5fWj2uTF82OCSZUZfQeKZQwtxgQsVSaIlU26/dwjz4UQ5UDLaD
	CfoVaNDpgu88BExzzmwdC2HYywFtxsjt/MA==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147798eec.19.1791804482374;
        Mon, 12 Oct 2026 04:28:02 -0700 (PDT)
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147743eec.19.1791804481793;
        Mon, 12 Oct 2026 04:28:01 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm18128821eec.4.2026.10.12.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:28:00 -0700 (PDT)
Message-ID: <82993933-090a-4306-9d3c-40ef7dfdf367@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:57:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX5oR7SxnLkcPv
 0GxeLAOLTU4uWD43J9Bi5+EeoGzJ7MNw5zrd06GiQPmZlYhsY00SFYMK8+sS6BWWx/N9tf6XszT
 lJAtmuFrFGQjThhDiruJ5unsgEVTpwc=
X-Proofpoint-GUID: BEexZaTtt2Kc-ApevHWKIeXypAGGsoII
X-Proofpoint-ORIG-GUID: BEexZaTtt2Kc-ApevHWKIeXypAGGsoII
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accc443 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjlnR1W742UOhp88nnQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX9iDLQQBHQAJH
 09DaraZq/JcFMlB9EffRcncP3CqZCD3JHSDoFXcYNPheUmleSxDLo9iEzCmaeUwSaf9EeCYfNAP
 egSh4212te18JC13m9BOVXxiDcGcovioJKYINchTQgwogNb+jgxK6wp4d9VISgmVx6UK7xXam5A
 cIt9Wg45zW1bzeBnLZSFo7U+fFI5li8Bk2P+jvDtly6Nf2qh9fKJm25nNOxnhHZ4GCqfOTdT8N/
 yDQS8W1Oh555bg5vL/6oIuTSc+Pr3NYJwgvSIwVZ+za2WWWllJX9ISglYlZz+QE0jcKNujYbFxE
 QiYe+D+Ga2+3Sll1hsa11sVAoEBFhVctNb+1lJ64Wwgmxni+ICavT7pyel+4XPKDzWHSZ42KSHf
 dZLNq5ntMHy2qKM/KM9mIqDbRViJXxwigXeceOO6DCzCOxgQKlhL5r0lxm84kPKEdsDDvcETSQ1
 3eV6kdPvCehX28G62Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

Hello Joerg , Will, Murphy,

On 9/26/2026 12:04 PM, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring<robh@kernel.org>
> Co-developed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 121 insertions(+), 7 deletions(-)

Do you see this patch getting into 7.4 ? Or, you have any other comments 
on this patch ?

If you are ok with this patch, maybe it would be a good idea to have the 
series applied by media maintainer.

Regards,
Vikash

