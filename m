Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DE3E1D0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131996; cv=none; b=HPF4zkrMHCq8Zpx66QPG+IJH1yYqkdB+JciAy4xU17uYpztgAcMpXbEfFrqzLsyOSkTVJW/bdcnKerPQAMhy8/3CuvKPHO8UBBxvW46Tjj1OrhyL3FHLbFVAAXPYYvZk1dD++HHQwTsOwnp82Rhgek2QgcDOEctm4QohkRnkxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131996; c=relaxed/simple;
	bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSbnQkWeEC4EfL/UCdyZtEEnn/Sp8KUddMbpkWlpd7EZJUWWTiTQ+y6OteeqCBTuEeFrdD7sddUZYqIgV5t1IFmtRTXZ9q60liH8NuwAEdYB2YlOG7OeYBcTLWYKneBmcV0u+5SMZN3KmNpHG3Hvc4mP2u1mIr4mNxn/wOS2P+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF1GvCoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it+cGZpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF1GvCoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it+cGZpZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiU1o3686796
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=; b=lF1GvCoWCkpCsvKS
	9ue1lQ+CIgIApluEwM92BCXOT6vpzqc6JK0lNJujwC8VFNZMzucNtcILzSoJPVdT
	8AirGO4CpufyG49jS2BdfFrSVEPEPc7uhn/GQF53gWKTXlfLAtZJELApv9iih5LM
	aS6XqsEDCXDbBz5poekLiG0ASzvVuo1SZLy2GFD8eCV7E07o+iwoehhOS+fuOJjW
	e2nO5ckeXyhqXXDGgCrhPQjTu6qlxkuJZo7c/HYuglPm5h/qxDCuPpG6819izlSw
	39gyO+Lx074QuDOdHxGQ7MztdTjvMlHu8fgqqPGN29QC51iZQ9Fga0XubfX/Gar7
	Ca0ZEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbgsnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:06:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1757966a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131987; x=1789736787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=it+cGZpZ9GWPpVNXRl5RXbHeddXHdZtXDbccp2dobjRhqD7Gtl26Z440eRQjDngVcE
         3/7IJ+vIBqlLVYb38kyCk3kXkwLqa8Z8yQ+aL1LXrFwUlQEC9RE+EL7MKrnMYsia+1An
         K/gdt/jMLF33MCTO9q/ZquxgzhDXSSo5GLpSXGkRjZCOTlSC7mK4AfNDSxkyDg0qo/o6
         cecMOVfuJx51qxINiX66m6wsbKLoVijfEgfBC4z2iORmJUruiZm8btXkgJYHBgitmzY7
         cPjq89xbYCj80qJ6juIt9Cb1sON6/o15gu53TJubeBKd9U+eVmuNyPF+ux4tIJ0oc7/N
         5IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131987; x=1789736787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=AD0IiDNcqOlzoRNwmyQQVbNsIR8MILOkafHs0hFzg3z+7hLS0rZU0uhxSwJeL7khWl
         266ZF3Pk/UMmtHFa4Ro+QkfUvxfQHVaLf6E2Sw0er5Sim1i7FsGbQC/iucaNecjOE6yM
         0p15o2pfwBKuV5rxUIogF+4RL2E7+YoEQgWVo20THk9nS1Yz2hH/+90KQakXP4y5TV9G
         LQHWUMuMbxoWJdqVBGTL1HcMI4Bhyhos2DRMTmZhG0HThl7Hu2zFWXXrRi0+of8aa3Ym
         woKSVZhaK7eJDzUWxfVha4+u6pHAiAdG4Pm0d0Wn/itnJccA5GVUQ/+v6Zx4VKaNbfpQ
         d3iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3GQuFU8nzSQosfBEYz/kY3z2BX47hWb6XoxembwbqyLuxK0XhDoGHPxRmpG2fsSaJ3s6BTHsTx170wjM=@vger.kernel.org
X-Gm-Message-State: AFuF++nMwBH/TT4rQS05SX7BOOgi5GK2f0CFRacfl++63aUi4BWPYUpU
	vqgebcGWjm0WAPEuEWUGZRzzZGa8LpTw15kxj/pg0hqAHOS5ep7lDGkbvlaXjaTASTXFt7IuQ4v
	N8D7dBQW5hjqvD1464WXgjHZi2CXP/pq6vxqc6PeHEqDAGaWoLxVF2zLtOwC4/OsUByk=
X-Gm-Gg: AYBFou2oqZANtrWFJgeFfuMtqudl/kKIBReL2ZdDdyIktis/s6tDwbjh0jpen0XiC7/
	fiMGfSDSYvdFTgAlZu5yLLRdZTk7s6NPTMO1VSi1SzAJJm0SElTRSXum76KZ7UefXrWSubVfXBN
	+aI0yhAxOhokrio/BU04C6ISTVVQCpjCvOH1BJjToNMQlpg3V2wtGEhSNJUTrxVF0cCSR0j11Ty
	dBbZSFjQZhIxgSfDIu/vGJgrzFcmrpNt8jcx26xXmxd7KxjJblt5Tw1k2GXJah7eAxVPSo4WY8k
	IzFjQ5neSdVywkdu+8VsHjUoNYdPEXbnyaMQ/utlDfEm3yT9kE/4chGtJW4aTcGys0OkcYTofv7
	hAvm2yVv44VdLSRITuRDTZW4AUJPS
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566241a91.21.1789131987251;
        Fri, 11 Sep 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566169a91.21.1789131986710;
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm5906289a91.2.2026.09.11.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Message-ID: <1d556871-2a93-45bd-9e37-d35f48be0291@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:36:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qQv8TWZfcOHcWlTBxsUpcxcULjAhgaDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX1+0WhL35N2GK
 Jiq8SXv0Bvh6Gao1LC3R1tczag7Gqh1tYwMIx9UuU1s0FH0h5ZXVva34evcy9J4MQlM7MyOP4wk
 6kVwvXlUCCXQF3AKZgy2dEt8NXIN70GFyQPCF1qYsmLRITLCW9GjC0UtVHbi59Xz6opDvevGLkx
 YdtM9eUOqfH+W0qn3tsvIKFxyVtg5+KLN99cxodHZBVXIlI9DOiP/vomNWp1WahD5tEUcuUAa3f
 Tdbfw4lkuhxksF6fbxLw/c5qMBE4e+QVySxvNf1ztRRCwdHAm15PTZuLvssITN+ty7ayxY9fHgg
 2ftw4gaF3gAfwovPoxnAly2W7ASOaxtwGed25x8R6rOM9xvTWcmWTXQhb1hFTaLIogmB1sb1uCs
 wTLKzTIXsgqKVn9xtY0lC15n7tKZrXwBJX+DBaUB8jKmXnax0IdT+MgOmPr/d72fmMeM68Hq1tv
 DG5PjKyrbRStBjP5rug==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3fcda cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfXw8z5Iag4I+DV
 Eio7r92odpkimF0ga1CWnZAvTOKxqJ4habi8k9VgBXBgh2JiT05DC+9XxKb2xniCe6CxiJIRnoV
 oddBjZg8JF+AXICP1T8ydcYaxDL0dnw=
X-Proofpoint-ORIG-GUID: qQv8TWZfcOHcWlTBxsUpcxcULjAhgaDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
>
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
