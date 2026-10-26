Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997098;
	b=UKXC00otmoKBkumeO+SFIAuin052kWhlLeFMStbFf4Zz2raSKIJCl3N3zYdS/nmP4P6c
	 NWxqBSG6S9xcMQ/FaqyDGCFh0nq1gqa0jcTSwi35XlibAsYpCDji5TjZ5ZgFO3bNMGpOK
	 vKuD/xrgh7PolvKxG+RKZF5jUTzs51bV2tvhJCrmrY6kJTKIRZfqFnNQe0/piFgC0/PwY
	 wtdPFTBRXXmj/ABXCkmYEIxLPxD7migFc9xN4h6FWFXRDQr/KLzZcsA6BEfdyJU2Kkcm3
	 IFdcy6+c2OpNBxBMqoxOvnqwKm4JJ9z7NcngBvOeDbAI9C6lDLP7ASqKQ1dpinBQ/bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
	b=5MJ2BanV67QLbe+abKOJsip1AM5lzPJpWN4PgRarFIubIEXnVkz1gLGhHVsTrOpyPKMK
	 X3CkHqdp/4rZ7G+6axbrHuuxjgHLWqG+AtaRCnJegU1EQWN2SFbskOc0RE01N8+JoarOv
	 Umuy2Zq2vJIGkTVU8sHb7yRd+/CyCYvx3U6jlwqFGKfDySZw1+Pfwxj8fkFm+97P0mwCj
	 cprpHCfvrzk16SqHwePdWcKjEaiQBA1PA12/sZwG27p55c2o6rBLvvjdgbHNH9lMi8XZN
	 9+J6wtLGQcXr+XesW39hbRcT4XYx8kR7pDvCMHEwFOiKwINPskwNhdRIpMcD+mPdujw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxehkxN5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF9606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxehkxN5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b8d61908167
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=; b=Ond4bT7d/9XO2XYd
	D6gexI/f1UnM23NhYQSn0iWE+hyBq1P4Ry9So30XS4D5Xe5Wk/qPglXGJKSMU/Qw
	2tOIKy542Ziy07Q5Gr/LEOblvKVXX1RU+xmD15kwe7ojv9GRGtJCF3WcdBYwZcQr
	zsYekdvvpKfeunB8rDmPPoc5i678Hlr1ffDApQJ18jZkEO5x2D6RqcQ6R+4dqovS
	9fBW+zpweKp8zWTgropoGb2TGd+a+Zxa1gWnYgPj9F/9va42YQn8953BSR1iPXzW
	IGAEiiIkWvzOIEJoa5/4pisnWma7oo/XdpJLPL28/ZuY63yUJ0JepNq0KL30yBa/
	ORDfWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn6sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so13998209eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997095; x=1793601895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=CxehkxN5oOwteqU5ZJ6MiOTVizBDxj4/oO9pBr+Burv0aaQPQpnhT79FQ7bdvCaCNN
         6uEK8l1hLepK3z/vCnFsJVAQwoGmT0uplPw4C0MX7ZoXjfTy1xAg+nPL97YtAz0QNOgb
         Yks7Zg/MUd4GuVTkRRwVUc5XnFwx3btTPgKTa3pO34gDNPkB05kqtgSQGqyaeYcKYwHh
         ccR5paxu0fSjun3OPzNC6zE9FUgJnJ6paeYfPouS3VjlmuPtQTgHHskwJ0vgldyorjQn
         Ht+YVI3WvVaSGi3DeKKGIvZ5kTF4a04ZHkND5sD5BuivZ4AebjCmIuq0bRu/HXG2G8BX
         8fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997095; x=1793601895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=vZS2MKwaRK9ULyeNck7zPOOmo7U5j5HUvTBzXU/xQxahNQSKFeCcVXUoYUgL4COnH3
         dZ+jBMLz3chvX62tOlcPYyT8dx3ywWtXaZsr1v8zc9MYPiM4IaE5PpAxIm673oFcMpRD
         +/FTiUT2mk2iyl8LTanbwwr0gn/3huXN7sStlp0ReeiHJFUlUdVP8Bx2WwH97qAaOrtf
         QqWw1ACVXSoWSlRqUVA2X2nPSMF/xNW5fwUvDERHzcgjfN7RYYsoyXdbH6XrOZHNeasZ
         3tFPUJrxsTjWlvzaB0ppde23TfTlB2kbAi/W09hqSDbX2WkpSqdplzFwCxRab/HnNRP0
         STIA==
X-Forwarded-Encrypted: i=1; AKwUvBwRnhTUmYLOO0gtdbZhaC8VBcAB3Ln8HJGNnzCqzFCrXZ/msTdbgQn0N9ZApilUzusYFmMc6zGidZpPBjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI74PUHPtx76UFXMxe5bJyPJM/i5RbW0gYXLnLNKfXxX7Z93NYK
	GMig8czjGvpS2L5EmtWpvQxGWUD5KNC5/QTrXWV/Rsp8Dq7pH+B+KwMQeanUweOeFq7fNjEBnGt
	xRc/WVyGJYUQyXdPPo2fpuRZJ+CpZiouRpsZcbF4oF3yh3TIjwQ05SAj9tek17b/8JnE=
X-Gm-Gg: AYBFou1nMMF4xTfIMCu788ce2F7teiBc6tXReh3IuiNSrok4OGHcuYC4T3kV7QX0cvf
	VkICFrQnTqTVNLl+d1HJK3X9QbW4b/YPQSdSg1u+3XNWNVTjGc1uH3SOhXm/ZM0GPpUfTAGnHu7
	hqqg2wmHaTplqQvVEpzZZSyDCh2tVCOvPpAWzh3xB2bSNdina2GFJ0q7fkQjInC+2XOy/rL4dRN
	9HXFdFGyZJXzWRyhm466Tq76jZGSrJ2uj0s4JdKs63Kp3v5s26QovXXxwfukGPv8F1S7gzNAz30
	mzzq/uOQCbz0skGLx4D0QOAqpVrBJ/T/8Z9HZjeXZBu9gF+9moxuP9r7c4H+9DeDLW2brPfbEz3
	WcZpnL/9T2OJzs9cW87bx
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097257eec.31.1792997095491;
        Sun, 25 Oct 2026 23:44:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097225eec.31.1792997094810;
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm14677674eec.15.2026.10.25.23.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Message-ID: <4a520c07-faa5-421a-913c-f75227491f08@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:14:48 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
 <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LoKG0prxmB4lISqcE68tayOELDK_8WPZ
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adef6e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=orbn77WvMtTVaJTH4VcA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: LoKG0prxmB4lISqcE68tayOELDK_8WPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX3ZUWyDzV+HqB
 t2AXO7Nte3Q87W7dORaLCZ8o6xc5zi1lYVi9fOW56oHURcWjIskd4jfJ4+qye/BGBdhtzX++ABG
 qYaJ4Fl7yUH0u8Ak13AFYvAaFjwdW/CnG5c0PTd7gIlE9vnzMfP4rUK6pukBtRAP7/4wBSaPcrV
 WlmuftkL0hEHLuy5tEI4H2hpK1TGUy6ULhPysj5tiJJsitypFdgtjia8SY1/HiXPBgOBZQCtZMb
 1YW3CGsmo4lQKvfTZRuNqj7KGcVXWtVQTULXF6GomQsLtYm/F5tEO9QIk8lt+1/PEFVJjivcKF2
 VeKFw2WhdSMGmgz0IwRBzIpoquS7LrKLvLe25NIjcEQjk/GXuwN6SKxZR9NUmPzLwSlK0FysrgT
 4VKRDuaBsQ+UESAWnL/sK4/se+Dx4z3HFAeY4UcJb21tTwAAs6yTmWxhpx+dw0mba9taqpXmpWo
 U1Gqlq87jK+4LiDmwJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfXyDe38+QN6pyb
 PUr7kUmijreEpGi5UzsXc27KaIDnNNhxXhSxX1lDLp/7IOC7MoNnF4uyzmQywABLLAuldf7kXqG
 FAu8r4UeAKqCBYsKUHfX0z70g0W5Blo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026


On 10/22/2026 9:47 PM, Ajay Kumar Nandam wrote:
> 
> Nit: please keep the compatible list sorted alphabetically
sure thanks will update in V2.

Thanks and regards,
Karthik S
