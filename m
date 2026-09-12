Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C630568E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227411; cv=none; b=MWPPzUGdEhzqWikv2QeSgjnluC7myMousIauLNjWwm+0HsYb+FmSLDiySn+V07drEiOTo9xJddKXjXwzGV5HgliRYcirLYJTjCNwpkNijK6p5YZXcLgeuyG5WWlgRdxImJ+Ctq5e4sTJ74wAu7RDenuE13Q3OgWFmXwzQpWdl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227411; c=relaxed/simple;
	bh=5+z/T0zRXn+xjmvFdyxFVa20FKeIoctl8Vsxn2GO1HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPYdUnvdM20SeKND0504Rj65U7QC61ngah3ORsBSNdKFqAwB/gzyFw0n7YrpYrH2La6/V7lqcw6bugVFgEqhetJ2+R9v5FO5r+fm2UOj0bTHOCRFgVHyKTwurG2rHtjOGiloznjJ/C3+esOc4F1tGCaCu3QSXipj+VBMLTDvDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqoeC8fQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNvcL+lt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqoeC8fQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNvcL+lt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdS6u3301965
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rH/IEqmAkYrTTbJdUOTSduna
	mr9PJLC1X6Zur1mXdvE=; b=aqoeC8fQ5sLvEjnvTf/4WxXyIevy8YYchE6UbkfX
	OkahyrjwKK3m9da7K7t/Cw2DUWOD8weyrXrXsX1Ej2f9nxtzMZ0HAy/xrvk0cY9A
	fk9SvJPOtPVx5zEhOroEyIEdWEdgRVGJqG9B/CZ88D/6p/UXYYdF1xWBA9f69WSk
	agOpHf+s9mQf3qnluXgAAtZEZskmh27QWrWuUU97S7EpSLyBOva0DDWVBQltB6ml
	mBy+Tdxv8OcrJ8w1uoJeQLLrz0FuJ1SgUCWc0KiOdqUaxxoi1QXf5UQeskSR1yJJ
	+KbJTVc/x3ZhP8gEC1ni+3jEFtO/G2/okkmz9AS9EoLlrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d19bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:36:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso79201185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227409; x=1789832209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH/IEqmAkYrTTbJdUOTSdunamr9PJLC1X6Zur1mXdvE=;
        b=ZNvcL+ltesOmjoRzaQC9KHXYENO8OSt3bjsV6OzLbhhhnu098rb09oQR5CPqGpavm3
         DazbcM4yP0GRp5ylUqxvbPwJY6Og5VMiDUad/zFrnNom0Ln4U+dLtfTsarN4JwXdeGLL
         JvInoo6OzQSaYzoZZf6Q6SkNmz0do+uR+4mnJL54cwFSHNWtFJXBDqjcD0uaqNzcCY5+
         0K85RiIWpc2aE83pmwYGDusnk+Mrh5ypXyQ70SKrczzFaPpb7DmWidtS+qxKFl++d7iR
         l+efX+qadEQ6pvJU3TDU3RbVcdrOG+gStgLUfasYtcHiJjiz/PJyTVe4yPv91ZE7Wr3R
         2ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227409; x=1789832209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH/IEqmAkYrTTbJdUOTSdunamr9PJLC1X6Zur1mXdvE=;
        b=XspKDnCYtR3Ed3i4IMJp2CHk7xy/73/CO45fwPdz5qqBcOQFpWyEDGYs+48mxJ5/VW
         sH4VVv+Yb4x4hGL0pETDyz32gvsL8esZq2kikEZSGpzotiEp9gW366T80YsDQb6DBSJI
         mrXrPXdWixIdA89p9twI11IStvQ5qtMWAqEhsV3DOi7XrRpqSUjAg60Bx5w0+mB0fJFB
         /mQm3eCLdaBFGTogMHXhZYm4HwYN7sjPIVI8KkkB+oGQtPDCMg31vYPFyEPCmAl1sFBh
         ZmiNLDVk+wSjsZ+U6xquUaIPa/epTkV8yb8R+tZD8ty0kphJq8yRvSlm0GPCYFL9HEwy
         keeA==
X-Forwarded-Encrypted: i=1; AKwUvBxkrxJJWr1je0lsm8H+nu2diBSaZni6EDnz7cFsmGadwZ4zVALAJxzWQY6DD0e0IIkY/2VY8z2vQXk59dw=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ6CvGG+skAwUCddwz9tLvURGtZ2Bd4TGb+JvoHzxvorr6VEmS
	mUrx2lJd5WlQgRRdV52787HuL/rrbW+Rc38+67EzQjYeeWm3RjnXDNCZN8CWqPNrUAUP4xBr4Ap
	T/qjwE8RMzY5nAXf5GMrLqqGaxLQMQuNGMZNgco1Kg7ugSKvBLoSASWMJjDIEWLDmdiM=
X-Gm-Gg: AYBFou1qd8UDKWXEV3HxkMLvcM+bdJt+WzV+GQBAjgIHzm78Pft2znuBrkjbzwVD6JE
	H97E811MYDu8TYxQdjinZOPLkjQlpzaKm8esq0oULue9A6ns0Hj83ko/vUk/hpeLZkH7KuU/LAW
	axBjJjdE7A90E49s8p/6+BIUCT9cs7UO3sRvtpKzCDU8xssX5ftVVQr3RPmgIHZkPLM9bwXhnuh
	+8y7F0snovn5kie6elILlBkALk+yYz0G2Qs8CxlDwWcWMYc8K7P7TIcsWliiBiddhAuIM5w+w93
	CEQ8Mw6FQ2F21pAH8vaFt1g27JnHhdrLmR3hOjx1ue4MZx9mKidlMg6JMykEGUT6Ys0iev1k8qn
	VwHpAaq0CU/NTZ6I=
X-Received: by 2002:a05:620a:1723:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a02eb398dmr392716785a.35.1789227408748;
        Sat, 12 Sep 2026 08:36:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a02eb398dmr392712685a.35.1789227408211;
        Sat, 12 Sep 2026 08:36:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm271583555e9.7.2026.09.12.08.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:36:47 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:36:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Message-ID: <tf5vpawigetrbqzhbnnosta2spfsuynfbngdxvvkh2tkdrpsup@bbh7sv52rc46>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfXy9gtI957R4yJ
 vanhdja1anPWul/+DEnKWtJ2XGgTD/ZovqSQisRYbv1qYu02nPDSqVJYNioNhD3HrN2sRvwZL6x
 hL2eh/ifHlih30KtGp76ts73lRRDDi8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX8igJFN0AOHgX
 POjHhSC+tFMVFUR+x2nh6rB+8wK0scPXHNpEWTLT2FLOPIEGLSO1493YY7+ebCQKijqiqyAkPsf
 f3pM098aevpi4qLdTjbwFOVi/hS5gEbCBxeFh7IKfBxyC0QIOfeJL3hwMA5qDtYJAgRL9cZpf4B
 BFQ5gE2l00+uWStyKzMvi0WykImlxWu0Bq71YJVw0NqQZxArYHI/8h8ztIVhisDq4EVrYP4XMTH
 z4/y/bX5W/1WMtACp5RbZqUVlJLkj0fbKY/X/4lfbpoZZFspZJFsYDC8ExKXH5qzMtXK4chB/rY
 wuGPU2LuMuiDv9GUSZUNcxRxOJU3ynCvXHdaBCTMJCi0hWlc2Wvizu28rVNNPBi9jiWcTgkL7d6
 ZNu8goY0NXvcj3lSyyMZRsC9oKis9J3CptOG6fSXxLYjbAuS4Mi6IuV5tsIsXiaWOkLWlguRYuF
 AtSttzIZCWJVhM3CEZQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa57191 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RXrNB5dDG2c-zWUEkKQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HK6W6dv3LiYsX86CGoUK4394nMZRIWYO
X-Proofpoint-GUID: HK6W6dv3LiYsX86CGoUK4394nMZRIWYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120226

On 26-09-11 22:10:42, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
> for them.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
