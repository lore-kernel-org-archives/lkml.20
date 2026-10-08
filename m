Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCAA42E427
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444963; cv=none; b=ndVBbFhELStngP5ngOMoqeB+lj+v+G85l/J2JuV76FGNkOS/B4VanOmO83ZIESzpWdqTtTpb0n3ks5ApvTpSQ4aGAIGRqCKe7KS6c+bzxSvKx6nSuBW1fpYH/pTTi5zP7BVzfR13oyycBnT5VOR375iaCqAgaGDeUQmmq0PUy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444963; c=relaxed/simple;
	bh=99wYJp3NJ81UB0rpFIJF2rUNHd+EgUyr1j9RtWZwtoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP28RQVAz3pBaLeGRf4dhvW9ur0BnOjIyLpYKDiVHdR+/KSD0EG6SJpc8NvDHm6ODt4JCcGmfgvYB7T4fczQsGNHU8dOiXYxnqz3uA2zqWx6GHJ4MlcwyP3vWsv8oJVGJcIo+4PngYZLFRK46EeR7NCyWReZ+cQh7TZqzh4ICzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCuej6+K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZWPq7TN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCuej6+K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZWPq7TN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3EL2189814
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 07:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=; b=XCuej6+KqJJ7L0Kq
	2mw5AHEGCBDCt1Lv5Z2m/TzLxn8Ph6oU/8yqSzzacoiJpijkNCi+hC5uqds3f067
	N6XoeoWGMhq+NCUKkX7OkZRTPKkTHI81O79OEIM/6aEEDZUVXBla/9zj+KM5/Qkn
	Bc9bQfjVyeN55hsCoBghkqg1x9cXoGJLqVS2eSRb6KxHrkHwnmRR56OXEReTzojH
	LW6e0BiTmFxcXVkFgRUuJyAzYACvOqMxNiiXzKsLYkof3HnYLCi99UYgiglX2x8K
	uO21LGM2+JQxbK6behqGMq1ehu+3B2wGDYhRREb53omb5k8JmZEnAgdv9Ib3E8v0
	vrXo8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39pnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:35:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4905010a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791444949; x=1792049749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=IZWPq7TNYbxXeeEXFaCFUvVY9Cl4nPLT6KiuwsdQB9nLTyw6Bya2KANIPY4l7wQsv3
         896f9KVCG4TQ4pG838/ZoqjRzBezipIJq/AXPwyjvVaaFVF4dbs1iPDXhsofxqHpp9bA
         FsH2569fhpevdgU4Xx3R20GJA+HFYPzpt0Ilp8eNDCEjjXNPeojBeXYPOqwcssLrNR/U
         S8f/uBqUgn082a/07ImhU3fKebfuq9vTuX5QCs5FqfTTrrw50wHOPaWPoElQLEt0pS+r
         8D07WzRml1FNaoaTIYJV4xG2oeoiqqYSWI9j9P3JjCvoSrR+nG3SqGW8ZSpm1kHjCrvH
         xg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444949; x=1792049749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=ErgvcaRUnoFv09MPpY97aCY9EvWsR1rTJCTYPndMjewQvl1tggqUaAT2+oaqq1qA8V
         Gf9L2roc4AP9CSZtHt68K2TzaUXmow0NYDT37+Fit6t2jZh2ubWzPRI4Dxf4t0ieFZjZ
         dh837M1S0zP/baL1lUbhjXTvm8aDNyKhrsgb/BRoR+iWdcSwKhY8D+D22RXEHepmEbNm
         4EPk9p8ItqnM3+6Vo43GWqOAV011HqipixNX55GeIdFVVDUg4MtzGbx9K3FAUVIJvyFC
         nSH8PRVo3rdoyTsPstWLxUq1soERXbDOJWie+X20cplIOxDK87c2QiB8pxdU4eWMUnEK
         5EaQ==
X-Forwarded-Encrypted: i=1; AKwUvBynPCWzvyVyx6eyMUbeUZF4d+Yii9VGL68nztTpvXK1DgfLtx57GcV4UemdDiFmLSrtogvnbz4d4T+zuBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOWzjNDedR+0lctsyMlQp4n5XKB2/10ASiLkWkj2YN+VfP0XHy
	S6M8kSMvtcx5pBLXlmgF9NJ0M7VKQRpx7XSd7OmaQiI+Ka9ddY1z82Lef6cTUuDli4Y8bvN+hjc
	MXoEipnvmYWLN5qpJVVHA5sO9kdRYnmsG9beRK33co76DOpdSgUz8+p7cEed+SyUCP7Y=
X-Gm-Gg: AYBFou0vBX55kQV2k0L3xUxYy72CFjF8pDZOhEMBHN3wmaPQ3RLCnSyB8UMjxi5EzFB
	EC0lugFTvWGTGQd92hug+1ec7iyJ7Kor/zTxsnYQ+99DfOFBYxTeXLJUWnuZo8U7T3I+rzEaYwS
	j9ItY3gvgxQhdgUKASdqcQDei3cwYkyH5z1eVQFaU5uT6PKmkKn9E0s+iIIXFZTxX6lrkdZ6Bfx
	bGzoFVD2mQfYjpIzSBhC3mBDWzXOkIHAHanNKM1rE/hP70TmfO0+sokXcJU/CYtv2JNfOcank8v
	XDvUwXuK/+lavKto1M367299y4Hm1dWlBaEaCy6THc5onAX3pmnejBEZCkIpyOSq2TNe6Yxx/aT
	DyGLgxKXX0f8A6LpYVyB5Uw31fg43iSGV
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398843a91.43.1791444948593;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398827a91.43.1791444948107;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1bfbafasm3506674a91.11.2026.10.08.00.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:35:47 -0700 (PDT)
Message-ID: <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 13:05:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
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
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac747d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=l2yqw8MAX8n28sf77-kA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfXxhhzeD/VR1oc
 1+S4y+5PkXCqk5VYD2oGYYAv4X8OVFrFJ28lOao4lqWp+fmqsJ6MyuxuMcki0B5husAaTTPVPDB
 wLApnO78+x7rwVPV6oKuw0D3t93SLDg=
X-Proofpoint-GUID: qEjuTv90LNR2Mth5U4gry_I-rUvXBsC8
X-Proofpoint-ORIG-GUID: qEjuTv90LNR2Mth5U4gry_I-rUvXBsC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX6ynGoiLTvRhu
 qZ1Q8C4GvYJrdoFTonsdpx4wLQtM2+pVlcObYN3Fx+gSHo/gBxBy5noI+/7d85n193kyn9d9vF9
 hkXlG3sXhf1oN0peBkrll0pOPmkm8Iad8g0OSRDp/tD8rIcjiNxszti+JQOxokIJ1n/Ctkiau0h
 7mRVkUFnVCtH8Uj87vqoTzVI2K9QaI7yrlpwFfD0fiT1kHvim8N+mHUf3mhlVhsBHc9twHD+vix
 LGqOLaALgod6XCcKYbJIYOgQqExxlQxz1eOrmwZiyyJdsYewmn6Cq0BFcIOUCqHxgN9/zH3QGcg
 JGWH6lkU2Wn1C9T2PQeEofcNwMkk/SLDY3+60TNrkfqXAWXXlXxBQNmaBIqZtZOsoM/iTDqk4sF
 TCM4xQM91MmpLTIc4HGy7lLqmOp8IVUA29Zh/0RgkFz7dVsaGUo5kbOjdEWCG4L+ZEKA9Ul9q5T
 tOwqBqiEnAgMC9A+g+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030



On 8/27/2026 11:29 PM, Praveen Talari wrote:

[...]> @@ -2039,15 +2041,19 @@ static void 
qcom_geni_serial_remove(struct platform_device *pdev)
>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	int ret;
>   
> -	return port->dev_data->power_off ?
> -	       port->dev_data->power_off(&port->se) : 0;
> +	ret = port->dev_data->power_off ?
> +	      port->dev_data->power_off(&port->se) : 0;
> +	if (ret)
> +		return ret;
> +
> +	return geni_se_set_rate(&port->se, 0);
Is there any register access happening as part of this 
geni_se_set_rate() ? i was searching but could not see after seeing 
set_rate() callback removed.>   }
>   
>   static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> -	struct uart_port *uport = &port->uport;
>   	int ret;
>   
>   	if (port->dev_data->power_on) {
> @@ -2056,8 +2062,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   			return ret;
>   	}
>   
> -	if (port->se.has_opp && port->clk_rate)
> -		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
> +	if (port->clk_rate)
> +		return geni_se_set_rate(&port->se, port->clk_rate);
>   
>   	return 0;
>   }
[...]
