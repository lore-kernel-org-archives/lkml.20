Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB583C13EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162200; cv=none; b=l1vxYyhsvLc8S2Hr5al4Z0C88559q+F4TD9aFH8jBv4lFmmDktt3yN3JhVlGEn/F0TqIhMvcZFjCRZq+90Y91/rpiQAkON4viHzUWHSnvPOyVC9YTblCyFIgOLfGF1SeQX3SFoqJfgGPBr3jVFsS+vyVIGL24VYslbk5FKTJm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162200; c=relaxed/simple;
	bh=QMKWbxrTUoYOpkYxmeTHb0eNPHq3ygbKhMQAKrB5afE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZNo0la8IwcxJqjMzMgV1UBUSvHpyRmMa6HcfnappvzG5SHL0/4Ct3M0071h0MwT7OuFzaq40uLeyWVPUZdyDkENUXyP1UHFKVh2A9StqZ1phl0jQt5DGX8jNpsmC1PvK0u5aSw0J1lkqiKtctreA84RFidxD3rpuGY2vT1vtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+KmXK5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9PnY00+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+KmXK5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9PnY00+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V75fQ43542911
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=; b=G+KmXK5r7+EhXV+j
	Lg9lsxxyMjIAtavWoEECAY6aOAxcHgbj5ovZi7OfMDZ1E7NS8PsEHbxNkC/nrLK2
	b66RIm2WzMlHtt2b8vm+QOXe+/8o6iHC1MRbRO4kbxK8ErrrOvEag2EAgZQxJHh6
	sOt1sjtwN/76ocamugD+0/PHPGjAH3AFhjm9teRlmp/kP5iw+ytL4Zg00f+E55Ih
	cPb2HFEct+Ds+CYJw8c4/1RFrR+iOZiqnr9bnzjBuCTP+7/Ze5/sviluk9G6noIr
	TVOtQRNjFjPx4T/NRPJqaW9QyRYlrOA0O7Y08tcS2NZWfUFfe6vdR9cQrJ01AKq7
	ZApx3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x0850j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa40fed05so6352401cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162196; x=1788766996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=W9PnY00+G/Wa7NZHSfbM+TNUwD8dY4fnddxA3u26EM3FRqHvOK40ocZbNVtag8/C1n
         4smwaonM90MkoQXvyGflIOpGDE4p7c17mXcHikWQHvaU2HgOB8DyrCtnsYTlhVeCWYox
         Gree24LoaQ11/r3yMktygms6W6b4Ek/L+SctChetQYR6n8WFD+Li1BCtARtrf4jUi3j8
         IQIWMV9jPRdQc8YdbGqHvzYy7Ob9JVgC6YoWzHekd9xtT6l8huEdY7kH99/3dfQBJeJn
         dFpM5T+htbE0HDhLuYsGooTUTR+s9VROcIXwENq0vxoF9b+pUJDlYs8QkYhA+yr8msbm
         N7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162196; x=1788766996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=QVox7enNdrAxyA+DFhOawWomBaY4X/HjyEzlQhhC9TA0hzL5GLHUdBhTfD1o3VzQox
         VbnyAYA6o6EQSXAQG1SHx7m9rGt53BY7bIfQd5jtR9OF23DT128mXaj9gSiAeHNEofaZ
         /Alshi1UUCgtbj+fUs8if7dS418FVUoK6wm0jLm6H5nFVjNIn7QrkFvJfq+o9/bXBGB4
         ZE0wEQrcGMHSGnTtYedNcC+oMaHWYUcycFYKeGF48qSUziXWtBSEwVWnDCtGKNWGtdeK
         Z3YiD5Z6Lh4mWCiPN6Rx97QN+gS0ly00iDKxOniNLSF6ehCqDV7kPEIWKHHMiGFNQqtt
         +ZXw==
X-Forwarded-Encrypted: i=1; AHgh+RoBoCNdkKJ/63DZO3Sg2uHX9zVDCVS1mKxLVkZ/dfZp0BEVVCdcVOD4bVPApiiAM2ejCfj2DaeXOuA+g6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mLrFEqFfS7jB0AoeFz29fxSYqV67HUiUDIC+hywDjmvhj5vE4q
	rcrxeBsi3wspHkYGHcsEk9vn5kgVvezZBHKVjLKagK5XzG2pXQQxxs5LhGUcPl5TMQDb9RZ0JOn
	kFGVQh4P8WQxOy+4sYIXKPUrF229TV2yl02V61b1ZU6CsZln8asVOaeRcFf9h5hnIjb8=
X-Gm-Gg: AR+sD11Iq2qHcX+ufEfnPrkrfXwwwJB740rX0eu8WMn5grQICBVyuDqiDznuf6LXDG7
	GMd08aM6AjvEheFezpSWKtAY/E5s7u6sDF+xE3emtvHdVPje28dCDH/4tOxn0qCSSHZ0Tt1l1EJ
	Jca2PQ/NoqoHCl1881wIKclL+6uXaSYwshuGN02nhszC7OrrnMhyEgUdH5K871mtYe7zFf5oEtT
	9O7gMDZO90poDqRH8S5WW3dQlee1785popYeRbhq9B4TsrIIaRZA9aANnG7xDWUuvd4H8RGfqTx
	eZXNa2NdtFogLYmaiGSGLj4l0fcoG0Iji9rDMcNOjRhFnv7sNJsA8TiY220vI4TUgsZE5UOT1Pf
	88f2lHqK+PiVLXmBpjAgi6Q==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847371cf.0.1788162195505;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847081cf.0.1788162195105;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c69ca0sm3289262a12.29.2026.08.31.00.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:43:13 -0700 (PDT)
Message-ID: <35eec1c0-783a-46e9-afbe-fbd42376870c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:43:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX46C9tV33F7N3
 P6L8Dgk63ybw9fdUhX566EdHEV+s3cySjwAa1+vbMCZMnro2Z3FnF1qqDxowTJtRUZzciT/lUi/
 nP20HHR0kDZ9qSYRPFze78KgQPK/bE0=
X-Proofpoint-ORIG-GUID: Qn-xndxlWAtcq37B7PJXfiuiQTos2uma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX5su09UBX6FUC
 S6ZkjiCpd223NAVgWcPNyYEJVFziGgcYyIB4P6Dl78sqE1UvzgbD/MpBStMcx82nYe1/tNfAnqg
 jAGK45LznGMQsQQdexy9K2chHlh5bHDuTchH2s75dF/mhKP0iV5YyhxljheO3b1XstWIuIivvBz
 WeG3FfGzwa0IHU5EBeZuD/Ey5dJCqpQISTr8sIalGrbK76aWWwG3gIAFB1rpJbxzPee1zKCelui
 D1C5tWDKU0wkZsoAG6rj9+YxEOk+WCxQ/WZ4E8h5lPZg99KZf3JOZFHRXWibzxgMOvgufxQEd0I
 RFeNFsls7RbXMxqZSGCXMJpvzTprDO7wWWqox3BLFrLjATyGOFCMjXvUPz3OdSCX1CPrHFXRHAY
 XNNdmx722P4A02JvpifDytEVfzkbBWhcj9jLWnbU6iQuWgbLa/ChbGJ/4TFwba7vsb4U213bZGP
 yEWbVTHQHwRKA0WoqgA==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a953094 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Qn-xndxlWAtcq37B7PJXfiuiQTos2uma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310065

On 8/28/26 8:00 AM, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
