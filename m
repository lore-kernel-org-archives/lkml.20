Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018971;
	b=ywTDe6mVZ5bcrNqm6BDX4e2lT+k5BZbhewqHIchWO0+fFnjnYuXpXoDi4srx+ejJpGcz
	 TXtrEU75t5LacweVri+l7CFBO7oHID3CxP4oHjmr8soxHmWOixMNjH9YLBSbz+FeRhYXp
	 016o4qCLrHyZfGaL1zcH1O1DWED7QNKpsVvOMKtoiauMXxJQqaoAuQSKT/uw2V6b1+QAy
	 sF1goLs/RRiRxpmDto/4wBEoaGZ/IIIkxjXzcRf3iLjrLD73IPPSBZOYzZvHWPSiG7WTE
	 k87iR209/lfo3cvl0h1oNXTIcc/EUiqOW+/iUENlA2Dvq7bZR0ioQSDBG2vWmQgoX3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
	b=fyUXCJFlHOrpLqpxivstn7H/1ki8dLjGT7zWA8e0+IvWUjozUymvo46ItRMeVvh6A0NI
	 1NIKrqKts7SyELRNsZtVcEkExlp6DyAoKo9CmrJ2KcazP7xxFQMa3pOpy/nDzwX96m+6d
	 mG38eXqo5Kpl4IQC7jCkuM+1Vc/zoJYP+0y+jlr+ymDHA+5XI0c9gPI2B0n5GrMJ16/Bx
	 jHD9MtW5rFeC0XwTiq0FMs15K2YbL6L7icjRMXANKNyJB4yXgPrUGP/pCJSxj69fysSUU
	 G7cCoHPcNzVUKhu5BiSAkQdmKdo6MlZ3M+qMYJ2AqvVxjmcSXjaaSnnGbtgy6HotgzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D790B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMYT2541984
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=; b=JCn+h5KvK+PyV9OG
	HLETjM5Zg1h0vUQQyb09eopw3fy3y9DljnIRrvepywBaNPsn7u7dB6tA93aTKpiM
	TpPRuw1qZHCCUhiAV/gozw2Li0Q6ph5rSWCVTdF98AETR86sHTq7lzMU/C1HQVz7
	WMj/Gjhs1vOXByWmbLHR7G1ZRSfzdv0nKJdNpzWvOi+wweF3wmQNQuLo3TFGSOMr
	zs4G5nQobNkr0HyeszYA42imS7G0Ldq0fyKsJOQdTGwZo8DncKG6po5RYuA4rIi5
	1wUEKiC4BCia9ZlaIjpauA7LqoygVM6G85qEGrMtwqt60nKfacwammR2d3npY95x
	x/EXlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdag3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:49:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso81147185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018969; x=1793623769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=f7TKOKLnqBXZtFG3MemDn0gQdQp7uwZ8Za4E4x0iixSiofRYczl23jAcJ6V4vpLbv2
         CpxMuYJfyxgNiyZWEJ1e0Mep5lMCvkkCocbohk5f7BUeO3KvdpVNp/Nmx2f/s8XMsHXh
         0zMpWs8WcquURHuBgl0Jp/cZJ9WpgYg8j0vpS76hdQ5BTOsLpX7/r4O900VNdKG76BZC
         5ml9Ries6y5CI4eEJxtuXoe2EOyb5+czfnXBWagQJYc1cQi5Y/AvZHpTAIqGAGk3PUfz
         rFuldrLhXnEqEeEF7j53lnG4xGmGhywpSulbVZgBwmVLvP43AAyg6m4D9zx0Qlj751ql
         t4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018969; x=1793623769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=zt0Lrm+3uE1fsATxjGXe2E4yt9/MzBjsRn1gJPAHAJgYUTcbWHDl/klsdwm2fxFO8l
         LAm2kxoPPt+cJe18yOsSoRL0VihNZPp4q4o32VkzZ1qS3b2TpRMMFn77kfSHcRujlLx1
         94GX6oPD/GhIgnpkc/JVbKqhgoCcZr9N53BFYnYRkX238A4l36fYnibidkNnrXkSkeOV
         7lEkZMLg7m/xf2aiXng3DHKPga9FBYUghnPgSJ4stDL/eCl+K5oFJV+DJmII79mO1WQJ
         1QXumBJ8VedQT7bU78gYzO3I/iJA2eTpQLdp3lenPHwBZyZbM1Z9jUILk/yCMNUutdRE
         Afbg==
X-Forwarded-Encrypted: i=1; AKwUvBx33Vl/rjcACaKzKXbk08bqqr8kcP12skgt/Bncu0Agm0IpNfdmDZANSM7a6KJPIpaGbnr9jOw9zoHmXrQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI64Tf8jwIjFKfUsNK9cFHJ5a2sj69TVbU7z1kC7FOABbLCQK6i
	LSNEQDdIpASe+DCGrNUMX2LH7/SREbgpn+7Mn0desCRl5HFnUJQ1cUDEeXw6QzdYKS7cn46fsFw
	CvXIe8LB23qS3lw/fwrXq+dfSOuF7/NKXuGj4ZASHHPRQaakjVbLm9DOnThbygynfJFM=
X-Gm-Gg: AYBFou0aRov7NsqDaBcEW0G1PKvhxhj/paaAe3t8DxEQDIQVna7frptyq7cwbWqu8yE
	pTt3xd5EWkMUa+7muoOjzAO/s/bKKFcrCi4SIlY/NwVUkb6Y6WBLwBFam0bWq0NUqVvT0aIU2jN
	mwLmpHruvf6vP1AvTWorkDRl/MivOnRVSY9A4pocIAqscllyApbq7fkj1xZi3pEg7F+/r/NfH5y
	m6DOR41vrfLpQFhVdXFIhgfX9KD9ba8u4DATEJGFce4j+EZc1DP93EG/Vu2nR5s/4sZ/Toh7PT3
	iZfo1OFRMtr7qppcAZQ/tdb2qAGhMMBnjlzwAgTB3fDb01K7fVNqa4hnQolynL6G0g/Ayp/tSRo
	qepJesmjxhI/v42XSE4q3Cg==
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986885085a.0.1793018968963;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986879885a.0.1793018968475;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm329086566b.51.2026.10.26.05.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:49:27 -0700 (PDT)
Message-ID: <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:49:25 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bQ9pPfo3MFuO-WsAeSBBWpb-Xe7Nbk2X
X-Proofpoint-GUID: bQ9pPfo3MFuO-WsAeSBBWpb-Xe7Nbk2X
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf4c5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=62u0kLJnlP3cDVRif6QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX4L7Gg4qOXe6v
 kB/0d3PY3JCRHOqymPSlXGuLNaxgTQGjRYVQFy1mH9sDym9edygfPI095/b71Ha0fi/QMKFWky6
 i3azvJDV/FMskEay6AIGTOrIKmmDPvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX5i9fjcsvb3St
 20nWCj09NiZ2NF131Zx3rwigBkthXVpLsWVBWrGf3Zlxf/1eaTGEoWaCQ1Gq7jwJuuFAM3KP8CT
 bqYnYKzrKPW5npJTN/B+F7lhvUKGyvJgeRzMCpzYxehW2Rt4slkSmDFzwdn9/2YyLH8tru7CxXl
 LA+DejvpqvGTwXbnzJiFuIK4+2nUGQY/Ttpkdcf+5AJrGhltXTDd3kaSEyxPVnfE/iSAVoL6d8j
 9DOxAIn8dotXknLnIY5mkoXOf0Ze0LPppmggDySsHlo4D+CtBcipeeCyUG/xY1vHZFXkhZPL9pM
 zW31g6ScVVtxKD1th4MNYuLkpIzsVipie+IscsnShtiIT1lO/BV+d4KZ2KZUhYoL46PsiTCyyLL
 FU6Gxe1weIX5qKjL9iVQIFg1vSrw1DbJP3xQ7Q2BLBiFw1GCSRl7bz86mrXLqJc1+zaBTCejOdE
 /WW0l2Iqjdtv1S8HSWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/25/26 2:43 PM, Viken Dadhaniya wrote:
> Short SPI transfers are sensitive to the bandwidth available on the QUP
> core interconnect path. An insufficient vote delays Serial Engine
> register and FIFO accesses, increasing command-dispatch latency.
> 
> Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
> source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
> peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
> payload throughput by approximately 38%.
> 
> Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
> controller and its frequent short SPI transfers. Other QUP/SPI instances
> do not require this vote, so avoid raising their interconnect bandwidth
> unnecessarily.

You can solve the general problem OR you can do what this and
create more work down the line. What if I connect a MCP2518FD
on SPI4? SPI5? SPI6?

Konrad
