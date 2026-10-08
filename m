Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65748D872
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453234; cv=none; b=U8ZZBArdgtIXpmMXIMq4lfohaCaDU4tgISgWxUUybWuRDMPU9K1dKTix6GO/MLoUEB2HE1vHo58du30gwJw0PBAbMhINp35SzhQf5X+jgEREQHcea6Xkter9KxZGMoa8u9+1itFkz+EP0IQfLsbrzWE825wSFpcUdLR0QoaGzJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453234; c=relaxed/simple;
	bh=Z7yiThIhyVmO+J9+tKPLV3/vKur1OFGl6JNxfPU6UKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIn5hJ8gvNKl2T2U3JWOuVMBYgcxyahOxhKlNWiVVo5XZ5Cf9eK5Sc1jWBL/1sMrdOnjm2QuWNQrnOaxIOIxmGwukC99ObvN1uol1weQ4PEkwQQsYkzu1e/RgiofehPAa/YZJaXb50ufnFdt1eTxbtNEyHniiy4SIICLQAcbGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZI1fMPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mn2zNYqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZI1fMPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mn2zNYqX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L3rO2068024
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aMg1bw/vHi2bfRM4a3njiioU
	TDtr5eiuMVLzrt8P6+8=; b=OZI1fMPmIEeYave7maaJjpAYGKD1wEky29zJlhFb
	CMHIf9qIsEpqSRqY0SfMgpsEs8ZOu4EF3HLDn/faZUS4RKmlOjspWsR3nU/ZulQR
	mDD5GLnvE5iN+WjX10IFgh2U5IurmIQjuSG0sXqkfbUZWVHPGrNnnBB/EvqdKlhi
	237cmCb1FpkP9TQuaTSEsPQyvtl8vZVlV7/GizloE+j/VSbRaQ9H7y1szVgVX+k1
	HBAWN+PbtzXR6IklBiJocbxFZiLDFGUe4JFi6lpa55fLiXpVjAgoxUUAxaZzOdIg
	FA+qBiUoarVM2QpBC7IVP3lxt5F+E4oNvbjpSYsgr6uSpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ja72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:53:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso836405485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453229; x=1792058029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=Mn2zNYqXo6SFDEkYlfgkGZiTUjWUwynEDizV25gypt1vMn6P1EI83NTDdOkUupCS7N
         Txs0hiKLFrUDvo8AWIVfbDlJrnyY+n4Q+I/7sc2XF5jHFZsH3jBROWpmXldvkROcX/mm
         kkCLum+ge06qAwE0dR2P8pKrQMG/zPoh2OX8/6IyKxK4iH5GgJi1hP4jRI6jhEkOXAAr
         yYStYPhQXtUbhGlNGyG6noEoxw7U+1d5c6rfl69CoGdb3b4Vu348kTrMzEkoMQFDPlU2
         /W3eOboIgaCY7ro0YUcdAIfb5Oip4HbQ+/nVGSwsdd/k9YlHmc5XEUAafO5PH38BIkcT
         OkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453229; x=1792058029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=IyNhwxBHVYbs9X60//yB6qpqMOyOtzE8VGS0pzrTt+Bbu/2iuM79DoNkAYjmZKjGM+
         ElgZYnc+P5vyk7KPztlA10yzGG/Zl7A/wuN3jPtRh07jyk9l28bPVjRKAoNhEl+cezYu
         q6WYWJhD+UXS4uX4B9ln/1cySYcgsdZbDeSI9qBksB2klGbnla+AVHIxVTuJDNx8MDeZ
         MOcSA9LjIzXTa3NqBX4JGPkk7xufWAdQbajdehnOit513mjcFWgYTEAa/fWAxQ9ytmmc
         Rkr1H7tHg4ddBjJRZmGpNLCj9iaA3GM/j4MKD+yzmVu9R37RA/Dmr2mVUep5L/PkUQTA
         FVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu2oBYK46S/7XK3ICOxus1cpoBtQNTWhzW1cjgEL0A8jiOx/0ZEhsLojQVKn247ya4uIl2TQPJS6HNRoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lA0YkbO2T+UqWy/LHz8siZSKXhTJinc7eVRJOhuienwo0/I+8Q
	i5WEvVk0/oJ8OlWR2frHsNiOXVMhJ0Erun5I1tv/CXDWAVbCYHyR/6kiqqlLI2ig1z2nQ5pdjS2
	JsnTsUjIzfDjzxYOM+3eLYK+pKuga2Z5xDimFY+o284XMGNqzaG44VZLRUBcYcHq5yXQ=
X-Gm-Gg: AYBFou0BY4onUez22Fs+9d8P8CEdRBSUyAtyjEQlbEnh8/tjbhfHW+idW2q6jvB8rzg
	qSL12mfel8v4aIHxnDIIhl4MWpcW0JmifkURPV9XZ3h+y/I2OE5o+Cj52MTYt6MX6h3M7WHMJX2
	x/yHOfu1aqFF9/eLa799slXDZWUKBH1FkxUSfTPd6hSnTSBPAhqU1e8RmZn5uzNyjYN/IeitQRC
	DGTTh66cXV7XM06kHTkRLYs3ZVpfEslJfZ+PqkR7ee9lQ9GtvO6NMGKtLowkrHdIVhDPVJTiKMx
	T6NtOxUG/NshzQsaJmWSXG8QJe4xZ531BcIIQf+aKUvTMOObTWxSFNSI6592oOKV/qSotiA3LU4
	IPO2v/hbX5h9H/f7bkVAvZBVtQbhy7fZfgLXV6iPEHpb7R/mIX/y3cSAaxCeFbiEFyNmvNZ7Ilx
	cE60NKFoaE04qZ
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024760985a.12.1791453229123;
        Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024758485a.12.1791453228690;
        Thu, 08 Oct 2026 02:53:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3015190sm1056704e87.6.2026.10.08.02.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:53:47 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
Message-ID: <wkwmg2g77xg7gvodnrrn2hvi4w67brmygcpqruyus4fzxxopn5@626h4czj3gz6>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac7682d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iQrKqlqNRm4S_ViRXwQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX24hPVN7gj9hr
 dcax+rkKGYEKM7DgbeuJi/89RA2vihzsihMa6WFGnFjz5/aE2k+qMIGKSDw+x97M/M96CuW2H7D
 EgF2Detn9GnDt2hrOQZO4UQJisggdqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX1nQY1itVYKRe
 0UXh6l/L+vSVY7Oz7OpJsOVBK1DTSAQEyE4nwsWLZBBKiaWRoHJosKYJIHbx3d+NLD6OLsZGfUF
 JujDNFX3YLMNtbkYOzdayj5JCUEcT1Ax5KZHd9cC60LDOK/z2iSzHR0/qZ41rzSY8xsGAnh91gm
 4VLOxhv+i4RBYnWS4XGnukpTRpNumjXQ7oR/x0qlyM8Qzg8nA7KImZnOa0H3ZBjPXkCatnW5hvz
 llFhqxM90/5/1LgxcjkC8J7wsXHlqqaV8uzWBjh2e+gkOfJj45GxDcKJ2WPR3w/08Vgtp7lCWGy
 pz2LZsAB8vrs665ncQHagrv3qApCMvB3siJRaxuImVP9Qi8I0CIhzXpbZycz4ZnFZt84UPNXuCu
 dhsxkPD5PH+6GfS0rl1Qtfa3xoDWBqbgu3cpVS3S1lKmBV9pYxApwlTZkwqTzPxVfG1yO1Vux6M
 MA0l/z0eUZM8w81Kjyg==
X-Proofpoint-ORIG-GUID: 3U8kaE_B0OgW1LW0x45LEEWkacHY6zW0
X-Proofpoint-GUID: 3U8kaE_B0OgW1LW0x45LEEWkacHY6zW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Tue, Sep 22, 2026 at 05:01:09PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 166 ++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 

With the order of regulators fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
