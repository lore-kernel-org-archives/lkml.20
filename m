Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572530;
	b=BnICVRWBAGIeY97JBozJihuOFlzSThDgjSmXAuYYYE5ovdUty65uuFtL+6TUhWnw2vZv
	 Ox1AbCQ7qDwBaopJpHOFxln1NlEyBpoz5Ixwbta6ziZ0HoJWtFI57gDkuLAAJSxYvrbQy
	 MA3IGJCu+rVCDhaVdimzBNFBovl7VarUASHqvG1KeiTY4KTk19S0zm354IAeAv1ZAwurH
	 8Ov1bHGgutP4uk0xB3H7MvScWCpe8MszvXpQfgk8FU273Jc4mecQe69V8ah7IXZR295AF
	 gxLgfrrJfpsd+9fGVWKkgledz9BlqZ4PVKwHAYz685MveyX8BiAs8sNp52BIRXX+SGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
	b=WC7xv0O8gMkeGb4SSZnFV0z/fGshALr2+pa/HTQPlL8qY5QpwhVRvthBr+Mkj9UBndUw
	 n3iTBq44r4NlYZtd/jpApxWs2U5yAMphGKjCieFG4G99twh+D/yWtlpZXRkR6hFOFltxb
	 DEkoI3imoI568btuOxIkRw3XqCbPDJo8K72Ruv5L/xLPQqPPV+xJvV7lGGVAoDcpDE4UG
	 VUSkC5YvHU/8RdcVH7Z/YyCL2XdP3JzIR6EEo3ixYWzWNp1npGKBbRLt4SrI7bHFVfP4O
	 R7KlTU43gGD6kpus57VJYXLyOLRBFRNGfIVnhPSa8qS6cCY3cokKwdX//KeI3LwoNcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddrk0P7T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgnrJ77C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F895606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F895606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddrk0P7T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgnrJ77C
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Ikch594915
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=; b=ddrk0P7TZCmiBLPd
	dgOH1GZhbZG/Sh4ouG87H4ydMiS0DehQ77U6wTT5iUFQdOUp0JPiXwnz+C+WUrzP
	VEcxjtQ7tqtDkQRhxeaGTiCVnhoKRVqlAAmOPAI6ZBcxQ2pqDKpB82rTkCzbjIJH
	0n2KGXKLVKGZnQlB2ZkLTNJRtZ8m4i36/bBFPf5k1Ho5eu10GH9SGa2BB9ih0Og/
	UoEuL5USjjGQM2aX9L0gI89jPmRyXrXGyowQ6EmJVFe84kCXTu8EC7rXDHCS2mYF
	/hfZO96zHU7sjpY3duqRyLU4is9hXp+aDbMFUEVkFYCq7P7TwwylC8LiZvPNnn8T
	YKOQUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk1nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so16179885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572528; x=1793177328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
        b=EgnrJ77CR9xkWKmucfP040B1gEk+BNHIpuydCQmgbn4X6mTL5L1A/Zjm8gQIxJblMX
         3F3DMMgOR+mEuyYYG8FR+3g7WkbeDNk1M3+kLbuA7lQTreJ15FnyqZ7c16tWfgZOERmQ
         eQm3o3LltzGN4/pOAHFtiOcNp614H3VoxqDC9/4aCXVdPxS4hev4E0zOrgKGAfXIK1ge
         JwZUV6gxorTAfwECUPd/HRm3L7bsHtJ7TcBtYrVSl5Kcx8LEawxv6CkqKLdY3job0iX3
         SIho04BvEKlitA1Bm8YV/cG+wN7F6954niZhmY0tNfe5hzntzauw5ZG4hQwbi65a4NbU
         u0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572528; x=1793177328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
        b=NnKJZekDbKbMMKAQLiB4ZFyM8QPFRtNBb+fesbppc4n2G4/cCKm1CIlaIMCHnOmuMS
         goneLBvm+i8KoH+AVG9u1l1WSJW0Zpyuo96479iMnooNnqVOJpAWwkdTCa/tLBa0Yylu
         utmfVSOskgFPQzTEI+CYfT8GdafQJbUD8Hys8zuVco7qyTShgZ0knQGqWwkWXaNd8MXc
         zehfUSa0qc9/2ncpkvKlyjj+R3hq8yAansXSBKmokno0aeeDywHef8lXV2tmO5equNkF
         j6N+6QmFiX3nWXQVaAZJufyaJNZn6T47IpWgw+nIS4rQqmjYOwIGce/MJyh0as8kqkyb
         QlTA==
X-Forwarded-Encrypted: i=1; AKwUvBzmidWRHfKcNCQF+YTndq5GnCE2vT3KR1Vax8+jdun+0MAT8XXWRdMHjeRTyuOgggOb48Y0iFfv6diX/0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzW0iXZ31AMyPnLgxuiBdGzNAi1a2BZEvC2Q7L1xkYgq963ZE2
	CZwXVq/iA/WykTY4yF2NENOms4mJN/dqv6vpesCh/hXQ45qVDsqBG2+hAHKlJt3ax2pXJ4zNvyd
	9nW64ndZqVpaMcZ0YYPKihX33Pnnj2wnlY04cf3l+IdqF2Ga4oIZhYQP6DlrM0ktQ6y4=
X-Gm-Gg: AYBFou0wJKWX3K4T9tLWjpjNDkFxldltwcR99CJrCX2HAyP1kqU0SSCS0iLqm0U1Q7R
	fjpXhiExAuwTMhgmf4vUP+HGcgUa9zi8SCe6trvU/OLD4ZVwcLPsqIFhlPUQqJWpK/g/mMRCIoS
	BxqpFng0LAfAhkaSP5uTImnNIKd6DpeK+vbHteSxiDF6Z92OSsrMoDS5lIqWo+mMgQujago0DxP
	3wswbDHBC/BzCfBnHdvnzUStwS4uen//ap4Y8H0vknilPu7K5laMgTpv0mD0XmOQTwGUb7GkWRn
	Gdohg83qT1I4xkbYkzORkHnASIvABl2BLLR3x5uQ53BofnG/e4TyM4RXQdlqvSW5f8C7w1joLVP
	3P28Oz0TLW8mQgud0hkFA2g==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr390412785a.6.1792572527743;
        Wed, 21 Oct 2026 01:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr390403185a.6.1792572526007;
        Wed, 21 Oct 2026 01:48:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd7039sm58003766b.54.2026.10.21.01.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:48:45 -0700 (PDT)
Message-ID: <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:48:43 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXz2Ac7Ofyn2Yx
 4HnO9t52dysVnhTKrfnPxn1lpy/YYozc3DESvoNmVwwbboozi3VY4kgaxLHy3TyfryqN/NOgpJW
 Ta6JPCpHtdgH3Y8qYHCCZ9UYHKKPcUfsl4Nr23rGE5k2hPcLArzBxQVQcIfhSXEkaANBwr/e8ij
 G/VNr13OUdz/HV2f/5iypz5tNwSDWBsqoRlAkyylVx+aP6mhsqcNLFTTt0LkM4Ux4S9Uu5Szgaa
 81lPYv6wxmaw/5Kv9y4sbicrnoO+m2uUI6s+7OwGvt9UFL6DSwMJngOY0n7gx63r5z7XyUQd0Dc
 GwebfoLBtdwI6W3VilpKe+nZILPnF3wv2pCpsQWYL5vTrWTX9p5JJHf6un60zY0Z0bo+czgWNwS
 0bO2rCy8zpnA8M3iOF+Q6GLxeAve2VsrbpmD8q2wNL3dBzvzEhaKc5IFhjFySV5xX+W33Y+FDgE
 a+54AhOuKha8/4PWVXA==
X-Proofpoint-GUID: Y2WjpM28KqEZnnY_yTzJpIfqigXIefFj
X-Proofpoint-ORIG-GUID: Y2WjpM28KqEZnnY_yTzJpIfqigXIefFj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+Op9EAWC+6a1
 /qh2PpK6geByioHNAIhXHXBcMatyCkPVoCfNCKEKpFfui2ns3nnMvGhI3a21FD9BmJCgD0YqavD
 TGPkLwml9wgqd8JtJ820ixvH2a60Zrk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87c70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=F1JjogKJRsLEfutlwsEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/13/26 2:21 AM, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> The SM8750 QBG firmware fills BATT_POWER_NOW via its maximum-load updater
> instead of an instantaneous measurement: the property getter indexes
> context + 0x6a8 + 4 * property, so property 22 (BATT_POWER_NOW) reads the
> offset written by the maximum-load path. 

I'm having trouble parsing this.

Is that a description of what happens on the firmware side? What's a
maximum-load updater?

Konrad
