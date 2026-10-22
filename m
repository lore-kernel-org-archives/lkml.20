Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655946;
	b=BJ5S7xUI3mHWoAhUAQvWVEND/odVKQX2wF9JcUwbvZNocja6HbtD72wNuPCKbc+65X+q
	 kPJbt81Hw2suL+x4lxuX3EEiDDMQd5VYQTrn4OFWeIed9vjNpWJ1jlqhFFOSw6iOEpqFg
	 yn3uN9PCtQrC6IsNzxm8E0vYxCLwPJkvYTabYWeQghMCJIMiaMMQ6DYuQQBNnEzqvFxuY
	 sbUs1/MSJPCj4MoZe9L//keL09ZsRz7qzqTPp8lwlX10TG+2zw/9MFLoQIG+HyzP2pCuo
	 7VqJzUcVF2/Pb4ywKU3uNGCIMVzkehp4Cqxd262r+gq0g42tE9urBgQ1s37h5f/1THg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
	b=W6Lmf8o5Dt2BFpVU5V6Uw0agqKmw630wVUQT/564KePaSYn8FcuZeD0spQ0MsNoXS+Fj
	 9Mcn1PTY/wSRhQp7cXX8ljixJHFdpNkZjkJ6gZUKIBkzIFUnPr3o4DCsvQH0qEu/rqn+i
	 v3demYYb/zRkMjgAjwjERBeMGWFKk8dqCXEjqYxu28bkuA/EVVQVKc1YRLshim00whrcX
	 RsFdOBnS1A6+DA+Or3VS7WxUz89o6R2BTDl42DIirksUNZ6cppffDTSXn/BjeYkwPq7Uu
	 Z7Gy4b7ouuPEWMf3Lf+I9hpUtXO5jw7Mtsvue5ihE3MncFo8I1FIXQ6HcZAn5rhIHbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DED1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVCHJWYs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Se1ay+r3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70HF62516328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=; b=mVCHJWYspS+BVcex
	/WyiYlvytC76b5pQN+tQBl3JiwphHifBZksIJY1q/J+ChX2eQ7SkDu6NCvKTqkKk
	2mr4ZSZx3Ud8WEDVzfSHcAPiPyXj4exPQHyRP7Uw4kUy4R20YOGfXG7DWDcCYTKi
	reJL9SR9GiEOpVDUvvqQpvi/BZJ/HsTiUrKGHPMR+arUrqZ/ibLuWks/8OImPHYF
	TCw0Jgq6syF8xqinXZmiWyUW9wjsuXLhQwD9fnBzyG6VS/dlPJ/W88QZE2Ktr/MY
	pjSXlPcI/FZnyyF5k5DpQtnD5gYq87WaZXc5dMzLD6Mrjpae6+zZAw2cTcXegbP8
	W3Iz4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9bx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:59:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso27888185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655945; x=1793260745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=Se1ay+r3gYDWGA9J0x1nf8GXQMfBLWPJuXvPT2C/WRDSj9PliOmeuXjRONfCi3L8Tr
         ncdD4/DYWTGuElSpPyjN9HtQsy2sNRg0xPgDMLXdieWWu3SHBX9+VSY4UbqLPX4S4LmK
         STX1TABTz8Dc7qKl8wyKYauKIRNYaxmZapk2qmheBsdXoZddruPw3S9UGj0oRNXce4z8
         gbEBSXCfWOZp3LC0H+urzcpFp639vOzIO93KAnBvIesJCzQsDeySYQUshGdwBsNjpzwO
         GsifFC+u4TVDtV3dC1wnGUcsyVVM5q95csNi5LN/+tsGcGgt3xscdaVy+Zu0UrnzJt5y
         TUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655945; x=1793260745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybAZ3/nU0xBNVzMeDgHkYwoCW6NCybkiYuUlwpUJkhY=;
        b=1V77ZSOu5FbLTofJTPDbJ6wMTtgTkY2Pwiarzu7X/DRXLC+YD3srDlkdLsFPp3Tb59
         96aw9x8j0oU+W671abUb60b4hM2MqiO7mV2ZysOuIKv1mOJ0uXqTe73OAgif9AioEDZ5
         e5xb7HLrqODvIXIWIcUJgGNyLE2SCjAq9W2LTHRwdDcQtAJo3ZpfVgz0idnY4IaqVX2o
         5Zlg6yb+gc5kYPuFvMs9xcdkEZ/Zuahz3e+Bc+Effju+tzdgjZbgYFxhHuHNnl6ZqnRk
         eJcPb9+IWGTvDvIxY4IGHyZVlMWm0aqnObwEN8nCWHuFNQKJ9QF8GLaq8ZEmdoRkKDLD
         RcLg==
X-Forwarded-Encrypted: i=1; AKwUvBwbUTUxyh8w3SupEGPlY0QW3YiDGEKpxkXTm/tMdnTwImAfnpS6bgf/OYpXAXkgstAGbicrE1YU8Haj7eE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL90dZAIkyts+sJAuvEHxpHCcHAhByYO2Igq8c5Flr5rC23PlWR
	m/g46PCsCrG85SPuC3Z9U1/LMSK8gGjE/59lgVE021MVbWDzOkqJ6OBvzhYNjrSkjsXPW/gU2h6
	Nufm8GlrHYS2Ch7KlWfVOzlZzELGJhibCi8s2Ci0aWCA8+87kspY4NGPznKxNYM+AnUA=
X-Gm-Gg: AYBFou0/zUw7OBuXfpryNlZG3kmA34OlUkrNaTDf6+5UqtTaWdB0U0EI7/FMw9QyF7G
	dZ0CB8JzLMh1fVj/9ENEPtevNrOSgKK6WIuwU7hVd0f7Y6O9h+fzAP0ztSZKPR+VkZAO9qlY++y
	oSQH3ubl/lA+BkR4WkAR8ax1TcdPGqF6Fu7qK0fnzWqBuDRnhH7yDkkBzMhKxLQO3P4Hi93pcVU
	AfmK1hgdJ1oYDNRCVY7jJZaxLEgRPKOPQO41DvrxxWhAiAIw4oqeZ9nBU9MAyxLy3tg4lbbEXqy
	JDTWOzxVr5tB4JGaLK5uqMXfMWS2S+lD9bmZ4OupgTGVWMZvI8WZtvdCNh14r6zyIRRtiTFdj63
	lVFnge62qHbSIJWo59LENXw==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963760785a.3.1792655944759;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr963758085a.3.1792655944376;
        Thu, 22 Oct 2026 00:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50b2f8sm79996666b.21.2026.10.22.00.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:59:03 -0700 (PDT)
Message-ID: <d8279746-7abe-4dd4-9eab-8137d2da19d5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:59:01 +0200
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
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs when
 they are disabled
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c249 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eDe05lC2xiAZV-bDqWwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ejTTvU0cwFOCFZ4kkgDiHWxD2n1OaouU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX9seR1vxRuCHa
 LzaFQXkQma6GUD5PnXS6o7JsA5jnz+vmGJkr84/tihc4EiA0dxvet0JRuJWvS0byj1JWdyPycSW
 ru1Y8ntEctWIIi6oqUg2h9mPrq9IwGU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX9CyqLn3LD/md
 Lur+uAPWQmZHKnzIbAeqWKynEkomwlDDv/B4NcCbzh4caDwe6rSg3rPyzdC6sLyk5dV9l4Lf8AO
 qRhXTlt4GoqVemAOvCmWqw1G8soA5EV6M9aYn+ZqVSRRI3fyYvKq/EPs+KiiTF5JOEPxCuayLNf
 cb2tE9VvX9ScQMg06cd8sng8ghZMmVu95mdCbOBEOKZzALPoLX9nNVyVqnfuVnPvGl7UoiEbwfs
 5cKDIwIv30KHJpKzANtnVZe0lnGMcFWeA+YwpRjkZbjH0FqH7uM34O8pDWQFaHqYKtGXryXD3ql
 P1ErmJtzJm2CocROEQ80Oo+y/ISzt+qztojI3NpuDdbb/QhcF7auHOxfw4nDdZ5b36H0XVvy5z9
 EDTIcGz0ytZ3yRGZ+jVdY1ExEr5Uq2gEP7kXKu5jNWBMWXl1A2wPeR51d8HoLtjm0LDgDwKIqx7
 8BJHHTJulziD++FhtIQ==
X-Proofpoint-GUID: ejTTvU0cwFOCFZ4kkgDiHWxD2n1OaouU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
