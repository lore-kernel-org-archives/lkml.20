Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69743CE7E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769329; cv=none; b=WT+S7PhEgmkjndUhxY5xYSPvLsA1EE7ZuydYaT9GC1hfdT9e+sfkIsDO1pUqsKyGXqIgpJSjit1G94DCStUaE3Q9IY08R/bTn6H3HhbYsqivNvJPbbh0a57fXZslQZNki5f19lV3YideaTTfmPzGvyy5NyGQUijJqcZspxTVq18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769329; c=relaxed/simple;
	bh=nS4ZwDxmZPpwlOqyJVI+H+ZD9IUH+6rel58IpJ18Sp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PI9uToIh/907tM+rznMZ52ALjmj0VH5hJnpPNcS9NdecuwrSpXsh4NbVeKJvpnH/fvLamNxkVFOtMm+y5P5hG6nrQp8Y3hrtnJukdA4nTxALafkdsre7QLAHju0h415uCZYPvtI/CQCpsfCxvb5Y8Hjt9LqIy20cPOvNt+ZiAas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kegTr5Ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qa5xCl3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kegTr5Ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qa5xCl3Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777vSu3686808
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCzd7Netj+psNd0RcniDmQeJOKyMFTF+YpDvix9/mcE=; b=kegTr5YsDG1Uvu5b
	CeycJ1HV/+PrbIbaBsdxUrdwIEYgk4TBgYCpcZpwNfiv3pzVGNiJ3XN144HSwgAN
	Uox5S1UOPSdBPpNVgVq3AHxe68busLVbsdDA2A1V6IoNy3BwojsZTf/9IWrMhsLi
	7XOD1Dj4cC1tRvbR6JgdSPEu5TBZo1dPCxNGe00RrWJy4D8Z0PsStYsBGrLXN9hH
	a5XLc9rmejWkq0AC/N/v6S2+YAYGCtXG+eVlxZ3cmx9ZS2Tvul9AOmAmy8QJIyW4
	LfQsBr5C0mM2DOUu5fr5QR3g5KjLGzW47qky2kubiwQi4hjfpm6eKOPM2XfkVzpE
	kg9jLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga3762dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:22:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so7941436d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769325; x=1789374125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCzd7Netj+psNd0RcniDmQeJOKyMFTF+YpDvix9/mcE=;
        b=Qa5xCl3Q5RSzfVMzaAqGX0BTXnbJxZ/jie5qz3NUXxuu8TQXD2mssihyV3Vmi7SM/c
         UpnTLQE41NC2hYD/dkX/vYpBIABNLcAj4+p61Td6SqX/MUsu8I+HzfT8CoIqI7n0M3Qn
         HIejkGBuwiiWqGSDyb4HYfqS5U0FETwCXyAz2BzwN7XmR7lrd9mbE6trODLqyiD0Ebak
         kO1DfD6pmpBQqZZPmbLEHP5u6HB0DPcxTDjp/76iZKxt1n/e65d1muTivutjXMiH39Xd
         0RUJpQkRzL3TK7Xz6HLkzwl3Ehg6ZCu6Afd3vPLst67oW3uZ7XfNziHirppdHrEI6mgr
         1gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769325; x=1789374125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCzd7Netj+psNd0RcniDmQeJOKyMFTF+YpDvix9/mcE=;
        b=RtYKmgIgDw+y6+8uyF0WaLKkx8Ui/YnhtuKGORaO/sb/nBxf4a8d5sgO7d7j73E+wn
         EzUX7+r01/v0e/X8RCCdUJcRUq0eXkySCcGLVP70UCk7xuaOUZQoApVQlTMGl7tasQji
         sbnVuMNwQIslOzDNPLcSr0oV2G+g9E5F3qd3Leb+P7O3mKofE0ilFCxH5rKOzxYnJozD
         xUHJiOnqhA2wa8vyZ5N8i1pbTjZP4LBprAPIMJ9P4sf9aIKFAtUC/chSws5bbw0JCd07
         FjekD0lQkG5VEQLFXrlG6xE7uSzMnClq0j7rppgMeYbhGavBZI3TGEmaUSO6oqCRWC2s
         t3ew==
X-Gm-Message-State: AFuF++nvLhvn6P/dO2IbnTlbs1UUSI5lM7pAFvgRqREbdWS/muyyIvXA
	Dbxw133TtUriENc9zdWVRx1q4Ze6985B+HQmpiDlZ2ZFt2S/gi1jKGMk7JeVyPrONyEWCX8eU0v
	Nq7gsNO92srGdseRcn0vnDf3FpLAq7v/di4mPlQnzm+8yXe5072d+Jjr9kUAn/gjZOxs=
X-Gm-Gg: AYBFou3XKDP2I/eY71Z9dDve+UDWLPlVTDPNvqr1kfYEx7AhCdSMXLnY0LNA0r6PEpC
	WZkN1VaS4eaIdb2OP8yTHdS8E6pv/GlNBv2GfW/N2xoye/o5PVB5PG/Ae0e4krP3CVeiXDRqj24
	oRNc/LgaauK6t9o7seo7X2JpdvP/m9Ow4tQYDDRckDDzOeOvglwUkMZTqLf6+WuxS5BQk54fzq4
	UjOIKDzPfB5PiAr27l2kFpwBDapa1ZlGhNcXuCiDeyvz++SILlbFEZ5/5X57/1GZDMBHqND0+pA
	MlSbg645XUjGkiotnUM1Tbd62S3eHRVZEqZ7GAjfNDaPZEkQFyVdn5aO80sJJS1LfXB4Bh35mBQ
	MiDSDxZl1tBLljaQjy6uZqQ==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1151883085a.2.1788769325398;
        Mon, 07 Sep 2026 01:22:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1151880585a.2.1788769324988;
        Mon, 07 Sep 2026 01:22:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b7dsm427903566b.21.2026.09.07.01.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:22:04 -0700 (PDT)
Message-ID: <2b18d1d7-200a-458f-ac6e-bea5fb5e7d54@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:22:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smd-rpm: Add trace events for SMD-RPM messages
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260904-smd-rpm-trace-v1-1-8c1cbdfea82e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-smd-rpm-trace-v1-1-8c1cbdfea82e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EKtZ6Csinqrn4jgCLKk6O68pXhL5fD7w
X-Proofpoint-ORIG-GUID: EKtZ6Csinqrn4jgCLKk6O68pXhL5fD7w
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e742e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=MhiFez8Sv_XCqzlnK4YA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX6E8H3EFIUZ83
 vOji6Sbkig3YfZstFA0H0OJZTVBJnipjnYN0dghDflSqPkstgP+Hty8km2Hu4CawLekv9kFysXF
 Nqhz56wEbbdhZ1OvWcoHUdhOnF4RMi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX8fLapLfxKzce
 ySqK6QglWnZ5nLzLzG5DlV9gIRI8Yo0YCsujub4NQ7sx+7ZLk5RD4opLOUSN0g0wlafHft5KHrB
 m/Nu8dW8AncD80bR/riz5UxXDJybxgMCI8hrkXFzmFVL8pXNd1saRM6/D/Nxiy6tPiss+RBLsj0
 UQp5ABTRbgrEXrrjWvjpZOJAqLKNFLi+J5yCWKOHY9lnCqO9f8ZDPFJj8UZMK3C69iUs5+qUT+U
 perXE3Gb1TA29NNl7AT7Q0AymKb4G/XGyGemDQdWIYxUE395eH+c3SDrLe9NArPw/2m2QhWhaOv
 Q4ee8LWF8cxUMp8YJc+HGguz03j4m1RcLXuQkmy2eQauN7c/A4FxCr8lFOZGCTC9nOP3MIl5+DJ
 Rq5BYtNe+fGZriFaQhOe/Afz7vSW5PWENopKseAxB2+80aoMMwyTYLDISrtT7+2lGq0+eFw6pij
 tX7Uf6NdqXgtQiYSdeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

On 9/4/26 4:23 PM, Maulik Shah wrote:
> There is no visibility on what resource votes are placed via SMD RPM making
> it difficult to identify clients that do either under voting via active set
> impacting the device functions or fail to send sleep set votes and thereby
> prevent the SoC from reaching low power modes such as vmin or vlow.

[...]

> @@ -106,6 +109,7 @@ int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
>  		u8 payload[];
>  	} *pkt;
>  	size_t size = sizeof(*pkt) + count;
> +	const struct clk_smd_rpm_req *req = buf;

This struct is called clk_smd_rpm_req, but it seems like at least for
the current in-kernel users, everything that's passed to
qcom_rpm_smd_write() (rpmpd, regulator) is a renamed version of this
one. We should probably rename it.

Or are there requests that differ in structure that we should be
mindful of?

>  	if (le32_to_cpu(hdr->service_type) != RPM_SERVICE_TYPE_REQUEST ||
> @@ -171,6 +178,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
>  		msg_length = le32_to_cpu(msg->length);
>  		switch (le32_to_cpu(msg->msg_type)) {
>  		case RPM_MSG_TYPE_MSG_ID:
> +			msg_id = msg->msg_id;
>  			break;
>  		case RPM_MSG_TYPE_ERR:
>  			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
> @@ -187,6 +195,8 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
>  		buf = PTR_ALIGN(buf + 2 * sizeof(u32) + msg_length, 4);
>  	}
>  
> +	trace_rpm_smd_ack_recvd(msg_id, status);

This way only the last ack/err will be traced, is that the desired behavior?

[...]

> +TRACE_EVENT(rpm_smd_send_msg,
> +
> +	TP_PROTO(__le32 msg_id, u32 state, u32 rsc_type, u32 rsc_id,
> +		 const struct clk_smd_rpm_req *req),
> +
> +	TP_ARGS(msg_id, state, rsc_type, rsc_id, req),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, msg_id)
> +		__field(u32, state)
> +		__field(u32, rsc_type)
> +		__field(u32, rsc_id)
> +		__field(u32, key)
> +		__field(u32, nbytes)
> +		__field(u32, value)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->msg_id = le32_to_cpu(msg_id);
> +		__entry->state = state;
> +		__entry->rsc_type = rsc_type;
> +		__entry->rsc_id = rsc_id;
> +		__entry->key = le32_to_cpu(req->key);
> +		__entry->nbytes = le32_to_cpu(req->nbytes);
> +		__entry->value = le32_to_cpu(req->value);

GPT points out `value` can be more than just a single u32
(via nbytes)

Konrad

