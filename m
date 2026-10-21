Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561900;
	b=JKFfz4DOx2f6IbnjX7YH4R4loj15auI/DfJF9JObqMgEbLkxsntnB47SqfU64DKBbiUc
	 9JkH9197oar0o13dnRR1o1m6eyyTMIjQ2tPOYE+UcrVobNlTuuLLbYmWbFZ3XDG3e/j0W
	 lAikq2iMAE9mRoxg4dJW8W0xBW+rtrCXd1iqohvcxbIwaN4lNBz2S+EGfRk3wbUAzHV7n
	 WUCKDWyedrwhghgeQi3bbKTwxt00AYnQoHQujccdNHSuZrnmnyki9JfcajkGHtI3z4vEH
	 b0V2GWDE+ewClNhVr7Z+mhcCzJQK/r4uuDOG60S4XD4oHce1+/FnB2x0q0XE+I8YnCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
	b=ZOUSfO+QKY/6dbU62jkFsrE/m87Q8ctMdeppv3RcbNISzse81l1vQZtiubRi+AlKpfa1
	 JMtS8soL0DHjMeLxeKVOjWCVi92Pq4Vl8RWWj5zg9jLI5wu5znJuttq3ctXGxzf3zHrLc
	 6n5RPmnBgoMG5GwZORbMTLUTVWcTBaApIpcElunNoq4o3iSMI0gSfgeWHVpwYqwwWMpuZ
	 dlY/PeRQpF1QzbCCu3VCxE8UIva9yZN8Kxb6rGmQ7ds57ZCsOOVUJIFUa46yyJ/KaWetD
	 ISueCtko8OrJ1SJqlA9asilmZFyKT6rBlJccSpH03a086luKI27xiThlgndH0IfijFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYwbCZUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhkjBCvy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 707A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYwbCZUx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhkjBCvy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6fJ793352
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=; b=AYwbCZUx5ANMu15a
	n5Va1u/CwFM7vsswae82r7jxn5B+VXbvm8EHB9CcpU63AGNu5rCFyXHBDHkC67HE
	JbJN/YORUCvxlGnLTHIUA5GO8wMIHfh5dw9ZMh7iBHiQwuHSf7GGa1FzP0k893/F
	rl/jjGT8a96Dovyx72/nJzKg/JHZesB9zNccEjbOoMFP8rpYgwhmFSkJna0RUAxm
	JvkSZ1I7Qipimj1p/ePYzofvvkvptJFrGdjyDdm4X376tF6KVKDtGvAe0gv+RcsL
	WT8sgad1vvwRILmIRTthsVPqhRQ1rKZF7a53Z4Y8NNbsA8oFaTqS2tmiQws+jpym
	csXxYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabj7t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9d52f684fso3435795ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561899; x=1793166699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
        b=XhkjBCvyrxwBGAz5xP26xeFUIo2gc4mqrxsbi6hT9zWVvIfGIDf5NEXR/SpFbaFvtu
         NuKkDTC6Mo8UCq8oqq0MNggsp1fGN5IoJArrWCLQOzGanAXUdEunkGekp6hB7iJVrT6Q
         FW+qu15m+vYRp4OPvVJUshoagtaSMlXOLQuY4deip30YRVvLWqQf+2pWzUcGgmij9tZ5
         phXReThPW5jHkhILsMSX2ZQQ9z7Kak3c4Zg+eBgCCqoGyawc83Ej85d8n3ac7E4hFNdl
         y3hXoDSRrQZovmSGypdliBlfQYjhwyzWQTeZObvGXkYdB9rH4lGbVuo+8P38wmCZGmE7
         L3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561899; x=1793166699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
        b=KQRkE60MKKd2YG5KSxkmcCAfyrklPfAWIAmUGSUBmXsjnmt9Q0JE5LMv4BWMsy1VH0
         GWEwfZjwEjiVTCKsBeuS6/IzLhYbM0io3MTjFFZualIwXpyuvtBOtJKQnFIHnyFeLMBF
         2Zoe9WVZZDBDwpgPanr5TMjONBHELTLAVVjotVL/gFOjsx3A3vHoTN9AHPhiT7c6/5yM
         iglW1jIBAKl0GJY8q5fZI8mTAJJ/OB3n4fnL1Kf57kWUO8DCu/JSo72qPOrruzt1M7/9
         uQn3h1dCqeSKA2ka2voCoW5FoJCPFoULQASnb4a/m0hqlguQyXCoCK4t4oPxm/hXNj/P
         D5gw==
X-Forwarded-Encrypted: i=1; AKwUvBxW37oGbDF8lhKN/BOJYK1fTGwOwwC/fFEk/6LSREwo5gTy+IYnuq0Y8qCfGCVAV5ENdvqn+kTIgxfeLz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlxU72ZbwrXDZzq5fD5bbxwKCmQe8Cbu8iPY9xPJ9dqvoRGKhw
	dQOhSUFvvSuOQKbWBFMQxTMx7ZXaCeixRiLnL9cQSigSRzsTw7pRtKlpzsXM49nPIjIhbYelRVH
	W6FJ36si2frcBjnS0Vp5qiYZt0MyNicfVxOFL07kVLJI1o5L5iJyAMMDzhuy4NS+egnc=
X-Gm-Gg: AYBFou0Mw+YOpKjHF/tVNhCuCCi3jslmVaRgNV+GR9kjF2EDnsuphFfErvwkFbAM6Vb
	uR3ZCofIKaa7KYxdumzMVvTliyck4HjnfxS8J4R47bsoyXx5zBr57p2vAIR5b0+luIMuL6786DA
	o5I/Sp84xP8QjSma3iPqlYm+p84Oax3b5FXOIB12MJ3VOUEzzPofaA+x8zxy+hkVIgYPV11roU8
	toiFl0HVyAbP0ihS65e0v1VNAEsVQanm4n8V6Z6OzWViyEeGedYuqLC3U3L+/WjXGG4k5Dk9NOP
	/An+4KnxGl11tUTOImbBEZ8FvcD08au6gwMIh9ylTrPEg3VvXRFuN8dKvWFD+3qXHWuLaLnsJHy
	gylmjtDLio6r6s0a/kKebVk/DuKAQKA==
X-Received: by 2002:a17:902:da83:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea43d3a1abmr8645285ad.15.1792561898956;
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
X-Received: by 2002:a17:902:da83:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea43d3a1abmr8645205ad.15.1792561898506;
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm6217035ad.69.2026.10.20.22.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
Message-ID: <8896d867-dfba-4d63-a0f0-5686c572b262@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:21:33 +0530
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
Subject: Re: [PATCH v4 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
 <atYZXRLf3YPZhiNB@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <atYZXRLf3YPZhiNB@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXxD6g9oyUXWrC
 S0HkuKnM/P/KnHaIhqYd009p5lhUUOIUzvYozbPGiYoEgR8+HTQ5goO470gMM4wiWcewAzgmqB9
 YHCsaPCu+MTkyNw8n6W2f2wNiEbhWPc=
X-Proofpoint-ORIG-GUID: I0v7r-Sl2twxgMs3H0IhJaYOwRSr-xaC
X-Proofpoint-GUID: I0v7r-Sl2twxgMs3H0IhJaYOwRSr-xaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXximzZCWUl/FY
 HE40DyTZ67nSN7RoMn0tdXOA662g03cfY/y5btZ8CxYmY9iih9bG6tsdi/CC/SH7RH7su7HRTzb
 qBy5PQ1f5EQAnIr/dwV+IG7iCxBeGAIHjLm1ZH2XMMy7DwRSWLetLORWC159cPPQXc5LCRnoO+9
 zBcVvENIGBF6V1ACOP9JgwiCOrjACdp4dXTqy8DbAtHmcwqEfPVGs8iUv54J/lqyndmsyZ6yFJU
 TgLt1BMrNX1lf8SPjZqLIDAhuioYJ2GKDycOe/L0yiXAwzRIp7FiDsz8mJpLDRas591BwUqk3HF
 xnttXAqz7C561cMdYRUgY+xcwt5fwP1Wiq9IYnyTcvCZwYdJmlG7mCX8FVbX/6SOfNJjIPvkVfp
 AR1oL1kNVNWhPY+axq2lBvDnAUFWG3jzhBGSN8TskrGyS+gzsWnNsmtg1PjPyK8eSU+yWqyeeah
 3QHYzBi/+fjc1Rwc0PQ==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad852eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JNtoCX4LS8KcKRon3YoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210022

> Applying this pulls tons of TEE patches:
> 
> Applying: tee: qcomtee: Track the object invocation context
> Applying: tee: Add kernel client object invoke helper
> Applying: tee: qcomtee: Allow object invokes from kernel clients
> Applying: tee: Export uuidv5 generation for TEE backends
> Applying: tee: qcomtee: Add support for registering QTEE services on TEE bus
> Applying: firmware: qcom: Add support for TEE based EFI-var client driver
> Applying: arm64: defconfig: Enable UefiSecApp TEE client driver for Qualcomm SoCs
> Applying: tee: qcomtee: Register qcom.tz.tpm service for discovery
> Applying: tpm: Introduce Qualcomm TPM driver
> Applying: MAINTAINERS: Add Qualcomm TPM driver entry

Yes, first 5 are tee patches prerequisite for tpm series as mentioned in
cover letter too and this series can only be merged once Jens can pick
dependent series[1] in linux-next.

Since, v7.4 merge window going to start soon so i doubt Jens can pick
for v7.4.

Jens, Any plan/timeline you are aiming to pick series[1]?
I see it's mostly reviewed with no other relevant feedback to be addressed.

[1]
https://lore.kernel.org/lkml/20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com/

-- 
Regards
Kuldeep
