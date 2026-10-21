Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582999;
	b=2O7qU249yPnZW4bL6qMKMiia8CpDqsgoQBSn/zkT8Pdfd2xyMu2gVCkfMltyRyW8UaWc
	 YYxaoKVlFy4TqbnHMUecMlhLSiY1IpcdYr7Zq0amuzEZ42xqTPPkraZbvwNaTtXDSJ8Y0
	 qxW9rlWCSflKiBmUKrNIrFJ1W3nWe1HdPeXGuxVKpJsdQ/2pEghX+1mOB91CIZ+Prhmva
	 4kWtOhGMX2KuuVBrCbqTAHi5ZSt0tX1QaNHE0d7i8KDc9QYvPNFgbD4l1JA8V3MnXBD+S
	 Cf4lH2zbuGUaUKzIItMW5YMWvqYHrKdRJOO6bhKhCluljD8JNxuDX8iBVWJL4dWIfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=szT7R0YzuZX1qTMEMRParGqBDqrMMKC51Pm7xdc1ARg=;
	b=0q5x2exp943oIyujQP1EDdC+VyUhjnghw4/fOrwp4zOSay3hDm5orBrJ2xC+YUK3RXJY
	 qsr5aY68SrOnWJdrWelKFbm3XwmFZiQpmH6eLh/CA8fTXVprqT67Pxctj2jvqbx0dp690
	 uuitaIn4rCSf8cKBjdhaj+quZUwyGjC1zzNHzRqULKnyeU9QAm4/860tDbuAgcvj3Y6Pm
	 lwudhCMrjEGyfPv3wgmrP80hg7lzWAWHIgM0shBckn1kMAkYImsGke0yuPw4AfQUvckip
	 aSB2FLANtMyuj+KUZphUCks1ZwsG5rBBXs2nG+XAeCW69o/NR/xhICXArNSOddEho+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KcKJq7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx1TyV5u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA80606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA80606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KcKJq7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx1TyV5u
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3q2325031
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szT7R0YzuZX1qTMEMRParGqBDqrMMKC51Pm7xdc1ARg=; b=Z2KcKJq7vXJv2y2B
	fFzmT08AW3F8iWUZKU8ie5DEC6mgbsOQ8IoJNkwLzbXdotk238qhJSGvQCVVNjaK
	8CV/a4D/Luy3ioji1LqMop80x1JkS+3+CilCN16lfPe5WAI7ShYh1PJt47zDlaQb
	j9RerYum6ac3T9KXZJSsmmRzf7BdfBBZDUaAwaOmj4TRhwN1scEHrxisg1oCPLFv
	xVh/QSbJy7R0zJz47epLLQ8DThbPHG2JB7KyChbiKVR4Q+j1/uVM+eb0M5P+VIv9
	RVQ/13ub9ggdPva4ClGQ50TUr8UUbM5KV5fRqglTJc84uBMRhWhnqciAuL4NU2zl
	M2Gp/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3rsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:43:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so10918785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582996; x=1793187796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szT7R0YzuZX1qTMEMRParGqBDqrMMKC51Pm7xdc1ARg=;
        b=Lx1TyV5ub184NY2NLehkWddRm6kClnHc3hNwcHRIP7nyPz/DTwRZi608HTlZoKSNyJ
         AHTP4GI9G1su0mZCE0p7IgeEzsyBZvOPMLz3DrqxYGGozaRmmggq5QkmO1RyIyUwSe1e
         pRX6/bLJ7LfRgXVD55WFYqe5MDeC6CYW07qpVdbv2w+fRWa36LmORZAhNvdPJPvotTNe
         Dl7aSc53QE9LoUNR8QR/eLZmEj3WuGWZ/dUnDYYmSJWNY485H7rWFxpApS9vCD9Fiar8
         rwVW0hL9mAm5+gHz3WYCKoXnEFQGycgzCi2PYYLcYV/qPZLMlyB4vyGSD9NGX9+dylRO
         /yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582996; x=1793187796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szT7R0YzuZX1qTMEMRParGqBDqrMMKC51Pm7xdc1ARg=;
        b=zxGfo4tz7usVi+xnsqlW9ofAd7CSticUYQbkkox8Alp6ox+D5MeBnD8TkunFcUTzMU
         bOhsX+prAffTfnyCaCPDsk9sdmRegVZtSQQ3/8B7w0la1SEQWcRY+4c286HlGK7vXBYz
         jSc26pmfgqsaBwBuXpEzMu6LpyludV3k0anUYKsWKpjIk+Y0s/NO4fxi3wjY5Stve4Zj
         jJ/MS+B0KVkfwuPfvoxjjDeEyh44nSYR+NBT8XAxsvIgREIf8ueRU04VsCee84S6uGV6
         GmGrZs4GlmI6QP8D7mUmUNhXbf1hu2YQqee+Dy8kakylYiFTMbEhd2yEWl0la/SD7HQk
         vKBg==
X-Forwarded-Encrypted: i=1; AKwUvBwQSYjclL1UOrU19LR7gOB38kXNL6e9EUSiWMbyGMV/ycAAOoGICd88IUCAryTD8Qs8lL2FPDLhwyeUgjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJhP3mzPK7PYZ0qwAYKCgxD/H/P5QM/z4zmPquzh8rwVmvbsfG
	uxdi5d5e15urLreerk8E0UoDluKSAkHOWJWODNLyQ7vvkoNx6YCzFEIv5/Zczn6c2Iv9BoFMp4L
	17QDjCuW+gXkxOEQ75yQfhB1mJUSE8B+Ra0vrAQ1eT1jb7WDQZiHJbfIzwT9Yu+1Sbss=
X-Gm-Gg: AYBFou259Km9CuYvxMdcm21p/ibfq/XV0mvk4XQiLj0lHWGCj4WXF+XF4LK4dHT1W1D
	dwWw+ughYcdMlQepp3p5eY+OiP4aRsGHiWhA1w4wk6N8QyixvkPt46FD4qVKAWxE7dtQet35IdS
	IlpYI7irTpNI2w2GsVLpSP/c9ZWDclLC8kYNUlzjkjFuLQnaVj69txtAOJ7xX/I4MvLpzb/HHRc
	sBtNB73b5oXRFqJE5YhSmhUh4FU4mIesZIJPzUIfXIPjpCRcH3kqddaOqLy6QvH91t84BZzQeEg
	FgJPv6AgnCCVrk7whYWO2VaTH6mL5aSkkGMmLxrPTN5rhmg+oSudflCIXTDkfssD2BvHjoPzVbh
	j4ufPrFScX1ee+5D4FRph1w==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr396917085a.6.1792582996123;
        Wed, 21 Oct 2026 04:43:16 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr396912485a.6.1792582995665;
        Wed, 21 Oct 2026 04:43:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679006ffdsm68757666b.77.2026.10.21.04.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:43:14 -0700 (PDT)
Message-ID: <8ff6ecdb-59d0-4c6d-90d6-5169a7393d32@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:43:12 +0200
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
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
 <asOZdcWpfEtEm-5X@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asOZdcWpfEtEm-5X@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX1wFhOSA+DXHj
 tJ7YmrmxWAi9HK8XURVdZYrxwftyTf7SPdORqV+y+U2NzQf0uXIOb8PfmjVvnSj8vkDZZWb9l0c
 ZE8KOSsodJf3yv2w1Um/Lz+LjOCL3Rk=
X-Proofpoint-ORIG-GUID: iwEOtDaPJeU2S_qb7Hn9YC9Tt2dXGD4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXzgihrsJZXJIi
 LZm5NP8Wqh/kCYlBRdTX+i23lgurNCqYU/tfDdDZW7rvEwdIG4P8wtJrYXKeLWyvqHT+bN7fjPo
 M2Q16SpewViWRJBb/hPWum/9YKtAt6H/NjL+d3QGbQuDkKmFEQl6G8OuT8zZJSp05dRThg7yPuo
 y8XBI7yPD8Ln2LwNxadB3ctT0PcwaxZND72gbMaZ7aE1BQP+DxD8N38UI90574j7FatTF93LEwI
 UQX5EHnNGPT8eXtEbbO0U9iJ4GoOP5P8wmLLeokyumIeyUJ7MYEUC28yXy8cTiUPxZhdMOC8AM7
 iGNalCy04AiZICpnaxMEwGyHz65Xg+evPXL9wVccuHBUaRnkdXR+xEHxumo4ENsli/aZ+yviEpo
 fDBVZrChxoPGQSHghKtgI3u6kBrfMSFSZAJpmNyCIkMoYNPHzLwJ/kKYvneriLuYNmvfF6+XQ/I
 +7N9i+x5JFM5KO0Rbzw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Kn0s5oqq2MaH7NdAuvcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: iwEOtDaPJeU2S_qb7Hn9YC9Tt2dXGD4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

On 10/5/26 2:35 PM, Stephan Gerhold wrote:
> On Mon, Sep 21, 2026 at 10:53:40AM +0200, Konrad Dybcio wrote:
>> On 9/16/26 1:05 PM, Imran Shaik wrote:
>>>
>>>
>>> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>>>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>>>> every clock, keeping them non-zero until a consumer takes over. If there
>>>>> is no consumer, those clocks will remain active in the idle scenario as
>>>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>>>
>>>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>>>> keeping other targets unaffected.
>>>>>
>>>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Are you booting with clk_ignore_unused?
>>>>
>>>
>>> No Konrad, clk_ignore_unused is not present.
>>>
>>> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
>>> during handoff. If no consumer takes over, those votes remain active,
>>> keeping the resource ON in idle and preventing XO shutdown.
>>
>> I re-read this and yeah you're right
>>
>> Is the handoff functionality necessary at all for non-icc clocks?
>> I'm suspecting that this was just a port of the ancient msm-3.10
>> logic where the (modified) clock framework had a handoff mechanism
>> similar to today's sync_state, except the toning-down of these
>> clocks was never added
>>
> 
> The purpose of the handoff functionality is to sync the RPM vote state
> with the Linux vote state. Since we don't have any "read status"
> implemented, we do need to make a vote for every RPM clock to guarantee
> it is in the expected state.
> 
> Simply skipping the proxy/handover votes does not fully solve the
> problem, since you will still leave unused clocks enabled by the boot
> firmware always-on.
> 
> I don't think we need to force on all clocks though, we could probably
> also unconditionally send a "disable clock" after sync_state (once/if
> the clock unused cleanup is actually managed by sync_state).

Yeah this sounds like a solution too.. And it seems like sync_state is
coming?

https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Konrad
