Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501632;
	b=tW0ATk4s5oQDGBtlSGnToWYDXFBD53R+iX86J3oVM8Tip7ZOFDIIG79V/ozTak9G30S6
	 JBHiqooFeWmmfULsIvRJbUdJeTQXIirkkP01bxlIi0WTOvKEans6081DPt4uJCPx/1Oaz
	 iGZfVr5O6+yq1onjoEbEjJF7VMBdkuWO6k9rOHChNCv1rhXklp9Cq2IRkgmGeetTP1WaX
	 qU1CjdXloVCWwFULXZGO+GvOy1hPmFUVYfl5so5m2sAh8IxI+As6OFRErQiP1mOeMG74T
	 gPAGCSZlcJM//IKkTDRSgpRnTdX3zylFTuvpd0TlGaLSvn0XeNOicPRTrzOnLEZ/syw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
	b=GRxQ0HWIZTZcxSPyk0s7JGfU54CO3mXtaG/6DABd0D3Ii0RT8MDxriDkqBkGPqE3klu3
	 mRmiRZKqPh37bN7yiDTirt1IvPc3SjQCW+P3Glaam2Fw/6TTkRrHCKg78AwNS6alq6/4B
	 ccRx2+i0BelS0Gre8YMvcGHoefcamRCB2Q4uThTErv3S4U3/QggrSLe0qoz7AAUf1zh0c
	 OdksKLPtHy18UNPeoJ5l9Izp8dwaF6h3YlkS/KU6VGybST1etgRD6NoP01iflFIqjsbNQ
	 K2qnWtg0bTg+/h8L4b0Iw5yFGNPTNFO6GGVU2apQhDtrOtSq4IsdudL8OPEvYFJ5SMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C389606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C389606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwubj1929090
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SGCLimzuaJwjAPK6tsNiAwtx
	Fv6nKdVZflN0Nff4aOg=; b=GdyKHJM+TDw3hI99G8P5HySP6jbcJCQRXZs5wBtF
	WywCWLmHVGpcxYm35cgmlcCmn7Y7T8K2LSzRvexES8GA/kJLJPLCSz4bVHkRaVR9
	PFDAB1AmVJ1ierm4tO2MtLoZGf3HpHBsLkSpS6bes6VxqcrnNxfPIPWFx3Xtjtgt
	nqOaFUXRDH/MItm9ZY04dQpOEZ/8l/P/GTfPR/UVTbX5NDWtVN+gCsG0qBdPoc04
	lv03Fi81WlxSeOzLJJjs05jPSB5EiNDn4wsYF8rVzYNTjJmPeJ4YkQG6aD05VJFE
	cfil/Y5C1Ud4NZ+1IXu2+QRN1xiOxY6Paoxq341a0X4XcQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntgec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso364943241.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501630; x=1793106430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=NrKaBdi9QrwN+aZGMSXRNIh+aJDUNPJ0s+W1JlUNWW/C+JqyucboBUKDC7I8t1ER3Z
         AhKu1tAC0OHPS/w65qsylI4AzlbJ41BUIbXS4sdg5lc9UCAwn9EYfZM98dnvjSjYc1Rw
         WSazPQnYu4Yff7R6pNNaE52MVqVjFqUud/Y04MbowoSjVVPOkkiuKiuoj+plHddVwsCP
         EY+zyVXtiE3Y1vlzojYrLENQvU5L+VvJi5/WdScyjUUWKPbVWgSIlJa8/bS3eCnoZ1nZ
         rE2o7Q+qhKs80BRiqt2QTXILB/GMclmoi15uzGUHBxD+FT83QPRJQk8sSXSuiixamkDs
         J0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501630; x=1793106430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=KZB2jCTo0CwqCH+1oAB6CMKKdgtr6k1QKrPArFdx3tSAx0BSHawwxSUbdZpaPQOj7Y
         1czjubtCOUcVmLjPmiOVycCeus1kQXMF/3eJsJFR+t33szKtKiyUgxOSmdA4N3V/cjnj
         GGwG36FBtkvm+6AuDEJhPh9E1N0UDE6EigDe8Tt5SCn+oug8jOozPCEVLw2rCJ3cZ2eh
         7oj+k73EczMVGGgFdBo+xs9d0dlGDNX+8ZK36EaXT2hfRPn1MAIym0ouL6BvUoSVOIoZ
         hCVL2xb5BFl8v77NPQYU1zY8ZrPjMzFDVR4jsDnOxRYo7FfLzHJh7EayJPyCwlUP/TFS
         tMrA==
X-Forwarded-Encrypted: i=1; AKwUvBwKxlpE02c+icdmm52MYH3BthsBLeJch3BrOBsDViu4eOHEksZUmuMxIZPmRs26p134E0/cvBR2OHwNh7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6Geo07lWKfYPnY8aaIjoeIiy3SxOkd4eJ/+h8YdlNeYJdRzje
	1nBZlpcP4/b2Nw/HKSdtf1/BubKs8GR+dTr9WiQxAWSwJtj3T+0a77YWuKxa1yIk8Dtvz6bxacD
	TLagqeGoO82pNLgMneEGYMoqz0168ZjRbLf5J6egsc176INQQE3faH6yl+3FGlOrPAnY=
X-Gm-Gg: AYBFou2bIaPxI3I/M2Tc+6AMzAivIqeG6Aiy90ndEzKYM3DnYn4GJg9fjQkxQ61T9h9
	k4/CEyLmPSFTyOBXGFTH2CpSihe9OM9gFVUveL6jjR6x2W/7m6NKbjGdzhNx7oS0vg2fbsdPIE4
	NbsU0J41TO8EYx+1FbIoq9kYHy4DjPpiTtGhrrcmQRWDZqUCc5z4VbuNFPOYrI82V4hE4ntViGY
	V4NcMpZ5a6QMj+ya6qT1qxU92JMO10V4gQ3pWN56KxGYIomKSbCUCTVI/LE0DALNYpsNuk88Mr8
	g+TB3W6rrw2H2BphWJkrdQSb9cXjOK2Tml6RGlrza1MuxztqJ5NdVhxZh7dIDNx5wpsYvedSot4
	Q4qverEttGUaCLXSS
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485515137.34.1792501630212;
        Tue, 20 Oct 2026 06:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485502137.34.1792501629023;
        Tue, 20 Oct 2026 06:07:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm76533525e9.13.2026.10.20.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: Use ICC tag defines
Message-ID: <oeccvssjstt3o7pxautzzd7wa7ngo4aey32pahbca3vyoskonz@oyl3hqabwbgz>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0DS9H4N1H2B6
 X1iZ7YsWJliJmDv7bHZUv2/gHEz4Va7HG6D457UOvFo7q95QAxDDH4ws7rIbZkF49OA5O3ddM3j
 sp65clcQcoXUTxKqiYpaWBOYDUooaA8=
X-Proofpoint-GUID: CKslbTWrSWVjTTMdKtlno0JfQOSaok35
X-Proofpoint-ORIG-GUID: CKslbTWrSWVjTTMdKtlno0JfQOSaok35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX52N5tHsrT3+a
 Au1i+M5J/eL4IUGUCkjohofm8dGD9NHAUeCh21leWLXczGFlYw550htw+rb4syu6H/p5L7QLAwI
 IhWxBLT92XSJ+BpVDrLUnhVe23IwvtNzM8kGDCDnTuYw35cCW4kEPmttxpo3ocuLTnhBxBi/53N
 KRYhWLxyTx14p2cLfIVSWEn8A0zDbKblICk/+73YO+oYau9glW/+wGdxFH776c3Zp4B73A92xPL
 YuLHHgII8eHztXdm1mKF81N3bqLqh9MpixM1H/Lmwhx/lmz/61QVTTC6KMGE6GMXlpQhJ/m79iy
 u1BBAh8fHEarGzr7B0ISr77MURulHB77lWOifNXpPqePWTyAWUQdXDWBlrrJxWHqj6MLXEKa/gL
 acr27oW5csg3E1U5Zjj+6SWFojae/PgkymiGv31iHXt7+3cBlI/RwyJj0Pic9qBlwP/P29gFnEz
 LH1B3fBxAb6c0UQKnmg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7677f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R4b9nUW322TDey9Zsr0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:07, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
