Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC8306775
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041042; cv=none; b=kUgUbgidBEN1iK4grULgf5kO4HqK1dzkHt4mpVdX6UhUVg2D+231JB8BnYWtcwhjH9PqWZxJVACY/UNhPFvDFKiZ5oY14m50urGzv/1JlabOPfnnX+9deYzIneIm1Z9wQ2DKwYddMiTCHXnI0+3QzbOe8jCpSutUDCqoNJ23g94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041042; c=relaxed/simple;
	bh=sssIOgXcZE2/24fknlxXJ3s5eJ/OoslnpIdFTEo50tI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nik5+Cszud9xPjd3bGoip56x09QHV+Ea6B+axT2s2psQzxy2jSU0o9TKgaUTmTSlvwrGNIijDpQ/tg1m1JNznRYrYoXkMjZajz6YaePOgYJWQfwuvp01l8UkzdFF5SBwra0CfYJMfTQix7O2ae1oNbmkCU+jVThvAcryIiM/b4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfLGB4yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTby6h4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfLGB4yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTby6h4T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENQ1kd584290
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=; b=jfLGB4yKrVfnzO9N
	8uAqBkNe/EAfG0ufL9LX5rnszgjbNd+r6/5itF9HELLaBJK3PPrN8x1/YEHMy0Os
	s67f/JAOwAu7P83+ARCGL5sih93mIWkEWGs9TvJqRgYNTrpj1vH+J34+ovfOeMaf
	CgM9bhfbqatfCJLke/ON5uy75E2YX/JVAC4LikbwE6DPCNxQdPIdrjwIjSHwv5IO
	GrOnVMRbxPoCNny3W1mkELYun02QEhv8Mk+JbL8Nxg05zoumW7OLuMg8/IiWIMn4
	xK/1emLDGNeNLfQd9nKxuWTKx1alP2Fu4/1vhvHY77PJkoumtkSrinesEHxB/orN
	He8Fcw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdes170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:10:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89b52a188c1so474800b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041039; x=1792645839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=;
        b=LTby6h4TLT6IAmx/Ae+efqx2Snz2AXhsM5jkXT5O1gvUz3WHsUn7zSsa8EnPzmaWf5
         WSC454L4ioSKgKdczedIXU/V8r105lX6VMGWrZQUEHRT9DbRD7d3IxqDtONLFdelK/ib
         7Fnny7H/B2v+R/SaLa1W90Au3chcFtLtSpJwzJYiYdSbXsD8Qi5nJ2gO/K2Cbqq0QAqc
         PBDsSXvoo936o5lqprti9y7FcMJrFbrSEj7xeUkIu3TmbDfOkl+Q5Sq7LKja9DQY76M7
         xw6O1R04C1VfGGkVzcUJkKlWnEMF0nFBkcTZcz7f1VKrdLpbyye9f9PLNjk3WX8kh+KL
         RJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041039; x=1792645839;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=;
        b=KsAKrR0utBbl01pGeHHeBJwli6mLLTMcvY4rBBYtOZwkV1GFbCRkaO+CIftirDQ/fS
         ZKvV9hpcxqMAUTQ/YJElWhYXS4yoIa/NwJG/5M+1s/73SPuqye6/rCxMH66O/eRCEAaA
         eN9G2Gv8/cEGLd7q6XNqHm1xKicDbjGRlucq2Ptmf5ZSFhn/2WbI9STiG7MJo60aqVKI
         NYIWiegtKBJtE1199S1wyLOOkZJ1SMa/RhCDyzs4A8sNbrgqjpq4c0q8oJwNiCgHCvBt
         pahKHvUF9yIy83gCNCSbEaEj67h1O17C30lNMjMN0cm5vlSLeTZU/92TXarn03DwXntt
         JfeA==
X-Forwarded-Encrypted: i=1; AKwUvBx9pklCDS3aSuMuv7GVgz1AYEApvp9zXIFHaggmLTHnwKcxeAaUpm9XyejuPLLcxBoNiBPSvYkYZ+EFm/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/RB4Z0m2OJp07LE0YLMB8kW5UhNkZ1AbZyM9d1dvSYT3Jxfi3
	pY9D51r3DwaQYGbf0K1hfOtXezL7j4deQImltMjFghf2F7jSAu6LAXhq4qR5iSAzcKRbIddo6m0
	0z3J/JlHy2IFMyQZ++pQTOlfA3xrsx/lc3Usmxb6D5xUaIOEW3brAIzfHsYgO5ma1VpU=
X-Gm-Gg: AYBFou1twPxZ7AygFt+IQhqhgvubAHfO9BDdHMFBKrqeWiMb7CTnWW+EWpPn8+vMOCQ
	YmWDen9z+vsP/I1mijd2XqF6MuIwW8oCLnrNWYk0a8vsNad9GCLe7ac/VQWTfU5Tw7CB6gk0FGd
	bz7mueSnQ6l/RzVD2xPVNkkGRu2BUnQFxNgIl0RFNV1IXM9nxxI1OcCFo+lzRfWWIMyxHTs52Jm
	HssBMqsvVJcUu1IJZ8BixDFRdx5gpNxEftIGraj3MbIG/qlA4ZsyZUqd0l3pBlIeViOU7SgijhO
	0pt3JlgYXcuQLNQenNgdbols+RxDYmDxdbH/qtU9QKIllYd0YciXdTVijrr40I40jhLsGnuC0W4
	QYOwoviqs7oeRMWt0UQCaY6ZCiao=
X-Received: by 2002:a05:6a00:811:b0:883:54dc:7892 with SMTP id d2e1a72fcca58-897c86a3c91mr16386197b3a.52.1792041038784;
        Wed, 14 Oct 2026 22:10:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:811:b0:883:54dc:7892 with SMTP id d2e1a72fcca58-897c86a3c91mr16386162b3a.52.1792041038316;
        Wed, 14 Oct 2026 22:10:38 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80508d5dsm1800223b3a.50.2026.10.14.22.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:10:38 -0700 (PDT)
Message-ID: <df8d5a9a-b1c1-4346-bac4-c2c028678d91@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:40:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
 <20261014-fast-swinging-dormouse-26b5bf@quoll>
Content-Language: en-US
In-Reply-To: <20261014-fast-swinging-dormouse-26b5bf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0604f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=m9Dd15Dd7eNj5BCxSOQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: VtinH5a2_VC9N_YX0VF-9aPOerJ0raEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX7/pIPqibbh3+
 GEKwxGP0aH2FbOGPUU2nzasHoT+zkA5JjWSRKa95MAR2o+FUkVUKDU7BL+ZY5J03qhDSHi2nKUv
 5mSv+/qEU9J95JhFp8a2lE6MmTcHq2/e6GMzyifhHa/IB3ixk8IGqP3ktHkWlAUqVcd9bDR2M3V
 tTJCwjymS6tTGAHUQOrbe6/TcO9MHNl3vjmXLumkDoNYxdPKze3ShE4ZNSikUwObKFmgum+FHfb
 jHg0uEXoFwp/owMngUxWi2TN0pVJ7W4ywmCCTA1uyZuEkW/iIjAb/M+gIPXVvDilUbUFm4wtlwQ
 RnW6t9tRHrNmevU+tpFNbab4IevVu2QC4cYZRvv6kjPDgGUlHoez/MFlS8O4YbzXbUtKJ8Z9TpI
 4DYmxsDxJ4/8QUe/N5fvzhmJ9RVfwIc4zxT0V0g0fKeKOJ0u1Id6wwwuMtv+LIbC4zVOhOxwvgL
 XeAAFkMm75Jzwoo2HXw==
X-Proofpoint-GUID: VtinH5a2_VC9N_YX0VF-9aPOerJ0raEi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXzHEZtKU9jD23
 yCGb27QPFqBTdSKOznDu/FOT38DRfSYGUiGGrnw2Re20VbE1dmitaMB4FfsPJBv3gjbT7uPRphu
 YuWUshruaNWZwU89HUH/bKYaenhcYPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150020



On 14-10-2026 16:48, Krzysztof Kozlowski wrote:
> ... so here is the missing file from next patch, so just squash these
> two.
> 
> Don't add new device piece by piece.
Our earlier plan was to send Hawi and Maili as separate series.
However, since Maili uses Hawi as a direct fallback, we combined
both in the same series.

Sure, I will squash the patches. 
In a single series, it does not make sense to add the device piece by piece.

-- 
Regards,
Nihal Kumar Gupta

