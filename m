Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1747D94E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269034; cv=none; b=bNLgHiR64Jb99fXTiCDJZNeH8HJv2D7XQiHC/r2aPBjYbKc/MVDahMaQeXyLqS7K1C4FTDBbYt42/sWPkHTIaHWnojlUWJBKllzt5VZsHdPbg7zU4VVOFaLqA6jgMxK1sKMMwih/m9AQRCWUH2kHyDMXrPMzZNdyFfGsuY8SklY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269034; c=relaxed/simple;
	bh=sPLjFmC8Z47JUFnL7nOnU3MnvdoOiJICOFcD98EBaOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2Jl/xlIw7UHDddIOANsoKl9Xmf+2bMwx4TAkxBtcHZHzJSuz1kHOtuztN1gZH0htoBhdUXaL4qJvWYpvHMSK1FI659wPd16Mfz+lcR8MDv3d28awm5c1seLsd6FQbqDcGTnBYeNrswjHg736OmJGiVRnJdED6k6QdLg+Z9A85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwbujzHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2LJnQe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwbujzHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2LJnQe1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJU7w1641773
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=; b=pwbujzHo38NpZi+u
	CgVm7RlOuN7Be2fu/SOtvOkNkhJgx4/Z4yRCLHUPMOWvsdzd22dufX7J9oQbXR0Y
	Et09LjfdF3+JO1rBXFwEhV0nn6e7pfvx2gDneCM7T725KwgYRL76OeuoT1fRZhtC
	gq9NrzknbjMGfQoLiPhw7WgkCRaA7Z8DMUs7YokxKEEyPeiC9vP6tTWme8mnt4NK
	YMxMEkedst5OiJvMWHyBjnuNQd/vJ57xMQdzdTilGU/l1Nxlxxu35UmGNQ6i5nX+
	o0bM+TorUwAGnSdjQhDns04jZaK4y7zOEPnihkkZAjvTlguhcVVUFFNT8s7Zb8sW
	moWCDw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tt0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:23:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so126678e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269031; x=1788873831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=W2LJnQe1EAoyzh3gxgSVGw6x0vg+0QGzdohjVDdEJA2TmSF1EdIgIZb3LrkJGmlZDg
         OPHhAo7z1qH3+FIsNIdmxHKMlawyPmxCwHAvGFB5MdIq3NQjjzOFnGpJnmg9mldGwN8y
         0cnLL2a9bCz9qBsV8oIZ9lXiNteaf3uUX3z/y3MGOWFJuToNUxLu7fIbgMVrNoWMGyxR
         9X3SaEYQCxc5DAw3QljLXtii/SDT/Y7ouEPvlpPGtRtEWP4BkZbko5WVIBf6b4khSueH
         51upNDguil/PFC71/7hMHSa1yoidP7YAMH1KemfwQR3GQgV+i847Rf/rF6rEiw21Biqr
         sa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269031; x=1788873831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=tDwxFRskBS7dvE7WJx2X6LlQwPaUl7oTv0uLN7+Otgls+o4Q2hY5UfRSI2lfS16K9n
         YjhS4iFsCK8V3HcZNoLI35lJYGAXdGN/scNte3yhYWIRoAMJ6P+o3ubtzar6eXw5GDAK
         h4h5evz9CIvQ/CY/RUNr5vD54+OTqFbwDoH3etdMNmy2joHh20kCfh4NMde1jdCkhwdZ
         srJKw72WlB4hO6pHrcksYaVkBBvHDDvo1WLVaB/lmMbV1XXc7TEo0KKNFSGMZH6/4cWv
         WLvBgrFDYG/48uC73RIAPi23fwamaoDO1DbaPW3u6KTL2z/W09xTAF8qWZOsiDq5lXlf
         WXhw==
X-Forwarded-Encrypted: i=1; AHgh+RqTlBZ1WnLIZQevP+wSyygyv0hSx4gOyFCj6NssB5MdEA441NOoa09T0060hwlaSJB22RAiUZD8phUr9AU=@vger.kernel.org
X-Gm-Message-State: AFuF++mFHaHwjFpqUjxHoenqwqdFzmfzK3AXJpjgs33944qu5VpnPBCz
	MqbvcMmp0mynAaqczQqG/zVuO+Zm+fHaiDWbukzk+JUpmqSL4GAUBHq/kwPsjdOm/Y3D2qcBqSi
	et0wppGlifqJ4KfsYiLvUH1YeO4tDWDBcFwEDurp5MwfPhukx3HyRPg2afaElYLeZGHA=
X-Gm-Gg: AR+sD13IX4z0CyEct5fPziFBt0aK1MyFhaSeDU2xNtz2d+YIARxlUI/I5fdOrLdmhWZ
	OVlxqAW7RvgwcaGwy4J42bg2P0ru4blnHDxSXBTF1aImYvQyypD4cRcM/RHEYegRdFM7VaUuDxl
	BpKOKPEmySSFb1ajm9OnFl6XtICERcU4WBElphKiZ/EHe0vTauZ7eEGpNB6yMRRP8f7FnG9+JuK
	I6iBXiG/g/bIcWvaMYBJ0iBj08MgvcomDJ8lx+CcEs9bFwvp5fBCh7n94k3xHzJCr+lYNlyn3Hj
	LYt8T0Y2I8KEmcozMTZh3Y9bgxNAyk00F5g2WZSJCZ6D4yCELh0t77Zt/c+t4YBxx0CRnFXfD/X
	Uzer9v3XHGC5wJtHKQDmuKA==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830662137.1.1788269031104;
        Tue, 01 Sep 2026 06:23:51 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830640137.1.1788269030644;
        Tue, 01 Sep 2026 06:23:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce877sm2884326e87.20.2026.09.01.06.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:49 -0700 (PDT)
Message-ID: <28b27377-4fa9-4aa9-9f3b-d7dfecdc21c9@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: ipq5018: Add Super-Speed
 UNIPHY to USB node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96d1e8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX3eDCTt14jVlZ
 WesBPsUXlfLdPFE1ey9HHKPPBRsKj8F1iEVVKIfrQyQNTY9XaSkd/WEU3/GzFIqCNMn6igkYVio
 hki1w6VQfvf90pba89fMp1mxFP15aEQlyd9Qo/d27HrwCJyH7pjySNnCGQl4IJnFXfwhc9WDJ8Y
 6MxQ/d6iN0BibY6dBlDFnlNDuOS/b13U9tM9ZpnOlVAxwrzqMgQipZePBAozya/O6cAW5moMPTs
 g3rXlZBiCjXsIIYkZ6BoGI7/9xKKJzBy65FT1MSvAMcSaEEOmrPtTBi5VHRO+S9g9tCvlSRIWgx
 QYqIDf2nzv1OR1TQLHbjHwDgK0yvief6jqyfyQnN+TJOkSdilTlBXZipHOXQo2DPnrnmGUzEJpd
 MMwT5l9VR2+4SuiLnzj9P8TA8FeYWmjjNUEbLomKMhbIAPyZjpPOQ2QIffEG5ckY2cqn5yK0lOq
 A6RQOuGFpyV4ci3cofw==
X-Proofpoint-ORIG-GUID: i-NvL7xK5gtQP44YLEBiK9NIoCjFpXrS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX1RpWofbHcl7d
 JpcaEFE9RnDBOZLMa9VHzCpt5L2H1i/VmMDNS0d1HVFlIl/t6XI3lmLusQkb0MS05uvDK6DDWX6
 nvW5Cj49D8fq4vFz5uRkh5koym9DnhY=
X-Proofpoint-GUID: i-NvL7xK5gtQP44YLEBiK9NIoCjFpXrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the USB3 UNIPHY to the USB controller node for USB3 support.
> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
