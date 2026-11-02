Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609354;
	b=FJ/IKyIJR5g84/QEWw4rcysmyNb8wjZ0ozJ0tmMiGs0Wjk3QYOmAkpvXKWLmgO++dEEM
	 6D6Tgva2YCBrMmYGTl3UPhh9281Orl6naU9DHuKr5CSKvnbt6T33/M1xA5w5FXRrpV9Sw
	 MUK5Ck2VRllDeicpExUxpVue0nfT7e8q6hipkRMf+34Ehg125RQtFfIdNAjKNY3TcVolO
	 Md5GNFVvT0LEt4BKUJfa+TNM1Qn90+3HpZZCbGcFHm0y6WRGstpMpFpinyhBL4Tn9x2ZF
	 KQ1RrdST+R/dtSlS5ILVgasLXW/2XaKiWvy7fy/sDMFlS3HbjoK4zweoK0lL6DjCMPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
	b=o/Hm3yXzd3wT1bgTaz3l0bucr2Mv1vN1IgIFbe1SnxhifrUqDYBEuV6eow93XzUBreNE
	 yNgxE0Ol3H9DD7okrN0u3HDA+WwNa24CEsxwEgfV0xS+lNqdz4lTSSPYxLk7RALZPCde8
	 1iK7IxjVGnBFLx9BXP7FIPAAkY26iEzxdgqiHMpVJ4RvvKEXbeJ/KsJFn16AWqVsYbDZA
	 j/eH7/NXUqAH5qrrFJbFWmwdNlnd+7ngnvMn8cAKPyZ1KzWsy0BRUeBMV5NvZ8kIBbzuj
	 /nYhIm4KhZRuxr9xeyxUFt8RO3V+rxuLTOyWtkC/+Gog0cJ5LeMPpgEQTnWUV5CFyQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eceodDuN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrInQpf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23300606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23300606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eceodDuN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrInQpf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pggB3121054
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=; b=eceodDuNGLr36J4s
	yVBg1xIwCKo/8dffM9gwcsEF2vsE2IlT8xRbXUROVk/UR+kxnIcf6i1yzezTweKZ
	xb7w8SiyG23ZGfCcfPb3oxB4bxi6b0Wf31OTuSwRG5Oo8q8KwcU57iFrHgFcbint
	1fCvJHvcFWDQgrE4vh7b3AuA2gZWfEJu7uGPu0wSns9UZLziEzwCykMwZEFS28Wu
	/rTquj/85epa6Ug7Ab3HlFdUVfYVA1SfQzErZ0AnLT1fg+J7wtAZos+bRLb38IEe
	SjT1+2iyO+Vk39/xHGIgntn1TLZ/GjpWl2YVR4trnPSFML3dktjGtkUIEvj+kkei
	K7YJ9w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmere8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:49:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9178ba8eb30so6909076d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609351; x=1794214151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
        b=dOrInQpfmmvTaZqnHCNY05RpLv8FCQxHP5mYecUjrtIxbVYSgQVOAc5LUJsA5okJrX
         Dk3JmTGkZVkYzozXUndSI4A0ufhBMiW/HEm1Hxy+BQSTBm7/xHy6oJFOEXJ0gpIpcA6L
         ROxo/wgRMDSsOgCQ/GzG/ABL4YY1pc8CwzKTPVrcPayMABjwERKbulUK6a2i+osjCN6Z
         CUQtHbxKWt+4RBvuMCkKklJCpErG29X/0sd2nYK9u3KhB8yvzSfOZn56K5dHulvqb6sY
         T0SBfKuzhqFkWdHxIB+UBFpWMI4iTbginlCADqn4SJDp5agiiw56Mb5Pk3BA6Vhe1lrQ
         Jm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609351; x=1794214151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
        b=O5wGJr4Ymc1Unkld702JXUDs665btFD105WMnoiviWUAhJdwmYTpQfYNtVggDYKaVj
         3icWk1p/E9mtUa7lS3SudfxfF6VBFQptKAyBwHaZDAD536XD0dQLhMWX9VMjYpANsgDb
         RHj+RVkCXQ4aKIza3qXS1S41CaipXbtOR6Mn7Z60LiaoieHs4rqGXRJzJF5A8a0je5S8
         CwEYQxXYmgHMR47f2WRuM83UERT8i0Ie+UV/L/qH95RaZZY3h7UiWPBBv7RPRWALDfBL
         MClkOJcT/lriWlge7ze+FfMKVNGr1ikcDDOR00O+pPn6l2Zi0wA+n+rDbHAHBrbXaemS
         BeBw==
X-Forwarded-Encrypted: i=1; AKwUvBwvrwxH50gNCTJL1tKKe4dHGzhAg4Zh/MPJJxUH23xrpem90MwXV8D7CM6czsvufB5S90Ished5PBuoNxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKTJ0SPMhcBccqtriy7jVUsy4tWg3HiKPIWnaSs31Lt7GyHs1w
	fW/kvPhesoLRCZ49kCKbpU0IjRY9CdcA7sRH1ehP7RflhgZCIYQoQMrVHXkD+jImziR1bIRtwf4
	XUsOnWUJ2qvOEaxjicfAlyWfcjKtbT4jbQtMqT+gv+Y/rwvlxOI9wiuDiEsch5qn9gR9ZCAni23
	U=
X-Gm-Gg: AYBFou1XL6BXMBnP0orYIYrLKbL5ZAGvRltWJW+oOyoza1hJfBUUl4NNLPKV6B0kB6A
	BLmeu/E1bxvIRnnMUg0Ute1oJvk6UvRvyxZyG/jLKE/xriSywti7u7qO7eDSpv4dpZ5EDBFdO6z
	bMcyPPoeRCKiQmI+bI9OabsZLAMvFF/j0VxYZKk9QwovDVMnvBfr9fj8uzmx1bRImY0sHPtfO7z
	ih0NW0b8ATk/P8EANwpUd7n3lpAqgwRSWRUtXkhzU5ITtbtkyGBOawAFiW5MtINN4D8IE8rlnbB
	5Tv/OAjw9GyPWMVi1lefAfj5Az+Okzz7Xx/L1AwXEMuyohtfL9VnAbJ95L4wqCR9JQn7bLtL9k7
	woSlc1na+Yqxw/YndnTPYllO0cuj+VA3Ykfp2RnKKFlun5hqoxNqpLyzSGSTeycOomfWAxsc=
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1460716485a.5.1793609351137;
        Mon, 02 Nov 2026 00:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1460714385a.5.1793609350605;
        Mon, 02 Nov 2026 00:49:10 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm369278566b.9.2026.11.02.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:09 -0800 (PST)
Message-ID: <9d35eabc-c6e9-4d5e-a2fb-b11b40083bb7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:49:07 +0100
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
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix printing of a fwnode
 with %pOFn
To: Asdlerto Korry <korryasdlerto@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102003324.340577-1-korryasdlerto@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102003324.340577-1-korryasdlerto@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae84e87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9UWtz5tzZ0TQeNEpZG4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfXz6edhjxJz7av
 /qEWMBzodtZnA7jfI34zCGldQxv0LdJAmOYMfREcaUTZrjoRncarOdlP0/xz2+FldjSNlKpz0vb
 7sXRzNj0Im8vRYe7UriuXBnppcWph+4fJbvmI0CS1PUiHa91Fd0yolppHnWF0SH+C84zWMKJ3UV
 Dfmsm/UwuPtJjAyzoKBKNKAEfsDDdG59DB6W/w+I+SnAYEbbU0pPLrIaYtNamIDmzLMjPMiADGv
 iJnsU8auRmNbWNaE4Thlw+pUor3KRZVO5cr+eqysW63+QkFzT7a7kfL20Ug1fhkiVKfhKlLqz2f
 fPke9pqn0sL0pIHdNmRk6iT9YM8m8L9004qEpXl+L7WeOXdOcywysLDpoDIg4GAnV7u2Oenvhlx
 Y4vlt4JE906B84L/hqZFEGbanJKG16/jB6MqFmzzjWaj3xW1IEMXo/5oyk807eR6or42m5AB2g6
 mrfNUrgRCTmO+tFRTiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX6OOJqM4/vJ8z
 zAp/sLMOa3nltlUco1+ejSGIJ1Bycvz9uHVQRlhNrtp2dPF57qj9Aw/1Wbmnnp3XBt2mkNM4FbP
 PVi5O+T4hMH+2c5E85waJp2sFcJdhxg=
X-Proofpoint-ORIG-GUID: Nh9nGdTI3rEri-4p3cnXBa7nSwp2QiJU
X-Proofpoint-GUID: Nh9nGdTI3rEri-4p3cnXBa7nSwp2QiJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020034

On 11/2/26 1:33 AM, Asdlerto Korry wrote:
> pmic_glink_altmode_probe() walks the child nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> prints it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and passes &dn->fwnode to
> fwnode_get_name(), i.e. a pointer into the middle of the handle, and
> calls through a garbage fwnode->ops. The error path ("missing reg
> property") therefore oopses instead of printing the message:
> 
>   lr : fwnode_get_name+0x34/0x50
>   ...
>   device_node_string
>   pointer
>   vsnprintf
>   ...
>   pmic_glink_altmode_probe
> 
> It was hit on a Samsung Galaxy M52 5G (SM7325) whose vendor device tree
> has an extra "qcom,pmic-glink" compatible node without a reg property.

FWIW Vendor DTs are not supposed to work with the upstream kernel
(because they diverge so much from the upstream dt-bindings)> 
> Use %pfwP, the specifier for the name of a fwnode.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
> ---

But the issue and fix are of course real and valid

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 465e5d2316a0..6f3737b096cf 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -596,7 +596,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  	device_for_each_child_node(dev, fwnode) {
>  		ret = fwnode_property_read_u32(fwnode, "reg", &port);
>  		if (ret < 0) {
> -			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
>  			fwnode_handle_put(fwnode);
>  			return ret;
>  		}
