Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63683101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105357; cv=none; b=hMRHVETudC10Xv1G/u7d7MM5rKmXgkfSDoM+/ab37qjU5y4BcqBnYCb06s+8EYPGMUJVzWHL/BNsCaxtF3P/g+0VxClsYpebNcsIee7lz10y4dpWiMaQ+YHLTpbpiyumdX97ZXRNXsxVc+NbL3NacZiIrxPNw3DiKJHO4FSXAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105357; c=relaxed/simple;
	bh=fnl04WX2Spfg9N9VVYiJG5nPwxKffjLDMo7t8/9a5L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvkMkJXitQZRvsgtnvf5Ca8+DW75WslLulxz0nVZ6TAWdW52YByIdbkZlwT8T7ShnV5aRuGJ6q1E05haP1+Xjlmonbc7bRM4cw9J8erPi6ZIqjPHBa8K35rb47jT05iXeQOtGmh61oFDo8ju6j/b0FmRsd9xmib4jC7gAg5lcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVzfSWA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d53xiFBt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVzfSWA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d53xiFBt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vM9v3463968
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyW5Ix8KToU6pCiBFnCkXGyP
	rVI7Tj3cGyVGu4U9jKg=; b=DVzfSWA/MwaqFRStfjxh9NUgP3Xj5lPcKOzWHJft
	je/MZknn4OXevJUHGt65hS01LjEqJZeXEguXm3q4w2QXF/v+k5GH2wN3+QCoXER/
	sg6VXwP3d7mOZdT/5L04SQLhJx0O/QLwAppqVHeVcyaYdfr8rfp+fDhgFfbMuSCZ
	wgaYs2udIiin89msH8L9WaNtlT1rTMv1tfC7gDjQGjAoQcfJkPi/9FL5l6PKosld
	M5W0fXagukeZXQWuSq2wpKmqXIrQth4PlSM57x5MBQXl1ZTix6wM8DNPd5taCLyp
	7yUOXjFpfjA9Ti8JMt3tzZsHyCal2Xwl/TwI+C10d7QSaQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q418cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:42:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso817119a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789105349; x=1789710149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=d53xiFBt/eKtJNlXCk6gOO20N/z9s6KZKhTSuW4nn6bbAlKBx7trKaeRzIQVT2NmGL
         pEg9JqK8X9J4SYQ03TS+f5iAaDIOePA8EqHXPtc3SQiFg9stTdNbWHipNMZweA0x0Mr3
         h0tQPpRwkuMv2tvaEqa/Pl7UuT0IAYLN3PmU6BsuUJyOmgYNFBx6T7YzAndYcW/rcFJN
         Trmx8NcpY18hZHbO75x5cXczMTTTPoofVdEjfRUUPuEfv9UjEvvxktjgNHV9/IAB1cpC
         9QeVLxaAYPGvyHUYZTaQBTYGMXF3beZUlGhqnDPqKOJ392Iyq1LBZ5zWUrfFhjJWStJe
         AEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105349; x=1789710149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=YD8/AJRS0ECCkane2knORfLbBLHgxgvFBIt+Pp49uwZV0KrANvhY6KLurMA3qqM2hh
         d64QNdKor9xafzTA67Y9xEH+cYWHT5DDeitk0paQqP8+1aB9in0KJdTDiMcsPAK6jwHU
         efNDrWD5SRKTsSF/p7Vev/11gPJWmrxIWfcnXxHAiKUrC91Wpqo+YJRIpod9UKzOaIqk
         cFJnwA1A0GIRPluk3KjJf9qK5bHs4MNKssR/ohj+qhGUAAHGyKTsbt3KQHxWyVTz9eJ9
         mszn0/foYXhEtde2qzZIbDRo1P6FAlJxHjR7gEESOGYaQHsAKPOnOqg3GtlYM7AxXeks
         x4mA==
X-Forwarded-Encrypted: i=1; AKwUvBwJJWx2ckYu0lW48dXQ2DagGHTTxyEz2KtG1Q7L7lEmrTt7Z1qH0Jd1qDAyR+zxP3Kl6ZRyIvLYok8Npxg=@vger.kernel.org
X-Gm-Message-State: AFuF++lbXEubNgCvpsqEqZfNmC9eRu775oeBWLQwMVP0SLRhiw4N1LZ6
	36qoFVXv+Ku3hIk3hYqaaXD0GUWj3glyzPvO2z+4z0oZE6avkh5KBAQbIZ+twS+VgUFlnvwNAfv
	6+hvx5rDWqjfonPx25stfQeEiFcXhj/LA0af+/P1M0UsBPgH/f235HKyDsUsbZaaOi78=
X-Gm-Gg: AYBFou2b0TOcuAOixW2f4WmbiNzXbiZcZf4qL6ijnx5698yJfxd3Ia9aRMxaUCMhT2a
	IyV2EHf0EWYm7j5bky1GZGunktI53x/ME37zwgfpdht1R383Hv4P9nUG0rqSfITp2bcQAhfy+h0
	CjNb9iyNnD/6Rb/AxXKA2WPGVWYAhSvy+Wmt7ka1CZHKUDsoaxlyRVOtXPODSVSKUJKu3qWhz5W
	E96wjEQSv6FnQqgr4M7b3tLAiOgsTTLDmagKe1jpYJRbW6uRNOvPJyT5DqIY6FczNMn6L2zgBrE
	vur6Ga95Zf1bE9i/lBSMXyvEYB41StSgCyY/EoBn0ZBqeOxIwrU6nBR+23mEORxT8wT+IAvWkfO
	9EXr55TH6LIAZeKxBLL4ZCWroCob6XX/0ovOk
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584980a91.7.1789105348425;
        Thu, 10 Sep 2026 22:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584897a91.7.1789105347944;
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2836115eec.30.2026.09.10.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:12:20 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 required vcc-supply property
Message-ID: <aqOUvKiybGs/YUxH@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
 <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
 <20260907-atlantic-modular-8f3c1582635e@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-atlantic-modular-8f3c1582635e@spud>
X-Proofpoint-GUID: pBvHQTUZ2kT_f9yasp13C-pXuuIIM5sD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfX0v5YMZ0/7gGI
 zY/+8cLPxp6aIvdwmPZQ04EMBWhiIfUCUGfgo15JVOumCs0BsXYw9BiE+0Xy6RbGy3MUqM8zJed
 exsZ3XQ/yVEXZncyxujjRwBRV2Zpuu8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfX4bfSg/BqM6/P
 ByIiECehA2zukL73MmXlCMREQIlAkTwJ+V09oZsvBUZm8EbjvsQ1+rLVY3b1162TFb31BboFTe0
 y57riiWjJPAwbL9fUbnRwRFOaYgwG1FxZcxwkhTFcLOlMVLPeAzWTyjqy4M90gU/ejrmUOnwPvt
 zLA4pR+5oyDfrhYw2X1DUIiWQx2XCztrmGxFoPUC23DF0sQJYPWi2lokbZZPs8DNPQkhqqP0O2E
 jUZHMPKFX8bPUiOoyuVUzfZnbkMjeY3w4dMlE3SGQPxhxyUVkSgssPxULMhWc+96HYF73VD86+J
 wUVxBSUG26dXz3trCBDo4XAh7TUQ/tIxnZNs/j4fJuE9xkITxb1SYNdfM3oP/4eCiXaW6d8hP5r
 6/Z/vwmr1oQ1gO4k5UstBtMnMWiYBwQgpcFv7slPN3wnK87/m+1jVWVIasUgnuvBue2d/2+HhwO
 ikcIhDr14Ar/UKTX0wg==
X-Proofpoint-ORIG-GUID: pBvHQTUZ2kT_f9yasp13C-pXuuIIM5sD
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa394ca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DV-kZd77nCGiJ58iTUQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110077

On Mon, Sep 07, 2026 at 06:10:36PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 02:24:09PM +0100, Dave Stevenson wrote:
> > Hi Shashank
> > 
> > (Apologies for the earlier HTML version of this - I thought I had my
> > mail client under control)
> > 
> > On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
> > <shashank.maurya@oss.qualcomm.com> wrote:
> > >
> > > Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> > > regulator binding and mark it as required. The panel controller MCU
> > > needs an external power rail to be supplied before any I2C communication
> > > can take place.
> > >
> > > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > ---
> > >  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > index 37b9ed371b67..a6195e53be16 100644
> > > --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > @@ -35,6 +35,9 @@ properties:
> > >      const: 3
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  vcc-supply:
> > > +    description: Regulator supplying power to the panel controller.
> > > +
> > >  additionalProperties: false
> > >
> > >  required:
> > > @@ -43,6 +46,7 @@ required:
> > >    - gpio-controller
> > >    - "#gpio-cells"
> > >    - "#pwm-cells"
> > > +  - vcc-supply
> > 
> > Adding a new property as "required" breaks all existing users. Adding
> > it as optional would be reasonable.
> 
> It can be made required here, but never in the driver. If it's actually
> required that something turn this on before the device can be used,
> making it required is probably correct.

Thanks Dave for clarification. I also see one existing consumer of this 
regulator driver: arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi

So, adding required in bindings will fail for this user. 
Apologies, I didn't notice this earlier.

> 
> > 
> >   Dave
> > 
> > >
> > >  examples:
> > >    - |
> > > @@ -55,6 +59,7 @@ examples:
> > >          gpio-controller;
> > >          #gpio-cells = <2>;
> > >          #pwm-cells = <3>;
> > > +        vcc-supply = <&vcc_reg>;
> > >        };
> > >      };
> > >
> > >
> > > --
> > > 2.34.1
> > >
> > >


