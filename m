Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3041331EC0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403950; cv=none; b=u0vsMKeVEHIoim0QBSZyuq9hF0FC0bFf/PVhzrdZtEYYrpfbcnygygt6ztPL2HI27XN4QZ6Ww8Gcm3d9OW1MJ8XYi0rQR4J3cKp1jXT/9TzB9grJtrVrtwllm72JoRETOKGjXm8/ZPR3XFbsJA5DSBg3dSW5EhmyXBHNKXH/2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403950; c=relaxed/simple;
	bh=zVKvavHfg4RQjdQk1Ihpq3mREXCK9+/dqBDndo4eJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqyKpCdESi+nzJlqzPUlYgO/vhiMBjt4pZkwrj+Lrou9PJyIWr7IyHJO8RbNU+MrFSirl83v4A2KscZERUtnnS/K0UIftLJxGA+UuEzauWNHgHIT6zL1fiNXst2de46N4BWh9XfRpnNh5B5NImd2zlAUGFlVJ9bd9Uia2wK1+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idmf7Oxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToOdBxW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idmf7Oxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToOdBxW1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHM8M2968225
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 02:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4+m0OoM2a9nRL5KCXeQ3F7G
	JZWJtRbuEyWR85Y+/YU=; b=Idmf7Oxfg/8Htmot8gcnfZOmX33SQlXj6EfqjbHI
	l7kbZX7X933/LWKakb8smrvQb65W3Nmr0ElMQYDbdvk7ysylNjs9r19tFRhWKRYR
	dqJvNHaYh1eUkLOvi4JOJR3f/MpLjZj1tfbD9ZD0DXRcP0f9zNgBQN8Ui5jy96yM
	mBHGZQ1LFFZKzgzK+49/D7N7JQtW8k2dp2CUjk5A5jC0+Lu/jU9L4+h6ydtwBQ4X
	DECnNPQ3ZHCr5jzK1clbc1ho54aqvjjbc/fTdUr391JM6xbMPltt1LJbAosqgN8Y
	yAVfMoPI1eDGHrKmNQF/ngvfinFJkIsUi4doF86S5glqEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cbwpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:52:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso3475234a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788403947; x=1789008747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=ToOdBxW19DzlWjtb0mvJd/9TmiNqpis9LwtZex8FJSXimsrU50oeT8kkTuO/duVPJv
         aO0oYR/dLVVLOEQT6pHl+3T/IQGc+nqEaNZXbhzM5yvCozrOpkiekwbKlk8x0gAfYCQL
         LXOPcbXCD7giu8O3q4ISr5VCZTOZitcCnPwvVMhsL6CKVL2chH+KZSXZrmqL9fYtjYQw
         M+LUlwjCmU7xQ4yQ3xaLT9omcDl1B0WX+8IDv48zJ/NveOjdlragTtwPuXRG7ec7k8+X
         UwIzdQ6hUSn+y+ToZOzLbmt0hcO/9hfEj/BgQhBFw2DDcrPRiV6R6fS/pUXFvse+jXK7
         Rnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788403947; x=1789008747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=I1JABZQtSfgz4/8h4528ycGwJ2wCt1vg/12un1yo0aTn9Wjghfa2A2ljhMKNQ3uleZ
         6qkZc7V+6v8+PhOun/owpWwqk5uBRD2oPEQOlfbQ5vbvC5OvjcqvWhm2goCp+Sl9BDXu
         MxV33Ne7hSo0tc/r7zGNOQJMtvSSZ1WiD4qZ4Wayg/bGpIIvA6rcWiGcr7axFSNvVWGE
         guAvEJ8TBWmxiJ5HO6q9vX5HlEGENCEmSnaZYLhjIyY3slREvxH21WzqTtBcM/R8+7P9
         xHF1oTKySc/TFcOGgcZxGoYr7pf+VKEH79N0LbMUYbG517SbWksErvhQbr1Dz4sErcrf
         yB5w==
X-Forwarded-Encrypted: i=1; AKwUvByxhlZs7Q2T8ub6XH/EZrm3zSy5JrYR1cvaXznQiAsIaHvZ0bGPk2+KWto4lWEKf+n5SOWgberctzW78r8=@vger.kernel.org
X-Gm-Message-State: AFuF++k1kveWJRm90yrKcCqSUHYYxYc2uwncaxav86CV4mMxg2FOBoZ8
	dOho4ASXPOs8ODrcEAqcq9hDU5Kr8HD3L1FyY49PgOmrqStu+74L0gyyvC15ENwSfLQMMyYPzWA
	jeaXn7E7A9OkrfkVNrYJ8jiRMhVHkfNzSJOTMVAkEdYDiN+Y0D9rVfbHccFnfXY0RvZI=
X-Gm-Gg: AYBFou28i4WVFAtjrE2biq8AhS3AYlfoi6i/nkoiYFu6HG4vuQWLjyfSijimmnhOsdv
	cykw0UPiqgNne4Sb1cjIWx6H4jNOCZ/ORCqH/y3ZEBd/QWvfV6QdqPLM28pCp3avtZsNJiBI0WV
	EKdFx4pD321vTX0hQh9WB8hxX9Vnk4V+wAimDM+urSlD5MK7w7oqhhT3YeMABN0MvsF62SiNzLN
	q3hbmBTjtWQ/KMOJK/lr40zlGa6uLDh8Ix4hbn4h9LGUymSOeD/zymOPYoSnbEkghn2PRXt8/8H
	0KybWLEyMmupwKsp0vwigiVP3dNdJ0TAVXAVlA2X1wdoZkhkwIUollVeZZG7QG8Pw5DzjBDsF7y
	Sa+Budzuw8OzyG1xk5JBhxhh/lKXUZsVYc0ZpGsgN0L4=
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466249a91.11.1788403947315;
        Wed, 02 Sep 2026 19:52:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466195a91.11.1788403946814;
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143199692a6sm3164500c88.12.2026.09.02.19.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:52:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <apjg5Ta-PatEeqC3@QCOM-aGQu4IUr3Y>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX0ha+B+nDuMG1
 AUpsYN98fy7HWbb1O2isjgQOR6cGM7aDCHeH9RgfMsOkeOrWtYz2sGBR79EXBC5tB4iOcmLkB8T
 E/hQk43CfLtsV9SuxUcE5DBYYVMplbw=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a98e0ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Px1P4hqg9HuXTZj3O0wA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RuVEYxW1IEY_3NKvZymnTitJc-ckxZVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX8E1C/84W3NWZ
 p2TFeeqaHBXuPgDOGQm/f9pkmiOdFP0xcdIIUbI+DHHtsAQ8utc9LKVuLalsPh/6Tm5VOKoJNAW
 Rc2kQmfRKz5u+suZkWI5h3lBTVPFwgEMMhyp1V5QW9A3qtplmAl0gnRNx6le5yz/Mq8oshTPdwc
 cf+tBqUI8NlcFTlJr3BRgJzA8UmRNBqxawsH09kkrUoaAzCx2JxYi3KMwOyrYEReSvrX4sVfYhb
 ogoCEkl07pAkdsTHgrcnHvKpI5iHInqE/Azb1FEyQCdAnpxxJq96klx4M5XlQzjrzAOapd0vRzq
 BclNTCwntwHF6o2eeOMH0eSQ1FB8xysz36hjVERBFYZTY2PaLf5MlgYFUvN4Sf2wD4N11cUDtML
 xGZqahETiQxRSGvW+fwVeUJ1pFLr4ILlpRLT/KTe9DORui+22d/ae6dz3Wr0JSLCXpgix3NoGgG
 SoQKwvvJlR0I4zS/0Kw==
X-Proofpoint-ORIG-GUID: RuVEYxW1IEY_3NKvZymnTitJc-ckxZVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030024

On Sun, Aug 30, 2026 at 09:02:04PM +0000, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

On Nord platform,

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
