Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C31F8691
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114499; cv=none; b=f/ot+weSEelObwVLJKRdzDsVuJxv99SVpmrdFA//PjdU4BeUZ35TybKt0vp+DUqTrbcw+TyJFjvEBKSSMqClkZLDkGLs6WHLPm45RVWYy8FgzAKl4D6EDaTgnW68WPy/k7+oaxLGxpAsSjKOOxW6WpOJtLntqWQNjfmmolMGX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114499; c=relaxed/simple;
	bh=my0Fgf55/x0oPgqdhFZtPFG0YVdcZeXfcXqaPyFSNLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9bqrkHHw3DwYQxX3dBFarZj84rFXajxDz2Yd6/mRSSSV9hPSN1DYf0j9UxeWFNdXEHgDwBBNNATM1eFP3b43xqE42PzrlJTxUJt1JZSuPD4glderPAYZvY81FVw+T0hGhx1c1kNOB2HxusvqvmtUcciH2Ty3YSfOcUv5LwQdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3LQhjVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPxwOadG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3LQhjVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPxwOadG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7lFuL2803663
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=; b=e3LQhjVYm7cjByMo
	xBLFl2UWijbc9IncNiNhAf1rk1wCAQwuAOCI3wiRsO4VOay73xPGoUhHh6lWSmU/
	SHjqmft3nj9fS2G/XBSs7fk5FKLDNyZZFACrKuZT0FbRr+jfbySkFeAjNKdshZDG
	xZd39EPJ2/yfcna7woEUocJz52maXaOxQRxQGVEi+7oNB37cYDw4G/lw3vRGQNq2
	aDs7CoVX8DXoVIBOy6xbXtc9fUUwGMaN5gGirPC7Qih3v5deToCXtUToc8jKyjNp
	G9mZPeURFwYjCaPHqOGSxGRlpqqQfLCQPtOya/AjbyxJZTrH2idDXoIwju6Ab97l
	+HdcKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729hk4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so13078985ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114497; x=1789719297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=;
        b=iPxwOadGwqxcqPjLj3HRDgIwb80llXYbUuMK02O3JVZu3m7aNsH6YshR6YGhH9CfxA
         KuHodvJ6eDWBmP6n2lCv+cPo5YqC1eZEaRB4hteZ1HFjA80ZX1WPfSmjlMBbohIM/YVF
         aNcZ8ur6EKPpLMOI7bZk5aQGdJeUL1bPjFJgsVoufarqUg3fLOO0KA1fAWz8irORgr93
         Oq6mx8qEZKOV1ese8unl2fJPx4ZFOGNyO7dtKAbF/fSWdomNyHpDXgo2iGVAR1Bloax9
         iGeB1fcmaCX+8L78OtFwuGMWDd+aWLk9H6rj7CvUlkn3gUDLZWbWETVG0HaRYQgl4azP
         VJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114497; x=1789719297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=;
        b=q3id0rNOu8RG4I8Cu4QtdcUCLhWF6sUVnSI15meU409ZEzNPygR+ohxkojFY4sGLrc
         clueHIFvnVjNHAbkFxVzqDvVEwPBN6N4BVSg3ZL/Qfrv1nM2hg9zPsYX/emHPJElZOi0
         jdCz8w+O+CdA+wQz0bIsmVEkFimESP7MbMWbpgjNImbJpT8nTdAj/L4E1iHPAd0bYU9k
         /X6l9buxBKBeaW+4hx9wEyUMWrqo4eDlGo8cwlbgxUj/okU5MFKdEUgOptofhCHHOTv4
         GPUguGBvlPH4wnFZCle+qTB//m53wZZYeMr9Pn5yXugeMPCOlAayCC9MZIJ1TkTJFx6G
         tE8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+wiujtDXihMYe1KDVsP6n6wl6/6nANDkJ7RTHgqdaeJIus+7cjxw9cozpKmhFl3eTQf6skMpbrzA64Js=@vger.kernel.org
X-Gm-Message-State: AFuF++nnIb7U4dO+/6jopVEORMHGOTRSF7ZCj9SJ22mdVHoq37ii4FGH
	J0yygSVnZUVMqJngza8dopDdpN/Vo+BJc2y2L4wnZx6anyjOkaDhA9sOcHY6w3W6i8gWgv8V4tC
	v5NB9jjVdtNEQLmcZgZ3gPJCIlknGD7IT3L7VLxNhZYRl4vZGSrXVbk8jGyXxiOyaTMQ=
X-Gm-Gg: AYBFou3pMV8G6pf2FOs+dcKVQDw0S8R1XBwPIW/sHdfv0fdExXLqLhyG4KtYRwuwaU1
	jtvZ8PeJmxIzKLCG8rTOxAJkEzW1tHANR2IQbPC3YfxkKbOr+W73VULxt2waUKdKPhbb312p7op
	8YxeQ3jjdPlIIWztZFm2sZfw9iAxnziVHQdQ1qkQQnzZms+YdImMWwGifaMQVY9I80KSFHDpcB6
	62lyFvvzlIUB2RtM2wcwSByM9GcL6zuW7gvls9Vh6LX57zlSxqKr0YSY0sfCHm2FXmozy5d8Z0G
	gXzkpKVMZ/XMdSNTxA2qC/RkU2b7GssKc32qWdLarRPrbThUkIIxmZr6HGSXrrrl8QZAYHyIjTv
	zAbyqbFf/41afFb3enxyONzgtvwxn
X-Received: by 2002:a17:902:dad1:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd2a33fb90mr60084535ad.11.1789114496523;
        Fri, 11 Sep 2026 01:14:56 -0700 (PDT)
X-Received: by 2002:a17:902:dad1:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd2a33fb90mr60083845ad.11.1789114496021;
        Fri, 11 Sep 2026 01:14:56 -0700 (PDT)
Received: from [10.218.20.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm4340213eec.14.2026.09.11.01.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:14:55 -0700 (PDT)
Message-ID: <9a0379d4-8263-4688-8a39-71dcedf6da8b@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:44:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
 <aqK0D-dnQEi9cwCA@baldur>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <aqK0D-dnQEi9cwCA@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNCBTYWx0ZWRfX9h2XewoDfdLd
 xNtqhQs3z629WSFqz5WxeKN5TwO9VV8O5fy70TMOQSZPXhfmi7DKhZTwf1JOBFoC1BNGk7/QIOc
 KitdxGbjYQWuRG0TJaXdeC8gTz6WCHU=
X-Proofpoint-GUID: o74PlOyWbOxAi0z6bAAtCXOah8anpfaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNCBTYWx0ZWRfXyfiXn4r73LMN
 zRZSeucXrq095aw4k1hoLsRsX76luPyNkGTmOAfgihLjvHe9Ph2mfvJTREVtFdFYKzba9+NCdBs
 56WTR7eUjn+i7Dp4UOTsdjiae9NTsY+8X4B1xGGEN+rP3jXWw+S+oaMjLbx5JbwoT+foGYGgWU0
 yn/Sds/nlV5LRYkOzUxFtcKJVNHRQLGPTGXV7Rvm4snyCPU65HU0svIBsv32vnTugQZCIGQFy1W
 ah4F5bSD5jz1tKB/qI3n5sKpjdbtfoCdlTsHerob8yHLeTzHiL+fa8cFtUs0cyJdYvLp6dOrWMi
 5Ev1Ay5KVgUHFBEM6IDDu1+VVMkFRAY42PiUv8wZEoDfGlWadCfivfhZ8v4blraaOxy/xvZd+4I
 bhD22u6CCeDTtSX9Rn2Lp629svuzRAm14/rhR/JRSAkhDgPFqOy0bc/c14N+B4xuM+BUHCPQQ9C
 FuzhCrJpa0ptNozxljg==
X-Proofpoint-ORIG-GUID: o74PlOyWbOxAi0z6bAAtCXOah8anpfaX
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3b881 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ig1NifZgnZ2dU8V163EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110114


On 10-09-2026 19:21, Bjorn Andersson wrote:
> On Thu, Sep 10, 2026 at 02:23:01PM +0530, Maulik Shah wrote:
[...]
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {
> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> I know this follows the current code, but CMD_MSGID_LEN doesn't seem
> like a "fixed" part of this message anymore. It seems rather that
> there's a few bits here which denotes the CMD_MSGID_LEN and the value
> thereof is either 8 or 4.
>
> If this is the case, I'd find it cleaner to define CMD_MSGID_LEN_MASK
> and then just FIELD_PREP() to put a 4 or a 8 in the "length field" of
> the command.

Yes, updating v2 to use  FIELD_PREP().

>
>> +	} else {
>> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
>> +			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
> If I understand your commit message, this line says "on DRV 4.5 and
> higher length is 4 otherwise it's 8" - but there's no way anyone can
> read this line and come to that conclusion.
>
> In contrast, this would actually say that:
>   cmd_msgid |= FIELD_PREP(CMD_MSGID_LEN, 4);

I will update to use FIELD_PREP.

>
>
> Also, is this really supposed to apply to DRV versions such as 5.5, but
> not 6.1?

I will update version check in v2.

Thanks,
Maulik
