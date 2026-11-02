Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629954;
	b=UvFn/5RDrteVY9GOrMl24GDD3GeAQQvDSGzpCwIqYxFY3ahvRg0/YNIA6d0e1w/BaPbb
	 y0jovaAizgDe99cd5V0EZk0u8yFuZ4SLJJIrkNR8xN06JdliKv/Gzt4KIUTk+BSMJunN5
	 jJcMvT5s65SZTywtlWkf/c3KovhPdJRg8u+1uJKB46+I2K326WsDLhKAsBWhxvaGRgNO/
	 wYDelv3Es6yXpmj4Vwhk4IK3ncbvXbL9M/KOAUUwr6NDt3//By7Wv7c4/M8Pct5rarXhX
	 o3VwKFmTxnNU3oiSIMdOnIxar9v9TWUKYXDH2sqRhOeiuxWrsPku8n1+JN+EwjgRVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
	b=j+70TEbcxvUKue7WsKzyYhrWLR03M1F7eycmZA03OaEqaSr84R7a6a57JaD368P0vNFS
	 V758VnZWg8ujF0tLEf1As848VtiRzNohZfghfBpPjlubaH92/8yCgIjgX21+7ANqwLmdp
	 eALQ2QH+2p/LeQYp0hYG7f57r5WJLcRzDOw58/y4SJmlI94M6xbrI/nV343S3Xu6nJjG/
	 NEqreR4AlN+Ai3dYH8ITA70SwZKmzfUFSHxJYNjNqtdQnwYqsdj9QBf0FNOckgjcLqAHb
	 EHyfZ6iph4M7zny69b6WxmoqtUsTkBW0KqBB/tKR9NkCw41Y1JU8aJu3L6e59aQDh7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OX9YN+Mq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8B606A927
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D8B606A927
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OX9YN+Mq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJNY2991836
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=; b=YLN0WTN+XVkEx7nS
	IUH5f9NLarjyz5TCoJOBfaK3X3KXB3pngGNkh288RgrCE1yU7huXhCt7VOhRrBWU
	N3m/BbPksCEAXHujSBTDAHPKfkV5H33xSDWyve5/g/7Bg/c8xc492CJsX1tnzn0U
	KOykRu0pe5lUPvsNQGvIXrTuuwc86t6PhDMml6ve1Y/kLBkuFmlnzFFpVzSCnkxl
	Hsms7vyat6HC4nLMtI3meSb62sQo99lzBbB6MmlnsuL61F/o1PN9fiLjf5AHeDT+
	XfzcGJlc6ADexvhOWMGwMAjjBdwY/eOGcaXht8HAtqQYxCBTrZs+h7Exn3KWvVK3
	NPvaQA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgrnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:32:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso104803137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629952; x=1794234752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=OX9YN+Mq1oGcz9FS5M7Tl3qxPyC98Cmi9pf9tt3ropitn9dNWzZx2t7qNqdNwQZbso
         sE3edQEko+W2lShHpwERQ3ObrfyajK8Qr8pqTzHjOBPTm4vQP4VJ/Fe8SMSd4rVlAKEr
         +qvPeT8YWPe41WM2K3nctsynb41l92yzKyX10gE0i97pHD5dcOgXv1QsFxMu0483zshS
         bUobzfeexu95Hcn7T30/N4wpZZ1p0d1ZsBVRNDtXF/GuVwx/XQLrABQLbJ/OPHW7SlIq
         iL/yLj1RYCO2q4AKTIywqDqEv/M1UXMvHrlhFvvfrFPYYa/CqsTPzhKr+uuB7vu4oK7i
         SkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629952; x=1794234752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=T4mQbzM5ZDeXRUOzIe8pFWcCo4ieQsSA3Nitwz1Qwo/pZHGYAJEjeqoZXSVt3Hi3gh
         aZt+MclpWLDGlusL9yvpTXARBOWAA7v4N2EtSD4g1IHtjJXe26cSZZnRDIhgSDVI1Gfg
         qXiF47sotsrVBDCPo8uKdVPYRuFDxFKyDUVb7S5UXBwUWPMN34LMcj3tg+oTFAGmoNPf
         oDQc2PT1z80ISIXY4rzWt/NOJMLI58JfnReLhcvNyElmdTDUpZygkN0v8UsPA5SAze1Y
         QPRh+yygqtPkb7AvN0MQWHYe9IYZoefN5POcHbeJc/nZYNxjmiBB5+TiJN4S2didYfnQ
         cZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBwd3GKppaVY8Grkp9iCECtOxmc1dyXaKtHW1K610u+68h0grTm3LQf7ZprxGvXA3emkcVkE6NJ3rRhVEyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/wJInOAezILMUQAa3WS/m+f6ff9WWhA/QXOdWk+lYIa2qkIPV
	lOap+BFIk5062ngzmNb6sQWkL8dx0edDQ2cDHc9M8jc3JHLGMNn2m2k6521VlA9jPEsB04xTHWJ
	kTenv/S27lh6sQ7OU18H1Z59RTzf4r+BqMxyHyZbKR8RTP7Xgn5qATL7cnpZhlF8z1FAN2DkJeW
	w=
X-Gm-Gg: AYBFou2LZsP9NuHB2EMEBT5C9uY/Fhp0wuPlHiM3hu5Y4j2UfxfO7w4ooRumkVAENLg
	zC6f6VGzzHsGAjMUxq11wGcwXI51rzlu+WICKm5RgR9WHHbnz+PFPUD2WYauSI4UnrONAjMTFO1
	ceflMX443pZdIPJHdwqKLQ065n5ikyf6Q/bR5zE2XVct4I6yz7k+ECpVybikt7VhFplx8jTXRCe
	NDWLLtLyC5GOOYa6iDciz/qyvugYF6cFHijAiCWSH+0FlwCEclM17aQNxBhK3Xpved1KkT50nkl
	bKHBwTiBjqesLU/HvdCckY/B/6fen5s/dwXBCgF/tvgXTYnCDuR0xje/nMg1i5qJT9S3GqqovTm
	oIq9juOtqYE+D2XO4rcwRy/1+9D0KK7A7eAssqPhvF1EaKzqHAl5uUiIn75XPnz9XW6jlY4H2Od
	Tx4w3fPvmRAxGm8wyfauhFo57CXvwObA==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582525137.0.1793629951612;
        Mon, 02 Nov 2026 06:32:31 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582490137.0.1793629950943;
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm418712a12.33.2026.11.02.06.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Message-ID: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:32:28 +0100
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX6q62Q4GYnNyv
 ymfo1HawrkXiDo2nRTOJqyM1hKwbUwkcVo30A4gcsDA9OafVw3FxEMPjPW/tH30dAU07vsN7Cb0
 Z6xuprVqTpyFHHjesBbuXb4d2yBAM287sY+4XfuXQ138ieToPn1axu9Nvqzj9TGuyvZRNeM6y1j
 iQh6fzjm+VSNnoSMRISFQksLe+9F1t0hxNE/vh4vzbgO+As8laTB5kejdZt1rPnDX+PnYUTUzXI
 PFEYhExpfaeQRVG01ubdnJ9uIQ7YSKSIjq0YLQ+WQgDiGOOwgCOpCd1rOervAhEAZ5yMMNNfmXt
 mwnjk00Mv1ZXiT5R5M4Uya0uDO+iS9BqxCSKQn+4QHSPqiLcdONO8UMr8w1IbCoYfn00E/4KoPP
 9kQ80W/Fm5/JvGmxbtt5+6lCz5Zjf92ZZVZmzNbpC8PDHqUmHSGvWXgbwryjj2bNlW4DoZOxcXY
 0l2aHt5F4GeCcQnVb1w==
X-Proofpoint-GUID: v-Sv4GTGzsKW3yUd8GDpV_n0hbG0JgI-
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae89f01 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=xvBfzxcjuVojlPD1IgYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXzWvAZkGyrgRf
 dLFLlpZrnWR7ozlB/7iJnUxnytR4OvDkax5e8hRBxSJJgXYtMfjP94hQFZb4P3FHorcozri2QVg
 1ZON0LAoUwyjfL4v9PlkMxbzqHzJSsQ=
X-Proofpoint-ORIG-GUID: v-Sv4GTGzsKW3yUd8GDpV_n0hbG0JgI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 11/2/26 2:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Switch frame_sync_en to true to track and consume SOF/EOF data.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Is there a reason why it's gated behind a feature flag? Will
exposing a SOF seq counter that's always zero (i.e. not
implemented, never bumped) have negative consequences on
userspace?

Conversely, what information (i.e. platform list) are you
lacking that would let us make this non-opt-in?

Konrad
