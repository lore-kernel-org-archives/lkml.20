Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E9414436
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375434; cv=none; b=aCiAo12T96W8ahwlGq0RAqMcPZ3WXHa2M3lJC8uS3dS8nFbvRYcpk31HmvT7ky4yP+w2QwQvVKGfMGyVnXMbqYPu1fowHJ+uU55VZ5HZTnULMN1MBc52qDrdRb9HSqDWPLOwthUzWCN2ASquLNhQbPCkxDvFGRKXc3z1ygyG7GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375434; c=relaxed/simple;
	bh=eRoM30W2f/mkMP3RZm5HJq5vqvrB/xfVifW1riTwVCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tB2f2Oj9WZIIR93YsyJIpWMm+6gO7PnI4NQT1cWNrTLN29WVaQAyMDesV6JYKOBFjUDaAHjFCqQczfLKX5FjydFH2LtskPUJXl4CiZGv7jCERnEp8CbwsuOH7viW/SNSoClTUN93KGhxQny5hest8eIb9sLArzHsNcv0uyuIuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnCphuks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUXMAMHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnCphuks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUXMAMHB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwk6543122
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=; b=dnCphuksf+hU9Etz
	AeeO5zYjFlhsxtEY6Y8JtTIE5adm7CDRzCah02uX7qHHDFKdCLG4gTsBucoa9L+y
	9p6lneLInvFbDGRiRn8IfcLK+joiDX2LpAEXNGpoE8IKZdi+3SW/ZrZ+WWF0P//N
	6665MtyN4JdRtE9mjTgYeyMVEB7tLluUa10Zotq457GW6kZ7toO5nnz59K+bq0W7
	YZMEB54DArginHHL6kUNlL+HWfTIzQKRfFQp18a4qaB+Tfi37RExClJLRIhzZggu
	7NOG3d/ZG169gAD0EI3Xya/5wQ/IRfd5dh2Pl6dozW+KCXZkzmN1GMkGVuC7xzfj
	BWZmuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09mhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso47603385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375421; x=1789980221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=FUXMAMHB4PWC9HWhoBKenH2VDNLXikZd/IjV5i6e0V9FJlhrdjCoEyrgdMfGPSg2T8
         HXwbBSG+QICYxxflJMmtcrJkcGdnZy1yN3wxsxkh/Mqib12tRTHVOlTfE5nR2HUqTRHt
         gV4eLMkddeJXb42vuGNEm7xKtCyNYPWYV3qUj7cKqNMWdXT5T53M3qRAnfZbBYzyBGE7
         8ldIYf3/dPZlNM4/U+C5edIn+mI5YerZdh+0t0dVCNpymNah+o2q6/l2UR8Ow8svOzDK
         1LZZxo/SmrAUMozjwHKgHTEqogeW9IAKA8Jg3x3OBkW6gbelC7e1GeUhvmwLoepHSIm6
         4VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375421; x=1789980221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=CU+TruetxIqr+Q/pGvVxmERF7JuR+DeIp54CAd7W+Zr0+YX5KJdwFyPhB/fb5AuEYE
         xgi3tzrIQDzgWGBVKx6+2lQ7pXLrHrjcSH1bLqC46qvDRmjI35X5SG8l79hXUAfrFJiX
         /cJ6bYc8DmI0cN384KzuvbUqxf67V72yCwvX88WJhIOXon+9dMPRWd126kimuPnu55mh
         BOYaSFrY9ZTS+KV2EfmHrU/g27FADRZtske3bdjAqq8YlnCROX4wiSNDwHs8ZaJeDlgu
         ebevbMaexBWRK81X3kz2sulbG3RaNGKS9sYPScyUIDQ0cmlG8+Vbn/battI3etNI8IhU
         WHvA==
X-Forwarded-Encrypted: i=1; AKwUvBzLD/5iy6+R/AY9Jnfb5iyNfNNRZqyLHswlP4rTHNaHRCW+QjlR9Rrgmyg1QcfvGQRr5kyt1pVv869UrgI=@vger.kernel.org
X-Gm-Message-State: AFuF++n9dp2XkZvQ8buBDZ5N+cDynVXMgGJ7Zl8wIdjgImMy4QHILPUw
	3RtUC/ubPTkoCDbcO4X+nfpb9bkmukKZq/oKgdfHv4VBjMuwpS+ieYKo9g0rxQPYUr+mg7Jws2a
	hE2sVy3RRNdjBNi9ifFy4Jh1JEsSVBssmrB/1TKLuRNWicboclqcXOjtjV1FkmUiO7E8=
X-Gm-Gg: AYBFou2Syfsz9aXGx0K5NM7mR1MSiYOigcaEffvjQWiJf28NdnZt4Ag7YOYFSXOwumq
	HJJg31zniDNl4yR3mSQjd9CvsjIg4KiCSgCLCw0ItgDK+q4xbUc3WV+Ai1vTREWn70EFdCB9dZQ
	5FfzkjHIjyyubFSHw0+obcmoxkZiFHNd8hgZEN9KY/j6G3jWi7W3rXad9W4x0rCtcUI8Z2SvRms
	Qo/B/aaR82gqI6U/lUBj5W88KF5LnaRqZr8Z0krbZTT3VaGloEUkX7WQK/ktgMfbx55Mr/oqeUv
	K5McenwdonsQ8WySzP8loJFa8BtNEmSd+p8uDWDkbHlsGpbP1cOo7QE7dkl9fS2sM9hE1nRU9dZ
	kZOms7crndN1BovOlIMMdRw==
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194986785a.0.1789375420676;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194984585a.0.1789375420282;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm389342766b.49.2026.09.14.01.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:43:39 -0700 (PDT)
Message-ID: <9e4e2e86-8699-4fc5-8737-a6bed1e54ce0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:43:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 camera privacy switch
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914081652.5935-1-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914081652.5935-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX44J8TzTG2CEm
 7zzJaDmJ/K71npI1ml9FpfUpZHby5H6CWsPfJvfLisOOJBILBi9BfFRxE3t2Pm5kZKm10yhR/9C
 dEFBDhQFrcilBDwHP0yYyjzGvLQAgPc=
X-Proofpoint-GUID: -zpK0YKif2V3kB5BDlYb4PqvyDLuEZp_
X-Proofpoint-ORIG-GUID: -zpK0YKif2V3kB5BDlYb4PqvyDLuEZp_
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7b3bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=qN27Oiai8M4bhUiYl7kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX1Emh6q0GMkz+
 5JO2HUlSbQVMAN3chVTmAbMopeZ47asGmHQ59hYh/7nRol+fDQBo1xuItrhv9CEvQpRI77kvU+E
 XUIGQ4S8CRp78y3fYc3WNJ9hp3CGBW7TnWMOvzwQOLYONGBw6PUGAc9aetNwtcXWHR3X0JqpjlH
 Mf6pUiwXTsyn4TSoRD+qGyT/IBw1WYN/VisvJVNSgrHQ/E3buWfT1PPQO3ZwmIKnXu2tmdqcoqi
 FpaTJhJnNQ4I9GMrj5WTV5FrODgwwd/md4UCil1/6iVXUmQurPXueWmCLnfiB6vAWNTkw6jQ9Zk
 z6wygmB3HS9lCw5AJmT8Gp8g43zrym3uJWim97U5o4ZJUNduFWzZ0si6XjPtmYzJuwat1T20B6t
 s9NxLpvoVPP0SJEIJM/cPFmpBY6foTieup3rsQ6MrlCJCGmbLtkrVMKyZdAr+tJuxvoTdS4OoE2
 mKSBzQNqGJi8ASOAUrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

On 9/14/26 10:16 AM, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> The embedded controller also raises event 0x29 whenever the switch
> moves, which makes it tempting to report it from the EC driver instead.
> That would be the wrong layer: the pin is a plain level that tracks the
> slider position and needs no EC transaction to read, and the EC event
> carries nothing the pin does not already say.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> index ecc8c34fb983..b5848991dffb 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> @@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
>  		pinctrl-names = "default";
>  
>  		switch-lid {
> @@ -62,6 +62,13 @@ switch-lid {
>  			wakeup-source;
>  			wakeup-event-action = <EV_ACT_DEASSERTED>;
>  		};
> +
> +		switch-camera-privacy {
> +			label = "camera privacy switch";

nit: other DTs normally capitalize this

[...]

> +	cam_privacy_default: cam-privacy-default-state {
> +		pins = "gpio99";
> +		function = "gpio";
> +		bias-pull-up;
> +	};

And the pin entries are normally sorted by their GPIO index

Otherwise, this looks good!

Konrad
