Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272978;
	b=eBJrHjSdpelBcT1V9EYoxgY1CjJHAAvDHU7tad9NoDSA56C9QSnwIL8VtPA/8wiqrNOA
	 36iJbvjdBMquE/1wMOSsVGWQGjTBXOkTrkqSTtnygS1ldiGBe/MUllCMHqh/8nJiqeRJ8
	 5gLgog0Bvtkej+cXXCnENj/Bm4dyE44ClYbpKhM5OjEQFnlkqrEPpTKuBQKe4f0XCp/LY
	 1w0NHvrnxjRlWxmsLiiv5L6272CCCACGd+9znWfzmfftzdxyYm7a0C4K9gx4cCO90Bj8g
	 gKtYaHSlfiXIdD8LvkvgSAMeSPJ/Vg6p3C/VQFj9Hi0CliUZFH1pFTJpUUMc2z5U/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
	b=LTCnJk5TuhX9FJfuyUgXowSfAK0u0BcCMb5Us9gMykOWiH8qMprMAZhy0RifG35o3AN7
	 ns4G1tIeeztLFbmNgEs1YX8bBgggQLFqaXyVboF+aZ12EzskkyDs6hwl18n4WRLjhJD4n
	 E3CPCN19BZChEHU7UNfuq0W0+yZPkyYKO2E3Z7Ff951Hdq4qSbzfaflF6H6AUEqz2+3o2
	 LnXPBsWoIRz0QfHJq6L6XYXkmuar7NzXQynV0p+W+f5X1Ngwy/TM4qei1jlQ9Y6m5+ejx
	 axjFPtydS6VUigaY9ssrsH11d6OnBZmNQbkOl3hy65YdMKvXGJeV7IfViH/wjFdAgiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8SaWOYR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD0606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DD0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8SaWOYR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jCts1829725
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=; b=Px7FysZ0MEyB1p42
	YwwdorVfIUZwtRGk5wcyOWnl1KQ8OzUWiiOdai/ABaU4EqQB3al+osZ0gWnEgQDK
	wPlgwV2cnhf9m34vPX38E3VtudabuDgtZFGdAqUiqfDz91Y88w2HHlOigXS/1+xr
	6WMBGYsgGkWIgXQ5TUh3OQv3OlxPSX/vRUpISq5YFD/WU+OiSvq41kaErdXas6Q5
	MwX2h380INakGywuEpDJEXpFiFbZTWnhJBa4dNbniLFUhpG6IpFFF7m3duQ66VAI
	euqjjLc1DrFV3AKRZoGmqKijWh0sXFLXknnFe9Bj+xLqiCMOvHHBRz4VzqmUUxgO
	O2sFHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5aru7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b97460a133so950430b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272975; x=1794877775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=K8SaWOYRM+gMhLfS0i1oMjJLWWb6axIIt/cTLMP9yTvwNHN3sqqAGYl9ZqQj2KKCk6
         r2ZP+7lgjpub3KEhtlE9kK2FT7xIUe30i/5BetJ4RYSPqVdLfRMOgErfsXbm2QKXTBao
         sAqwCyPQhQqkrtl+KDfSW8uyVVgl2MNRYXsonAPHBUSfMZcC0i5I/va4Q/pK8hfcQd1L
         sbdwYfTpqxMDUqxUuUIuRxghOvD38b8s0xWzgNY8GjDONSDMvgNZLTpV2ZG8gi0Jamq+
         fD7ZJJzmuKtkyjYGPqdN4TJyks9exZD07krGIm2tdTv26hJLrxkVVis04wCJBMT+oC/u
         Ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272975; x=1794877775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=0i9wcg2tqp/1MKbwc2Uv5VHmpBNxOSrWlRaUr4Z8qtBL29a3cLU8HkCfQ/dOMDT+sU
         Gsay9vcSlzPgGcjpmkUgHfEJ1JYd4mLykP8grLPUiba1NkFxKBMslOgfVk1rsAx2cSWL
         boabOQPlcILtRwR/G367PuMDMtxROsDokF7WF+j7YQYnCfpQxuOQ6ECtpGqFCiS68cMq
         vcUGq1qgGYrH3LgJwWYG/ZTq+7QzpFLBw42nUNEHMfJDt0gHMXJez+4msaCXJpiAvWmo
         5iKmyIg1lvVpWqpP2BYUEzkwyDFWycPRyCm2XFug9uuYOEyILcXYytTBiwBKQHKocgyR
         T5Ew==
X-Forwarded-Encrypted: i=1; AL+hErHepkeBjj75E1wt8IEfoZl6nOwOhRQO3Omi+2H0TiQXsn76q8Ag0zdtjf26OgttdYqT1EFqiqLmK2kZLfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nZJgd+KXYiKPBhcqvr7OTfRjk+LyR7myNBLaljxqW5XEPaJOR
	b9JEOuv+Or+LxNNgTJQg3Q+fSvhpp3sPi2l/sFJVEjdrGaDwL4t1kk9qCL7bUC3YrBV5fVVUl5S
	/19cysXQkff3OTEAxmI6uApU/rTXaZlLDTLtnRYrl5PKOzFzFy4oRg4IE3MHIQvRdTNk=
X-Gm-Gg: AYBFou0gWzhp6O/aBussDTzaPnadYn+/8GrCRe4y5OurUsRWRDz0hf6O9USpaWZaQxI
	pWMlrUzYF4st48NhPj6gqn5HMNlFSBtofHmvtQOTjPiOMoMMvuBxpt56XNky4G9plSbyPe0dYcG
	rVQ4wlze/cwqDhpjlVtygqi/gP2pdjaQk/baMHBn8/CJd/D4UddDbLZczqE6Z3Lz/1s90njGkT4
	csNZ8xRTTSXTN75pQyIHpwIlX9yUISAtJ9GhvpO1S0a/JqSQYmPXy7ZE0Gwu4QEvfAyzQ7rwL3K
	XdJzJEJV4voI7fD/l+O0DcSdtQQIah98LAgOGV0XP//ltBts/9xLqO7pNOp++BBR1yjM2W/2xUg
	cxVx0UQ+mr6vbUE8Lk10P4tJ4HWzQ0vAyR/nyO9ulXc0WTxIYKmbC8MzcEGk3DGml8axWSQ==
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173059b3a.38.1794272975367;
        Mon, 09 Nov 2026 17:09:35 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173013b3a.38.1794272974879;
        Mon, 09 Nov 2026 17:09:34 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e25esm246899b3a.37.2026.11.09.17.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:09:33 -0800 (PST)
Message-ID: <eaef1b2c-687c-4dbb-a50f-a40ef1c72f8e@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:09:25 +0800
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
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
 <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YqKAIVFwghHRuXLgwRfKsE8hLdSAcA6D
X-Proofpoint-GUID: YqKAIVFwghHRuXLgwRfKsE8hLdSAcA6D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX5Cw/Q8dx+Cuj
 hEtSfDVNGmygP2qGqqqOs8rJ40aLVdplsiibQIYjbgHscuA22vVzs+QhL+KP+602L9EVyeox6G3
 veBEqZhCsQ6EKAefaYXvafZWEAuUtHw=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af26ed0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MgS9wdN22aEW9VH1XIcA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfXyE606JVWS3BR
 eeEMYx9sNnj+dZsrcRuITvDltzIj8kjsG4YLJoRL++Yi0eU9UHA7slBPpOXTxoGbmpDVV7sY1VY
 SdTDrASHAiiYc1YuQ8/dGY69IzywnyYyP6ROOvcCJVjPCRHVJwPI3XMHi+3YTzxHOZ6D2MDO42N
 gMwrM45Udck2j2TxhTUDI+hONkrFptL/s33qZh8ZylTQOq9DhJlFj9viZE4tdr4mWbHs/htE6b/
 Fr+w3j6Jj7YjjfRMlt9n7H0D94PNSfyVpJqqDG1WkYRSxM/o3Gm0JhDLscEg4CDGr9lk+lFhHjs
 Shbf+zUzlUrhGMaC+SKY9/QtaF4eKW86IRLxLmXL0smWuFG/seMbD65ZM0Hb0NKB5pQ2RtFMwWP
 T+Lym2sV1rTzBnc5xfYgUOq8t5jlLkMvrnoThCuOz0AZO4D6tL13itdtl5a/7FPaAg+Dv6Dj2Z3
 hokFmkl7shPFvfguZlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100004



On 11/9/2026 6:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 01:25, Jie Gan wrote:
>>
>>
>> On 7/10/2026 10:38 AM, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>> allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>>
>>> This series drops the "arm,primecell" entry and turns 
>>> "qcom,coresight- tnoc"
>>> into a standalone platform compatible. Without "arm,primecell" the 
>>> device
>>> is created on the platform bus and probes through the platform driver by
>>> compatible string, bypassing the AMBA peripheral-ID read while 
>>> remaining a
>>> fully functional Aggregator TNOC that allocates a system trace ID 
>>> (ATID).
>>>
>>> The series is organized as: binding first, then the driver support 
>>> for the
>>> platform-bus compatible, followed by the per-platform DT fixes that 
>>> switch
>>> the affected nodes over to it.
>>>
>>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>>> example node accordingly.
>>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>>> match table and renames the itnoc-specific names to generic tnoc names,
>>> since the platform driver now serves both the Interconnect and 
>>> Aggregator
>>> TNOC. It also restricts the ATID-unsupported handling to
>>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>>> bus is
>>> no longer wrongly covered and correctly allocates a trace ID.
>>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>>> fixing the probe failure on those platforms.
>>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>>> ID rather than being treated as an Interconnect TNOC.
>>>
>>
>> Gentle ping.
> 
> Apologies for missing this. Please could you resend it based on v7.4-rc,
> as this doesn't apply cleanly on coresight/next

Sure, will send v7 to rebase the patch series.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 

