Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E86442FAB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388546; cv=none; b=CpMAvorUdyPd83I+gIs3IdHeBV29VWee7lPy9qR3C9aJD7E7xkkbD+PwtpVAeRUo2eF/rQuE3H0RdX4rmnexpyfeEzgyyn3BNzzmIHwdeRn/0hOHYBoZEyTphxugQWhpbYacGwV7pG532Q3GHjcsm11SCQkbT4TB9pwKyXOLwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388546; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXywD/Z3dhEQf3LHBL0SBXKur3pORZL3i1NzmiRVAasR7f4/m/uMixVbKtBf/SjGdvnyp9U2BSWaL6XjH9IQsEgETxna57mWzSnf9NLkMFLfjeRXzDF1IDVyecQ//hBfZvCVeBURh0BajAxHf1gcbx1CJ7fShHWcOw9fBr8REkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XT3UvoL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvwO6OWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XT3UvoL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvwO6OWM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwI43860377
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=XT3UvoL/jdjwb2wP
	kLOqTK6tUJPyIWwebd2QdW/+/S0NAaHlVBbrHZwDuQU/n54DW+XM6Vv6bFkoWRPW
	QKaFXLALTsuKqmhjc46JACQtXMvwXdDUm/6TbvS7kEylmUUFhvSAjGVA5St1Xkxf
	bwRrVzHcWKz845xmj+t1ZAYlCBrI8BnB9r8Rgl+znzrpiqgWbgJRbNfk5rYFxem9
	AbTwSVBchw3uLa7EjSuwchySnMMHrdnYZoz7EILGvXAtkRGdQHDxLlAeFRM1zGTc
	YBb20XY4oYjvPcMtVYXrglVeXBfIzq3LTvWwu9vVh9XnnyhaJkxrDSmceFpUFJKv
	o8AXRw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so54922e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388543; x=1789993343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HvwO6OWMPtrdbAUA0US8s4wRFuPx51IpAkYiYAHs9xhigDoN0P+hRhJdM5c8u6OUQ0
         BW5saWhshJ/VsqINskU8s+CdLzVt5j2DZoOOdOPB4JLh5vF/MQ/VMhtAIZPiVdleoUo1
         9YALaNjGG56TbllkkLrFmmzTu54TrzuKwjo82MZ92G43o8QzmAumS4NZo514+CvxgXDU
         sllPvtl8y8L90SYhcXjFecaSRDJ+zI4kIoFmXdIg+k/cxO7weHT+Y5a9dJrlqZyKko1N
         PHoEOw/Q1VNFfbripX3bfRdIf06acS2KAg4DOB3Io5194GBHlTfDcJxwW5FmNdsnEWFC
         6JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388543; x=1789993343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=Qi88iMp4GII4xCmTLW63lhsHscxEIiiETYhtd2RLLDXSEgPbIWhlvEvEnnLG0uIrPv
         tuDCdqT7UKBS73IYvUTfjQYuFFYp4bWq09lkG1zNXKQjCmq8L3YHtBAOtRLklBrz3URE
         gUtgEo//70yTn3+kf+9VqLD9VzfDuPFybM6xD9cOmvacpCY5aEs/f4nvCiUW9ZSYg1Ye
         GlIUYz6lpoRtWzprc19a5vqNzpfRxRJjr9gKjLvsZwZwlCkb8sosmK0UNgj6+xkGrE4v
         8vXq4O/aDgq1uVuMclh8Uj9UwiLwtYuKhlEWQ1q98EP2AGefKSLrksaMJiR+OkATKPsJ
         +MJA==
X-Forwarded-Encrypted: i=1; AKwUvBxEcELtUzdYk9JT54RFw1xahHRV+XJ3XmHJrLI7wiPEcQXweVp1+RypX14K3v2/pSnthhdns8tFlHfcrVY=@vger.kernel.org
X-Gm-Message-State: AFuF++mNRVYhbnv3GJcc3cXz2GXDdliqClXYn/x/B7Ak7hOFMGcclZAE
	G8mphGr1XvACHxquCKZXmhzxplIzkzR9dtIIgYGT9vt9g5T4DL6Qxp4cRQe0hDGDVeRtmxOykR9
	B8XGRk0V7bXRmMJK30YehWf8hMbIBvYhcqxNDuG8323YwDVP6ul7UwAw+5mgY7z+fY38=
X-Gm-Gg: AYBFou0kJAUfLQ3l15K+u4i2MDFyer5ydc+/vtvZ8XAbCS1lZLxP76zQBqpr5UtcE9N
	ynpVKW7L1mO0Hlk/iETH1lxXgprx0mqN7Zq2Xciicx2O4N98Hz5Lsz/Omt+PkV20aFloEVP7la5
	fxxD6zUpNSza9yLPhFWr3QO8sfbioG6HveQcqZ1kB8+WYi/p1pDzUD+XAUfctQ7DgCpeINnwYt6
	qYWNQC3GXZosJTW+dxnOAkJWNkZ3ZLiMDPtnsxq+so5eS1TKJx179c9ICp5B8YVNj1TijYGmIix
	mDqeAt/c5KCNvBDWEJHTifQxtSJvPVbIPevmYWp4eiEJ77lMOfm1GrzSeZ+4LwtlcXfDr7L8tWl
	LT5+R3pwAFl+RJirQRg47Qg==
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283049137.0.1789388543392;
        Mon, 14 Sep 2026 05:22:23 -0700 (PDT)
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283035137.0.1789388542964;
        Mon, 14 Sep 2026 05:22:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:22 -0700 (PDT)
Message-ID: <31a67295-b27c-44a5-b106-ae030a046c4d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tfDrR5PNJnpWXJMlCgJn4aoJh0jwNjvO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX3b5fnhdxIAzn
 gBQxHHBvJz5mcNcrzWkeabNWx616cPTShSI+itmT3umH4Pa85NPUzTPQkmY8urv1NFpAqCB2uL8
 Vq3CHxSRZNIwP61GuQQljuRLzE2N4aI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX8NmOTboHcq3g
 XWI1q3LfTU2CUwhwFtmCyKiF/NBIceGfo6eUvMoRqgfgsFmqdoK3gHLGYWwga45Zca1D4as+Vhg
 pKIIyMghjoPC7YBjHSZRU9T+Rzto3s7yU94zDy/AoZeG7Dhz/MCrCLyVyDKUxKBg8RGA2/yeKVx
 AQIkz62PHgW/epVIqwh/oq3CwBg7CeQl+fNg7PrHLwEvBgkdTVke3cj7vmDnP6K1yDzzycpypUy
 r0XI5BIrNO8W0TImRQtxcxhJAotJmKZiT7+JbPY4Zqp705S/OO1QZHkf6kMMW8tZCiGw8eW5bxg
 vlJKGgY+S/SYG5bWvIyFH+4XMIiEs+mwwKv6qZdf6dSKp3kbZNb/HijZhc5KWE3ICDKaqVRs2lx
 D4iU5R9hzdH8aZwII7lLJL9EzlnWBNYI/gqN4QriMzmopKmouG/HZ35c9RJSIa47GEX3WYKylxl
 VIlFPGsstckP6zC0E2Q==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e700 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: tfDrR5PNJnpWXJMlCgJn4aoJh0jwNjvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
