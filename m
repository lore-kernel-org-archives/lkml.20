Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498384;
	b=0p2hdAHrz1vilR9G67/gPckP2sx6H+LHZRQFXVxBLtIh4vhblhQMpi8463vQhI3wPAUU
	 JtTp3kN7ghPuE+GawuYI/+x5h/w47dV9AAVe99TH/YPZTViDV8tZJG/U5uBQ1GkwHVyuJ
	 h2Wn6RSPaZlmDE7ExBXlkyw8i558vujVYMvjuk0eQrRcTuSPO2yf1x8U5+1cNWXpDofW2
	 zG6flk8MMrQG5XsSSEJd2w9PIK5aNEZGuTIH61JdBEcasyokrjdLt6PyykRXMJahhTyGv
	 ZZrAWLeILP1xDIzmFGlkMKP/pfSrtTGy0Cx7DZ0LC42IVd6Sa+RZepV6chsxVnky3iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
	b=gtcy1Yih40428v6kR2wax5XU7nMqkBl9DQL6izSEZpiU4buudmP0LcRKf+P8BfblkQOF
	 CwW9KaY7hEtpoGIrwwuuCCb+rGxxxEn/t1yi2Q9WPgnSk67ZLk+I1iDwOFPbHSHrPHgvC
	 Ns5fdfEV4G4SYNXvjKmcSGkFv8y/wpmjEdc8BWhXN20Ft6IhgBeuvCwMoO/ZJ5OmY5VKl
	 WlfLDEOpbqwYAHwKBporOsXBBdWKRKP8qW58yAQTfVtg6UnlWGWc6amVaPUgiicyQNthC
	 dwEXxylInYjPNt3sUUVTu9fwTIDOw5/v3cbBcJi6X2QITNsaRuEJ4W8SVyEGAnrv4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHJ71292872
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=; b=nlYWZGR6bF4T/Kbn
	yyjan0QGcs6p2vpw6wh0H5ajn4DHki0Fg32MYd2pWRuXS72/Cv1qMHz3DZpWxjOC
	leT03jaeUUQFAUL7iYmXUsj8IrhB8O0Q6/ZY+nF9Dueechv/QTHTeIKtNw/fZssD
	gT29WqPWFuDNdW4yyeKOdFU68Mxg+2um8VeYi9mOQGCrhUMenb4uX3He2BXwBPvO
	jczupB0aTzAP45l1LmQkWu+Hyz1rULlk+MfETpRs0m4lulLNj6rn8pVkPJ4/7WeH
	VeYsWJ3x56BgZKZu7QOaXTvGxXKoJgW0cwpxfQNA3wa4yMTETkqg97V4LkimnHP2
	huUeqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:13:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so76776785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498382; x=1793103182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=RLmXifFAg4qnhvK9FAhtheyi8hr+AI4BeWZXF2aaBCq9/71ftjK6+b1JQUK74hhRCt
         DKsZjewjvsKnuZz1v9HeWB5NG5vbAdZkHK5YvAYsU0pI9koijhprjLm1V9WFLmxyugQP
         sgTcf+EJ09SKTJR7LLqBpexE4gjQ5AW4pkwi1HJ13uHXUlI1N9lvtNKD/qZCOafKMqYi
         ouGaWMlQic05Q6YbrwfqrkF5hkT39hRVYmKq+/OTBl0BCGWg3Zon1Up9ON3vYs+n05mW
         VIb3ZQenql4u604EqlErvsbYXzW3emIXQpAT17Ev0dSlisQj+euIh292lpFKWRGkTkzC
         3OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498382; x=1793103182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=wZ22z3kv23qRo+XjaZkyFXZmeWRa70idBp5cTW96ZrmFKI5Ze+03gITnNXp6Mk1ke2
         AyoeBZrPVXIT7QBlJ7ZujvOgkkuB95A/i6SU7J5asXPnkF6Wl0VVTj6IIqcuArHwo3n5
         pXzF2ojoCiHfSSYHDtHh8hXVHBmgVqreNkMC2QHc273bY2+VzQK2ocN6HHJvvG0UYa4u
         8Qn8fFLz42h9PBESy7y/yYecys4tUZ+JF38zl2WOyJoInXKytx/TfTkayefZGuhsvi09
         dKLk7o9Ute/Ng8GH2n7TsKUGvT5ZA3As/mDY6lRZEabZR0zjl4DwlEslk+VB2OoI1eAl
         Xkig==
X-Forwarded-Encrypted: i=1; AKwUvBzGeUeMfzLVp61pmJHSUsoQFVqWyIicrTQe0I+K6mZ8XKk0dRFoltMvtLUcUpZQPGt73VYZxQ5A0K3YalU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv5yIy86VpGU2Ot+hEHfKU1EjkBBsJ39p0Cbd0pLu+cL+uawlI
	4fAE915GVrAMKUclo+7+QWzmcbOAIpeKeJfMfY9RCGFhNiKTwM7BZwZkbYwHM4GUgxo7IqPtf5j
	7E1xqIAHZcGcHbM3kx7e3CQM/mOPfDhy4+J2wjJXFizDGGmI5l+I8yE7OCq6LAdC+apo=
X-Gm-Gg: AYBFou0qCRqLNpSdILH3oFeIgCPREbHQYTdsTMKPUVefePOZTtaFxD1RQ3HofpcXcJX
	dZisawsZEi0nMQsh/+/AMYQs2hhptUUCaxJgL6B/85jWLxMiAOMRMj+0JzmHns4mfcnRdLpxZEk
	LKLY4ZrGx4YnO3dLqe5f1Oqqp++oyIm6l0rYm3cqZ6Kpi+jIejy+HXqVTSz+6SccoQwENC21iKW
	mP0quLAscEY1CkjtSJBk8Ho/PF/lGtPmM1t8gTkIGcfER6s3IDBIpMfZ+K3NpB6Wb9gzdFsrW5Q
	/2UWuMrDpXSik0PRD6QLsHczAOmWjA5vlFWcPbjdE/2gsYtleJMa2J6Emx9lfopYFnV4bz7mKZQ
	OZfcqzCSvTBqKiBkYso119Q==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031674885a.2.1792498382002;
        Tue, 20 Oct 2026 05:13:02 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031668885a.2.1792498381498;
        Tue, 20 Oct 2026 05:13:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:13:00 -0700 (PDT)
Message-ID: <6257f715-265b-4a33-bf44-5f5c5449f046@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:59 +0200
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
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yWzlwGj0H3C6oJZ8Fc1FP6Wh8m-E34gC
X-Proofpoint-ORIG-GUID: yWzlwGj0H3C6oJZ8Fc1FP6Wh8m-E34gC
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75ace cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fHRsoPW1gXWW0LuZJBkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXwBWNWy0dqppY
 Eakd3YZK0MWmHnhqWyNAXgZSmXTFSXYf35UaZQ8scK570GCdW3Vw7tmXekJd/feMTr9wcxo63//
 GWImGqbIrAI+GzVXBQgAQcDHh1LQj5JJRBvBzEfj1DPZWwofa5npXxlpgdeXm87y24BdxLMURUh
 AIjtzYMHaZ8HDzyJwhlVQ76W+0dMh7G0J9yGl7iaJE5bmXw2cV2vnkzE+kbbkTFYXZLgpVIMWhk
 e/+mb71OdTpN9KXbnJFgJ6zxItLnkfbPMPZp8JRh+PtATTSGZdA7J4V0/DeXwkynsIcK4aVI5BT
 FHG39+d4XQ5QgKwpgKPrTCTxBP9lwp1RD/S1prz6TFa06ucEjGeKEqlFbhWGvf8guMp4o+qvQR1
 BF3vTXYVqYMgiox53t5af5M78Es5tWqNW58eIlrrM7AqRY0NBoMk5hLXJxTg8bpwVsSCFL9GXN0
 htmOaVryAHHWfPMVQig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9dokZCUduaeF
 AN9cfM7d/qv/QpHwgykf5EnHEPbK961Pqd2e/5I99vg8sg7SI4MdOIa9CU6uU+MuGdtzmn417TE
 PwxWM4T+z4XURyfAdP2CGI7ex5tWcTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

There's no reason for this commit to be separate but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
