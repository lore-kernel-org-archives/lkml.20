Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706600;
	b=ZAT9OnD7ORx2yWD0OQfD1Vd8RBc5x03O54ID/jvmj+p7UbqdyFPKv9Jk+dpehO6Q4GV+
	 p04nhwmvdZIV5WmcKpQsz5ySuflkFnnRna7dU3AQUhyBj6RDn/1oomPS984B9181s3s/V
	 Y14JcuswBakQ9GpuOGTRfe4XNKHEYxKOJkIYAn4+joqe5bdwlQWUyqn0h5IqugwxQ34yF
	 lUh7C6S6yT381voSFj6ZZAZLi86zpyuqyV/6qt20gF0AykIyxGUwCbB60JCJkbBJoPQzj
	 9vdfEjsPzcP2B9KvjTwkuV2YCmaup3gRrH8deqFg4n5jy64Q0NHUnKtXdNuu6c2iX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706600;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=bEJNobkf5Bk1Y1QijMpLcalz1sa0H8ECn2Kx1OBOkHs=;
	b=X7FIlte2KLHMVb33CLlk989BfnUipM3K4wbnlZXP65JPo+dKmiwqc0cmQGsodoOdUGgh
	 db/cYLFM4LFl2A21aUrb4AXPdSloEeMT8l8SrCk5TOIB0vrV3kwYH9pB79Sd2kLWFHwwz
	 bVVDZmMhX0aUnFsBgQGtsnNs/Cr12D31lvD4hx+m9T47hT361E29L9hXiTjAmGA/9Cq25
	 gEul1FCzA39sCozyWVbmBWoTjrfU8bbUtFVqaw70FWURBq7Wzw1Bwt0n3TBLgypS48Xpn
	 8KLkgSSjGwdZOQvNIGSecRtzO3l2ls9v1AOr8QuAtsFMhDLBS0ffPrc0FKPFbGahWlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dxdmail.cc;
	spf=pass smtp.mailfrom=dxdmail.cc;
	dkim=pass header.d=dxdmail.cc header.i=@dxdmail.cc header.a=rsa-sha256 header.s=sig1 header.b=kKjRMICN;
	arc=none smtp.remote-ip=57.103.74.93
Received: from outbound.ms.icloud.com (ms-2002k-snip4-11.eps.apple.com [57.103.74.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CE6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dxdmail.cc header.i=@dxdmail.cc header.a=rsa-sha256 header.s=sig1 header.b=kKjRMICN
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-4 (Postfix) with ESMTPS id 2A28618001B8;
	Thu, 22 Oct 2026 22:03:16 +0000 (UTC)
X-ICL-RepId: 01a165a3-d0c6-7cb0-8e38-8e699bfd075f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFBHV8DXhxCDFYCXwNLVxQEFlIOXx9yFEEcXgxeBxwTWlhVCQoPShRUGVoBGQhRUEsbDlwHS1oVVRcOAkIfUB9MFldDWhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKD0oUVBlaARkIUVBUEVdQC1xUEQFPV1QORlBJAUseWQUIAV1bHFBUGl5QQF9JAQgFDwRJCDhXFVMGUxlVVlAOCUtGCUkdDg5CGEYfVCdXAloKWx4=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxdmail.cc; s=sig1; t=1792706599; x=1824242599; bh=bEJNobkf5Bk1Y1QijMpLcalz1sa0H8ECn2Kx1OBOkHs=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=kKjRMICN4G2BkS76OjWUaJsn6tWU8WJfG7lUt/ssz5v/nP+t3P+Gx62hQLwVAKlxYnkBUldEldvfsZujEqxOE3cqG/I9rOBznmPcFIaZSiGu7JnB15JqeeadFvyOsNyTxN4ZrP9HfqVxnsexUh1ntlJ6TvTlcZdFV+fp7GHwUQRhgVK7yRqkZ+RHPDKK83E2BDxM0e3C/oEZOSPY39poH+OvjCtST9nxxsmgRvL0tKvDBuuxANOOHSf7ChOp35TfyJ3r6KJdsB9o/TX1U/Vq89b/AM0t8hJLy75bewYlg2F5FqqJStln5IOfEC9D7MjvnxkfOtp58C/RbGddqU19xg==
mail-alias-created-date: 1790174225171
Received: from [192.168.178.181] (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-4 (Postfix) with ESMTPSA id A4F8B18000BC;
	Thu, 22 Oct 2026 22:03:14 +0000 (UTC)
Message-ID: <7fa87d99-b983-42c3-bdc9-5b0f12e2d691@dxdmail.cc>
Date: Fri, 23 Oct 2026 00:03:12 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
 <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
 <0b829c36-ea7a-472f-85b2-c32ca8121047@oss.qualcomm.com>
Content-Language: en-US
From: Nizat Mikayilli <nacht@dxdmail.cc>
In-Reply-To: <0b829c36-ea7a-472f-85b2-c32ca8121047@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXze1FQmJVf5g8
 ee/F8J7J9u4RaJHHN7tbEjERSeNG3GKdJCm0WIuElHMUENOxauNh5YCHRqgnrnRrETMnN/p6AlN
 i447amj0LWVNw7vV7Ejwkoe/ZuQOeGwBBy9UsxyWjDS5Jzs719xM7IigVhfmWc3njCZUNswiR0C
 NsB1rqoJUcr5cSEj5YYRd+PScJIBC8yrkcjJ+4PS96QJRRdUlqRxkFL3H0YgOVpTRHcG/dGCBDl
 h5fOk1K+9rslDuAj5gUYdA9s27SU04WhbyvQWY3NHyQi9SRCBoKqwD14H37D+TkH8wxEwCWI8sp
 oSH1lDe8HFhCXhJ7DVctGjRLBlz/rSwjbUct1Pp0XJZiVUNmkVKlBSgEMJCaWc=
X-Proofpoint-GUID: zpZeXfd9GchTtDONKEF566G8d0ltyVzR
X-Proofpoint-ORIG-GUID: zpZeXfd9GchTtDONKEF566G8d0ltyVzR
X-Authority-Info-Out: v=2.4 cv=c6SmgB9l c=1 sm=1 tr=0 ts=6ada8826
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Yll68VBpUeuroiOh840A:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABSM3wAAT10zkvsNXerVJATqfulcBuXVSiysHoDF+IozHXwKMeGvJhxGAREfOznDNjNIIwJ9f3Tt9GWmAbsypgCo/P3XzzMoUtmPIwHU1QoNC9tijIx37ZyUowDCv49e15+0CK/xYvCKJ4czNLKsAqV+KP53JAnCBwiMy84hnDbm6bXqPYo6UG6qcRvZMWCClujvxdqBfIypea4TqF7onNGqQa8hiSrn3alg6sQyWFOu+mdzWJot1LlwHpNv0l0wavIgdphV1GICrdR7qTE2xxKvl1w4tnFGV6AM3OAw91/8eT1jiSVCCVnr4wo0KYkG2YcSXu7S4ktFYxTukDiO+LacuBvw7MdzQxXIZ2QOxJqJ1QjbSvsKhtHULmT+ZQ/XPl1Ai1eKUs1N3m4/jYf8Em65HcaMPjUo8aanMXgES6RfPjDeNlbW1m7Z1iuumLVGwvm+2MVudb4z9OlHpHk6ORuiJdoRabP91t0mITY3/8Cu4gBhgWOaDIH1u/McSxstJV7eB4kJCWZdmPju8T5c7cZ+pX3ggg/B3ZxFgt6URTS9Z8gWd2nrkOXYhHX2HNbbBUNcoVIRwGr2KskFaGrdXpuMdBTvYa1dUtooZ/3lqAFxBD1FwvfCmgu/9XxmRgrH582phZIrguSWelByG76LF/3Mx3sUfZIhSi++v5GtoO+d7jWsV6dIvDjbxBxQHRTtL9bUg4xegmCvja9cMvNl/157fBO0akJarmbxacAnN2GjrNn5QmoZttnNfYsqoN3Fj4J9Onz2XpMzfHdq6RGps10jKH8dX2MFYDKcEStWHlepTx7+BdCEYRWYVK/9opNvm/e3fy+ZlZ3yn/5Y3XOGxR69nR0BCwagdzRYaUo7i/zHAel5XDOyOZimw2WMzEFm69a8yLp0EroYu3DAYQXDw8VPJ3Zc20DZ1osQPTs45kcT5EjaBrshtI58HDjs9NcCBnw3AQ54KlME+0oZ4yZostNuJ
 m5luxLi+smtYNA+a91xvy/RgSNRTYCuErC9ZpJ/HAIdxMJXHCyKgUbe/bvN2EvHFFkpH0ALTmIRlIaIXVpV2Iqu82nklXhqrPai5JS2zPLWTXB4r0ORnpVx3DfQQP9wmuIRUa0Ql6/Z1X9RWD8hbkvEZvbuDzFEN6xkPmvJoAq+ACXplB/Z2IAob6xoAQAGDiDNnhMxn1zxHXQiRwfr6mAjUSQsUrvTT0IqilVAtGcRUpIhHKWM/14ZE+evLSeMRduNQ8RisYwyQdPTL/rZsuTtQIO48RcbIbUZ3bo1y2D8VHku2nWMQ3AwDm3HJV51VTmkV/JOM+nXs/M9mO78bM1ARfv6kbnebfP2WW3WLVC4/oo0xj31C0W+OeMec=

On 10/22/26 11:24 AM, Konrad Dybcio wrote:
> On 10/20/26 12:42 AM, Nizat Mikayilli via B4 Relay wrote:
>> +/* This is the Wi-Fi SKU: no modem firmware is shipped. */
>
> FWIW at least on older chips, the modem would still be booted to
> provide e.g. GPS, check if that's not the case for you. You should
> also boot with memtest=1 and CONFIG_MEMTEST=y

You're right, the tablet ships the modem firmware, including a GPS
service. I kept the modem carveouts in v4. I also booted with
memtest=1 and it found no errors.

Thanks,
Nizat
