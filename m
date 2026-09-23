Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1185488D86
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160165; cv=none; b=NO9O6X1AqSNuvu8EWB2Gn7evFjvlhUVEucEKl2TWo32atdxd8+bPSvUkB+fDnaahhpvmxqnvnHWYOoaW3+Y39wWmm4rmZ5NlJG8IZZLIdgmnVVe7QM5W9KHksyVPXBv9GgITdVj0BHCsadwOz3H7MeKTmr5/yzo2zwOi5vtqwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160165; c=relaxed/simple;
	bh=y5yy7tHO9AIai9NsuLZcf+45dRBnZu4axEo1H5vLVZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAuYi2sC8onl+X2T6Hy3BAQLuzMFXhZe4O1V7SS7Tm7uv+TLUoC+DZLdaO60bzbop5dmf84N9vQR3Z7BR/50s4RhLbLv4FR106YYMs2bnbyIKc0hasPLyvA0L1hJnsIzFtfdL1VDLhIlTIo6bQZQV8yz/ggrdi0Cub3X2yEYrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfo6A7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPX+Oh7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfo6A7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPX+Oh7n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Bbx2262036
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=; b=aSfo6A7Jtm3cs4LS
	B9/LeXci8XLpznMbVGnYBGgxD3NLAICnh5aTeTqrcYP0bXT4n6fPmBBQEd4uwb3m
	ejT60GvvKSHa8I2pxZ1Rt0fPLv0WMwt+vTBLGBCXzc0mExdjbjvCHlRk0oODJ1py
	/8tX4+n3ZAnZCxm0r0BCdk/pocgB7u6H6dcAODU9SlFUZAUmZepGM1pg/Z/3hZDV
	BVxsSW6yFLkQKD4CGKWaVPlIsdERJIr1aCLZHvc3x/FKmv5VWyMNW99xqq2RJ0eZ
	FC5BwdWR+FIUQEY3/BPb2DDZRMJ2J9y8yIYfJWnJxOXc9C1HGI0vt8icYHamiYfV
	UIeBpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3k9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:42:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf3eeb42cso22091685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160147; x=1790764947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=;
        b=DPX+Oh7ngvBX6FVtPwpKu1f0PrwXy7PzlfHM9JvXPvJxfgvh61axIuR0UOIMJJ/dEF
         qqimFT23/4thlas65r4Ebs1dkMM2SlrdkYrz4vWKXsQ/uSJeS9wjfq6OY/dP6U0ydqiF
         vgwImFU4uFMKml0D2BIuRx+wzGEqlt4Kw2w6wpT4QiP684udrqJzZtyp4PKvClmcddAG
         43KIP66UeLJQX/ldX9VJHF2OETpp+rW0GGRLwqr2kI0TWTiubElj4tPVl1Bbih2pdqE2
         3gsU6wVGqCRblxrbUwEhXB8Nn50eTr4TGwgqlm520TPmfjTq0UUTVPIyxRuhq1AonY2O
         PVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160147; x=1790764947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=;
        b=eJ4xvYNc4miPg18oPPI8omEimUAJyRog/pC/nciNBKJ2sGva98cCg0c1IRLsfbKePo
         VYgdU+0SzXfMZoatsqCBiyC56f8bxCMn5t0LcZiu2cizf+vO4NKlxRbz5kslyv/7XZhT
         +WYiuv7mbH3CvgGE23bGaPDLvvgYRktjmHaf1U/VKVm4tUwnnxme4E60zmi9kN4IW5Bd
         8MukSsgdJNaVyYtuEi2rHnqO3hgUdsQMuo8+736Scfu0wVUHbc4aoMULP8jL9MmDPxCW
         JGUC1SVSUQQ5p/rQC/BwLWV5cqNSaC3GcVZ53fV6znwxUiXjaEhCa+bvF2t2NzW1SIsQ
         Z3Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxjPweZ4L6FMcVll8gO8yItk2B0cUjd6+TgjEy9J8jDzm1zMilHXmQZz+1McMkDCKVrTXNSwXJleJ0lHJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgLkEwtpgGqLwBcyxRLpInFpvNs68yN32wYkaG6KI5jGFO2CCI
	HGKU8jp4wLM+Ly+xMdAnSyxzYtBHkG+1wyhZGtnHTJblLvXzt94CJbICofXELMhPbeXg7obqZVm
	NsWBmc6fChpp2rxpaAGhKPyR8UVwYFpsQxoXphiseV5vUBWruw+7WoUYkAv1XOY23hFg=
X-Gm-Gg: AYBFou2yaBUB1sNLjU1K4nFVf668yeFLTJ1guOg6/2WVzy0oSxf6nKZ+kNpUFSq9nnV
	wLB2Eu3gvIGNUCyl9MUdgNZQ6yt//hwVV5E/eEsxjOZyW5tbjjSFD43k4p4/4UW1Z+1M0D52BWu
	JepREkOdOxKVIlNG9zi/qD3aD5LGvxdCWC1wmfnbOEAdVYzJMHcnJST4ULb1G/QBNnWmjYEpm9f
	ZxqU/AMEzhiRi7BhbdsonPd5qAQAn/yE82myzyGBPANDlw/eAil6oVePmp7s15fph4bdI7UDClV
	5MGzr842qxWiOyG07WvmCKcQbLMZiE8+jdQOOVVxpV0csbMYV8Kj76EZ2rMpe3KW0nNZ1wRika7
	Mou+gRKRRdfDWWFAHLIykNw==
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr281879485a.2.1790160146901;
        Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr281876985a.2.1790160146449;
        Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab93a919fsm22378966b.41.2026.09.23.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:42:25 -0700 (PDT)
Message-ID: <b35858f4-10ee-43de-a211-3058eec6cc2b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7MRGV2pbqH55Yc7XS72jm85guKTiRCtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX5uE29uQipKn+
 C9hw53i42u1Ay4iBuFmYe6sg4+M/I+lblaFRXQt1zMnkAraPxWTMPXCWWYQBy6rbGyTOO2ga0Vh
 1flJfR/yyYR2EuzO9OnvFTq9LP+J+rc=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3ad13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kiNFlXz_Q0Pc_Uqf8N0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7MRGV2pbqH55Yc7XS72jm85guKTiRCtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX5LAo0Dxo2xTJ
 leXaYuILbacdB+Hhz0ftg3+Iu4RPhJAoGOZ+d0yKADMco9FJog9Vc7RmHrZJgojC5gpArxsEP85
 KQhCd27n8RnmVKVQB9vKatCXAWAFlntwvfKWY4OOCzQDsk2rimCwDqKvR3QLRW3UScwWk8ErQ7f
 rf0uKi7jsCuSrmUC6ZSjBD0izWeT6D8jpsVNSgNMc8Gt+0mOQpQP2K+mNbe2XIHmrdzBP39b4JB
 YDInaW9hQMAxrT/ARIKklB/4zDOPEsZFSxlmaoGkaw3WiQKBXiK/Kk4NHdK7SubJFzEdy8Y7W7z
 whhsezaGY2Iw3FkZ9QCX4sxdakVTxKXj9M6abXZuJEZpxciq28IxTYuuf4mrUo+c29et5EY2IN5
 lKHBAQlcnhwcqPumd2/AkDIv2gxm1+WGqy7TliODcSAICwAdvuxne6xNNguMHDFfgQDWCa3XLcu
 50ZdA8ueHkFaVZNLf8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> Add initial support for Qualcomm Hawi MTP board which enables PCIe,
> SD Card, UFS, USB, remoteproc subsystems and booting to shell with
> UART console.
> 
> Written with help from Fenglin Wu (added PMIC), Palash Kambar
> (added UFS), Matthew Leung (added PCIe), Nitin Rawat (added SD Card)
> and Ronak Raheja (added USB).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +&remoteproc_soccp {
> +	firmware-name = "qcom/hawi/soccp.mbn",
> +			"qcom/hawi/soccp_dtb.mbn";
> +
> +	status = "okay";
> +};

SoCCP on by deafult, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
