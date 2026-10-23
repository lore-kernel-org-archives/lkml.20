Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743218;
	b=Y/AZi0YIfQ8u6xG353BIwMsDmjcjbg89qJJ96xUpyYRF+hniaHIy/xsfOsFjHqaABYQ5
	 joelFEEBn8kR7Y46KubyiyDzweK3Mxoaav7C//kj9AsQ86WaZtAy/NR0eg/L7NGFF1E1L
	 CZTVdcNh0kGq6cqGImUQvHl4rhSuiFxIlEDl+tx7WBtJamzi5tmDmgXw+bB5HnKQ45j1/
	 soblP5Fk4tJSyVJZevdq844H37zXlKl3H5Wi+GGYeAJjGTT0dWrD/8dQBlzHzBk8Yebfw
	 CSeG+EqRyXemLPu6ddmQlb8dD1trisf5co9hQ5wPEqeZVc5owNe9sUTtcObTFoNNo3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
	b=OB2TRQ8hPpI9kHG1M0gu3C1j/dFBPCnGW+iWINDd8WynhPs2yjfMSf5cYwPyIVlSiG17
	 GEC+vqEpUgJosDsIY2RM59apN+w7q1zEUKLxDB0Qr99s92Er/SIrHCHqVxSg2Q+NirW7b
	 qsMF+GNrurFbDa3d3Lfao25EK+vEmEWNvGOMM3SVkOPTsKJ/R4BNoySE4wLLjrFUKPqII
	 3TpuHgpDuXngbMF+6Pup2NflBe8ADtNzSLwYSzaPxsd5QLwwDPadkL0OReYZenJbnUy8m
	 m+1nR84LnDOCsbe0gT4aM4pGsBX0FgFP4ymqI2Na3t4+1H3e7vLgLcMiM0jI4POwbeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHATfJfj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcZpvE5W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C9606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9C9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHATfJfj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcZpvE5W
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FVqZ588202
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=; b=lHATfJfjVwc/n1xI
	Fq5bTkBZGf8usRg/UOewz83RDXzSqmwUREWgpNUmEA4rwpK8AQ5B/iirmxFauo5l
	T4ELnwXIhbSzqQ5sbFktZNEHIFOFIQfhwn02w/cliaI7ezT1lK+S0nEy2s9r3u9z
	crmxZsLyVxMNNxEMKr8maaAVRRr9saSLCd6Vvw4vUnE8NtyuSDsBoU/L7L+Wd6fw
	50LE3njI2BrwrZWDSxJxaKOwLVt8lAYOM0Mc24dnvUKcd8DwsJlD9f0RX+IXRQS/
	9hR6dKo5NMoNhJNqTqOF5LvN5gcXNzKsWVX9NBCBFhSd042/HX+nB23kVK9/RZnl
	a2Fp5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmat53s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so13925385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743216; x=1793348016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
        b=dcZpvE5WQsS6Cu8SqubR/JkWJ8n0oqlL1iy6sb4eOO/afmNAh0rkL4wzFBcq3X2OAT
         BJaGPH/qv5bKa3zwopCFjd+O9+da9XQV5w3YRJn1NA4n/gYvuMvhzkId+kNkAO/yzvPW
         jP3DszbrsLZR0OMhdcJ1q7/AEy/ncOsmi04q/ruevKIQ2ds/gg7WH1AgWWMdKQjjLuIy
         kfQo0MyE+kiAHelfT0RKtutJHNtU1JG3WnX5sHA/hFamwGTz8TgZuz+T2y3+xk27y6rb
         lGG30qSgekHHBGkxgmjScPc0ep6jsd6kZKNKTX4bZGskrpQJ225y7VSyS9q6+WuF6BSu
         /a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743216; x=1793348016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
        b=Ci3GWIYX6fRhWPkMwy/jfm+rYszjXB9gLElS5eXz+vo+6Nmwi38xmPgLwEPRgSNngh
         6gw70reW1g+/Rr7iaSCoAP80qgzjhvDii63tsae3Luqy6tPlqL8hUjIhoj2aTzjwCCYE
         FoxyQqShiR5srr7C4ievOJF7F397Kq67QotT1ntSwmCQSuYUfuWlsqgj9PA16xUUScOO
         2S7AQWCNjwxkcHbFFJsvsa4Si1evxXzo+1TUp/c6c9tkfo+HH8JPfAg2UhCqUhOTgOQD
         voU6OIsqYz0LcOa0ZIpH/6mrre2pxUNLVLDNxXbK9El2jVXTrEWZaMWwt7gz+m/Ajo03
         iKuw==
X-Forwarded-Encrypted: i=1; AKwUvBzFHSE5TpavbvTSo0r3Idg3oUgRzOXXOgiRu2CYeONh4IB7NhOdu3aeH9kN0lfNO8KVJN6jClErMjC53J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/70vTKknHDFho4/PgcOVmi9FYZSDhu5ZVW/V/edqkuaq4NsJ5
	nYWnU81C/9P/oRz8jRVs2OPoCxMPeff87Ia+gSlq/nrsgAKOndQVPAkdyQYl0udzLboEZim5h3Y
	60zKvWETGVxHgddnfE0ezIYaGH4tPq7Mf0aXxel2OnU1Lanyc62lL7BPzRNMZXlJuLqA=
X-Gm-Gg: AYBFou0aUgF/uzUPWy6Y8r4jF5NROAMeGmhlRLhrFLYOtUIBuvdKHMW2GkoJa4jGuo1
	Y5LhuA4MjrCGXYSKk6baRPFG5NwKYcWBevsoeJHs3cbkWr87jZQU2ijjBSwZxMLeeeMTXI9w29P
	mxVLZ7+2gPVBrx7OAdbgVwFjvFbnC+QXZ+9GHGYsM5706GcmicuNhe1Zg9whv9jz4fWl5vOptu2
	bR+yYoabdtnMUCcyJcx6IysNnn/ZBl1ncN6p3AAWejPTYHERwWG6TjRbvfDH5YjXe0IioE7LOUi
	tSNqeoNKwYeNapU8wrr7F/hBgybODSx1Ft8EKvE+0mJkUjQgcZ+DKGRj6DTwiJw5PL1DD06UrHL
	Moh7ygbR/NARsmQmuoDlRmA==
X-Received: by 2002:a05:620a:90c5:10b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f6f7d8a2cmr297173085a.2.1792743216457;
        Fri, 23 Oct 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:620a:90c5:10b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f6f7d8a2cmr297170785a.2.1792743215985;
        Fri, 23 Oct 2026 01:13:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b378b3b8sm10988766b.25.2026.10.23.01.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:34 -0700 (PDT)
Message-ID: <63cf18bc-5c89-4a55-aa15-2550dc47c155@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:13:33 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
 <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
 <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb1731 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IjCPCkZtk2ssS8GsjjsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX19hJh8j+WjK0
 zpkR/wD0thh+FP5WL/emEpgMqE51ONqYM/7UqCwzWuBGmgMIqxnh77XmgqnnRcuT/akZzps+Jfa
 77vJhGf2UvTZ1aPQVgUqL1AyLJ8yYsc=
X-Proofpoint-GUID: h9-CqbeDU037NVgj2ksPDL4pNPAya_IV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX3B6RBkdiV1hj
 7OmYbwx8FPdnnXzr6I4D9EfQFncH2NvnLr7Ht1zCEtPm+y2GJupCjNZh8K4J/Bm1Gw1fozyULMW
 pwJ2qk+UWmW0+snTJIExSdh+u9jBN9nJK+ObbIyaTI7SSJdIr78bA3xKq62GBonuoxg/OsZ9H9y
 vkrJa85r+/uPOaJonYkPbsLKatMRz5vIALBbJzq1yUhPFpV74ZMUJyeGCYRUXt/th4HLWvKqU+I
 LFtjQ/VtxkN6riPmWFjp/bOD51HmW1hgqBrdZV27BCpySO9Ihp2HojIF0rwMvbEPy74eQALos4n
 xUKv7akuJBhlNEscSG3tQYjrjozJrS0xrH6a9UyBzzlNbfLmPszCrenPWkm+F+ULcfhIc4uFGCu
 M86WImpmQ2BBdVxQB6efzuBFlv6SE6U4tCvb9rtBZ7v7wMXLQW2wnpSorg8BcDUrq5wFjrdFTls
 M72pXybitFMxj90DKzg==
X-Proofpoint-ORIG-GUID: h9-CqbeDU037NVgj2ksPDL4pNPAya_IV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/23/26 9:52 AM, Qianhui Xu wrote:
> Hi Konrad,
> 
> Answering the three questions directly, then what I can offer instead.
> 
> (i) Downstream kernel sources
> 
> No. I have no downstream kernel source for this device. What I have is
> the prebuilt Android boot image from the vendor plus its extracted
> config, so I cannot statically check how their QBG/PMIC GLINK client
> populates the battery property buffer. Anything I said about the
> downstream side would be a guess, so I am not going to make one.

Did you try reaching out to the vendor?

Konrad
