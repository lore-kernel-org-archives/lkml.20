Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25948097B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368330; cv=none; b=CDdcGWVz3yVtlmSYDXcotKtF9kP4a+GcLfh0mlD4TX40AoNWXpXGTKpaKUBhBZ/kf9mLn6mw06EMqyg03Ducn8hS2gSmn/OGonQ9vpo3Be9q6kHI7ftqNU37oUWYhYRLQtfABvQ1wH30f81QWvSdgxoFQglLBWFsRcRYfHV9jbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368330; c=relaxed/simple;
	bh=0tAFdlpsP/xrqn/sPZkXuGFYqrfRYlRx8gKvjexmNnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSG2Fb1qrx87l9Kisrx83kP2HqGWJywhk+0rHx2ynogc06Wo/hiVG09CytB7NrIWxebRpWzv1AKpnl9r0+Sr6D/bu+T1hh+IA920XH+7DB1AF2buacO3hCRplfBCdv3ZcL+jNUAWWt0L89KY+c+jHLeQv4ON9AMh/kSbfoyJO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/a26ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeeKw7O1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/a26ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeeKw7O1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbqB2481462
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=; b=bz/a26kogg7pvygk
	JMGOJzgFcCT2PlTAwrtLobdJz1k0whyTRQn1Nd4/kumzpbaGbGV5Q4SQGRdZ/jLY
	XHgAofQXYAOfBKaqwHE/y+C5yNpGm/3l8yIby+LWcjkAPqK1mIWb9qbtdeZam1kM
	0gWoL83AAjOFtssperng+tMhF8bemEUXwyF4XwsL/k24lR0IEhFgCRcXYsqH1J3Q
	JoDhlSlaSdpPies/ALeZxdvjTo9rZmFna+tz4HyNYcorXa5v8JGAQ0xiWzNtqC7r
	mcAynbm9fyfTFrt2a6DE2fR2fzdZbbQs/VGG4bcI7RkqQE5G3oBCloWgL4RQ8Z5r
	7Y2vSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1mt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:18:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso40770675ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368320; x=1791973120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=XeeKw7O1CYay2KxhaumkCpTAz8ZHowqSLu79ZOK1+Q//2LqzL+ZVYWMu2nOL/NHo04
         FFy8HMVSup8lt84V2V9ABhAsc4sO4PowwSAsiOXwcZ0x/DQ8zy0BsQPf1vZUfIeHK42X
         FX1mCwNud/t6JXKq7PfNf7kZweqEpC4pnumWHDm9M/W42+Hg6VzcSiHJOMYji8stOR29
         U9l41gMIHPsQQJ8ui2ygjfIb6Xa1HXUKhnv60HfVv7vUpkMQ/1ktzaXDMwSFjfhWXwRv
         QE/UE2U91YBkM0EIYM6M2xZu8c0Sv+9+0PETJZW0kjs/NcWFn4L0f0LLf4woAySNGk/L
         qaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368320; x=1791973120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=IFKgRKS9WW/ijEdE1IpEpPZ9lEY4upeBkcHGniaX9yuUaA8lCj+7vC+rnO0Yi5ReMM
         nu1j/BGZokdvif0BmmUav1h0kpGCIqOiW0lFxRYgAK1vFyvwft/I8kvOpPFO/Hueqd2v
         DLevQqCNXv4uGy+aFy/4o6XP8eVtZIjQ8ytvykdVmV9ecS9Lzf6rrlIq/mUnblRUGf6r
         rdmMKx7WmU0/0RQZ9mJynNlmEo9X5hO0P110MUbQppupQKUcUAdq5bjfKu3PwrMbhe4c
         C9o6GFJ9Y3gqZwjSMJK2qFWYpR8JPa1YYchHNC3tHQKDg9X5n9TfHTCJ9b2g/MRKLUN2
         L21Q==
X-Forwarded-Encrypted: i=1; AKwUvByR6mXzDdgjnhN9IfA743WyRfF0cZhH0vuiCEaBpDueS/nPECTfJVZ3HJKj7iYIdn6FcNB1/rxoQx7hzE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9+VU7d/Q2B+0cIaYu4pc6Mh4586JITuoH6wc1X/lsS9okoiwo
	VOYAzW5ZAWOHdsxiyxsAVtG/9/cl+t/2W0+KkQtC8xFT5uSpP9lwPvytZwaNw4GBEcRMlNYzg6U
	VuqDi5h2DkQ2iFmfu41eGhzdrIE8mo4jUIFfXHeP23HhayBbfYSnJ7MnuG4tysP/AVZY=
X-Gm-Gg: AYBFou0kji4cZorV0OJ5evik0+fEsLICwY7IcZwT8ncL1yfkecxBdnkZpDVRF9h0Sh9
	43w1nnCFABBm19K6W/L8HcrFQQH0gcGkT+OjNsy4auEUQfV0bX0+hLoRLGDKiJ011r3M/AvOWhO
	3Re8mUKEM0Mygs/EifJ8t7aAxINyTCMs8RHINwJy/oYGaF/A/+QLsnjF5r0UACOjjUdX04J8FKt
	ieXBhVYi16FVRKngG+nRYwH3q+671NroPaGgysc7hC7uW+4Ot86hHARPL/O+ZjJOVppKhUkuqs3
	sI/AOe5q1i5B3t4eSCVlEoXQg/6349TItw8j+FTHy9RF2xCAAFHpjPULZ2wAvi6Hni4897+W9ni
	lwbiH42xn/IuF2UM2YkJQLaGpSgZE
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr937075ad.37.1791368319877;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr936765ad.37.1791368319398;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a558c2sm7495745ad.74.2026.10.07.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:18:38 -0700 (PDT)
Message-ID: <a821cc9f-a2ed-4a43-a7d1-1597f50f95f5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:48:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
 <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX42ZtNCBYRBJo
 MkxDY+PlkCft2DLPQgUSZBFZvDpQtoqGbwXBuDqTI8n03ssPfdPebRMswzd5lvWPmEpfITKp6Ga
 rbUg8kSC2EloG/iz1OemCLLYtkTq6Vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfXyrSnqGZ8NBDL
 0MJrvJQntddpGx88hBb0F1+sj6pVcKDLouo+h8iLbkhCORodyHRpCKQNNNX0rqe9PxY/TBRSGdU
 YULeqZMtUjzazE7xRagQ4QuSTk4febcU4kPo79dfnb8Q2EqxTV9nwCcsyDKBdPJ4r2W3U5xHUCM
 19dtlFAUAmxNFlQIGEACKl8q00I/1e8MFfXFOes0+7YQiDN454NCHeTEtod4Vq7uNuuglXSo9+S
 VM911bJ5mpsetrJWFooNVJPoV/w1jqV0jtp3W9QxqY77Tw93BmwnNTEGcuEpvrsLzpnNt55IejJ
 eVqFgZUFbkFjXTJuBq/1SqQj6XAZOUqHER6v7AFywzq/RwJj/VVQBARRuPf8gzEWX10kJI6XE64
 ed3uB7BrNsTPAZUwajMEYt+nV5GqKlybFvM3qqyJWFd4Rj5IwPD0gw5+A6rlmTRWrzH5LTg8Un7
 OnZAB8aQPmgeK7hUaQg==
X-Proofpoint-ORIG-GUID: 5lZVFTkHwjwrJp0ZqMpXyEnd5ugcQxRt
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac61c80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5lZVFTkHwjwrJp0ZqMpXyEnd5ugcQxRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070040

On 07-10-2026 13:57, Mukesh Ojha wrote:
> On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> If it is possible to cover all the SoCs like Hawi wherever this issue is
> there ?
ack, I'll send out a separate series fixing for all the other platforms.>

