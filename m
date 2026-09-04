Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6A73B2D1D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511951; cv=none; b=Ge4sJnDhuvlcKbiQPpugB/9L6v06/AHRzQwCQvDHCXEMNbY8UZVV87ERJXYp6tNI6uhgV5X4jHprvq9rmAka6NNjMTX7Yd9w1aivTPIWTgzUbBmViU9XsV668RhMBi8deRsUK++KhEP8pIvDm1g+HRcC/yiwFN/uYm1fD3fq7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511951; c=relaxed/simple;
	bh=u8emeScZ1VxCOwdH8jxMxsFHL75wPiRAAT/6Jj7JFYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCC8yiWo9TiOAOWVfXn5PBHWoX7Kph4eLHRhbkpkYgVfO2xUgmxNaldFtU2huNoBvfUFxu4kFtcYcBIBCiZmV+gZNWdnbP6zXKCT0RxQS40DlyTU56KhJGyCM5III7bFwTcidFdofoB8aljRuyZZaCy8vQy7nZdiGbkfkH9UavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp9RnXbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6J/2ngq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp9RnXbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6J/2ngq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847nL153454669
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=; b=gp9RnXbtsidWyTJ8
	cZNY/UT2P0V+NFDYRFzz2J68xJ1rm9JcKlNlnaYAfnnHja5VKKxwyJ/NzOKJbWDW
	g6Ih3xK90ZflwVVd/BOCpP6lJI5WE2QTNagaBs1ysG4Z8GPEOyFBL6WekZmg8czJ
	4syRIeuKE1VJORmbgGnUZKEGX8WLNl9KX+Wmz4/qZuCop3uGZ5qGdPRrN0GoxpR2
	t0KE/S2LpQopgjYYpn9jVhyo4M8kzFxZd64HOQdjBJ8YAJH1peCKEAIo6Di+KW3u
	+QbCWyGj1E/0TriRNcAafN+sGTg5T+o/wLnkxOPTkDGXz2jjQiPKwb5rrK6DM4VU
	Jz3O3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9swqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:52:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494b1e35cso14334885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511948; x=1789116748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=a6J/2ngqipS9J5NCh6+sgN04+JE4IfBsdSXLB+Srv8SuIBNYWrqGWPkahMb9E/J7eg
         yPn/PxedNk0tXQb4P89otAVm8heYi+J0kZ0vf64370lMAbuvxeDOwLgTGJl5gyK3Kmxu
         dPuLbU+sehTFvNoGaCHzErH5JyyFDkSW89mAGotu8yxRP1bbju8P5vaSXqo8ZXZWvwXq
         /ldcpKPAbs43xHlGypWAcVbk729iP5mPaswCtb4V8Scl6YPeGhEy/DXgnMh7DAQOcGqC
         hCZ8VyR8sVew8EaJaC9XgHCCemqK283D7y7UQyAYQKsti7cASIsQP4LB5fkgkUZ4ceW5
         HwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511948; x=1789116748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=Q15FNYcCjLH86tHbsmlwufDb8wOF7nJW8XklG5mkPrSpvrVN5xMxyzQ3TUcMN8up/b
         DrnDGUZTpdwG7ENwze2j1pecDn2ROiGz426JcBrqfaW1E33m62Byj3z3RbkT8eaKiZ/m
         PQkfDqXuy+3SIRsIBu1XAmNYFHmV51gLHQmcEZGE6pdzbwIRkEsLAT2uAOQV2dGBOLZH
         AgTOp3axqSPvUxDnHA9cKfJZ37g5mn6pyhrXVOCdBWoI4GB5VRi8v4X94h5CZ0lD1sy7
         PGdUWBMBOpLv2ncRmhQyW8Z8k3pNiYqlDLopi+PUo4CJH6d9oCd2yw53hLZp0zqLGKry
         jivg==
X-Forwarded-Encrypted: i=1; AKwUvBw/dP/QjPFPFugCNjpfiQ1BklV8423nU4SfBtG4E69d47UZwFqt/jN04Vl5HB9nFZluy6tGZq5tJiY7z9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nyq5++giqlnZLKP989k2UVEEX0z7/bztSghU5oY1X/zh7O+m4j
	fNr25udGAX9qvaG9ZVdgKght99/gsJWULKLOzv1V0irAwPJMbB5zs+UoyOd0TrBKCQOKc4uhUc+
	P6JdFWXn5LrEjfa1AdTnMnhVMW/yyKijF4Uv6lC8w+HCd0T29uFV9K0dC9UJxe94/9ec=
X-Gm-Gg: AYBFou22SaZTsynNHuAQprnIO8axQog/A2wdc2IoWqBN9V+Iluz9zIFbCKPOkOJ034d
	hD9idKNEgj3hftQ/kPJNELAzuMw02ldNpZAdrZBoZ5UYyQLji6ilJpaqQIMs1qVcQoeSxtrT0kT
	5TN21MTyVPAEq/g7iCTpZxUCZd4RIXQgUhZLf0Q1Md4LUGd5rNN0EyMziQ+hCkGl+GP6XPCvI5N
	AWWtA2tvTScYoHIF3YYQpxNFCuw4c0s0oU2+ySPcN9N0zZ1Qokl9eyRj4bBA7IfnOe/431DP8Xo
	oztvFTsInBM7KFxZP9VKb6aydBoG6h7K/3IhQm/HQtqm43c8cQuppGPSsK/gAtb7VFXeee9wzXJ
	1NzurvsYNSu43kUyNtW4Kig==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303191285a.1.1788511948003;
        Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303188385a.1.1788511947490;
        Fri, 04 Sep 2026 01:52:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b72sm76908166b.18.2026.09.04.01.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:52:26 -0700 (PDT)
Message-ID: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9a86cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eEzEi8mspgMuG-bTNdcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfXzKMbEeCnzlRM
 PwVR+oFe85cpnE7OLF+/I9hW2tWenBLkVjUzkFajkKlovG6hIDGE/KsF532OLZLpm6e0u4DwJZZ
 Fk1DOkTtZbNQO/XytvyLRAk236wkNf3nT+J+8FOGji1bij8yEkTY6N/HCCyrexg0q6ZqbJSWnw5
 3GI7GzbI49aSuV1M5UZX6Qc/NtG+6Dl+4t4htlZBJCyr0JhtFK72CTtUWZfYnCuRPRjPsN4z78G
 TmykRTYpeTZ5FVA6lcOMbF3HlC2vPg+eqpJDlZiAUvlcPF4xlAKGUfacwFXMQ5e3WpAUyjNXVUH
 eHaO5a6NF14sWU7XK34YPUc+OZW4WIIDqb36rtvDIrukexSMBQlF2bTZTtlK7xP1TllVvQkOX54
 Kt+CtItxItdeSdjhDxHMMzonnxsXu50dTxOehJ0rjoeQoUfkIa7zzujR9ytgWffAdRZl3ZwK5YQ
 GHuMSPs6XLvI9iF+jFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX2Km6+isZwk3b
 75iApZkZOiiPvkZJRNX2SUUfn3aXO3PStac+pIT8vyItCM8Ud4zx/iHX2LAsEMDk24EidRlwhuq
 uGo3+HRTfSfRctTRUrUvqfvQAxySRHo=
X-Proofpoint-ORIG-GUID: mLOd5qlQ8KZwrVqgsJanSty0bKZykZ9-
X-Proofpoint-GUID: mLOd5qlQ8KZwrVqgsJanSty0bKZykZ9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040081

On 8/27/26 7:59 PM, Praveen Talari wrote:
> The I2C driver currently assumes a fixed source clock selection and always
> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
> needs to switch between different source clocks.
> 
> Add the source clock index and frequency to the I2C clock map entries and
> use them while configuring the controller. Request the required
> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
> with the matching source index.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +	dev_pm_opp_set_rate(dev, 0);

This and the below call are unnecessary, rate and enablement/disablement
of a clock are orthogonal operations

Konrad

> +
>  	return 0;
>  }
>  
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (gi2c->dev_data->power_on) {
>  		ret = gi2c->dev_data->power_on(&gi2c->se);
>  		if (ret)
> 
