Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F43C3F4E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484354; cv=none; b=I/6u08aUIfG+fpPdmyP+AWJpRPr3Ghi/iqK/yXQc3r1ZwXno9vXDrqMDl7QgxbpORit8ThuTu48bOF2BL+XYo71Vlxo+xogleaI2tOw1zuCiJ79WGEF8Tabz1bd1ybGNpJjkkbmYCwU2yPBqw71tTbNG0mhI5d3XeUu0drdaq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484354; c=relaxed/simple;
	bh=V/Mhki+IKGFDNKPPkP2QiTxARd+2PFHNzTO0JdJnWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArGqErlRmkG7hTA1S4Qfoy0R7q7fSaDoDq676ZmH6fejjdcpL7aYhHGMLRAPsOh0TbED9QbtpPMiExa45mNe6s0OThoqpJcTiqvpyZfHWHQivZEi9sG2tc2aWoHzmZ3vJlHbPXjBP4B37OqNi4UZCrCskwZKFwAi6nZWva3/Coc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwlJeFVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GauJ3TdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwlJeFVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GauJ3TdC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HpqCS510738
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 18:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VYRZCqGGraVpeg761p+cfhz/
	OtuypLCZYsOWQkYDTr8=; b=PwlJeFVHJ3ip6Lj/RZu20NHt2C1Qvn31jbRfrbaB
	t9JyF+EzrbUe/ijl+weam6oUwFd9Vuxrh4Sk9VqI38zr9rkkXu5A+b/5Uec94esk
	XaRUqjhbsZYgY2YdFNkBjeywOJ5aA2dEJiVSlqhjt2+W8nhU5WHWZlt9RQrDuQbz
	cD+j5Eh3r5TYRx9b2gsHvCxyv87dkwWrAktR8ceyFmHU/UnPXnhhQVwIRQXxf4EK
	QGHE51LBSRAUao4dzBPMenzNIteJcT7eirio00RL9z+x6ueu02eV1mdIl1f2yKPM
	FQVuMlB3kprUkRowxp34QVQmTcBgGyXQNeojUlqYZ7ADNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw85us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:32:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6562807a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791484352; x=1792089152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=GauJ3TdCp5svwms9wIkCG8kxXIqHQ7ClnJpf6ViIVPuL7Tr3NYDc2SzW1I1dwwA4bm
         JUVdFIgs2R66FnSKAxADz+uKjmLbJ8dXJvcPYKaNnD16ZphbkQbxC4q/Ig9RmL72xYel
         33sQ9orBZ7WVjncP2SV5by9E0zYhtWgdj/r9QkFFf2dYNPBi7cm5OytLs+Gi4oN9c/xR
         KvQHuZ1ihQujvW581/AIyGANpDhuhd2tY+b6oYSdaj4MoxJjUXG+xIlPO2rqxz5Grfls
         Qza1haEOBCeDtFT9KLI0g8+2dXd6sCfNP3bNBVTa+DZSzxBrLA3eLQBBEc44ADUJTndi
         8Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484352; x=1792089152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=blhIswUOK/svPCsopPuAwJNx7LZsUYyGr9nin/fqBrdSwhi7kd57jhZ3rcriFvBF+3
         YweWoJpuKkRdxXtpaZr4dO7P4y0UFhaqMOSidveMYF9Tl7XiyI7yZ/NrYmxYqTTy+5v3
         S2dvHo0eyTv8XEJ2AJkymAbLPzluQcZXR9+xh2/OR1uhLcrTOu4xKkK51yakiUchBt+p
         bnf9WXiCFQplIVCDQ1rIzjHM921IXJYn6dmeXYQ+nWKL4F2/OnMrmjjLk5sV+Y6DatQH
         blm5nTUHlCJpNCR7dl2ZxbbHQZdXkmtn9/eYrAtPrsz5tN8MLhtU0aMCe3tuTBtae+td
         +Lnw==
X-Forwarded-Encrypted: i=1; AKwUvByDjkey3CHiVL5h9bQdXi63KFdt7RnVM2I4rMUcmluJTon6wMNWGqc84TVwSGFiM+BIkRR5GmHeTphDTRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Q9ETP3hkJdBHpIqc7nvbx6KKiW75383uezNSOUE1TlCDZCZZ
	Y9IQ3/RJlIoyswndhPXUIZM8UKDNpn6ABKlkw8HWSCvhrvcMN8ztGbvN3Mz2604tJAzoKK9rexS
	GnqYG2IiXx0UT35WU4Bi2d69+QvGc9eofGmaJpeuey+BZVNr8QEiXiOfYvs0OI6JRW9U=
X-Gm-Gg: AYBFou3bJOYayE1V8lOsY4YSIkM6y6HBwTpOGZQv2aL8CTzZmdYgXxsG0nIrHcRalMV
	tI6A6NDcW12yC/6UNeZvEpvQUUH04NIaVjOuWx9rucGYz7AIue7a5/Fxl/DHBUUisWTJ1QOe6R8
	ysFSNgXVujFjjYC4rB35ExjwXTj/tMgrPBxIHoz2GrsRaVH4jTbTC3pl2YVA0CvX8Fdzk/Vidj7
	wkCrDC3Q/3FniBz+rImxEE+DLkqwtaOC4lw/Bbz6mRV5Yd6cOWvh+Umth1yc0fLojps96DKgkEx
	QXMNASI4lk/ZB2m1mJeavr9064uqXrBz7ftkFjJF775wajKUzDiBsoXd6h7EvxNxuAorsQBLJoV
	0BSASQA4Axqq3snNI8qbiuPPTOWhtm7teRjI=
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592695a91.35.1791484351799;
        Thu, 08 Oct 2026 11:32:31 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592664a91.35.1791484351171;
        Thu, 08 Oct 2026 11:32:31 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d5a429sm113929a91.0.2026.10.08.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:32:30 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:02:23 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <asfht3z8O1MzMufs@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX12tZONpzWiJt
 w5JyuypykLNaZ8xeVjGWETmvRlKSmkx7ni594YLcaWlfEADEJ1HVlwowfr6n70G4g987/9++lDg
 AJUSEYlSymjs97Ux5I0PiwOg2kVUOGxNdgU5HhCbgvORoXHJazSJkAAdRhOzGMUA7CsQgnIATZx
 DQalzKrhf2rn9bCSqUzvIA6B8D9gp1BL3IFNFpT1VOW6ebY9nkhuIa9FMrv7iX5EaaSIw3nq+tZ
 hEHPQNRPTBZtZP8jWErhQY1Pi69nPHHX2KLWgMq2G64UbF7ylSoX/e+Gmv78teYmoR6rZvj0KGf
 HZv79HwuE/epsfATG/dbufjr38jiAYbF7kKX8bjDeVodY36IYFN3pbYtcpIQz8/adpefk9f182z
 SLkMYz8RjLAthUjEysvYNXVLxBe42ys8I5frqF4fbpsOvZpMOlYBsGBKoq6rw6KuVAxOGJoMFm0
 YngrI5Jgr4Kfie9PyoQ==
X-Proofpoint-GUID: rWXDhTcLVhgY8hvBTpT4XnikapAk6_6m
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac7e1c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FWuPlianXOF5sMIjmo4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX9tCmRU+LHl1j
 QyN1mAIxM5EFdmu3gYIzFEpULrdrxx8FUfrwPEvHa89Zs/YZcrVDpPRIM90E6GjfUpfuYOhmcW7
 rzFZL+Ama0avJIKruKJEWKMrrc2sUKc=
X-Proofpoint-ORIG-GUID: rWXDhTcLVhgY8hvBTpT4XnikapAk6_6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080073

On Mon, Oct 05, 2026 at 09:34:16AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > +
> > +	reg_backlight: reg_backlight@45 {
> 
> Can there be an underscrore in the DT node name? No. Is reg_backlight a
> generic name? No.
> 
> Use regulator@45
> 
> > +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> > +		reg = <0x45>;
> > +
> > +		vcc-supply = <&reg_dsi_touch>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		#pwm-cells = <3>;
> > +	};
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
Sure Dmitry, we will take care of all above points in next revision.
