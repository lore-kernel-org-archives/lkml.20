Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963716;
	b=EOXeGny7CZuCoR8nP7gejQ7Yjwpzh6lyl/5ZoVGsFIKFzGJ31AXTL/RvvnThcc1l1ETm
	 ir8ic7zhCbkSJ3trDM0khm38SjOJRrE/X851l7Q5OLKi3G8BdDS8U4IqnamjFgUu4pXvQ
	 is7LPvVtTNOfdVXzRZlVLtptIPPomGeuRBX0ujw1SxabHH00Yp1+/DbEC0Zqt1zFTlled
	 eSz/bPWY7YtsrN1W6YvCiZoXHU7AE2g1TZ0F5+X43fs1waFG19ebZiODSqECH68yLV7rv
	 sW9w4CqK2Eb6DvPH4bStKwkmgXjj6IggzbwLwpn4BKfgC1DE5GmnHRhnuUUZx6o4G0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
	b=lFGfeTaivsNXr3i9D8mDVazruY8jDUaoP9kchpybT77pryG9oHPnUFVvCujulkzxjlgs
	 eNBkO3yZ4nJfJwBeNcjKnDd/V3yQWW9fQRyiDZMVhAcbbtI/4/pED6GMjfj5mTKa8tC+B
	 t9Zk8FlojcTuEb5ai5Q4l3ljMRcgxtjJ4ILDM1pyAAT5Hx1SZ8YafLOcJnDE2XLBc+jwL
	 c2rHr6xpu6K3KMOiZyFN58sHAUmaLSoMBtY5/0s67ZIlwWcYxpOhia8v7qbVcycCWufau
	 xrjrQyVslKBHTGs1X/HjuFgrGrtq2+/l11qBPxuBxM5noAN4BgFxXgqLeSi5Eys1dnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVXWd3nD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326036082BC2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326036082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVXWd3nD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APDuY2076195
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 11:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=; b=G0YFG1cB8BD0M8Eg
	KJam0otrK0ilvJFSoOBlFeo7fX9Q+rvSsp47ugNN2pn6pKgiGXoIhiKYCxINNrN0
	O3aUHcttAkRZiKlFKZoM8k+Jnjz4pRqDOYh9eRtN/sD65dh/RzEhmkavRONjp9ka
	aqF+yEdehdLbBSJTBmoJgxb+e36i8CtKSd4BMUWJ7TkNZbHJGOAR209GX8FxqG4r
	tMxP/kMhnFsWJQgdeHPZFmLPMrcsr41Jl1sm89oCE8almyAMCPnbZ/c3JLQ67F9A
	xtnikCQFFmxfq5lBf3tFeBFK2yO5y7Ldx8cxpXtj7SppWWGPC3032R8AZQhIlkZw
	T3LLRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcaggn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:15:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338bd59032so1006391cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963713; x=1794568513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=EVXWd3nDZJ29aQhUST1SGjN5h+dxOzpeELNWOLlsOfgSxPjrjXQY9l2IrcDTHw90aS
         /tXvdQKRfPhawPnJltuG4j1LPYSdj0hrmgDJhG/0zQeu0SmkW5vKHmp2EwdyRmPimdCv
         VCH/VDlnIYco/ncSoyEAYfYGDsqkg3KW294m5hkHOPY17PgNzf5FdmW/sF/OxUq0px6m
         2AQcHLOZ8HxJwRKjQ9zSrf3EuONBMSDl04anQloxYZW0lmsAxOZvVEuLB8OR/9XlEzxw
         ce34Be4Ze9ZQTEAOg85a2pBXSiVswwaQWcVJuDVJIoXWbn6KmPJaGy51TTc6ytnNSsGb
         TePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963713; x=1794568513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=NtDG9f++C4s+pBaHHITOnRjbLJFihSP4AsQzhoh7MPcAs1SKQEkS5ff3nIxI7tMO0y
         n2aHsDyRjG4UluLNhv2kFN6++EwEkM+IYXi5TSaz6EVe1JpZ6RoCNzTbJluBK1tTcEkM
         xa4fR2oR9qFNiwmrh0qb5dqyeH2VDJ3CZNV1reD+VFO+ZibybpHp65NW6BsdpJ0YTnXE
         c/DeIgp8PGOR/Orn+uzXJYwY+CiWRwAQ3k/fQ6H0+pwAEaaJ4ktBU8CD0PM9WbCc4qY7
         xNPHcZ3g8AN1S4lS2aDsSe0liYZkwzgOa8V0buAkN+zRJyJ/DBk6iCGQOXKpr/HSZOa6
         6YiA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+LHFBLD/7o0dpFALshQ6G5FsIw5Yse7gS21RuGPwyuf4Cuo3D87Kkx0+oH0HvG7ycmjmjf5425aO2yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s5ZyyMDN2vQyUqR4tDXagTX3khrhcdnA4D25ReTNA1eS6wAB3
	iMl79STM7enqj+1yYU6obNP7QDW2IL9oClVZDubWbALzEI6+Yyy+SSSATw5kwbKxGTS3nfwCtm2
	Xu7w+1SLSaVsfjlsxJJl6CryKK0SUeCd1Z1nZJi0KNQHi6OQsl4+C30WYnMsR997NosX41c7ZWp
	4=
X-Gm-Gg: AYBFou3S5QXhpemwX7G+FTCm3v7uLaUcKJQ3I0R7L20b4vdfZVXNzuz7rKqmB7BCSS6
	MsdIgv9pMQPg30cdtj0xxMpaaE8nj9cFCdTds0IfuJXr3s1d7SsmnybwPLFynMnloysuyEN0fmM
	MqJ5+9diMz8EQqLxrw9zkIr3jmhgjiirNhDkVLcVCHPwaHXYxNEDSt2UfsJhIf5sDSxvnCNflGq
	wE2mwPCL/PNlmD56pARPQIbhTMegMwXOvPRfDWRU2gC8VsUZr+snWAb8BjlFi4hWcb860MyqbJb
	nOzMo02ecbmjug7KhmH5dWvShafv1udPZG+ocWh8RVy7thEj6iD6pVIeIOZmpg3ymzsiHwiy9Pd
	45Lr+RjeQib3L11im+vV9XZAbZSU9nBZpOnR5xylinojZiJ9aALYPPKXz93/rZniHcdUGww==
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35476371cf.2.1793963712283;
        Fri, 06 Nov 2026 03:15:12 -0800 (PST)
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35475771cf.2.1793963711544;
        Fri, 06 Nov 2026 03:15:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7ddsm72549966b.8.2026.11.06.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:15:10 -0800 (PST)
Message-ID: <0749eb20-7cd7-4a55-ac45-fc2c616ff21d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:15:06 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vCesbuBzz1sa3KcEI32aw3-CrlzGsShD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXxmnyxByUcD+S
 m/cHOUDS+TyafagvkjlCSancRfGjKpQbu5ys2GTsmUchYSav2e5/UnCXxqulB5idaVU1LL/ERfq
 6P6ukIfrbognQdDgEPfnplaiAE+ArKXFGzQALXNw4ZCfuhN+yizgAgbeFXik2G3Ej8tSGM8Y+4b
 ox8uUHd4mH1KoWRwtBrQosxWmnTcaRD+Lj70Hfk8S9/xaFQz1f9S2RdmSEGaHYbufQBabUZmiqe
 7glNtAVVVBqBq2qxE8IsiBtvOKciLceLSSjQ9JQqATCsEcfykw1jdtZZNwLg89DdSUHr4AVGAqI
 t1tUXMFgl9chSs7/APMeVEq50eyFZOEsGACUsTjqCiTxuQYnDOck1qDWWUsBtvilB0XbB9BB53I
 iGbvTOa7CSBLCGLCwbEywf1ulL23cHAh5nOhE/ds+himNzx7koSoki1kr2ymWIV7Y6BSODiUEZm
 g1EIpKstRFGjZN7rKWQ==
X-Proofpoint-GUID: vCesbuBzz1sa3KcEI32aw3-CrlzGsShD
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedb6c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pdLQg-RyuLVsQZ1OIswA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX/9nST6ra7EMv
 p0A6ccvdwKhNsEi9gp/9FS8N/+cLG3v0Ad4/zxQv+M9CimwEtTVAUaM0sf4lOO6mhjaXY6eEC5p
 bGVsPmN74qj4ibz70/hghbsbKKoU83U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 1:51 PM, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
