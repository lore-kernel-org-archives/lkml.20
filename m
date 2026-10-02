Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB11FE451
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961746; cv=none; b=T8hr6L0QZeHqVUHvE6mIzKYkMsbxAGJHufMf7T60uCCbKI/eCk05CwAKhhW53g9cOlfj3DltCAROv9LI/tVzRxUNk27MWcfmfmqc/ZXpwAOPYDtmkJoJIzRyymIxsgMBIwIzLBWpk3aGDeCpMTuhS9Wclv+ySB+hawOUZwBhuFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961746; c=relaxed/simple;
	bh=wfkQTCtihLuQmkMLSwbhTu0nmBiQEOBAVacLI6it58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPmG5S4qYlk5vdv+/GYvv1z5hBUC6SGpwaD742u1P1cTdXbh8Rf8t8If/mOnqhRTJ7U6xUDPKWEeUX8ZdYjfJZ6wKz03pqgxYmYgksMejX6p35D3SI17dWDV7qoURYddcYNbXk10M0mnBLzubOCCGcAAUEIoiTPyPSaHAOCkW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4b6DvWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxquiZya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4b6DvWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxquiZya"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H68Om671106
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 17:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=; b=f4b6DvWMKkZ4SuUv
	SMc4ECK+16+u/XjEnUJDUXU+RI6+O5P66DCqWtdKyizQolxNe3p2Mwck6Wa8oaD4
	wjPrFHKxekDCVFLvUR+cPZQ4MuUVYVxQdmhivEcKAdEFbdoVkQfk8IP54PHrbrfb
	kLZ2gCEFqeVdyyyVanpwKo0k1SSsDj3FD4robtkr1ahtQiimE+nwOxNU0zHmHMWo
	vS6wb3pslb0tUU0UTYd1XCgMd/U7jXFFNT/N0DGbrOsU+XZ1lEp9zxQbB/3HI8Rj
	ji7jgi9eJcxAemgb5C5ur3eIUgt1EAAoG9ASxaZ64nITp7dCN+J23IYuleYZwOEA
	iNxwIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxec9q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:22:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so180254a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961736; x=1791566536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=JxquiZyaLYW9rEi2BLzsb9xykanhQc9wqF1DtFB1YKeNcdh85W999oi0wS43RhXPZ2
         IwBcdZRvuFWA7oTyRcNQ5GCaRVNAVDE0gOl+XeXyuqx/CclivNis3HyQwAuvvAKM7guE
         uTFZPkDEfqPGn+hIgVJX1vEp5SoYHVCVKd35CjxUwj9SPS9ayMZtXA2h/0GSr0AYGFpL
         rUsTdrvX6Qz6JxaeQQNJnZJchmnJPzh4SX4GAj5qYQXBAKdXue3uPmL7e2R4krp2Cfl6
         0n4wgTqcMuzSfqsjj+omFsiqp+PSmz8ba1O3NxKkO8tbJLcbSGhJgbbfQ5fsm7lOIK5a
         Wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961736; x=1791566536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=wUVhjV4H+zBKJ3mdJCNGD+DQDmEHJ3eArJnjymt0C4wPlLWEKEcbv/cVLepFnwtGJH
         DDWTc7P5RA2sn3W+t1uZPA8vRYQi7hqKIFk3UPNbtetKsgMkI1tq+gKIMR3k93yO1wIF
         4iZi7WnJYXlKJOU8ONtY/UvH+uImm2x3aBTw5nx8Nhn1pMs5s0KjK3xJjB/bE9gGicKv
         uQakgX1Cks92iNB1im6Zqsf2god/6D2HVqbCc953OLC1S+ITluYYE0igNP4gGqpfvvvg
         SCQtP/Hpd2ZqP0ipYodMZ1lxwymGuN8K/SybGgsb1upUzP2HZSG2SNb++ql1K0AiCWCT
         ykFA==
X-Forwarded-Encrypted: i=1; AKwUvBxbTJm8+BRZaIHJHX26kDb0/XdJjLcc8CQXEXPx9Fu70QtEeAxlna71Q7Zu1nHshhDjQV78pWJrqRP0pQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuDpBMJ/HhxYFJw3NwEVDM7F0KhWJqrG99ykLX9O8YfYqBjUf4
	NhN1KCrcvTFIahMETPXCjI5bMpvuRbdPE4kuxHFI4UCzZqVmvZXCyP5Kg2GyFNesDYNpzZ7ZMGk
	u1DYjJpPpDBZ7ME+O/x1XrXPvbYfZ6a6mRvk+O2EytKWyFiHlZFK3r8t/7NriZ3mg+E0=
X-Gm-Gg: AYBFou1Sx9WlX0akXqIeXiYuJHj3h+hLhW4WU8higNyNuDPut4iSPUouUs5koP54fCI
	GwcvqolXmwog7NGL0iSiKuB7/p2zh+WmWv+HNDjKnNbQoKKutTUyG8ICC9vFkWuz1y9odXpjbAC
	ul8bh6OH9/TidqFYlSRaTvGF6biBvc1GysAf2vutCXzkQW9DVtWoGuFKJGh1PhAfhdDgdYzd8h5
	4+yVWD8SoDYJ5+1zQ9NLnrSHEHeiUPEE62E46cV9bQOTqmSWKxlWdF4YIOT6EaFmLUwLb0Bqqz+
	gHg8yiYlbE3fwvN35cQa5ZU3ucetaIuDHcR+SQq733XOcnuHor3yX+HhlXnXxILqr5J2xJ9hyoQ
	Y6wzDtpkqNkjQoNCDl8yO4q3DHbcD
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609533a91.6.1790961736206;
        Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609499a91.6.1790961735611;
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm10811502a91.2.2026.10.02.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Message-ID: <3acac1a0-a64d-4549-946d-874df45c3dac@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:52:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfe848 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8OnqRJIPthK_NWlYLWPozjRVxC3YINNR
X-Proofpoint-ORIG-GUID: 8OnqRJIPthK_NWlYLWPozjRVxC3YINNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX2FfBXWG0dKZT
 mH/kiuqLvgBBI1Xv/Md9APLUmjVxbHyftzBFqI4aw3iuL9Wpdx8U4w33vXjJ9TQ9oSkSHlSc3kh
 UxxHjuAOBBM+cRRY/2a5XDleSw8LA5WI/kBbkLZFC/VIoJWzW7Q1nFPm4nCwGk4Y+xTjDOC8yw9
 9J0x+7Dlk90qUqHnCV+WE7aKpcvxys432wc0s8qjij/m5QbK7jLVMGwRBZoEKNhHKJ9kxWFY0ap
 QK6xLIITYMY7xTCEbPBjfMKrHxRCTBrtW0EUAsPKFKhXGld/XMiuv2eZRU2BCKNpCGEMk+LKq4R
 yMACFO30gED0L5weD66b3/HW1DugEWNiJUcPkoLDU2odxxNNMAQ0HW4PlKMe+KxgcB79937bpOG
 etFn56G/ApfJQdvBs9yIf8FdoAEifvfdpMtCW/BoM37lFdJAfiVoZFm9uS+jre0wKVZn16pc7uT
 Tx8yUPGoByZF6L23YnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfXyRMABRHz4Rvn
 AfandQ9yXjxWn+jyWwOOXtDI1HBUC0njE+0f5URVnlsWd2o3IRuDLGaYtrjz51Byeleoa1utzQX
 LEPX8Yw29MLA+Y6MeAqxiY2enZuYx9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020069



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          | 11 +++++
>  drivers/clk/qcom/Makefile         |  1 +
>  drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

