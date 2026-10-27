Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116760;
	b=kEWQ5y+Zp+L2ADtmf3gor/OHKOBVh2hZjODpY0CfVl+FoKVBmwsW6S/HqgkQj3p4YVgA
	 fJGOU84CxX5A0ceEig+9vICiHvC0MSt1DECxj0MkKyAWmaplczHPM5Vm5SKZy6gC8hLOs
	 Q9Ij9mQejN/uWLbTIodnXXJ5X+yAQCxYvlEiNiU4plrro0eWcr8dB+WOuA4PhNcS3K8Lm
	 c1J+cX5Lllr+btkkM2iZOFB1RteGtldEH035tMxYFXz7HGjMAod+wPZ3hfszh2276tCx2
	 KQRXT26i2hFn9ordb56LcOXGEhZLpzQMJgflXK6kB7jAvX8pMJZAo5Gd/Di2LVXT8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
	b=oxvTO29KKyF5bBA+XiUSPLFl+bSBvfEqyxuMVqYW9hiEbFGSZl9un28Bvtui/qbcVJq2
	 Co7EMkuH09h2PnoP3ZMz/SxGawd84yhytraQGHTkBKdscSCKKjb0qZGDXVTvCvslCKMhx
	 KCRhPSlowyuPg2LGUc9r5Sx5C3OlibjqQygwm3GlcPKKlR4Vh2DBfCnEZToYX/66hK4un
	 iHP8dhDSVMDS5eClY4IrhESMX8d2jqg7s/QcmGKwr/20Jv5aayj9d4m3aBfb5gLO2lNhr
	 aTEmwdEm+p5+gkGBo7GXv8Tw8lgFYXPSRmSmQPWfpf4BbbmxXcTcGhaX48sxnSvbhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DJ/fLSvV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWLrXnyg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJ/fLSvV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWLrXnyg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvK72548921
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=; b=DJ/fLSvVDixTzxyr
	lhKnPF5a2zP/KnjzLh7Yd+DhvE2u2omuC00jIkW0HQSc9LliwxU54k9RyKU6Bx+X
	DE2DtIb6pU6UD022/Ez2UUo+x10rssW/zk/pIYyp/+rsh97IxLVTEcG7gbvWAuFm
	NERBLlZu72FhqP5sltVo+rPBY7nXApqFnysOAfYcHakBYsz9NETKTO/Gb/RS+qor
	25N2Ilteym8LkmynVKZCssGcI3HMeTkGqP1TwbWROqawGPB7a1vl6J2S7o1zi7qm
	4yGP1XOcNcO9e4BxY51qmcfO7PyER71cziPAtz6xO15jGhKM1BPki72g0Q9PjH5Y
	vbsSCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69sdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5362ce9df1eso144561cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116758; x=1793721558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=TWLrXnyg5jjbvuSwt969qnGP5cnAR4f7KumJ4//fvWtsgTU6wLmdXSC73bw3LTr93U
         VXKqh/69PDlxqDjNd7U6MXyfy9oqXiPc2gxa2UqqMbC2kYeQi4BaaGscgrgVLG3DlmG9
         LWyudD4aggc2uJZhcK8Eo/w5DXI1yZ0WlI+QhC5C6QdaXrvnDlZZSRH6PZBIaR/SeKhH
         vavK1vCJzMcSHtUEVyJrxHrNLlnIdo4bYYSH0AJ0WYjgkuZ4Rm3KYiNNl1WemgjoVe2e
         AcDyEAyVPiQy0kqeomh/VWfbmwbtl/pWWDgWqz99DM5eOFP9onLJz7A3dLqHT6p0pYBZ
         qSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116758; x=1793721558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=WlZNvs9f3hB8Vr/gBpIESG71SA/0S78HPxHkLRRyvvIrTDGSUhF6ObyV8MGu7s4tGZ
         ztfYXCfCYvO+uKJhcUFhf5orGPVOZ6dCm/Pv7sjvJL0N0LhXhuSg+H/+FBLGPXsOQGm0
         AVN8kg+Q7W/7rppZ2dtvm2LffB7roZin7lCVlsh+Jpqh048yNiJTRIHc+8SUSNoKuDlN
         HQXYOi6pnSqYZRQjfHH6Q8XrGn5JmtEZ9FgTqgg6P/2xkPmcFWag4BlVJUTX8IMNjmlB
         aE9ugiyelWdrbRdQt5svhS9Qpj7PsU25TsFvPOEuxQCrV/6GMywiCXvfOfTgMA12QLqJ
         7NtA==
X-Forwarded-Encrypted: i=1; AKwUvBzrMYT8d0s1OdvUmSsnSbCIqXg3dLzXgnLptAkK+q21aRG5q53gU0jJCjMIyFA3kyNQ8nXxvWpDCPbT9ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJa+G+xnl+8FhxURWmKzzLdx4BZO8seuuMqx+ta1Rix/g8IQne
	2y3VaMG69ovl4VNK3iwi4YJMDd0zCZbvRshMDmsGJ/SC12y96+jmpLwndF8kaonH844IvZdRnM/
	GcSzQz/t33+2qcpl6VZo/YHCBisp5kr1c0sApxtZYQhxfIPsC0/hWUODBhgLNjoCWv8w=
X-Gm-Gg: AYBFou0WKmhW8jHO6NzivXiQajWx5Y9M/Znqo1dZGzuC7rhGcbYPbmIlQeZRsJuEhn6
	GX2kVnuaVamDFcI/mWVhvLquxuEQxEvCdfum17fA49RQHlVV1rY85vlgLAhFOaYc0S44ZEUzWtA
	+B0jO1sLiVXskxR4vzesKb5HlSyDRv0/55waVj2A0PoIREPgBCf76CCJZeeQ1R/ktInKknFuSDW
	A1Ip/b04SJVxUwwEVEXkJ+bFlmU736B/M5QQncazKouzB9/W95+ACZrk8ULI+dhqd9ELOfknbzO
	el7zkfN1IC/zDHQmXb1utKwJmL/NWZurQcrmOKdyOD4kLntamjupQPh+kPTQAWsWsmSMkCsuIX/
	rBCcNndHeFYp6VQdoMSXWNQ==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564198885a.5.1793116757553;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564194185a.5.1793116757056;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:16 -0700 (PDT)
Message-ID: <b35f912b-2067-4eee-bc83-25028ba51b8d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:14 +0100
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
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Drop export of
 qcom_scm_mem_protect_video_var()
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ca56 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YO-PTOiLJedIpx-aNNoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: AVrIy81x87WlEtJo1j-IH1iJM--cnALT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfXyNEl2XdWMZrp
 XCmGnxa2z5zSwfYGu5FZzqYE6+4ush+wW9ilXsfKMTlqj/Z8sfnT6VwMLpJ/iDP6HwTRDapFmZo
 SIxdZnvpwNBozmVi4aVkRm53JMpT+6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX3jE8P9+rFuo/
 b0ewVtWsnK1Pyf340s9N7bvKw2Co71ddAl8i36MjFbl7FoY963Sxf+bvyy0RSjr1rhSkEPwnky5
 59V+6XkKTvX+nGEyUf8etwG9sG87V8o9YYZX2h3YJhWccj5GWCzqnkE+jVX+MPd0JEKY27jZjk4
 PL5IlNYI1HLsfv56sG2h3CUj6GygtOqOLHrJlj3FZZ/JiLD1nWAP3xSH6lhyrJx97zIZ42FruCg
 JwABeF0DzSOxUd2GcZLuaqBBZ/MQ9B/uX5tGB2/A7h7aslEBVgm0XH9/ljNi5Im9vD4sw5tzpr4
 iOwEtPfLcx0gmtE30A7ZxCKeZLZTVCuNxwn9iVyxWei5efPOFIPc/G4yugAnJzAW3pnw2cCTQjD
 +sWveqW4HUqgbsIQ8zUKZ583sSRA+bb4c8fk3zU1vcY9ZJRH4pG1GzQkwk3qbFYKoPFuW1o1fgO
 AgGOIsJcc73p8nTq5Yg==
X-Proofpoint-ORIG-GUID: AVrIy81x87WlEtJo1j-IH1iJM--cnALT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> All the users now go through the generic PAS API, so fold the SCM call
> into the SCM PAS backend op and drop the exported API along with its
> declaration.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
