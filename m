Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CB375F65
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184418; cv=none; b=LpKIp6+ZhHN4kIfGnSgkZKKrOtU4rFF8QZy0bypSYY5R5IhUmNCiLX+95THfKSQl1r80OzYRBEuusWyALy2+g3Dv1F6/xUdeSSxxNWB+EdS6KukRO6K/yUh0HlX203qNfw1XYITn+aS8SWG+W1zEEbYuiIlMVSkOrATPznbgn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184418; c=relaxed/simple;
	bh=0p7b65zRfK3AvDpfAGxrxQ9vRKqosGAat4sY3vmaVEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MibqqHwFO3D0xgRlzg1V+qn6Lpk/JfAvXQ2CgsbUuZVL1eHh4tDKiZawbALhIRh9oji8uvoi8nkh+fqj17PMhD3k+EoxVNisKbHMsRPfb1LXbG8ScTZcUrklB53XCEX9wnk7iM3G8tOcq4X8yntc+4i8RBCAtp+uaFn+TEjroZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMhB5J91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwzueXmT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMhB5J91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwzueXmT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510AbM787332
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxyaPeOQSDUKaVQU5hOQMfOj
	aOY9QlWveH2VyoiJ+4k=; b=XMhB5J91ggRI19ODEsBbagxI7i4+b/QKkSNacgXm
	Jb3KBCIaljklpMXzp38950FIlCADwz2R64tIfgJ776p6A5EPnhzv6JDTrvB5HYkd
	/vEg5uE/S2bUtVyeGdbePJ3tE3btUUdye1NJA+alEz33goXTyPSt1D3vLg0l0wKh
	MRqLcx8QIcptnr5K/HbsauefRbd8uJIywKfqy8wiOh9OIgy+yQKkev37+eEH2BSj
	TDj7GZuRp7Hip6k9jaH65g8gzXpA+DU1OWsE1unw1WEQ3xjkYQRwv/afvLV5SCTu
	VVTIvN3ZVi2D/0kQfUJVh2a6xgi97vhPfJIlCaHBNTPypg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4vq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:13:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so299901485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184415; x=1791789215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxyaPeOQSDUKaVQU5hOQMfOjaOY9QlWveH2VyoiJ+4k=;
        b=KwzueXmTojpx91j82Va5QVro8DC2y3Es+aw0CgL+stVpPs5uBYESnYKemiJ4BgqM+i
         EmzUUSrjgsEKWIaOyKIw6SRnbD5GcoSqKgk2RErDHAzf5mX91z4TFdJgR6erlyWMliF8
         SXwENXrXduREqS7IGYGcVdwRk6wJOuMERPDgbnnro8uwHs7BZbi0GThnK6Jz/sl9eNDU
         WzdjRgOS1G12EwzX98//opLl8sKLnWAhMC4qvoyzl2koiWDJwBFL9W55vqgV/YmCdUWY
         lUrkEqqOSGc39FNVJyYwUcb5YhNGIt6+m0T1nyhi/vxH9KrduBqw/53gUpmxnHVQbQe3
         e13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184415; x=1791789215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxyaPeOQSDUKaVQU5hOQMfOjaOY9QlWveH2VyoiJ+4k=;
        b=MNBlpPHSIS6UmI9JzWHFGB2WG/amNcll8iiuDSxP9BMmmq+FYlb06lM6KZRrfdC5p6
         hSH+XwJ5ByQ57JZSPrBCNHUCxVyZ9woQtzcoa+AKf9quUFFRpb7rhgKQ3YoZmLqEpR+L
         YE6lyjxggFCilfxUWxQdr98IKMRHUbYhxXjmb6S62E50MhC+Td6i+yxCzI/JPvRxgkyc
         1GFs0i3PC/XzfaX2DMWj+ZwfnFeAtlBawPHh1HiYDUpCggURXrlRD7xTFYOhTlgwtBOC
         0leSb7tlegbqhVB4tTNs5xHYf5Nchlbog9sYhle7u/vyanjGkBAlVbCTVbvXHP8+J34h
         P4uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjzYP2K3QJ9UMWQJDutenBZOtV42k3VWqrGTrzW90ZjmUIpMUoHQOg2VOgtxFntjFMzwMTXiwE/jpN2DE=@vger.kernel.org
X-Gm-Message-State: AFuF++kd/+N1gzujQsQdaznpY9Qkhp/OZEqXqA0aMFUgjriYQrZF63QI
	gGK3oSWZJMQszj6lQ70u/pktbQ7fmZHiv2auCyv1A5EzV/dW/nVgi6ycuLANtS8aQ1mJ6MB/7No
	llXYAHYpeTWUiTdnFbxnZFajXJ07kY88GkMxkJbfY/z/42vTLPWSr1SN42xQlNqtFc6Q=
X-Gm-Gg: AYBFou1pghga8X8z97BIrXYFVwGq3uNWjXKRH2RfgFUTS95man8vMHn7ZjvoGYXTiUG
	8MaVTr7eTamdcuROdb9UZmHZ1+f/Eq8K7hRwARjY+hU5DlWc9lP6KiY1gWuknvbjboHDdRddNej
	0HW/mSPVfS80Z1wvCoSgyuSe4U7Pvc7VPNjWfJ0V6Q2AAq6Q3Cxv5QaZQG9mN30IOEroggWRBOB
	SL5FjV5Ai4zSoFDkTS4aNoje7Vyk1oySzhZMWHBprg+cIZWIXSuFgWebHMOmskmE5o5OCDFDcGq
	53ulfNsCPXcjA1rjbqffzF2NoNP7VN/j3v9ch/Tp+dg5YzOwP/NjywjxfkokXHbAP2ThqvY52wd
	9bylI4eqQwK2wY5L9shz6IRolXVx5nZre0szqiInE6iwdmPibcVEqrIxaB5nRM/OKMxXze1OcQU
	QW1lksfsdmD9Bt
X-Received: by 2002:a05:620a:488f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93e51025780mr1139527885a.36.1791184415052;
        Mon, 05 Oct 2026 00:13:35 -0700 (PDT)
X-Received: by 2002:a05:620a:488f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93e51025780mr1139525585a.36.1791184414633;
        Mon, 05 Oct 2026 00:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bf1a9sm2990635e87.84.2026.10.05.00.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:13:33 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:13:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] phy: qcom: snps-femto-v2: Fix
 qcom_snps_hsphy_write_mask argument mixup
Message-ID: <7i4rxspd2o24hron5ql4kiccjogqk674foyxaw275mox6dvn3k@cjmwsvebg2su>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX0Sjk0KU5GVOK
 10lbUNkWM1KbcPFnz5zotta7296SIR3II+ULXvQqrSqEngfspqwuxIEfG7WenluCzGy/BTrH/p3
 Y3U5T8ifQhI+hmX0ZAzMlEe1eC+w5nKsV83ZoQm+OoLkx4jWGVGEL0hTtTsQxV4e3yPc9T9jzpj
 WP1H0rQkG16wTNS6AH+29jTy6sC7M7qVFLXU3ex7GjQi2GX8KDzlus+elctsLCmmuf95EEA/n72
 rtpKT8murDoXBNJbMqZKDgCxPjwuo6HFUkYYHqZmSDCWWVYfN82g5hT53rXtNzrTkgFzmSNTRFO
 ZalZPfK66gPfOUHJBRMYIweUrj510pd52t6dZbsj2Fffe+E+eQo0ZHTwMTqJxy/knugTzcQt8IP
 447DAEHxT1x4+XW4szu0g1PiH/T2q4r/eJPwZYgQQSOxmLFgdn1WJ56m6+2w6nTEtZSz/JyNVJr
 c+n78aXziL39DknbBfg==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac34e1f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=CZ6gSvR64lt0KtMMlSYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xPc1NWeuYPbfs6XPKKVoPGMn3F9VL9Sd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8gMfpUj2Yi4v
 qoSak3bIiVVbSvnAzag2xI6daN4jJvn2mi9teJ5RyTHmi4itF+0sDzl7s3YajMTTHhoT9dpE35G
 X0GHzgyublN4csKPEqQ+MRSRvQ8v0KM=
X-Proofpoint-GUID: xPc1NWeuYPbfs6XPKKVoPGMn3F9VL9Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:29PM +0530, Varadarajan Narayanan wrote:
> Fix the register bit field mask & value argument mixup while programming

Fix the order of ... arguments.

With the commti message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().
> 
> Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
