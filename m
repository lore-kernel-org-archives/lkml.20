Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B68364950
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979794; cv=none; b=u9++A+Iqmun3U5bKpd9T3uhm5zfnTFC52DmyR2u5zj/CC17FYceY4jz4OAIPAy9TrdRlqjVqyC05QUXwt6uYPqD+S7XtM222hNnKs/EHsigUF1lmkqqww7HTV8j1iY1jrinbcC6T6hG1P/9tqihKP1f4OMHs2Tj1eWmOXycaYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979794; c=relaxed/simple;
	bh=j7AomWY1thDMvf7jR4qY04R02EHtj/ZGDJ+4eUXR6c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNQtgUf8CH1LisWrC5F6qzsTCEzhEvRYYnMDvu09tmeD53BPsQ80YOZ+lKwRoeAI6hC9WhJtzCgVhk3YuJbVoNBlpNXJjWL5Jq2mXPJVlFPwG7iTnoxWeGabeSrQgxWNyGMDYqNciOxD4IrK7b9puT++vsTc+mNbXOYqMZeQehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5TadpFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeGfAszL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5TadpFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeGfAszL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgXvd1608270
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2hhKwHh4L/fYX52LOdqYTcz
	ulimqc3bkV7EnEkdcCc=; b=G5TadpFjgRMBag1VZK9dlVXajPoJaiYkYimCE2Rs
	tC4eLNklRdIMutzTIwqtSLx1y3sbB3MNBwb5gqGBlu7Gt0NxC6m2ttg4cx33FkwG
	mR/qUJXoGeNnZtyhdIY3CwmpvUe47iOUF9xi/WxWtlVD5Esx6Q5Nnee5CqxBnLzL
	AV5MUQVLnF5LXr7EvO4G304Nge2LaJME18Ccd3mdu3OgzVCywUnfBPgt+FCFrulq
	wCBRTK1VZBCSWRRyU0hP+lIL6q18REZ6C+wjInrzKQF1NEf0VGqhHDdfPDVDc631
	s1RnHt8NmPdC4uupkMsUisxj9Kbt/T3eO8iCNK8TdmMDQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg01d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:49:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91051512080so62681746d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979787; x=1789584587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2hhKwHh4L/fYX52LOdqYTczulimqc3bkV7EnEkdcCc=;
        b=DeGfAszLeGnDm0P9Hdbl0sAJNAJMuMZemZWmRpX48ryBIIn37wfN0qvu4u+JGGomxC
         H8QF6dH2/ejOwknKzJAFjQ2H7frQ8qnG7mn48M3zisK1cQUTMzJNR1VxElErHUU2bl0P
         6a04s07CA2Z2GgJc9qrk+oi9fbcKbQweTXvuUbi5Ra4miPExigWqrG6BoePA7ISFT+us
         ui7zOjccrvBDR3XHGzEYb9bfWL86ETx7pG5mJVtWLCf28OFNH0CAeVJRQ9ZtD3JA8pmi
         FN3Bz7RBEx15rCWB1fD8T2PbuG24LNPgFfLeqVO8gFyxRPVN71aepmZKUHmClEhc3JFL
         YPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979787; x=1789584587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2hhKwHh4L/fYX52LOdqYTczulimqc3bkV7EnEkdcCc=;
        b=UyWR346v744R8XIz2UgKOWNlQgTsgCj2BumZMliIA7qQ9vkPtPYDE4sDVH3gHXm9Wc
         kUpiB1uQSOoTqVDx0th+4rpc2RRGYQNKQcHAnbIiZIwZLhLNlGjhPcXXNOo146PEwm8f
         a2ZSwm75fY6V7pCHjsBw7BTnXAA3n9Aghxyx3FFB+rE2QSrppqUL4NYguZCks6cBSkja
         HwAQTZdVO3cZEg2RiFeTyXN9Ya7oG4Ha6gBG3CKmGC4PsuLcVjItuuats+bv9/sQO6dP
         v2TsNDHbD8r9Xj0DulcRuapmuhg3MZh9rwRZLlIH25EBw2nvm3sRTi4HeKTpSF2fS+4P
         lJPA==
X-Forwarded-Encrypted: i=1; AKwUvBxO7vyEdjbO5Bolz4SJHVY1PY2Ubz3ddtTtk+hd7QVd9uQsLZcpSn/MMj9xiXer5fe64/X2/aJ9feeR4Xc=@vger.kernel.org
X-Gm-Message-State: AFuF++kvwDepUQCa6iKRs9oigNkNsVEABwJXiOcm76ck2VICjx8zqcEf
	hJXNWR1XazckNQK99j16rBvWnwO0yN6SKTLVsgyRXEvfpc097XikN+Q6q5uiffCpSE3w1q2UUE+
	K2AsK904iFKgHhL3IMRWkMHtil/d5NfUgqy+zo8BFHAtTqc/KC4PdIqDXU+bJ12tK2Ds=
X-Gm-Gg: AYBFou03nN/qo4FhGTAKOj5fz8ZgPb1eCnde89N3LInjhdLcIpjI0w5d8shXiSpfPQY
	ScuIGqahTlIexcurwQZyATGUmrqHi1Vn+rjO3dm2pubGRFQ/MmH/jdBPCjDVWyKQKHn+1720yYt
	1115zjiqaEqepjGN0LhEjgEq8VlXC12y5UWtZZxgZalhgVoW5wxxCl+hLdBRoamsqDD3cr59a0t
	CF+vX/1XXb5go+vBOtFkYzi18uCAKqKlJOx2RLgjjk1G574umGPvEix3osmrQ4mUPUgNdHPMJ5/
	RheYXlzko6GLlIqLbOFXZcrHYcM9596ZabectS9XT2+AW56p+Ed88BV7mHLQVTghhko/oQ2c3rQ
	FdRfamnn01GvF/k0/J0WmAbNxhi3fudHzXOrzxAUtjSiU3uZxnnOBynnZ8hjfwbh+qpNoX8OXa9
	hAeG2x5wQ2YIBP
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr16558658137.6.1788979299756;
        Wed, 09 Sep 2026 11:41:39 -0700 (PDT)
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr16558625137.6.1788979299306;
        Wed, 09 Sep 2026 11:41:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37059b0c3sm48907741fa.30.2026.09.09.11.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:41:38 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:41:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] interconnect: qcom: msm8996: Configure auxiliary
 Venus QoS port
Message-ID: <tmngp4764jqdprnvtg5nwtvhvtpptlswje35zthugs6mx6qpsk@cmgudihs3zjt>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa1aa50
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=FHrIvcMS070A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YMW5T1WhuyZJOF4bxVQA:9 a=CjuIK1q_8ugA:10
 a=PkAOt9_mmfBkvtOLxIEI:22 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nZOCmmNHFroeiDLz-Sf-uSBAiYLkwuug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX6swz2by26u3A
 NxUfz5M5nRF5WNqqJL/tI/uKqio287d7oKoHBQnFxg1A3vNd5RhQEIYjFZsy31i/6aAa9uWq1z0
 YM6vDj3EoMz45OzRgsdFYA9nhpKIeuhR9cdD655He/8oc1/P+FQSS79AjG9zBbez8vv6sL8nHOk
 r52TMlaErcFGGty9FL1iqP5FUnqCmiNbkwuXP+QtRj1LrRO+rTjVB0esaD3NX5JExLP+5VMcxaj
 J7Knr5byrmB6MBCDMadGdT7ll90wePpVPGpaH/R7cD/8CPRR6w1FSppFx/KcCDxFDB6VMhk/yqC
 LTk8hHzQ7+VDS2Z4Y++J1WGPBPp7YSgBXVIKEceM7Y8Fjunbx/f5HUFCLXkLrxSyV7qFqRlDYAR
 4Gv/1Wg5BJ6+SrL8/VIwLh184OCab7LQ3wJ9yq7VSM4P+ILc97GAp5xCJtAWoXp7fderGVuKY82
 tqQnF3h3sF1XguaEIxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX+yCAEKDuUEpz
 VEQVOQ1g4wYU0Xvzr5gAGXXzWRFXvZRQL3Ny4s+a7W8L9pnE9+Rms3Jnsbrbf9juQWdwb1yLWnY
 MzvRRPWb6tniaW04QfgpEDoFbU1V/AQ=
X-Proofpoint-ORIG-GUID: nZOCmmNHFroeiDLz-Sf-uSBAiYLkwuug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090210

On Wed, Sep 09, 2026 at 06:41:58PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8996 Venus node.
> 
> Assisted-by: LLM
> Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/msm8996.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
