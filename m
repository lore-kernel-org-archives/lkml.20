Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED41D7E5C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778070; cv=none; b=iK2yYvJRvi1BgBojZw7uW10tspo9jLQHbXyisOeGBg56CvapkaR7aDBrqWdyhXCORt5gyjyZ9+OD+pbVxxNb4tHQvPzjwk6B9Jz9AY4S5iQMdHeGjOUb4h4CgV8SbIEGr38e1pT32GigYqMDP4oUQ7O3ozBuyV/xJbkhJA5Fubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778070; c=relaxed/simple;
	bh=kxOGenXPw3URL2xlgr4jZoeQRO0yAxVjeXat1sksctY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0d0e6xWtaZlW6mvYQu7+rxK2xLcgrvPdvOFAhFqrkZb7tb9y49FGseaMkumPD3pVKCOxcQBrMmSGpp6tXaRT5V+4tFDz1Kx+mEe2zSHe3AN7xAcgrci55XG1C7vgsf9A617qgLDutHgW+MS+6p5wEm8QNRYeTSJTWTNTOdxBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjisU+Ho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtzsMoqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjisU+Ho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtzsMoqX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bo5O3702598
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B7U44csnCa6ooBL9+cpkicrs
	W8Nc69C46BWsRVMo5fI=; b=BjisU+HooTVbKoGyUXpTZ1N6+Q/VYaYK/1fnrwLK
	gwXJ1LG7Q4m3cBMj3SM6a6tlPqK+pKqPOjUB8sjXPLj1xzw/28+wty6cNxQAepnO
	zkXRmuucNsvTVTHjL2LAYtH9j4DhThXcFf2h9nsrOSPCKRNcvfIBBWznY/Smt7UW
	9sOyPuCmKUIucTi8dMJWfybDcUTQK4h8d0b6KpR2IbInvAE+ulV3reW6KHIR1L/S
	fNLOtnMjfX1QJDmN+DGUoAklHb1WekWP+x2Hup162nWimzx3N+rqbYXNLOCM7eVr
	vLb5PplkXqR+yYURhHYOUxUAvcvF+rRLU4CTJMvYL2+GhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hegj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:47:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so324045285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778067; x=1789382867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7U44csnCa6ooBL9+cpkicrsW8Nc69C46BWsRVMo5fI=;
        b=BtzsMoqXdLutmEvLn692UJFZxuRDoQ86BNooERLR5XztYm8UbAvCrHObOv4+Zrt9wo
         M+WH4dYOjY5ZQK8CnNiMJXCE/oK+n8h+TxkiDnjcxDHU/jgcEFfiAn9KuB8pDHwNphni
         VckROWJaSC/dzXJFPspMjWnKHbAlIwLlvrEhd68+EyaU/vHCSTUPcaLxFg5asyUl5k2Q
         f/n5lErLh1KIuqy573ebhncFMWCgk8EbjRgA2TdzfDcPIxuVqDqlIOC/ScpxTs3oQmNs
         0f1fRjg6kuFtwHPQp7ouILkJmTMIGKfunnSapDDzMVRyStU3erPkBLOHWU8g5fHJ3e6j
         4dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778067; x=1789382867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7U44csnCa6ooBL9+cpkicrsW8Nc69C46BWsRVMo5fI=;
        b=oCY+gqnU7dNzoPzPY9GX7t5j4qYVqX8ljd2WlkO7O2MR1sWMMh8C0TVnEFz4tFIAzg
         ctlbPYDtoyIP95kEwDPyN+7pAe++m6VUm9thQDI/5Rc1m6faKIT6M/nVaAT6o945pzWg
         KdslyltymBi4qT86IMVIqILbcBKUbmmXZFctDtziv8nxa+nvEfrVnHMXV6Y4JnOEoB21
         htV3PzxwSylnr0foxhYs1fe/6jZikDN4GJdR/J8NIJH4kkXkV0LnOLLIL2Q/Zxmq8O+p
         IzVW4YDe3wbuGFRRL9vS/frOaDXG3MHsbZRpyJyQyv/iGdofv07XWoWr1I0AkRfVoQz1
         JF8w==
X-Forwarded-Encrypted: i=1; AKwUvBwno7mEOsaG3HR26DjigqNA/5kokI3wzcgwehZShwN7gCAtT9OEa+6G+WA0pMb5oP7BW3wJZt/03Ok4OoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nfiSlWqaRSbl4ZzbNT/AEMdr+dpDs7IR/n7V8aH1PR+jCagGNU
	oQMML1dCd/8oPumICAGEygpJ2/55XjTLGQIr/Du559FtzR9u+jQWqo6wa8lwG5mr/Rv3pFEb6rX
	PDLmaEW8wtgcXGwowh0UynHPOhCotMaGYkeJZcxv0LfARlXQ2rE+dBjObmPXZKgBfY9I=
X-Gm-Gg: AYBFou0JTRYDY/qh1DZo8VZBkU9uK5Mxfys1EGPHVdwSa3L1fCoe5JKuyJOrLnuS60H
	88pqG+sGHQy98nMTmqqJleCiAr+byAHeG+yUlVX4RRFRF/2EQbc/urN6+1J4hrJHOP9LhNXN6+q
	3hA0OJNzr2pzGoNo/MNr/uSXyM1RQSdsCdG7+P6Mv/r/IPXYHXLvembza8VmANUpfvPQWnFgARa
	cNseyOwSCpUNaJKdn/F0WOoGmZY2xTK+zCwWQeyxsNDW84jsiLFvE1uBkHiGMLSykr8OSCZKRP8
	FmYmJcZUwh0tYH4F4B2l849atj3c1XZlgCqpcpzveB0KCOQXZxhv96eFTpTVoT1tb85iHgx8+oh
	KXb1zPEzwurnk
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2327918085a.7.1788778066854;
        Mon, 07 Sep 2026 03:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2327912185a.7.1788778066188;
        Mon, 07 Sep 2026 03:47:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm445511305e9.13.2026.09.07.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:45 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor
 on CSIPHY4
Message-ID: <zli56nevwvyjf4etbdz7nsb7nwgzx6z47rv3qbd3lug5ner6lk@4yvccskfjctf>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e9653 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U6dZUNP4vHUEOJ_ekwcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Z6Qshr1qpD_tYbfNAqwEh3klixgcx-G3
X-Proofpoint-ORIG-GUID: Z6Qshr1qpD_tYbfNAqwEh3klixgcx-G3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX//gigCKRj5pC
 JaTUqpLmoRN7wPu7IMN0ti/0/BeO4ebLDdksAj7zicfqc6dYqdHbivdZQxSx98bJFxFgwT2K6kp
 vmUeJHir1cA/moKpFx+N38G7Me+kjLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfXwkmW2ZNKAmF5
 7jBn1RsxWuvsfLfeCaSxh19pLZvW5a6TW7hHU4BjE2x4I/6fy6Jx1U71WzESlHKz/QBpyhBj7FV
 tlHIOMJPGLZpew8BOKzL/RBdrvgKCsuL2KGWCfaU8jA+FcfO7yhQeZUERSx1jZYQLNi3yRoap8F
 FpKp4em5WhaGC+LOIuZlrdUfFRQcNkp0sZ0Eb8E91/KvDsNhMIRHA1nZpEQ7oAtncDKM7JP3PXq
 VC9kvkGHetHKSE209enlZwvg/LzDx/9XtKHabQak9ohMRY8ZHQU/4FKqW8pXI+kmPLHleZbhvHq
 umEnGPkWr3oYNUuRIhkxodtAW7j2GfRIWCdHEmapvH4mRUn6Hws8LnVXhOMqWPqPsXjXrZtCLlT
 UEwzLjalppeevAw1xTTpvN1Km7O4XQZOJhbXRSvLErDtIvYIzElBM2ortyeuRX7GYRbVaP+aOoe
 l0ahkl763YrrKXujpUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117

On 26-09-07 15:37:48, Nihal Kumar Gupta wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
> CSIPHY4 in four-lane mode.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
