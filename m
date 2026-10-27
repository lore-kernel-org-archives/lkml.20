Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125452;
	b=ib3akrHj8ursnkOqOXTfVkff1Q9koY5/zd7rMwI/KNMmFt+vZjzEJbHOSBrr0Ctqqyeh
	 pFYmWNF2YHBEYLFqU+2QwUiwz9U0JH+/ZWsYDA8kwRgh82CmfkDXwnit81prnR95X0LfS
	 ERsKOKwWym/Wu7rZU5aqU395Vv0u7iyPGl9U9UAAP/1LgaKB8TbJxzStEwcYF5vIXjrv+
	 N9P9M/gqY/y3hiXLbR5asa+AGewXfYBXnQlhlzCzTE/HvufWGB53QoffcYD4qbscne/ba
	 GsaSYHkpifgMkL3H6ru2KtXZsx1Kx/ccj6aXLX+feSe9ekOTCL6GadoAi5LDAjbSAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
	b=I0uDu0iOZB2ieo5i05GcTlamsvDgUeG58mZPCJxwDehLYid0r/JN4ETg2eGJuxqCJWMM
	 YAeafUxxdJypjyF5+usj6aa3duNZww8T8JibQxPCcCDzUp2W2zbNAeX5G81KTB6tul5SN
	 0CMFQVGnx/1ligZhcZOLoy79jMQEg72LrdkI392nm17YMOees0mxmFd3wQVpDBYyNH4og
	 L53xY2ovA3tgQR3FW6Og7u7jjpPmZkDZHj8AaEPFl7NOj04vZdL54/fGpp8U2KGmft7Sn
	 ym+7weyR2UDbp2Ai1+pv/OctTLhaCvNVQEzPDHkaLOTHjuYzz7lhjmDegS5kx/dRyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2C606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F2C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHSBg2997855
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=; b=BfzegT8lQWr5KYmL
	8E/TvsxHhIK8H80cdTpoCVaePf+2gHjqNG3Vi9jpf9iObLVt0IN98de2RmDVZ1h4
	RxUHXeoq9nRKe8pBISqgkpooJGde9zmxZV1UiWcMzR7tLQS+B+XV//nNKXkG4sHG
	zUDmMhizlQupnOG74fSRoY76e5kSx2WSz9pSR3oUUjErJwGUd2rzrQlgN0wQfMdt
	lLtwjmUp2rS94XAEAQY9RCt7ZE015xpmDOMWV/CSWSOHGq9MMFrzP4hPSXSQzpw5
	dyHgJDRtBGlXkPyLZmiD1G3022BvJT9jhunlS9TJXsq0yD3XTr3IKJwXMEnHauI0
	f1ejuw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1j4te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so484078eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125451; x=1793730251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=FPU2y1eijUijHyfp9tjH+qmGD2sndkRgLwYXoPC8bTl03l+PaSXfz3w2PgZZsxS9BY
         U7YaOmpUKfzhiCUok+nBtgRfmTyq8RwJhY1Gd1VLEnU3m+1tMlafSDytFTu9fs3KFEpg
         5Bb/y863smfghlwLVqAmH/N9YT/7dWBcVj3mHAtliK6EJ7psWR5X8872Tsnvi6JN01Pj
         IqGY27Qt9zHo2Z4GJApzBFuUmAUXhSzkKxMw4qrgq0h7gPzDTsjTx7hcMouA8Le/rtw0
         sMRaWUA1jV9Yrzg9raBECO2ScfEamQ6e6h/WNYwA3Ny4/irAwITOu/4uUsy01nIzG7Tz
         /YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125451; x=1793730251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=qottNu9z/ryQGoKYvM9Kqw32bOAOj2EBLKLKci0lsMT/fX0o5/qo/Tfk8oe9yE1IpZ
         y20RgNfH/i4v1UR2qx1yM/JWrsTfG/O4k840ApsY5EbzKRji4K6UwF7VpV6z6tRyemJh
         Qf0EbavkD/phOq9IMGrYqWFcKKrEIY7QfL/5T1ZE8xnZmtgWLGdWgZJc7lPx0+faszE4
         TsHKyJFcSwZ+edGdkxch5uRbVy9gkacvaF7ibT68HBWTJM9+fRcksvgg7Zq/eUa9Hw8g
         Uho7Y0SJdTn6xkuRisa9FTLjMpk28k0TxjsIOP/1kr2xU1M6V+79NWulWg7zBCFcRJMc
         4xyQ==
X-Forwarded-Encrypted: i=1; AKwUvByxz4+UEI4XjqbJVEj7Wf6pdZelieOkhO4EY7g/LN2GpGj/iMxoETNCNqMySQZ0PWHJVt3X6i4otcldaE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqlURs5wfYwYM5byqp/nbdW+nvvl3+8/RjBAugostGMuHyMVt2
	hllN9K8jhSyJpg3KU14J1Ubt9NLVryULEmGv7c0TSMztUAx76l1+heMbS5XjdoyiLn/5wJI/1Ko
	h+GLUzHVxXwipps7QXjbeDNPxusYqXDqxP5qvuB0EzdYIZo+9e74hqxu2/1WHx1dUK40=
X-Gm-Gg: AYBFou1sOtF46ghWetY6fqKWzemLgRIHxTg0ktJoKR9sSG4CUoHddlAHrFytaggJXAW
	Uwemss+iJbqtQ1KFMLNq49TQleOGwkXu3elNJ/zyd4sTVuREn7Dx16FRr573t4wAlvF4h+vo3Qj
	yQpjjlSClYaJU0vFeyf03ZJCsMDgb4dd0Ip47A4Hz8OiiLt+XryDQWuV345kd5k9cuz9it7Pe2f
	VcBq9wwOgsytsII1KhZsGqqWhdvwhTI2/ku8FXcZEXJ2dOVCBWsx7nOaWrfMT+fhIZc5aUNSJaJ
	73sTO6KylPRb5ed39oyuFe/jbbde7tJnByxN84srxDpyIo8n5I175Y4iL/yCuARZ/jXsb3IpbUR
	naR42PZzMdipOJ3hIcqyQuDktTmQ=
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43964c88.41.1793125450595;
        Tue, 27 Oct 2026 11:24:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43925c88.41.1793125449897;
        Tue, 27 Oct 2026 11:24:09 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm34006142c88.22.2026.10.27.11.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:24:08 -0700 (PDT)
Message-ID: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:54:03 +0530
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
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0ec4b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=QnKtIixuteL6j6IxG7zQig==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=i0tAhZrUCOUqKSMIGdwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: evZXJoADLW0MPKRAVr54yvp2Ucshtezz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX6IWboClE7BfE
 KFWKCGTwDChtoYshz+snKLgccZJJLxvh8mS4ViyLDFkWqoFSQ5PUL/eSsDAunJ771UkP3IrXPdV
 jbPpPzheRpD/7loEKKBUqiCZ90B7SsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXwDLmxa2eUrkW
 O0kv0dWTpWLcOOI6TLINUmH3EFnXGOs/s9JHhyOumFvdhVKI0Ac9+8lVmSWhKq9PB/31q8LDXMR
 6ZJFgR/ZENouI/zDhchUmwWuS/xx5fCn9055TkPCW0RwsYjQJ8VIkBuPdune/xvpG3SPK428CCH
 +gdbZi6Eef7VMfNtF3flc8VkPilYfixW66/4XSYyEtPv+aQKi/tkuOlSDTUv0RYIzaUs8CyTWgM
 FSVOsDdFi+MO4dj+8daXzU0jgjRGWzm0Ww3x9xhyIyv09Bx5hB1G0VvRyHWn22Ti59nCnjRZPly
 k5Y4ubh2yp8nQjsjHsPDjUkM1kw0h8rh1CiQWx3M0ie3Eu/w8h6rOMNxloN+McX9IBa55JJ5hSR
 KxUovojNisS3i9AtX0ukuI8j1XlN40H1A39SPeohBOPDIQVOffGs8/RjboyXPReXrx11DyiA+6R
 t2gZ0Yt041QqcMmPatQ==
X-Proofpoint-GUID: evZXJoADLW0MPKRAVr54yvp2Ucshtezz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270073



On 10/27/2026 11:35 PM, Gabor Juhos wrote:
> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> removed validating of the frequency table entry pointer returned by the
> qcom_find_freq() or the qcom_find_freq_floor() functions.
> 
> Since both functions can return NULL and the pointer is passed directly
> to the __clk_rcg2_configure() function where it gets dereferenced
> unconditionally, it could cause a panic.
> 
> Restore the sanity check removed by the mentioned commit in order to avoid
> a possible NULL pointer dereference.
> 
> Compile tested only.
> 
> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index d7914e59129f..260e90f53461 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>  		return -EINVAL;
>  	}
>  
> +	if (!f)
> +		return -EINVAL;
> +

Normally, the CCF calls .determine_rate before .set_rate. The floor
determination helper already rejects a request below the lowest supported
 frequency:

 ```c
   if (!f)
      return -EINVAL;
 ```

So an ordinary clk_set_rate() request below the table minimum should
fail during rate determination and typically not reach
 __clk_rcg2_shared_set_rate().


-- 
Thanks,
Taniya Das

