Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3A310652
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073783; cv=none; b=R7f/dM9KA0FTMvgJIvXAEXkgvNGPguIz7OUwfhoprgwiUZbexQmL0k+tVPig7U9JpnM5tWqXSgkHTpujfCF2+yOglBxQ2YulkpvE+N1n36NeyD+3Eg/S3I9Yq1w7qotZOign5IH51yNW7/bHIrYSD95XgeLJgdLBkVSnHCBCI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073783; c=relaxed/simple;
	bh=KZ7LDfjgK99h0rqT2h7/+qswU4SirQ0LGfdZbpbfHv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFuuqNVMRR77ebH9nA17NLQsn0zulnXXj5N5NpAjHpe7/Usr7Z6ChsmvL+P+gXHdKmBFLuMHaiEE36zMEd9F7uoTpf1gqFUTyjWaJ1FxaXWjuJj9MdscA7KTxZxCEj1q9ipt18FWwRj6iDtQOizESkeC8frvFZRgFHq9ZQqSwoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJB9GR1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huMEZaQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJB9GR1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huMEZaQS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MATNsl1023548
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=; b=YJB9GR1+n22mtbrN
	HZ0ji1guaaiWDmSLNgO132wxfQf8PoPvcDFrDWGpq68akmvmEeWqidQDR1mD1VJB
	kXjbhBOiRCMwuHNNunIiYyc686BQXgQFN4b+6xOs1Dqv1FvWvO7Xc5zpunCAcR0p
	sqZ1Oe/Y2DkuOcfHfa5yfSVZfPc7rVtKoDwYqxfgiAuJu4N+WnIk1IqcQPZN+VcP
	r+v4BC3HD3DQLaMQ/ocRu6DdLqCmbCyBI3WAuCXkF/uqn07xFIpNnHFmxbDpnlhh
	jt1zVJFUksQ8due2INtoinD6qgzYid2V/E2HdBHRd1otnsXE0iDERPWDiA6lkSq3
	BvSdPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycr1q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfab40895so50619985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073780; x=1790678580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=;
        b=huMEZaQShoELpqMDNPj1xmPyd2OqTg9B/O/cLXMjSNYRJ4HBJ04+QEqgSz8Vn5MAzW
         RSM9OZqty8czjb229otcUq0B1dptp+dV7qS6emAZ7AVxe0aqqGOqtJZFa+Rt5DLPTRSr
         hLnH+aocLADjgg1q92QYZ5pnSafrBTA6SwniX1+4JUK1gMt9YdXURxpbJZGSfAaGQ85j
         WSgK/q4ZooG3HmILQEHPtyvnBk3Opm6No+R4rIH0aiiedrCRK1SRwm+v/capjznhxjqj
         ipUMCAQbqC06Ye9i/i/IJIDcVsqW31eQnryxgGyLiHsF1Myof2R4YpKvccLegtIVIfRi
         sMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073780; x=1790678580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=;
        b=FJh1ELI1cGa7u1gq++LU93j0g3OQtZLLhGsoH+OGabIfxuvsRFJO8z4XIvTWiqK/Pw
         e/relTJb9yWijGOBz+ZMW4fySGnY0cSDJ5RgoyFZv+1K6sWebsCkVuztsQm3sK8vK2ej
         sN9g/Bcm9aiIV1kBjUIwhZQu+AJLVJefGoiL7YkyfaNPZ7HsLGFaVMqdVJeckXpjnSa9
         Gavrm1c9Ai8oNV6Xwh6i+BlFRkH5lUP6i3oFqNJqEIc7neB37QL1i7meFIJgtTLk9Kgh
         wT8wj+1Zqk+fxgn58EagvRVykIQwYEYfl2f9SVFQ3i3KAE8fvneks6hNsf0c7HE0mQ/B
         xYkw==
X-Forwarded-Encrypted: i=1; AKwUvBwjnT0lCHKanw/iOzyEpqaexhKKHITITc0jTxCCn/BZRH6MbqmvCX172fUPUYR4+PC/0BOsFwd5ctvE+8s=@vger.kernel.org
X-Gm-Message-State: AFuF++likma6YHAPTLV8n4gG69w2Ipfdwv3Vn3rmstp8OfgyhOWsadO5
	BIq7RCDUsWZRvNWh+Vt4Z+jECpzLz3AZ+OUEDVuJipI/hnHE7MBU75X7O9hw+QXdaV+qfM7/lL8
	f7EoZtqkxZX100NRKbBIqIjkEqzeNTdXxKskiLn4QlVBGSsGfncgLv8O5IscqCCDkP/nSPD5VmA
	o=
X-Gm-Gg: AYBFou3j+4b5jtYcSTORM7M6h2X6r6n918H/gWQGpXqW+oiaEZFAmsN8NT56BVUPn/P
	ZRJKo0zhYO+79Dh1qSw8lU0YUihjwCI6hX+8WgrRSEdq/WOp2k5N6yAOxjDJ9eY5DTyIQqt+0H6
	EP2qtpizTAgsphKRcuWMwRSdKWGTjSQHy2nkOjSEIQEh0pAPIMTT+On6SPWL9Hb3R0wSS2/XPfu
	b9+VJfeuA7ij46bWS0arp0Guy1QqZLDgubi7Qe5d1YbhcaixYiW06U1yZitL5yAbd9uas6gVR2i
	62Q+z8da5xtnqAxQ9cKuF1T5n/aZkY1Fenfw/8AE0TK4q8zGwOahxrin4k3O2RoRzkbxKgUOjWP
	TcNkTMo+ZDOyOo8Af/DWSUA==
X-Received: by 2002:a05:620a:471f:b0:92e:6485:f640 with SMTP id af79cd13be357-93c1602c1bcmr496925085a.4.1790073780560;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:92e:6485:f640 with SMTP id af79cd13be357-93c1602c1bcmr496922785a.4.1790073780203;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d2015sm845336a12.9.2026.09.22.03.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:42:59 -0700 (PDT)
Message-ID: <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource
 table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nzdX-oHmDlM7poPTlz3pVipK_6RTY5sq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX5mqSgocS5Tc3
 HQbh/ZvNrA0sPUJEKOY7pvaDiWM+UrzkPGHbUp4Wq1dHB599NoJiecOl61XV+DKpiVe20zuKWao
 GqjjY0MMTcQSYpJkOgdn0uH6/LE5wauqWAtmDQiQHToiVOTlJbMjjBm+ggzQqrwYp9re6Lq6GRp
 v4hB6fbRy2Da6VNx5ysxVl1ZM+nUrzY+nyL2TOF3p8RQZeavIqHvASQTeiKsQEEMkygKb/naJih
 HbRKhcuXTAmz+gbDclDTvicm8932kZSRQgWVQeji00aGejGfx+T4m9sMdUkMrOE1dPwf7pKhs+1
 5mdjQYXxSlCpfvSq+KFef51me0OO3uc9nZGmrZZvesyi0WDDUty05oRwWLHMHcBtoszO01MTXal
 l/s/kN9gYRGtWxvWI+27vHNjU9BsvgZocXg1goZ+0cIh1TMaXHvkN5Rp7HSpKZb3zDeORHnvDkU
 8CIySMuJcIW2yZcRo4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfXyMNvzRrnJUZG
 9n+F6999+Z2JnICNNt/i//TxhKCbmadAe9/sMxjFybQJfrjk/mxont5Y+ZCbNMilD8L+5ULtM/i
 Bhd1UAiWwwGFBM4fOKijtYUP9KJba5Y=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab25bb5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z8-NgncP72tjiTkV2wEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nzdX-oHmDlM7poPTlz3pVipK_6RTY5sq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

On 9/21/26 9:56 PM, Mukesh Ojha wrote:
> The PAS resource-table query may successfully return a zero-sized
> table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
> which is stored in rproc->table_ptr. The remoteproc core then
> dereferences this invalid pointer while processing resources.
> 
> Treat a zero-sized result as an absent resource table and return
> NULL after releasing the TrustZone memory buffer. This allows the
> remoteproc core to skip resource-table processing.
> 
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


> Changes in v2:
>  - New change.
> 
>  drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index df20773dd754..b5959f833dd7 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
>  		goto free_input_rt;
>  	}
>  
> +	*output_rt_size = size;
> +
> +	/* A zero-sized table means that TrustZone has no resource table. */
> +	if (!size) {
> +		tbl_ptr = NULL;
> +		goto free_output_rt;
> +	}
> +
>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>  	if (!tbl_ptr) {
>  		qcom_tzmem_free(output_rt_tzm);

^ this hunk can additionally be remodeled to jump to this new label
too

Konrad
