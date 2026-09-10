Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA20F31E831
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022815; cv=none; b=flDO2MMKcDj3WgEKD7wst4TSnGUm9atXRZk5kaJE1zgwFVl9cXkHkZ91ZLxU79EE1aiKX5kNZda6wbqWlwe1OL6oRAeZpVpjQNUahOjJ1pOYBg5pyuNRF23SAPBfpgmZ0km9nSIZe2/jqdwudTGHz7ktMaTDNjdNo3jSWM71HYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022815; c=relaxed/simple;
	bh=ss1rHh64uIjuyYcs9EexckevxsdC3EsWu9JrzTfWz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIlQrLzD4UUwfslo4vu3e24eJZVXwit+QjfWR728MJx7fqTzB9lyn8k2Q4VY5DsfpV4Ah7GSNwnkfQRZOrdL9L7Kx2t95lcRbcxeuedhwDrniwijTAUj3v6mC2thL7FcTyxoPk7kJKXrP39Byc5/hJMNlhBkboV1KBNTYLfyHAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHPun7Og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4ax5egJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHPun7Og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4ax5egJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GxCS4142736
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OtlYq/p9g/l09HGFRWH07O7/
	FCUFDmortwofpkkwn8g=; b=EHPun7OgTpKkjm7XCc9fqZFI35/d1VhTL/UrZABy
	J//NaE2LfK9ir7wtviM2sbxE2Sj3QmSdrk818QhCtXB+omj4aFUtqMr1yDdAeNMU
	17zHwRGR4WG3HLl3etSi4FioXZKF0XM6PKkrbMz2n1zfiTEYB7gtL4UCpQl8VprA
	lghXZuLkYCnAiPHSzutXEcgc1QXEcNre5MW8bdQpWYqjATYiePvFIu5cxnWPdnXO
	GAZzSQYLt/jDnOccVQjHLWlzDh18s+cTf3Vb/zxGE0oqJvZzuImA29HSunv4diTR
	uidPFnY+lbaLhOggssE0qz3kyU9N8yYJ1U10um3XPhrLHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2efa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:46:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4937461a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022811; x=1789627611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtlYq/p9g/l09HGFRWH07O7/FCUFDmortwofpkkwn8g=;
        b=B4ax5egJbjEBnuV7H58U8ZU9stpVLTmKNMoh2GhZnGnZYNqLPeQqUbToYqy8tG+Q4a
         OVyL0zJduDSexdqcqOMv8F3YzNlq+tYWJL0VLills3EWgZ+3GJS4Twt2Z7NU70IHq0BX
         g7fmGDOVlrUakSyOKEEdRqpaxNWDXhssukvBl8brbHK/EervIeslbHoeG3E+4bBJwlpu
         emW0Ejjb9/2b+/jDyLojlcipBRt/6fDPvW5sPBOtiM+VT/k/hdu3b04LH13kcrvg2lrI
         yYgUkGLmhckAwTY102jO+LfSuWo3r65nE/1GVKDfAWyq4zanvTSdFlJTvWdeedIBmotA
         roaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022811; x=1789627611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtlYq/p9g/l09HGFRWH07O7/FCUFDmortwofpkkwn8g=;
        b=CpRZOFAumfBYkdkZ1rkQypOPD7WzMMWQlexpiH4MdIsl3cjY8RWfJ1fwYw7sZxsJUd
         o/2AY+wW2hVTWTyxbT+tiJ3WoVexgar6sKZQFC38F1YpkV/60zkYhJ2ihG6IuF0QoqPC
         3c//Bdib13N9Z5zhuXUI+KIWPefRf7reiXcAU5AEueuIU8U++cMmdY/ILfP321f7u0BV
         n4RWYxAxmpseEgw1Rt6SYvm05zzAQq2MJful6kjV3qfDFW75U9P00a1IjjHTbQxbr/ac
         yxPXoZs/8SqgETHgA4kwY/lNKO/ahLjcAF6tmkBoi1aeOpMnZKGCnRx8GbQJAKkbVyM7
         mlww==
X-Forwarded-Encrypted: i=1; AKwUvBy7G8u1VlmjbT3VebSaFydcL+Jwht0SlGF89la89UbrfGjI9l08aDfCZVshVtN+nTuoH0W93Le69nPVDXU=@vger.kernel.org
X-Gm-Message-State: AFuF++mCIqWhNO8h4xyZqiujPKnzcJ3KUCz18Ko0NXTZ1RxuMadjvpns
	8vNgUKSbtbH8ithfFS7ASXRL8IMBjcvoOXpbNmAghoMfPprcZtAYqtWVn/EnpmtHL9DRChbBqyh
	2Y42+rNwSLoFhwAbNwwMwyq2jg44h5tK2SBBF2nTjsr4zq0y7aHqaEGy7UNwXWCoT+pA=
X-Gm-Gg: AYBFou3cfKDmX4U4YS4ki+vZJ+tqXzH+KYtz969qK2M9Vbx0AsOOwi5Y+SQWd+0+PBg
	1ZA0/pCa654K0+SALCzUEJNiNMd5/9PG76qCbcb40kIE7IrWWBi1Ql/nuLAHG7LHqdi+T7Fkzic
	L/E21Hh7EnlzdxNIZBrkhKMFDG/7WrAJfwxYPqaJi/iKxGYi+PW2u48dvf8gFjos7EpL0ceHwpd
	6p95ZklHTq24kEMoNf6/FKH/xvP/mH23r3Gac1+7fSIqZEJHho6PkQhxxvQ3cVUEUmtIHHcpvH7
	NzDx5M9/uzE2YJ+cgyQmMcYw0H0pe6EcZq0hhO0mGT8EwiZWJ4LPlpjj9Nee/iCFE3yeszfXJXV
	8LL+U02OlpVdbGGoKIxUd4+ct0ZHkokj/A1yKugla/1c=
X-Received: by 2002:a05:6a20:914a:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3dacbf56563mr8135475637.25.1789022811478;
        Wed, 09 Sep 2026 23:46:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3dacbf56563mr8135436637.25.1789022811020;
        Wed, 09 Sep 2026 23:46:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm77169144eec.16.2026.09.09.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:46:50 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:46:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Message-ID: <aqJSU8y-ZAQjnRJf@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-GUID: o_sIh2_ZQqpKbX5qvb1a40Cno0Pr6epa
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2525c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: o_sIh2_ZQqpKbX5qvb1a40Cno0Pr6epa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX5wz1hTILnq3a
 ivtOnlzJaWNsD2w8+OGhrgDalYsBj5iSnUNC6+2+2JgWpmyaLgEGOxHcVX5eTzjrENXhdxhHqZC
 +1/4hY8qR5gOu2R3wfnQ3UiM44OIDJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX4VV/GQgeClVX
 CbchBBQaIKya6dmilZKfG3LI0JohNUCwaHxcTFFtIP7aOLbmLlpWl0WL2NRkyDT5CaPH0mvmp1Y
 BnIauMzLf6guaekyRPrdXEwsOJMAwYdB8II0if5RlM1sudnXBJl40QvZ+T2kF2ATi3xIB8+cGgi
 bSLpV8h/i9qh1YVyOHXWS3G1fWVJqG7PzCTHHUN7JoDC/EvjFS7iSJ0T2+cMWnhjUxH0I8Jrcj2
 1IF5HfeGlQhbrVAiBAaYuvG3pcZKQfEVeC/A5JBYY1QFsz8zUgHlnnYoRg0gqEYC5HF4ww8vt/6
 5JLqWXE08dYMgAwVYt4JYba+luFsutBZjdHees4cpQcYE3ZVTfKwKmkJEZF4jB54B1BVP1p5b0u
 8RUbDwsfOXpTpeA0CgayQxLEsgcfnpRsaqhIth7AAKkLZlLQ3PuLvyLDMKYhyhB/PkZHAhlylz7
 G3rMlKaoSMl4FrODAFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:17PM +0530, Krishna Chaitanya Chundru wrote:
> Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
> controller binding.
> 
> The Nord PCIe controller is compatible with the SA8775P PCIe
> controller implementation and reuses the same binding definition.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
