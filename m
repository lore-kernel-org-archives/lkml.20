Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2E3B3C0A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687894; cv=none; b=M+QJV2wvsICLjjmuEEc/r4Q0Bo4OOGNWjHS9rctLfa13zTAu/NBT5g0noDvWDTTxqySyDqjpzs9CWe5HdOzxgSoNvlvnppdNoRoFkdrHTT+7lifp+grmOt7xeOC2kQQ7wfqUfRQ/EDA8fRVzwkxX1U3qaMFRzlRa1GbtveAHCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687894; c=relaxed/simple;
	bh=zxlynqi9fA8FlivDnTAJLSnkFbzFLM6PTRJzA0vvrQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smB+ZEy9cx6yR5tyqPNrTobTIl0SG97AwJIQ5VWd0XGDJFxUK1/qaWaD4q1F6VoHXo9pB1fp00xgoCovggvlMHVDkQMOvN8lVaPN/LtrKLbJhKiEbU1vbpxExj9/jn9Xk0reFs+UESWEsiba11j/wwTPYFll+taVtjHRbA1E3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMil+mGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBId9aGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMil+mGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBId9aGv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqnhM4151558
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iPBVhcUH178RCfdDLu69SKN
	FsRS6mvhRrQFeu8efrw=; b=KMil+mGseY6xEm7eHWWv6S2XW+SZ5ztlbecdyUKU
	UaOCljx9hInVasq+uOM/H+7U0aXW484crJWmizv8LtQFXd27Qt8JLJuB4wdE5bLW
	Kh1irypBIOpRPddBIkFN8JdUap/kv3c25e/B9cScsM/6ofUt9W9vE+fzWi8NejFF
	rIBex24AlKsDV8prLcUQp6i24ItSc7pewZjRA8WXagr4W43rFnYo248m6boV5/dZ
	ppFmD68bqcga/3icp9430da7AkO9DKvXGdyFWiSgx1iZ7PpDLimil3hpqPqqB3VC
	b/+qDSO2rlXnfoLZvgH4wsVs1RpO0iq3sa9g87B/0kQ8dQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc7ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988a73af58eso119164241.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687891; x=1791292691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=HBId9aGvdBby5KTP/ewuNd86FmgOar/L1DERs/n8QLqI5VrRxqoxbsHcfbEAX2ZBh1
         HY2fPiyPle/m7CLWBAqT/qJWbjF/f5KTEXGuYdO3XY6lGtSXPX1gl/M4gdQHNtPN2kuy
         9pA0ovRsZEf+q8YVy4h7ow+o2WWOJMgH1vuzf2o/VOo2BOrjNKNie2OGJbW6wc6jrm3Z
         oc0h53ROKizp4bkfd8ZhqBYzCr5Nyn+q3DM4+7e3Sp7kOLNcSyzcRRX4VH3oumAZl5FW
         7IUQsb4/vECjIvOOXkW8MRYS38YSoJs4E1p7Lh5ybNSJ0KkBIi0Tqh2LEZLBsh1DXVAh
         0AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687891; x=1791292691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=E5/epMRPlSCdXoLiyZ9WwToD2/Moc77pGeQCHELBMuvR1LL4HJxje9ekpPDR1HNnFh
         3UaAKnueRTJ4hha1lvqsDF7BpW4vCt3+7tvtUKKVTZY1pTEvk3KTnw87Ws9SPHZ6bRgH
         n9UDONDnYlNou9Ae5lw1VuMqi2sU7fD0seEncXkvn98fdGoL/Tu5lda4YwyBBtToFI6K
         R/8HR6SfuaUEKYS6EDaVDOKMQWESQmfreUQ/wHPGAFNcsETacxMFCFua5b0vu/pbr71N
         ffzBFsFkp4K0lCokqRON5WGsD72pYvHNFR9xlrGRGF51od4CF2RYiMxs0jFh6stCdroT
         AEsw==
X-Forwarded-Encrypted: i=1; AKwUvBww4xcCn7p55cbKL6lWgVPQLc9SYVGRLm1/JtOUkRl3vTltYTglvQyEYZVGFhCxDI18tGBgwT/QGYYJ3jU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdQNBL+PPKSOoOXc/RTJmYy9x0Lj4B35L718xcE6sptD773ZhR
	o1pDjZWdWi0+Ndw03je6H07KDGVK6iW6Gd8bewKfX6yARJvJXsxpYTTWVlb3k3AzoE4KSGzqKaZ
	mBH+l3JpLY965P99VjL038qw7c3/tlqj6yAimrFqzLcbr9dyfkEvROmFeRqjjpuj64R8=
X-Gm-Gg: AYBFou0cZxagkEnVh7ztTy3hejXDi3Z0IsgU2njvCq0VawfoMWV7ce+7OM5R85Iaixo
	YZhpzjHrQstILwC8JHstrk1SHvIJWXQJqPEybLnPzEVXk/wwzdxRmPPWYKvclPckZ7KKbIcebU3
	YkCegf1QUdbHujN6MGpD6VJFJPRuQ+Wn1/plXkNYFYRPbZyz3DVNCYIUefZdZ5dbB1iXTQPT/DX
	hXIuv4ILHTEsPv1A0YMosrMWbBkSOxKc4Y4l1EhguhoCCD9jTv3zufuyTPZHokAxIvUvvjvYTig
	rYg5GB68SPj424OMSbmqsQSLOb3BDnqpL5LtLhgeRzP6Z+OZ9V83ZaRFV3dph+ATZUd11D/2DqE
	SXyST3/tT/PmHHTs=
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849922137.17.1790687890892;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849905137.17.1790687890247;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm77089755e9.15.2026.09.29.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Message-ID: <xttngc5acpc4bj626ekvbjcdwswnh4wjp6yiej6kbwxz7cdcv2@cj7gxywhskep>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KisdH5fVHiyzFx6DMXV76s0F-QyoTgTO
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbba94 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXw3zmngvrL1hb
 I3uOMYSfp0qaGzShqtnwCwnPRXJHpmneIcz6sIKGG1D/EpqbICsrxx0FcFU+8GcEMr7vl+6VFES
 m0LRNIhMGp+i2ayob66Eh6uR2jz4Xmm4ftac3K8hKdmcjaIwwhUlNJ/qDr5xmsKancOJ89vSmKh
 oeCtGQXSnrosNb7OoEPGFNrxoWXzeom7R3nmxQu0SK/8xQyFpKHJwE174bAEWyIG9xHrEb5i5hu
 6pp00DYtQ2R8ITi055oWN5miu/KPptyzkUddAaSQt7GelzxZwS6cpF1sYADgufgzdPUdwihMwKT
 xF0fEt0oi6SQHa3NNvfSB3C7497CTxhLsuZleGjGUl4XIxuI6ji2kKqhccGCXD04+fQ0dJpD2Eb
 aI3DAys1Qg8NVPCMuFDmRoeeT+wd4mFCR+OUMv7oi/3+A2F2iSuS1fmRK/1Vxwz4NJoMtSDn/z3
 9YHoX4w6S7YrtPBLvSw==
X-Proofpoint-GUID: KisdH5fVHiyzFx6DMXV76s0F-QyoTgTO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXz/6aJfERC6gn
 ZXZf6edpLBwCZsYGSg/Yo56bt76fsQY3P50Gc8u9Kq705RXApvqV38SbA3HPRI0DhszYI9+vdef
 pMJG1hvX6E+hV4tZDsqioL4QjcNdGiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:37, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
