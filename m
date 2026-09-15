Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699B0475355
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466078; cv=none; b=fHtQwFJoFhzpcUjmnQavYF9vhbGw9YLoy1TpLJCM76Y/zKDahEBQrbffm58pDfeLDuScvfxIVKueZIIaYAgD5u/HeFLQJPglWa1SaTcKNKsHmqGUtWknmmQMlSXYBemWuP1BbftD24OL33iLIuHmvs7jtxFUg3AIczYT/41iLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466078; c=relaxed/simple;
	bh=idsPIr+3pZBF6LKIDN69cLPiBTmHyZ/pTqdI2C2CvLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDxIUTr0LgUVVHjs7wYMnUwdTFqclkyDiNSfagVmFP9hz5Bjb59qGC2WCM3ehjFNlKWFrk2alYWB3JCLhBaRUSKzKM/lud5uKZKN/tjDHxw1TeXxp37gmui9UcxKBMRIRJdMYtxPoVAeA2i5JR1OHse7u92i6DSVRkcO1+aB/KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/pTK/rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byLCVtH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/pTK/rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byLCVtH4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCID064486
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vppERyoW3BzJo5xUE2KTfoeC
	I03u7SKMXvXaWdO/Dc8=; b=i/pTK/rNkVlprb8nKTDlV6gxmFNaNtgmLVmJYpSM
	S1vyExx26sU6ZYrpqIaNnfqZfNsINDWItyoe11Gqx/Quepqh/NQq57jvFLUSmZDS
	DNAvO2jNkTVuan4M6FK+4c46svWcyYDuOCm7TK35GyJR4Ss8BHqwvM0WjT6GOSvX
	fqME8uRniLPF2vxeEe+L5fnUES8mMIfBxqiwOTwrPLAraxgkQ8sbLXImtxlWLHmi
	rag4GVWE14u6n+mwpJqdTFf2f10FubOG3xGVhTDmGgqaeLwFoz+Rk0Lr2Z+J5p6b
	XxQW/tBKL2mRmmMOUYNgaG5/TkWMuJrA2VuCAieQibksQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41ut79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so385405585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466075; x=1790070875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=byLCVtH4uPo1UPFP+w01Q/AyyRUCn+8BOvdzwHIlAuWQ+TSnY1FHF8ayp5hhOBQJUT
         k0U1jFIN0mioiOJL+5vdctqGF7FilnM8MdfwvOvSX7vWDGw/9zLQX3tKaTieCQNybZ9c
         vTwc13bfKsTdRE/qvTM1PYFiQASfa5D/jVi/Xu071r5LbLnxb3EMhio6LmzNdb2o/E/G
         iPfpvqrLA2gBJHaFTlw2sLDwOfhi2ShOqS+PkyZW45lmFHiEYD5L/0h5uks07f1X3/QY
         fpQrRA+mzpG4wxguw7ZBJclk1I7mTObbayqMlR+UyXKBA+o0cYFYLVkqYdlrkafSO33q
         VE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466075; x=1790070875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=ZVyHr4MPRNzKDgrfhe2rcduxVnAaosAJc+0yjLli953TiegEnTFwl5RgYNUO9GeQOE
         QeKjGPu+FIMtdHcHLtdWi0Klz9mn8Xl1EElSDaTs3QhH8U6V3q6FvGAVBxOGo321Pbsh
         3Pro2xqeMlajOpCmIMhR0XumSZt1j8aw4Al5gyQOQEqJuKHkgxUNZ7nVs9Kibl2NHgnf
         4vZFITrUQyXHCK6Gr8xNrcuCNErVSylvxBR2C0P+EcuNMivcv/uHGyNbm0JgjGQAy1VW
         aFCDlJjg8Nnbq45ml0kI4AE377WooTfRcO7v5OotSBSE7PDTtSyPvV4q1mxYEPcL9K71
         jBLg==
X-Forwarded-Encrypted: i=1; AKwUvBxaLm8J97Rmh+m9rhbxZ/vJkx877iOrAJ4HZnIam3OOWIfFXf/Koy/WmVbheuh/Ss+yhnbTcZOFNgcE+kI=@vger.kernel.org
X-Gm-Message-State: AFuF++mRfxjRuaRHXnT9AulIumclqUiYwbHHgNv6vS8o542M8vJ/qTiO
	wC4rnodqg4ddCPMzoA5JGf6FoEHM0V1wjjmrlXIeVPJ3xvq79anSvTBMa9Qy8f9hblBSbxmqSsa
	iO4B2B1Hion7yUCZ9uhpV4+BsJRCpK+xVCfoD0dwcrBUjtBKNHZ3uwiyGTRyssx5fiSM=
X-Gm-Gg: AYBFou3qJkpcgLvWbhJ0kLLxtd4fwyyFoXaprReC78S9rm2EIdCG8OoxIluo5IZJpzJ
	k1Mp91s5EOSDN0CA1HtMsuQHPaTYUZEviL+KeawKzo6SF2vRsdJ/BeF1RllO7WaCDaIkr1ui9n/
	AA51mcbdtTNy6IBWD/knI5vRPCZ9PHqjDDwwuYda5HGRNVQutUO8KWAAJQXegHzCr/Wvmtd5zwc
	pvL8du48jz9HhBkuByMIwglUKT9gwVDaK/xRiVSWBxpC99IZIri8079FGHg7Bb1n1V9tHWZbfli
	GGTPu1vdyvmZlbGEioSA/KEc1OKSS+PJrdtZcRxlGxYfgEYTUORW5hnSq3EGqgri+fgfQuOYuEW
	aKdVd9S2DCVFO5AU=
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1749285a.47.1789466075301;
        Tue, 15 Sep 2026 02:54:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1746885a.47.1789466074829;
        Tue, 15 Sep 2026 02:54:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm34465272f8f.19.2026.09.15.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:54:33 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Message-ID: <ffzuqd7jofwosprorxymtv2mrmvdoi3uif4yvgkhcus6m5vb5t@ahitqlqnb45o>
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX9dckiuVxf2+g
 azUDh143AxH+rwDCITDC9Zhw4SqC3EV8EtHwvCx4ymN5pvL6nKOv3y7Ld3ftknXxm2e/olE94Xo
 Zc+DDCUpA0fMI65tAS73PP7Fc3pfe4InpMbfPLtr8rnlWw4PRsAr8lXoKrwGQk+AgMaY8mBaST+
 DGabZBmUrKMJuflFNQb9z8R8j3lbZ4TIhFC8+H8fw4tHng+5DIC9rNaRiiP0b/JSTo1b98rzuGB
 h5yDXauSp8Zr3Yef9kDN35XDMGixJA6ARMmu5Hq6X65GLov5AkFbGjFCxa4EIw/TiVv5D1waOWz
 oFUnL9umCjjBDfSAv2+HdJVU8PE8eSleeb06o0ZZrHUNdv9qLDh8DR8wulupkZFiGf+lf741NcO
 rUACw5NxgRhM3YnfQ4BpZ1RyqMgj2iv6IG9p3PpFquJe9sT1rD7noFyiLlFpYQLMCzKLpbByHaL
 YIdP47L0l38Zrg4qSdw==
X-Proofpoint-GUID: 8NpN6ZfKrUM2r0AphlucyyiNSPRRJVD7
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa915dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8NpN6ZfKrUM2r0AphlucyyiNSPRRJVD7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfXyqXkpX8dhcEI
 akfwj6oOnNw7qheECM2BlWlkIXUB6lU6m3vIY8TdjRLpzCaalCWo1iRNCfZSdRMShszowh0BiYJ
 NOyvw77q151daMvvb2W6BLs6VvRinJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-07-14 16:05:29, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
