Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574CA446857
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380485; cv=none; b=WsPs+IM0lqzMfDjIuMsWm1Ipi1EN0d0qwAeyLVgcZd7apkAerammjBBmglCpdeGRyJPqF68BIZ9nUTF5R6sLulP3qvXeHXmdakaScMrS7UCreJfzt5xseuwyxR2tuQ/PkpQ6rfqn3ivwtV+uo6wQCJiICxKB4BsZdObGIBlo9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380485; c=relaxed/simple;
	bh=4BPC0RAv/+Xo6vftw0wqtFLt3xYpSNLwUfg/BFWjavE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8qtYFH/NE+e44A8gn6pL8WpDXCpXfkaK0VJAZqbDj8WBOcOdcgZNRo+lEo5zXNBBxpAiXyxSZmQQmctuA4gQ/W/g0NZ+29Dn35lTCUDhQl3xF2sgAaT51UwVkuEKPrS6zIGZ/fw3NxtO+91BYXcMhZ2+nj5wbaxsEqX5qY3RgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2Mj5czW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glzR6iTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2Mj5czW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glzR6iTg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV02E3686722
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdsEo7LuSlTCZLMr1If+IEH1
	EDpELJpDjjeykvuSTxg=; b=V2Mj5czWbOeDLkaf1/6l5Q9Un3YxHgG0WSK8yVWF
	gEVQGizxkMhfnz1N0H3TZ5YXYfmaCyUer+HTffbZDGfgFFXwvgen7YWHLNpXAuGu
	EN4hiJBkZM5323aIWQHmI3uZOq4Wvw3jDD52PUhAUr6LnkziDhc9FG/MVp8XOYd2
	hzmlS0El8OEeCqSB7C55gK3s4JTD0p+J0Stmm7iHs0B79U5k5GL9MbA+bboefl4l
	VbukOYsKU+Wl8XBa0jLRNRGgyE6eIH3Tij6mVRz7A3TgZ874wz4+zpJoyJnYT3QZ
	n01RT9JWwfhrn8Ht2Dql5o48r0zBIWLpIARomW0AzT5htg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8njw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:41:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso503224085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380475; x=1791985275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=glzR6iTgkracMiqnc8kkg30ChxpAiidPeIg0Ey5UVydLjy83Zu6s8X7yaJSkkaU7Mx
         bFHLvDFd0/cZub6M753fKKPjdac5iYLW54iWVA4874fJHOG1vdquoCVtktQI1klnr6t6
         eu3sWRTftqkN0RjFLS6x9/uOBhbMgG/I1LNo2ZJ9/rMaRHBv87D+cXGK0vXfvUgBgyjo
         vQ+M4N9naaXVPsRvEeUlH1B+ZeNQYFyrzX/yoCV75tt0lZaKHbSyMwsZuS+owtnvemNI
         2N2tRAZDjlp23Wa+Oi6uMBXynG71TiJkW2Rpx4ofuOMt0nsLWG5Dy3lL9A6tp5zWm5Nb
         pdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380475; x=1791985275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=oyDvQ3qYiRaHWAozbDbtk56Bh37ktA7cCxrZxNPZyaJ+WwrvlYZXk7hjpMd9y1k5+c
         hFtMIYH9juLbBhOzwnl3jNi567+cD7qWC/Thhr3kegd5NhYVXBVfpraFqHehp5we78QN
         XSaD44ESE2Bsi6kZMS2YSrVREzBfV6a2++2JHYdiJ+N/XwXt3iSFzTL/+GDQoSjjY4Z8
         UAyokVmJGVYGbfC6rRyAAPEgfXueYAIfcnu4Q3trvkCCuMEKj8haTufc0LtvJmaJnRGj
         h7/VcOgauDKpMzfQmmA7ZZIwrbMCG/nPcuxXStwv/lVUpcev06f+Cx5/KgwVWckLN71h
         1UbA==
X-Forwarded-Encrypted: i=1; AKwUvBxp7h2f6GNDVe86c/ndd4qn9DTTpSGRxpzyuh02Q8YN+b2BNZBDprSkKH3242yRiAS7H/13izWi1YOP8/c=@vger.kernel.org
X-Gm-Message-State: AFuF++nKtnZ/7KCSuyKQztGKacks7PujJ4Z1p2DzFN02nPz5DBA0ig/K
	AtXJc0mZtG5DRl+RBoigWllOfTJaBS58Bbv5+TreRGobWTD4+hQveNyYLKmLe2/vvJPP0tfiX7E
	Zt3K62Bnl+AXNuUlSZVIjnP/1oOSB80Yb0yF+8umaTB+OohOU5G1MT2W/06MbZ/sBgEU=
X-Gm-Gg: AYBFou2zUnB0Uv8dHJSEpedOEiquNPomUQJUeT///haqQ1wjlZhqtisWEaFe8FkWygU
	P4OOeqwJ1OwnXyb4L+qQ9kdiJfGjp86ZNQT5lgq5LmXiOYCalhfI4qlZx7UsjeZ+7J7X1Zl2hbq
	rRdFXVhRGJqTfD1CevHUX64lN2wvf1OTb5fBrm0uttMbjq4HlV8fX44Yg99bsxBUDJ1QIBB6Pb7
	S7C9eCnmVACcISQaouPpwh8n6+p2HoLYJ6EOxwzw2R23TPzFSmXMfOoP4fH5RN8vM7XaqCkbCye
	kteNmNQLxEckQlMKO+GxV6ze9P2+30/MpPzoCWD/RckY/jhgUE72yV7Apq6fAB2Cu/GEg29aPtB
	cBrYeibA8579bbR+ZqRv+5gsM8r9ZRSeOsswg0jTmCMv4wzbPbYwcAWq5dxNFeor17GSGozbIRm
	2pgjoTO95gnmUp
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428384485a.37.1791380473893;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428379185a.37.1791380473285;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3083376sm54026e87.43.2026.10.07.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:41:11 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:41:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <riv4zjtk3apvkvrkgkhsgl4uwnuggefda3uu6z4czelgfd5kif@qubcvt4k4czh>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfXwyhzfIhVnTmn
 cDfzGKrvsCzOF3HD+NjvVwB/k44NAU5U/6AU4L/OPbp5G3DErCLnL4XmYixpoaTFwrzq/N5o1oZ
 nFtCoiaiDUauuEAJDjw9X5G01RzfD884ZqJspOR7ndIw9+ViNEbksNL2gPrWjn9ooETypF9BK+p
 /r01beo6co9zA9wwNY2e3VAbIl4SRSv8v4RCRsPvjFbK12hTnSWeafAa4790c2V0LDOJqDCihwJ
 9X5soGqFW7q3RWoyvp/ptp93UlXqRi/md6S3MHPwVZAqqbaA/vZeQFmeSJklwPFdSa7PdU1sIwc
 HdiYiruvu8/qUv6VumWREjvAOJquZwQG4Oq5HTb9V13OnR+13vtHyW1nTBFHKT77kTY7PquvJIC
 mrNYXITQtToWsqa3WyWU2KZOFEVHNzWDzgYodk46I1LY/P7G2Gvte3+78npeBWG00bfkTaPReQo
 FFxMrHWpCQAxwCj8IDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX/K5dlmqf71sI
 eBExbKGJKGOx1kQ3nhIBTVdj9mOPfcH39qzJQAvVrw6JJaDckkza7ZIKieGH0snafogtABi10nE
 3DYKI8gOZmurOa6buUy2uG6P66rcPxo=
X-Proofpoint-ORIG-GUID: pjlG252nwkeXwu8Yq7TItHuYjUtdf9jp
X-Proofpoint-GUID: pjlG252nwkeXwu8Yq7TItHuYjUtdf9jp
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac64bfc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q6lPxUuw6KINYsX_g8EA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070054

On Wed, Oct 07, 2026 at 06:21:07PM +0530, Mohit Dsor wrote:
> Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> board to provide HDMI output via the MDSS DSI interface.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
