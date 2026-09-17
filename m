Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA534D3BE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623272; cv=none; b=CSMsXT9brAaZ7KvzaSWIjm8LSpI4ohGM/oAIwa8+Lxri/R+HleuItta7kAj0QjN061YMrGoHtJOS7QgvKa3HcffTemQFr5EPTkz33MghHTtccqmNhfcFfIwGNG6VHpb7IVMK2nPux44AbcdCU7MR2b0irWu6FP3MOVLGQFqzXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623272; c=relaxed/simple;
	bh=+ZDAM99K40n4M0qBT8aj08eX2ECahD5jlho7HYz3WpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMsOufMXc32tdxcXnrbRxZdZbFAJK7MeRdDYJX+n8Y/Voa1/NGoxGbPyCXCXOXGVuKuDdxmiwVsaAIOwoiE2xn7XApozKs8usu3JzKvR/UYv7unClfrpIUpmSksfIQ4HLPav24wuvGA66QEyvVbhWDQCAP9wNq/F6nOH8HZb04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9aEMuAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H81aH7rK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9aEMuAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H81aH7rK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2sqd53302827
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzxDPFWdhR1CwYWxIrKgKNHO
	THh1qjZSdmpJhs7YnPk=; b=c9aEMuAWNvXHph3QXnGwuJsYU1VJuTf2v4wAOJiU
	f9rSVOswgyJ/Cuv0x3jAWghXTwDSzTmaLquH0zCrSAvl20M5kospEPhQxJqvCy5X
	4UW+3tUh7OYUDmqa/lhpZ0jnozjspKIVminRa3vmrk8Pa1h1gH8ZQvifOExl5Rlh
	b0eEjGQvdZJm6i1ULqFYFhhZzJm7lvn3EGnETzDZ2Nqsx0QzsTpRiJMKFBjgRlo6
	Khwf6iF74iFjwjIa3L/HqjOHB14vHFm91Wki0QOBZnJK0yOocyFVSyq+8YuLgB6O
	I4FzHClN1xREItSu6QfhAYW+RrCUAp1S56PUp13b+lEhQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc8h82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:34:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso389788a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623269; x=1790228069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=H81aH7rKB8YiCprsxcIQm9moKLaXZqa0kPqoElrSSX1XbM22NlUwMWIo5d5IRTqZ23
         2cZ94K5q+KFFqxY+VFdAdHfQvBr4qonxhM/WwjSa3xuBaQCO8gkW6jz4P/242s35coth
         uksz7BtlpG3QvdKOQpe94sB0uzhg96HNWxTDTUItH/kC6yVa7xZa8p5gmgb2ikBcHzkE
         FExyPST5lqEU3rD/JvG0KcgY0OuKaGb/dqhsFJdRzvSmpPc6jvWAZdfwGNlgvRsFfBJ3
         hOtoySZ6GXbRtdpys0Q/sqjjAf1EDS+ms4/XtUePfobOKJNBCToRT4wWDCgQYAQVgYkG
         Wxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623269; x=1790228069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=QXi4duo2wY1oA+ScsqfDFqcjoYmH+ayDyZbLboc8TBgvFDqqdImt0+rc7CbjQc1LN9
         7gQUnSqlPuhm+/wSI6mqjtZOSo2AQvCobNfHulEh8+O8W8GH0KK5DnsXem+Mbz1CZfV/
         nb/GVMDXyygfHOxuU4PAL4359L+sF2YNe27BSh38nNZ+f075uITfi5lDWImkk1I1UdJo
         NUo5KZ3QjTkPqejv5/ESpfiFT5J9Os7o94GLE8vd56MKoaYWRORSFDBjnH0cUyriu1S0
         kdkeGkzUVxQ/+sdMx11Zex+1w/DGfic/Em2jpob8h0cvsYLOyu3DouCRevREBqhG3114
         0lUg==
X-Forwarded-Encrypted: i=1; AKwUvBwZVAm7hig8DATtG8q6wVxnGx22Le65LPbqCk1a/4ia7+odIpVNbCWjLuBbOQv9U6EuQYp3Ka4N8JM7mqw=@vger.kernel.org
X-Gm-Message-State: AFuF++llxrgJpA9ANpMYxGgB7jd5p+ktVgiLB1Ufk3W9pu/o8ZWuAKTv
	geDohvJJVLUIJnv1uVuPNEYA3RZpHb3GwQSxFAcB/L3SJxew4sd2IB7WZ9JueJS/xHapDGD/VFo
	I9njy9cHZLQCQKVnkVM3AAefyg56yc+l4dVaIyjtMteXmhIxYAyPAGwJSjhNkAifhKLU=
X-Gm-Gg: AYBFou2ru2NQ/gtcnVtQiYIlxrkAVDpYlJ04PI+ojFJGeVNTrqDom6igPlaKdFAEc5b
	u5gHJGr2ZEUtKz6geg++zK99vW4OxGDRbni8R3hxUUpXVefp542SP4F/CglObRQLjL60vCyLVTx
	rjkcKAXq1MNa4X6Zxq5eUi545TmjJxLO6P1DXcEgu5rJH7fh+sYNPeqiE9ky+EaE3cuXj5gfL84
	p7gGoIEJ5NQa+PLF7y7+W+GrWg26mLw7+txwa7VN9cVTnip8whEr1Kr7ZPKuNeep4je9EfE15vo
	EIDcTtdg6vCmHgLwEXMFDFYu3PVmF+rt+VZIJvl17AMeDpbJbEIum8fpN2v21kp3l/xSu4norn1
	k5Gfo4Qz1dtMdKntb6L7+SO8yPdJmYlIKXqV6
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13862200637.8.1789623269392;
        Wed, 16 Sep 2026 22:34:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13861976637.8.1789623267826;
        Wed, 16 Sep 2026 22:34:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm13636098eec.28.2026.09.16.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:34:26 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:04:19 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLGFfQ20mCGFkfl@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfX7o4qVdGWe12f
 b7F/o37t5EbHI6vYugWepxrue3m4nxXdhfa7jniuv+/frqnKd4IzrvhDBgYGm3NpBswM4zuO7US
 OJEjRaUAB8jOAxIvD74vALUIGEUK6CKF6TVEOAHwdxYlZpU7D/73S9p6RO6Angd5vuEa77+zYKW
 BAoyOOZYIc7o/PWxhKn0TKRXslz6vymKZgYzjaRPXF6vuCFWp2hZ1jV9NGDIa7iba0B70yFKK33
 SZRHX3+h+uAYVQAmipfsv9lNBZWFj48GkKQmR7vCt76SFAbqlig/6lpPRm97eZjQ7ov67OkTqe9
 ZgNQw7+mB0JqMJp7q2X8BuQU8S2WDUtXlYya5Jw8yaR1t6Q7tiwW8D5sUFrRUAdXg8rd1kVfokt
 nFJ3Dz72QF5qIknUbdbr5qENhS+gYgtlC96FOB3lizfrMnijSuPV/HqgV6G3mILe6KZA+fKzshD
 8Tq7HTQsV1Co8jYTgPA==
X-Proofpoint-GUID: TOiHANUmKynouJeqhc_lr_T4mwvHmMx5
X-Proofpoint-ORIG-GUID: TOiHANUmKynouJeqhc_lr_T4mwvHmMx5
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab7be6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=CPdafjny-J3xFrLEVKkA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfX6zeKXhE97QFL
 YXU5Ipxg+VQckNHgQ6pebJ6qgko990whcHwBIq1idr4BA4/F+H/pADnjsWX21fip+r/46rNJqRv
 qcLCNg5Hl1xn3Gw7Cl36RgT01veYVfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170071

On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > 
> > The overlays configure the panel on the primary DSI interface using
> > a 2-lane DSI connection and instantiate the panel MCU on the
> > corresponding touchscreen I2C bus for each platform. The changes
> > allow the Raspberry Pi 7-inch display to be used as an external
> > display option on both EVKs without affecting the default platform
> > configuration.
> > 
> > ---
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Shashank Maurya (2):
> >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> >  3 files changed, 169 insertions(+)
> > ---
> > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> 
> The two dts patches in this series clearly relates to those two
> regulator patches, which has received change requests.
> 
> I would have sent the 4 patches together in a series, but as you didn't
> you sent this series with unmet dependencies.
> 
> All I can do now is reject this series as well. Please send v2 once the
> driver changes has been merged and you have validated this again.
> 
> Regards,
> Bjorn
> 
> > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > 
> > Best regards,
> > --  
> > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 

Hi Bjorn,

Thanks for the review.

The regulator patches and DTS patches are targeting different maintainer trees 
and therefore were developed and submitted from separate workspaces. While the
DTS changes depend on the regulator updates, the two sets of patches cannot 
realistically be carried in a single series because they are reviewed and 
merged through different paths.

I submitted the DTS series separately to start the review process in parallel,
but I understand your concern about the unresolved dependency.

Regards,
Shashank
