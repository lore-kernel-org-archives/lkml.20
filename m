Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392026;
	b=fGzCSnQxEpSaSECoTEc69ztz1LLGsguOli9WOGkUYwrjhbDFYz5YwpZuTu2hSbBTNv4l
	 /doNAx3aB2SyY+Kw3Vg/9TALRK+J/FJ4NLhMqz81s4gc4vVKDnk5dkRkp7c1j7iOwJLqY
	 fzi6Tw060UiePpElRSyWjdD7QjLg1qPE8NmMsHmK0yA87WhYCFClxeU5ztd+DIkAqrQTE
	 L8MFgtOFcJI/7qx7yvl0e6J4wEQ5YlmJnChTKlRzjdeuWlQb9ZOsh77tebQoklIALWrF6
	 jVXXZSHTiaEdCHyFjLnGfYUpqdyWG35BT3cDzBhIpAB3RYgtKHAj0D8g7oD29g/6oTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
	b=V92XljjPJxyxfVBozPMRfvQfND+RSMlA4gsHowzd+mbwGiR4I9Nh09c9WeuwSg2+SkjX
	 A9yqhP58xZBVCkr8jPTdbBOrm+glrbLTSEYh7iy4i+qJp24DwWYk5nggDyAELAQZP8AOU
	 Onz01uYKmb1URqgJb9u57eT7dYtx2zp7QzzIJeMnej8iO9UxPx0qV2natXbfP9s0+LjKT
	 u2SVXoiLMpUXZlcMc+Csdn6A3FVef6ziqs2n7pNYlhgUjlc13nok0U7cgQ/YXIhLSTQy8
	 Z0Rw6sQN5toHxHe4SDsXHtFCsrl4iDKoUSGSGTD3THxmTizy2yJi3VFrMc4gvQxuRBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6790E606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6790E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZMuF581865
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5McJnxb83WQY6Kyk4BRcLwQ/
	t8a2Otwl41DlY+4EO5Q=; b=Hx7qaaDrgNyaX1pYAxVX9pZF39S6QKy9m7Q6v7yt
	24I+xxtIM5XoHs0dBHptK1Ir+wxRh3oYHIggv9PTq/A9/odrPASt58sspaYYd8RQ
	tlqxxE6rx/EPDv/meyxv5bqJou2dAN3R62caSMqA3Xp48qRWYdko0vd7/LhGqUeq
	9skyEkcpkzHdKMJ9zNuXortCeomCpHxj+e/9bbI7PxTUY8V2yGLS20iOh4cgCHmx
	Q4LOKAS4es4o90jpYemRpDA4rrFFvaMclm3swKwUhJ/0ufbSShXuLxh5KlgkNJRc
	hvtZ5Hi3UR/OJYIvaE3UCnzIzlczMLST59CgeloZYQml2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7prt8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so555928685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794392024; x=1794996824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=UOpiTRlGeZym+Yl/c1KdTpZpSLEXAyKj/EVyc36g13N9he8c7CltOzE+QlGG8+O3ps
         gDmUWOI4h6D1RSJ4oHC0MdSs2Y4tF7w9f+ZzDc3tYFCHlWYy6L0QD7400ohEOVyUQjbu
         x9ZXbtnfc7Y/KfixdVXUl275vn1ac/qO7ulD8HvawppDw8ff/VbazlzaNwquiZQhBsZP
         NRBloS/CBZbLy2wCch4ZTj8uVcSg3Ez/G+872Eaftj4+ui/x3DEUHIwIAi0SzSHi06zu
         Bn8+oOQBm/GXHrKAJTrWhQaxxAs6Gr2eZwJI66Yx0v+ldKb6XHMZHjiHGcdrAlTs0tPD
         s+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392024; x=1794996824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=X+iryoBMhDSDJzwtn9mIVF5tE3JoEndfIwkWX1anU2UJgMtHhlrcrWYsq/LNo6eVZL
         WJM45fCCTsHTqtoz9qEU/PiTNN5D1rhbmRr1gvt3PyEI2kox60nOrRBJnGRn/nUyvubM
         ga+L3JxNWnN44UGAR5Sa2mFta1JVWgAGJWTcKKeNM3GXCeZMhFasYXUI1kpkcZ6zVHUy
         Nfg22bbD4KF6iXEjz5BLaEWnwAxAyOatl6F0phrsY393mtwFlyPo7sZZzCeZDRpGC0fz
         1IirohI1QCK86liEk5Pd01hI5t5zTFsffgypKcIDBWbnPM4rg6xoKE94Xin1YFnLfYLM
         VipA==
X-Forwarded-Encrypted: i=1; AL+hErHxre5oxsaIVABPryYP+bsGMHN8cnVTMvrJ7PxRrIODtOoDcV5l87sKuoymPMTlUmooieu8WTxJ/5FhwWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PqOPivTbFDMka2O9hyq9dEDElwV/YAEleVTDqJ0jlnhvT+qM0
	0Y2DZ7Mi0Wi8Se8ZGGsTUQka3MB6cqR+I6mUUd4jCj29nKDKuouxkU88H9NgoPZ8lRpzqUveRdR
	PAmcY09cncucryNGrORlyq8GCTMeDkvj5rZu2sIKnwNSZ/CFdU6iVSa1uwTk1ydrqpHc=
X-Gm-Gg: AYBFou3DhmCvRqmMICTNvXJFkqnjU3hBrTN+lfFGRFAOeJcirOLvMwbAemKM7419qP4
	qE+4zfZEEIdSvWycGhkKuHkLld+GAZL4AcX8WdbP5HZRspgwijgZvpMi9NsShr2eMmoz6WAMbXD
	UujqVYIEg5Fv04OD/yN7LcjIhfjsUuo3NVV+u6Wf65/KYMp19hONvuwYyzL9FUulByWlGboov7B
	1eThgdsHz5EllcqgpIbC/Ks+tpmrlY8EPPFPxyw1SXWQqxPiIAjVTLj6oX0VpJJsKjfOBqu4CPd
	oZ4UterQOfGoChx5fn0GKGQVniqoT3nK4SZ63FrKvgJjaL+ij0ovs9ht7B09P16KxQKCjiNhDgi
	Oa9ymu3GTKm4Wa0IcS1E3Cru3ch8oRKs1DdoOAzp9VAro7vEPRvdgKjfe7CBeB5VB
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302492685a.43.1794392024349;
        Wed, 11 Nov 2026 02:13:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302489085a.43.1794392023805;
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm10339577f8f.28.2026.11.11.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Date: Wed, 11 Nov 2026 12:13:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Demeter Barna <me@fromdisposition.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
Message-ID: <m54copzsq6jovs7miluvkwwczxiquq67n5vgddy34vd4otycxw@ezowb2pkeesp>
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX+ou+T4SDefwS
 QETDQfRnsZlm1j3Fxzmrqf983ic/TXJq49FyqVkhaAp3uZZhxaeSrJS5hkrRxa8pcUH0mLjGWrz
 kldd0WLjyJBUZJ8SsKj/8e1twail8MQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfXxnDx4OaNwibb
 n7ZJFiVMTTg6MZ7utMfHAeqvYiUctcPpCBI4TK86pG56tuTzw7W3LjlDn2Wz4NQp7VRI4GwF/rT
 9JpXP5tPtJyp4+ACXyPj5i1dwwmsVSC0wdgzIihKdLsPEC/Jz9147gbUsH/oQ+xHXENEhpueiiJ
 JbBLawYsmduy6xgVzgNzw5XaPax8Fy+6+l7niCNS8D8ULe6WnQo3XZqqWfIqqEdzNCCGfbYZtxp
 MQ5ou7+9sKgFgXJFpM77j9sELHUSin4Hz4xwBX6krMUhU8kWZEeKom0aajDSC9LaNY6596PAfbO
 QyNA1jQMiZ+6NuXDgGTFqSiQUnqS+pPxyuUa8FZ4FphzMJT3Tga/NUoILmt8PzkiskCRe0WpEOH
 7hYNrB3wqRdX5VZPCtBb4eP8zNS+yNvs0ik5GKjgkkp5duwJgSTD6JhyfhZ6ASuOm3bvAkP5luU
 gzEtoT6Wyq+qy2kjSuQ==
X-Proofpoint-GUID: fynWr8pYll-BYSgHruSfBZT37dHEKQy0
X-Proofpoint-ORIG-GUID: fynWr8pYll-BYSgHruSfBZT37dHEKQy0
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af43fd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=z9-AyCJIoEr-Zpo9GLwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110040

On 26-11-09 13:55:30, Demeter Barna wrote:
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
