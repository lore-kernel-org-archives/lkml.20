Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FA49E5C6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818818; cv=none; b=EAw6ab7heFYMKcaCxt12uZcNrf/d+u961LcWkns1WDQWLo0NVi16keTB/9JpBtgJwjcE++5c0SEbGoHj4SnobGse7T/wNyrKMALzvdoFtMk9w40bEgx1Uws3f48BurVrdKH8HKWG7jl5R7M6hy1umw5BXNBBdrBPWRRSP2KgMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818818; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7Y1FYk5dnlL5XrnWpPGmoNjm+fC4qYfq7OjdmJ1TgA9sHGA+nJ2+buxWMnapzIk58Hz8vXfXq45N9syot9DUac0GCAmqg96+HNfEv0eQbF9IFS4Cso889CVYT/rFbF3pMUCu2GgeOXWkRDVbdcJKHytMWKr1bTxyl9Ow0kLES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er/ecCqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4cj1Wh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="er/ecCqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4cj1Wh3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05NU2786873
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=er/ecCqdF3NzjTNV
	5XsRRO2qNpYaNX0GtDi+pqYiN9tDidI6nRMXIXt7iJroSVLWBZ9++OpUpJ/MWIqf
	OA6sM0tEueIQ60rLw4kfjHTKGKwzvTN2v52h9HkvaeTjDgaW+QLz2aXukVo3FSvq
	Z8nMe8n4xEfLvSSCAh2qQIwjyb8zCMsDC4sZxaQH+E79qMqKdQuhf+s5rQa1rzIC
	aegRoXRm7xMdVOIljqWX/MDtuJCQeURRXanNFQ0EvEgnQ8PaBMJ+TWnZ9y6JCz4h
	lFlf3cIXeVDdrrvm+LSvqc8cE3tRlzEDhlXDRepj4KjpZD7hSETEApTiWIwC7rMp
	N/bDTQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhcgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:26:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c1fd351530so39338137.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818815; x=1792423615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=e4cj1Wh3bUx82scOQA9j3GYnGCSMYxg6SR1zof0w/De+otC+CJJ5lmDPI58CqkKuYd
         hP0j+gTYEN8vcxQ8aUw5tEcEIt9GZKnr8QJat62cQC/Sr+YslF8IvHgKz4Z6Ki3gEC3P
         tIlqjYUznLa6eyEZuDnIiquPszEvxk6y4wGE1YqaplABWWUXRIeO6MbPvtMJIgsVFpEl
         wY6khYud05rdy7F/q+SNZVTGZAWlYs0CugpYjHaB52OtL8QeP2+07112vLfnaEWHm2EL
         k82OegLIKLxDDBgwb6qtvSk0nQM/miValuNC9OHneZsIwkYw6C4K2l6gCFq/6tWSE5nX
         ObzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818815; x=1792423615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=SDhLG09IfL3VStupfpNFABTkgUY3PJoWPbw6lcVw9Hf+BowTEabB3xlpNC6ujj+Fop
         F3T9oxWUP4Cz32eJnmYzGzXOeW5RhIcUWSPV/EPfdXyRgPjLTv+/qTWpib8V5h6QlBrl
         fWD28l9a5U8GJG8yZru3dfXVMXBdl8oE6VPQQxeUvdFaFrw3hfxk3lkdGz5Kn3KwKWLn
         5PhaPogcOYnoXuc8/sOElW3rA9UwX1xa+l+Isbbwz+o+qvP/oKGL/scCY1ua9u8SP03X
         DDqmqt/CFQP0UVI5euSSgBVygHBsAT2Jtql8Yn69/K6UY7NANPkDxMVe16/uFAxfPxip
         Y3xg==
X-Forwarded-Encrypted: i=1; AKwUvByREaeNxIJvyOtKo5/KG0c9nL0xpCpeOGWsHwx4ejd3NyP/TmWQSrhyU7W/1qh/nrRYOsETG/PE0M42lt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKAccgi7ZmEeiXCnVaOGoeiL+6NVv2g9iW85qXoTeXjHEvJh/U
	XCIL/ico2OVpwPZJYO+LDp/23aU9wWqcxI3KVPTw0MOMesYTbVyTLs4zPB8Ey98vsCw80wFVqFL
	6QwcdRDnMgLMSIX8JHEdpU2F8Aq1gB8uz0Bb7BvywP7ByZykh0EfhQASlBZdNXRkCB37uQQfN4G
	4=
X-Gm-Gg: AYBFou0KW56Z+U0Mu8dXBjg8Y0qbUprHBQVGmtEW+gepS5jJnlZWetp08cJRv3s2Mvm
	zZ4rnlnMcWhhVUY7Wram/pwYu6mP/aorlMUyj5aBAqs7vbAREVZ1nkmCGyeo9A+ZcJyc02rH+Lo
	l1cFUJBfuP7xIXbGnbYDr1baoa6sEQByxuhDJRJdLKY3LiTMJXQ/qhy9Rho+e1DhnlHWMR7yibq
	YsRdxP0hynl9sNqtp+puisrYwUScr4LWyHWKyK8FradC2aUTk82IW9uTbpNTuW02MQmGWG33Lm0
	bgbqT2G7suBKEj7zLXqWH+7KTk3GsG53BQEg5jodBT2bnQLjAQSVUNLS3474mxSzdg8wiZQGXgI
	71nIDqmYUhQKAC1r3VXVu+g==
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr1991535e0c.1.1791818815077;
        Mon, 12 Oct 2026 08:26:55 -0700 (PDT)
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr1991530e0c.1.1791818814625;
        Mon, 12 Oct 2026 08:26:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm468815566b.8.2026.10.12.08.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:52 -0700 (PDT)
Message-ID: <b61f86d8-a913-4879-ba82-a56b4ffdb354@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/38] arm: dts: qcom: ipq4019: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <11b9df95b8ee7fb12a118aba7004a74616896399.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11b9df95b8ee7fb12a118aba7004a74616896399.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxu2gUjZretOA
 lCcjqH5VN9o4zU8peA/LJSYj2mz3eYkcnd1WG3/126vynK5aarTW9z6PEWNmvsA+Jqfi9PkjYk8
 uESjTk6JxXwa+ZaQWWSA54iOvtB6dILDMiVlBG//jwgxcPnas1BVKX3oEYhlYpZQ5BO5Tb1wfQo
 o9+uJfJeG8IPU4wDSI8SdXASXdPGORowCfEuDcUD5URWe9Kr42n5fo1e7lPVh80tIRJbB+QT2G9
 epequL1vbs9/Jh7jgBUMj9lirCGeazVzl7x5SX4hKNMPRYglUbHRff4wkA6oGOedyB+8wMA4L60
 iyQgwn48a5qdXeqXMTkGwdGTWqrQKYMrFlimEPrb73fx25VVvupLmu4g/xUzsgM5iUPnE3pbt15
 M4UDD6FG+yKMwdyj+S3/H9z9I0+uoxhBTez/vj1u9DXMbrgiVY3eLMB1pOCkf3LerU1g15xZ0e7
 sdokFURC8qqWgHBKe6w==
X-Proofpoint-GUID: 4HeJZU0xcGA6KYxUVa5VZ-hdoPKHWmPn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/twYkLoFWACd
 5IM0KNgTE8xACMA70uHlwtohBcCFNwTaFR+Bjobbf8x7Vqsxlb/EtOxRatw7ti3uzwowHs4YpQN
 fIjx1WIaxGrSly4UeToOneQnZeApYx4=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfc3f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 4HeJZU0xcGA6KYxUVa5VZ-hdoPKHWmPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
