Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025282;
	b=LMTpLu0GRXUUBP0oGD/M8/BZJ4vN4jGOnvYkQ959JnDouuE3HO+WnWAMG2V8YqOvLrn2
	 T+8qI9MxzkpqS0bv5sCufRqRX6eoqIQ4vCypyW1HCvrIVyEmHcw1XrgzinbgLWQ4pCrcY
	 S9K5CpuasxMBzbl1PrzwWEm87MYHA+n0QWevOQ+WMWhjrRx8fEnNFR9bu0LvM18xFiAiG
	 EmbywuDRFLw4qLco0gX2o+j6EWqNxSXdVBkf0lsfZw6J/OxIhf9blSsftAl5HK2RuYivI
	 KMp2d+2wO7Z2tTmony9wHzrP4M7Jc4XqtQkGKqOfqQsTslFuMEnHIfAO2tn245iYgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
	b=etkhvYb95LgVQDBTJ9uKzBhpEQTZhA0qo/yL5WsciYrPX7xLeYwsObkI4uMYSKip1Qzg
	 aSJHxAlvuj/DCXWCUTD1LU4oIdDXyWeuk53CBvft1STcK11Ffo1r3lcESF4OZUtW8eMPi
	 v2ubCevXCwCQN1Wfi8+dchMxUlyI6ryapz53mk7XiVxTpKbnRktnT00Mt/5ILo9XNUhY0
	 0ozOgVj3YDCxPJiXWyDEEiKDa56D5Pix9WuEdjSh4B7piwBMSQuWdjcN1PnAZkEoYx7ZY
	 tut2iuP4KRW3DgXVczlKU4yn/Elql3NNGuypvCbe9CtnsyVHPnhAGKDWMyH1HUv5zAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cwbj/FgC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cwbj/FgC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMfJ2009906
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=; b=M6OOEvqt6/cOKucb
	Q5OZwST7lwdGWa0CSwaN9mN3wvTl4izer2/55/0Yxz5XAKBB5yBCOXNb39Z/7Q0e
	Shrps8jXSHZ+7swMbp5qt6OSKKGfg5x7OErAi+hO33NTjwcmKfBvrA9BWE1NeA3T
	4WfViqkG2Wd1IU2zk9xVpVFVcYuu/waF9Zrij3BRqS9rSqU0cxSG5Pgc/xdyg4iB
	eaflTv65SmyOjzkhMl4SuTkIJVc2Jft3XJFXdyrNnrPmFSoZFAnNgQhg6TqbO89L
	N+196sbu32KAvWsTrDFHvkLRxeARlTe5X6RTiA/ogPIb91kRH93+xhkZe/xp795N
	Uz4tSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xu99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso734054685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025279; x=1793630079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=Cwbj/FgCD7+rEKC+Ce6WVh//A7bXp1j1+fRY9oQ0BENDfNtjTIKAZKox/h5lYAYldw
         iwXF/BcW20rnkONsNQVjiOvYTVOPeAwy1yoSoa/tHGbwYUfHzg2w1ieDtUIUCDfiDT9F
         k71Jsmq2/NslCZI3wOPE/YC2FW/9dPaBV05x17/hb/qCqvmk7mruV0VkgR33HzF0b/Mn
         pnG2Liu/OwECEewyzIh2zI6zVGaTgqsMBkSSOvfUFCPZZYt0Py6em5/S+e/AP1PvCKrD
         YJeE6LuRDUlCrwOJXD9wQal9lMUH2ILLYGKkxR7CQ9s1d8T2g/nTu43Ee9MRkb4Nu8if
         BuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025279; x=1793630079;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=yrtyNdVg0B1IPt5GSF2aBmqfYHDkOwQE3JU3S+b7q0S1LJ4zx4rhHm0zq9soJ89cAY
         HWbVGzVCIvGAIA/MpR4DBHC7xszOy1DfxG1TJ4jX0msj9WRiWWlwj4CI37YpYhubuiT7
         GEmhAxbawiLP8U3of5df22xes/W6l8XbVZ/BUjgxH/ron0Qo9YzEQEJpo8mfn3nSfRPp
         DQo3v1V8MfwIFhH2/QPlmgV4Iyy4NGyanVj5Rio9oUo/9EfAc9ESZjlpEG3Mx4L5hDDC
         47vR4bO+4BsnIMNVxVM31OFnTtmP5v2tf7YTwBsagko2dgIPdoh56B8TNImkqOQAJi3g
         aWvg==
X-Forwarded-Encrypted: i=1; AKwUvBwbSl7ycMyxa90AmBtFa8XOuHZkFPrVj2WLY4L7e0wPygdBmmDMnMlfXxdB42LfKFLEJ0S39Hc3c1G9Kwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWcxQUdHj8dGrEeylt7dJHmlk/+NJvysl01XYIQAPo/ZGx5C7F
	5oe4pV0bDsAyLguAluCN+m0v1uWyADlnp0u9UiL00lfCKqDUY0mogHLQTirUHoK9XUH4DVflUtE
	darq+b9TOdPqqbbptUd9m+peQwb3MMzTxpMIGNyqCyrRtacNybB9vuHc+Ck7jYej1a6c=
X-Gm-Gg: AYBFou2BZaH7ihUKFveYAECbkkmBlHtbHWn/LQhViF62EqFg5AV841KnPApDo/2duDj
	qQnjEJM+ORcfCUHC1RwK+xrII1Gt9JewQn0D69XzHgtt7qAGVnMkae1R2HY+GV8Eiw5WBpwgruh
	ILnpu312FeYXf/VZm8APskIZWH76gBicOgl53d5BN4h8Bt/ZpLFSRRIne/jHYfv/e0VubU3vkK/
	XlS/ZUYelhT2TX4WPMFG8a5hxT8ubB1rNM2B46MdYx+2GH4pnbv4XFks/7s6HkCIn4EFvweLyub
	4DeIRTmcUxeb9hJYEZX6rUYX5ZLG2uP0YfdBzeVD63v+xSfeoQ2yXI5IlDaxkLc6Nlbqk61djIP
	eegwPyW8xigw2GUnQgUM=
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997537785a.51.1793025279519;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997532885a.51.1793025279058;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3552132a12.22.2026.10.26.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:34:37 -0700 (PDT)
Message-ID: <bbed82ed-97aa-4b12-a8ce-a4f21ed60595@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:34:35 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf6500 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cfCy20KhcoV1EizUSHcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1vxukcKipF0EioRK10JK1984FqqZ_NI8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX9tW1FMiXIoJo
 2lXWSublz3peoJkBPInSESkLjzn5Y6GvYj4qsP0C2Y6kT24WCUiHpCXo8xTmO6GvndJt3Nvx8g6
 AN5XvxFLM8lVuKVej7hhf0zxZSP6NGM=
X-Proofpoint-GUID: 1vxukcKipF0EioRK10JK1984FqqZ_NI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXwSTMo1yG0nrr
 /jgBVvQiom7WeO4MJno16ry/6sX9XAOh4YDzCP322qn8GCb1T0pPdGtesEnEnrE1/dUzN7+WQJP
 XzdI+fzw+uNmM5cg3917S/ob31zieVNQ0jvyrQFFfF0PTRw4YS8Wii5PuBZkKu1ZJOZ8wxc1exk
 bcQ8+g0cq1mcFDjX+BMPFi1AVvjtBaKqoAyrmpWMaV0guWp5LlLtac8BdBQwpw3hbFHM4uJgmkd
 WUOM/8+7Qef87NINu8DgIRP0rP187oagj4dnKjoVgquGSxWLMbfpyCoPm6bifrW23DoY38WNEI5
 rG1zJEcXWsjiLdHrMKCZ2eUdHNAtZhaFHwi8t9E3VILDqEIhXkh5LaK7RYQF6ZDmThvX+dE4Uk4
 qeptPis5qJckqC0CMCjiVF5rz2i8NfpEbsnIF1vDbCxXoodSBHLrhF/qKxtDJPG8rNLu1g2PitL
 5b+x8bs6l9jTkL1KcyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260057

Hi,

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> ISP tuning data such as white balance, color correction and chroma
> enhancement settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -893,6 +893,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
>  #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
>  
> +/* Vendor specific - used for Qualcomm CAMSS ISP */
> +#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> 

