Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194344F546
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113353; cv=none; b=QO5WqwJhLIiIrm1jV6c17twZAAs8H2dfOi99AyGr5JryDQ7WuDj3YdZWJjdlfhfGbTYKg8iJzO2+dhVU7/0fyYBkuaoLV6P5s0KYnl4s39fFsCcprIgSHenB26J1VQ5fkBUKzOH8o8VEobJ73M0Edwwh7Zo3m+SDsARLi6Uu76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113353; c=relaxed/simple;
	bh=wJKsCd+DULH+slTkurspopCwYo4n15toOWpCG+aVaa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcOvqum22/fWvpNd8TrcCzE5AThBuT/m8yCdcIOgQeRoQJgJ9/FrALfvckLPQxMTGIubndNsoYpyLDZa3Nrx8xZeGxvzWiczs+Eu3USL9EIi+oZuCZdUx1fiu0iugVZq6H4ZcHOWjbS4PVuA38WTTJffP7ITKW/BOMfXFhYmtEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz9RK+7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRACjTVS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz9RK+7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRACjTVS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kk653016909
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tv5gm9TG8CS0iIOKyh/RrkkI
	cny2+h907Gb8OirYh0I=; b=Lz9RK+7pS5h3Kv2nb9CwzdDyZHe6PHvTp7lvgO9P
	eyDZwU8Z+qHGZ3YoPs9feSSp2nbkuhgIz607uQXEpb6E1kMRfRINxERL4p/D23Mh
	3KP12Hl0o3Eg51JEd0mXdRKafTv6d5XfOv3cnrx0x21N63nfxDaQ8jY4VNbHEpfu
	ht/Wt3Zg9UX/Avy9zL/GoLd8jmrFDoqRv5NoEArCD9ZJHIleslBQvYEERiluJo6q
	MLQQ1V2d/l20RbW8Et0LqYTNGBzwBSsYYkgeL+Ad4PttJ4Gm8H2nSX5hN8AU23U/
	ZHRqIIte/3VUh4RCPg6mmNOrQkylTXfuH7Nv70wz5qUWuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx440y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:55:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so115708085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113351; x=1789718151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tv5gm9TG8CS0iIOKyh/RrkkIcny2+h907Gb8OirYh0I=;
        b=JRACjTVScrUzApmo+NZxrbMpC/WIXnMYhKMEEuk4EppyvjmvRTqLSb59u7mw68454G
         XgXuUJy5yR66Zt/wjbfv6Px8gxHEV880CKGI+F17EndtRnid029B5lZqHFibc8GLdnVU
         HhKiq23BMHGGjD5cTx0RHOJ5DDDfb2hpZVrq5fGYOTBMT4AuFKt6ogmwT4kdMjUnWlJp
         Yf7Ib+2k5YlWVFuh6jQGY4/QjvNwxkVYZJtUlDmVqG5dkIyHUpb5JQyUbUGvdjGgiROz
         TpsMmUdLIey/tReo0HDTDNEPDCSfuGr6ZHTtCJX/3yEcaDVFN8kSbjSGkezEQamDp02l
         c0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113351; x=1789718151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tv5gm9TG8CS0iIOKyh/RrkkIcny2+h907Gb8OirYh0I=;
        b=iOYcrUSyrF7ieIcso45ti836/XL6P4cQVqKLk1XvTJ5dIXzPCQYQV7KAuV7fLP/zTS
         CPAQ0qPaAabbzIAi5YQHsKYnCtkvPNfwhaARxbqgBy62G+1AyGNRPOoHRmlemKSO3dPc
         b35Ovj6bhMhE4yD1a3wYAQT6ql4jinzPDyswBguLXRbcC7nqk893CKYgCx7Uh4xo4wVE
         pE/mtbzQov5QdDt76mZ5TRMvsc6UtjKmVlnr0zFr+JinSi8BY1qED+VPo+o8yH4AHd2L
         YYyJEB46250FBBDR/jHdpCekkEawGrIKp3PDg+teaVzMELs76ry0hpgfnDKzxriVc7Vu
         K8EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvyQBzv0+l/YWM1y35i5WquzEV8hyXNrsSUoGqtfrNODLnpdwR731Ff9UFyK2FMfN1O6w5p0pQH7tKYjA=@vger.kernel.org
X-Gm-Message-State: AFuF++kQu6bVH1D3M6lqi3lnnTSl9qR0seT7ElaS91AnGX7/2p4WFqT9
	k4G43fTV4pZCwPhStPALrJxFDMYr7IGax2x0cQE31T/doPw2PykLYok9hOzH+0my+YkdcItuQJu
	wj3aBH1CgWlrM3AZIlyVEZgLL1YeCPmaRQynSkzvOrn+Npq6iFcEeLMhdOjzZACONOR8=
X-Gm-Gg: AYBFou1SmMOwvLTyymBRTqNatebygfRBT03Hale9zq/hzERHTxL6bRMttgUKuM55uLA
	pTF75ao2pNupqRB4/37jFN54N+GAVtf91YN2J1+bNL5O42p27eb3O1jMonyhqttie+79ImjmxyK
	Ppews5eOs+k6kjk7MOp7GnLoSLIHN8VsJJx+xCpyA7oLRbklkh2tQ4fsBWoJJQg+tUp0qM2UShh
	BxLCGjoHBCl5kNba/jOXH5PKFKNCkDBWUOc5bwLuvJqvRpNaRgeyFIDo7ydXEEKRpfudBO+QOza
	a9npdVGV1BU6N0Jehl8GPnTP4ziMQ1ai1+Cysyxm3ensCcqgAv0HaMLIae8ZDXMhBX8hvgfJDdG
	H/HJPz9t2NPSMew==
X-Received: by 2002:a05:620a:44c1:b0:936:c026:be61 with SMTP id af79cd13be357-939ea053551mr399416385a.13.1789113350560;
        Fri, 11 Sep 2026 00:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:936:c026:be61 with SMTP id af79cd13be357-939ea053551mr399413585a.13.1789113349986;
        Fri, 11 Sep 2026 00:55:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm3968829f8f.10.2026.09.11.00.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:55:48 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:55:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Message-ID: <24kaa6oq6v22hnngrbyorkvr2nkmjj3pjuevniuopokoportww@nfx333n7zrak>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX13Dxw9ON2loe
 QMegECKLVM/nQJF7sLja3CeRlXV296WYeHlZhTvKCpPeQ3pCg40lFn1fJroZy0NUzqTYMVuOfgu
 QFxra/i8A20criFVzCCKxDvattqt3oBaEufjrvigaYPykLlO/yVkfvN+wpe3PGl2VCXSg0KoNIE
 URYbULwNGnIFaF/ESSEidoyrfMqr9CLmt0zBVMq+teOrKGALpAvCMMMEKvcygir23ZaA7z8O6mv
 YHkxtO55w+oZPj2iDdfBeUYZxgOxvONrxP2DkRZnND+i8OPVm75CXFXielTWHk75t5j/rVbZin4
 ZguqqGkpFI9bPbgHW0zA968bksCX+fKJ6roh5fNMBzOB5nED0oSNz8CctZ2sHVS6zlDNODRgoP3
 2kdthq0/9tyf84bxzebXd0Ds3kZihcCepASAv1Qwfd+LmyKKQ+ks4H5eZoncvw7VzNOlvwLXGFY
 nUY1FiqquA9vZ9Fyaxg==
X-Proofpoint-ORIG-GUID: 0JWZkNHLAJFHYuihHKymuWHNHkW_VXvy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX9XkMI8xQfeXU
 cPBak7rJdbW90cAw8G0f7Kpn0/OX53micUyEInZOOFvHbnI7eu+XjusfNFy9U54fobgEh062gLH
 h9F5zZblFFByOzmDQjUj6cHddG5LW9c=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3b407 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0h-yqrj4mlVLKWl0i98A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0JWZkNHLAJFHYuihHKymuWHNHkW_VXvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110109

On 26-09-11 11:37:19, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Add support for both USB controllers and their respective phys on Shikra.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
