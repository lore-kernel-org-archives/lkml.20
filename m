Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B082A4A7C95
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733926; cv=none; b=MDI8zXSvRbHKFxmPoXkfNILr7xSUWSYiHFjTO9GI+d+RlwvjYWorhOELEL1y5WGAjzkXc8jLuH2HbIAYn9mcrI+hhUdMfZY4wipRsFXMrxVYXI4KaoZP5wJUcDs7ok1dkdxG84nCojhHPJh1B7jnSRbVEVnNpKtWkFNEV+RWccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733926; c=relaxed/simple;
	bh=wapxrbOKn0aJ+lRvm1E7CjXQYuLnjYoitWtQ+7teQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGw2UiEIRvWr806MF7samaMGWC9RZeTuUk8dAnPmKCUMtaN7ABACBiGjIgb53JfhUp6GN3VESFRpKm+v6IQKTHsnE3r/KMUNfusz+ig4vJqbAhupZ21xep7BBY+MH1ALcq/6UlFK0wNBc3gkh1vu84DfuuNPrzOCI6kcdrhJN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIVnV7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUzbzjZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIVnV7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUzbzjZc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dZvf1404272
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=; b=hIVnV7Fk2rOPC2+Q
	7XI/n3bpaC6WD9gitchTLUpGTFRPt10Dli4VF/T0zBviQTzRbBnkvlF3j5IZyWc+
	9JMIKkUgFMs3ablTZTGJkI4/Tl38m8GphLLeo+odRedmdfQXJrAWTW8DJapPwUt4
	PZVxGNcLy3mjz457GCKGksfFmwAraseJ4Wye9K9hBh9au1aCPhxF+O+N138QcQwO
	PgQDBsKjYMyG6XIKtu6Ds1ukxX8ODQdbFpoOgxmduyCcKY45hXC669xnhrlEs7AD
	Xe6yESzibXRIRrZXHjjUST69VReCrCfnthb5rb0kqdB26mRh3iYs9EeEccTDrcPv
	QuEGfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdptk2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91240299f0bso1328466d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733922; x=1790338722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=HUzbzjZcmlDTQt9LEPgf1V5G/kaU0o9ooLDj7lBHDM3DwnAhAVAz/Ud8gLPxGcISn0
         uAlo8vlC111b/K8fzw5UXlTT1RegmcM7nbW3FiIqErd+g0bR7pjdbfgmSVQwjfXCnmJc
         mYkmqO6weRgAHuCUvObHrtWSk4Sp1B4QFkLpqFHkXAUoga4mWN2O16SeZTq53HgU9kdw
         36kTMUeNK0/VL2wPNXkaaZibEV2dok2+Qh07HsKxP0vX8yVnb4zRh9/7Nx2eu6Qj/OAu
         YQ/VVEqaPYJvNlMZk6hXAPZ9qoLMBSK0z1y3wpwnYAGnCcnEZy00Q1aCp035ArA3UFwb
         Z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733922; x=1790338722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=pO97mISmSYB9/uzAWc6R6s/AIZyYFQyD4hxGGJe1vDt5kKhgAfF/pFI4LXr9xnG/p4
         k7xRcIPCL1VpMHeGSCjjo4x+gtRXg0MmG2jAOpu3LSH+4hMfZuMLmCCmmzXkHUfk/j5K
         5bNERyhupHLox+2UcjeZT7n3ZB+Acdo171JUWEPRsFfy98rHtwOZLTNWnTXjohFwqnxy
         aEMI2neAVEwQbqYayKsZ10Wat9zuuEn1IC8yBB4/CbiF1tW7mUhpnftIrSZfazGmrn84
         pc3EAvR3CkHUT3bCFAgmlwT3kZ/9Q4L02lGpafjrZ+xBLAlhrd9U0vnkykXcgAgDkLwm
         PcaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMJ7HuAJvBRLf1CFDct64kiKnIn6KaCQdFtFOQxcoIJk1BBCVrP8tw4PueS/4JhhcyjUyVcS7jMbnMjqw=@vger.kernel.org
X-Gm-Message-State: AFuF++nqCbqSkt0I29k70kfO3dMjapV9dNowgXxrZOXvwfoAg2feabYl
	/jeyZI9AN7sleu3ykKP6zaofxAEIpxSQdViKW93X5QhCPC6UMmO7xX7+kK6Ud2qfiF4IihAtpVM
	yWwldhCEXuk9fL0qDRiEB5l7/xn+1QKOGjoQRTxEhd1zWc2jD2+qJ+Vs8v+pdex82q/k=
X-Gm-Gg: AYBFou1CX6+026o6NC49h0JreU5GWWFG8ww8msIXJMBxp8PfjOmAa2BzV0yJpPcWeun
	6XYI/2D6BhKDVCITgt/fIErQmaCwa626tMvq/CUTq2yo73r7IXxy9cbbNwZFu3i4AQr7i/4eW7e
	0535FAHGPMrNxuFLYFEKpvgDnoTVFARRyZ5AbGBkOctXWml8c5Cip8RgteeDk5vAq+bHEjW/gbP
	CpKujFE1BsvAkIfjkJsNH/NYCyz9xwv1DjiNyLLbqJXXt4HfV/SAOMybLKrIu/5FwyYfZcDjIRB
	p44XEvFOxTY2y9SZTPANwPW3jFecUen/lnNsyuN6zPiKgrpgs9cqOCTyVQFGx0C1G4cb3tc8KM+
	YcF/+W7XkgRXn1bq2Nquajg==
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240482585a.4.1789733922571;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240476185a.4.1789733922045;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5979cea5sm785612a12.31.2026.09.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:41 -0700 (PDT)
Message-ID: <002eb70b-17fe-496d-870f-ac15c62fe32e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
 <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX8y7IVW3q+o0o
 JiWOSkl7FQe95z+hvEkp72dqLuTS3mFd8h7nk5/wP6E9WeKTOOql2NtZPmHeiCwFFg3bjkgOUKT
 yhkt9C7HUC7V0Eg7DmowHvW+BkgoxG8gJyhxXW4t1oQwIBN6b8r+0iKRX9S7sbyRupQqcrrNGQX
 5ZtXqWbWUF61n77j7GIs/iDJH+0i5SxYrmnsFZaS7lf+iani9iY7DG5EXCli7akzeiEGCLHunt4
 jpfpIo6kyLFk+CD39dbtftZfElHzSuCh5gSvBaumMB8in3KcyhAcZVarL6eCZDSUwdNAUNlj1fM
 bxVHqR1FuZftlNFQrddRviFxvQC1c3gJCJaXVrE6KZ6RMwXBu7n44zzt30qXh92V7H6jikv36Ft
 6b9cr94clHWAmXG4TvM1gAdKxDKLykKPqAwxPd3sJ0rDLA8hOTQ/w7AUHf4ynJkKWim6eWj3hl8
 Q86eTG39yaikR/Zc2bw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad2c23 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=BxavHUX6cQikRYdMHAsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfXw2es91v8wseR
 L3BVSS+8fTZcnGwyd2DJQT271n8G8dilf2W1Aw8eCegz3acepCtLUJ/BhAYnUe2QatxCKAGpaZi
 FjzwS+LBKGu3iPuLWgd26rA7B8W7AXY=
X-Proofpoint-ORIG-GUID: eM_6ZlWxwJbWyHeoQVavHWz4VPsup29B
X-Proofpoint-GUID: eM_6ZlWxwJbWyHeoQVavHWz4VPsup29B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180172

On 9/18/26 1:35 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
>> +static int asus_glymur_ec_resume(struct device *dev)
>> +{
>> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
>> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
>> +				asus_glymur_ec_suspend,
>> +				asus_glymur_ec_resume);
>> +
>> +static const struct of_device_id asus_glymur_ec_of_match[] = {
>> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
>> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },
> 
> Does this mean devices are compatible? If so should be expressed in the
> bindings. If not, should be expressed in bindings commit msg, see
> writing bindings docs.

They generally seem to be, but because of the very limited information
we have, I don't think it's worth risking associating them.. Would
a mention of this be enough?

Konrad
