Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224A3CF1F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143871; cv=none; b=BG1W8MKOdaTnYuKeQYAhLyX//6MrAonPWPzLhtLrNfu7mzEL+iNHHLVXz1sw3fSoX903dMBqmRvIrb/F1+9SGbeCoQMs0KrkCBE2KotIOkP9y9atqRYNM3C2l55MLvKka2G9cQbM7TKosTxyxmkQ/fhV3WbQ+M5Z7FedM/XsnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143871; c=relaxed/simple;
	bh=4taYD215YRAQNUPPxDBw0MIfx4eWRATNX145kiTepZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDlM/6CxkkO2XQLAd5aFZsE3hQeQKs3wzLHlf+NioTsNodySAEk59HjDqfVn1OmTHmYZ2KKgFqOvIDyD4+P3rswUPwjxXL02lz9n+HwMpCEC8d8a/ZDEJc5N8eQvGCe5uF1JirNxPkKGAev1oQU6e1jpUj1FKRBB8nWIC4I9mCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AC4L7wLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYQXUh53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AC4L7wLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYQXUh53"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lvY41611516
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=; b=AC4L7wLZXwiaim90
	ZImLR8qALtIKS6d5KcRZ7ykqQD+7IajzgXvYFitNGP3aus6RzwmzejuAQmcy/E++
	LX3SFwpSxGXlV5B0RVojwbtTcLmbKkv9Nlh6FLRxWwTD2P6XmC/AhMBI4JNZ05OW
	coCtoGb8P+57k6I8spmX6L1cz3uTWjvrKUnCBp3gUlMQ7JZLRLgWISg1PzDdLgzT
	xh6TGjYQKSZO1pyPIrWLCDNAVK+79nNlip0PX9Il9bFDMSgIJT7JkuPwYUSAm5Pw
	4NeDwY+9z/LgQp+bZiSwFsWPHsgbtO4g1soF+PjuhpUN5al65i0RZALLeXcaf09r
	a906Sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3seu4ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:44:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso1160721cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143869; x=1792748669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=;
        b=fYQXUh53DeDHKdZWZuLnUWt0ao0Mh1JYPSwRoZ1sw0tcsMtQ/PRMKoEEZY6LgVOtLn
         Q2rTQTBBogUh39hbmJNPqAGDtM+Y9fkSbPUtBIjBrzVzHby5570kuPSrzY9Ii9KG0ir/
         ZjEM6Z9jxm5Qj/0JFdXRspW7XBdPbavuEJ4C6zBV9CvAwUsGyrUiWg1qnkjdjSyWvJtt
         my+sfaDRtHeCMYssRObFIHOVd2B4fu1pdpozs4NDupPEu7MQbEXP/Zm+eevch98sRpcC
         8E/XlZiRvLRGIDmsWJOkfZLgsTELd1+iC+hk6nCPS/mrsEKh+pUx03JwOM3VzGq7hQUJ
         68gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143869; x=1792748669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=;
        b=1CmmjLT94cUfwm+qP6c2h+NnS2NR8lxlrqLcBxGNJO0to1QX2pJLVk9r16PraglarK
         wh7EJTgKM16a6EdFI99WpqD9SN3I8JjVYUWcVXx5LcfS6VXNnNwr6uEnffdXJcsbCsVn
         h74G+HkacnVDpILO2U93l2Oyofvg/qVMwakCWn0k1JMri6YhOZRzCxVjea4X6JPEcjv4
         X3UEbQAEI/0IkXegu3bL3qgTNqJiNO4vaOmZCMd6UVzSlYX4hjwxh+JUZ4o73SC+GaGK
         ZG5VeZTw5+idV5+R9HyFf0P2lk1EiVLzrAOAsYmkUZbdoZ8QSo7ODjOgnSzuiNDpcY5y
         r4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxJP46QRD4w/HMmOlUS3+vMP7ff/mTBwvfrNQWCWyJHC5VqLOjQWYulPkAKORqJMY8XQ7kEKUoFe3KSLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2ogFzZ/Sr95clb6GV5lreoUb7U1LRIXuDxwAdXj2WXC9+kGjh
	CkBHsvAykilvUDNcY+cqEuGo07eOALLHXwpvKYuFK8VfjU8xDrihWoiUMRBukfn6nbCb9j+bIDN
	EAcA6/FANwIZOl9HAt/Wl2rhIF/jZG0HCITYMX4XIUc7evKFDcnzealCXtkIdXA4L3eg=
X-Gm-Gg: AYBFou0o1p7s5llL4vL0oPmtt3GgSj/sK4xu425cHE+EEkpdueDncSC4nw7h74GLJ9i
	dS8WsffUhs75PkfLiJA4SDQeXXY0gWPbAcpFxoswh98RzsfAdrCV5wEt6FJxT+RhK9Eb4hbu2XP
	netXESJk1R8wxq9LX85bN1AaEwBwX4Ufhlq9/aeQDBrSUZlp6qNGemqauWn8T2eWb2HQx4XBRWo
	uETW6M7UP1Es4nIUbTxFr+H4zXkarf3S1jqzpGM+B/2TnjioC+Aru2HR80y3N9NBO8887y39Cyl
	RnlwrUfgr2B/6v7xhde3dfy4zemDpPbDEuckXs/Tnt52GJDxfKsbqNZmOLxcXTLGoYPrnox1ZDl
	quNrQ0m3VbiOaC2//uhTWzQ==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr417894751cf.0.1792143868610;
        Fri, 16 Oct 2026 02:44:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr417894471cf.0.1792143868018;
        Fri, 16 Oct 2026 02:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm55116466b.81.2026.10.16.02.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:44:27 -0700 (PDT)
Message-ID: <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yFBRng4F7376Uv4HbhoZIIJJpRzNO9dU
X-Proofpoint-GUID: yFBRng4F7376Uv4HbhoZIIJJpRzNO9dU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX9eZoUjnK7nBV
 xAwWMZiWO/Y5lEg8mD8XN1dCwX7blPp2txy1U2ebVjQNfNkHsSJo65r/D61ljR5JYF0f0PF6xkk
 tIasHM0RLTs6U29EcHReEOV+6PIoSVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXw8sGdE8+GRkk
 4eu73B6/GLDkicKpMWft38W3tPYuMdq/gKYnrYc5tZ6lnD0qlbuOZuskpJYr1Oss41n2XaeTnlz
 8Y4zUgoEdzYju7413KyiSB7OQe2FokojdCyzjO41Ncs/TRZxGHKleQ9z249vIy2wlOmi/eYxxv4
 MXfx/IIlwIKz3iyoxxBNZVdT6FATFudkdGw3AzAWSN/4Taqg0yO1MKW+ccCOgGwFXbFGYlzdlvQ
 nGx61P82OAp5m7VVpsZHUtbJosnBTu3/wjAyGYPTtQH/Wq7FCiqqrAmclBD/GDdritmCJg7J4E0
 ReLx3MJ63mwebw1dPI4KQE7lcKKE6m60xFJLKc2FOYY3rGhsnpuff8FKjdiz+KTiR2mSpqy74Sx
 qKrUw9ntV1pg4yCLZrfl4ldnisihNGnYswB05k4WG0ryQmXZI5OwmDWXdKJbOR75NV/feMj+5CX
 Db4vFreICPml/64JA1g==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1f1fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Bb-5hBF-XxEgH8lneVwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;

The unit address must match the reg address

Konrad
