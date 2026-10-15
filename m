Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7085503BF4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061079; cv=none; b=pWyYnJtRqAfidoGrMewpJs8ELi6PfV0kGTDvs5dt1PGcXYwzZVd5ji/r46ZnRmRqenI9MOnGlx083SJ1co76LSWz37nJTYLiphyNm+KBAB6FUBSaOOwSXVgm1JbTCgbv31Dp6CUzWTvjQzh8xQsVM1Nl78IOrryo/IYPpZHf+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061079; c=relaxed/simple;
	bh=pjmB0KZlmblBqUhkEx3AkMCixjS/J+z8FmoDfp/UB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMMgMjLUaFgMAkLJsW9RhRCR6grM0Dpq0TUPE3HjSGBNRWqdIlIwRDRkBbPm7tvLg58Ie80V+bsq/TMQD0CMCJwZ0QGjxN0oTlwXqPqInb3BKMEdj8b4HdyxanHCuPkvfPeWgbdwzL7Ymdn4ZM2kQC9VaVfUkRcWjy4P6QRpQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chKRnG5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8VgVAlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chKRnG5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8VgVAlM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuhq1596369
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=; b=chKRnG5ZAvs4UbHN
	fE7gXArvvnJfVCAcXdqPVAkqozgTYu/5pTFUljvjqq5YU1qfakhtvue7QSD9Wt/m
	uyxtUGXIXgBV+p+7rX06Ax3S0L+X9iD0pIhrPt9dLcL4GgpnzwMhBvEZOnnP6tGj
	8uzSNNbcM8+qCn92LMrFzVfmXjPSrjPq2db1e2+BYWWupH0MmJLWVN6mW1XFSo+b
	E5PPL6wqiIAwrx8F5foxc6S6mR6bYVeZrXML5AZAENh9osUHzCqdVK3x1C/yyWLg
	BWR7dmD88bRwxYZOXEfXII012rP2icJ4glvo8/LvhBFEXBKV/6TwcJWeHB6LeeBK
	NsqG0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v824u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7732608eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061076; x=1792665876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=F8VgVAlMkA9XSY4Tm5bI4sKJmmebfslRPddRI9n2LoPD1tceawlRNyggpMN60QjhKC
         CGMhHw9UKd28U9hmAR4W81zu/47KNWCSo9OgPRxmpO0HtXTA8CTsbCeR159FixulhXPX
         qzMOUlBbW0C0yLFQ2/HC/uJuTf6hHs0TXpTX6mUM0QAylKbmWmFMjzKods9aAo90TNlf
         IObuNmMNYGhrXvpG0XNPzr+cEQGjFaCtZKyzK/xOC0/qMWBhlc3ro+kuWXYuQcJcZp6F
         fgP44m4k3FQPJqP/HtQV2z3ssn7/1ISI7aOk5iiQWWwBKvSYemRlP+IJspik9/rICeI8
         MD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061076; x=1792665876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=zLqw4GGQSfUlxyDTaybPJCt2/YuykKShyjse7WbhCEc6kQTd6Q7YC/ZAWIOGl+oxH9
         vvxNQbjwmMhqXUYguwhRk/RRtX0Pju+IPDXGPEAgDM4DBtKmqd+AwHebyTepj23nNPSN
         xG8oZvelPXkrJwmIqxDzRBEObb0hCp2LuABOF8K+rq56FHaL6mbxI03K+nhVxd6nLKlW
         WInpQxBG+2NkLCYYq3ALM2w2BVpojvpyqYumuNVYwLwjEmCvPoIYjsAVsHfNTOzW3XDC
         ZHwztDRiqfWCf0yD/Ni/x2uuIXDQP/IOgswTwGv3B5HehwyfsNsqsndWT586vKAN3n1D
         dCeA==
X-Forwarded-Encrypted: i=1; AKwUvBz4ni1KAUv+Ta3dTw4Oqtl09Uj0JGPvcnleX7fqopnSIcDqQ9fmheUkWvwWUAwT77PZXw/wXqcRBQsEUhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLwCYLgBr5yi9j4GuH2AjKZcPqh9uUF4/Dki9hQ6wVM77IjMPy
	qAp7OnICf0Hwq1K1UOG901tast+zQSKfDo2VDP5YhuLRVqBLH4/CuYahMauSai9rVbkK8eaZ50g
	Xb3t7+7ldgSu2jNCoMko/ucRDMs/LT+X8eFWBABtbL3XeGSxnbG8V/j65MihHL/mSsPQ=
X-Gm-Gg: AYBFou0sdECO5nchmRVI5imu6CjKMaGvvcBXHlsmIH4sgut04qDd4H2uUaECxi0Ua2n
	k/riR3YNqUu6xyFNsd8drVpipVD5v1QZ0XbLNlTpktKtTAR0Tvfr5JNyPxFwSZjgAjQhcoGO2r+
	7heHtHDKluiyqIDeThl69MDHERoBt+2tiZ3zSVnEZnbxv0RPi38GrA9d3oaukWg7plbBIeQTofB
	Aeks1T0oUZYBWD8rDQZJBTtQfMhjfG7Nhy8ZQXxc/ddCyCBTsfRpQ0YzDk8dO6RDg+VfNfqV25D
	sj+P5qKo/OzLtmWNg+2ErepmWU6mlwM4DQiDgEtxkJHXwJsee3rjKKasqDEoZ6r/tipWBjsOnbq
	9fBE1LdYJ1oylfE/+qOhvGIZwtFA=
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299375eec.11.1792061076278;
        Thu, 15 Oct 2026 03:44:36 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299334eec.11.1792061075690;
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm26096247eec.23.2026.10.15.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Message-ID: <e65dc4cc-b080-4af7-a443-d837fa596adf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX7Im72HHDGbxq
 uKwMtzuvuTBooS8jmUUkAhOLQn1ooPxQBpAv1+pXE909BrF8Va4n8aQ0lgt2oo/Z0DMO2Zn/tSQ
 CSokUApFxw4BPyYe/jvb9YghZbiCmvXPlJqj3x3r8tlB0J1rN4dcsTE+cye936wnmB+LyMTjUgV
 Pvo8IaTjDLaOGaTgaJTNQTY9fMAc/tFmwpWZL/4yD2reBPRAg0njHczUGrt/POPcYwZjLkVaBbe
 SFGZldw+Zb7O2kx9E1mZtG1ed7scr/2wnvNU9QhQqp1QAyhV2F8XvYGEQraI1AZyO+FvYEiV+ll
 F70zBRwpCq+H7uuVqfelgzCH4RGYcDdCmIQUgtYJybZJz9pGNvhkRMmYWkJzWmUffaVzXmP5Fry
 pixH7ESxWE8Ues4coveQhxPUtMHisMm5fRty6KMlF8saBaeMTLyQuiAi8wVrU6M3vJZW6PUxwqA
 x92G5YsQ0SFeBoaX+Tw==
X-Proofpoint-ORIG-GUID: sY-WSSjlA13bo3y7OUPLcSW2RaIJjopp
X-Proofpoint-GUID: sY-WSSjlA13bo3y7OUPLcSW2RaIJjopp
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ae95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Yqn-oMa6LnlrTNRXoS0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX/DamQSrcdchr
 tQrrnXUQFeJpNr3eWoQmyZCvqzcuecDkJdKANi1oqT3pkVhcGKqaHdIxbsNgveC7zbn8+IQgI0S
 iPnDdsi0/kj1PXVOp4TMXFFQX7EQzl4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042



On 6/8/2026 12:52 PM, Luca Weiss wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>>  				function = "edp_hot";
>>  			};
>>  
>> +			gp_mn_active: gp_mn_active-state {
>> +				pins = "gpio35";
> gpio60?
> 
> I still find it incredible that the QCM6490 datasheet (80-20659-1 Rev.
> AJ) doesn't even mention this functionality on GPIO_60.. I wonder what
> else is hidden on these SoCs.


Thanks Luca, my bad will update this in the next patch.

-- 
Thanks,
Taniya Das

