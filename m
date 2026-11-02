Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617265;
	b=M/UFokek/SBuqiup704XrcvUTwuqdCzAlWs6fRRYK+VJNbZsmh2l3rEjnhFclxdH03nA
	 fYX5Oil4004qTjcknvp2xtPPSO/g31cxFLjdJEJ7WtQIN5PfQi7i/RS2FxDL3QPoVUF7b
	 QCX6BXdRkATUsHTn/ZDQxBw2ubbUPA4txp1LGfaTZDRlFGK6GQWUZBeo1NvotVn1ft+v1
	 cukky+ORXVNdm3VOTPNDS4rfwwYMfYngIZOpP+pNNdb8B9viRa3Lx+aRwyrEQ6+DtvPbC
	 jUJVz5xVp3vJrLTTLp29quXUbtzO47W9FQLMT5Pk2+Z9z6FjQsN/3zifKOhdUWc2HFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
	b=FWUQGEf3yoN/MqaImtU1NRnZa0264u2dpnFd1y+Ut9RJN0a/6vgJfevDQxMkDcim0lx3
	 LqI6OqKojBrsaVQWJgl126oRmvTafkr+8MUbhrQhXzbnj3mRT3Djcmz/+zRJYb1lUWF+U
	 cpmL4OWm/3va8MwS2g/Ze5uwHfBEBab93VPymp8JLqME4fYmH/YkZbOsqaKuTSrc+04RA
	 Ma9K2q7ZgJ7NU59Hob/DQdAkk87DrYF3rkI5OuJrBQhRAA0s3VFBmq3tgxtV4TxxmWVFQ
	 c3ICQF43Qy+csBUOO+7DozN1TErYi3aK6D8M2wsJg5neSLVCwyels9DlQQU6ebj7Ibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9lnQSDf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC35606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC35606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9lnQSDf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1Pq4015085
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=; b=VXwguMPStlKTKDs/
	RJCUy0czi/rIxTpAeFen7Tn/Ch7F/g/ZwWvzOi6jpTBdRUXVC68vwzvw8TYshZtP
	b9rTkENozyhWn3s0RpEqigKuiTrRhJyw4wh//6cOS0OtlZhyOb/mmZqz6PAJx5Fl
	SGSpAFjHJT4Ma96omIX/O7ta52bffIU9lNIYwo8y6z6w+hOkSBIrfxpqlbQslukP
	gz+ZNsDFDvdKbN0QdyyH0vHSBRu43moVt6op0bBEohnRCXyYSYVsKpwNrxIi+lhh
	4e1mpU4/0yJTFKw1ONMq5G6UaLgF5hR+VWdFuLx+LoTQ1YBxrLgXzy3P3duCvlhi
	8mCdCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6ppnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:01:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so48972585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617261; x=1794222061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=j9lnQSDfv+3vAuQak/FftgCGLKQrwMLICA5/5egCX8XJFi43Fw7tnrNoWopTsDfiHh
         1pJmOH7aK4CAzQtuYmRMAPDxB/WQUxqS4lHFnBnvdDEWnydcLQPJyiwWgpgyZkHbDtWO
         TrQ5ElKjN9g4/Usf3ojf+SAZ2zo47jXfm2OzXds/PVBURYVetWNr4+BrXIdxT4WTlCLS
         gwG/okqlJXYzEXVen+XeIUvbVVb7uctuIyldxYMmnYwgE8DYiwxRQBJ5zc39bk5+DOKb
         qg2sHuKIo1oNrBp+ocUe6yLinuPUC8IGP4t7/VZLLuNAOL4Urp8oHzbAYQYr2KRVTgrT
         ZXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617261; x=1794222061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=M0kaKbjWC2PmYCocUflJwoPfwijdXh/IbfHcZvqGlER/ZKTMs0AnBvK0Pa5qbQRKX0
         juynMhD1B0A/4MgR3SyJHjzzbh8o2YfbMygdrqycCXlw2AiDtkju/Z/WsGz7HCCNthl0
         KvDLi2SpyRW6ZFHgatuxdadgwX3H0N9sTA1gpCw+KGXdvmu7Hyw46cufphoetVeGlLrs
         QUAOb5yFNWwFBu/WXKLLOzoZjNTR0Os5XaBlUUaYC8mCABpfRfbUcz0JXNBAi0rb/u/4
         JTA197lqII2G/i6YOeGyQKpapT3NgRy+JBy7aEdCHtcTrWBtibcNnANAG3K0BFaclljE
         /CrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkQ+2OnwTmov7eCcBMGE+iRve7pAIJT/Rjn5YiOSbRPtobsiOYovSKWOYd0Ol/oBEkjMxLZtTsg+IAhUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6J9nQhKlxNNQzn/CQDy/K0ZZiwEUT2TjJfMx0pMO1uHfz3fQ8
	01tJM1Ar0QvqdlPielGUvz2JA1W7Ytrc8tO2iKnRMnhvedUSvVW/OwZqHeOQ7OPDuKqaQxqKuR6
	IdfC0U6E0rDmxz7mM9F3YqJSD1M8sI7lPYkWFqRHjBXaZaGnkB/YbDlHDrOv1q45sOFAa1ZsctE
	0=
X-Gm-Gg: AYBFou0fSYWFwl+TU2sy5WiL197M9HC0W00q/YlyORwKDs+RYSGnxn2tG9ZAVnxZrga
	afwZ2q9o8zJB5yol3YHBItQwTAvbqdCNuTeOCbzpNVYBEwo1RLB1O857LB3oYI3b4b0J+W3EEzL
	VRLJMLFCKj7iNVQhl7+wn0gxblTKn6Mq568SQcTp+Fj1iYQADWmim0WETrfHF3fDEhz3RF9rDAi
	Tr6LdLcGlhFU2/DtVDM6zTon0PLkyiKuurrdL0Wpq7co33aFV1fIbVjCBUryMF4Unjt0rzroqNY
	0McG5XO5mpBfyMPMCt1aSqElmT+bRVvKZVjnb8n1xdFBSLfBKaEKxER+7MdkuEwTh1txKBE5zuE
	iBSlc7w1TVgAwWa1QV2IkMjQpvo03DkPCRsEIgW0tRXPp1r9+NJrDDSEMkGBeDBYRrbHe2Bo=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674200885a.1.1793617261366;
        Mon, 02 Nov 2026 03:01:01 -0800 (PST)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674193085a.1.1793617260644;
        Mon, 02 Nov 2026 03:01:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3157671a12.15.2026.11.02.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:00:59 -0800 (PST)
Message-ID: <b20d98d0-566c-406e-918a-730eeb21fe25@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:00:57 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H5j_Ngc9uDKE7cKY6wyz4iQkgcVNMCJ-
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae86d6e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=chyuMTtChKMO7gno4G8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: H5j_Ngc9uDKE7cKY6wyz4iQkgcVNMCJ-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX9ikRDYrjDd4R
 E5x7KIohtI0BKSOIVn2r9X6dn8PIYLerpb4MtvmrVwqKvd8iZYyOc7A0EPCCWXmAR+2W5FX81vp
 pU+1Uj52MXnPEmrDsX6vD/yugGodMvg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX9kqjmcTKKonA
 ekwwddaJRY8OzOog7oBwoh0VqhBofBPbHErRwuf/RVuw4Ozw6B+eTKGacSMqJeGhr/QQm0sR6Ju
 TKg4hpgYTJXKXLuFd3/B4ABdSk3CiwfhaqIDRnXYj0iDmTnojUVagejed3ggEZZTi0QN1o0ZuCL
 9RzA8J+5cfzQRXEK9HafnpcncZ+Dfzpk40HUEH9mGui4f85EA/G497iSBSLuVHE5sL51KVWgDBJ
 73z8TPL69VSKApNe/toncPXSxylkAvRWwjcP+okiXvqyBvwP5ajoF8EmtfX5qTM36AWLb1Fmo8F
 R6sh7GpRFsI3UZXzl7wYIVKw8bM/4LmB4lldyiXWW8TU6rVAK37JVMpir4+ObTqGIYaOlYsvvIP
 0IxtwYenJ+k1zDjCqV6Aap43G01R/BdKjYdC4+Ni3OW0U1g4cm7PLOXWuI2sD0SWOYS1v3xy18Z
 WaP760DdJIPVCBpWYTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 11/1/26 11:00 AM, Suraj Sonawane wrote:
> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
> 
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
> 
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
> 
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index a61df10d4..278d5fac8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -34,6 +34,7 @@ enum lpass_lpi_functions {
>  	LPI_MUX_swr_tx_data,
>  	LPI_MUX_wsa_swr_clk,
>  	LPI_MUX_wsa_swr_data,
> +	LPI_MUX_ext_mclk1_c,

This name happens to match the kodiak hw specification too

FWIW you need to update the dt-bindings to accomodate it

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
