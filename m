Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626897;
	b=wBNomh/3p4t6iwhSuZ3Zzhew45JHBqq/LwCusTKcGYvBbSuSLJe2oIuLrxHfS5hhhg1H
	 E2/3BDvqdKUF7A6BnH2Dvo6H+yQLZ+ssNg3GG0K9i1RUFlK36eYwTI0b6xKZpuALfenzY
	 pm4SU5tW+1MzCgZU3ufXCdQidtPlufxPcM15fioibrotqljQVXGuAoqcsOKi+eDvZunMR
	 ivfOidD70nqoIDsdGbGJaxFc31sGSAT5lMKkdVa9HsztM8k961kxt9rNvrm+STnDU3Wxg
	 xRV99NCmXwKZpQ5OGJkycrZjdcmizTgjh6OYbfCw507FRRrIyboy7qBkE3rz17DcQ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
	b=XICWtJdrb++A+tnLfoCWz3PSMSbvPKL9CcApDJ+y20sALZMGNQYplIMiCaFtC50h1mm7
	 YzM8Uog4SzOP+tt1IC+5/MiZzbL19Lh0YMm7kJbXmLk5VXttYO1vLoWhe5FRTJiwdgY0+
	 1wmCGYS0qzyTeiNip7w39FCiDzARb1tJKWQH5iyeskHRmXKfXFZwEMhvda18Tkj2YZp1J
	 O5SkGBRnluy3v3SKJOQRlfzMWTZTh8oFldIvnAYrVuK8tiPr6DxZlyiA9ZJHQrPbnHW5s
	 nniRDB+DQXVXeHu4X04NMYMH6v5O/Nz0CwinwWsb5NNRA5O8UNk+ZtwqCd/7fOlAe0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nu9kW/BD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhhZ7tu7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4F606A919
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD4F606A919
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nu9kW/BD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhhZ7tu7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAO6D3973520
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=; b=Nu9kW/BDx7zBAKFG
	f12o7NKAt8AkTWlmTjT1ZCCfWrQIzowQc1H5FACyz0MlwdfeDm4LgQMYR2gvpbmj
	HbueCW1cV1awmTe5Z9WQVTZ+T1Kjrp9TweXelnFHlGgotbi2ARwvhfLm6cUz8rw9
	OVg7WTkQmKPhKLrNy/jEIVunAYNxbRBYd0b2C/ySsBgxPrY6MQYXmlBV4YIpOoVI
	poSsLjUkQZux90kC/+azzqzBbQKP38dV1JkNlMzuYM5hm9FY3kI3AWQ+ymGKLsSa
	oShV0FoMFWwZm56demoKcXCcIeyXcRokNqgxFIncsqgSFpDCWGxoq9kTsBnQSTch
	GHAgZg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesh38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:41:35 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-464fb819ac5so3243784fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626895; x=1794231695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
        b=YhhZ7tu7wOYvx8H0L8MqbuWVptq80HHG3cmaUFn2n7UcsZuVQJNsoOjapi2mhUV6a/
         Lql+1PF8j/yLsrPvUMPD8e9iEH041MbCkeBcajXP4/Sq1X8y7O/K/ll9rFLEnt7qVrYz
         ZbjQEgKqB0iYWrl/oec8a8W0WX2mBgwJAnFFUZxCPAGtocFi0zxSa9RZWKFfJFz5qOh6
         tH3zU0D5tCGPhvS7b7M+5AHG2IvBIXll9z499r1X8nWHSTuggh2MVyq4MCpELRzTO6Pi
         XQM8fF7DoRzKw+qD/YlqLfjhPFNoWJjH04QTQiUCxFoA+3tdbbQ7n+qBkBRcp1kN6Zgy
         PgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626895; x=1794231695;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
        b=OG1+B8oU4vAnyQT9tlTtcTU0JiTZf0xzjwfi3vGgbKmkna3XrH/+4uvXoMGM+/dEJT
         K9B+CIy3azEcPEbiISCOslGLnIAyOnjTBRtfxFF3NpwP8JjfwoGCUm734yrsuN0o+Ixl
         XRX05qqI64Tw7D86NBHabG08rlFonK5Svg0lbXaPtwy+O3L89yY8+W8DXo0rP6nLCMo0
         Eo2EGgtfNKzeztKIDaUKO3smYlbXKRUIyPH7uVCX8xWl62cVTQH5ldn9o2ThnQFsldar
         4chdvu7c+iuyoFN32OJGUv1DJdSM0umVjatJh/4Oo359bIm9xP3IAzPzNA7HnbSHHa8i
         zEXg==
X-Forwarded-Encrypted: i=1; AKwUvBznB9m1Qr9aYpQgC9XnGni9cuTjWR7nCFDqDPXbuOq+h5x6sWg+AlLIc4fxEG6GzqbBfMwG0NKKpum9hR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOPfkd7pSUhUQtFCdzJzq0aq9kXyRlhBzofP0NdUjifP+jLBn6
	vzPvlN6lb+Njyb6wCr/dIuTvdmzqpiYCzk7cgwC8/QMnfO5m2kNxtOM51xM0iPolwHVttKg13WH
	wM3RNWjDcbJT9v1SetGZm6HPapVSqWC+k9dZFDZoEzYOkC3bAgAwntkVcTL+PYxnAIVs=
X-Gm-Gg: AYBFou1xIWhOMqXXrRY/jF2mGjzGIy6VqLBQZ5oilpkOQ2hWhKzXzK0MlFxNzVIcHJ5
	cwKf6KlT9Uh5lwodWrGngN4LDpwQKLW7cLQC8IuJcpMXGG/MW7Em1Rj79ah5hRSiWUmFjhTzWdn
	wfmoIS98kBUtkklrN5KypioH1bpb6bXS6dc/6iuE2CHyg3XC6klTZd2n2khf3YAeO1lK1sbzL2G
	5KE7zU2OUOUm2KOFfAqgzEIt/knoHEsvPeHCb7y3nfHn9OXgA75ISEoSLzsxLqCXIM972htgkhf
	LGZDVb4HgFU1ftVspE20RTwKmwAVCkIriELcStKHYY4Jl7hSTs9EJLjAzog6yXyeSkfql3BzH26
	BNh06I1Hz0LM8MlGdquv7EPpH+EEr4bcaiMmKZMvkh2bFJEH8/yHITIORM0yEKN896r0Ja6f41g
	==
X-Received: by 2002:a05:6871:1cd:b0:4a7:424b:934 with SMTP id 586e51a60fabf-4a9076455ffmr6067088fac.12.1793626895316;
        Mon, 02 Nov 2026 05:41:35 -0800 (PST)
X-Received: by 2002:a05:6871:1cd:b0:4a7:424b:934 with SMTP id 586e51a60fabf-4a9076455ffmr6067072fac.12.1793626894848;
        Mon, 02 Nov 2026 05:41:34 -0800 (PST)
Received: from [10.92.207.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921a53b59sm6647163fac.14.2026.11.02.05.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:41:34 -0800 (PST)
Message-ID: <e618a9f3-6a33-4dbc-a15f-217542ef28f9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:11:27 +0530
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
Subject: Re: [PATCH v5 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
 <952816ce-3e37-4628-8308-4208b4359549@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <952816ce-3e37-4628-8308-4208b4359549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae89310 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JrbDfxSjzSyu3ErrWlQA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXy6Am4T8bIjwJ
 SMlbC2t4mO9HMTgZ+6ILtsupiHmlGo0yEfXiNzuxeyExGexQwhULdHLkwVShRilGQ2FrsWQOxwN
 i2o4mAhzyhi9HARnadeL76bef17CkepOds1MhJpVNZwdz4/tWfx7KZLJZ2UB9nGv6s7cTi/QRqm
 3g+1tm7TnZsPFPWb7eUWU4QvBZTN1O2KB6zY7kjaM/WrIE1S2GwP2Noh8X+9LyJN+5bdWiNNxMI
 9hzefh58g3d5+ONwtQiUyUU/sT9TYJXNJ3/QGMlxHJBBIoMQkmqqb0I1i/BUW1CkWuf+AbaKKBr
 XAwH/2/40EiKfZerHDnVQgS9QKl6SuomowA0sGADDMvPqUK6EfZcF2lZnnAUmSaCCwyedNwSeyj
 Jl0jle1lHm57J/XZPovOqxdq8gzZoeAu7uuigQ6//uywp6NTKUtD9cNdjz4SzEtHkfDNZ847HM/
 c5QElYjXB0qUSLT36oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX+/oYwV3vRbGd
 B7DWkcivp7IHdmYZTTF9NZnQGdbs+cDkLMm+6EcWj6t7G1t1/2vjPvFcLojoAHfxpX/S8VDjFig
 SXR2GHOW4dDetSXlg+G46Ud+O8SmTxE=
X-Proofpoint-ORIG-GUID: TlzQUGZ2RFypkB9vG3NKAX2QIojlOKQp
X-Proofpoint-GUID: TlzQUGZ2RFypkB9vG3NKAX2QIojlOKQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020054

Hi Amir,

On 26-10-2026 08:45 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> QCOMTEE currently treats UBUF parameters as userspace addresses and
>> applies userspace restrictions when invoking the root object. This is
>> not suitable for object invocation requests issued by kernel clients.
>>
>> Use the kernel_ctx flag to distinguish kernel client requests from
>> userspace requests. For kernel contexts, do not mark UBUF parameters as
>> user addresses, and allow permitted root-object operations to proceed
>> without applying the userspace-only checks.
>>
>> This allows in-kernel users of tee_client_object_invoke_func() to issue
>> object invocation requests through the qcomtee backend.
>>
>> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Same here.
>

Ack.

Regards,
Harshal
 
> - Amir
