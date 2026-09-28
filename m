Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F453F4DFE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585898; cv=none; b=nhqvfp/znLL2Gi7hHI697f3BPKko2+pHoaOWUsKCNDAhr/G1VG+T1i058mn4hMLtVYMBAT5kxqSrPemjWPHcFVhLVjF688EgKTBzUZ9/ja1RbhN07lwMtvTBTeWQsxl1KIdIuPLLMLIP7kCTSp7OFTMvPpnGhY9txsoK3Iu6FpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585898; c=relaxed/simple;
	bh=QnGVPdRF5BQ4R3RWf2F3HmnJIaAinMYoLk7wpgpUFrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRJZVtnxSmq1PsjLMJvEjcXkJOCTvmToKF/nVwSOwYD7UWubMpugD6oIr3L+lyBzjCWLcj8Tp2orDVw+rjqY0qp+O6T43+QQbN7w8zVchVW7Urb/i/I3TeCbpeY4V2KVnQFI1EiG2MpWu/vULaMwl+zIamNab1LPQjuxOrlBSYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdZsHRNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdbYh/WI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdZsHRNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdbYh/WI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xqYJ361392
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=; b=ZdZsHRNw9uXfAL5w
	BozeSD6/zbQlWxZsLW0vku1sEm9hDelF0RNCJyN3KJ6ONYtgvwOOvfzl9wSplsZ8
	veLGugP65+M6rfmhti6yLfDuNItWwE/TQ/X3v8QL1wtt0J7JNTryAtK4CCJFngrJ
	8jEg1LRNAdwgPlJ2vREghhmhsZPvMcmbxdTnujMwp8E87R975UiUbGvUgjOvb/IX
	ah3zo1TqXcPwBgDCtZQ+Tfgz92+OLISWqLMifNby/LN70b2x31p1n2p4zuPhGSjI
	92jUKi+GZK3xxINo8FXsUU2gmSF0WmL/ODDb+7iUqd2yxsOkdhCu6gER8q7ihen+
	SuBw/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49nu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso5020191a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585895; x=1791190695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=;
        b=GdbYh/WIRUgEhB3/R/RdfutMklB9Ao/tTyoXHp+ZO6PD88NJHkFGP+an3vyq/6lCr/
         DCnIJKDiGXbwESf7HvXfdujYVfK37IZC4Xwl9orS2/7ndccO7ODycfH4R6Q8Ct7uhjO+
         rQsdncehxZxV5l6z5QZwpC982x5BNSGpVd14oPU2O48cv16GA8tRWDsFc9Eu+wfHahR0
         ctRQXeWyHt0TALS+tkHMTRDA8LCJSrkotDtTwI9z0rziX1KrLy5xdKglB6BNCnujR/hp
         TyGpwVM8U88RbbRdyQY/OILI1OF+Mj94zIHgsHslQqLZiIsyv7yrAfD5KV8ojw1Y6juw
         QLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585895; x=1791190695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=;
        b=TEhR1wZPA3QF71E3d0QWEEE0FZwKJjYc0aU1c0MWy6jTgdGkz24pORhkQkAh377o8e
         9pCA8wIcuT9ChCniq77jpMbI8y+F67g51Od7XK4TCWZ3V0wyvOvG0jfX/uyf9VLxVJeZ
         gDzHbKjXlwSoFCj9Q8mql1Qm7XdWG4LC1yOceMc0u/mDVXUt1nmtb0AgNBlEpEE4EAIo
         4HDGRBRBTKU7wFKhPwGFWjgD7YAZSV3harHZpqBeJ2iUwB9seO0asdMauIZ1yRV6mG1g
         YEWmeHkIIZ6oFB0Uj/ZeJTRYF4oF4mDWrTUaODBmd1MMfZhyGls2AySrrkD81zQrPhKW
         HblQ==
X-Forwarded-Encrypted: i=1; AKwUvByVN5mezl04JVh1HQb//X8AU4h3/WhvoNc+lNe1ctPmw5Nfzq+9doJRW88Jfk1dhWWgu7d77es1c2nk45k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJofsn1y5zslEd4c15UMPCJWBjn1f+Yc2OIWQqo7t+QPqxj4nyG
	XydS/kXaOo9BrPFAtHHwnCH+ANaO44pyY/hiiXmqsawNktggJBJF8xJ5gUV537gPlcSIlVjE7RU
	c0+20QjRWZ3Hk8LIZWWA5W2b6yLaEjq9+wBUpljFF27bxt9FOJeBKvNLNrU1nUGcU5SUI7gEyzQ
	==
X-Gm-Gg: AYBFou0IK8gdLuYoS6O/Bg8UB/rYl/cPlNfYo8Is142tMSryl9H/wV62vdp/PDH0UHH
	jBkESzRq4NCdOK5/eUL2JI7cYAyPY0W11bZxizCgirIWK0A75lKI3aFk5L+5GGWy4gaU7Rvi8L3
	lQRw9gjxkwvoAwYYbfzY6I75IjLqY3fNOVZgFGgDt8CEjZizJEFtJkXZNySveKAcIyL9jDUMS7Q
	OByOPJeTD+xewZ5ApHXdHH4Mvx64K0mW24s+N59S8ge4fHZEd8gIuovSdJJENZJCg5TTkH+o4zZ
	fF1cYisviS1AZ4NHSwVUd8z5KXZLXIm4PuQ2ec9fzHkle0D+iAGAypNxMxsNsfAhLzWMCd3aA6r
	vE6r8BxWMkhqPwbx3xXa9AtUo40P4CIEy
X-Received: by 2002:a17:90b:2250:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-3a098b4b334mr10136998a91.21.1790585895470;
        Mon, 28 Sep 2026 01:58:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-3a098b4b334mr10136980a91.21.1790585894976;
        Mon, 28 Sep 2026 01:58:14 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.14.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm15313374a91.16.2026.09.28.01.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:58:14 -0700 (PDT)
Message-ID: <c0e3afc3-899f-44fe-b865-a32892e00cc1@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:58:09 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
 <aqyX3lJ1eNBmzbSP@kernel.org>
 <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
 <CAGgiveUA665UFwoojYBOB_rvCh=3NBug-B8xEBBVNPC=0jTCQg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUA665UFwoojYBOB_rvCh=3NBug-B8xEBBVNPC=0jTCQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hsxp8k2cw-jOC9Ybiax6-RtWgzVJsUYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX7Bcqpjo8w6wn
 wVrU9un4HN7t9l5oFY7iqC52d+YomibRdyYT3MAKmbejcYehIWrEw0BwAZRGxxN1D4YDEZgJWho
 e2ndAj9Eo/eJfuqt6+TJ1ZqC7ujkXQxChplKjexggGEsRr2j7LCYzamIZf5pbqBNrIyVCLiBSuR
 d9bZUvpDrpNUsV80e+j6u2a6rhsJMDFgKyriQ8hPIXFc89czaXWeLfNepbb01V+gcfSCksU+tcw
 7+tbM1JSQI/nWnjoGX3kP6qWhukp9fJ6WcpNf5wHVJHTvnOk+NlkOsQFwoDW1ys8UCwr0UJ9Gle
 KXAa3BofgrgscS/4YferrzuHfZggs/mHEsLMhNn0WCfcsne/g+V8E+RzJPk9Hbr1QZWSKsqVWlk
 2P3JcCxrFO7RITT4Nm+9utcyiLlMn5RFQKHGZyoi2qp1LUbQSmj8dEh0ghL9FV4yP2Gmcfbzsvd
 qGurkPyH5Gp5asAQDmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX0SDPWOAqj/cY
 paXsvjKZWgW2RKrCGqfdLvTIpOs9TTcc41uCmARferdJ4O74tW6YO52rGjFZNju/12LCV1/uJZT
 ju9VJG3zbOtSKWWZ2diz8PNjgwpt5gM=
X-Proofpoint-ORIG-GUID: Hsxp8k2cw-jOC9Ybiax6-RtWgzVJsUYD
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2c28 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Pslwi5Fl4CR3OXkguhnOPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=aXdvgW5Kdip_ic-aS84A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035

Hi Jens,

On 9/25/2026 6:51 PM, Jens Wiklander wrote:
> Hi,
> 
> On Mon, Sep 21, 2026 at 10:10 AM Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> wrote:
>>
>> On 18-09-2026 07:16, Jarkko Sakkinen wrote:
>>> On Mon, Sep 07, 2026 at 02:58:41PM +0530, Kuldeep Singh wrote:
>>>> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
>>>> is enumerated as a TEE-bus device, allowing a client driver to bind to
>>>> it via its generated UUID.
>>>>
>>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> [...]
>>
>>>
>>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Thanks Jarkko for the review.
>> Can TEE maintainers(Amirreza/Jens?) also review this change?
> 
> Amir, please review.
> 

Sorry for the delay. I'll do.

Regards,
Amir

> Cheers,
> Jens
> 
>>
>> --
>> Regards
>> Kuldeep
>>

