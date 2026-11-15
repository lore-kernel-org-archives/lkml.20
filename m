Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737190;
	b=UgmwXQx3uB4TBJiyiF5nWg+BJIivGWLsvK/fusJzgHTL92OuHaEFpNF68B+xd+wpPO+L
	 UDBR6UbHlX0+8hqOd10vwxPvJepcKViyLD69ZP4Jwpl2k3qkOZYYtfcdDgW/yUzjeAWG5
	 176E7/3vJZ6tZuHBhYGvLRqgaK8Apk1s+YsEi3o7M8Ee+aGDHvhE04oyG1tIp/6QdwRFi
	 vx85FCV2si5COKWits4vRmaBDr2O5tc7FQs6Usgla+9c41WtiUbSpSipl3CRgcyYNvDsR
	 bqxxBLM72UJmjzZrItas+Qit3DKc0qzSw1wEIKIR8gXRp3FEpDX9tKevcJCqTk4f/nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
	b=IFgDqQwKe203kNyCJoDzUuPH95l6sdnObXB/FwjHvnelno2AfWsd9VxaAARgFEMWt6Ht
	 9tMa39QpjTYX3GY5I/ygZKF7CC7uXxiqXjAnSrTPDw6a46cc9gfWEsmIEDkUW9OcCgFaj
	 kVayBWX6T18Dpi//hiK/eMM+VvgZqBQ2QeDr5zvM3cJlkHbgouzt1T+lSdD+jZjBCIf7u
	 czJflcZz+VZWdctdRSdSoykKlnJAhqlWR6aYi7TUKyW0sDFthymP71cpFn4sFsCbxD3wZ
	 a76sdTknoDKbgt+T7vPT3wrT0ZnvQAjroDNG7kdhyO6pKnEJ4wHMx8BA2zLcwDzaDCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE666606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE666606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w61q1763368
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=; b=mJhS6VOqqT5s6RYS
	IZ/goJ+6AJo7F40qNhP0aVD4hO1jV7egquRQwB9YB4R3hpWFseybL4ohva+84uxu
	FsiUro2LAwyyHlsHQNBgcnTes0VeHiBvXQhqVj7urF0vNJx0KXJdHmmUbKOD+0VB
	8+beuCnZaxY+X0OA+rwqLCZQTQfrBjtOGTnlTUxVIao4a+nBM8y4K0Wfd0BmmfWz
	gte5MJZ8vhCO9J+4PrKtIzwiP6sjh8q6Rgr4LfBkwTV6ZYnu/9twHCMUgdhNTreK
	89zGyGLBgv3n99oc6XS3TToNTC/36RsJnwDzwZkcerHTuxiquDfB+9KujyhE8PEt
	51C6qQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqju78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:06:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso523234385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794737188; x=1795341988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=H854WM9mSmc8X/BzAxncKlKYhigjoXrQ+t+VZGBH+hPXmkWgF2rAjCVcJfaauvl568
         9ep62vCYUZ296SVXRW734CnF+R17M4zjt7dnaFY07eh2n0TTTn/eFq1Aqs+NLCj9dxdu
         5kQ7rp2T+3wvP/gP142sSbcBddPW5A1QUHP6czFTcG+5MNIjgEL2ufovvkuE+umYnx1p
         tvTrMNLA3QvDUXrpZM5b85iDvZ5FUNJqJwB43aYuQsF6bmg8H7Rv4/n2YuOMBbheBxvr
         aAV7Q/df7GzdGrpgl8ceuBaLpKSW8jBMFB3P3XSmI36YZnpgz02B0XqiVPqGg+MkFwxc
         nP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737188; x=1795341988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=hNnzlIhknAY+pBGqqpnOUYnh2og/klXmFJlo9IvOXfg4+Lar/W5LJ/nTLjxxk9025E
         5lONGSgNpSSApQ2pxk2WbEottV/b4RFfKttQnkVS4E9Ju0m1y/0HoTl/JO14nfkln2E+
         TdhfdVSy/BytHtryWIoscvVu6pbtC8geEQCQcPrMzVpdJid3YFLLORPc/UOk1dtErHXa
         Z5ur94O90e/1rYCzRDwmA53jyzyvbU2xPTvfwABbx9a4Y7e+BtuRGoTWQbxkJ1t7E4bP
         KhumUCqhU9PVf4XURDy+n0ESxmlvvyJup4to7ri2wiC0n1NKzvHM93RpBDGv4dl7Gvir
         yjWQ==
X-Forwarded-Encrypted: i=1; AL+hErFqleGTqBrqAc8l1xtx2qsMg4+MFPaLMajK+v1YIN1G66cqDGExajF7hy3g16hGgB07i0YzVKFzsWdYi8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V2+HTS+7mgJ/JdY3wsBPWFTM6gk/ZuQ+AUwedRZzmkS3QO+hY
	pFfHQ2/lkpDAJFDe1MoUkKjfompiRTQIxQVwl5y6kI3Lyuu/N5xia2lEd20Q+nvuIN5eltH5XrY
	COf6C7mwdGX1oV97aVPvrezEMlCG41SG4HzGm2UvWS9EYpuCG2oZ3jVeZGEwYg4fmlXg=
X-Gm-Gg: AYBFou3gJKVSAzmVdOrBNnITtdeT2IMwNL2TKtOq8aC/JGd4rXJJ8itsDWMG08E07hz
	qON2ZQWWpFpvCVtOYpIwZSGATVEsR9xatPW2mzBUZG1dxTs0jr/ZoEiX5UdMGmkJjihmkwwLD3W
	J2/iaaBpQs+7nrppfXmg/gioLdLcEn1j7sqq5/VSC/1GCNAVc46s6QhB+9LeTjgauI10sFSTcEu
	5nuJscWSMTXUv2vrkU/s/8MHFiHC89CiytDgisHtpfKbCAxjNWSUxKw6pyB/BE+9NqU51HdAzyg
	Z9RwXnaYbwqFtE9RuHfETEVjSPoLhl6raDzoQddAqaJRy0/MLwcYeLDRAq9mj0Yh5hZeSKmiiQW
	PkfxBdn0ZwToZ+vC6hvZK9jtvor1RSfs7I7KX3KQSba86dUIdwFoWlpPNA8XS9uvHo8gmbuaFC/
	54TqD7a5JtScr+OOmjhQ==
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184792285a.6.1794737187968;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184788685a.6.1794737187463;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm3177401a12.6.2026.11.15.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:06:26 -0800 (PST)
Message-ID: <9cde423b-e71a-4038-9e89-d6ecd7da5399@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:06:24 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: q6apm: Guard callbacks until probe data
 is ready
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af98424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoK0sgpsY2lmbaFclJUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfXx1aQu1nlVExJ
 h33SWLOiR3lb6PrWqx3TbXJCDaLdzbdrnKKdS9VxKJSGbj+KB5gfd5c1dqvu7BS+5svfIJYz8Ov
 U+V2957H4uNiol/FieC3TKldSZJ5Hkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX/mrUGxVHCiuT
 cO28Y3NjLeq1+9OGtfIgVl6PCQWni1ZUkybr7F0q+gXN4vB87ab7UAMv9bOsHZcDkPfRrBTnuxC
 xrWNAm1e0Jbqlh/m5K9H3VvjEKBCBC2yaD2es2C6EDVFU0ilC+Ph8ALisu8qQKhCLPBUjZDMTc1
 x5JtKOQYcOSBekuhBDnNTkSe6Et4JBZVDxbvvXPC7Z6pB+0fOu5MI7hjJm2vQgAaNrSowJOzGBy
 5YeD6+j75BRzGhmT2Mox6ijtVSZgVuqi2Be9z2iNXsg+uHGG26RkkY/AzTAqc5LW+swo+nu246B
 IgA8SUK9B9uBkY4d0pTtWPQSABE/o/geY9C/Qb0AtCyc4Klq4srlH24ca3j6W0XJYMFs3oyPbnV
 25yH2j6f41CdsW43tOO54KFXNm2xTB/b+KWWIGUaU1xRVqs8I3SRVjkMIO9ffg9l9M35yvvUFuE
 c8fOPUKMJf0XB1zpPvQ==
X-Proofpoint-GUID: 6SfO7ewac8-pPfOTOHBQ1t6Y5vc8ru7c
X-Proofpoint-ORIG-GUID: 6SfO7ewac8-pPfOTOHBQ1t6Y5vc8ru7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150040

On 10/22/26 3:41 PM, Mohit Sharma wrote:
> The GPR bus needs to make response callbacks available before invoking a
> client probe because clients can issue synchronous commands from probe.
> This creates a short interval where a callback can run before the client
> has published its private data.
> 
> Make q6apm publish its driver data only after all callback-visible state
> has been initialized. Have the q6apm and q6prm callbacks ignore packets
> received before driver data is available.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6prm.c | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 3ec3c5a18c7a..dbebb643cd5e 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -872,8 +872,6 @@ static int apm_probe(gpr_device_t *gdev)
>  	if (!apm)
>  		return -ENOMEM;
>  
> -	dev_set_drvdata(dev, apm);
> -
>  	mutex_init(&apm->lock);
>  	apm->dev = dev;
>  	apm->gdev = gdev;
> @@ -887,6 +885,7 @@ static int apm_probe(gpr_device_t *gdev)
>  
>  	idr_init(&apm->modules_idr);
>  
> +	dev_set_drvdata(dev, apm);
>  	g_apm = apm;
>  
>  	q6apm_get_apm_state(apm);
> @@ -930,6 +929,9 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_hdr *hdr = &data->hdr;
>  	int graph_id, is_pos_buf;
>  
> +	if (!apm)
> +		return 0;
This is going to silently drop the responses. What are these packets?

> +
>  	result = data->payload;
>  
>  	switch (hdr->opcode) {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 2042ff1e8ff1..5c927ebd81f4 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -194,6 +194,9 @@ static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_ibasic_rsp_result_t *result;
>  	const struct gpr_hdr *hdr = &data->hdr;
>  
> +	if (!prm)
> +		return 0;

This is going to silently drop the responses.
> +
>  	switch (hdr->opcode) {
>  	case PRM_CMD_RSP_REQUEST_HW_RSC:
>  	case PRM_CMD_RSP_RELEASE_HW_RSC:

