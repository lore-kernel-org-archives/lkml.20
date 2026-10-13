Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416524A5C28
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928243; cv=none; b=Lo7ris7riXPzJiyMOC4uutsI/kiqdOjISKnXcTo+FSy/E//+lXG9+SPywZDb+cacBr9JvkGKNDcZ2OR4M+IZNSqmc8ob/79zm1IKrTnA0TLHE920mbeYsOKr7uh0rdQLvA2IiDxLJwQ+LUf78xXweNlG8OzcC8yEzx4nFv1QZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928243; c=relaxed/simple;
	bh=UgMV7B6SyaTuXMQ+t9yxiRXnDIwWqWpdaLzbmqJXiRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoPBvPV3Uy71hUx8nAMrPtL/8yZLLBJlvQPZ+qCy7ILvpP+B3vOSQwtmHQ8xZ8kvgGmdog/EeN3RAJ/HaL06wgHDOMiTbWxMA9p8EVpig+KMcsZHuDo3udSL3KtPpReGJ0MnNHaQzECtfHbLwq7/RgpWMCM3FbHaVrdzCTXvSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0JFjXD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2bqbK9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0JFjXD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2bqbK9J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkcar3000877
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n/7XEOYXM7KKJkDW0CQAS/0h
	EHAZRZ621cOKXBSi/ZM=; b=C0JFjXD2HuQOQt/nO02PEbjyrrGsBPrvR/wJypQ1
	DQ0Op1sIByLV5f5100OgloDw1DdylTCSLQgZ3uilHIx+MPOWAql8Dj/issSWwz9H
	1P/b5VEZ3X6Xq5ysPKwrBTOtdFvQo/q+ZHDec5ebOut7vUJaDOF2Q3h+aLqhJTnL
	sI8CsVIvrKv+3XHVtIa5OGslGeAH79kuEs2JXht5ujAyzQY9jWKtgDMXvePBG+ZD
	fnGOwjFS1Yg0UMU4VB8rwMazi0vsJYG2OtsQNrk7fHxFIluiLcXcH/+IpClPlXxU
	yg31j7D+Os+d4i23I1pmATFRcXHwnDisPBAlPWQGbmHCdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberyfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:50:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so779400085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791928240; x=1792533040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n/7XEOYXM7KKJkDW0CQAS/0hEHAZRZ621cOKXBSi/ZM=;
        b=N2bqbK9JtTwWUPbnbQ/FNDrgadMRrA2wQWWtxlO8bLelkl09kpXVWBkfz7Da0QFGUY
         U3spYZ98gdkJwdo9vPmfeVJmr2T5tAl/qZWG2jAHa3/TMoeV2X3ZJYK6cRFeRDGez2xc
         LFT7IDooffpayXOD4/VddmreM8hZIm/3644PMCx20lctL3fNXmPXBgmwVs+pKXiljGCO
         FRH95jXNGhd08Wec4l/EIm8P6U88Nb4OJjH2Cord53pZ8midYqHNQcP4d5VPPE0VX2kv
         oNXX82Kf52LLghuiZ13c8nhGALViJ1Tl0Z0BwrNp7hO9eb0aM0bQyqzdIAlYkiwegKcx
         PCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928240; x=1792533040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/7XEOYXM7KKJkDW0CQAS/0hEHAZRZ621cOKXBSi/ZM=;
        b=NNIQsfq4IcSNmQrt4z0IUw3DW8sn0YAuGUVRcDm1kegFBqjYj2boxIMvLNHoFWu3uS
         9cUqSq3hUXOn7mQjEPleQnX6CGf1J4uSD1ZUMYI2Uu6fWsw2dc+R+lJk7pdhV6WS/bJl
         Vnlz324TmqBUUy7Tgt9Hw7euwIyk81i0c6I+IMjYjxr662akYs8VNXD7iMLXZg/89Z+Y
         cNv3QYQ2g1gBOvKAQ+tsD/qfBWtx81aDZYM5mMoZggNYunwaeEFFpEmJnFocE0ZKIL2T
         rKkb7fD8tdZEeNA781qgjf09Y9s5vs5kcjYNV9/J6nYB5tX9VGyKci7rHj/ZwzGXREcB
         B19A==
X-Forwarded-Encrypted: i=1; AKwUvByIm3Sw9nRkKA9ieiK6XuPvYcQ+ofxEI06KF5R4wAbMn7ZpAyWkYDnSyVk7YNuKyIXsIyxR6p25K29Hnp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsyFZvjP/X0cCCwzweQjW/kbR7XfLpOCuayUNG6igCrfY4jvj0
	rKJRXcRG/9Guqk7hDGmRsGgZPfUE04DvNfFnxK3/m7aqQthhaT0a3u06QK7ScbeDlpXjojdMfe+
	D/+LnTOsyjbdxyqBO4e4PD8N2JmR11ks0rDsCP7CvbObUfyfSeEDxymW90NRo9JH743Y=
X-Gm-Gg: AYBFou2A1GZyzMCF0wWySrtANsIJbDlUfzN65dPslFCmTlSGvyI7NLBWDJiDRqMLSOZ
	Sor+H5eea0clAjhHE73DcF/iuWmTCDbiilIwI6xVe4tj0ajoY5TkJ/Mjaf10d9tMpfEhI1sZ6fM
	VSR1wAFI7cpuLjcThVvZ3EllzaqKxdqJ5DSn0KTEvJhEIG1ndpUe2CIVYSUf1/pKWO9CXXgFTvg
	3GuZjjEv+UTwtCwzNd1FQBkRaIrdbJnG9XGKIVbhrVmKZ2w5Bm+8qUQ7iCDn6icyOgFc74g9FXq
	1MnyemXwMfWty7hGb1PMda9cuyJWOyV4HcZAdvFPjfUm0oMMKvt165k7RPzyHsV8pH1lS5SAFSA
	Gq34ETccsfQmnG5ome6hipKZ/UEdpDVxythAIT4ND2lr3Ncg1ovjFw0Kmmhlg5IGAhJ3bRt4cF6
	lFZPrWzkMHgyoo
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2326185085a.57.1791928239749;
        Tue, 13 Oct 2026 14:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2326182185a.57.1791928239306;
        Tue, 13 Oct 2026 14:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caab0asm37232051fa.18.2026.10.13.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:50:38 -0700 (PDT)
Date: Wed, 14 Oct 2026 00:50:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add
 some sanity
Message-ID: <rriyrrvmyl36pzrgh4z6olspfglrme5fu22ohvozlbvqbbcvqm@vyxcy3ao6rgk>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
X-Proofpoint-ORIG-GUID: 3NjQbaLZjDWoqgj_ZKh8c4oDWSLjCgq-
X-Proofpoint-GUID: 3NjQbaLZjDWoqgj_ZKh8c4oDWSLjCgq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA4NyBTYWx0ZWRfX6yMM/6eKRI0K
 JvxiuaxKgzI+8uOVaRdmJEagMGfuJIMXfM5RMPSfdrtItu9amofHUSJyG6Vij6z6DttciYCGoSe
 cooq9st29fPEJ74eX4bMcYqj/TFBf1k8QvN6d9gN/H7HrKHJHep5kj+Cm4/qedhN+xm0z6RGfvz
 eLtJjQ3P86fxkByszhy7ImS4m3KkHV7jp3Tjkup3M3+L9K1qPauwK274fdBdIIIcG2tvIDv4hbj
 3ppQZyXmqeFacbwj6+jPgveoyaJNG/q8QWHysxu4WOEXg0hI7cUf89slknNESJie9BmDpQrs/bl
 jIpt+hGbjh1QNCvQehi1Z3BOL4933DQAlOFYDbhV/od7N15OagxsbxBcyNQFFe/wz20SpS9pQVa
 EaQeiJZ+hcOjeIVDi9bPPciJ3osMNEriyg3bDv0qyIgAt15qJOlqHK37EX8rv3LDl0HBjyBjo6I
 26siAMNwBPmHnKIPXxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA4NyBTYWx0ZWRfX6M5ZvqcGi9Ob
 piwNBh5+dO5DbHjDHHHLcztKn9VM6QOVRjYlT++WFvbwJQmMF6HF5ZkRcjhmdfz6BQQ4LF1OS57
 Q8R+xvadXe5sbY0qETR7ALKK/OcIBoI=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acea7b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Tc-qSVFKjPaH2g1F6FkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130087

On Fri, Oct 02, 2026 at 12:30:46PM +0200, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.
> 
> Link: https://lore.kernel.org/r/179089728102.434549.12368098081790653201@kernel.org [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Just a Link tag (no Fixes et alia) as the escaping seems to be a guard
> that never fired so far.
> 

The names are ASCII-only, but it's worth using escapes just in case we
parse CMD-DB incorrectly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
