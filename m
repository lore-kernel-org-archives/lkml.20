Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C74E325C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890198; cv=none; b=H9FUTOwy78b0tsnubefSKSpSNyialKbCPs8qCoU7tbmqeTC+WoTgBxe2ddv6k+dTec1z0nwYZJ/lIlccz3rlRuaIAV1TBWNfc3CSX799dB9x8FLrEO1EzsIIPkIgeBkpq1igqDNDmgj3pnvwc0xDNCb9oyMkY2576rJ5BNxxNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890198; c=relaxed/simple;
	bh=yaThiMfd7pf9ddNJffZbSCzlP3CJbTRx6QNmps1vp5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFpucOS7wQFyYB7DxlRDj96U8ICG0nFQij3GDS166bLZGwUJ0Achx5aM6bMmvQUJUrlTB7PftZMFDHaS4cBjDzDdtHkdCkNdzsJznC3NJ9NGucw8T+wWYMxC7VO6kUfp3BjJKTX8CotRu1c3uL7PNWjGX0iQekDSMa0xcCQ5uq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brvcUbCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwECeiYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brvcUbCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwECeiYT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8E8SG989018
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15xKB1ZHhTj/xhEzn/smC2+p9dKTzJ28YlQufyIGu0E=; b=brvcUbCtyewUkrkJ
	0qqLdu8UhVD9gVcBYm62sVDjYs5DqiZfZktScq7v3+jihlVRs8VDCThQHwQQjbov
	ATLd8oF0F/q4s97xtZsjJH/gJVonj4ANXrQZcyVQnQVSqMI3oyY8runxc3PW/68K
	7fO6Mdw7hoi+bBn1RAQ0vTRkcZbp1xMKTNec8NuH4Oi3+R9OaymKVXm3PNpAgEQp
	KsS6Wdiu0D8lryBMGFtXNdnmXcO0zyvB7nrvUUbvBFQSNpLZBTL9MN0x/QgcB4N9
	qnwMU5EwwUTvHDj1XKLDcuYW3Mns9Cj4wzayqznzCqYwa76z48lD4iaVpObE7N9i
	AinV3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcam84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:16:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so26269785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890196; x=1792494996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15xKB1ZHhTj/xhEzn/smC2+p9dKTzJ28YlQufyIGu0E=;
        b=EwECeiYTG9SSFJ0C3zIZKLoIS6t8W4r/cLqwj8WhKBAie0jQLnwRbGxna/NbT3JIF0
         jcToTFrtU+PHEK6m+7wjnpt/emzBvYhEHGeRsZNrZk/RgGHp+2lhzOZFsn+iu7FXxkS3
         9h9sBRoR9O9Pqt7LR2hv0KI+8gw9xaq/h7oIXuKSC6LOtkVOYVx+m0sg2ieaiVj5dLzH
         nCuIQ2anJxkGtPGZ7ZFpiBb7D5EWmEdLrR1RRWwmlJyfbEQQLJIJUZnRSrzCyTc0loEr
         JBIWy5pXo+porTlF/UkmvKMwbASF8khq1QcPQ/hRuZsfhDc61pjab95HZJCBoEiC+ffB
         TiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890196; x=1792494996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15xKB1ZHhTj/xhEzn/smC2+p9dKTzJ28YlQufyIGu0E=;
        b=LCT/qN37MxWnbNJn8wtysMx7EdaIAgtom75JgUNzXXpOG7Ty/7OTLcIOu6v/BN67A+
         7EG6GGSPp+gUS7c3lzTfRb5Q6DCmq6Ao85lzg8epAqPVdFPmcLJEG1sBaRQ6uVVZjz4n
         36iFgehiUNQOTtGVFdUydnuJHgGBdBznmbzRv5TUn4B3KK4Px/lDdyfCGudrv5wunjUD
         Szw9xf63/RnJPhF9EMgUuYYc5varGWHRhsApokDj9OV0HufXmgvfw1iYRcZPmywGQDGc
         iQ0gjJDeXGwPHOJDQR580qnFYHwxGe0Z9UrhxsLwqifUvG1uN/0Q1+slDuIoZyNSlcwB
         6GgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2Hm0toZ8I3LqLIv4CJPHhnlSQp98GjG+sy26LbK456q0IoNNcrHHuMGJ9Ypk9kNt6bgV3EKHUIV5RHyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJElfpM3y7DF7NMRhy7xr4NXnU/zh/GZdw2Y6O/yBTBArTEY1UL
	9zdsxYBGp8orUXFUmui1HFLD2gRxQRxaRl+kHJB8VvDtpVLuVpRFlswc47hE3HCPnVDMLKkdJ9n
	mVpfaCWf4Lg++SCJ3Q6VHm7H1HzFnnPXScfVsY3t7ovWySDbcZD1iY92if7DMErFsaqsZF2slPf
	8=
X-Gm-Gg: AYBFou2eSqmBzSeTr9puLoTFW+tgT2jry1XBt+rdAdEfV98aPRaR15INBIjThI0vzul
	vkat0Bv30I65m0rRpQ6UxGpRGCRce1glJc8VaDbtRoUp6h2uMJAnysYjWQvF2Pbsw+R8CXwERrP
	6wsMMwf2qlRYJkcgUPulLNFf7Y9jjTxdMRngwQMqoucu2cYZFSUqhmKZ6dQ8hyvB5WLkfrqz0QF
	2rOjvMIqw0EHrpR+oFUusjA9B7cp9L1DT4nkqThcnj4D9/DR+P0zkcTP/4rfZ3TPaQpfvk+RGAr
	vsWJOLHrCQYPon91BE3rlFc9qOBhiIPdiMqiWYTbxOlRr5uGhjIwt941DltM5tSVQWB623KFNO4
	NZz8SgWHYGybvxwFVoYOWOw==
X-Received: by 2002:a05:620a:6f95:20b0:93e:ca50:d712 with SMTP id af79cd13be357-93eca50d86cmr1215671085a.1.1791890195540;
        Tue, 13 Oct 2026 04:16:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6f95:20b0:93e:ca50:d712 with SMTP id af79cd13be357-93eca50d86cmr1215667985a.1.1791890194996;
        Tue, 13 Oct 2026 04:16:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7b976sm572363866b.36.2026.10.13.04.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:16:34 -0700 (PDT)
Message-ID: <778a3d18-48d1-4d58-acca-041e9545f38b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
 <20261005-rpmh-timeout-debug-v1-v5-3-7b9c457a191c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-rpmh-timeout-debug-v1-v5-3-7b9c457a191c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX83zYYyTfhcbY
 69MTx5d1KwEqxrMlNDjk7BnTe5MSS0o9PP/iFVw5mn05lJRsHqK2yeiE1BR9DF/wO77CcDWJFN6
 +b85Us5e+iMZGvW1hvkNrq73jlzFuRGY/Oi62FxQh/SfgzdhXhrN9xOAeQQTRbgGcI/gViSLZFG
 4EHqlinXwSRehHeGPlUJdtUJ65dKOCulp80TEGyd3h4JVwKtWIJ4zZS/Pk6YWgB+3Q2R7DPjK65
 VgoseIWk8bP9PgD3ECm9h/8qIpmKjLYxmu+mkc6KeJD6K8NdBZzuw5DkxHRD3Ot/GIBlN50YeEz
 3QGBthPXSb3+2YcIW6/3iNDO3qmWkAZzu5m0wOO2JkKZAAv4J15ZrzHLJe6t9Qw7E9ZRdhbC1hU
 AVe8yFnKGzVnZcpUEzWqR/7+HQj7Fz9wr6gyEWxoFrj8iCCCgVKFc0gkXLdYPTBlzHwk0GIPaKd
 iWhko80eBjGUj5BYa6Q==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace1314 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=LpQP-O61AAAA:8 a=K7Ajrmt67CcmCc5QVwoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: IGqpHgx0JVQboNZjDfg5d34ZQv3EMnYH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX13WMuyPEMDij
 NVFxGa3ISaiI15dfwTgj92cSvEOCqpXPBp2pyClPKh+Cuq2kuaN4uf5i8d6gwRzTyFzKzh7Q4L6
 FuRkL9FY029O4ExBS8HY4c8voAP3mOc=
X-Proofpoint-GUID: IGqpHgx0JVQboNZjDfg5d34ZQv3EMnYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130044

On 10/5/26 11:11 AM, Maulik Shah wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> When an RPMh transfer times out there is no visibility into which
> TCS was stuck, what commands it was carrying, or whether the
> completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
> capture this state at timeout:
> 
> - Iterates all in-use TCSes and dumps per-TCS control register
>   state (controller status, AMC mode, IRQ status) and per-command
>   register state (address, data, message ID, completion status).
>   The accelerator type (ARC/VRM/BCM) is decoded from the address
>   using cmd_db_hw_type_str().

I believe all of these are valid concerns from an LLM (4 maybe
less verbatim but the point stands):

1. The diagnosis logic is wrong in several cases.
else if ((busy && !gic_irq_sts) || !aoss_irq_sts)  -> "AOSS did not respond"
else if (gic_irq_sts)                              -> "IRQ pending at GIC but not handled"
- If the IRQ is pending at the GIC but aoss_irq_sts is false, it blames AOSS instead of reporting the pending IRQ.
- If busy == 0, for example because the handler reclaimed the TCS just after the timeout, aoss_irq_sts stays false. It then blames AOSS with nothing to base that on.
- If the RSC IRQ status is DONE but the GIC shows NOT PENDING, no message is printed.
- A clearer order is:
- GIC pending: handler delayed or Linux lockup.
- Otherwise, RSC IRQ status not set: AOSS didn't respond.
- Otherwise: IRQ asserted in the RSC but not seen at the GIC.

 2. Unlocked access to other TCSes' requests.
- rpmh_rsc_debug() walks tcs_in_use and get_req_from_tcs() with no drv->lock.
- req->state and req->wait_for_compl are then dereferenced.
- The request for another TCS lives on some other caller's stack, such as DEFINE_RPMH_MSG_ONSTACK. If tcs_tx_done() completes it while we dump, that is a possible use-after-return.
- Taking the lock with spin_trylock_irqsave() would avoid blocking in a lockup scenario. Alternatively, snapshot only the registers and don't dereference req.

 3. The cover letter example contradicts itself.
- It shows irq-sts:WAITING, a command with +resp-received, "Completion is done", and then "Accelerator(s) at AOSS did not respond".
- "Completion is done" at timeout means we raced with completion. A command that already received a response contradicts the AOSS message.
- This looks like the real consequence of issue 1.

 4. Uninitialized gic_irq_sts. It's only read when ret == 0, so it's safe today. Initialize it anyway to avoid -Wmaybe-uninitialized noise.

 5. Early return when irq_get_irq_data() returns NULL. The completion state is then never printed, even though it's useful on its own.

 6. TCS dump when req == NULL. print_tcs_info() jumps to print_tcs_data and prints CMD= lines with no TCS= header, so you can't tell which TCS they belong to. Print a header in that case too.

 8. Include order. <linux/irq.h> is inserted between interrupt.h and io.h. It should come after iopoll.h.

 9. drv->irq assignment. It's set after devm_request_irq(). That works because clients are populated later, but setting it before requesting the IRQ is more robust.

Konrad
