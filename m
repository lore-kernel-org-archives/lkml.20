Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864791;
	b=Gok9kIaXWw3Q6j8BmkMsH3WlsMe089EL/vMBi1VG9+yXOyrhOOGZ6/IoE1IGup4xVv3S
	 cA1uYe1z9nzRIf3pgT1YhT3dVsEoZFR5VFr6E3Lgbd9qNuGQgnB1vc/ZjUwq99SSRR/2W
	 D3Uh3JJw9aisW3Dn0t2UIo0qTeznCk3f4Fd+Ky+9qDfpdt55qsnP8jGvYvGuE5frIrhde
	 84NFIgDaT5NxkyTRGWGkT6ld38pD/zuPLzwAcrcgvBkpnvHNcuO1yMaN/wHwVhvwgj636
	 B+B/udzmYoD5vHcia0BmUvN52ql6mA/IOULykZl3yNSAG2FbtONtHMVQ/WfwP7UlqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aLmZCJMu5eB1MVjXr8+zjB4FdUR7HJYu8BJRLEEGzKY=;
	b=TM2OVRiU+KxKou6Grq5KqVS/OAMKD/uDDLUbPb+xpmB4nEqeW4Qn/pUsIKbRw8gh8Fxt
	 j97PnkBbSL/EhvSZpngSgF57NcuSf50Tn7VNJw4aqZQ7IAPXwaojSwO0a9mHnZyXFqAn8
	 fIftp2GCe53C6Ps4dhNb9YDrebkE31LzyYCrBAMZCnQJwdWNs2LPDm1DKlGzPvZxINZtr
	 IYoBPkpTe1J/u6mz1xnn9uYD+NgZPuznoN68LlAm+xLCzohVkj/+cmRZUTE+JJ6wLMR7S
	 8uFp7hSm3KmNoazv2k1+4hAARitwYE5qeh0JiGOCFbaJG6S/kvrd8iA9DcIcKGHf8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCUywfrB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFQXZVVk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4208B606D81A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4208B606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCUywfrB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFQXZVVk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U3di4169576
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLmZCJMu5eB1MVjXr8+zjB4FdUR7HJYu8BJRLEEGzKY=; b=GCUywfrB4POV5wAM
	CJXxX4INAxHcrVITWKW4tt+DEN4Ivb/OB1zuqtOSt8eWLs2BgjAycynKg5D/LT6O
	SRSbKYE5+1RKr71uo7peOyqMoB+I0vVl0ZYCz92VM4FYf7gtUjW3o2PPwp6NzH7B
	6ePbyWK+j/wPWaqpAEI5JIyTVaHJOD+pgIgUjRG4mv7YfD8qxteVj5CA2Csd5tlF
	sdmR1u8t3g8SIN8Li073QK9Z0YTdu5bn3mM0bVvOPu0Te8YGHD4qSnhGDgXP7fhz
	IoPTjtVmrFsnIXy69wnON1MzyyA2q0++U7gQau+ohtoGp9WCpISYWFN+cfigxkTy
	vA0T4A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8amx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:46:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd633da24f8so1875712a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793864789; x=1794469589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLmZCJMu5eB1MVjXr8+zjB4FdUR7HJYu8BJRLEEGzKY=;
        b=VFQXZVVkycy3gib5er6/FO9Xrur4jmEolE1zsVHL+P7CIXr69ljEijfayZ01jSNduR
         kToLY59r9FOOppZVk1Q8HsRlry/WnDS+GNNlNZONfMLzKBfCHoawVc6v/10tyNScPd+f
         aer19lLesQ/+FRvEBYldZM4XMSRlbgSbtw3khBHjMqSCAbjFmnmpKRM0hkbGfqtvnDzG
         JlGslt8vQuH8zmd3f6kQkw87UxnW82pNBgVdoPj+WHZWkvgd5LLC1m+Unj3rXjZat0yM
         7QZOgaXg/6+EOcdfQbAhSDyMAVxT0xRkRCZC0uUugFkma/BCQSaj1fHRB425a4EU7RCk
         KgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864789; x=1794469589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLmZCJMu5eB1MVjXr8+zjB4FdUR7HJYu8BJRLEEGzKY=;
        b=WBLFW/sW33aRKCKRt9xliNibqISwvd5PoTWBBdXTa761cD4XrUo5QdyLIRF1mKvHmL
         /uhztvl9AXpmPDzoIvKX0jkir+yTXbxgAjhdq7zCDldPwpH4WzW5cmLaYv3yheFoNW4C
         NpnHgeswy0Z2K2Dl9dQZl4CCCQ577OI0oBcosUfO+GoF/IQgvrUqkm00VJOckOUdc9t1
         PkSKS7xACLMANdWqPfL3KkilZLLRuWjyKrzzvwsgU5t3NIHVhbMl1ax7cOX5z20bokJU
         swF78e87bGx1tO5UANwq1qvSd663f3H+pkzvXJ2D8aOb+8nNbYfvX5IuNYY9adcMZGfr
         8thA==
X-Forwarded-Encrypted: i=1; AKwUvBwKifsOCNEweqdcyo76grmyjTRL1dcdTJXTVR/X3ujfTbajdqBUJDmm7WSHhc5PNGD6zzKHdhMr2vDXse8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+h1ZZSWbC1/+qK+239P5eY6LIynKKoxJb1ojCCre+rtX3wjzBF
	BuTDgFkrOylH3NAfJ0Susq7Dq8vCmI2mkVRV1yBZUZ/mCB2B2LUhQYoBhe0I+t+XYTCpJ7WPKzS
	WcseaDLIOULxEXkmfSc9JKyVLkRHc+ARiJBRgKa8UVkxf84Yk1uG7YT7n3EcKUmiWAw==
X-Gm-Gg: AYBFou0mPUNPrcIIFKJU1/fRReQzKP3tQztH1X9lf6K9lsM2wZKVy+J4Y4k82NQQy/Z
	5y6UiPUw+NDcEqd+FAoBkOKiteJULL25KvbKLdlXPj1ulmuNOnLzp8myGh+lwFHXJv+tX3sQuVz
	AtS97Cv2XqKX5wWRTRI6Y14UIAgfUV09i/EWVxENqHXKOonapWg98OHGp8f/AMYdJildm1Z9L/9
	NgFupXxOQYK+DVXnYW32bvwy/W+QvRZS4pZUhIRDGtadC2egyYkYUPMVqoRKR2/EnmaDNntBole
	byAe1iYzGfqNqKVRruzuB3EolQx/Tbho8u0OAiAr57k2oy8F7Yjw/jS0tp/zz65xxZvjDSZ/znl
	cTpQmYr7czbeuWznZOXciLXq9n+qPE8gtB3F/tsOfhN56MyUT1pjldFPmk+F115fiT+ttCy390a
	f64ve2
X-Received: by 2002:a05:6a20:d10f:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3e928a7e442mr17511552637.1.1793864789023;
        Wed, 04 Nov 2026 23:46:29 -0800 (PST)
X-Received: by 2002:a05:6a20:d10f:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3e928a7e442mr17511540637.1.1793864788510;
        Wed, 04 Nov 2026 23:46:28 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4693fef8sm1887983a12.17.2026.11.04.23.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:46:27 -0800 (PST)
Message-ID: <34ada002-5271-4f05-8b6b-ee4294f2ebee@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:16:25 +0530
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
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
 <97890f38-2b17-4591-b5fe-cc0262f944ff@kernel.org>
 <39f51659-134a-49e9-9b44-cd67cfec0dd8@oss.qualcomm.com>
 <y2tv3pzuf7jiouqyo3p3cohfcqwe4fpomnr7pas7dl6uinrw5m@4tuckiojir3e>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <y2tv3pzuf7jiouqyo3p3cohfcqwe4fpomnr7pas7dl6uinrw5m@4tuckiojir3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec3455 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=SbnxCIHB6lPJfNzbmSQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2YqgWcWPjL4gyGkRk5u_hzPD5R3XSf6D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX/tkp07wnoIyd
 Ih+NjGGAbNOV1zUNcGTXpv78e+sGWdPpTwwFKOB0H9IR/IKybcdm52IO0SSQvM/RRa52Pu/aSJV
 zZEjezTpysIDcpQ9Mmn/C/2AXqVfE0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX2HnjcWIrVFRq
 j2oXOUuUsojBhXYY8l2dyHLZ1UEi32JbfJTMPmCJpdXj6CbAWhqzDFuSzVzMcbdUAXjdB8zCARS
 wFtH2hYCCLVEeAsi4frYSoFbbf+PNM3xIUKchzJbPBd7aeCY5KxAbOerklnAIEi4ihBC4d10PaS
 72MwSrWu1C8RzsCiSx9eAcNMWIZDpeh3b9pkMvN6pf9Y+b56wC+u5rs8ZDBvwVqLSQvtXNci9ZV
 ytLmTfEc3N61konaAX5EYqzt0o4d9H1M6lPaTqcTF+5mnhYq3dgmuWXQokGNNmHasEJzK1LWMPF
 7hZ16koeDsH0q1GvPQ3gOxsUIzug1D80+ZarXi4x54cT1JebreAVL3vHV9q8b+Ls9uM9vIlg7le
 z6YuAeQucNCKkYssY2aEb5M0lfDouwnlxInUNmaURC1rFjquABneyf28LzY7cMxXP9EFPol/u7y
 Lk6zJKikHDFOYKpBJTA==
X-Proofpoint-ORIG-GUID: 2YqgWcWPjL4gyGkRk5u_hzPD5R3XSf6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050030



On 3/17/2026 9:06 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 11:15:51AM +0530, Pushpendra Singh wrote:
>>
>> On 2/28/2026 3:19 PM, Krzysztof Kozlowski wrote:
>>> On 27/02/2026 12:10, Pushpendra Singh wrote:
>>>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>>>
>>>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>>>> vote after 3 sample windows instead of waiting for 16. The previous
>>>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>>>> causing delayed decision making and measurable power regression.
>>>>
>>>> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
>>>> jittery, while higher values (4–6) were stable but less responsive and
>>>> reduced power savings. A value of 3 provided the best balance: responsive
>>>> enough for timely power reduction while maintaining stable bwmon
>>>> operation.
>>>>
>>>> Significant power savings were observed across multiple use cases when
>>>> reducing the threshold from 16 to 3:
>>>>
>>>> USECASE			zone1_thres_count=16     zone1_thres_count=3
>>>> 4K video playback	   236.15 mA                  203.15 mA
>>>> Sleep			    7mA			        6.9mA
>>>> Display (idle display)	  71.95mA			67.11mA
>>> Which hardware exactly? Which kernel?
>>>
>>> You keep running this on downstream, like a lot of code from Qualcomm
>>> and speeches on conferences, so I just don't trust the numbers.
>>
>> The numbers presented were obtained on then upstream 6.6 based kernels across multiple SoCs (sc7280/sa8775p).
> 
> Please don't use old kernels for upstream work.

Thanks for the feedback, and apologies for the delay. We validated power and performance workloads using the v7.3-rc5 kernel on the branch below, comparing zone1_thres_count=16 with zone1_thres_count=3.
Branch : https://github.com/abelvesa/linux.git

Usecase                                 zone1_cnt=16	zone1_cnt=3	saving           
Youtube streaming on browser(power)	4126.49mW	3991.30mW	3.28%
Google meet audio(power)		3058.79mw	2929.73mW	4.22%
Speedometer3.1(performance)		25.8		26.5		+2.7%
GBv6.5 ST(performance)			3907		3905		-0.1%
GBv6.5 MT(performance)			18636		18680		+0.2%

Based on these measurements, zone1_thres_count=3 provides a measurable SoC power benefit for the tested use cases, while no meaningful performance regression was observed.

Thanks,
Pushpendra
