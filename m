Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60594949FA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788363; cv=none; b=mwWGd5cEO2PxdMahsI5mTqFG4VdLJXwS1ntfqhivEJw7L/nzQX/myk6m3nyRJ/rCR6t3eNTA21LD6b6+hhvDMOVBfxAHJ6yd0kUPtTdP8Y0e4camtfoUJ7Zvnmz9WHDnSlXpQ2dZpp0zDNia3lw3AZ3yPgJhj0L9hZyMND8WvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788363; c=relaxed/simple;
	bh=LuoUpMNshQ5t5idHuLjWLOPZmBgbq2ucZ5M7HsXdSsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mq0u507sbtpkmR/TlLzKad/3UvaQRXaPn2Ii436H56R+vWH4d7end59Oegr6kZkM+eujqEU2xR9STgn2i/+bRFiAwoUqdm//1LYDE2aQXynpjoaVn9Zh10agtK/FamIpHTtDKE9HT2ZmAkc0WwbMC3SH4DNAuDRQCUhi7+6B1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcMxJJhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUqHCYk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcMxJJhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUqHCYk7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKai376668
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=; b=DcMxJJhQghvdxWJi
	Tk+FWZE67WMGXYylw5stS+Yt6WvgpXD1v9e/5yP0Q3GEDupUy3TjWkK86Y6gJR7u
	XYgkEkT63u/sqmHyp0ju/wzf0x1qx+DOv6La8QzlyOfRiSYc2N+j6kcgyOl1jgFT
	vHAkGJnSEviXjPWfSum+PBHah2REvWgKr5eSWrAR5YyOrLJjSycmjeaJdS6DLADY
	QgfdOskRmAIw4DSAcYJhN/WeEjZ41otAoUwVyWBVBUvonzITcziEjG+qVi9NntBx
	1htNsmCZGyHKClaEg3IAW0M4w53HrEDGeHtYxb3cTiIbN47636msAM/at6koH+Uk
	BWnl7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg17uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:39:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so6096960a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788359; x=1789393159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=jUqHCYk7LB58iIfT0ZBT1j8rofwQA9K+zgN21+2uJZ0UdqZ/kRsyVg8PL6/XNqL/hp
         XlrvB08FGrP6sptVfnKhYALTTljJe1QHAeaZWcokKOrQ+c9JJyyBY3vzq+uPboTAJwIJ
         kMnjUDqbal+fzp6dPfqPB3/tIrYgp9RlyqY9Wwn/5kWYU8c6F/zUvtzAKGIgmWEtIkF4
         lMZZT0LyjDGu+tu4RCBN1x+ufRGqnUjnOkjLQPtzHQWp3hZ3lfPfBykMXcXBeB/6i1mX
         Isho7+lgwM7F3yePOnRxHi0iE8DgiEEAXFea7oWTkDKQ5oEKmFgYq2yPOylEiZi4wiXF
         65jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788359; x=1789393159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=HVtIDbxp/fJzVJIb4Dq4pd+3CTuY/6s8zidQSktkx7QJ9nYHW6BAGrAJcZpCObS881
         u6Dnj7FImGq6ZaIrYm1FTVra6Q+vZHS5XShT+DfXrdQXcbronl3ClNifYMAQsjXnf8ZX
         Lt7Yw/s37j21hoy60uvcK7OIgbm0dDL0zJyIcDf+JJ4mIfW2BX9IAql11Dv4XPQ4BhT1
         cKCcB6V8rMYk4A+PhuyTWm4vga6bahuiuZZ/OW9t7n3yAyGK1yNvnp5K58UDolwVlHfc
         kzOgDOscqBJvjMhYWb3fDmgzifSuU1v+bflCwvoZDhMRXcn5BixdEYE9qCdqOkLMYd4U
         bEUg==
X-Forwarded-Encrypted: i=1; AKwUvBxJxpwTm9NiyQEwAbpOob2L8zrXP30NVjJqJWGg/gWrSgMN0vR1RanDVzjh1pJlKTLlc3y+zVCg2cHlNIE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwEGv0a2y8CACX+16DOdY3iCvVhGZHrIkvwuJR5QVY/Gu1VskR
	kvl/LioqE0gOOgnT4SIxX11pWV3C5viE8uHh7nmL+5i+QJ6N6toF9QG6exJrCu80ghFK3NK7O2H
	aK8CIEntwYolbWcs+xy6RbpDpMWsF5Sy9p2mIKGLzzhXG7Nj+DHVBJTp5EbB44Zj40fE=
X-Gm-Gg: AYBFou3HLnKFPwYD/h9MgJN5IvsjOZjvxaWi0+T84Q9TLDnY9t9nPRH5wW2Qe+2hPYy
	zbWivudQ4iHeAUOAM4ozNHIRaQmUQYdlCJQdOd7LM81DJ+Zoc6WUoqzD3mEIbSDLL8I+sxETt/w
	RbrUBteM2ndEiXxnGf123sp3NrkcXc+0kWqbMDxZ6eSswuAyURXyqQezwoAo60sNoAAgXKrHWwW
	bfOOHECzCoz99ZAgsgOIhykh7SbBKFYOSIcwlFvGW8mXSeaKq/Q1VGj6t0FNd7WC9thWhOMk7gR
	lOc8bp2jSZlYLXhrF0HDSvfSmmW3SsvOCEv4agqA0/qg1CWV2KXbY1CuR+VLdfPweapUwAtl56i
	OJh1Sdu0esWShIfBuIzyDQIL08KPqtFk=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905915a91.23.1788788359411;
        Mon, 07 Sep 2026 06:39:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905857a91.23.1788788358993;
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm32726196c88.5.2026.09.07.06.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Message-ID: <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:09:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX4RdO489NvcLL
 d9goDS3zMo2f3GBG1KYMObzM4ja+TJGvDcBaEWHlQ4bS6/6ZyH1fEFbomwldWJqEMxY7Zdy9tNt
 cPisrY3d2qCDalu8u+8z6AJfUzcFQy9Ss/O8R+ssxo8mP47L/qjII+HkgMHUJcsIMsbwEfo8cjQ
 o1x12ZXMfOPjnzHz5e+EBHaUDyXwvNNEJj3OBlKcbW/3OePQE2E4MMQUl1eLvJeafT7K9Ux8l1Z
 4EPiCB//u0IW2bBHZEqY/vYfHcnYT9LLq05KJN3RLcaHW7kqRTf5Q1Y7e8Wi+kXBdvfpT6HBF/U
 y1ZkV1TxC2tZQNhanXNTTpiZBYXd2+Enk3rsugPoINMu6495Eup3n/TetKcdc5XCx0MaxGLqGMO
 wwHEUI72eSgxuhudh4ieMPzb1s6mNJseVGLS1L2XrLvNSSJPbgACEfaKhPKeUMH7ULwXdBHldQo
 r5WMZBJ/bV89fRhWcuw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9ebe88 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9GsNmjbEMOpVDnpVqTcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hqRjj72NcFOBtjuvgHbfd0nwN4MgSEuL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX3XS4W1gdMwt/
 7KBnKd+a5n67OqjIz4oABfx4lFG+o2dL8w8OvRwPdROhMAhkrSAu6BzBD8BNEUX0L9Fk80dIY/4
 utK2rWdAxDfo1c1ZtjEvZB9a0Sm0Iwc=
X-Proofpoint-GUID: hqRjj72NcFOBtjuvgHbfd0nwN4MgSEuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070151

On 07-09-2026 19:01, Abel Vesa wrote:
> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>> Shikra is derived from Agatti and uses the same QCE integration.
>> Update the QCE node to match the underlying hardware implementation by
>> adjusting the fallback compatible and related properties, including
>> clocks and clock-names.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> No fixes tag ?

I was having confusion so didn't add it.

The parent change is in linux-next branch and not in torvalds tree
currently.
Shall i update Fixes tag based on linux-next commit only? or not needed
at all?

-- 
Regards
Kuldeep

