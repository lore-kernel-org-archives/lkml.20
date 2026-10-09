Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84792471418
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530301; cv=none; b=RjA14OoCIe0Vdfs5bSwiFsAdxxkHu+C9pgI1RXuhX2qyJuo3n5h4EPVU3Z6gP9rXiJgVBKabeIC8HETu2XwTROckYxEnXinYUgc2sG7uDfZ3/9cxOYezMcDjc7BPxGEn2AsP9gJMvJWirbUky5eVag3+MZrQSLO5aMwLPVb6//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530301; c=relaxed/simple;
	bh=Hb0rWW40uKXilgUjU9jGWK/YbIuEzO3fmI8pUzTP80M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYQtnbZbLjiRGwNyCszIQHBa4RdPaU8/NKZ16PPWcpC1R5YZzwDJAPc2hTFTfIxvNmwfPCeCtqOQRMrudpOlnXjxOgm1MCLCmBBRSH/HQrbpMX8VlVAHXjbjeZhSvxPN8gR5vPRetocUO69nuWraT5GtImmm+ehC1g/7LO4UQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8j7lPXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZ0hMFhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8j7lPXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZ0hMFhO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hg7J250718
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=; b=A8j7lPXItWDRlbhr
	o+oL+AXG1K2QL1HZDerROxemTLf23p4YhRJIh9NsaF9tGAWmcbpm91baVgAByifj
	teZ0yy5FN1SWwbLkBl1kzQL1oudTQR+Jzl5FOydTR+clbYRouOHtV86LsZroqsac
	qTlhBL62/nZmfjPRPXCgcsPzPSqipgbIPWrmytfbLYTwBuvJVO+P9oCkCt6y4tlx
	4xsorh+lfFY5NmoRKvSPRFXhxPSxAZI6QgDHVVVBEYGx/mBUdsjNy7w6kR4yNTjy
	1SDVwePtnUmrn9jlgN+w+kfXSW0UYkv5IeXmKTcJZWhisx3o9OEcweVFK2Qa/Kwt
	lUfRhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqthjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:18:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so2711570a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530297; x=1792135097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=PZ0hMFhOTaIXhlFJofCzLDRXZVFSDhe+aahXuE88YaKtRHXhbJJJPXar9KM6HB2A4m
         TphJHI3MHtVpbHN4EUiijdjDO7I4zxRbpQrqhNTs9dCROOjRZCKXZv/lJpnY7Zc+svQM
         72lHUKaF5O6/zRUUiWadlQRuFh0WhYTeAUbHM1K4H9oxfGVLtVXaH2WeTA3KaxAc/snJ
         CjwyQJ2bmcrk+AkOvmUAx5WpUWmTksdgVUy4NMOXchAnef8qIxXwtEuk5lIaHhA9B3fH
         iXfjueN9iBjy2lwLVWQu2ilFB/8G4OpgtPaHnLKsnU5CBe0jkF905nqp/dhGMvBNFQ2w
         NyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530297; x=1792135097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=quR7nDNHvUAeF9bWOAbAqELDR1tKaJlWEmyB2+VLnTXGBDCT24H8W2VOOB0V4YInnv
         1sp4Xmw1HcElD9lzSqV0bKWF6tdBmmWq1BO7fOnBAVudSC8XiwotDevMu65nwWzsI6Ne
         4dAq4HjeNrX56Yar8pPQYDKS/fRZLj7cGKoQkAi0vYu6YH4TXNny3esTsMdKJ/bknYfI
         sqd1JifibQfHpaX6713fI5x8HgME37hsn2T6LhJU3qFtKKzdEvDlziqKXWgtM17ySCog
         z/TcaZ6mRy6iQTXHOy7eio/ePoG9/nK/OCsF0usYsqskQYD2oeyQvqgaYpAZ/5q6qehU
         JTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL68IYJk/pbyBwaXN29ntLdRnkBdxL8fGJ3XKJRi7U9H/TZ1G8gnJm126KqqHA8iySPgTxmn4Oq5M+mDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcjnDUPPD/uu7jfNvkKLNniBfHwGUuLl3yGas+NiNG4ipl9DwD
	fKqKgPx+4gTXvfhFVDKtScGddfI1cziEAdJQYDcWDITb8FlFWE8u6UUwxKVJx9JfXT75vnONPYX
	uZN15IGVSxx5KilUYnZJpHA+mQspOf7cwEiCUWOSJ4Bf526FM4SvDYM9N7RNHGOuzJI0=
X-Gm-Gg: AYBFou1GIOitM6IVwRCjUqvVk7Y0ZmBeJ2Y3ZR3HtcVY413ajL+Sk7pC9yZL6CNyqF/
	Q/834oK9pr26VXyi7XRxPDoOuE93S8k8suX8KNMegTCat4qSidxVuLq8RlENyLo58LEplu0vc8w
	r8QE3llhRnIQiJfI9wvxCvGZcU/s8vH0auYM6DZyH0YH3B5ew7ZkzXUGlaLFh4BURKBh0bkdQeh
	hz/Okr9sbCAUX351Knzk9C+J6HnXEmsnVoOM9ssfyjtwGLrqeU7wVy3iKOAExT5bNp0gvNG6SBD
	M8I2h9MCEaDAxkFT0rS9jE5pMEu2sTmIRxJ8g+cKPXfRjcgh7SKg5WVjXIL0/7vVsS4fkHNwp5L
	QWR06dgGn1SRh1NUxCn1/BvplmgqHkCj/bw==
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040706a91.18.1791530297086;
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040694a91.18.1791530296591;
        Fri, 09 Oct 2026 00:18:16 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d58bd0sm1274180a91.0.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:18:15 -0700 (PDT)
Message-ID: <0a8e4d43-1ba3-49f7-bd50-ca5e240116ae@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:48:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX4jw2lm7fDY/R
 /jcQdwGppHEK8ZHiiOvdyUP4MRbzBADgg/dHi0tIBARkhVBJ3t3+3l44pS1NzxqGIwd0t/yfwW/
 /B39ELQSOo/U44ZbzqfvT+kym0Si4mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXzVxYbQhxYCdf
 Md89FsRnWalFIrheDjBUyqZg+y8hdAl5UPbdxDad6NLB8bWCL0xJUZ0dtbRflaYe+t4d6MuNT5l
 PTacNELnR3SSekh80f+Vb4pDvEP6I+NnTetWB3R/jOjS8UKIGWYXaKkgtfPY+FidcnQ5ZlmnugX
 Z5/+FwIoLePXXNZcF0sF4v8MmdxQRli+NqX6ftRkoWfxxI2IV6N4Ad3SpKdOvf+YomoHl/qeUPw
 8kZ0fDtRxKTppdzCcZi3R/98ekymmMOSzTqDSONGc4N7eGYyYSwR1FOCsVtP1lb5Iko3R1a4Xg9
 n6ZRJMIA7Tqx6msIhfMDQZcrtMeoiTYxvaTFKKmXYnc7XrYoPjo6COhRsmSlDZUkTEEoFq+/ISA
 Jh4A7p60uOW2fBsjx1pWltaKoxL2p8+E4mk30Ckxe2aNtyBdGPcE+4yKMsFaEk/5+gxcfAwd+He
 6W/76WTktLuJSE1y8GA==
X-Proofpoint-GUID: k4DrFxinyr5yB4nrNuwvRWlJFHgMtDLi
X-Proofpoint-ORIG-GUID: k4DrFxinyr5yB4nrNuwvRWlJFHgMtDLi
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8953a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e2LvkIfHUWP2XQjg4Q8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028



On 8/27/2026 11:29 PM, Praveen Talari wrote:
[...]

> @@ -218,8 +224,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>   	u32 val;
> +	int ret;
> +
> +	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
> +	if (ret)
> +		return ret;
>   
> -	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
> +	writel_relaxed(itr->src_indx, gi2c->se.base + SE_GENI_CLK_SEL);
>   
>   	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
>   	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
> @@ -1228,6 +1239,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   		}
>   	}
>   
> +	dev_pm_opp_set_rate(dev, 0);
> +

return capture and return it else it's always success here.

>   	return 0;
>   }
>   
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)[...]
