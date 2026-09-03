Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA494C6EF4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447697; cv=none; b=dkFfFTiGOna+HdE5+Yd3y5jcFhU2tkqlNWXksRimoj76xZ1S21pp5QA7LfqNM37qekHyYn9y361sS8y6W2jApdM5TlUOzUxq3kPZCxQzHQWUTEPmlwSNeLcSNrJrzWDu6xGrG2OPqsKaKle3xXOoXtmpDZxlifDI5Z5K1O+xfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447697; c=relaxed/simple;
	bh=rxR8MQA4hEt2JQIcclBKv/p9XrCLjv/c8S8prUWY1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0Gr0oUwOeG5UDEMpjAGLOagBcuVmu1GE4JQTnVcmnYwfRsQlQZrzC6RxJXoEg5ekE+O/PXI831v8BtTvwemzSaK7inREYIS6grvrpeuTB8sHuJ4Og/+l7AMQU63Lk4gso+wUUdbzXmJuwC4LLlflLtD3+BkmNilbU53PEYpcnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U627fj95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7NF2vxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U627fj95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7NF2vxF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB7XA3580124
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4U04Gmj8MHmOKgzajdN/vYqN
	FcXfl6+LBbOXXMjsXhg=; b=U627fj959Kh6nJQKhcOV4OQjhCyTFkqGwcMCDz7V
	u6RIVKNgeEXL8dBP5tYHele1OiO9Add94ybQaeNtPMhpNYAMA7SeE2/YIP2wLXtE
	C5YErqpa2crw/qtPuvL55NTCdRHKrjv1llRu6JjMSkldmcHrVx9JZbQ4ufIuUBJs
	tUAiIpwiAMO9NaYhNichZ36IWvyiOO8gcRJ1+PfZuVHCCtCMA+EckHKhXD152ys4
	YhxqF5c16fwgY5il2knM8OCvPXaY8xC5ZFSUg98zoZN38uUZP5LwBcmSsCaxasQh
	WOFeIxmJILlqpCnP+fHc0HlHRYeXz6HgLXxWmgheajeScA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11hu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:01:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e98448895so3604241.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447687; x=1789052487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=W7NF2vxF+j326thSQRqNyEEU9tvXtbvFmkwe+WeUCqMQgcT6DGnUSkgbeLBHfZvzHK
         nmP9YhPGWbLJvXSyl16F4WBvTMafCE/jFiLXSOZR6jMdFeBodfpMlSgiWsltqyRzG1iQ
         W9XhtgdecwWo3Kgy9WmmH4JhQfyA82vI/BQEsZ/TOh6pbc4uo5XPKGe5heqfUrogvgF5
         v5sMu7d/hZY9tjbZkHQln1PbnfxoE0gZ8RqNzKVwX8OfostfA7Cdk1bEgTJ/ewkEv77K
         jvpHj10Ff9ID440cvOWi3nCNqCjF/AYWrDI2qfZ6i3yv00MhAVeRlch90xZqSUJ7OV+7
         IKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447687; x=1789052487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=fpOxtbG9x42xmEdxnkqkRL4KDxMC7KzwtmaC6NArNWgiuGW8V6lJiWVqw7Oc6AP707
         bD5BzFhXwN5tOU5veiAgmPPQK0yxSlgtuqxW9MmOlZGD9Unnuf6sCahtl3cJcp52E1zY
         J7X34lxmaDUplhqyyGtB6JC0xYg3bcoFtGO7puBY0KNeu3CUJcLYvBWrpxqY1I2l1NaK
         WUIi7mlFgQheCCcNWNIYL/567pZgxqGT+N6K4+bB/j5WTihlZTjrHKbyyoKz8VHnPHNu
         s0tKaJXMSDTB267cNGstE8hKrGO0RCqptXvt0fMSoJW35WxlSKyFcMHGpAh4EhRCRpOB
         jmhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvApokgeQBRIgvXMhswMEb7Pjxl9Hn+hUiU8c5gvVsjpB5tT+39ebjh7Hv0hG3eDU0tDDphYdJfcLckL4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGu1BHhv+UaQ4qJNvgOedQiTfEEACwduQiYSOm+EPxeHBFV7ZD
	Jc9byep+as+tr6CTG2+DHgFQ0m2/0oDeHbHbc0LBC/P+6x9Z+AXyp8Y9A2y+G4CHErWzfu0OMBr
	Ldfvs6DR7rBA6tZDCjR1h/xji1NuXcEP6JC6zvBdxYMeaIfFZX7+7dsToZ3v5dHlEjJ8=
X-Gm-Gg: AYBFou3XCivgVAJgA62JyO6EaXde/QKqH768q2becgwzE9zLKzSjogGGeoLY+rgYq3h
	whSd+cq87cHMkD6/9HD1uvm2NIU3F7FDUJB3pn9XMnRWQRXGmPjB6nNphiqzqGbLKOUASziaVkD
	nPpQ8RTe4mCdHPOlJs7UjZPbYwHxZCqfsHFi3b9ldRvzU1ev0jGO/uCLSdxHHuYMyDbL49L5Ft8
	DZQdtjOft3FdpGmvm+vowiChtfc6jjD4JZg5985Tfq0dyE5yx5sXXqq8KfLYdaJp0GJM6iYKZd2
	qort2N3dkhe1xxRqvD9wtgvdk8wXQSjk3dyhTliUAbF9Cu2dd0FeIUNYHs+SQOnvJnAUZnzyfJk
	/jjiO/XSdU+TBBw==
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868121137.7.1788447687334;
        Thu, 03 Sep 2026 08:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868060137.7.1788447686604;
        Thu, 03 Sep 2026 08:01:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm79144745e9.11.2026.09.03.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:01:25 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:01:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Message-ID: <isf7ngdhk2iffcs2oallgrpdjfoiaen2htjneu3f7zms2a3agm@zz2nz33w27lk>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX9KgDx0IpIY8f
 YmRq+73nBJppVDQ4cSAJdJVcpz/JaJXx023XsO7uX5ywDsJR6OOosuMqUtHhCPgbikRwUaKIvnA
 B8ISe58oO4UPNfWppmBCfxdkAFObFp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX/1DYgPXO9RH4
 43bpsLBh9mq/Wk4GBds37jV5XafZtT07qNd5n56RdNM1affS0Ucw8LBfF++ukkzCtOOLmr/RLAT
 CHoojA4ZtRfOSeUbn+kjVIvVoIspGiugGp0EPK7vq08bXEqTR0UcYJcrvS06cc1+dFZa7y0Zu9S
 y8blf44qmB2S3HLAjxymjaAVFgFZ2pOSICfuDWsWXPeK5zADT/Z1GkZOSDOMZxNGZWcZJwO0lnp
 rSeEfbsVqkf7TPTvo7/hgVc2c5a1677nopVp437CJlo2lCRfxF8v9ljLfd8cEdECnagX4Iuc+xV
 hiRFUeNrKY1wHd3HpIOzUeZKR1pIZi6P8F8m8XXAJgH81iDInLTSXVp45a/2tSN32P6OktliT07
 26FQIX9e9vVXfthJfWHoCrLF6RM/nA==
X-Proofpoint-GUID: wgHbkKIgBxuqiwiY_XXaaTln-YrmalLU
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a998bc8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LZHrLB2tbJw_R4RbR5EA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: wgHbkKIgBxuqiwiY_XXaaTln-YrmalLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609030130

On 26-09-03 16:25:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a couple issues with the current description:
> 
> 1) The msm8996 compatible is wholly reused, without a SM6125-specific
>    primary compatible
> 2) MSM8996 has a different power setup (VDD powered through a RPMPD
>    power-domain vs a regulator)
> 3) MSM8996 uses a different init sequence
> 
> As part of fixing all of them, use a SM6125-specific compatible with a
> SM6115 fallback.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
