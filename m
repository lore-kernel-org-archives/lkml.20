Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009431;
	b=FgrY7WB62mbSN5A2xioIt1iB1nAn65Xc6xOxfeTlWl7pkCSW5u304E8r0MUe5MguM8JP
	 DxHWf+rzQorY9c3bmCrJtui8ZC9Tszk/gJgKnTkkvkUHmIFpNeUw4TycE0j/A+d1oi23u
	 Z7sWom/BtPZ78gaaW5k4ua2V259fc3QU6N2YSPPq64Tyt7odPzAiop0umGiUutPiZhBxl
	 8UNcms/XSE16D9eb3J7gEhA9jGhybzsuoR/JtJJea7sV+O/sYW+DMZiHhS339j5RgppbM
	 Ho/BcFS8HxCwvPqCYuo1IbEtDjlji0DdSiQYDKvjElSxOPtbKo4zRn7xGdipgVZNLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
	b=fm+JsoAkNoO2QGgaXxMyAadN5vog3wkmEEv6Eizki6Kowc4xhLtQN6J7UZ/kxrdLiw0I
	 isdGmq1ZvFIYD8VM9GHUutt50JZ0DX4IB2c/l8i3LmhaMLWdV1wdmViubm64rIVlk1/WJ
	 WoJn4uYtU3uakDNixbRTYuqsEY3YQwEq7Mn58eji3Kl76bHt8fG3mPQnD3n2GN+Itv81I
	 FV31BlE0rXPznDvf8XrWG1gKZsmdRnRzzxtAfYEJZM7XXEf5ZnUzPA8koe6rEpp6CTbTw
	 gw2oPLl/SxKsW5lqGA9DUIc5kGi8Ybgjw66OVLeSuByonbYSGPLDxeXIpClGCJttb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/DMihYK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F277606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F277606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/DMihYK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9NK718211
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=; b=VCb+6FDP3Y+nEgD5
	4/8+M2fv8ldjC/JW3P4ulme6+kJYEeKz3duC4BlEWuxilut/8XTzOTeEZRdrP/is
	eHupL6qruSxsrTX8ar00GHR3AAifgbw0YMdeoipKq1X8j2iVGMrw4pllRdkxbNbq
	p1urT2Eo0JkfB8wel2+L53r07+ZXLzOTPFYWgVDeZS8KNT31tkr2n54zttxlSqJX
	532KGSxfWWfkmWMOaPnAWxGhfnRbAUuiNdZbH9q9c8192NIpJeYqhhmfSm8rKM2w
	pLjXddHqUYxqzupxMJPzBB67ErUrDl+44zWJo8iyl5dmXfHv3sZFSbOgbAhHTKWW
	MRn7UQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssxgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so36249485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009430; x=1793614230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=M/DMihYKjqJEC0D0R5rcurBNv1i5LMixNpfqQodsSj67tpYXEk3x07AVbktvgkj9fT
         8gAsduEerqSblHxrJqq9ZJqAPgDjqIMLmk2lkBUQYqJa9EWNnAdUoohL4Pxx3c+nLZgW
         VG1RpdC+ANnHYR2Mc6KnGEDNQRmnlea2ihDR74ALKEgtJL3yIakYuDGzcmSWMRebabIT
         OiNvXyEjqXtpbZm1mT12fG6w1roL1PQ+gHFMrIU9PRT4OJPNXnoTwK5JMaY2JN0NabCB
         a0iy94nFsrrrWtOpzut0cm1u7PhooKWcMM2Jee+ZZmjJxOuq04C5YuvbEcmGVT7rx50F
         hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009430; x=1793614230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=Hc9mrijnc2PJxySJ+Y7iYvzFX+rjLWsB0ZpxTTjvGk+hHNETZ9q5ijdZwaNIPbkWan
         bvELQTVvACbEHqZWrmbNnqWtK06ty+uXAgUWZ4OAFqjE7xvI17PGWm2dq091pFSvUmsX
         bWZhXpw1pmlGFzHGBlznhwyQ7UJt/HuKUVz+4sBF/peaB76XBjgzeovvXY4EwX7wJ+wh
         NWxyxq3Y/LHcsIJo5N5DNNpWhiJo13bMD+AQ9gZOlZgVWpVx/rhjsbeDdEe4xIJRkvbs
         trbPgyugDgSdZtrv4kD+75gRY3oqOichriUin1gSi8SbmDQrlDf51mFVEbHvwhrI53eO
         6qJA==
X-Forwarded-Encrypted: i=1; AKwUvBykX/67wlLrS3c4aWxHPTmh0Ne+nMkfTBdeSOnyo5HhvO6sciT7D/lSGZ0de1dKVCiJHg9y9SENG9wEL6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHx6Bfo/mKOSPvycaKhV8jV5eG3wlcOPXRhUEfPmxfyDK3euYu
	x4RZAGvb/jrpCyBDnAQgLiy1khozay7fbbBf5u675nNuTsq026UHyuVyy2bbKozUgnISaaDEasF
	l42MifXRvesm0lJ9gr9hS1/DejkoC+Phn1jEoVposf+UAXxhN/sW7wt2fggtBs/HfC+E=
X-Gm-Gg: AYBFou2xTx+EuwRuM6deu6gW3B/4GxY648QH5PKLhqb4ZiikrL3q8vZR3CSiW9Dy6H4
	bILjBUHskVkMPfkeO7ydBpIrcfJ2RfusySHUFcuqCJhtUDrbqYwYZq3IsZscwlDjCJs07fR0HHE
	UFhUE+pY2b9/GZhj/0sw/HGmeIz5JLH/fUYBqOxC5FnIMkv+B6SR3UTZR3haQZcOLVXQrHPdi7M
	xFutNE9OrLD0Aat1HWLdiWei2zPbdhwViqgv11fu2yovvV4QiiASirc9Otal8W2AAE+WrAcEFwH
	C2Q8HW//o0QgFiBT7i2gxAmnzH5Enfe6JdendsV3UHv3rXXrj3j7jPHU3m6WQGR7lYnn+6deJZ6
	YaKv9CRjHqcd7/ph52TWHUA==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914304485a.5.1793009429502;
        Mon, 26 Oct 2026 03:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914300485a.5.1793009428855;
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm293589166b.61.2026.10.26.03.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <a0ef39c9-d6a7-4e4d-a87e-e2fe72afcb73@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:10:26 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
To: Tyler Baker <tyler.baker@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX0RwiAlqm/AXm
 CMge9brpOCvD745sYwYoSn3PcvsVESbRnSIAfHWZddOxn+b8uMohP+Q69xT0vwu/vBXRH+lVJoe
 YMq1QGsAa43C1GLsAC8wHq9B+XntKpo=
X-Proofpoint-GUID: Fmx2Cg-zNIo--5yZVphcAtFNeWAnxKtv
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf2716 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOOwgwI-Wrxjjh533TEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Fmx2Cg-zNIo--5yZVphcAtFNeWAnxKtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX14If1YV3tQ2c
 +6ZnW+mTp6hZSelFt1qMacse2sD3OBBi1V9W3g0wJzItYGlEWg6z2vWl2ZYQLa85voOVPNd5zfi
 XhTYjO+pN8R7KOfSWyKu0B+qdE8WIVuHBxdP0iIiUI6DGIsEP+oAH9QtRVnUYeiIE73EIXGrpiC
 Os5XOu6UNDdSTRXbq4/mjHX23M5vepIwwX6T3j7cHvbEa15jrKKHGrCax9JTiv8wuWCo3d4AUL/
 RKrx31a+QQf0DVUuA80ZhvdKa6FgQriDx+F9EzI+r+LEcgf73mN/s40C9w6s6uhZGc8yprnS6eQ
 cocqTBGeBXcZPknromtkhqxAsA8HWDg0f0QFgVak5qCsP8sZJuUDyIUIcWh7qcEQGKIab0rhUO2
 2zGPdGrsheAbSqxDdjDS0POjmjSFQzwykVvp2kbfy26M/CyWfDeSnpezJpIjuiSJeQXOyRXU62+
 Tng1i53VI72IyiHkPPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260040

On 10/25/26 2:09 AM, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
