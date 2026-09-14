Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FFB3D3314
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376426; cv=none; b=NE5vH7pRVnXcX+MXNiyPek0t6G6IpzipqTv2f1CdJZW7EhJgI99EdbGpxjP7wpyrPICVwd31FH5ui09Sdl/SDbEwO0tAyLfnKEvWi7O3UsOJasUkSFmUdTBuPXtNd6OJRcIhUCu0QH65Azpr3MCCR8bJH5bB9IwGKb1NFxm+gp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376426; c=relaxed/simple;
	bh=HfYWMsh73JSum1E9ZEMttJhbkhJMHsC4TIgPRRw0ArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUYL9fKJDI/ejNOFFfXlxhcFln3NPE/PFmQUZSoGXnRb5lYrFYobXruT7uKFn9YGezW2k5Bpd8lRRcAteITLcCoCVi2lCcL55BPyblWafBhZa1Dgpf3RTtz5QZvQ0RKWVClwLp3vcA9oJyozFs0SYItyb4wl1V5JV8tfieiIzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYsjriPY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j869+nt+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYsjriPY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j869+nt+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jETb543589
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=; b=kYsjriPYaxGJCaH5
	FL9ldMSdA0OecdkhiEF1wlTQWGZAr1ocSCDec0qLn2++lW5cFZwSc+Pw4CUXkITk
	IY7+xH4+ivz/rmB6XUMgAzNDZvMFNxhqqO4P1NVXJ+2ot2azOXME7yw2GDR491e4
	ly6YLMuS2YEj/EvoHPDEGaS7nGkGjflCEJ0dUmazOhnBQ4I47FbrXELySnuT9ltz
	wkm1pGLo4X+7nk7z8mzwe/QD14rGBJbhLohlQHCV2/xIzh/ljj4LbEk0Fq4CUKzV
	kDLFhp+R4NWjFSUwtpXqMV5P3SsAAJR7Mp1PQ39Nm6z+rsNasLo/AUWL8PFyGcRp
	ckxA6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09p9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso52426285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376415; x=1789981215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=j869+nt+itXomH+E3WT3NCG2rvjy5WkhRFvL9fBTA94CYEXfzQ7SMl4GKDqTVQpiha
         hMw7bmrQpOMoWlqo9fM3YhmiqahUcB/JdkOH/fW8DvjZOy4E48tZiL48i05tE0YC1PmB
         Rz9NXLhVumzbAFf+sJFEph+2OnomSXkfVs4bg+e4ks/POIN6/NLfn+mjxyxZ1nplEQba
         Y6QSvb+esZtKZ7sshR2dn0M7ui94eG1SoTEP5j8jc1/K4Ak4KTDafnnD9zTF4KxB3SP0
         ecKwNT7ersv4wdVwwKqj/NzpH1Vk+hJyT2sg1ZK2NPuW11G0C6RRtgBN2aW5g0o69yi+
         he0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376415; x=1789981215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=Nr6gSnEYW5KGj87IQCcYVkTiPJJaN7hRc4jBuFm1vLbEhMeaLJJ5/sRvGrhq41yLMw
         AH8UOwyI/BluHUSuRWTXXuYPUDj3Xsm0gnpaTccKEqyDZjR+nEDpOnzkvtPrpspevEOf
         Ng/xq1qAiSA7+b1emEET4+j6Gm1d/S5xWWFH4enz3YIKAEVgpDCh+q31qJOlsnyHH+4U
         bnFe07CSJuYTMzDdHQv1KW9jlyfRuX9nk8K0MADkiDw1yZt3di8GS+Y/nWJsLB53hoMI
         W+5Z5G+g8hvfmvqUzmQWi2NCquu76KHz2zFBKI1SyCtOlhiEwcs7b7DwT4TZ4vh5wsz4
         VYOQ==
X-Forwarded-Encrypted: i=1; AKwUvByHYwk1c7jftGKxvziS1ROY8nJrbSm0cEwKPg8IEu0MRDeo1Ppht0ATpmDp4SwOsnAJZq5j5kDBOta9SYE=@vger.kernel.org
X-Gm-Message-State: AFuF++muHRqlPegqgwiSDaWipngD0iqB6+112JOxWKhBQMyGWkukYMU4
	o5s2pvO6mqIC8oDAGOAR7gRirrJtLq3l/LYvDY0l/1701hyJ+IVb8dnyt9zZ3/VSkrtfkjo1LJS
	k///L3bo53/iJqUsggasKUXXvvw5QF+ba4BCyFAvDWllamuBrELk3b7o0qQLgw0+ruTE=
X-Gm-Gg: AYBFou0A2XMO39tRVzFv3OCL3CXJCsqIe0h8kGPPASH1MkdDUvNp83LyymsMmbKD7qN
	0E0NoypnPDPSyYc/03c1NzVtw+47/QAjC+HUn//cflD+0iQ/4Qovhw2nAYGXZ4e5zy1GXTarAE3
	Di9G8CTRuy09nLwEe2MGmYQYbMxRNHmA0Npl9MZ8wAARjrznUxyh0uDQj0S/SYJ1m1Qv4OLprUS
	S4WII8Z3VZrl/qov6ZM+SxbtbuI0kGDnRNEOSFBsjWy2IHxOYaWriJfPopbANP6k6yNjxrIl4a9
	Z9eEIUp4kjcEOaJOs0+PgheWrkTVqOvNPGaoOB7OAFmB3dEnd+cQ2KaEWSy1iifCOPXB5XE3/UG
	WCsBSrISOLarqeqJKRe3hFw==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179415785a.5.1789376415153;
        Mon, 14 Sep 2026 02:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179409185a.5.1789376414497;
        Mon, 14 Sep 2026 02:00:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm397728866b.29.2026.09.14.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:00:13 -0700 (PDT)
Message-ID: <376996a2-358e-439f-8461-1981c43df671@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:00:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfXzj1dNpwpMndP
 mMGXYfblo3/m3Qxxj4oR6QpkfTOTwsOZVaPrkpeZ30CSbYv4frOCv91QknKhRwibTiNkR1Rqr0W
 ukv90kUokxnSWGlEgBleTXZyHLNTdy8=
X-Proofpoint-GUID: _fmdFnkQ9a5Mq62y1z4rBIAhpsgJdRrh
X-Proofpoint-ORIG-GUID: _fmdFnkQ9a5Mq62y1z4rBIAhpsgJdRrh
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7b7a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CE-yOWVe1Lv3fcLDAawA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX4Ib4DQ9Yw2qI
 rAJNkMOfg/DfOdbZ7LdC2+Or7pLUEvIxSv/ZEzj1i/Jybbme0VUK0CjlxT/+MU7ISqHRom79by3
 11lZ9foDvB+aNCvL9I46ZHk6oR2Gmdna9e1aCutTV0aFW2YRTV02H8uZ+ZvY0mcDkes7KmhQ3nK
 i28rjncxOKJgEIQZjyGM5QBJ40pfjDzLywVS8jGHakdqh5aKr8KINAmA+H5KGbRUOEZVZseqtpi
 IemSJ0TMyqoZsrd4Q6p1LRSyM9lEi2EjZNAa48jP/M3FrSwmDQA9Y/gtnyKT/lAC02dlNpVX6bT
 +Om8Cg/wPdGQ2Jd6yuHUiUDQBolsS3j79Y3gtnw42vmrjscsvaGjspA3D0GN4uqOPdLiInV07W4
 0JOOdnzNo96EsMQz7huGIhs4kq6k5mBUn76eBQ5Q51+/t3hqdIGEJStvWop+ff4JHCkqEXfDdp2
 jn5gOyz0ATXBiM1GIDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.

[...]

> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu_0 0x09E1 0x0400>;

Please consistently use lowercase hex

Konrad
