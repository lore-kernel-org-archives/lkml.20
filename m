Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5740BCD2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274113; cv=none; b=pocyBFPQHc7cqlnQj7CqIsMUTsOriJMwWJ/CimLgocJ3l2ofHZt94MxyKPCJEN9sbuaP77n8itLhxH7czRgswYcAnaFIirdHaKxk0MGxDay5wWp8NfRMiwr0KtyPLYWfV2LI3h+e+eprfWep31t1nIaT/Mp/9V2XexcvpcumLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274113; c=relaxed/simple;
	bh=LP0uWxHLg2fsBUx+Nhxz5x4jEzYpXsVi398yoS5Be9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK8M2kHXJRH9VTQUCfNd0p/f8y1IZ3Lb+xVUUxEQV9vvy7vxnW5yJKXJoHKQXDgXRJ0wPa5zDkdO9Zp9kr2hAnbMYkznA0w26h1fgLbl5YiHEMKmRqJ3mv/Dmoerm3lA/USOG51oTRa3kEv9VJIwc1L2a0gT/qRUSbiUWWT32ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmhWIFuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2iFRi5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmhWIFuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2iFRi5q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8cqa3913699
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKlzrW5fENrSL+csftyJo750
	ANxO2VC1yaUCUp8pTAY=; b=MmhWIFuMCX93Lrfk4+dD6ikWr6fFT4whLHqEA4+r
	Sh6S6uBV+G/1XoJo7LoU9es4P80RrRLNPxeJ0AaZQhVCNWNmwIPTg6d6lL5s45xI
	fqBDc4K7H/HfNlE28Ho7GhpMbh0xD3MN1tEYjn4hAg0yO1163ZBUmoVZQk99QOU2
	KpHFHJOWhenRAZ/R8oPn6172CgA8+P2F3Nu5sqYdEjrGKD0+yjh5Nl8Uyfrm6sGs
	7KaVH1pJw3JOw2fIcD3DMuvRVo03uU36FuDEgfZrToGKiUBCwfoP5tnYnucRincf
	v9cccw+w4ngu2YKnSm62TWXmArnvgsWlh6px7yF4PP1xpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu266d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:48:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso206875585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274109; x=1788878909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=i2iFRi5qy+YQuHnlNbzvlXmsfz8P+spL+CS6DRu5K6RPBEiqLHNav4MWoH/W9y37M1
         q+UPaZxBvm6CCMecY8jHie4JBeQG7e/1O/8XwSpIkVjBO4lt7OmVUZBlioFXWpHtIwmO
         WEEu9EXBALRX0AjcY2Sbnt+VWJec4mBSMRLnf1oDf3UqzKEPRCgKMjfOn5BE2MSa1KEn
         AzpE95AmfdvThFXvPp8QoeSD9lnMyUKqA1S+6w7PrZURLfNcPYXzT4/VMcIc9bwKWdrN
         lexkWGeLznqczr++h11TbaMCAH1g8Bs4DTB5fuKZMyd3LYwiuPZIA5P19FL+qyfK+ote
         XxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274109; x=1788878909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=qblFcRVXXL+7g/HYPe/yLXclosAzQCj2bSwNzGPRufTznMWgYem/ZwhhG8yAYdGzWS
         khpsXSWopcu+x8yvyfu6tSIJvC4m2xF7Fxk2e+aL0vnWewz/SyCKb5yNT635Y3kHrylK
         bXaUbaODnfBOtcPQJjEbNHsOYpMH92ZkmMMBkMTHThVDtCGVVBtYfO8YPpZ/BCo5z476
         l0deJdU/d3NVAZIg/X4BKpiP+hauLkWjMFnnnWwDqdPn2LADR03buIccXH1ngsSyMuD2
         fRPnIoG4uQv29EhO4rmQeabBFcc+jyBWcVTeVWny9ZXTUgRGsbMxhYHghBGxHXt18RtS
         60kw==
X-Forwarded-Encrypted: i=1; AHgh+RpO0/Y7Acf29MUXHeoQAyJVtituZUB25DUPcW0vm/fnyoChzKmv+dQmtBPyB2UAyOl9diJyRVshl7ll/R0=@vger.kernel.org
X-Gm-Message-State: AFuF++nteZu11joeSESzHTEDAVPul7al6GSqP0rJzCtAN+32vCuq+JM3
	heFHd5Lo/an6A5TTzeiwxTwAS7YlZ2edjm4xJhi0Jur4EOapkjIBfhW08otF60evOA2eWm1WMLj
	E5TkC1G6xdjLkP8rpSdQgNhxAi7SFF8ew5Qzwz5LoDnHlwhHKhmbYhyxSmFlPwAMHOHhZse9qWx
	Y=
X-Gm-Gg: AR+sD11OP6qiTt76MEncCmxjxtuyaiS3hcR31dnDWNVC2899Pg4bbvg2Uq6bWlzwVPQ
	HtPMQ9fkqaSnsD8kWJItxLRKv/aHJ+CtvrSK2sAX3MDME7OQtI+ust/o0BF+0KKwAeo0tzknyaB
	73hp8bXSqCp4Qhzax2LvbUXiiUk8RuToZqiRswdYSjYtcD5t7+lrm7ucY/bNtvTdUhebMwhZY/o
	ao8Ven24pRuKpcAnrSais+YHk0TrrXenXu+bxiVhTGdozThZq3CwBGNuuukmQHERwYlqjHM0YH/
	CdS25lJaZ8fB+0ogL12UEwkvcKK4t/BkSaWikUsqxtBnpXPzgnad1yy7sTmxTYndOqnBMmShibJ
	Jbk+UBtCoNPgFYeQ=
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237794085a.40.1788274108660;
        Tue, 01 Sep 2026 07:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237757285a.40.1788274106763;
        Tue, 01 Sep 2026 07:48:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e9cfsm5661978f8f.22.2026.09.01.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:48:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:48:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Message-ID: <bw5js2yqngqpy6i6rli6ufaaiz65bqbpcaiyfnaur3miuiaq3v@4qjmukimdbn4>
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfXz4OGbIYp701Y
 ZznzxlWvuo+RMOQBFK4ywthTTLjnJInGZMqiLM18Gsdo0i90iywkKot7aeGLrMeiss4HCQ6Wrmh
 MBCjEpxfbU+U9FUZZoNnzoMoCmL2K0RXPtIPuf9e9Yii+T6d4efCFadhckH1/mEhphH46H80WRG
 kvSPWCB2No3ZoxZEptapK7lB+1mGALs7VOqpqjejV+6k3W+ZBQDUOS7zyxMSU+snJRL3JP2sZqp
 2UM0nWjTqyR0mG+amjXBBnzq74og56daQKVPRQgNNc0Kiae1k42nmVcfrjnplAVVf1lQoGjl9WY
 tziNuSOUBiYSqSSJ/IMPHjZXzIxc6Z0JgJa5JlnS+PgplQ4aXCB59hYvBCTdfqm5nVcWKPQq5OP
 nf4/C421IdVzQ8HCms/aJgZru+ZRI63iQ49DrAbJWwFr1d+iIWtS853OB9lQ4y2hTHYXScb+qje
 qM9JhpvTr14sRYJ738w==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96e5bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX5e1OW6fu9sbz
 DdjRKOZf1FCIj07cH7hxzAAzKqA1eFy3FOyk30n/leUfZks2Ok14u78awSlWIovJVR0rRMLK6us
 gRL7MYZWAkxiu91eQfaqDMJC8LxF3Gs=
X-Proofpoint-ORIG-GUID: EPXps1DjrHKxJxfCKSnRK5yKVaWLTeSB
X-Proofpoint-GUID: EPXps1DjrHKxJxfCKSnRK5yKVaWLTeSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

On 26-09-01 11:06:13, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
