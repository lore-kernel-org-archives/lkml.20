Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA73BA246
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263999; cv=none; b=UAAzcmVSXpb1Wv3SlrRTqDOf1Htoua1GdWFexQQowrsefb0vHntDVEotdq3bWr/XTJwoe9ra0YYT3fGFS5ak8JBFKWsummTYw//LJvZUI00GlahJawZ4JV8VreOE85vnQFxYIxdiyICh0ZgD7LqbsnmSMTstZjNZM5Aj9tPh9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263999; c=relaxed/simple;
	bh=GVX+uKgZiSkY69QpJ9xLXKrIoWR0LE00Wh7L3YdQc04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHqOtEjda/rxw0CT9CTUsfkRh8NsEvgE8Z6+3DfwusGfcOhByaWCYcGbht7lHnt7vm9/MtmFERfYu7X1HapBLHd/tzzwAfe7tYkHXMS2w/ru2xWWFecgIs3cHX/APwG36WBN/V9M7OiQZo20Aw4TSGfQ+jPd6K6et4I/Rrsn5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc+Pt34g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJr0y6Om; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc+Pt34g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJr0y6Om"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcwi2141636
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=; b=Xc+Pt34g5O+e81Xh
	S0sTxm7BS6FM1tqwJ6GpiJPJQKGTq+BVIP5GAAwTqi+a4Q53uXk710WxRbFIWLjU
	oL4X1gXyi4VcPz+wcmiy2Nb/90Qvh8Z66kdNPemU5uM1zOBlKAKJhhrzYbqJjZ3s
	p7dH7lG8yLDlD2VLc0/j2Tol2O/JG8icxfINK9QnglZo2Hymz0wOX1aJx+Vj5vTC
	KDK69v9SROn9HvA0G1jPzXRItmbE1U9gNntoWGQb4/m0D7u4orPTzbK3iksTlp9W
	V1XyyWocLS564kV4mgiJlFoJ1qVKTwes4tFjev/LG/EsNarTbC7/emIff5Tsae7k
	Efvk4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ft48e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:59:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso156407485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788263997; x=1788868797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=;
        b=QJr0y6OmL/qf7KQoQS2VkvbTSu0OP3dmVyKxH/7oKtqq/5YbQVO3Dz2Ht/x0IeSWIW
         lJ9RE1Rs3VmTBlCnv/RkjTSsiQUtQB+OLmzGmy20Z2WHKlAJIPNkMjFh21cTOiTCZhHn
         qv6nKddFRa95vB1haC7CmmtOUkaYF5hE2/UTic2B8dEUhVzwx2E8YUCM7pHB8MmZktgV
         bfWqsgswts/KlpBl37MA52Bfz/7uL76DJ6i6c8k82h5K/Z7jENg4x3jSnd10fNZ00nLJ
         Qq6rvwOVdm9iCSN9EMWdGQ1Bszp3WBstl59YRGlB0ptwmWg4YAJW00VzY5Q0YpBdSVRg
         rQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263997; x=1788868797;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=;
        b=KXGplNdIasgbTnRvhyLH/p4dGau6c1f/4ix0zuwu6OFgeVEEPutJoiV8SGppeBFm7/
         K7vwASLF1cYU6r0e0ce2DqMLEwsx6QM54l2k4t4r40tb/Scqx7hwH1rYAp0sz9aj7GVv
         w6qgwCWcBSOhRe0LAgJcmh+Oln8xjInfX2k++tzblMxlU0PPMqsCkYipiUPNXB2cov3x
         pvFI3PRLKeezYlCdCmOH3R2jDOgVzjPIvUDzOxJO5krNH2afaKaTSbfWG+3lzRh9DfqM
         zb4RrzrdMzORk9R9+r4V++w6fBROHlIwJ7qCkFkpP1ppSTyXrPcWLIQAMtQ7gwLwuIRO
         or1w==
X-Forwarded-Encrypted: i=1; AHgh+RqAhBCcpgoyHjd/C7TaoXasIZPA93+mauBmuBAUrUMX+D+MtK7lkeMclyGTcjhf3yu+X53kR94JNX8GJ6E=@vger.kernel.org
X-Gm-Message-State: AFuF++m4rvAfrt9/9SUOG2gu9QZ24awaVjxl6nby/oFu4aezwV4PAl/e
	UAUlZz8VEr4zFHWa0toLqBS7dZGtmDFskrTh3IzpZUmRodqRe8Z9GNpNsgy4nnQpLkfG9vIJfCK
	pL3WFCKgMAiZxqf+bJAi7WnBK0rDd6B39RM/ev4p76yvUOsDlacLpSmPkAk5fxEYIjvU=
X-Gm-Gg: AR+sD11QOsRLQQfyXh2gEuLU3spUfIflqjvyXE/02pZXG4wI/mxjngVEtewalMGcE2d
	5WLYoD32a/JjhCPD9OrrVvdYVuWawfLZnzMnJFoUfM1+/bh56Mp2/z9EwQ7Rd9KObxRX+3iV240
	K/nXRmKcd3XDcwzxWmNi0s8y6c5LYWPkXd3vIf9ypNOtdjSVlUgB0qPtmWR9+Aqs21EDbocQo4c
	lFmDcWSMJwAH9F7qOAvjYkeSUCI5BPkIPsXU3vSOFwXxXvn889Je8vq6btMEgadP1FLVMxu1CYx
	BZMAvR4vSBgVQ5Hce54emNEdU2NUZs8nt3W8CF0QuALxxFNgyZroMCmK89y2EXT3Q+rN7/QT3sB
	WTi9t+lBH7tYCU1v5hKwr+RFYhMdp
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3574240685a.13.1788263996430;
        Tue, 01 Sep 2026 04:59:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3574234485a.13.1788263995841;
        Tue, 01 Sep 2026 04:59:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b4f1sm4012793f8f.9.2026.09.01.04.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:59:54 -0700 (PDT)
Message-ID: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:59:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
 <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1xgYMyQIGDX_0dhpV3HGNOInscS92JEH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfXwMjCB8sqB0W6
 yA4wlQHx0rLIWtZlc736trSSVK7uEFVAbt6nWucktVFUzuuTHAB0U1F+uQ2jXYSiYOdIZjIf3wD
 RzoinhwqMVsB1e26TRJqfMGHWMTUzsE=
X-Proofpoint-ORIG-GUID: 1xgYMyQIGDX_0dhpV3HGNOInscS92JEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfXz6ZboOWyq+MK
 z1d4lYIaYoM5KYYyKzApPLjrTYRClYxaZ7NBZGkLIEI1QPMpJLMfQlHoySrR9fy2+fWBNzTvezq
 J9OywYwDRROqqFxBn+ESGFtHG4y9t7V0mpaLlqtjX4Db4RxOCWSDOgnAbNkyUHeKLsPfG2STP+r
 IF06DAez7vhJCyzHANyChKQyeQtYhZu8+IZleNs6hSwdUereXvOJW2Py7ti9KyA4BrI0Q+gYQyg
 Pjg2AyotWxNZXCKCK5N8Oopyr33Cb6Ilc8SvjsvLiognpwNriyFsWK/59vGGiqNFfpz65a8G6N6
 hAsZK4r0Ld3NZhkWE8U4solaSIULR6q1tBJta0tZwj22vHAOdx6qIi2fTObVtdmEdYogM1/4Xem
 rwyXHAKchhaKRb5XYz/MwuOiGBnfvMOO7Wif2tIQb68xybQWC23mWjDxJB+vJr0lrSymKxf/euq
 ureoTbdyUs4UssO6XRw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96be3d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xeiSTxUpNJUa7veRBZ4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010106

On 01/09/2026 10:06, Harendra Gautam wrote:
>>> +        qaif_cpu: audio-controller@a000000 {
>>> +            compatible = "qcom,shikra-qaif-cpu";
>>
>> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
>> Usually DT binding filenames are aligned with the compatible string for clarity.
>> Is there a reason for the naming mismatch?
> The filename reflects the controller; the compatible is
> variant-specific. This follows the same convention as
> qcom,lpass-cpu.yaml.
>>

There is no compatible for controller and the only top-level compatible
listed there is "qcom,shikra-qaif-cpu", so that is your filename.

And I already asked about this in v1. Why does this have to be repeated
at v3?

What about other comments from v1? Where they implemented?

Best regards,
Krzysztof
