Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600AD3ED5C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371790; cv=none; b=OTsZTxTq7VCELhlIoTd7uhjUuJc8p1Tr0iurmnAOFxl53ZEemPgkDxm8wnpG+5Scx3K3C2LdqLv/IgSICSH7WyJ1g2/CQWlXHWZ/CRLyKeqqi8wkjAstHAH5s1L3v6Meys4ZE4fASeLOXdhN2ZFRBPe4A1rPGicbUjRER9a1jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371790; c=relaxed/simple;
	bh=ljHtDQyFU2tg4WF8xZYYgdWm518WsXPIE8Ro4FeiNhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBIgttWqWwxzq1UjDOb8SJ7j9obV8CHQjMF7xNE0MvHLtnNk1VDC0WOgFjMHUc6DVgviHxDvQ0Df2ARUiVes0FhF/UXhneNWLS/PotiDujow3CLGpG110IHn4tFVuxLIdAp7HPKEpJaDqOEB8rlyGa67SjCSEi4GgS5YAIWEwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbW41ToP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owpijvz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbW41ToP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owpijvz3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jAiV543533
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sj36ILgqyvhrxLK3acAns7/I
	xSKN/XaPnzARkbVNGeI=; b=LbW41ToPGyMJ1uwdWSUVonOYBXMewzlsbs4Y5lKo
	cf7JYcuF6tJLCOtnUhhUZCGUHiv5bGNQv6tRLofAJpGyfrXgvMjwWYlrC8g+8ghy
	QOQaRAsrZBXfIPPvv1h11JcdZ05N6QqKcgL5UvCMDRKZwdy15cHWVilTaN0jvdEH
	n2UKsItKzI1rDpJe3ZoSqjy9hULYz7nTU1OPOUR4oinQ781JUyjF80H2E2DRB9HO
	5ANZAkB/C5GvUls7DbA/5q5YZBqr4nZDLCEd8g5aiFMUSX2Xa8kGkjHyT+s6cHAW
	GlTqvrNnvuNPuER4OhYanucHHP2lWocMIisfdZYAqGrECg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09dhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91055aae7f4so74216816d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371788; x=1789976588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=Owpijvz32PTdbpC7YTb55IayY0wFFzyGO6wCEi0chXzfdxv3rak+zVGYpZGgpplxk/
         n8QLhCNPsaAsJhk+RPcocUQc3sRbZ31L6IqasexGca1/xifflslrhgDH+CX2fwM/dwkA
         8QyOjCTCrwEQj/0tuA4oaj+kCVdh+TbHKxySlmkYyV5v4xi/3O7ClpGJheDqm4JTY+rd
         XIO6VAJ1OGWVcimcclTFbYJfDcw9mcLHb0d9Tlex8gHOy+qtTtiq2iESIxhy3vuHE0s7
         3cR1uZck/vR3dzcW+D5jMyzv9yePdL4bGp7Sjny4abZGsJUMtwFJYyjXYUifXHXA7ba0
         ZLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371788; x=1789976588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=p8Lwnbj1RJMXPYsHXRi5GEP2P3ZsSxFRfM587VdcCBdAISKG/8ZcWjhiOekCLTKCHE
         It6ybItJQojBVJciGe9rBpM5fnRsi/Abq6QSerQ00j2Z3djN14a1xKwJgnuxsHHvmKXa
         snFg7oKybChJL0VQs5NaVbbqdM0kd5OxZnGDIC1qfm86tSgdF1ovyIYKxu3gKEYfqtyl
         J4oVhbSt5ApmqWALb3zNHx81mSfJxhD9e3qth1M6Kn1oAwnVjNSrB5BAYmTlipEd4C5/
         WWiKiy3CL4uwLXRKmSPYLyjS+XupDVvTD1Cn7HFoJpk4Y06/UrHKAKHxaTaCgi2jrCAM
         nKow==
X-Forwarded-Encrypted: i=1; AKwUvBz8p7X+c9wts8q0/1kXXWeh2igw7JZUuRx0L/g9ve+1HAytjoGFb4H7Bc32Zceg7psj6GRg3GMB687qb0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mMoM2lfB7nYe9+e197xFThl6tpHNT13JupdxVFmQ5Ylo4fkqmI
	otgUG6ozVQFcr5ac+CKnmmq5n/PNPgVkRng50FnRC+9niK7PNquySbxXHKbimDqWBKRUPZlezQJ
	MokFHC4kGWSiSqn3lYQIzHYwTnauijqaS0V/hoeYx/vLOsbRnvkv5OUWC6pc8I3/+NSc=
X-Gm-Gg: AYBFou04LvugvujcjkeBjvij2fvlqa0NhwOIbXrllYfaHbn/3403/+FHn4PAB0q7Str
	oe7cHc4DlH5V1BeJ+jv6xddoPkCdcGjQ4HWc8hdij4J2BIrVCrw/dcF3lY2GKbKw0c0EfCkFS/u
	vcmgwNc6HQwfcvPXDeIN9Gx5LOIrGvua2botKLPPGgCk2S86O3JhXSuLpBzm05b0HQhJse+TLPS
	ZqpSUDZdWo0N0im7TqpYhCdNTwTH8quHa1TeRs+IcYxB4rH6dEkHe90Qr7iw91/2+rSffsSst92
	3IiNng8TX6P2GocUDFXWesdtCmpkm5+MaFczsWNI/aKPxcAv/SoCO536XoJpRRlXpsW7S16lgn1
	3nOg3Pd52nozutA==
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564003085a.11.1789371787586;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564000685a.11.1789371787024;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e8d1sm25205655f8f.11.2026.09.14.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
 names
Message-ID: <3kgqogj5q4ndryoj745ujrphpyztihmjp4f3otdsmso4pdkqzt@n5s62g3fkkat>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+W9GMH9dy/Q+
 WA65COgSjv8MAPaSOGaGlzJH5esCwJh2mWRNNpITj10x/guxO3Y936oPKnIxmPdwr8uMcprIi5N
 IrUkF2mbDUuU4uvPxVud3cNa9MjJ0jA=
X-Proofpoint-GUID: aUyJ6Hydxk4qM3F6zPqGVEgo-VVi54LO
X-Proofpoint-ORIG-GUID: aUyJ6Hydxk4qM3F6zPqGVEgo-VVi54LO
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7a58c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9+2606vki+yj
 MoK16tAflgJkofagXWUdUyEJnjJPNcyneG88/yrCFFYvtofHQzTjdqEWLx87gL8o741cJNNrOLn
 CHu8JvCxO62PvVOJV3urtLyVtQkt+2327nPklsq3QrYcvjBbjy1P1VWYxNYh2NDE6dVB/gDSAaX
 3Hc2TTBVfyFxOmZ6zXCyZBpl7hd5jc+UkqYc2jEeX5iQgYue2sgHKTHXF+NJFF+K4YBmCl7sRFe
 cyQ9lsYfCx1CkzZXljG1rU1Nh6jG8g00+FxZHK5onFVuX1JYXGQ4uadgHpnSlrNTizNnYjlCNe6
 gJ0nSnVOadCV4jV/BZ1/ouW3X8ISwwU5cUDkvQBQDc5fnfK8+JR5r65n1JYGlpusRl3cpE2zlIk
 BClCMhu3RuB+oGzbunjjTbEXzovc5Vm0VDSPS5WYPkkfn/CDNMo1BgtQoFiQIldJnDjWjCehGVQ
 3Q52FAciB80QF3DyLzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:30:00, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
