Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FA30FC27
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304331; cv=none; b=Q4Me1UTrRYvJgVmHB2P7Smly1KK7NxEv7aLn1njKpkb419v6IXCaybpBg1zQ+RA4yr1RHl00c9M629V4xLiyPsTjANw2FqJRe+O5bixzDHnCR8MjZt777GDZnXNwWAsLxu/J3zCnl5/XHSNwJQt5Ypv9houP4dRwhXNtjbV519E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304331; c=relaxed/simple;
	bh=fh15zWcbwdQBf541KPLG2838Kk7bkHLlto3XyHFlOwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJ6wr1o0TVsrLHTnECkCiS2Umk/cocw608yKSd9soxl0LeKuI8QmxfFv1llTEMYrfZaOGehYcaKO4zFb6amBGI7JEA6fqcBPjlMovOAHa/eZupyv0IP3U4xlNzKL+xpcIFCfBMIFzT9mebGxgciJwlm1axLAQh7FrH9r82dd3Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5ob6j5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZcxofxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5ob6j5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZcxofxJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tGqI3683786
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=; b=d5ob6j5tw8T3hUIh
	vdr78hQE81CBb7fwWJVs08crENiz+37KmNDEz8I9J29YV8sER7u8h39oVmLJuc90
	2xvaq8SSZTaBbCMwqC6QJzKqkjdcJ+636GOYpT5SrXUh0rbVDPJnj1OZwyuzIDJO
	jtxTqRDQ063tmZlgtq0oNzOsL/S2n+CQWAjHoRsv9FcG/HwRsuds9x9x2+pJkQtk
	E4eBZhY1FlculdUZZWVhy8slmDNE7O2T8Dc8sKoo9Rm0k593luQRp4tXioXDFWUM
	rb5oewJ7AgPJUU838VGv7EJ9NdjG2hiHZdEw9wgwNsFvHeARmguVKfzJHOZvW/jW
	t3jPgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxjj14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:18:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso1925220eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792304327; x=1792909127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=;
        b=VZcxofxJqCqqdFIbljZ1WnJv/4x1Qi7tb2FeRla7IimRhWRHKnRizEoXMtgls4kQhs
         cLcN07s38fRgUTxYgYr+uH4O8tYs2PgHAgeVnzJVSDgB+5hxaTSqiufy/4T5b3ji1UFH
         DXLP3+iGQT2Gf14Y4cAOYxqef3ahe4o5nl1noZN4B/FF8pkW8MR2pFq0kAhLPDzBKIGj
         KyFG6JZkmbtxEqGgho08D56XT3mDBGna9oNRHxSzoc7AaRJI31L2OFFd0Jn5XrHHUmmp
         VrE0yyfG8XNSObjRYhMNHB3g/TUT5SksJKWjrKh0CK5ltzUwljufB7dd6lqgWABqsvyF
         Rqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304327; x=1792909127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=;
        b=h3M30fG8a2FfdckgNx11m3W1X/2vfluOBSrtgrjlE0SoFmXM8yopncwCI+pw/8u4wx
         Q/iSVPTrVFyp5QLuKd8E3lCfOrdNUZK5TKogVu6vPVyk9ZnvrZV7EdxUCUHD2OYzW/bL
         ZvhgEOUnUqbvmyVEaSAcFzJhcFtq9b9KS4QUb1Ns5MDnUvYnCraTH/Iq/Qkuji3oMKQE
         bJ0D5NQbc+C+XrhX/tij66f/ffkDzlLfCaN2+qA7jbPds22i0o27iYZkBuYeTY+6evZe
         mn1YfnOEHt6Q8mR1w41LlEVaXDSSTm3s9Jdeh+rF34CV/5stvrfoRdzf+hw+eUPsIJEN
         ZoZg==
X-Forwarded-Encrypted: i=1; AKwUvByNKznHxMjcYGWIeBODMw+mvraX7ejFkNrukjX3t7ZYHfdTjo6ERiK9M9IHWIi9IwCzofkPW3SWOXpiwL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPxp4/qy05v4+bTyycrc7VJOILcR/l3G20GgZOL2gDoGQ6I5I3
	ewAzj3Ksyd7OLArya85pXvqhopg0mikaRbOLD3oLg88KlxEUVp8C/IHGYjBnJMsnUmtoCesCG9b
	XbKL2MYyuafBwVPJqci2gUdGawIFLnEhYPnqYJPGZFHGMbMunpdm3Oydj5oc5XM1xGAw=
X-Gm-Gg: AYBFou2hUOMG+22jTIJiollxWygahFoeQHV3thRXxFDEvxmphdaW2AowWgD4D6bg7g3
	RK8oLUvDMGMhAcwwis1I8AoxIYpguvMZFqmECkA8KhkXFBVNo+GyOQCDlIG5S9nOq6el5HiMmyA
	7YhLjWqLjAe13b5l9A8dC2R7mXwsLbAXB35cdGUAQrF+Sw1XM3gSWOmArBB12t2CmsIQsW0lvBc
	+zJ/m4et5nszzk1x/XwS5EMiQVBK+eTHYjIkPMdBXkoe38oxiO5TPtR2x8AQNYlnN84yxu7CgPd
	n9lP0PoZcmlX2wrdVVWhGxRKxIk6vaoUsK4tDMDMpHI5vJXj4pWGAwCcJvJiH28cNTTSMquyO6b
	TNM9bnEcm04bZLbC2FWR+ydnHq58Mc52nHg==
X-Received: by 2002:a05:7301:1a07:b0:35a:a5c6:40e6 with SMTP id 5a478bee46e88-361a126a8femr5735211eec.9.1792304326931;
        Sat, 17 Oct 2026 23:18:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1a07:b0:35a:a5c6:40e6 with SMTP id 5a478bee46e88-361a126a8femr5735178eec.9.1792304326355;
        Sat, 17 Oct 2026 23:18:46 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm22719789eec.8.2026.10.17.23.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 23:18:45 -0700 (PDT)
Message-ID: <4bd7b1f7-9156-40b3-9037-f909a1d02ab8@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 11:48:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
 <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfXxjcvfDq31E8O
 eiGhiEcAbjF4XX8t4ckqmAsSFDpajjrZxq9N7Tun/Yi6ABMJRgD+9txizIwqvGQBxx99wgM5bPX
 ur4gJAo3OSqRSIrSTSfHp4bhDaRNq5U=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad464c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=2a2+ae0sWwZdsBobmU+nRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1Kh7krj5s1ZBTWuj6-sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX3yMFgWZB5coP
 6LQMl2JOOpKHGlzySBglBoHWyKtesPrzet0pTdBqeNza7nsqF66hxm3luq5/ah2p7PkhxVYfOqM
 qcg479CIv0RXeP/zVHV6f2jxlE4eptr7DjQ18vACLrLo/XUCyATjcn75Q7gFrvklRiK6LQ4lFBv
 273C7BDGDyqMDdwk/+9ZgQBCIZWKqyw3EakOUxqyL4q0QC8lj44LfUOm55/haRJd1I1di0TEasU
 euNA+Sn9zFOuOKcGmg7+JNFKTFS3TK5d9ek2kff0OjQ6Gz2/tpKG/WSb90SowCqpZ5QLzRsS9Ow
 XIzDXP8MZFEf9ZDw94GwC4SAkZ5D6Z3UHMU4b/ouFyMgTfpCMhek0bIpNORVsc3RQ14cRnQg4ov
 ryPqGvI5nJskNa6xDIPY4B6hYWi9TRmC/7ghr8BIRcvoLLYLcyXOx8Frk9iXlkVuKQ5nxMKepjU
 MTy9hYiC4p8XTdlIvsw==
X-Proofpoint-ORIG-GUID: yeNvdBFTQ8ZJaFiBdCS4yvm6SWhP3hNp
X-Proofpoint-GUID: yeNvdBFTQ8ZJaFiBdCS4yvm6SWhP3hNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180024

On 10/16/2026 2:22 PM, Konrad Dybcio wrote:
> On 10/16/26 7:39 AM, Anurag Pateriya wrote:
>> Enable the SoCCP remoteproc node with its firmware path on the Nord
>> RRD board.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> index 47978df0af92..9db94c3b0c91 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> @@ -434,6 +434,12 @@ &spi16 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp{
> 
> Missing space before opening bracket
> 
> Konrad
>

Yes. I will fix this in next version.

Thanks,
Anurag
>> +	firmware-name = "qcom/nord/soccp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>>   &uart4 {
>>   	status = "okay";
>>   };
>>

