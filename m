Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600693438BE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227261; cv=none; b=XNDm9sG046UnDKpHeWf0bIeikXmhBDVjpKOPRBGfd6slF/o800AazFT/Mf7VUwoz7FtBbvpCRmtQVCT+IxouMWcQmIhi7wYBiOvf0vK5F9Ecf4ES7YKqFIUgrEjOvsk30yJO6GJ61kQQDDha3SKnc7vbECYe/tLIj/rNH5iMte8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227261; c=relaxed/simple;
	bh=939Awi0I5sD7kFw6eI8wCQ4ksZONSoC/Weo7VRzfg6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoxiyBSlowB7ZJ+Q/LxUGwCmlQtd4dCEgowuCl9o5UvT1TBd0ghPHxrzwnrYlDoi9gQSL/T2e7ppDNBVrrSBAp3cDQNV1D89HsPTkJtefnj9r5OQFaILZx/c3HnUB++vmifijPyjNSSNX0mURD4KgGJKPtMM3fvYdSXCRrRUltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgzdTm3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ctjh6MLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgzdTm3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ctjh6MLl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdmsr2073708
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xsuMf3pCjz304bmWIHfYMalK
	zbdxvTJ+J0qnxz1Y9Rs=; b=BgzdTm3qG5cPuWimW6+kDbaqTXX9IDGTKpDl8YeB
	O/3+LtNnX7d90tcKRcPOglilbITsu6/+BW49R6B0iO+O2QeyJVpMcob9O2kkAUOL
	Onqj/nDv6YlND8eR+Cb9PQzdUdEvrpMiAgser2bKnUCwCnaehorCe/sGY13Wattz
	tqd5WN1zzhYmFMIjm2pc+CEd9Zyl2KZmdEkZv9tptVlGXVGQQmoAnxspjeC04T1o
	/UFKYkKR0w/y6G6Vyc67l02ZFycLvxK/dOpnfp9Ud7p5Fsa2A1hirzCMjHvzGpzf
	r00OCY8MDW1pfq5pYKdSrdA0peL63Q1LOCfN1efVtWdRdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh16cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:34:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so277245685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227257; x=1789832057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsuMf3pCjz304bmWIHfYMalKzbdxvTJ+J0qnxz1Y9Rs=;
        b=Ctjh6MLlQEV9BY16Z2BXcwR4oLD+/SYRk8dSEx9tlBxB+0CaJ1ACWw4AM1RAPXFL5i
         XDHHiPcxcpm0P9QAe9aOqvGyyJ8NGFIGEAXKxqaB4T0WbMer68/QMK3apvRgrMAQgj/8
         X94spAAKhPT/RsvGBxSh02C2T/lx0h3qCKjQ6m46ZVUufaF5IcB1xfbGl3qYyHNSn2hz
         eIOhEwsuI6k3cR4O43vJPe36uzKDo8XOSdBArbzT1Vn/Lm6XWSq8QUl7FXGO4/JePrau
         a1+k1PMIslsm2czDcTkgcIpKcHgMzXfDuPSjRGiMTaVJ4HffH5r56W3DSaDGih+IvGT1
         JT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227257; x=1789832057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsuMf3pCjz304bmWIHfYMalKzbdxvTJ+J0qnxz1Y9Rs=;
        b=sN+RvL4EOcOa4QWxRK+vQfegF5tcbdHTE2gAZCQDLrLMFv9LNm2DVOAsKFwGGBKeXL
         r863hlmarF036mBhE2qxWNXRuSoJHPzY+plpYiJDJqjnxYyDgqE+Q+6i3SZBsYP4nKhg
         sDgiKOpdCRIhjhDxKVafT5rPRgIRReBzTH3+ZBwWT33mwmC4RVnxdXDvO8f50L0TG11Q
         xIUV2a5IWQDL3uc1MXg9msx+JI4rhTcJWRmxeRB+W8uzcqbvlqR/+P2iGtnb5fKoeRlp
         6rS6cuYqZHjsY56KRJKPe/aNVRHAj9Tlr2gMAsxaTnjQrxLlxRWmDr2oD+uJNuMKoHuG
         AfpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxEi+xAvu5eiJZSSCfCeTK9WYJkg6nvdIsaRb98zag8LyKJVQ88lwHfb/Pm3F5YnXpclHKGzJH4ebCAJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lzx5JcjmVWKuG9ESIDMfN8FCBzUbXX47TwblcRD2wbicQivsCd
	ivYU5Uz+hOq/1a1Lw/keCVrRke+FCewf1DhapoLsCrVbbDsROR7tOK09OM4OHle7NrOyyLIRGXC
	46WvTrsEoY87SOKBGDy7lnzL17PwhQ5lU8/zy2qCNvwxygIXkIqw0rg+ImNDmBDpTgY0=
X-Gm-Gg: AYBFou2oS4Y28L0sI0hiqkiZgOs8N7J0zUikhiZal4Y8UXO8tAMFvnvRC2RIPAHGn7G
	fsinIHUIToxrN6GtGXRxqLq2qq/ggrdEJ1Pel4ApEwtx24nlVeVSQQRkylMWuSHVoJnozq0znEx
	LwjcFwOJWkduu1U6KkZsLnzN59W9b82yP1mKkDessmTp4CGSSQyxEhKh1eBnE2X4Jq2lF+6pnbI
	CD632mlAsPeZCFxoervDykbvVi+6FJbiVXtEBIVz3UpCzT3U2xZFiRGii0AoOiOIDSQa0MS53n1
	HBPyPVNNgJ6BMYu5B6xFI13AGO+NXt8J84mGWFQXAHI/efLyH3yabipV1+8H/powd4zGmobqXGV
	38ksixbMmO/UmhQ==
X-Received: by 2002:a05:620a:2708:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a035f3281mr484690085a.9.1789227257414;
        Sat, 12 Sep 2026 08:34:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2708:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a035f3281mr484682685a.9.1789227256848;
        Sat, 12 Sep 2026 08:34:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm249562175e9.13.2026.09.12.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:34:15 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:34:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin
 functions
Message-ID: <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: -iKtVTAgMMsNMSTvZbbrhG8AdhLVWNiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX/h5kkrpZ1tCe
 dGt2w8vAGqe5wJsRang7ZOfT/q+YI8GxCRi22QE/+xYFBiBt1mUZiCo1dkWLdGUnErBItOBu3ao
 GIhkyGCmBML/6I9yoK4QV8+y8rxr94Z6B1YpXmJYcx/wv33LHvVmwbOZZPeKuutpayT8kKxXALH
 MN5d5eW7jYu+DtlsdqrBAq939rWHBOWAHf5Fq3/LQlnbMhUC6fv+E0qNR8apGKPXAbhHxYR8UQX
 5Zn9CfVR6TS2tnk3glPXPKaw6CkZ7nXeY+cPaQKrLTFrNv65UhwWVrH2JqNUpedfoN3tRCsAqTY
 RLWXvWJYLxVOi7g2ZoIP3NgVNa6q02Vm7F8lPYXGjVzSqWUSbCdXBDqlVqMsWoKSJ9QG8FZRl8b
 G7vZwWVVFvhrKMoqnJTJtyc92HAe/e3uBhvNVrt8OPLoe5pW7VkZBZeEZpmZbH2pVrjG7QPn8Pv
 MCivkk8WAn0xYEtluIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX7fTOznSc+5JG
 GfoYQmvqPAJrd1DLNHPLhXlBhkuBD1iCViinHXwaLzYDoJC/gaxZYeOopKqZy5PcLgPUIRKOLqv
 ayRcQ5pzcXrrj/nJCKunEVSm6lGWeXQ=
X-Proofpoint-ORIG-GUID: -iKtVTAgMMsNMSTvZbbrhG8AdhLVWNiP
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa570fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uwe_RIfamGnRmHmelDwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120224

On 26-09-11 22:20:36, Shawn Guo wrote:
> The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
> the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
> indistinguishable from the UART ones and ended up muxing the UART lanes.
> i2c9 and i2c10 therefore did not work.
> 
> Now that the TLMM driver names each lane pair separately, select the
> lane 0/1 function for I2C and the lane 2/3 function for UART.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

No fixes tag?

Otherwise, LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
