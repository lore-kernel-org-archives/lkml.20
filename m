Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4318469856
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388926; cv=none; b=ci6z1Oxp4Po6D8HG6j7l2t2In0MBD+b1WmnyXi+nOqA2ONJbigZVkJUOlOo/8GHsO8ZtF/9xvERPoZ98VJltyCpPL+dDByVDnP8s/DvQP/kjga+Vghe/GsS0Y8Xa5re4LZnHatDcAHkBmiFbkryODQr6+dZHy0x2niCjPrKGFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388926; c=relaxed/simple;
	bh=PNm5ThoBhQTfuRajdPniX5QsIR0yF2ykSwtXSu/co8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTVIy+56STxhLpVK6Piiu0JkF5+dgt7gKH484kEYvjRMzI9vnhfI506g0hIEszkMjRNKINQ7Gx+O+YY4H29fh7SkdZHeMXVYPOnsfTW2CiLM1DAQTZy18cTETldB6cCErUOHEP86Nu9hIk3cei8Ht7PbiBDHMI/rRfZWTFdbrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVEkTebF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMVobczq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVEkTebF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMVobczq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmNX74032584
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=; b=FVEkTebFGCyEOV3c
	LbdvnhnoLu1SUeYhzTuoCCOlcxEciG1svCbOp8QP3dUqRtCsPuQzyX1b1AVVr0dd
	IJ9HjbqUumkisZiLbSx8PAlhe2ZgpuGUVXRtPeDslVcMsjAteIArVRXbkVdeyfqv
	CacMduIuSFg3cNNWpWSHS1RzOEwY1xUKv40kBT97joJPHeasglKA33vUxwJzhlJM
	CilGSh0v1ecRkVp2oXuX/vuKfgc+vryVeRgFG244J06bmrKmsM9mgkcFTCcDrYen
	66CbJpjfAvdGXrEyhnpt++cOcsEMVDVhZTPVn4s0Vhl/NbT5SMen876KiBxKvrtS
	L8Nj4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so67609685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388923; x=1789993723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=kMVobczq/3iLN0wwL7kqHwXmSsENuVtKe+XLZG2M7/zsyZPc780klTt93ytNgzTJLm
         /WwQHZbFa6TjAOeYCc6nLFVWTmkJabeCVF70jFCMSVSkHVMIXdyUVdWytBu2q+vkZtzC
         FzmcF6zfp1U2WbXu4QIW6d9rQLWaToC1ZuypzeI4BnTejz+TXzM4Pkf43tK7Xp/h+zC8
         C9ioU70TGVUIOgLHWDZTy3t66VjztQiacPoJuxxtLwEC2uH0s4dYSHmnxWHceN5OSsXg
         Fu72Yf2AHhLa2+eTo5xDDwAuSj6bJUT2WrF685iSyUIzudlOoU8TEegtVC7qHS3wHJEo
         6XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388923; x=1789993723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=RZtGIYWk7yBtmDXYDf8VsShFjYqG9og3LUTWyLL9cCKE/D5CLMnCokxTnEvNlDkDDl
         hop4cXMwONnAl1vmj12EpwPxqP3l236Ta59Lmjt+LuoYsHoHM2LOJw0SGCvkc8KQV1md
         PZrsuVyVLorzEEZVhv6e5dZv6OXuEpfz2gqcO2Ghw+/4SG+rQkCtaOZgyuEsrlqxM+8N
         SLKz+eQJqOgWE+pn8Qi9GZUCV1EdHmAv8AmuX/dBKPEPJHgYm2rbjCSHfqsxvysTTnh1
         1RMR8v9mZ5gDuu4UweOze8ADH9ZMIFPNceqdugVDo751pI8TQMukPQnnysKxuZvS+h+V
         brnA==
X-Forwarded-Encrypted: i=1; AKwUvBxpaD5jpscJ93f4A1pR1rPvnRcyyansCCoqlMGu0em6NSJaVnwDMGBGALPELJugc4saQQkxkTbdhzEUcQk=@vger.kernel.org
X-Gm-Message-State: AFuF++k86IJoUupRBFjt1pP5AcCFxId/LsW3XI6F+jHOttKYIufHWEts
	5yTKkkGkSEdEpAsK3vNNafjEcJCjb6TmBAimBB67+357vc4Kn8GZMFMRPefjHBCydO+bGyK4uQ5
	JfdgsfpDaXU6pVIXKTMcQTg4KPRRQCE5iMfE3PvtrU6Egvc1dryg07osbQ4JnSK7vFGk=
X-Gm-Gg: AYBFou3IcQQ3UuYgp2FOqwVplguJ+Wvo6pEnK+MQ03r6jXuPnh1YqjlpdHlBTL0uxbD
	8Hxo6T7Psrepg+gnRf2eT5T4VXl1d32EG/0cca6WAz03RghDNCFL3fXoBC5R1WE5lNq1PoNrK+Y
	fWUp3ZQL6H/4NFKxQZc4ZaAVQqBjC/I5MZ9tK1o/ZUGJho8yhNt6EC2ZO2paa/8YKtEsRDnMRp5
	sirbncFtOTsabb+7jUPAfVLWcxAtmm6B+iC1Ro8bUPt3avuQwzxlXWFpb1a+ZXxAzcpSsKwRWyh
	a/3fNH7kX6knauMA1qXkmJXGiTa987+rXI+4W+iGqd5dmwY7QeRVGBHptoOlTU48DXYO9gpLyd2
	cR/0JnL6Xix1tj8gbSABcnQ==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr254459885a.4.1789388922711;
        Mon, 14 Sep 2026 05:28:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr254453985a.4.1789388922224;
        Mon, 14 Sep 2026 05:28:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:41 -0700 (PDT)
Message-ID: <a5ab732f-123f-4d86-a5c7-26351197e2ff@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/31] arm64: dts: qcom: sc7180: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8a66LKdn471s
 thXmemqfcEiGu+eddOYxNRhiqIZ00Eu2aG+UaDmnX6eP6afEUCGiFdimhRSVMEhoehtp+XckbQV
 0zET55OvdbCuM9pM/H6Z2lyIvyb1oGU0pImZ81LxI3T1iEXoZEO2FFwagOMQZrY/yjVL+LA22Kr
 BhzakyJRw6CER4MUSfDyfC5Fqj/O2ioTsAQXvDL/CgahoMd65sI+L/FufktCn9/wVnQJeApwqwp
 kEi8ZFXgRwcfePjFZkcukcZNglW08N7/mXKHE64iQ3UWcJfEpc1jtu8n8lyKrL/MVOhHUoIZtEU
 FbpMcXFHhr8cyd+nS0igWd7M29uq3Edq2+YIy/CvdZmqvuQOCf7kBVPv8zg5L02afPCc5EgFeJ2
 ZxnckRvtxszEAH3Qf7NkrsW5WDnZhmDNx62NnStvs/WvzD3sEbpRP1VdF8TK3OuOdjEatQq0SzU
 iF4SZip/IzZaMhDrkNg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e87b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QRXTkSe7CqPH4DYFJiO-eGkTmEyo5so5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9Av9CMIv2H9f
 VQulhlmruTKFVqUiv1joLk/jwMsZNtDxt/f4CEZaCBx6bHprAlHoJuhK5BXgb9UKzcmMB8V/j8A
 EgTf/BH/jTXx3y/9qsfxfi0qKGjS6LY=
X-Proofpoint-GUID: QRXTkSe7CqPH4DYFJiO-eGkTmEyo5so5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
