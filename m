Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD553D9552
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393861; cv=none; b=sjkwY6DrHgangQOQpiCfl0x0/BK3zjHE/w66h5geY9s62uZqH9W2/S1Cdj09S7FFDMD2A0MFfki+hH1VFqwNu3zvmvWs4BcWdZ4hBs5hZl1Lwid06wD4LepR2bYwVnL54n3e1dPcLERICVQb1b2NJDb6SmBCpjw8nJ8cUhmN3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393861; c=relaxed/simple;
	bh=s4ofHt+NebHY6YiuMsjYW/TQtl7fNWl5044K8306YQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URqi2yoJ6y97EMbmexW42uL1Q8ZSkLg7nKysUN+3li6ndxOzg0KywLpv6tPPWK3UjpsOik4TWS5RHPkv55GoW1HbYXrMTtYzO39pel3UFA4JVVzUnhwcUuSv24zKdXktFKayyi64XERENb3UT3KpKluL1HSLQ5PWOjWMPNT5e10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUdJcWjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLte9SP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUdJcWjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLte9SP9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Z3Q830765
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JUfQUldAY1a70ltfjEMb3F2Q
	DASbbsXbw6W8EjoxwFU=; b=aUdJcWjWT0jzmalZks3QOnJNeE2iDcgYuxOEVnz+
	hze+0Voggi5cuzDSTmNlyb6okQk7r1Bm0JnsGrmO9QAMn9l5bMJ2DMTpG0jhfDWd
	jA75OJ7js9x53qb02ANSxnS6EmKmb7sjuirUw9UE0I9QIx3VDMLNDYofCoPrf1p1
	uCoP5sxFDQguHR9U0Shd2VopZrqp+o74b9wlOtVIAOUPjGspJxSwz2Ou4Fa/GWm+
	kxUWt0Evv/YCKndwCPuuW1qNw5p4wAMx/wjKQPity1/l7ZiKuZb75szK3RdpZ9+1
	6EBpHUS6aNNjGNXOcMW5a7jYBu8RGUZRR/SkaBkauGhuTw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstpys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:50:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79285c98038so2819353137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393857; x=1789998657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=QLte9SP9I2JMkZPGJp1wBedCzZqy7t44BH4q8enr5wOoaK1qej5CIF9xlc4DyjcnYd
         hOT5BvmlC/xX0ePoAnIIoBPHFooNw21owWY6JZh38D9/I+z6+/oKLRkK6v+YHT2BY3aS
         UM1oKt1CKkdIkQJfNdSChag7i7Pdhyw13efIbeNNXAyHCrlSmT4IydPFeBzkHdS8La31
         AG0qsYYdHLh4yh3ka2ZSbryXv/Dk0JAE2bqPl2NWA/OPJJ2JzHxx6vcZ2CpjhdHLwee9
         ziK17afU3o2fsDQDDR1q+PzhFGL6zMRBalWIbTzVbqLnyhbBUHDHOIqjM9csMLcMYx1V
         Mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393857; x=1789998657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=b1MSw19eTf1HOWZz3abWlovlUCDIPw2xuY05EjDcdCpXoTCAk1vXhZc7DRqGpC/fCD
         +DCIkv+jd4lVvLyasIM9YFl4hgQICGBKuGwhS1zC/gWCbEVL6JGKmCfjG7NcnGqtk2sM
         hDan6lZdGJNDcz0on8C7Coxi0tnhkDAhQtsULsvXEvWTU/00qlcImVhBileNBRW3QcnV
         yNjrD12RiP4Ej7UB0ipme3D3rzoEahU42MjrcnO5IF+ogtUCnOoD/sUG7JyFfnqjvB1i
         vOiu1JAhOcjTkq8LJdhzDCNAwQigbFxJ6x4eUDLBlqWF672yixgs1LxdhYmdW+EzM5qh
         2LUw==
X-Forwarded-Encrypted: i=1; AKwUvBx1sbJs1oQPF/B44fXGNMVok5qSjq7qws2dKBwTfmziJyJA6pZzsQOC3mJUZXX3nbTWVYF2YbumFi4Tp/U=@vger.kernel.org
X-Gm-Message-State: AFuF++nec9b+8BegG9/NOtUgMW76X/Plu8/m4FBspRTl1Ivvsta7YxoD
	r/T7NpIEW32NxEuDt3HoDCK7U8HzhrEYUQcRLqSVqoIorYNVmiNRooCvPyBHLhB82fqtKQXN21i
	ax3uAJAxVrTLr5lvXOaLgmtixIo+eXqrkB9LxzuMO0Ocs5bdDKDaZrxawwoZ1T1RallM=
X-Gm-Gg: AYBFou2JthsSfptpW5KqedscuylkzWzkTkVP8Q6CYqrAY6DyUOecxJAo+kFRfpFvIt8
	rI8FUe0lCUD8fIvCg5s7e2D7fPaPV9yMRLK+10DVKNlI1PlLNT8G0y57tp3KiLN+kIwz78gBdAm
	6+l3olhvRhZqm6/wSL4kw6na/jp58zjhOEQ/p6kV/+B6SsIX7K8C6GYKof+ov28dD6Z24GQB/S+
	M51opLncg9eJcERX5ZFEdFXEqUTPfJmmG+jC3rYmr+mO97Q5lFlAGKZ8L9+G1/l/z68iZWc4M/Z
	Hoi9eWAj3JoCjsLrXFkOD+WQiJBgTdg2BugFeDUxbwMPD8FYfOZpyyHRvIWNh5FzwxEMBWK65wP
	OIB1i8T/TtIz+BQE=
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822935137.8.1789393857182;
        Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822843137.8.1789393856630;
        Mon, 14 Sep 2026 06:50:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm341763665e9.10.2026.09.14.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:50:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:50:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Message-ID: <ohy25kfxpbwwvbdfuocibhboyhudyzeyht66blralexwmjcrxt@jlxpxt6mxbmi>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX+z4CJkDVwq01
 HVo200mW6nsvOVk+m9mwBy/ccId80Mqn3s3+ZbB5YI4MGvl8rSNnRuPz8gKAjvmHwoc7ox6FiGp
 oEFxAQSyzohL9rQQHfC95ytBHcNWPykiyr5x9QVfa+1BFW9HGpAeYnTpNu4UMyC7F2q6uxxiLjh
 xl7HVXvaI/wdqFJyNP+UsTyX9fufTVmDnHEgg5HDApSvQPVSwMFpl7aYktMKQStJjXp1M0hgYak
 I76wnSKbxSd0noYpvwJA69UCAEKW0q7IK6vwJ3GPHD5LVA2ylsBKRM9aMj+zg7KwTG1wXKt3HSK
 xGlkcCyOUYvUzG+wWfpxe821DPBnsct6KUaaiTpYpwbX5YUC6IFo1RrfEQPGLnAo9GAVfjSoLkn
 IblRLDTgaq3r8KLWHZSjNyMNSLqYpPLFZzX1qCCYp3qfmtl55UGKiLa+IRhZzvCUwRMsjRII2yq
 DG76CEgozSW8eR0/nfA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7fbc2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: bCkSvGNWuMOP8YW4qF9Vtc2sjWPc0ACc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXxLI59p6DfNp7
 njccWEWaJ5V9GWptvdUmAY/n4vMxM8hSpp+7uwY0+9dhjuH4Sm30ef0CMGPojbKHMA+q2SUnlei
 6iM0jB5Ctc4PUzdtJYysY7ZAhKzGKxA=
X-Proofpoint-ORIG-GUID: bCkSvGNWuMOP8YW4qF9Vtc2sjWPc0ACc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 26-09-14 15:19:44, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
