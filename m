Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705357;
	b=k3TrAqA3BcRZW02i0tTHThy3GsGxjMPZi53EVCkfBi1nXCShhhfEsjClMghsBSVmQOts
	 PTAb1VpxE4vJFP8+CA0kPlcIWsHhWpLumoM76knkiNfI2vZ+c4B3QZW/SRsdlvDwnAECI
	 X6FBMYhv6OqQNorNWw64qCNsZeb3MQWJkPzOizCuKj37CrHvtUuRlmtN+euQE7hWRb74b
	 W8VfoEGjmcAmyNBPR0Hd6oMJNSUbpTxu0QJuc8L6NM4BytOPNXwOtPIpdWjbVVVY9rNv2
	 WrVxVo1/WRsouPXYqf7CKUNeBEvtbo3pwiE0n0tEDChg7a+qUQBAzxyHUTyy4W6rHSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
	b=vUaGMYbcQABEZS2Njr6PntSDv+MZBr82nfGmLbXl1Qoo6q03VdvIfb/u7jU9ie/qCdBF
	 kROjdqaFR48er1AwJjOxpSHLRLTv7iVtrL+pNr8GVRpeIfRDrGA0MXzCSyojBTdj0lAfO
	 DNvAvtWWv8KhaQaMDFnKpvLywALL5Nh+46tfn8sFFEQuURhTeJwn7iSB5lvquwdkRTVO7
	 H8ObB9ZZk74M2jIS/xHdkukJi6bJtfCo50pqcBQPo2GOxF7CAQluDl/RcIny9XMtHVOAs
	 Cb8aZaEDzcYNN/EeHIahn5g5Q6cQR9iVd0Swuyy14sRo14qVIe+i6lvWP54TZZswwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sew2dQp/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50A606B110
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF50A606B110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sew2dQp/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAUwG2201889
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=; b=Sew2dQp/0Bsn3yVV
	VvPKV9eau7fOM4MH+Eff2mYfZkjEH35+7hM84zTqLXYqG0hMMP1jtouqm27C+cyJ
	U52q5l/SUEx3rmAT5dM+m2zmbzCxIudXMFjVnn4UbSB7Bg1qfc1+GAsCPv23kbFN
	s/ocAIN0MNrsoqgCbzDq+d/v+Yb8ZMfefE55ggXax5oqReKqDbiGil5d3qekzbTm
	ALATqVOt3cLhNnId23gaqBMwMuoTAPX8CIeOPn2wf+uf5OGB1w7GAMtKmjhgGZFR
	f480dk5QrVaKchSi3IMWmGbgxI9ycjT8Op+ycVe86wPS1iFiiRz4bbqEgLnwF7eQ
	AsPBWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3g5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:29:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so382641a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705354; x=1794310154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=OFG1spZmMsYtWa4OxILjU41MGudRRzeiEO/ISLakqaVJ5qPIsATE0JHpLiEQvzZrRr
         gPqjhcrLE9MZr24t9DABvNLjI8SHhhLQIYCfvRydkcTLzo+aWvVPHKVb7QNt9ND/LNJA
         T3Z985QuPCh8+YBNDGQ6s/v0C/8UZriakcRyiVgJff3exS5XIRDt2REA8AWQSHzEu0cC
         uqRzy5pptJVUIMXHTXLxfMhV4SCkdWXqBuFO5KVwF5UN8tMXrR8A3y7kkDr5HQ7Rkwxc
         OgW/cVZpLt9P2xc7mOwNsmah1zSL0okCcnTir+BRzLTPJwhJxutAs1ZkeiXa99z1y2Ef
         GBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705354; x=1794310154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=PjXfZ84smOKHXJitjpS5lcpDWPi8uHk2JkeoZ3ByNl1SsCOx/v6BgkQ02YwgtqZeIv
         fOsnt122mXxkkzvz8+1dpE5ttTtHRGNrw+mf7/bTB+75JQwgCJ/hI7HjtZcalH9NG0Qr
         jaGCj6xUCXlowCW0U/d75TlAZxjnk9M+EEoINK7nhQnFY+TMog6VSKj57MtL3xagvctl
         ytIUp7yLUssp/eEJzM6r83rRFkQqHQXgVTaf5owqQMoma1aDtL2VbgqK2n2lZ+0WphCl
         wgGVOxNsHrIWvZ/s+Cdb72N81+s4NX/mb8YgjRpJnviRl8disc36rntQY5Lc+VRbgnsV
         vQ3A==
X-Forwarded-Encrypted: i=1; AKwUvBzWX2xAUbELV0FOjee8ocun/qYDdFZe5VfDnnmjjPCLc5Ees6DyY+b2sLur7/f+1agkT3ie3ObX+0rujhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yCULo1rNTuCokrhspIXoYGYAVbGAU6R3ZKrzUcBilgnHIWb0b
	bXYZAkV9lsCD68amUQJm2RbcglAVq2DQJ4jhCuEbUTswE1JeIa8RtnjxopzL2RHGposks2ASZwM
	qkylFBivgALBHNPz3mwQboKh1zaj+XXtWlyS3dxsxkWGSbgZs8AE3RPiu3+GG4sIX7FQ=
X-Gm-Gg: AYBFou1pMZXKOpk5no0K6iE0llnJyekLnWFYLclpPBnzg4+rSgmNIUnRueXwnwX9Vlz
	YoOGFRIDTTmRrrAhxbvuHIuSEOa9wLarSphRHePhfopQfyDLH7/2WYuwW58mEoHbaBKdXn9DVh/
	+qeP55J+f28UP02DL9QYqasOQgFdeyVLx6lITq5+g287pfdRRfI9gagOuR2HKUOmsnHd2bmnwaD
	xgW/pKrkz/l/jA1ucfc8niN6axLJn9l0zRQuot0249ZJF2b84io+Ocpc/Q9q+SskStjUmEdKh6J
	+2BL37j4KNYgyLKzbmXiT+dkRc2eZsaOf76dvrX0gqzvOMVfUq2RwO8RV5xvTXsiJuIyR3I4ogg
	p3HnPqIZEylZA6XXADFqkH3Qc0f6vrHUCfvm+AlE5nNXxrVFQnGQbgJveg/ZmkgHUZfoEiFdRph
	w=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145994a91.26.1793705354409;
        Tue, 03 Nov 2026 03:29:14 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145979a91.26.1793705353952;
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm10519214a91.0.2026.11.03.03.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Message-ID: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:59:05 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0HlN68KVVcjKXXbc3_dEn-fD0MKVeEbv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX3f9+i8+x8elZ
 2lp2uOQQGriumEwRaJFuZIXQvo9sRqvQS7hUGjog/JMCb/XKq1KuHZERCDTXp3If1QPmAN6E6b6
 xxQfIYhg+HstYS9G5iWLq9FInmAj4BeSaFH1qter7wVJsX9msOghVrtEmvMQjyLnNpKL6fUswWE
 7TE1oTwC+2lgPRB1tpOLtOLfPxVZJ4ZTI6csLNKo49rD9G+BXVJ41QFkFGDnyrMj2vqETBKjNLQ
 ItOKaA3Y7zsxzJVOn4S3rebgGwAF2aVp34O8pvp78upKf4DO90VA5g4XLP/wEi7uLm1u1ot7COe
 bSKEETT7cP3UgSWgEoaR35nRWoGkNL0q5ZhJ2DihVF4fmFSqRgAVOryjrDGwhx0Pf1ntASDy5iq
 RqHBEAjYGsgD93IOKFpX3pT63BL2qL7rad5BIgMcscM2eO7ug+7R5oLhFRBEHioevgGW3kH87IR
 fmudjyRKfUawRt4kLCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXw6noYP27zH6V
 LfRfDp2IX7MpMhBTLvP0ohkbUsjDHUhokrZU7DhmuGrANE+GUGOcJ5EWOulYAl8G/YFXaSFIXPH
 KhTDxx6LtMllA/gxKp+FpFIFkm/k65w=
X-Proofpoint-GUID: 0HlN68KVVcjKXXbc3_dEn-fD0MKVeEbv
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9c58b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sEFLFU3R8KEXLjjolHsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045



On 02-11-2026 21:17, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

