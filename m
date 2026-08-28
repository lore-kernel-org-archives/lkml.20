Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C35359A6F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912407; cv=none; b=qp3YzO6hHEXzpsF7Fm+hSri7v5f128EU3bvCbSS5A/O84JpOtnPbfWC+lvmRPp1pHbaf1ivglNl7W3+u0YQPVVdNSZ93qq5oQco34efRQkwFea5idUX8mx3Xt+N+rr0tmV5vhGijUWIMbDyu6446c9gSaR+oXTWcxnI8neh3ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912407; c=relaxed/simple;
	bh=wPDRpUUt3k6DUZPeI/GR5CvhOp29Nug8zMsDwdUkNrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkY09fABsx8G+AQiPs4Ed3Qrz0Lce54+YaB1TXnDQKXt+7myCO6jQLLtc/15kTvi21Za0wvy4bNloZ2DkpN6uxkLXt7DayW/iWKM1EHzJ0dKXwrU7NxS0owqbdOEQyiN1MusjBd2Xtk2C3U4EMPP5YjZ5LT2D7WjfYvF796QfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vrm8Jkup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeOcl55t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vrm8Jkup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeOcl55t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8Mp42798408
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kv470VlsqiYxTGPBcJP4Hwxx
	vMWmpd3nC/zdQYgYSuw=; b=Vrm8Jkup8UchPJHy2tbgzdGxCB+BI7zn8MlU211S
	6eNjzfSWxkoFqnVBAnr6Q6i50ie09wJddEtR5mTgwGc/PmoqqakDtOAHliQnd8K1
	D5ieEQ7N5dUnjEASTz5LsGS4p9qFf1tILBoVJMnz0wv8YIyJSTSNcOgbmy6ugU7z
	Ue31Dg3c05WU6cFZ3LHMxORUXfSM30hkbSRm8V4VGHC4sy8GakPx9Kkb6eAaFfus
	+7GxbP69yFrcAZbQ3aGtODqTkg9FPs1kgpzTI0U873UbtNMe8PhyXgIAheC9NdzB
	OjrnUqRj13knRneycOyE0Bb2r6OLzHjbm2eHZcn/DdqVRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h0nbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:20:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ff14b1c02so2040981cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912404; x=1788517204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kv470VlsqiYxTGPBcJP4HwxxvMWmpd3nC/zdQYgYSuw=;
        b=NeOcl55toRxIkRSCLmNXyh6SwI66PsEeO9oWj348LrMpkZdiSQu/DwQcZPq8emg+9p
         oDTmGcD8KRo/T44ogbTcRJvgqX1mZZp4SjQdJ8ZWvJzPhkoT5654waHKmJHibsmCwGQ6
         oz7vCbmPnuJ2XOBbzaIVUX/TXnI5lvquUK3wql4UmQDl6+h38iw2ugVJ6fcrIVduUtlY
         XlJ03IY5gDQ4SIziCEV6mDimw0AxbB3t2+h4JJfRAlwtFdCrPXOA5+pzFnOmjUxO+HHL
         reT1uPm5cYzkBukfZUIfOCbFpvJ4V+c87AtroGFThMpJ0/XVK0JLFF8HW01THFzheedD
         YVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912404; x=1788517204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv470VlsqiYxTGPBcJP4HwxxvMWmpd3nC/zdQYgYSuw=;
        b=m5tjBkHQRBafYswlmmfradQ61Sq7ENSiPzgbKhTC0+QO1bpk3pAMz7xtwkjMA5J+Gl
         19yatX2rELd4gYGk5Vwhp1fei/7iUZtrTUOgdD+CQIF5e7//FKJvE20ehgJ5E3kFvTwS
         0Iajh7KZsvQ4NzaOwOooJoyuVjlUJffSjRcwilhHOv70sNbx1KbXfFrHv81V0KPeokH/
         w9/VqYIfPSyu3NFsI9X/D5UQ17Yr98C2JBFp2z51E/A7dNImkFG7ZQY7Bb43VI8ekm9l
         XsHX+tHkb+1MOytNiFd+M8ogTAubo/Kg8Il2RCiiQw+mbWcrp3CBecjZ0PDlwLKzG31L
         CdLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVI3GUmSEVBkUtmaiyKUWwphHN5v29KUG6nWfRBi5bBIJZDTLLmvBkZiExaMuY5zD9vbTQ0Bzjj5NNNP4=@vger.kernel.org
X-Gm-Message-State: AFuF++kqyJ660UOWF6jbBd8auQofIPaMn7bnaIb977U9IMm5Bpwej7Xb
	TI+ceK84W4FYXw+6t+IezWuaIrfvC2iANQuBf+6miuh6ARQPIPIOW0+f4RHybN4njMUOVOMFYlK
	JA6qIszzPYuPYgbbVA/WOi6QCPqEpFYCaCmJEhsFB9Y6WEFWB7xrZDo/WaW0I2P+3Dt0=
X-Gm-Gg: AR+sD13ae1iqo/26+Q3V9f2tbUookBuy30RK7dNjYM6ZfIw3lj5gw6/o127B0u/SGrp
	nj71Kdap+0FU1B17oBUtFBpECTK+8gcP+TYiDBVvCaTbi+PV5bb8JXLaNeFIRd7iLCqtCt3E/2D
	EpccKzbwaS1u91kmoRkjSpq1sfrm17XjEXYsJUYmRnCw8BQfJDFzQ4VyjD8US0B40vgqxIxWfbO
	gOruUbD2Z9GSk3h8kzkUs/CasXqK00n/lzHYHAxZJVr2jYluqbU/mboVWVg6SaiGZZwZXYkUHB6
	Gu4Y+L9MSh9BEkd3RRbVjb3I4pOqIpw9tylNecF6Q9dskE1BO9UtMMEjdilDLkIlZZuN2b4wj7f
	7Z4TXSO9mmHd8
X-Received: by 2002:a05:622a:180c:b0:52d:7b1a:d7e0 with SMTP id d75a77b69052e-52fb962beccmr58823601cf.32.1787912403946;
        Fri, 28 Aug 2026 03:20:03 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:52d:7b1a:d7e0 with SMTP id d75a77b69052e-52fb962beccmr58823041cf.32.1787912403346;
        Fri, 28 Aug 2026 03:20:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm121136015e9.15.2026.08.28.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:20:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:20:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant
 status=okay
Message-ID: <2v5dve7o7a3alf4nj3ls2q2zda32i6ncjd4ykebzenf43failj@ox3fpiaf6aky>
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX5aPfuIpFwt1m
 ZEYHTEg/V3o1I6KzV6rCA4acCCcDrF3D+JXLneYW2jmSMYmOBL2mDEKImaIkgY+mXctKPqETgts
 fMymHiEp0kw4ceBNrnLircIdCl8sASA=
X-Proofpoint-GUID: AdvoXRDwoTrrsuBhNDirONpc9M1YW9bx
X-Proofpoint-ORIG-GUID: AdvoXRDwoTrrsuBhNDirONpc9M1YW9bx
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9160d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZOeRlPTctedjAYETTS4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX93qO9UUCFUes
 Uy2cssiCLN56OMOlZLie7n41ukoAyrTb7vtXwbNxFONn45wl05WRqrKN5VZ+g+xuItU+vZ2xxI/
 AsztBgvP98PvYPitLUNm91pYag9mJrKZNWJWEMSdAfA7rt9V4K0LQEy9MRGoLFhZHukvhIAiZTT
 CZ1A8WMqythfZChJbMNIvTKTOccD0E0OWnPo3VWnSY2yQXV2/fZTwQjJ1qNsGMhyYAk0KCUitbq
 HaxlHJbFZ09qpYk1T6W8v9SYs551iTd8n6oDkKe+U0WkL2qzgYURAZ4R4q450A4sVz6ngCk6uh8
 hqY8rfAjlhP3dkC11llZ6DSg32A4ejDtJZvH0VExXiGa0FgRslNFmNF5YJkIYpulH7rk/9Dp3Z1
 //KXKOe/0eFFbdtU+dYQzb9ytwh/3E/W849a2C2KsaiEu39rlHbW69v15jSaFg1KQFIKvBmB8Mh
 pohDlTBQBbX7hkVfPSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280088

On 26-08-27 23:50:02, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
