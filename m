Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748764;
	b=c8JRjBoV2n6yUBzPvk9KXSOrvWzRQTSreIAmTg8KXOp2bxf+kOTKqI18QzdCvlw20zii
	 K236nlcoWPTtH8KJCPg1XlWhqlMBjeXROJ4xk32sCvZAzT/vL5o4XlP5QnJH8Oz9dNq1e
	 v9WGQjuWbQBmpk//7BeX12JLa7Hg9F4LJSNtn6o0vu0vzuZSrcjrwIuBcK0OLHD3HXiyU
	 b1meMWTeNA69RKh4qL83tVZiWrailmk09x900vJPdb5mEwS7lLQ3Y+Yx9Tj035kVpeuej
	 YyvISA7RCd+JN3gBKlx1+ntwZWdrUk+ut8WZX5WhDaQKbqPBn+E+EMLBswjZ5WPFWoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
	b=XR+SNXF43O5kJ2Nx6VcYYjWsxz3H+9Xszyd5oV2IAUobUD+LUovUJ82rwh1Q1AL9F98S
	 SA5EssSU3OIf52OmyOnNMZkTcSdlMaBkbnyER8zYhfn7xGu6qMCX9v+0g9x/Pr5habHwv
	 0zN4tFhdz5OpUfQUSH6wbpXT6YC017mnGgBmAHADSLGXN9dSR1FjxFdrVVa6JRfD2Zjkx
	 NbVT2NLQAvEtXr45CU/YH1TkUxcxbuLW7ZvYHVbm6Zyg5adFoteshv+Dyjg90epfug2Oc
	 znadhsZIrBD/xTNDgBozLWVVjdZv3uWuEfEjyhBg1oq9bcljthI4cqBFiqAB32L0Vqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLd1pMg+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwJ0kDr7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432F606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A432F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLd1pMg+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwJ0kDr7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FD161767179
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=; b=TLd1pMg+hsh+sdis
	QuLNWthzsTT0eaJHxBBFbAr0m+dnNKNHG0+pHCHT4dAK71TN41vEotrFSBThAGuN
	cPNoXPOM3EbOtRya6rlgET1hFeiH02KpqEoErtjAM5fbFEc5LLKpg7FMdgSxeah3
	qEMqGvTA5+KiJF+L6YB5mORbgxyl/FEZw53rsd0Up6eIlWgU6RFMLey0Dumbho37
	0tk0KBnC7N+HrhVf43wwITiYdjigP3/Omp8wurlX+LMYjTXilFSmEEaXSXAxZLe6
	IW8OU8sbJhlaacAfmT3Oja3FYk9XhdGBgmCWyx2lhYcTKccS5tYaTC9py5tt1srj
	i8oCzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahug5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:46:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53389750985so1347711cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792748762; x=1793353562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
        b=YwJ0kDr7N3llpVFNpy0AeIo2LlY7dm/xGvKkj1ELKqggFNOGXQsrWlIfEbyBolNZFK
         9XfGpTstOptB46wc4xpl4r3wwFp2nIOH7VEvh5bo30hNli2HSuOora6PFXI/y82Uij+L
         kDdraxB7R65rDMA+AW0GNhIboPPQ2Cz7dCgeEpOabJ4X/QNoDI3atyK7c35/4yUUftLE
         Eu/borcPcthnJNii5GDwvYev2gDTtowp3kvgwrzKfForYBFNOLun9gmnuPQlmvwM9hvG
         19wWR/vomnGlPZ6mzpbY3D986LaXIb/q/GynBc9CUCStC3+ZoOcuQcmZzZk6ftEeFQOz
         HGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748762; x=1793353562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
        b=Fnbz4i2ovcsT1tL9u8n6djXsV+c0TQkBdU55J5xc7P9kHia3Ilyc8cHWfxTWsQNXax
         Ro5xyjaOMgC+Kt1i5CRUnpk+J4ZMIdu1J6yHPXbZlhdAl39KVN4tKwxNePDs32ryXmM4
         5i6fH2oAyf6X3/wCnZTTbcd4G6sceqML3PFHyXH7FZbiLYPc4ZMGI+jMf4Rh1FwFdTR1
         hgR6Ld/JJSKoR0oKMLQJpTyJhfxZo7QR/DcqLOkcW3BWzz+E4stth+cAseS5MwHysjzD
         G56gaBDyVnSaNsNyGzQwaLOGDpSxjDqlBijbK6xeR2d/Kd2PDMEQfM84Gw+T+vmcv6au
         eFUw==
X-Forwarded-Encrypted: i=1; AKwUvBygO6i45VwUvTY1v9MmL3zgoEmd8w1SCngEAblu7dlm0//X4Mcj5mxQGXqRXMeNqUQuMpX/1GvGiZdVeNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgqRrOOC54QahgbABV43SMHF+WI1BwItyNpY66GOJXDYKaRA/z
	G63dLO9W8yK6hUDhVXq6R4VPWLTDe9qBna6mUil4gB9gek1YaY4cYJkgy+QG1IPC58QnrSoiey9
	PNNjLJy5OuskAj23gI7SVBU/9YM05QZQyua5YMcF9KIpCyfkILu5OqkxFV3qySAiWkQs=
X-Gm-Gg: AYBFou3rQhRAtE2rHAw4oil+LCavL0SE+VycWx4asLzcqMozsMzhzNXMwHU/tPgrS0n
	Vx8dT5oqiAJQ7fAbNWqDmfVIx0oZwr5RVjIDIBUQcq6AzbFGPTYKbXCCHZ6Z3hzNIyyuEXtkI94
	B1V7cmaksgOUW62+5eYyenpJEBo91ObBDZUioRX5cYFdC8hrcjgJXc8txxrIE2UYH+MToehkitm
	t3EYjnINqnehwdWXM+BhguChwihKMtxCPLuhvtISHXrHfphesGYCMX8tD3vis1sNQmNo91tWNWn
	Fx2GMILF+4YbjesZtoDBI/LIFOGOZz5cQe8FOW45IqssMntvn0wIs2e7OlA5fg65zHrzcsjh1bo
	bmRQjT0Ou2/Za1V7md0TsyA==
X-Received: by 2002:a05:622a:ea06:10b0:535:162c:2e81 with SMTP id d75a77b69052e-536c293f856mr20737141cf.5.1792748761823;
        Fri, 23 Oct 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:622a:ea06:10b0:535:162c:2e81 with SMTP id d75a77b69052e-536c293f856mr20736901cf.5.1792748761235;
        Fri, 23 Oct 2026 02:46:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d827sm85500066b.15.2026.10.23.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:46:00 -0700 (PDT)
Message-ID: <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:45:58 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Robert Marko <robert.marko@sartura.hr>
Cc: Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
 <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
 <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfXzf2rEL/DXXEK
 fom9WFNN3wmVbmkecUsHcoqt83dDb1kiHmdvNfCPMb+bl/eMabxG4mABqhsp7eqZa/tIa1O8L8i
 WGYSlSgeGWIKLnrlT+TEMi6AdpoleGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX2wQfFKQWbqIu
 6Qg2Vr8yrFPr7UIH7Tj8fb5scHsEbP7EDaW58gVR3UwGc3j1SVzQCTOxBLlY8DX5SV7gRfo2VaL
 rX/CYaxdGkBU0fUNxeXtn6w19nOe4i6o/T1GmLrEgIKMmyEVqjIupQRr8zb+HMZw2YVEMeZzG/t
 ZvBw9gmImV8KkY4LVbiKTSE6pTIj+Xssxkk/I/0IYq2tWl6LIGnUL1i9oEAU27gLNIuhlBAtQUH
 MX3/q/kO5p1HiD78F0CAaT1tkW61B54Uh7s+tMVGDX04w+I+Gv9So8IfN0x/sZU4PArpEsSJK3J
 Hc2RLQfeuznsKy58HiaHKEzUcDG5fNp0g+VvO6MjmCFgFOlcxIaXcM9YF+wXP92GUXhzqe3hqP7
 yC0BCpso9+cBzsP6Kci6OX+HBe0HqSm3ZCiJPKKUIrQWDCiXaRU5KdYOIub9P00vonPNfde4Ghw
 k7/7jbSOBXAGQrNgTwA==
X-Proofpoint-GUID: DWAs0_IWFYaiPCC98UV5Bsd7Y25AoKux
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb2cda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Rp3BUHB5SiOdbJK_EPAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DWAs0_IWFYaiPCC98UV5Bsd7Y25AoKux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230038

On 10/23/26 11:41 AM, Robert Marko wrote:
> On Wed, Oct 21, 2026 at 10:06 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/20/26 1:39 PM, Robert Marko wrote:
>>>
>>> On 20/10/2026 08:54, Julius Bairaktaris wrote:
>>>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>>
>>>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
>>>> which takes its AHB and SYS clocks from GCC, so the device tree does not
>>>> pass them back to GCC. With only .fw_name these parents never resolve,
>>>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
>>>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>>>>
>>>> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
>>>> as gcc-ipq8074 already does.
>>>>
>>>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>> Assisted-by: Claude:claude-opus-5-5
>>>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>>>> ---
>>>
>>> Hi,
>>>
>>> This issue does not exist upstream, as CMN PLL is not yet wired due to missing
>>> networking, even then the solution is not to add global name matching.
>>>
>>> The required clock inputs should just be passed to GCC directly which I have
>>> just pushed to OpenWrt.
>>
>> Just read your reply after writing mine, I'm looking forward to seeing
>> that patch!
> 
> Hi Konrad,
> You mean the wiring for CMN PLL or?

Yes the wiring 

Konrad
