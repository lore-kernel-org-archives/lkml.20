Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319149DBB9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466233; cv=none; b=PpWaVf5vE9YqnMYy4vq3EjH9gq9TiJc2AxNZGd5dYria81C1O8OZ3U/+4mh3e5AMhxVlc/vvNK1T2snXG779N/eonsP1kHerHrtuMXc3Rbu7VM4yTjNNulL5yJDbsZsw7HqX/dD/LPsRRSdhW8pB+9MIdcidjTNxAPwmiH2dvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466233; c=relaxed/simple;
	bh=TzgvxXELlg1BgqylTYQH/fj3qidFjiuXXGrd1CEYso8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxvNL0xkwuOSe9W8IwU/ODD4/0I0MpF9lxFwFO28vZ8r6lYR2OAsMhfmfjXXhAV2nrL8auYAqm3e6JA8aQaTH0UxA4zurLKJyWGo5c9wsfWGDWOAVgjDiGZJz5ybT1AAQ0Ftgz27A3aUJfpKfUlka1CG7MY1LkKeJjEr5QdmjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0OjJX5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Unqq4voG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0OjJX5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Unqq4voG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCJ0064486
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=imS4j8znypdNs2D+rXQozrNp
	hze0j4Jx7CWupz4XkMw=; b=R0OjJX5nJ30TYV9BC58PgiAdyHlP3pQq69Nz1QJp
	hiplJlXgrTBeOEXb5uHbRwue7KVT7JKp9pviACbgZW3aqvARWmgAAGHL7uIh36uy
	XqB9G9KRSbPhfWOGb+VDVsu6lPqtrMn/e//L6b2BWHGt9CKK07zEzHYWedi5Mqke
	z3FSEw0DCAWUQtATDm/1XOwFYt552pJv2dQY6uAtvdrgU1/ZNkD2gFPSwGqXj/l+
	fJFy5YpZ3YRvR82ti5bJA9gXiNKeDSHakSpGV+pw+g+/pfGxO2KPaqrB9QEt2etX
	dxk28N03D9n/l3oCnv/TJvxVzWaQXoRrcsOu+1b8O5FJrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41utqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0b66ecd9so349804985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466230; x=1790071030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imS4j8znypdNs2D+rXQozrNphze0j4Jx7CWupz4XkMw=;
        b=Unqq4voGhoLDpPavt1yB1Rs1OgaJBlKudH61AHa/icrFDXtNp7uLIJ+MPK6GC8pKiW
         7UxUt756vl8t9yEtBbFckxurc1PaWxWmtl0tTgZHrA8jyHiSm6IDqdSM91K/x+nfl/Mj
         bZJ869C6Dl3BgifE8u7rnSE+H9Y9dA2GVMw/74JxuIIgdvdolIksVNj5v3/N1cXQZX4K
         r3DDWMDuNkfduIvlQj8EJF9lj+y8ISoM9ybeQnZin8jbRsoJU/cP7yCQE9qicEfAeolv
         w3x5JviInQUnm3AKPkHv5i3ilXIU67nhl8j25XmrtG0FxNdza08IvqniTAjb3/7bB9ng
         XU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466230; x=1790071030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imS4j8znypdNs2D+rXQozrNphze0j4Jx7CWupz4XkMw=;
        b=glyq9LmxpeZMAXED8K8mVsZfJcBjZ6cJeABQB9MIP+Uq98atr10ITwo3nRvrge5ZPZ
         OEF1vjS+R0Ds/cIcQ3CUFlgB7LpM5Mjz7bmQaD1nvjUJuRMbFEkcnIpjPGTHntdqaurm
         fE2eQYRJt/GEW/TSISIPhaax6bSihA8zRkgCjXOWJcmZs5tZVVHz3/quw+glkBNu0I1M
         ygBrrriZyB/1zab+8Bsk7T687WLgkiVnMxypmLa/CVJY8MbQx+TDsi4weLlBKm1towKd
         P2t6jY2m/Q8ozp/0jiNb9+kXWSC+hImSLZZNwDTZlrcvlUWwVGhQhAWVVn+WRWNXD+jM
         3owg==
X-Forwarded-Encrypted: i=1; AKwUvBzcfsrrBT7Gqmi1WQkCjPx2EHVGFjZW7xGbA1imlf6fX9clWtN4epak+XQ2r6Px1LC+ELG0pr2H48o/BLE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXa5W7eEWo1OKban8Dz8uFYPMnvs8Zbtjzq58h30IrHHsuU/gH
	HpcsT5qDyHRmwjtLvkyM26WPnQ3dFJzLlv/daa2tJ2orEsTFD/iVBFq7tJoou+yPz1N8w0qI9Yd
	5G8OQp+qjnyS93ZCqYOQloUeO+T0ApP1q89zIWC3cNtdEQfhclpCujDq3GZ78CP+wITo=
X-Gm-Gg: AYBFou25UIs4SvoA+QbkWUBoJemJDjTh44FJoa/ndzYiPfrQOQxzAmlNVvKygkKdX0j
	6P3GaSO/Z6SeC6G7OwzEenao9k19Qyzerf9EtRIPhcBgAvN9qtQ6iZHIoi3+dcs8YvdEyAFZAag
	prRmQFoUdjRw7YTVi0pOlo53vkEIsuWwB8/oDO1L0mivltsdeqfA9RTu0nHgpRe7UWLRb+3u4+O
	jsax9qJp9n/JzKln6UCLDFYHq3t0GqkP14j4nvohydsSl+zAP+HCIKD4+Md38b18GtMCNY0PXB0
	OOHAQ1B0biCxQg3I4T5saGAi/jVNEcqo7MlwsKiUiC7o0Xt8kxEDNFbakvAHz3yNJ6PJKaFi9Zi
	MRjbwkA9xSQS9xw==
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr1033003485a.8.1789466229778;
        Tue, 15 Sep 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr1032999285a.8.1789466229167;
        Tue, 15 Sep 2026 02:57:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2717a6sm29114135e9.2.2026.09.15.02.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:57:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board
 crystal for PS8830 retimers
Message-ID: <4ftcpscaqocwiqsbmuebrog6bhkdtbuo5mjjidkx6aqmlzouu3@g623zchuvutn>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX0xAa4GCANX7B
 HbZvVHhVoHxmwsSzfl1hDKku5FuJ4/YnT6ZRrFvIiezCLzgLjpPRfHpD4GTI65eBfLx8lqqIaHV
 h9YKEqCRtxamRNBcnhZIspotj8zwEb1PwmguXqc7rpewPj8+ticKCsx0eqGtHqxRjjHtPUb4vyg
 BCO7ucTZ1ptrMA9YdhrK5EZ1sInX7EPcxTOhuAwNMQ+pjGjVtxHvbRkWGDtOzr21Jr0b8OMAUp5
 GmMUVV+z+Nm2sKReOBmUKpOyWgbFVP5idKhU2p12JvHwS4zuwkq8HapZwjiSoS93Cjriepvuyb0
 Id1ELaEFSL3OS+JhSYtrMbgArMicLMvo2g3aD5OzHxv4Y/6lvHj6Ss0aGniIMYXWgorWMFPpOmy
 uemnTyEaXT+TNyVAgAegjt1Ln7yw3My+xd3JBASF0jsOKgIMX7kkTAPlKM0sKLnSUiBqLYKQj5v
 5cUpwCPoCjoSOzdxAaA==
X-Proofpoint-GUID: Zbe7kNYPQRmOOrwnInlJFg5Tp-1i8RKt
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa91676 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QwumHbZcXSOBU_aVzfgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Zbe7kNYPQRmOOrwnInlJFg5Tp-1i8RKt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX9iz2ZQdw92z1
 zE6FDRnKz1zN+FFhjbAMGuCWDMZ0V8o0z2MTcLIioUPGsPs8FINigtn3OkzAqC2inBUeUppCUMt
 dz27LgpZ45kSIRLTwlIrCscQeaGlTSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-09-14 03:12:29, Xin Liu wrote:
> On the Hamoa IoT EVK, each of the two existing PS8830 retimers has its
> own 25 MHz crystal wired to the retimer's XI/XO pins. The reference
> clock does not come from the PMIC, so the RPMH_RF_CLK4/5 references in
> the retimer nodes are wrong: they keep those RF clocks enabled for
> nothing and describe a connection that does not exist on the board.
> 
> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
