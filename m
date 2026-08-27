Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827431DF248
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826338; cv=none; b=aRi0w77X55pznnSZPNb323jOmGBCx9C3URZ2gh0Sy36jahNNlAMFPCCNtUClTt2nlepTPShGz1MVZYsSwkO1G4E9TgK5/gmFrVWSjDpbyQpdJNauJ3vKoFMTfSjPX+9HSu3+y1T4lEiq6t4C46zHsUdvEKL0/E56ytjVgJ3BlYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826338; c=relaxed/simple;
	bh=zigP1wL7oxtYMtnDpQWIUrURkgMFBxyXiiIMf6C8Gf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7C7oLMl+ng11C6BcWgGyv9n+21zCcDVQdSUN3v+tN9MOXg4PbpH0VfHJAZQ/42qL5RoT3iBG5NocmIMO8g6fLOKp/NN08j/1bUOahAMNXWPTD7u3GevumqZvru7Y3d3Yyn454ucTIxfXgVdF8bMhHm2nAM/TtXpRL4u5bUbFiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSKlQgHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XK73MsVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSKlQgHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XK73MsVT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HsZA3977958
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=; b=BSKlQgHkoszJG9cE
	5ZAs6MfSXLW+mLZpCQ0ECzm93SOLDyHR+MxFGuAYROgQel9o9wpQ+DNhPecxg2iW
	s4hI9TqMF3J4xUEzIr+snu9oRswlhHDLSrFVhCYCAoVkA6aDv7wMg2nzz2MajScG
	Fk0X18Hr/wULS2eLES5F64CavCVWUv63ynaZB2sBaYq4KjlV14IyZk3OprMlUEHM
	WpyUn/JWY346qow6ui5NxiVn0JvZvCEMooRkLDG1xwYzEWSpDUm43+G5WxwnBRU0
	NFJTE9zGO3qPrJbvMGXEGVjl7lrivgDEAmo+3ycEtRuxfn6NOqTKdLAzqwogNqmc
	QHmDqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egk9x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:25:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so14820695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787826331; x=1788431131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=;
        b=XK73MsVTmGc6ZyDYvD65rIgrF0gQhvgAgdopF4PCp4iD0PbpMTqIbaXdKEtO+Gc9Fm
         nefBgNnvji3mNsVKVAaWUGSktGVGL/3vl/Fhb8aFDx1271t0NCCcTWdEjBJqKAsm6lf6
         UFkiZ60rWx643sB46yoETg5A9TStBLc3w3jKK6ARzsKu519woAE6sKH1Gyf0SkRlo6F0
         UIjox/qD4H8vUF7QS4jN9A3zvPlk+jGz5fVxkKvBlfRi3DMFOsW325ceGosPsLhWH6mI
         PCI0+u9n5j5Zl0xNQwqNtHgH4LfeCryb0wy5Wd0mMZqirB/AkzljYS3HKVfhdwCgDWjL
         BS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826331; x=1788431131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=;
        b=Ag58rrha570bpEkXZXWUmYd4Ep425onBvdRrCTgdbYsT2JR3fgAU8WWlD4Eh3t+siM
         n6r/tK/O7es8/+os3MgDl/qAxAzGOz/ByNHQCEaDOtOXtg9SD3s7mCosvFJL/F/MD7IW
         Z9UOJUKhM0w9f5NqY2RoG5FBagqUDadPU4WdZ7IZiChNS1mI3VSUXBm4vWeHeJWRT6Lp
         5j/AAMaHbRcNAINLNFH91mZwWXrgbfvl5otEw88R7hue4AEJL8nxSCuMrquuo4DSbixq
         lzYx7VefvDDkzKonRqxI2w1sCKiNdkrgvcOgk/rqEDLF/qq3rcDUtkrAWlO991YJ2IGI
         lunw==
X-Forwarded-Encrypted: i=1; AHgh+RqchwOVm2V5prIEOeKb/SMXQEg6+xPAgHsg7iYHsXodHEDyf1f8EEgYXn7naXkckokO7zDVKfxbvdoCCAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l5GZ5wHFtNSsknyN/yV0Jb1qbfE+J7oHjwuCV5bi3Zm81PK9cl
	AnsYagMUYnHYBX5I4CC2g5/JV4ozmORJYD2b01qx4Kt48msypl+q8QQ8Ew+S84qV2HoDCarshpr
	Fap0V4Uu6rGurP+9+Ev+9U7eE896cSBxxWjXFuavW6YXvFv56r9sE/is+Hm8op0EdyMk=
X-Gm-Gg: AR+sD12Lnkf5gpwD7rpQ9Q8RrtteSfAUNy76vxuBsKkKDbjW4oCpjkAhjxx6nruazYD
	tu8q8NTBNqA/TCWECcA8vfMqpTeELqGkLwdpPn9PuJsZR9RgIgAhGKwDrpEOo/OgKOSjfth+8A0
	21eNf6rirXeJKacsQpFSOYQwQSez7JV4yH0iwpcon/OzH+Z+1NZagiqYQk+bfwphv+m0/dEoX2K
	ynkke+3uH/PLpsZrk8whiXYDnLHofcz0I5BvuWuH9vlgy0oG8K9sgpf6V4z9e/2XFYdMOqdcDQD
	T+Isn+xdkskXbOjjeactGmGjMyDqzNI0H0rCareO6AWUtY6Ydgdq8qUnQ5wDioZj92iYcaW5b/x
	3XxXfme6aCKT5iPCou+p6aK+bVAggzNCxQFs=
X-Received: by 2002:a17:903:1a45:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d707a9fecbmr260214095ad.7.1787826331001;
        Thu, 27 Aug 2026 03:25:31 -0700 (PDT)
X-Received: by 2002:a17:903:1a45:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d707a9fecbmr260213295ad.7.1787826330516;
        Thu, 27 Aug 2026 03:25:30 -0700 (PDT)
Received: from [10.217.219.186] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f73esm15212855ad.39.2026.08.27.03.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 03:25:29 -0700 (PDT)
Message-ID: <67d915ab-9206-4a93-9eb5-f8577e321252@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 15:55:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: busses: i2c-qcom-geni: Use resume and get pm runtime
 interface
To: Alex Tran <alex.tran@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q1NcHWOXiN3dyKkqRSBSxNfSnpeuzmas
X-Proofpoint-ORIG-GUID: q1NcHWOXiN3dyKkqRSBSxNfSnpeuzmas
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a90109c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yE5FkoPsXTdA6R0Zz_kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4NiBTYWx0ZWRfX/Nx/ed4Zpj5a
 W1V7zpO4LayEDVuTs+Kt4qKhlILccxnGfmL4wqhtSZnfpmq0N+la37XcehVOXD+Qm17gDT6gTzO
 966uCfT26jnuf9mZ3CZmqrDMt9z7aGF2ZKTHKhuHsZ0tEMrQ3yllrw4InIAQSIwLx9CqI0H7I2W
 BO7yiIeKGwbFLv+zUqmKizpZdFPe4ULomQ0ge08MfeWFLUfSZatCPfRS4eKzkj0ZkI3q94TtX+Q
 CDNcRvs7aB4UghgBKQg/KAECks3wDPusOYBPFL54LaYm1syeFRkf5B/5CeLEHMjj8MK4tGsDfnD
 /P4O8PJ0OOLhjfh/HNtbRO58ZTTh5JOOsxEBLSlCz1gGn4RUi7VcdL3ZEpKNHiOmxCFFTzMh3Lj
 hO9hTQGUlWh+FJLYQ/YL2MSzKF3SSOYalHU6mz2YETZEzXYDEPSdqrYfT1Pshr84Ay+tiWHRkAL
 wp0nxPzCzThkbzg5yPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4NiBTYWx0ZWRfXyqWXgSmkT0pK
 eZNWtf7xZSUK0brPdZXlqqHrx40oc5xh7Bwp5qVAibp1mvIbD8Sle4S6lxPsBcE3tOhthm1b756
 aiXTqQShDDbw754D5KQLyTJzVf2SXQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270086



On 8/26/2026 10:49 PM, Alex Tran wrote:
> Utilize the provided pm_runtime_resume_and_get api
> to increase the usage count and call the rpm resume
> callback. Upon failure, the function takes care of
> calling pm_runtime_put_noidle. Remove the explicit
> call to put no idle.
> 

No functional change added.

> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>



