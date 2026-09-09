Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9533B27F7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944955; cv=none; b=gZiDhlf4+hN6drnoBaKnLCaTxzKHtjNDNm4AmJXB8+QNNq3yzl9FeH3L4LuRtElONE4vMjf30QIax23PAHC9eryD2fexvssB3/lAUy+Y1dMak3YlOCxE26SZbCIwd+YGYPf+2XH3ZwZUELjqUcsgaR9+KLgPhk00L9GaHHB6qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944955; c=relaxed/simple;
	bh=n869U33FgzQwQgeAx52QnufJ4gsAYthki6NGc+wQWZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4VncMeT9O2s1uwb/MQccZ6UbplCK6Yu7lw6xbcyjjaEsXLaSTt9jIQWr08fwpcS5SvbtsJYCWPrMo857ReppMFbt+0iXxsKY+dc446AqIAL1umZSnBaX38OWIB/ZybHFQLYJpwtS9bzoNOHi/CkQpYP0pdmyzuQNJph2Pg5c9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4Ci4anG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ3KlKyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4Ci4anG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ3KlKyQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896FmeS045565
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=; b=F4Ci4anGRiSYp4BE
	IpcscbNIAe64rKx47jXH447Xmey98s12mspnUsfyakiPlMsAcqLD7UkcZUOiSVVO
	2LPKss7dF0jKvnnGF6wk2vHxaO7SuWsI8v1oUe11bgT/TJttP541ZLAQEcjp0S95
	F/TUSHKpm3NlMaCK8pZC1nAgZwaVH3JzpwdticLCXkE/tP1lQmEghvkH8+KNuKnC
	xY8Wiifm4c9IIm4CFosV3kpriWb3kPS7cm4EYocs6Lw5uv3tvrZYf1rAvTnrO7o/
	BvqmKidQuqVFtHxNElIQSfY4EVpd/cJSuBcKFskAhCFHWS8Ea1GxOxSUhfQczKP1
	BZKuYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk50m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso101076185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944952; x=1789549752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=cQ3KlKyQKxSbsvsz8ba9ciSByGFTFafEQP7z8t0pVxgSLbbDhkaAZkYcpuIwV6/h6V
         zltXvDMIp2ButP+JdZCLQ76Nq04EGnwnsGxS/tZzNNjmmoWUfyvIe4ExYz77zTBeSAZs
         7wFrLqE7W4J9PIGvob9x23kCA/R9zoiZ3DzOYa2JSBJxMw7IQBoOVI3hIWiHsMXFFIyQ
         G/ozNtIHNZfBtTho1whKItQmoc4m9OXUKstvsgpNVACi0Juufgvhx+UmK9oP1L/0Y4ZA
         bpY4fLfiRrqv91SToeCJEf/5M5Sf4Srve/vR/r0zmPUJJ48qi33q9FoQ2c6u4BL6LUK3
         n+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944952; x=1789549752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=K7BaOt7kwmZHhtA31M+EYBIU9bHmHrQpgsoxVuVJrFnu4FD8JLVsh0FLnLnk/bdQTC
         K5yLVV7FR0gfFMZm1WmZlyl7VFn1e8SOJSD1dHjjAaHhkp6YkNoTecEee8XbyTLgrZqJ
         jJ9q5Bp/U08rKl4rrxGCSfdWN9+DE2EGsOFfhGeP4mgpbcbGvR6+oiVLvu06giAQaWsk
         cH6qRz2aTtmugvRv2UjtQOnCJxtBKUWxY/QVaj9I+ZlYxvuGSa+SuGgk+ek3ajYiBkf8
         V80lcu2udgRm7FYTuspz2sT/R5c0y4/Ysf8EEJFWRpmYwOxOP88bjXAHPNTc2jdGnDEi
         hlJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9kKc5n6G7cXMwJk51WdGf0U30rBbT+zPO/nktmfM2B4BO+MK4y7Z2x1WoSBOYUtfHc0IzW3CvF7Qs7r4=@vger.kernel.org
X-Gm-Message-State: AFuF++nTOwcu3f41rNu1stV4A7oH/47Hq9fsjD6JWF307Fh6yodgw/us
	ACoAFj3qnU7P90SLVxjTWnQy50BHhfaigdFWwqvo+jvKbLu2axsbmm5H3fKjzB6NOTonew+1ccI
	gAWvu21ZPsbotQGbcHFJaMeY2sP/amWdyqwa0gqW0KsOaK4J6JpvqtrXLLpayOKveq7k=
X-Gm-Gg: AYBFou1ETaF2iS/ZwRhIcEy3lyd22ivV80OtnE8xQN8CZ8Kx1j/wbkLR6MVONX5S3R9
	Av2jAPC9H8NhAT3jS8HIXEbY6OeMsUlfuyy2BDrKioUtxxcPrY/pbP7kJe24sBIZ3RHU7aVO6Ex
	QUVUBP10TwAYM5kGKN1c48CadWLwnw5Jm2OVgk+tVcnUx41O6O5ElGQeoMYxGCjy3UKsz15AA08
	KQrwlitH7bv9+WgQc6wGPUBKsH1fISx+VmhwCEbTxddcpoauFWnr8uFmPtpm2eE2WVgECl7dRvt
	EWJQ2hF6yXNn3/iJU4GvVbgTOjqAG2vwodra0F7KOtJYY+ncx7X3j2x8tJHocb6KOBjh+dbZXJY
	ttdRzw3te9MZm0DvCn8ka+A==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979971385a.5.1788944952165;
        Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979966085a.5.1788944951632;
        Wed, 09 Sep 2026 02:09:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm1274405a12.16.2026.09.09.02.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:09:09 -0700 (PDT)
Message-ID: <775b06dc-d97b-432d-96b8-f645f685b845@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa12238 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nUPH9bo2XoE18v8cv__S6L20piQTz301
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXy2yUT+PiH8ma
 Kl5juX60tIsmMhZXGhEdMElRX3uYTaLYiVrO+H69fTDFC/0poPgsIkohe2SXy8zjIRicikM4QEP
 dj78q2yDGdpsDdE9hCaPmsBT0ct5v7XOjRFytz4xh23PlV6Mh/6XapdMQ9PPBNxWAQUUPr24J2e
 lGNZq2Q0nj4fontdYnAxhvaQFvi3/aNz5ye/DctAZ6fxrSaLfNytZ/QYi7zOcEhZwHOU+GhwCiU
 CL7domKBPCwOAQ7ZKkXe3l61CcBvNkM77TVSmx6wQJ2bFAtBpVE72OSJgTlPpYUIvaGZj6YNile
 liVqD9Zl3ftD5Vf+vum6I0JJBhfJ+jbmNcHQXSCJBRI3F6D7OTevx+LZsccXPalktN+Mv/jhuXd
 moKWo9MtwF+KrAacHoq8T0Oa8qOnKwRA6/6WGLCzLrkedI3WBi0pzP0c1aSJQqS9nV5kncVJ39Q
 cVXKWGVKlg6XNTJP1pA==
X-Proofpoint-ORIG-GUID: nUPH9bo2XoE18v8cv__S6L20piQTz301
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXyEWJDYOwY2oZ
 0f/QqvnCj9zR0Iby3FhiaANC5PGn9qFmYqgXRrUhsp2S+VrsMUwqWQrm/CNQZ8p7z0JVq8ZlXUS
 QoxUPhR2cuy8YFcQhAgjaZFTy+eclIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090101

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
