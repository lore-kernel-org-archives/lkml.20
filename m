Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D146A5E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247585; cv=none; b=fOFnSrPg38Ki5RdDUpibcc1HLkZ/+RaePXpk9aiNReUTEzFiA+FRJMhXxmuOipdN5llWozwuOkTmpTuSwciAnEVnmI1/+95HB95SoxiaUhbVeYcJ0sgaP7rcaXjEaGjPumEeCH6v5hGG3OWvBmdiiIEVwz3T+rLOyeuw93g6m8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247585; c=relaxed/simple;
	bh=a9DqKCNA1iCgEPyNHVkOQxKyQBg5z3GBAmuX+hxQkzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2i3T6fDjWF/2IUYP4WJO6jPadnJBip8xlJLW2Off78At6BOaL6dln91doImQS1iiXSi9Fy2RWy4YTkVYyLrQQLBa0a5tsQXUyDbswcP1l7ciCMldlVhpaBfxgSKbhDRF+APcz1wt60SKO7MR+RS3FllGBnko1m4ZNTlUi6nk2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VafbF0JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFhLdaLJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VafbF0JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFhLdaLJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Hnt1975448
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SyyheYKwgD9MhO5a2LPElNl4
	00Uc8fYDajgPwssWuJM=; b=VafbF0JHOkDOl/27cWqAPQXLmE4AUGMUOd2FDfcE
	pKgjxUgztdRZ2b0tdxdMhpR6YodxzFp1DC5Mgg8DlvprceFRmJXJQEPsGAQtkPeH
	VuND4z4UaHzL4xcjvYaqMHI5B8lclep1ZM5AwwoTw4JTMNeLiS7RdHIq+Nxr1S4D
	utI1BrpRPEkqt9+9xnn9G3cYhPIxSYwvsoDb3ezrEzW9wOvA7CwfwyI15jgMc80Y
	Qbjz9puQl29/rszA2gRoTccazThevOngjFoZXqG/XBjfyDogfHAcC1u40KF0yXlF
	xv7eXn8Md8Vpvfa2KbwklPQbehguo/SJzOcgKj5ss5MBJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r118j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:26:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so121528385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247583; x=1788852383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=VFhLdaLJQ3Fy+RhxRx0vRruKw5Xau7ZDHv5WAsuwW7vcy1lgq87zC4yZqXs6O/Ys0Q
         uHUEUD3x/CMfdwgXwomV6BXihQ83ESky+mQN/JyAS1ClaM5lNNnHyWV9dbvyqmCFBxin
         ALn36l1Ee0Kk/es75iMksNLLaM3SS9/JzX0kVubRHWcv2LIp+oL9PIuIDQB2pwnkLSGU
         KDMl5ShbaoDi+RE5n1zR1Cngd95qaYEw44y3+P5sJMG8TFK7WQoRLerTwaTW9OC0hw7Y
         MCHnULuv+zHYBkbI8lNywDZWjTvyZVbUuUy2osnEErI1jBLep5gsrvZZQ/XKE0BmqXR7
         s2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247583; x=1788852383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=ONspJUmkdiWhNwsh6z+PKSXATwCF+ugtylJuPIkpm/kgIrJ/2XKbBOMiaI2IQNnK7e
         ru2zWLp8pljhKXjS0duMyjwSc7woljUVrlLRI8upvD/67+9aWYtOyb3PSX6w6duCxzdC
         xZTVRwCW+t7rtbWgtzV3xzNzu0aXPiErxxGRfPdRvWDdYgHFrqapMCdkte4+M7etOiwH
         wwewoC5rID1u1nFWp1eN0z6EMSe7w+HmOMdHkYz/NZFCoOb4m7l66kabntfWNKhrR7jl
         c8DfyrTcI7l+2W2qP/ZE4Urv3QRn9ZZo/YrALU/bNf9Yw35wNzfU+cXGe82KetWRCGZI
         63Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpEp0IZfvD/b7W5cxUMvSdbsNYq73YSStqQBbEDmYcwfMff2ziGqFgT83wT1zph4KBTOLjmXeTBPY1ovYU=@vger.kernel.org
X-Gm-Message-State: AFuF++l3ECOUyPEErU1FSA3iYJ71HrgOJqjkI6krLWN+Z0a/HVsq8P40
	vTyJUo9ZHvebQ07WZyvPEyeYQtXTXvpG6vThqiA5AFSRGu09/Lx6gE2WF9bHMzZsocLec2VfU7r
	zRfKJPstwy8NP2LbL2YP2OyiErBKBMIchSnBaaHWYJU6h93uymEFMn47GLkV/exhgmcI=
X-Gm-Gg: AR+sD105tswES6AutM0bOXQNHGaOd/mM488v4qNGGnFhVjY8pXTsaDBSQivTLij2HWx
	R/oyDrtXdGTbchnpWXNkZ816YlxswYtbgvE+kAc+/FQc8L4PDqkVO72vdyukZJFBiegb2dn/Tai
	16M+zuSTfdVuxTPk8iz9p5CvrsWs9wlevWtnj+4ecju1Gg0VYBIiCCKUhjEWjNxYkCeMZgw/PQX
	VLdes+5D+EaeXds5M51i1d2XCy/9cbNCV4mV4nnAbstg1vGg3qn4PYi/LZo5NSQmP4A4weU9QWi
	iFlu7ikxZTzK7t2dxcIk3FZwdjEyQAE99VqYoBbfq4g7B8ryOZ7YmVi49SpaBpLdTE3uRc7zUhu
	HoKGJUdsyFm6Qgw==
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456672585a.22.1788247582625;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456665885a.22.1788247582113;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm48344405e9.12.2026.09.01.00.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:20 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:26:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Message-ID: <2a3ofethirhgwfppu5y7oralqvcswbsral6ylcgniojetd5bma@puoiewtiavtd>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-3-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a967e1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=FuJlbAGUYoPPbcebnI4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NSBTYWx0ZWRfX+GptOX/uCsJT
 IuCb3bBE7r410E8PUS4zZ3TrHUpGUJxtPjF4Yw5w942jh0mf3UB58WaXj8O31qADKz7XB5+IWZ2
 eZrlWEFYfUrgNzb/VhM1Z9qYAcbY3Gpo/mvyN2LwHV7t5Xlr6c5AGNOkHBqEfG0e+fQHwgK8ntN
 EHGHLtoeLqTokPJn+SVPuj3IiMeTmBBi7EXhMT97ytalGLOZV5tA5lliGnvekK9dD5f+k2K5pea
 tWAi5iaacK6Ihlsxax6JY+2f9ER3v53EUvVtWUaQxBH3TxF3Um3z7xfCso4zTsocnXTAMB+KmXr
 zsH+Bf7nf0CYL5Z1VOlJlHZU2GDVjQVrraPlQqrzCc8ayeAxqeGDGa3/RvfIQjvJlXIqVURgm1o
 M5MoRMX8IFEvVNkB8BmuOsna+GvIkTlw/Ng2QpcWXyj34yChJiMBLU37dkML68dqalcOUQInuoD
 BxrCp5z7W2cganLwPKw==
X-Proofpoint-GUID: vBYGnbLbQKRaHPPQzwkDs-Krc32fcnJh
X-Proofpoint-ORIG-GUID: vBYGnbLbQKRaHPPQzwkDs-Krc32fcnJh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NSBTYWx0ZWRfX28MsZf8ejOi1
 tBojzo7NZ2GOOnSx12OON0G3qYfmVXBmPt7I+LkaUpG6FVnVNac+d9jXpTr/WdUkb0NyLWbsYfe
 ntLsVBDdy6ebGwdl6l09ksWj+x1bvQk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010065

On 26-08-31 20:36:49, Alex Elder wrote:
> The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
> representing TC956x chips, each of which contains a PCIe switch and
> an embedded endpoint that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
