Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483580;
	b=g3Z9JuYTA39vfaC7g52kzQxkLTIAsYnF9oDNJFRWJAdG+VzjdmsiKiCVkcaprgZDXu+g
	 GgzNZEECP7S/IQb3MEob3K+K0Y4kuLMGILV6UBshXqMs4RsVqCEssHNA1IHmlpBMFqFGc
	 kbDtZqFySM7E5mwHcLAa3D8t5TQvsJvFminzQ2X5CwvbCxnLQte32vzIFBSgvMBpR1um9
	 Ucl5L8DJHrh6lI6Vnc1a362TYfh5s46fvTK+kSRzyj41bfU0XBHaNs+9Qindd3M+dEFqM
	 HNDPMM/kMLH3jTuhiDPd2RV6AA949LjlEq8GPmBDohFUWPX60F4rK94tC0bUFlP/R+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
	b=PIjp06w/8X5kunDpA0hIkDsIUJghdug76Z9P7CtGtQ7wukC9hBRtgd6ybyzOxPvXDugH
	 r9Ht78qQIJ/yB5vK3zZksPJdFqF8Rm0OEjKkH/sfYZ5PHXpZ5pKl93XNQUhEMagxD+4BL
	 Wvv+Xsy+iNJKzFRDNDcn7gTjjfZHuq8vMjt0wmCbvkK8CKPEBuvJYscxKLYOrXdbWA6wk
	 otxQ56iCsmrPEcgydR6zfRP9gkbhU6pSZi6s+G0wWOom5Eb6VYkXrx3hMmxXb+93QbpGq
	 bKOeEuDcfvt9V3xnZ7EFkGQ9ebHF6zJVpA38lh+h3vck06TiMV+PyEesTzBe+FdM0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnQIK1jR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEE606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EEE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnQIK1jR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0twmD187187
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=; b=KpNb66Oq1aRXfUnE
	ROS4fb8H53uodsq4JHXsH/eQt9SR08bcFIM0qWPot3jle7phvh+stibRceQOEYUB
	jumdSuExfPIM+TgERy/96l1u3ZkTccnSFB0ND9tMbFIeNZhi9pnY5Dz+M6cD9vt8
	wgjUxwG9C826lZVkASOGAKQ8TxsjjUCKBUTS8WYx6P6UjH+yau6WGT7sR0MewrCQ
	rsAeOYCmP46aFZJR8kfO4XK2KKi+9XvYYTq6y9vJF592TuqDSUx+AJe94fqR2CSs
	PYuqDWna9t8k96/ExrWxtMIOIvR12yEIXh9uknEiD3JMVHDkc+gTW60DfvDMpB+g
	1yL6mQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nshk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:06:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c008df17fso2470276d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483579; x=1793088379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=VnQIK1jRNi9zQdcfmcJJPM+DplJ0ODNgq2bOOomwHO7wjRDy0Fv4eeX6cM5lIwrkFD
         VD08HIkcZGHHZUjk7ADApUHOHTMro/ppSjNsht8+Qj2P0IIbwwk0gcdDst+FtJZMJ4xQ
         gZOdwl6xRh05od7dO0umTY9LL5lDGlI7aU7bsKBSkPb0zhq/iYshXoKSyEpDuFzLVeTT
         oizK9ygTxvXlh/VDJUllMMI5+KYO5bv8u95q8RazfsDL+knclSy2RMpfeTsWqbR7cBdy
         wTWblOnBa90bWmQqeOpW2binh5CoBV91/9MHBZaRohLjKB9MwhAeXXhylwSlnrbEBi+C
         vWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483579; x=1793088379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=Kal/CZo28nZ4M9Ty1rAB9Xn9PFuqJUUQV2KF2hk6+t4V+1XTXLLeIs4KjY4s8FpcMi
         9wxl0MFde6A4jxaMi6FWscW2FHOYZpQdVGp3+L+0zL6wc7S0hrAO5qz+c08dP1GsymZ2
         vB7AuwmEx6YQX7wxaZkjBxIF7bypZ0Ym/REaiLhs+kAooY3yFW5euD7HwGLMvAgJ9mHy
         bAwZudhlU8x+Ez9b0tBf2AYeprfXQZNr8iLhloUBVNYd7ZS0Vp/ksFQ6jL9qoGS8jkhp
         sdPFzIqxpTmFqrSMH/u/pysBWLOTOK9e0qVEUKMkabb/xLXxTXNUBmu98NvjIVLv4gcL
         ZIvA==
X-Forwarded-Encrypted: i=1; AKwUvBxf3vgLdZm8kBvzcIamm3zhRpSuSC7lffGpOMrmG2XJw5vjmv8LmsDSNNge0/Qnp9KVyhk8UTuiLgvt36I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaDKqyNtepGsiPILLUP2WR7CtK9/2KZpSRSqsahidmnAAKVe4m
	2GyZwvQ/dps4rGSh6m05Hv7H64+J5RuKugfBJkPKo/FRRHnNpQ6D/9ry5lrtPTdbHLXEif0Makj
	nM7wMAX7RRGXqgILKRXGCjHXX103sA9MyX1fGbhyEV5Clc7N9vIVtl1202lwaYTo6Jm0=
X-Gm-Gg: AYBFou2hP5xKeUaUZ7HYc380Qc6pPv+k0R8hCAzMYkrIfdP2hA46UCOcD4MvlUjV28s
	M7t3lGMdprLd7ZigT1q4qKBMqYHaLUTaFBixja8yOnJ7HJ8NBoj+jGgviH5sZLOJDROCH1vWyPu
	h2tZpB6Cg7dW1QhL1bSx2LsAKPwtw/Obr9FcMYrQ2Vaj4WRWxQOqXxq7knWaVeVTdYbFv+qaaCm
	6+5QxjLaaFsUuvvg61eBbiap0zozru0aqQdf0e3i3uvRSWoCT4F3zK60JdxNErBQGnCqpEUOJ/H
	ZljuDSiO90dkXXA29jJHd4bVxxGo+Snh9Q/099rVQ5gqo23bt0PpDb1oYSwabgHX0ll3FOPNCvK
	PYnAOSeroqmHCWnGJynWGGw==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073601cf.4.1792483578901;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073391cf.4.1792483578436;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c466de84b94sm20989766b.65.2026.10.20.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:06:17 -0700 (PDT)
Message-ID: <d4957cd5-c546-46c2-81e0-b2afc14a4ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:06:15 +0200
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Preserve shutdown error in
 qcom_pas_stop()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eo_p7f0yNGDFW4pBBnbniXwSgQuJlAJT
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad720fb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v8fyVrpRRJkhpEgro6wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: eo_p7f0yNGDFW4pBBnbniXwSgQuJlAJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXywVmqS6jZp7z
 9PmNFYBgp0E0YlxGh6s3zjUM8jPCcuWlvp5ZSbOMz8sHgES6TKXnCqJu/6gGrzSskZ8Rz45eayv
 4b0jrpNyzNPRiJ/yiB5MlVNwQ93cxZmgjEbSaOWFs7IFOEvm6PdL44ywI5JSBb+Jlg9RBZqKzbB
 x9H7GQDeNh+bi2yK6A8cOs8qtXlO9JnEoPfE/LLu6mFrwfDCD2w9xSNdbVnqTwPX4drjfuCp+d2
 M5J6tkjgounMN3DbkyWjs+pik5wHpjTJA3YFjsks5pvWX5f68zd01V6N1+7tIP5KTx4EshWEMAP
 ZOD+0WQU2xNsoDSBmTKWQaFBW93+/0qR0h/KgVB579bd3QQrkJ08uw47slgHcSmhNUrU9JxY6rd
 R0g6eqMbCIX5R/n84YmS0yjIq6ri1KjPWLH7p9ZnSW+FCW9WHw/8XAOgqdaVyWQaKtmgIid1nZR
 7xGCDS1PA+Jq/49dfIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX7GUlMebdiIux
 HpT9p+oXHYPL9EZi3knPpUqsCOLYExf2Ul0cnzWplF0ONtl/2MEOy0eUx66qB/ob3qpPSRu/hOo
 ynpdNUzN3TIj70Y/YvNs49N+t0zJEcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 9:33 PM, Anup Vishwakarma wrote:
> qcom_pas_stop() unconditionally overwrites ret with the return value of
> qcom_smem_bust_hwspin_lock_by_host(), discarding any earlier shutdown
> error from qcom_pas_shutdown(). If the primary shutdown fails but the
> hwspin_lock bust succeeds, the function returns 0, silently masking the
> failure from the remoteproc core.
> 
> Use a separate local variable for the hwspin_lock result and only update
> ret if it is currently 0, consistent with how the DTB shutdown error is
> already handled in the same function.
> 
> Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
