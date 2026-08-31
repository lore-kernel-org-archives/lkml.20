Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD003CF202
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164228; cv=none; b=XfOWWNwD2BG7Jb7xEXxrP2MDCh16/qvwlRUjj1h20xsICC+ap9Rww5K4XOUHFOh/iRIc4S/CY9r/lTlxP8YWhH+iDncM3N7NMsBnJ+gCCu9eBJ9wz9Jo2RIeZySFFxDnSlwxGaJ332yS87L7Zw3K14kxpb10uOcL0NeHqiNJ93U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164228; c=relaxed/simple;
	bh=WXjSjOxe3vtjSAPiOCN2Y3FCXm/CUp+X9sB7J8Z9MG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cORkHyixg2VITvuKnqKNiXZh/goThQFJHJ0mA3inZ9wpZQJuGuJ5qShBeoOZrbp/hfcFBCOXVAq07rCnwsy0YQxrVjYaW/VCDOf8HK2j1rRXujgCi69SRqIlZbXJRP4f7mu12dQcK+zLdTbTHH+kxtkmziHTT2Hu8UYTAfjh6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTD/9Sw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ry+z5umb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTD/9Sw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ry+z5umb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsUu1844169
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W8UKaoXLjx4+ZXFYWlnQX6j9
	wxIaBVA5kfkRlMlNbpI=; b=JTD/9Sw8on2zFdHQU0ONFcw3jXFg2SkDf0QiG0VM
	dUetswLlQ+Yu6JhPERoPr5/Es4e8pMRkBDhclaTtftQ1yy56/cN6xNK7WpyVjA1g
	D/ocB2wQOihn7SltjbR0a4jtcFC1E0xukCzr7oawaq8FLG2Y8iq33YSI+W8hDaRE
	fLGmiqN2PMJ6JsZNY7CTdDeT3avj3/6QPL1v0fYAVMy4CnRsEMiRsKOsGPDSsDMB
	OCgfpSxlxDhi3+4yf/sMvMKSI5d1P5d7euviBHOcp5FZHPtQqBZgzxFPXc77K/D8
	8kJ9vbwUdjP25F/4ijOzrG2qi5McJa35K+71/fiB8JkHsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgw6nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so416071085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164225; x=1788769025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=Ry+z5umbQwA+F/y+ESZEAbgO/GXnHELbX8MD298tSjqIziWmE8suZYxDcSd+/7iGGs
         0P0VG77nOLiFJ21gLUcot0JmZLcAvpr4HVBTRt2TfAAMVJALZdqGibMM85kMrs9/3mO7
         aN5XAm28DsogptnPaD8UXcdW+QmlAf6M4i9RdnkvmGBjO/AsG5h/HgA9E0iWHQCIhKh8
         Ywmndq7kMkR4su/a6IIm6XzMzx8e9xVVW+Yz4/lBKebPNBGvXj/lMmrJEFlvhaAqaVHa
         /E0Qj7o2DCdIIfx9ZVR/rg3bz/3vjPc48ol/4E9I34NP3oVSNBu073/JHZjH1EqDAczd
         AHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164225; x=1788769025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=dP2n6oJfzTLaLiZbBEgfPbjHqztm4F5bJ5s+GvT8t/AqmHZUG80YrRPF5qcC2kKGYs
         rXan6QwFqw8k+MK5OKZGQq6eIBTaDkbfNTVp/yWyYLI0lEoAECyvTLiU42EaONo9XmOy
         49TldA8QmruPEph/ZOTmYHGELcptkYgNrAHBAEC4iIakxeca5TO4o1AQ/4jbQepajh6W
         nzXLn1JNGkxh4trNZhTEdYmKyeld/M4eg+YG0mJWMciapUsZROpUZRp6tvsusN4cZ+zc
         45LLFQaYnFpW1775sA1pt15dWT1gXtsz6Ncf8m1o0uCHIU+ffSge8Havlpf6FsldmIf7
         Y3dQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFgsAHcQbX5R9C80MnNCrJuQXHGgImoUMGZtPMSENcktkVex6lvR0nhRHmGuUQgKvEF65quuE+TCoZFqw=@vger.kernel.org
X-Gm-Message-State: AFuF++kkJoVBYeQaG+ugcKNT5+63AUSXxSDXaPpUX6FQSu3K3OL4SrOT
	T1if42rRoKu+hIZVaZ1oZFxkCd6G7C6bl6ZNeh67euSQG4kwwa4lNfILi5ucKOpkQUQOBx3bkpE
	gfoMHhRdOIPDyvylS+WIfb5GLR0d37WCcCZItA7cFye6UkylRshKi+baMh6JAq4SYrv0=
X-Gm-Gg: AR+sD10TLNVLCjVB1gh1VC5NuVqsFFirn1pjzWZnZbLneWFxxQBxV2CaRNqcODxdzK6
	9Y615cLXnVdHwRQbEaq8XfqdGchJVwlKRhfHa/ugh7yqPjw7oy39SQUkMLnsuACBFWMJiJ4s2OX
	5mfjNDffacYys1V21hyb5UxXqv5CPLh2UFHYiwVRCQTJEsDbvgHC9Yt76UbhNETtqB2S6xQs8xF
	UeQdLNG6m5fNw3PgoNrL65EU7U4iQJMYNrtWWkmf+p0Sd1EX/yWr/20WZ04KMmE1r+32oX3OvYR
	lyIEbEG8E3V1nohFtGzCGaUy5f39/HChnwkfuYFo+PdwzUtIIKvgKdt7RLzFadn7sZ3E1OGvfuL
	8YeO2FaQWmlyA8Q==
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706638785a.21.1788164224587;
        Mon, 31 Aug 2026 01:17:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706633485a.21.1788164223956;
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm291111315e9.11.2026.08.31.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:17:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <ywkrf4rui35u3fuqzxmuyocskwrf7w62lcgnhbxcjch34vsvww@olvgcxp3yaa4>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4wARoVW31FKt
 Nb77B9w1kG9n1kLTt50Ek/rEYb6f5I8cbGJAUTc91XYjAIGAH36vxW6Ac3lHLU+v2mIshciO3fU
 c6bk01jSB+TYqsc2O1NbUL9NFea950zlJZimgzHPKC1TJQ9yOeSivxaxwI1Et2jAZs0QqfX16xw
 OTCYxv6WVU5H8jZtxvz6Xt7zL1/L1f9vBzrJ7Ja/rQ8Y7noNk7Uwbkk+6puA3lBhZ5YrnVm71D7
 Ohst3iBpUbBtVInNo3SIkG4WDdMwVHhaHHABV0+O81Zg1f2SIVQf1j0RhJsXQ901SBltIjNU9Xg
 J+9pz6f/maHR2XUEq4ylEfByyl3l/FR0ETd7lhqTueINMPQqybdY3kCvc7ACWKNbMWiNC2FnloZ
 hIRojeYvttXBi0W9Bjn1/jhU32o35E76jVpOWnO9Uk6xNYVoBoLZciqODCavUqtnbT05NN78owO
 OAW4jMXrl3DMkgECTgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/n06P4CDnN7V
 CBrGX8//TEwXRSDkfFjg95kZHJgSQcq7ACiWyv7sNE/CvfIg2W7I3vRG2924u7qcHjlVPfkiOMm
 xm0f0IuAJEZEnh28tFHWeOV1uyOlSus=
X-Proofpoint-ORIG-GUID: Mh7GTeaeeg-1TB_C3gj49GTGBdqedQ05
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953881 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1Jmwf9m3hYnSCzCNOYgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Mh7GTeaeeg-1TB_C3gj49GTGBdqedQ05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

On 26-08-31 11:20:59, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
