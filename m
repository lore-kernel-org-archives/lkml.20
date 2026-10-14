Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941F3D75A0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958546; cv=none; b=tYpJfQle6A66qBuANdFalvMwRYXYwVyq1Qjq1dgDZkWgy4G72tmGFnx9b2+wNeG6v2EeUjy4+BxoDmG3ULQvstJpEh3vkut1DWUN4eUz1tYCbITUx0ug9qVPU5BQePK5+oVS2ua4N4j8j2kJLCnLGPC/iUH4NS8X9h0yzOi7epU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958546; c=relaxed/simple;
	bh=MAVOekCHS5n6Q2kXcuSC3PNN37t1MTSzZ9hGE5LmGc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivSqgvXmt4k1uHmY94GO+ZlpBSPkQ1esulcC4OAmBtXbLgE6Y5rjO9Aj6nbbwnY0sgH+ZGHOcsWJrBD/2pJQAomc2x00HQU1lSjJ5XCnPlYL9XxHuff/vvkZVczv7bJwWB4VYx/x7R2r6iS8Aoa8p72qL+UmPh+yvpUrc2dA7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePdjSEtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ano4nqxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePdjSEtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ano4nqxG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E68A8p2516005
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=; b=ePdjSEtpeDFOBSGt
	1k6xOZCDit0L8b4B+FKCXcKCtSxaXGy4dp6tLpnFsabPNDG3wGM8pOFmPwKyEnuG
	ZxKfkJ4g48XZYrdxOinUdnm67KsmSGO/fDXNmNUwb0EfV2aUtwSOsMCrIL8Vb4kk
	46AgGaQxIcCUNgf+N8+8Q8Us1SlBB0i6+nidNk20qUyQyLwtU3cse2dpSfgcOkmJ
	5b6W2mcM/9OWlwcvmAbEzJfb6MBV+gShx/u3FDWwwV5SZMud8u5xRimy/zUHSDN7
	jODv2pvFDzdAY3kl1IhJf9j6EafY7QsGCfrfJCbj7qkXKKuZXv4yQ1g5hT593MJk
	oejGYg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha47080vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515266f6eeso1104830eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791958543; x=1792563343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=Ano4nqxGyAtilPZx4YQqZ3qMnb25zGFOlgXzZungOiUtE9rHfQ6XcIDpE69qk+Zxb4
         R5AMy+4ug6yi9raiaz2yRHeyqTpVTjyyluCIZJaTpJSaRAYtq8qe7ub8W+YrZDjegb5S
         +UykG0f+8dTxZOUmtB93BetHgL2YcYOdwPHPmiAwxProF30fS/VuqhKvSr6RBJMy27ak
         d+JKjbbcurJ6oyT1cHjiJSvu9niV+PoMn0CLmrNS5cN/DJ+RvyJVePykvVEfkxh0/e4K
         r3yk8oUWZ1Hh2x/lD3mDTpYOaeLt6CaRLZhwj4x201C+sSsXks8wa01PtLYf/hmE3+r+
         eOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958543; x=1792563343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=wfFwEhiWwIFTTXtsRU02MydhXHp2uZa2/LmC1Q5CAzL6Eo9tDlyG7MoNQg4QeH/tmS
         9LPo0pLtSM8PcqKidMp6vIYMMYKx/jENIQEUmRbKcLQoSKKMS0b4+dlhTWE5Sn7CXW9G
         EWM4voYBkPv+8Vc8t0HwkNzR+KuFnxzgcXX3TGFbm/9WfY7Bsm3uvgl32aa1dnicXWwH
         qZMHC2J2A/00u05pCF+hncbqN8Ecis7vVOHSOq3C2clA1J/QjGizb0I3BPSbggE0zck6
         HBPmr8QkRmnwqslocp4/b6syTpSOxegh4zQ01xrgKZ3fAc+LF6jL9U+t2+MfQVwpIFks
         E0/w==
X-Forwarded-Encrypted: i=1; AKwUvBwndOTz3jMSSTxve4zcG4w5fiP9pvxc3Wi7LEm1HSlPhLzn5e9UZDHi2zTTz2jbC8B7EdqNxF4nB98bi7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAhWx+c1XvM7LyjNJMflxB9twnwFa1dUdAIHWs5/eRKK0v8Umy
	x21OQ1bNxH1ChzRrpplSKe52y3gYlwXkSNuYISkDKbWGmezozQRkrIdCS2YbS3l6B2td6q3c8Fa
	nZZk/Ap7XWocUyPUgIG5s117QJqaDbouOUeT0ofp0KvLpbDcVVxnRCQtHzksGljdz5TU=
X-Gm-Gg: AYBFou07wAbXx8ASt6WJSm9H0dyGZnGvMJTE8LOgdQY/dvAZTpL5mqTS4hULzJHnhqR
	mNX0BhxrK78aQiLF2AOXXRkXKJ4KNe3XHUJkQyF1wOvFnOeocEfPhBhScb1+0rFrOn4cxqowMqf
	AWmrEyMBr37Q5oyeeSkMyPcFGs5/bAMETNwsBDu/fbcONHjbgFqwgt9vLDmUjjtL4Stjeq7T4X/
	oSSXr8fxFGenmSHGPwedu79mZ/YLdxz/wQG2bsaQH0F7AlSOHzZEkiBt0qzFys2gmSmiGD9Pqim
	HoDNNd48G5Or9X9RzG4eOlQeIM0ekTq9tfDSxiLQW5L1zjteOeoJ5jmKVAwB/1mfFSD1NyFBhkO
	ms9OH0S2QGfJbm/JXR7GIVffNT1M=
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163589c88.2.1791958542715;
        Tue, 13 Oct 2026 23:15:42 -0700 (PDT)
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163555c88.2.1791958542148;
        Tue, 13 Oct 2026 23:15:42 -0700 (PDT)
Received: from [192.168.29.80] ([49.36.81.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm51565161c88.12.2026.10.13.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:15:41 -0700 (PDT)
Message-ID: <406a393d-56ec-4143-bdea-2d46c5a4d1bb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:45:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
 <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX/uhYP0sd//jI
 skbqnrUboSQkOIGJNNy7gQ/x+x6pZx7CW90wtlh4Q5DQrpKMRIx9hk37f3Ehz8DbZ6VbJqVsWoA
 eHp0Y8w3gV3y32KGbv5ekwGWuW5WkT6cpaSzsmchsRfnX1l2dSfYc0HdOc8x9L20oIjXPE5YqYY
 Mj91OZnF9/Ih8fKjypiyFxKGWvKMCb+usc8x7L7+GZLtvt8RvwKHRkC/BNTfGCCahQG4QcBsMGD
 zOHdmFZ4g/JxF8mKlj+VW8tC9H/4dHv0QJzvZ4CtHydo7wqImbd+2Cf4HzAMfK4YBStOkgg7pHN
 WpRHK1T4Q30XlsXuPWSTaZKEnixPcvR8CHispsOBHHLLP9KRE+04PNkEzn3QkklyLplLzoOtdLy
 nvKb82/uWa1uGHjbziPDxPxJPY8QcnkAuzOHwmd2gMc/KKkS2SaY/ufCaUaVzHkdKI+HQe4ansi
 bP1PjqU5BH1VJF1CwjA==
X-Proofpoint-GUID: EiNCup7-7cW85_TQO9vI1rMk40oOGauu
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf1e10 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=84Ru73zTo6JNcb5XwS6KEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AO_i1zjuEiQEncmG7N4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: EiNCup7-7cW85_TQO9vI1rMk40oOGauu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX9VEZhcycxXMw
 Nq6sDpVVBYc7LZ+oIAPzQ+mvh8NtfkocCyde8XAMVZrIlFXZZ5IhsbZHQArjpFzq/yzJE6OxaZL
 MC631Nv9ZDU//WjZlvDyBfdinbtOw9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140024



On 13-10-2026 14:38, Konrad Dybcio wrote:
> On 10/5/26 5:29 PM, Maulik Shah wrote:
>> To achieve SoC low power mode like chip rail power collapse (CxPC),
>> the Monaco EVK board with four PMICs requires coordinated power-down of
>> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
>> collapse state is reserved for system-wide suspend (s2idle).
>>
>> Add the system_suspend domain idle state, mark it with system-state,
>> and reference it from the system power domain.
>>
>> Assisted-by: Codex:GPT-6
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 539c9c80a808..b2978be6823d 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> Why is this board-specific?
The deepest state is only supported on the Monaco EVK board with four PMICs. The monaco-ac-evk.dts is with two PMICs and do not support the power down of SAIL.
>
>> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>>  		};
>>  	};
>>  
>> +	cpus {
>> +		domain-idle-states {
>> +			system_suspend: domain-suspend {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x4200C344>;
> Please keep the hex numbers lowercase
Ack, will update in v2.

Thanks,
Maulik
