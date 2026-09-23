Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650214D37A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167734; cv=none; b=qtrNZoYjJPzmfF9GgQfDkK5/GFHO4f+iGxTmBKgzqM5hcVvex9XAH22rYRDizaY/K49Z8aXhvznS/kL3knDOKiQAaT8/62cSJmqKgUK/vNfyTdEOZzGlkpN9dEeTatPeCnWZmmQrHSw6vcrHXoHX/+CpXnEnbRhK8xjiElBI1Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167734; c=relaxed/simple;
	bh=UqvzQZF+a+YBDiE3dPxoSY4txFf1GjSNRE0yqZqWl5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTg8uIWWNe97xk4nbYMGeLQ3m+Dmofs1uKsJp1lmItLZcfu+rNenWmXPd7MBcsyRjv31lYNiYblQIMUOV+BX1zc78GDmZOM3tDMVvjHWxxrkXhJEnuGTdoyNGbxjv8XUhYOqS3OXNA+k6cs/Vu1vptWAvcTX9YcbIwJ8UbqGRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+4AJWdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWC34EaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+4AJWdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWC34EaL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTks2466532
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=; b=L+4AJWdioG+c+ta7
	YIeFC+C6VwsQVYQKlFICre85GROY41erDMA6dTGiXamvlCxpI+G324jr8n5zFgjw
	VkD432rX0+In0NDhkj8nc8bs/QkW6z/Dg5YGMAIqHouM51bUpREE+H7Rx6u8yg6I
	FYLckwljTE7bIM9SBSn7UBRopE/2qgUu7j8Uk7aml0HcEJCq7NzZu50yM6ufl+fV
	z2uAVQyaFSHIHiyqHQBVMBS6CbpXSDj+Xqkd63HsiYrOOhiHkIeWVeVfc5NQyZCH
	GiKJm/+41f6/tOQ24+rqwf0gA4A05hSc/GMsYAyz76wOqeRrbVTBCo/ZFOygStmT
	MKxbLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c42f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:48:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90520763ceaso195626d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167731; x=1790772531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=;
        b=bWC34EaLJ2F7ASZVzD2Vgl4LDktyDlKv6wBps81n0KkUVDp+UA865idKpjVncmrE4o
         f0Lc54gY96SyT6Y5HxZSIVb2eAzqww+kznQh4HM0PCh9UkK5FniOF3Gs1ZQVLSsts5cg
         guys/TMcya86h3NuQmH2Gl/F7STltEWEJicRKJZQE6lmr3cI1TI0VnwV3FU5NKLjNNPc
         tMZ86GeDe6aTtkrsXBHfz8ojHB36F3jK4aM6wQN2ScYBT1HrY0xtwDS/8xNzLmag/E9O
         gSALlgRK3/Z7SGydJQSOneNn9dlhN/xvs3OJAySMkOKs4Qy0qPh1g6Tvy/il0606IaNA
         WpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167731; x=1790772531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=;
        b=Lc5EzlSl95DEccdqspXQmgBVUO9B/5xhPQvZ69RvSv7K9PTb30iqHe7o3D+QHXakWF
         ej2mnpmrKc8Yo45WU4fqjM6KSiGpnNWlu2Ne4B45GWqB5aqcblDsYwNdg+ouG1cJfXhq
         9tQYPQWMKTJKvB841eid1rBOOsNb/puc0mpMjv5+bXwNexECgyYuf6umEPfKy4HAYFZO
         HqX60s3TTgPCegGvg0HkBfk4xEPO3KUjbbwCMqwae0SDpMVaMtc4l5euvK/gNcx94i92
         ZFiexmWyyAx80RTHUV63oaLKdK6cB7YB/MO7Rcz9WIVbXolxSJHHpCgI658wJFWIIbde
         mlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBypznNNRWneLFVN0le14pzx8FrAIgUFVAeAb/6MhsNXR6jT3qokUyBJwXks0bFYEsAebITvj95DjrZPO7o=@vger.kernel.org
X-Gm-Message-State: AFuF++kmH46stzZevCA3iUpFfFMB4e6XfN1JIPaSssC23+YOVoYNOR5b
	FG7YISrUQYIgCwTcihMGNb5R5ZzKEANNqLE6l0iRht6IgcRwH3WQ/Wo2ZK1yUKo+ZICOU6Hmi3e
	rOPM0cqMXPi/EnSNu1S6U3gDijE1KyHQJzj9zNQ4Hv1a0apNLuUk4erXk5X30YuWpPe0=
X-Gm-Gg: AYBFou2qVtgYZMv+vkv6DBpGELn9eJYWKrKhYjx97gz2fogPeIHW/pT4wjqYGYhQI6o
	vBnD9VZslD3lOuOtYUZr2aaCtcvWJHsnMdmTKefRfNkJ38DytBLKLgcuNcQjJ191yEUOyykzgJs
	tid5pIkmiyKBYDDG0wt09RTLVjHLGgP7Pqs7pWSDIH3f6E4cWRG06mLmu+VwkH7TCDnXnud5pyD
	yZBBFHNgjYvNASvg+s9DEyP3BoV9eX8bSi05J/DVsjjpSCxWQ2XLzncQ6iBB8pg662zivX7hyY/
	b9fYA7fPevt0U+Zns0dB4KkinptMFT7b4YLlMqIjk+om6UOLyhqfx95L9fnIZQpVXzMoZa0aCPW
	kMwi7EW5gUcbZJjBNJcWJL+wJCjMRceGs
X-Received: by 2002:a05:6214:5b86:b0:912:1333:e04f with SMTP id 6a1803df08f44-9140c1331abmr40600476d6.0.1790167730621;
        Wed, 23 Sep 2026 05:48:50 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:1333:e04f with SMTP id 6a1803df08f44-9140c1331abmr40600186d6.0.1790167730121;
        Wed, 23 Sep 2026 05:48:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c6csm116628066b.16.2026.09.23.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:48:49 -0700 (PDT)
Message-ID: <8e12599e-be86-49a8-a9f1-7bc2abf2eae6@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:48:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: avoid unused-function warning
To: Arnd Bergmann <arnd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260915200435.3524505-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915200435.3524505-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D0ZQpVSxAFH-v1E9h5i5NbaoD9ryQIZl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfXzbWB8bX+CC3s
 YdIc5yGnfAXHeosVyJDO/10j+Jgh+DT7oDu9BneyOVFsNVi2krvVQBjswVh23Sc3uqtZbuvZA0M
 w1mkcbOo0HKe4+qlhQihvwY6wtwdk+0=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3cab3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GCO5t0sYmCnv8Esj6DsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: D0ZQpVSxAFH-v1E9h5i5NbaoD9ryQIZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX/p+9cHCaWbbj
 EtrFj1mrcw8xNhxbY87aLlg6QQj0/rjH+TYvPPtI7DjJ5DOiOsLiYk7fvB04kYSMz8nx/5h8O4T
 HSELqDVC2D37OzSEYQ30KFr9bqALMy4KlXUaxOq2rq4JMpBgbeXqi/zbHzl8tYNIGJht5lnNecU
 WYRoc8hSugj7xc6KcKhxh9SpDrXKz2/c0wof5ywYsFO1dWdnN9FfixZiibN0H+7w9MLluxQniei
 YMaqgHt4bubZqWqmv8110zCTbblLu90VuidDylLMFsVzI+mdzgBymrFKMMUjt3J7JEBwFibVT/8
 wRpmADhVmzG8D4iNuqJVcl3hrZY2m2MKNjAqW8KalvIQypPhb0SWxAwgCFEpX/PIcFMpaxBG1RB
 39Gquzl9IrDNvGi5/s8ptJV3kkRPqvO3End/MZR+Jix5MUAMw8iuYgMRq53g1dnaz5W0IvL55fM
 4Pq3HXBK2Wb95us05sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/15/26 10:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The qcom_geni_serial_poll_rx_fifo_locked() function is only
> used for console support, but defined outside of the #ifdef block:
> 
> drivers/tty/serial/qcom_geni_serial.c:918:13: error: 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used [-Werror=unused-function]
>   918 | static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
> 
> Move the function definition to a more appropriate place that
> avoids the warning.
> 
> Fixes: 8200871327d1 ("serial: qcom-geni: Keep FIFO RX active during console TX")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
