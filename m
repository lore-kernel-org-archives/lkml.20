Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723603;
	b=np0pc1CWPjlHS0h3k/YD4QcCUMSRdgn4e2wlb6YSyIetlKRD1XTwwe5eJ1xVkK1RKpP0
	 uI8RP1v3tj46Bkp0H2PjzXvpWj0QlLbi8fQ0Y3n6/0u9JsvWwhy3+JWlEopLH1j7D0MvE
	 0eUxKPxkPe0PCsfpcnTVMZsbLDcmDI3Y/jmRCRWafekTlnXknyn/mo4z+pA8FmiUEjxyl
	 QqNbyRJpLxbStC3Fp3VWjf5r7HOQN/vtMbAAq9pW297mF76vcGr4vILnxOVniat07r5jl
	 FHAKxS4pktCYSnQ2ciG8EGQedlSkfaZh7bpnjtpFqWs8pPPzz5uYm1mNfu1vv1AuFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
	b=iUIICxp4MuC8cjef7p5LQolaGVsbhCRJGT4tCnoXG1z2v2uYruj395ZaF/SpEwEuI0RT
	 tpEQUgBLXbIDtFQ10le2skdZFqr8WL93JO7xId6p8wSml3utJtKMrg51wLU+blRq2e6mH
	 G4kTrE03ALVt4gqa1KnwFWRdNdy3BfsGnvmZbp+eHQn8U0gpygKm1kXK9X9uP2BdwHoiJ
	 ihyuUSw/nDVoFXZEfSXcy8CQn0PgGZTkuZLjtbFoJmyMDUiJuP7IsbNuYf7TIAFGQ2tfe
	 kRwjTT7mesQ967H+WizvpaOLHHpZm90U38Etq31gqU39LYAnlTpuJN+dCq6zGgxiwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjwuQ6tS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcZJ30C0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9E606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD9E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjwuQ6tS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcZJ30C0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9veh2526760
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 16:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=; b=mjwuQ6tS/VigZEq3
	ogxeCgwHxzhqzyfJV4CTYOXLH8FY8s1MqudfValPEMNThuzrnds/+rtXHbSiYJ3x
	Y1uIfLy+4LM7PhoodDOI3wPU8NgBQEenCPvUZWTazR9+FBt9xyZPLedZ+XQ5+fLW
	CTY9qaiJu9SvfXB+MmHKMj9JHj2fBmPKE38GdLGIjZd0z0LbX/5bnNzYGRRN79H0
	wRQj1c+gRehu5a2RnjhzjX2XEDiqelUyaH6tH+B6YgGvTSQBiZOC/697CGzjPJWO
	5QGvoF8uEyNSjvha2TLgLPjUOBhC161Ti7dv6aTXwu1tY91TUyQyIX07qVEGo04A
	ntxq4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycu0ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:33:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so790225385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793723601; x=1794328401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
        b=gcZJ30C0/lvQ0so9zvM0d+CAht9HORPywW0r1gbKKqn7iYPJmoCAp6O61Tudf+fh5G
         eln9rl4F36s8Nr4B3dX3k6TWrOSvtMnTrCq5jA8E8uPpHJ9ic62g7ORLcEgHhOgCJ/fF
         XmruU8JXWeMnJYn6zHAz9qCGDuY63EFQafwTRfItWiXuqri1WHDOQy4B4XUwuDJFP6zJ
         QHY5irie1ANacniLm0FgMGbYHho90KXfBG0wXNKvW856i8DkpKVywTQB+PP2QpjY5wwu
         JSm9fke3AvZdcWNyBj6wsdv9GNoPMnJGWT2yKFenpiTc4BBhibnP7Jkf659hpVYDKWVi
         ZMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723601; x=1794328401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
        b=hx8IHzxRxgTdxRePVQjTVxieE/ilm9i0/ICtvkX6oOaA4rRbVAw94Ni+c5YqMYJIdz
         x1bsRKYO412iiHXheSxhbu1w5tBGSxZz13fNqp/5AcH472BQQmJbq3fVk4hFLxUL/Yzy
         t9CRTveA8QHdV34YCGi4zzw7YhW0sNIHj8CUzZ4c90HOME2XohsuQMZb9T2Y76q8UAwO
         duuk1OyJnfAx35YigGhQaCq1vw0lQXibvBJJ1Pdy7DqO0rSXwajq3ZH0bIzNsebXqK/N
         VQ9sAoJUCGcwyjpgbK/Y07d1paRPhhcjWTl7K8bV4XQYnbfN/7ENmBGxyG9aYKVVyxjD
         8T+A==
X-Forwarded-Encrypted: i=1; AKwUvBwze7OafSR3EkWPEOQU9Wl/fSqXwJLz50Gh60TaF5c8EElHBs0nnC025xnnDF8r8/ssbJ6irF6q+jwZrVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g8D51gydpccI5FBsCyFmdEpYh5VzEvlDPFtgyZaP6hb+p6FH+
	9tOQICWYxguglw7uxGRXAvqzMr+QRO0UlR6gyJ/cSC57goifQlSFjVuAuhs+z4Yf/i2qNE7TR9B
	FJR3ek85/grSDDFgEBDlAhCq31F/5oTaRXSuR0PfCc+GElSXymzWvL+j9e5lEprLEde0=
X-Gm-Gg: AYBFou0gSh7a7kqzmgbfbstwf4h7IBZJBpDVbAdfCBQU3dmMulhzDOw5Z+rLnwdwyRe
	6yUsu6k6LJGNr9DbasHTNrMOTCzAgAQ8gEVsdQ3zTAGTwhnKHdSHsWzgSPPx55ff0MmpjfVxnLQ
	8BQxwzG1N8zDoQgVSLqUPfnKnj12eNAsujIAieBaualuVoL4Kie+7wkx2B71UqplTI74I7NcnIu
	4tDxYVMX74TtoYmURhC361WJBEsAXVFxOWwtQpwnJjZAMHaRD1mfxw/WHplNQlkqgaHHZh3VSrg
	vKqOw8OPrySkFsfBFoNg1K+wic/Ot/yd1zvwv4bPb7aFfy8hK44c0X0riXQiCuUjOM7BqsRNOUJ
	ZU2ohvEFWYhiCDPu4TUunNHGXZSdry2h8QfhciEevJbEkVweWWNb9zkiaUNPaO4GF8rqs/e61FJ
	MIKpq6MzJuqLk4vSnLaRJ4uWJKAzt9o2BF6w+EGEJzBYfF9wUFn0u2VNj6D/tlE/4ftxwsa9144
	TI8xrj64A5bfLg=
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1008661885a.75.1793723601223;
        Tue, 03 Nov 2026 08:33:21 -0800 (PST)
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1008657185a.75.1793723600734;
        Tue, 03 Nov 2026 08:33:20 -0800 (PST)
Received: from [172.16.20.169] (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3dcc9sm101883766b.53.2026.11.03.08.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:33:19 -0800 (PST)
Message-ID: <2f6f80eb-57a4-406d-a041-8602805c7647@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:33:18 +0100
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
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
 <atYZXRLf3YPZhiNB@kernel.org>
 <8896d867-dfba-4d63-a0f0-5686c572b262@oss.qualcomm.com>
 <athuhfkfGPZp_YXT@kernel.org>
Content-Language: en-US
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
In-Reply-To: <athuhfkfGPZp_YXT@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6aea0cd2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ma1MJH4ChwW9rezZrwsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cnweLq4tjcm_kNa8sQSAQ5htyGEnnRPc
X-Proofpoint-GUID: cnweLq4tjcm_kNa8sQSAQ5htyGEnnRPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NSBTYWx0ZWRfX8KyymOD3dloz
 voHY3kTeg53u/+IU0fziUm5zX/avP7SgsGleU6Wc5u5ImvsIqLmMA/173jfKw2OvbqY+NU20gBy
 fne7ERKQvFx4QD7D1TuvdGdNe9RUUkC6sBiV/u4zQKrKemWkXw+GOH2PFVE93bqeX7fAZtl/qL5
 sf7Vnb22J6j7myD91AAIOdWb+aeuzZcPtXsMjxtkfBaqtFTKyIzCPRTDUgo3C6lYZOXCBS82vAZ
 z5Fi/ZdJuLZXNmfNrth5mbWYWsjCMsM9fKV1Z3/EkB3HYtTqpobdvtQR1z8RP+T5nMvMYCXvYTP
 IIyJkrqCasRK/LoUb8ilKHUZqLmpms5aXyp02S8LkDN00VDV7Gxz4qLlfVDpxNyzTnjmE/Bqb3T
 NdPF+LNMkHg8/cDtxBZhJu/ne9MlgjLOHFkJyaHF54LQdT/uGEi3/MgBQqaaPV3NWJsioBY3Ifd
 atFVGD+aHcGC8vgCfvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NSBTYWx0ZWRfX1VolOUBDMW7P
 8d21aody9ChZLpQgiAaycJn2Ij5WcCrbaklO5cagiY9r8pADJzr2tDcLNnb22hJHC1dEegs0rMu
 rObiLdpt8J4at1KoOU9aNr8s4+4fAvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030065

Hi,

On 21/10/2026 09.49, Jarkko Sakkinen wrote:
> On Wed, Oct 21, 2026 at 11:21:33AM +0530, Kuldeep Singh wrote:
>>> Applying this pulls tons of TEE patches:
>>>
>>> Applying: tee: qcomtee: Track the object invocation context
>>> Applying: tee: Add kernel client object invoke helper
>>> Applying: tee: qcomtee: Allow object invokes from kernel clients
>>> Applying: tee: Export uuidv5 generation for TEE backends
>>> Applying: tee: qcomtee: Add support for registering QTEE services on TEE bus
>>> Applying: firmware: qcom: Add support for TEE based EFI-var client driver
>>> Applying: arm64: defconfig: Enable UefiSecApp TEE client driver for Qualcomm SoCs
>>> Applying: tee: qcomtee: Register qcom.tz.tpm service for discovery
>>> Applying: tpm: Introduce Qualcomm TPM driver
>>> Applying: MAINTAINERS: Add Qualcomm TPM driver entry
>>
>> Yes, first 5 are tee patches prerequisite for tpm series as mentioned in
>> cover letter too and this series can only be merged once Jens can pick
>> dependent series[1] in linux-next.
>>
>> Since, v7.4 merge window going to start soon so i doubt Jens can pick
>> for v7.4.
>>
>> Jens, Any plan/timeline you are aiming to pick series[1]?
>> I see it's mostly reviewed with no other relevant feedback to be addressed.

I'm sorry for the delay, I lost control over my inbox for a while. 
Looking at [1] it appears some more is needed before it's ready.

> 
> Maybe it is better to pick also TPM patches through your tree when
> you choose to so that this will go in-sync.

Yes, that makes sense.

> 
>>
>> [1]
>> https://lore.kernel.org/lkml/20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com/
>>
>> -- 
>> Regards
>> Kuldeep
> 
> Br, Jarkko


Cheers,
Jens

